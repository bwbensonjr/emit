## Context

The ladder has no optimizing pass. `expand` → `recognize-let` → `convert-assignments` →
`convert-closures` → `lower-program` (`src/core.ss:62-67`) are all translations; each changes
representation and none removes work. The consequence is visible in the smallest possible
program, `demos/square.scm`:

```
;; ==== after lower ====
(program ((code "code_2" cp.3 (n.1) #f (primcall %* (local n.1) (local n.1))))
  (closure-block ((square.0 "code_2" ())) (app (local square.0) ((const 34)))))
```

`scheme_entry` allocates a one-word closure, stores the code pointer, tags the word, masks the tag
back off, reloads the code pointer, and issues an indirect call — to compute `34 × 34`, a
whole-program constant, on every execution.

**Neither door recovers it.** Measured, not assumed:

- The dev door (`emit run`, REPL) builds a bare `LLJITBuilder()` with no IR transform layer
  (`src/emit.cpp:404`, `:608`). There are no IR passes at all.
- The ship door links at `-O2` (`src/compile.ss:232`, `src/emit.cpp:747`). Extracting the program
  unit from `emit run --emit` and running `opt -O2` leaves `scheme_entry` unchanged — allocation,
  store, masked reload and indirect call all survive. The blocker is that `rt_alloc_words` is an
  opaque external returning `i64`, so LLVM cannot prove its result is 8-aligned, cannot prove the
  masked pointer (`emit-load-code`, `src/emit.ss:707-714`) is the one just stored through, and so
  cannot forward the store, devirtualize, or inline.

Half the transformation already exists: `recognize-let` (`src/passes/recognize-let.ss:23`) does
exactly this beta-reduction for `(call (lambda …) …)`. It only misses the case where the lambda
arrived via a binding, which is every top-level `define` in a program file (`collect-toplevel`
wraps them in one `letrec`).

Recorded as **P6-A** in `docs/PERFORMANCE.md`.

## Goals / Non-Goals

**Goals:**

- Add the first pass that *removes* work, in the shared compiler core so both doors get it
  identically (the one-compiler-core rule, `CLAUDE.md`).
- Eliminate, for a singly-called known lambda, all three costs at once: the closure allocation,
  the indirect call, and — when the arguments are constants — the arithmetic itself.
- Keep the pass small and readable enough to sit alongside the existing 25–107 line passes; this
  is a compiler whose stated goal is being easy to understand.
- Preserve the one-IL-per-stage discipline: `simplify` is an observable `--dump` stage.

**Non-Goals:**

- **P6-B (the LLVM alignment `llvm.assume`)** — separate change, separate measurement. See
  "Why not just do B" below.
- **General inlining of multiply-called functions.** That is a size/speed trade with a heuristic
  attached, and this project treats binary size as a first-class concern. The single-use
  restriction makes this change strictly non-growing.
- **Cross-form inlining in the REPL, or cross-unit inlining into libraries.** In the REPL each
  form is compiled separately and top-level names are globals (`global-ref`), so no binding is
  visible to inline; library units likewise define globals. The pass therefore fires on program
  files and not in the REPL. This is a *performance* asymmetry only — values are identical on
  every door — and closing it needs the closed-world reasoning P1/P5-B-general already own.
- **Effect analysis.** Dead-binding removal is restricted to right-hand sides that are
  syntactically effect-free (a `lambda` or a `const`), not proved so.
- **Algebraic identities** (`(* x 1)`, `(+ x 0)`, etc.). Nothing here needs them and each is
  another place to get fixnum semantics wrong.

## Decisions

### D1 — Placement: after `convert-assignments`, before `convert-closures`

At that point `set!` is gone: assignment conversion has rewritten every assigned variable into
`primcall box` / `unbox` / `set-box!` (`src/passes/convert-assignments.ss`), so **every variable
remaining in the term is immutable**. Both substitution rules — inlining a lambda binding and
propagating a constant — are then valid with no analysis of their own.

*Alternatives considered.* (a) *Before `convert-assignments`*, next to `recognize-let` where the
sibling rule lives: rejected because each rule would have to consult `find-assigned` itself, and a
missed consultation is a silent miscompile rather than a missed optimization. (b) *After
`convert-closures`*: rejected because the lambda is by then already a closure record with an
explicit capture list, so the transformation would have to be expressed on a strictly more
complicated IL for no gain.

The pass forms its own `let` rather than relying on a second `recognize-let` run, so the ladder
gains exactly one stage.

### D2 — Inline only single-use, operator-position, arity-matched bindings

Occurrence counting is over the whole term, including nested lambda bodies. Three consequences fall
out for free and are worth stating because they are why this rule needs no heuristic:

