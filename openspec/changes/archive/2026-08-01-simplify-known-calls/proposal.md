## Why

Every pass in the ladder is a *translation* — `expand`, `recognize-let`, `convert-assignments`,
`convert-closures`, `lower-program` change representation, and none of them removes work. So a
program as small as `demos/square.scm` (`(define (square n) (* n n))` / `(square 34)`) compiles to
a heap-allocated closure record plus an indirect call plus a guarded fixnum multiply, in order to
recompute a whole-program constant on every run. Neither door recovers it: the dev door
(`emit run`, REPL) runs a bare `LLJITBuilder` with no IR transform layer at all
(`src/emit.cpp:404`), and the ship door's `-O2` cannot see through the closure representation
(measured — see `docs/PERFORMANCE.md` P6).

Half the machinery already exists. `recognize-let` (`src/passes/recognize-let.ss:23`) performs
exactly this beta-reduction, but only when the lambda is syntactically in operator position; a
name bound to a lambda by the top-level `letrec` is one hop out of its reach.

## What Changes

- **New pass `simplify` (IL→IL)**, inserted after `convert-assignments` and before
  `convert-closures` in all three compile ladders (`src/core.ss`), with three rules:
  - **Inline a known, singly-referenced lambda binding.** A `letrec`/`let` binder whose RHS is a
    `lambda`, whose name occurs exactly once, whose single occurrence is the operator of a `call`,
    and whose arity matches, is substituted into the call site and its binding dropped. The pass
    forms the resulting `let` itself. Self-recursive functions are excluded automatically (their
    own body pushes the occurrence count above one). Single-use means no code duplication, so the
    pass can never grow the output.
  - **Constant-propagate and fold.** A `let` binding of a `(const …)` is substituted into the
    body; a `primcall` whose arguments are all `const` folds to a `const` — **only** when the
    result is representable as a target fixnum (see below).
  - **Drop dead bindings.** `letrec`/`let` binders with no remaining references are removed, so
    the closure allocation goes away rather than just the arithmetic.
- **`simplify` becomes an observable `--dump` stage**, consistent with the one-IL-per-stage
  discipline, and is documented in `docs/PIPELINE.md`'s ladder and stage table.
- **Folding is range-guarded.** `rt_mul` is `FIX(UNFIX(a) * UNFIX(b))`
  (`src/runtime/runtime.c:190-194`) — silent wraparound, no overflow check, no bignums. The
  compiler is self-hosting, so compile-time folding runs on the *host's* arithmetic (Chez when
  bootstrapping, emit itself thereafter), which does not wrap the same way. The pass refuses to
  fold unless the result fits the 61-bit target fixnum, so a fold can never disagree with what the
  runtime would have computed.
- **Not in scope:** the LLVM-side half of P6 (an alignment `llvm.assume` at the allocator so
  `-O2` can see through the closure untag mask). That is tracked as P6-B in
  `docs/PERFORMANCE.md`, is independently landable, and wants its own measurement.

## Capabilities

### New Capabilities

_None._ This adds a pass to an existing, already-specified ladder rather than a new capability
surface.

### Modified Capabilities

- `compiler-pipeline`: adds a requirement for a **simplify (optimizing) pass** in the frontend
  pass ladder — the first pass that removes work rather than translating it — covering its
  placement (after assignment conversion, where every remaining variable is immutable), its
  semantics-preservation obligations (single-use inlining only; fixnum-range-guarded folding),
  and its appearance as an observable `--dump` stage.

## Impact

- **New file:** `src/passes/simplify.ss`.
- **Modified:** `src/core.ss` — three compile ladders (`:62-67` program, `:286-289` unit,
  `:441-444` program-with-imports) each gain one pass invocation and one `dump` call; the pass
  file is added to the source list / build inputs alongside the other passes.
- **Modified:** `docs/PIPELINE.md` (ladder diagram + per-stage IL table), `docs/PERFORMANCE.md`
  (P6 status).
- **Self-hosting fixed point:** the pass changes emitted IR for the compiler's own sources, so
  `make regen` must be re-run and reconverge, and the committed `bootstrap/*.ll` seeds change.
  The compiler's own binaries are expected to *shrink* (dead closures removed) — the size half
  of P6.
- **Behavior:** no observable change to any program's *value*; every existing demo and test must
  produce byte-identical output. The change is visible only in `--dump` / `--emit` output, binary
  size, and speed.
- **Risk concentrated in two places:** the range guard on folding (a wrong guard silently
  miscompiles arithmetic) and the occurrence counter (a wrong count either duplicates code or
  inlines something still referenced).
