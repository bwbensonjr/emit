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
- [x] 3.3 **Every** standard primitive is integrable now (49 total, incl. `string-append` via the completion pass, commit 0660a4b); only the internal `%`-ops and the REPL-state ops stay reserved (by design).
- [x] 3.4 Regenerated `bootstrap/*.ll` committed at each stable slice; trust-check clean each time.

## 4. Cleanup and reconcile

- [x] 4.1 **Eta special-case fully retired** (completion pass, commit 0660a4b): `prim-as-value`, `*prim-eta-arity*`, `nsyms`, and the parse-time value special-case are all deleted. The insight that unblocked it: a variadic value-eta needs no prelude helper — it is self-contained core IL over raw `%`-primcalls (`fold-eta`), which the post-rename inliner can emit. So `string-append` moved to `*integrable*` and every primitive's value-eta is now synthesized post-rename.
- [x] 4.2 Reconciled: the change's delta `core-language` spec has an ADDED requirement ("Reserved-keyword status is limited to raw primitive operators") that supersedes all "reserved primitive (not rebindable)" wording for plain names; the stale code comments (`src/parse.ss` file header + resolver `primitive`-kind comments) were updated to the integrable/inline-primitives model (completion pass).
- [~] 4.3 (Optional) NOT done, deliberately: the expander n-ary fold (`expand-arith`/`expand-compare`/`expand-string-append`) is KEPT (D2). It reduces operator-position calls to binary forms that the inliner then rewrites; unifying it into the inliner would additionally fix n-ary calls of a *shadowed* folding op (a narrow edge — 2-ary shadowing is already correct). Left as a future follow-up.

## 5. Verification

- [x] 5.1 Full `./run-dev-tests.sh` green — 18/18 after every slice (incl. the library / `--no-prelude` guards, self-host fixed point + Chez re-derivation, and the anti-stale trust-check).
- [x] 5.2 First-class + shadow confirmed per kind, through the shipped binary AND `--no-prelude`: predicate (`null?`/`pair?`), fixed-arity (`car`/`cdr`/`vector-ref`), variadic arith (`+`/`-`/`*` incl. `(apply + ns)`, identities, unary `-`), variadic compare (`(apply < ns)` chain), and `string-append` (operator + `(apply string-append ns)` + shadowed).
- [x] 5.3 Binary size / regen time within the design's intent: `scheme.base.ll` **byte-identical** to `main`; user direct-call codegen unchanged (bare `rt_cons`, `add i64` fast path, `rt_string_append`), so user executables are unaffected — the inliner recovers the un-inlined cost. The 3 *compiler* IRs grew ~7% (~148 KB) from the added feature code (the `inline-primitives` pass + 49-entry `*integrable*` + fold-eta machinery), not from primitive un-inlining. Regen ~21 s (the completion pass's 31 s was a one-time 2-iteration convergence).
- [x] 5.4 `make catalogue` refreshed (`docs/COMPLEXITY.md`).
