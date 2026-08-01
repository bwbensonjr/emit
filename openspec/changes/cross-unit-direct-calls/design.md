## Context

P5-B-general made a call to a *closure-block binding* direct: the code label is known during
`lower`, so the code-pointer load disappears and LLVM can inline the callee. It deliberately
stopped at the unit boundary. 808 sites in the compiler's own module call a `(scheme base)` global,
and every program pays them because `(scheme base)` is auto-imported.

The emitted shape today:

```llvm
%t16 = load i64, ptr @"scheme.base:zero?"    ; the closure (still needed: it holds the env)
%t17 = and i64 %t16, -8                      ; ─┐
%t18 = inttoptr i64 %t17 to ptr              ;  │ the code-pointer load
%t19 = load i64, ptr %t18                    ;  │ that a direct call removes
%t20 = inttoptr i64 %t19 to ptr              ; ─┘
%t21 = call fastcc i64 %t20(i64 %t16, i64 1, …)
```

Measured, 30M calls (see proposal for the table): direct-alone 0.06s, LTO-alone 0.06s, both 0.01s
against 0.06s today. The direct call is not the win; it is what *makes* the win reachable.

## Goals / Non-Goals

**Goals:**

- Direct calls into libraries, with cross-unit inlining actually enabled, on the AOT door.
- Keep the dev/REPL door's emitted program IR identical to the ship door's if at all possible
  (see D4) — this project treats dev→ship fidelity as a design rule, not a nicety.
- Land the three parts in an order where each is independently verifiable even though only the
  combination pays.

**Non-Goals:**

- **Inlining across units in the JIT.** The dev door runs no IR passes; this change gives it a
  slightly shorter instruction sequence and nothing more.
- **Devirtualizing genuinely higher-order calls.** 1563 of the compiler's surviving indirect sites
  are `map`/`filter`-style callbacks with no static callee. Out of scope, permanently.
- **Making `rt_*` runtime calls inlinable.** LTO will incidentally expose `runtime.c` to the
  optimizer, which may be a real win on its own — but it is a separate item and must not be used
  to justify this one. Measure it separately (see Open Questions).
- Changing the closure representation or the calling convention.

## Decisions

### D1 — Derive a library procedure's code label from its binding name

The blocker, and the reason this is not a small change. Labels come from the shared gensym counter
(`fresh-code-label`), so the tree-shaken recompile assigns *different* labels than the full
compile: `zero?` is `scheme.base:code_168` committed, `scheme.base:code_216` pruned. The program
that triggers the pruning is the same program that must name the callee, so no amount of
after-the-fact bookkeeping fixes it — the label must not depend on which bindings survived.

**Decision:** a library **top-level** binding whose initializer is a lambda gets the label
`<unit>:code:<internal-name>` — mangled exactly like the value symbol, so it inherits the existing
determinism requirement. Inner lambdas, anonymous lambdas, and everything in a program unit keep
the counter.

*Alternatives considered.* (a) *Thread the full compile's label map into the pruned recompile* —
keeps every current label byte-identical, but makes the pruned unit's correctness depend on an
artifact of a different compilation, and the map has to survive caching; it trades a rename for a
new coupling. (b) *Stop pruning units that are direct-called into* — surrenders P1's flagship size
win. (c) *Give up and use the value symbol as the call target* — impossible: the global holds a
closure, not code.

The cost of (D1) is a one-time rename of every library code label, hence a large but mechanical
IR diff. Program-unit labels are untouched, which keeps most of the demo baseline stable.

### D2 — The export table carries label and arity; linkage needs no change

`.exports` today is `((mylib) ((greet . "mylib:greet")))`. It gains, for lambda-valued exports,
the code label and fixed arity — everything a program needs to emit the call without the library's
source, which is exactly the property the existing **Library export table** requirement states.

Library code labels are **already externally linked** (`define fastcc i64 @"scheme.base:code_1"`,
no `internal`), which is why the hand-patched probe linked at all. An earlier note in
`docs/PERFORMANCE.md` claimed linkage work would be needed and that it would fight P1's stripping;
that was wrong on both counts. P1 prunes by *not emitting* unreachable bindings, not by
internalizing, and a directly-called binding is reachable by construction.

Arity is carried so the call site can refuse to direct-call on a mismatch, leaving the indirect
path to trap exactly as it does now. Variadic exports are not direct-called in the first
increment.

### D3 — `-flto` on the AOT link

Without it the other two parts measure zero. With it, the direct call becomes inlinable across the
unit boundary and the probe drops 6×.

This touches the ship path only (`link_clang` in `src/emit.cpp`, the `ship-opt` sibling in
`src/compile.ss`). It composes with `aot-release-profile`'s `-O2`, which is why that requirement is
being amended rather than replaced. Build time and binary size both need measuring — LTO can grow
a binary through inlining, and this project treats binary size as a first-class concern, so a size
regression is a reason to reconsider, not a footnote.

### D4 — Immutability, and whether a dev→ship carve-out is needed at all

A direct call assumes the global's closure is the one the label belongs to — i.e. that
`scheme.base:zero?` is never reassigned after `__init`. The obvious framing is the closed-world
AOT assumption `aot-release-profile` already relies on, with the lowering restricted to the ship
door.