- **Self-recursion excludes itself.** A recursive function references its own name in its body, so
  its count is ≥ 2 and it is never inlined. No separate recursion check, and no risk of the
  infinite unfolding that a naive inliner hits.
- **Code size cannot grow.** The body moves; it is never copied.
- **No work is duplicated or lost.** Beta-reduction to a `let` preserves both the number and the
  order of argument evaluations, so a call whose argument has side effects is unaffected.

Requiring the occurrence to be in operator position keeps the procedure value available whenever
anything actually needs it (an argument, a captured value, a returned procedure).

*Alternative considered.* A size/benefit heuristic allowing small multiply-called bodies to be
duplicated — the classic inliner. Rejected for this change: it introduces a tuning knob, makes
binaries grow, and the single-use case already covers the motivating workload. Nothing here
forecloses adding it later.

### D3 — Fold only inside a conservative window, not up to the fixnum boundary

`rt_mul` is `FIX(UNFIX(a) * UNFIX(b))` (`src/runtime/runtime.c:190-194`): silent wraparound, no
overflow check, no bignums. The compiler is **self-hosted**, so a compile-time fold executes on
whichever host is running the compiler — Chez while bootstrapping, emit itself thereafter — and
Chez's exact integers do not wrap at 61 bits. Folding `(* 2000000000 2000000000)` on the host would
therefore produce a different value than the runtime computes for the same expression.

The first implementation expressed this as an exact boundary test: named the fixnum limits
(`±2^60`) and pre-checked each operation against them without ever computing an out-of-range
result. **That does not survive self-hosting**, and the way it failed is worth recording.
`encode-const` builds a fixnum literal's tagged word as `(* d 8)` in the compiler's own
arithmetic (`src/emit.ss:124`), which itself overflows for any `|d| ≥ 2^57`. So a compiler
compiling this pass could not represent the pass's own boundary constants: in the self-hosted
build `sfy-fixnum-max` evaluated to `-1` and `sfy-fixnum-min` to `0`, the guard rejected
everything, and constant folding silently vanished from the shipped compiler while the
Chez-hosted build folded normally — caught by `self-emit-equiv` and `dump-parity`, both of which
compare the two hosts. (That encode-const defect is real and pre-existing; it is filed as issue #7
and this change no longer depends on it.)

**The rule instead:** fold only when both operands are within **±(2^30 − 1)**. That is exactly
the largest bound for which no `+`, `-`, or `*` can leave the fixnum range — the worst case,
`(2^30−1)^2 = 2^60 − 2^31 + 1`, sits just under the 2^60 − 1 ceiling. Inside the window the pass
computes directly with no pre-checks at all; outside it, it declines. Three properties make this
the better trade:

- It is **obviously correct on any host**, including one whose fixnums wrap.
- Its failure mode is "folds less", never "folds wrong" — where the exact test's failure mode was
  a silently wrong bound.
- It needs **no fixnum-boundary literal anywhere in the pass**, so it does not depend on the
  compiler being able to encode one. It also deleted the ~20 lines of overflow pre-check logic.

