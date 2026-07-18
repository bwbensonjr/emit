## 1. Primitive floor (D0) — compiler-intrinsic (DECIDED: intrinsic floor, no linked artifact)

- [x] 1.1 Decided the mechanism: compiler-intrinsic floor (recorded in design.md D0). Plain names are an intrinsic integrable set; direct calls inline to `%op`, value uses eta-synthesize; universal by construction (no import, no `primitive-layer.ll`).
- [x] 1.2 Introduce the intrinsic integrable set (`*integrable*`, name→`%`-op+arity) in `compute-known`; `cons` removed from `*prims*`, `%cons` added. (Batch A: cons only so far.)
- [~] 1.3 Chez host shim — NOT NEEDED under the intrinsic floor: `%`-ops appear only in compiler-generated IL, never in prelude source, so `read-all-tests` (loads prelude under Chez) passes unchanged (6/6). Marked moot; revisit only if a future primitive puts a `%`-op in source loaded under Chez.
- [x] 1.4 Regression guards verified (Chez driver): a library using `cons` without importing `(scheme base)` → `(5 . 6)`; a `--no-prelude` program using `cons` → works. Both were spike failures. (Add to the automated suite in a later task.)

## 2. Shadow-aware inliner (D1)

- [x] 2.1 Integrable table (`*integrable*`) covers all 48 shipped prims. Variadic ops (`+ - * = < eq? eqv?`) are handled without a fold/identity rule in the table: the D2 expander fold reduces every n-ary operator call to binary forms, so a plain arity-2 entry suffices; value-position is a binary eta (no variadic value-use in-tree). Only `string-append`'s variadic value-eta is a genuine exception (kept in `prim-as-value`).
- [x] 2.2 `inline-primitives` pass added and wired into all three paths (compile-forms, compile-program-with-imports, repl-lower-form). Shadow-awareness is free: rename makes any shadow unique, so an unshadowed integrable survives as its bare symbol — no `bound`/`find-assigned` threading needed
- [x] 2.3 Document the new stage in `docs/PIPELINE.md` with its input/output IL shape (added to the pipeline diagram, a prose paragraph on shadow-awareness / dev-ship fidelity, and a stage-table row)
- [x] 2.4 Verified (cons): a direct unshadowed `(cons a b)` emits bare `@rt_cons`, zero wrapper refs — matches baseline codegen

## 3. Staged bootstrap rollout (D3) — repeat per batch

- [x] 3.1 Batch A (fixed-arity) **shipped** in two direct-regen slices (both converged; the staged 2-regen was unnecessary for this shape — see the D3 lesson in design.md):
  - slice 1 (commit 0a18580): `cons`.
  - slice 2 (commit 4303bf0): the 30 single-signature fixed-arity prims — `quotient remainder car cdr null? pair? equal? not char->integer integer->char string-length string-ref string->symbol symbol->string list->string string-set! vector-ref vector-set! vector-length vector? bytevector-u8-ref bytevector-u8-set! bytevector-length bytevector? symbol? string? char? boolean? integer? exact?`.
  - `eqv?` (from the original task list) is **deferred to Batch B**: it is expander-folded (`expand-compare`) alongside `= < > <= >= eq?`, so it moves with that family. The R7RS optional-arity ops (`make-*`, `substring`, `string-copy`, `string=?`) are also deferred. `scheme.base.ll` byte-identical both slices; fixed point + Chez re-derivation green.
- [x] 3.2 Batch B **shipped** in two direct-regen slices (both converged at iter 1; `scheme.base.ll` byte-identical each; keeping the D2 expander fold):
  - B.1 (commit 47001c2 + REPL-hygiene fix 0a28c22): the expander-folded ops `+ - * = < eq? eqv?` as arity-2 integrables. The expander already reduces n-ary operator calls to binary forms emitting the plain name, so no expander change was needed; rename gives binary shadowing, the inliner rewrites to `%+`/…, and the inline fixnum fast path is preserved.
  - B.2 (commit b141bf5): the remaining fixed-arity ops `substring string=? make-string string-copy make-vector make-bytevector read-all-stdin display write newline` (all fixed-arity in Emit — the rt_* have fixed C signatures).
  - **Deferred:** `string-append` stays reserved — its value-eta folds over the prelude global `%str-concat`, which the post-rename inliner cannot synthesize (its value-use stays in `prim-as-value`). `> <= >=` remain expander-derived over the integrable `<`/`=`.
- [x] 3.3 Remaining standard primitives are all integrable now (48 total); only `string-append`, the internal `%`-ops, and the REPL-state ops stay reserved (by design / pending string-append's pre-rename value-eta).
- [x] 3.4 Regenerated `bootstrap/*.ll` committed at each stable slice; trust-check clean each time.

## 4. Cleanup and reconcile

- [~] 4.1 Retire the eta special-case: `*prim-eta-arity*` + `nsyms` deleted (commit 4303bf0); `prim-as-value` now handles ONLY `string-append`. Full retirement waits on making `string-append` integrable, which needs a **pre-rename value-eta path** — its eta folds over the prelude global `%str-concat`, which the post-rename inliner cannot name-resolve (see the B.2 commit b141bf5 rationale).
- [ ] 4.2 Reconcile remaining "reserved primitive" wording in `core-language` specs/comments with the new model
- [ ] 4.3 (Optional, later) Unify the expander n-ary fold into the table-driven inliner (D2 follow-up), deleting `fold-arith`/`expand-string-append`

## 5. Verification

- [ ] 5.1 Full `./run-dev-tests.sh` green (all suites, including the new library / `--no-prelude` guards)
- [ ] 5.2 First-class + shadow behavior confirmed for a representative primitive of each kind (fixed, variadic, predicate)
- [ ] 5.3 Binary-size and self-host regen-time within noise of baseline (inliner recovers the un-inlined cost the spike measured)
- [ ] 5.4 `make catalogue` refreshed
