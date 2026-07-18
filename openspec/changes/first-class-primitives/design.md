## Context

Grounded in the archived `primitives-first-class-spike`, which took `cons` and `+` through
the full vertical slice. Established: first-class use and shadowability work for free once
primitives are ordinary bindings (the resolver already tracks lexical shadow, user-wins
redefinition, and `set!`); the self-host fixed point converges; tree-shaking prunes unused
wrappers. The spike's dominant finding reshapes the design: making primitives `(scheme base)`
exports makes them **non-universal**, breaking user libraries (which do not import
`(scheme base)`) and `--no-prelude`. Hence D0 below.

## Goals / Non-Goals

**Goals:** every primitive is a first-class, shadowable, universally-available procedure;
direct-call codegen and binary size unchanged where the inliner fires; dev→ship fidelity
(REPL and AOT inline identically via the shared core).

**Non-Goals:** changing the runtime ABI; adding new primitives; making the `%`-raw ops
user-facing (they stay internal/reserved); CPS/ANF or any change below the LLVM boundary.

## Decisions

### D0 — Compiler-intrinsic primitive floor (DECIDED, task 1.1)

**Mechanism chosen: compiler-intrinsic floor (no linked artifact).** The plain primitive
names join a compiler-intrinsic integrable set (like `*prims*` is universal today), so they
are available by construction in programs, user libraries, and `--no-prelude` — no import, no
`primitive-layer.ll`, no module-system change. Realization:

- operator position, resolves to the intrinsic primitive, unshadowed/un-`set!` → **inline** to
  the bare `(primcall %op …)`;
- value position, same conditions → **eta-synthesize** `(lambda (a …) (primcall %op a …))`;
- shadowed (lexical, top-level user define, or `set!`) → the ordinary user binding wins.

The wrapper is thus never a linked closure; it is either inlined away or synthesized per
value-use (tree-shakeable). Universality falls out of the set being intrinsic to the compiler
(in `compute-known`), not imported. The raw `%`-ops remain reserved primcall heads and still
require the staged bootstrap (D3). *Alternative rejected:* an always-imported linked layer
library — more module-system machinery and a link edge on every unit, for a shared closure we
mostly inline away anyway.

```
   raw primcalls (reserved, internal)   %cons %add %car …   → rt_*
              ▲ referenced only by
   PRIMITIVE LAYER (always linked)       (define (cons a b) (%cons a b)) …
              ▲ universally available (programs, libraries, --no-prelude, Chez host)
   (scheme base)  (optional, library-level)   list, map, append, …   ← unchanged
```

- **Alternatives (rejected):** wrappers only in `(scheme base)` — breaks libraries /
  `--no-prelude` (the spike failure); or exposing `%`-ops to users — defeats the purpose.
- **Open sub-question for apply:** is the layer a distinguished always-imported library, or a
  set of definitions merged into every unit's base environment? Decide against how
  `--no-prelude` and library builds currently assemble their environments.

### D1 — Shadow-aware inliner
A pass after resolution rewrites `(call <op> a…)` → `(primcall %raw a…)` iff `<op>` resolves
to the global primitive-layer binding and is neither lexically shadowed, user-redefined, nor
`set!`-ed. All three conditions are already computed (resolver `bound` set; user-wins
resolution; `find-assigned`). Keyed on the resolved binding, not the raw symbol, so
shadowing is respected automatically (spike Q2). Variadic ops carry a fold rule
(arity/identity) in an integrable table.

### D2 — Variadic: keep the expander fold initially
Leave `fold-arith`/`expand-string-append` in place (they already emit correct binary
primcalls for literal n-ary calls); the layer wrapper serves value/`apply` position. Unify
into the table-driven inliner as a later, separate step once the inliner is proven.

### D3 — Staged bootstrap (inherent, from the spike)
Each primitive batch is **two regens**: (1) add the `%`-names as recognized primcalls
(synonyms alongside the plain names), regen so the committed seed learns them; (2) flip the
plain names to layer wrappers, regen. Roll out in batches (fixed-arity first, then variadic)
rather than all at once, to keep each step diagnosable.

### D4 — Dual-host shim
Wherever the primitive-layer/prelude source is `(load)`-ed under Chez (today
`test/read-all-tests.ss`), provide `(define %cons cons)(define %add +)…` so the wrapper
bodies resolve. Keep the shim in one place, applied at those load sites.

## Risks / Trade-offs

- **[Availability regression]** a build path that had raw prims loses them → Mitigation:
  D0 makes the layer as universal as the raw prims; add explicit library + `--no-prelude`
  tests (the spike failures) to the suite as regression guards.
- **[Inliner misses a hot shape]** closure calls on hot paths → Mitigation: byte-compare
  emitted IR against the pre-change baseline for representative programs; the self-host
  regen time is a sensitive whole-compiler benchmark (spike measured +40% un-inlined).
- **[Bootstrap breakage mid-stage]** → Mitigation: each batch is a 2-regen with the full
  dev-suite (incl. trust-check) run at the end of each stage.

## Migration Plan

Staged batches, each: add `%`-synonyms → regen → flip to wrappers + inliner → regen →
full dev-tests. Commit the regenerated `bootstrap/*.ll` at each stable stage. Retire the
eta special-case only after the last batch. Rollback = revert the batch's commits.

## Open Questions

- D0 layer mechanism (distinguished library vs base-env merge) — decide during apply.
- Whether `--no-prelude` should still exist, or become "no `(scheme base)`, primitive layer
  always present" (likely the latter, since the layer is now the floor).