**Clamped again after shipping.** ±(2^30 − 1) bounds the *arithmetic* but not the *encoding*. A
folded result must also survive `encode-const`, which mis-emits any literal at or above 2^57
(issue #7) — so a product in [2^57, 2^60) was folded correctly and then written out wrong, and
`(* 1073741823 1073741823)` printed correctly before this pass and wrongly after, on the shipped
door only. The window is now **±(2^28 − 1)**, whose largest product (2^56 − 2^29 + 1) sits below
the encoding cliff; it can widen back to the arithmetic ceiling once #7 is fixed. The lesson is
that "what the arithmetic can compute" and "what the emitter can write down" are two different
ceilings, and the fold guard is bounded by the lower one.

It is deliberately a *sufficient* condition, not an exact one: `(* 2000000000 2000000000)` fits a
fixnum but is left for the runtime. Constant *propagation* carries no window at all — copying a
constant computes nothing — so a large literal still propagates fine.

Only integer primitives with exactly-defined runtime behavior are folded to begin with; anything
else is left alone.

### D3a — Propagate only immediate constants

Propagation copies a constant to every use site, which is free for data that `encode-const` turns
into an inline operand (exact integers, booleans, characters, `'()`) and **not** free for anything
that materializes at run time. A string constant becomes an `rt_make_string` call, a pair an
`rt_cons`; duplicating one would allocate a *second object*, so `(let ([s "hi"]) (eq? s s))` would
turn from `#t` into `#f`. Symbols are eq?-safe (`rt_intern` returns the same object) but still cost
a call per site, so they are excluded too. Only immediates propagate.

### D4 — Iterate to a fixed point, with a cap

Inlining creates a `let` of constants, which enables folding, which leaves a binding dead, which
enables removal — and a chain (`f` calls `g` calls `h`) needs another round. Rather than ordering
the rules cleverly in one traversal, apply the rule set repeatedly until the term stops changing,
with a small iteration cap as a runaway guard.

This is safe for the cross-door byte-identity guarantee because the pass is a pure function of the
term: same input IL, same number of iterations, same output, on every host and every door.

### D5 — Why not just do P6-B (the LLVM `llvm.assume`)

Measured: adding an alignment fact on the *integer* returned by `rt_alloc_words` —

```llvm
%al1 = and i64 %raw, 7
%al2 = icmp eq i64 %al1, 0
call void @llvm.assume(i1 %al2)
```

— is enough for `opt -O2` to collapse the unmodified `square` unit's `scheme_entry` all the way to
`ret i64 9248` (= `1156 << 3`): it forwards the store, devirtualizes, inlines `code_2`, folds the
fixnum tag check and folds the multiply. (An `align` operand bundle on the `inttoptr` result does
*not* work — the fact does not propagate to the integer's known-bits. Verified.)

That is a real and broad win, but it is **not a substitute** for this change:

1. It helps only the ship door. The dev door runs no IR passes, so B alone means a constant folded
   in the shipped binary and recomputed in the REPL — values identical, but `--dump` stops
   describing what actually runs, which is the dev→ship fidelity property `CLAUDE.md` exists to
   protect.
2. It leaves the dead allocation behind. LLVM will not delete `rt_alloc_words` and its store
   without `noalias`/allocator attributes, and `noalias` cannot be applied to an `i64` return
   (`opt` rejects the module outright — verified). Removing dead allocations would mean changing
   `rt_alloc_words` to return `ptr`, touching every emitted allocation site.

So B is worth doing — as its own change, measured on the Ackermann probe, sequenced against P5's
still-deferred B-general, which it partly subsumes.

## Risks / Trade-offs

- **A wrong fold silently miscompiles arithmetic.** → The range guard (D3) is the single highest-risk
  line in the change. Test it directly at the boundary — the largest and smallest representable
  fixnums, and products/sums that cross it in both directions — not only through end-to-end demos,
  which use small numbers and would not notice.
- **A wrong occurrence count either duplicates code or inlines a binding still in use.** → Count over
  the whole term including nested lambda bodies; test the shadowing case (an inner binding of the
  same name), the captured-value case, and the self-recursive case explicitly.
- **The self-hosting fixed point must reconverge.** The pass changes emitted IR for the compiler's
  own sources, so `make regen` re-runs and the committed `bootstrap/*.ll` seeds change. → Confirm
  convergence (P5 reconverged at iteration 2) and confirm all backends stay byte-identical to each
  other. Expect the committed binaries to *shrink*; a growth would mean a rule is misfiring.
- **The pass fires on program files but not in the REPL** (D2, Non-Goals). → Accepted and documented
  as a performance-only asymmetry. Worth stating in `docs/PIPELINE.md` so the stage dump is not
  read as a promise the REPL also makes.
- **First optimizing pass sets a precedent.** Every future "just one more rewrite" will point at
  this file. → Keep the three rules separable and separately testable, and keep the non-goals above
  written down.

## Resolved during implementation

- **Library units (was an open question).** The pass is wired into all three ladders uniformly.
  It runs over all 120 of `(scheme base)`'s defines and rewrites **none** of them —
  `bootstrap/scheme.base.ll` is byte-identical before and after. A library's top-level defines are
  globals rather than a binding group, so nothing is inlinable, and its function bodies happen to
  hold no foldable constant `let`s. Uniform placement costs nothing and keeps one ladder shape;
  the benefit there is currently zero.
- **Iteration cap (D4).** Set to 10. Never reached: every demo and the compiler's own source reach
  their fixed point well inside it, and the pass is idempotent on its own output (unit-tested).
- **Where inlining actually fires (not anticipated).** The rule needs a binding group, and
  `build-program` (`src/parse.ss:453`) only emits a `letrec` when **every** top-level define has a
  lambda initializer; a single non-lambda define (`(define n 1)`) sends the whole program down the
  `let` + `set!` path, where assignment conversion boxes the names and nothing is inlinable. The
  compiler's own source is in that shape (`(define counter 0)`, `(define *code-defs* '())`), so
  the compiler gets no top-level inlining from its own pass. This bounds the win more than the
  proposal assumed and is now documented in `docs/PIPELINE.md`. Widening `build-program` to emit a
  `letrec` for the lambda-initialized subset would unlock it, and is a separate change.

## Open Questions

- None outstanding.
