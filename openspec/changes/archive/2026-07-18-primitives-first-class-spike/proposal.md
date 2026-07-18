## Why

We want every Scheme procedure — including primitives — to be usable as a first-class
value and to be shadowable, for consistency. The intended end-state makes each primitive an
ordinary prelude procedure (`(define (car x) (%car x))`) over a `%`-prefixed raw primcall,
with a shadow-aware inliner that rewrites direct, unshadowed calls back to bare primcalls so
performance is unchanged "in most cases." Before committing ~60 primitives to that model,
a two-primitive vertical slice must destroy the load-bearing assumptions: that the
bootstrap dual-host path survives `%`-raw + wrappers, that the inliner respects shadowing and
`set!`, that unused wrappers tree-shake away, and that a table-driven n-ary lowering can
match today's expander-fold codegen (so we can decide whether to unify them).

This is an **investigative spike**, not the rollout. Its deliverable is evidence and a
recorded decision, captured in this change's `design.md` (the `spike/` tree was retired;
findings live in OpenSpec). The full rollout is a separate change gated on these results.

## What Changes

- Vertical slice on **two** primitives only, everything else untouched:
  - `cons` (fixed-arity): rename raw op to `%cons`, add a prelude wrapper, add an
    integrable-table entry + a minimal inliner so `(cons a b)` still lowers to `%cons`.
  - `+` (variadic): raw `%add`, a prelude n-ary wrapper, and a table-driven n-ary lowering
    for literal `(+ …)` calls — the candidate replacement for the expander's `fold-arith`.
- A minimal, shadow-aware inline pass keyed on resolution (fires only for the global,
  unshadowed, un-`set!` prelude binding).
- Capture findings + a recommendation in `design.md`: bootstrap pass/fail, perf fidelity,
  simplicity delta, and the two open decisions (variadic unify-vs-keep-expander; rollout
  scope).

## Capabilities

### New Capabilities
<!-- None. A spike introduces no capability; it produces evidence and a decision. -->

### Modified Capabilities
<!-- None yet. Any spec changes (e.g. compiler-pipeline, core-language) belong to the
     follow-on rollout change, informed by this spike's findings. -->

## Impact

- **Spike code** (throwaway / seed): `src/parse.ss`, `src/emit.ss`, `src/prelude.scm`, a new
  minimal inline pass — for `cons` and `+` only. Intended to run in a worktree/branch; the
  code is not merged to `main` by this change unless we decide it seeds the rollout.
- **Kept**: the findings + decision recorded in this change's `design.md`.
- **No effect** on shipped artifacts on `main` until the follow-on rollout change.
