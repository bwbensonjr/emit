## 1. Primitive floor (D0) — compiler-intrinsic (DECIDED: intrinsic floor, no linked artifact)

- [x] 1.1 Decided the mechanism: compiler-intrinsic floor (recorded in design.md D0). Plain names are an intrinsic integrable set; direct calls inline to `%op`, value uses eta-synthesize; universal by construction (no import, no `primitive-layer.ll`).
- [x] 1.2 Introduce the intrinsic integrable set (`*integrable*`, name→`%`-op+arity) in `compute-known`; `cons` removed from `*prims*`, `%cons` added. (Batch A: cons only so far.)
- [~] 1.3 Chez host shim — NOT NEEDED under the intrinsic floor: `%`-ops appear only in compiler-generated IL, never in prelude source, so `read-all-tests` (loads prelude under Chez) passes unchanged (6/6). Marked moot; revisit only if a future primitive puts a `%`-op in source loaded under Chez.
- [x] 1.4 Regression guards verified (Chez driver): a library using `cons` without importing `(scheme base)` → `(5 . 6)`; a `--no-prelude` program using `cons` → works. Both were spike failures. (Add to the automated suite in a later task.)

## 2. Shadow-aware inliner (D1)

- [~] 2.1 Integrable table exists (`*integrable*`) for fixed-arity `cons`; variadic fold/identity (for `+`) pending Batch B
- [x] 2.2 `inline-primitives` pass added and wired into all three paths (compile-forms, compile-program-with-imports, repl-lower-form). Shadow-awareness is free: rename makes any shadow unique, so an unshadowed integrable survives as its bare symbol — no `bound`/`find-assigned` threading needed
- [ ] 2.3 Document the new stage in `docs/PIPELINE.md` with its input/output IL shape
- [x] 2.4 Verified (cons): a direct unshadowed `(cons a b)` emits bare `@rt_cons`, zero wrapper refs — matches baseline codegen

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