**That framing looks unnecessary, and avoiding it is worth the investigation.** Library globals
appear to be immutable after `__init` on *both* doors: the REPL preloads units once and has no
reload, and a user redefining `car` at the REPL creates a fresh *program* global under the
generation-mangling scheme rather than touching `scheme.base:car`. If that holds, the lowering is
sound everywhere, the emitted program IR stays identical across doors, and `demos/run-backends.sh`
and `self-emit-equiv` keep passing unchanged.

An AOT-only lowering would be a **much** larger carve-out than P1's: P1 varies only the *library*
units, whereas this would vary the *program* module between doors — precisely the divergence the
one-compiler-core rule exists to prevent. Confirm the immutability claim first (task 1.1); if it
fails, the fallback is the AOT-only carve-out with the byte-identity tests taught about it, and
that should be re-proposed rather than absorbed silently.

**Resolved: it holds, on both doors, so there is no carve-out.** The lowering is enabled
everywhere and the program module stays byte-identical across doors. Three independent reasons
were checked, and the argument depends on all three — a future library-*reload* feature would
break the third and must revisit this decision:

1. **A library global is written only by its own unit's `__init`.** Its slot is stored by the
   per-define `@"L:__init_N"` thunks and nowhere else; an importing module declares it
   `external global` and only ever loads it.
2. **`set!` on a top-level or imported name is a compile error**, not a store. `resolve-globals`
   only produces a `global-set!` from a top-level `define`; a `set!` whose target is not a
   lexical local reaches `lower` as a free variable and raises `lower: unbound variable`.
   Verified on both a program (`(set! car …)`) and a library body (a unit assigning its own
   exported binding) — both are rejected at compile time.
3. **A REPL redefinition allocates a fresh *program* global.** Under the generation-mangling
   scheme `(define car …)` binds `car` to a new `car.gN` slot consed on top of the session
   environment; `scheme.base:car` is untouched. Verified interactively: after redefining `car`,
   the redefined name yields the new value while a procedure compiled earlier still yields what
   the library's `car` returns. This is pinned as a regression test
   (`test/cross-unit-direct-call-tests.sh`), not left as an assertion, because its failure mode
   is silent misdispatch.

The REPL preloads each unit once and has no reload path (`repl-load-library-text` returns
`already` for a name in `*repl-libs*`), which is what makes (3) true today and what a reload
feature would remove.

## Risks / Trade-offs

- **A label mismatch between the full and pruned compile** → a link-time undefined symbol, which
  is the safe direction (loud, not silent). Pin it with a test that builds the same program
  through both doors.
- **LTO grows the binary or the build time** → measure before committing; P1's size gains are
  recent and hard-won, and this must not quietly undo them.
- **The immutability assumption (D4) is wrong** → wrong-callee dispatch, a silent miscompile. This
  is the one hazard with no loud failure mode, so it gets a written argument and a test that
  redefines a library name at the REPL and checks previously-compiled code, not just an assertion.
- **Only the combination pays** → a partial landing looks like a regression in review (churn, no
  win). Tasks are ordered so each part is *verifiable* alone (labels stable; table round-trips;
  LTO neutral) even though the speedup only appears at the end.
- **Rename churn obscures review** → keep D1 in its own commit with a before/after capture showing
  the diff is confined to label spellings.

## Open Questions

- ~~**Does LTO pay for itself independently?**~~ **Answered: not on speed, yes on size.** LTO
  alone leaves the 30M-call probe at 0.07s, so there is no independent speed win to double-count
  — and the `rt_*`-inlining hypothesis does not hold either: on the one workload where LTO
  *regresses* (a loop over `assq`, −9%), the regression survives keeping `runtime.c` out of the
  LTO set, so it is cross-unit inlining of a large library procedure into a hot loop. LTO does
  pay independently on **size**, −38% on the delivered binary, which arrives with this change
  rather than as a separate item.
- ~~**Variadic and multi-arity exports** are excluded from the first increment~~ — and that is
  where the remaining work is: **all 471** unconverted cross-unit call sites in the compiler's
  own module call one of eight variadic exports (`map` 193, `list` 84, `append` 78, `error` 68,
  `for-each` 41, `string`, `char=?`, `vector`), against 401 converted. A direct call to a
  variadic callee would have to build the rest list at the call site, which is a real design
  question, not a flag flip. Worth its own item.
- ~~**User libraries**~~ **Confirmed.** `(mylib)` from `test/modules/` gets the same treatment —
  `((mylib) ((greet . "mylib:greet")) ((greet "mylib:code:greet" 0)))`, and an importing program
  emits `call fastcc @"mylib:code:greet"`. Pinned in `test/cross-unit-direct-call-tests.sh`.
- **New:** a library's calls to its *own* top-level procedures are still indirect — inside
  `(scheme base)`, `zero?` resolves to that unit's own global, not an import, so the rule does
  not fire. The labels are already stable and already in `*unit-procs*`, so this looks cheap, but
  it needs a definition-order rule (a forward reference is not recorded yet when its caller is
  lowered). Deliberately out of scope here.
