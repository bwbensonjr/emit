## 1. Primitive floor (D0) — compiler-intrinsic (DECIDED: intrinsic floor, no linked artifact)

- [x] 1.1 Decided the mechanism: compiler-intrinsic floor (recorded in design.md D0). Plain names are an intrinsic integrable set; direct calls inline to `%op`, value uses eta-synthesize; universal by construction (no import, no `primitive-layer.ll`).
- [ ] 1.2 Introduce the intrinsic integrable set (plain name → raw `%`-op + arity), placed in `compute-known` so the names are universally "known" (programs, libraries, `--no-prelude`); remove them from `*prims*` and add the `%`-ops to `*prims*`
- [ ] 1.3 Add the Chez host shim (`%op → Chez op`) at every site that `(load)`s the prelude under Chez (e.g. `test/read-all-tests.ss`) — needed because eta/inline bodies reference `%op`
- [ ] 1.4 Regression guards: a library using `+`/`cons` without importing `(scheme base)`, and a `--no-prelude` program using them, both build and run (the spike failures)

## 2. Shadow-aware inliner (D1)

- [ ] 2.1 Add the integrable table (plain name → raw `%`-op, arity, fold/identity for variadic)
- [ ] 2.2 Add the inlining pass after resolution; rewrite direct calls to bare primcalls only when the operator resolves to the global layer binding and is not shadowed / user-redefined / `set!`-ed (reuse resolver `bound` set, user-wins resolution, `find-assigned`)
- [ ] 2.3 Document the new stage in `docs/PIPELINE.md` with its input/output IL shape
- [ ] 2.4 Verify byte-for-byte (or perf-parity) that unshadowed direct calls match the pre-change baseline IR for representative `cons`/`+`/`car` programs

## 3. Staged bootstrap rollout (D3) — repeat per batch

- [ ] 3.1 Batch A (fixed-arity: `cons`, `car`, `cdr`, `not`, `eqv?`, …): stage-1 regen (add `%`-synonyms), stage-2 regen (flip to layer + inliner); full dev-tests green each stage
- [ ] 3.2 Batch B (variadic: `+ - * = <`, `string-append`): same 2-regen; keep the expander fold (D2) emitting binary raw primcalls for literal calls
- [ ] 3.3 Remaining primitives in further batches until all are layer-exposed
- [ ] 3.4 Commit regenerated `bootstrap/*.ll` at each stable stage; trust-check clean

## 4. Cleanup and reconcile

- [ ] 4.1 Retire the four-primitive eta special-case (`prim-as-value`, `*prim-eta-arity*`) once all primitives are first-class via the layer
- [ ] 4.2 Reconcile remaining "reserved primitive" wording in `core-language` specs/comments with the new model
- [ ] 4.3 (Optional, later) Unify the expander n-ary fold into the table-driven inliner (D2 follow-up), deleting `fold-arith`/`expand-string-append`

## 5. Verification

- [ ] 5.1 Full `./run-dev-tests.sh` green (all suites, including the new library / `--no-prelude` guards)
- [ ] 5.2 First-class + shadow behavior confirmed for a representative primitive of each kind (fixed, variadic, predicate)
- [ ] 5.3 Binary-size and self-host regen-time within noise of baseline (inliner recovers the un-inlined cost the spike measured)
- [ ] 5.4 `make catalogue` refreshed
