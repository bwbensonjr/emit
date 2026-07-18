## 1. Relocate cited findings (before any deletion)

- [x] 1.1 In `LLVM.md`, confirm the calling-convention numbers are stated inline; reword the trailing "Full data … `spike/calling-convention/RESULTS.md`" pointer to name the archived `calling-convention-spike` / `argc-overflow-calling-convention` changes
- [x] 1.2 In `docs/PIPELINE.md`, confirm the nanopass findings are summarized inline; reword the three `spike/nanopass/` pointers (lines ~9, ~127, ~151) to name the archived `spike-nanopass-translation` / `select-syntax-rules-matcher` changes and drop the "kept as the worked reference" clause
- [x] 1.3 Spot-check that the archived design docs hold the full numbers the reworded pointers now reference (so nothing is lost)

## 2. Fix in-tree source/config references

- [x] 2.1 Reword the provenance comment in `src/passes/recognize-let.ss` ("Promoted from spike/nanopass/hand-passes.ss") to state the provenance without the deleted path
- [x] 2.2 Reword the comment in `src/repl-core.ss` referencing `spike/form-complete`
- [x] 2.3 Reword the comment in `src/runtime/runtime.c` ("Validated by spike/guard/")
- [x] 2.4 Remove the `.gitignore` entry `spike/calling-convention/spike`

## 3. Delete the tree

- [x] 3.1 `git rm -r spike/` (removes vendored nanopass + all five first-party prototypes)

## 4. Regenerate and verify

- [x] 4.1 Run `make catalogue` so `docs/COMPLEXITY.md` reflects the removal (spike + nanopass-vendor rows gone; totals drop by ~20,003 LOC)
- [x] 4.2 `git grep "spike/"` returns no matches outside this change's own archived artifacts and the `complexity-catalogue` policy/spec taxonomy text; update the `complexity-catalogue` policy if the now-unused `spike`/`vendored` rules warrant a comment
- [x] 4.3 Build still works with no spike on any path: `make` (and `make schemec`) succeed
- [x] 4.4 Confirm the compiler/runtime behavior is unchanged (nothing under `spike/` was ever built): a representative demo compiles and runs
