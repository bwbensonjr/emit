## 1. Contract Fixtures

- [x] 1.1 Add a focused `filesystem-access` shell suite and Scheme probes for the exact `(emit filesystem)` export surface, explicit-import privacy, immediate directory entries, ordinary directories, linked directories, dangling links, missing paths, and catchable file-error classification; verify the new suite initially fails because the library is unresolved rather than because its fixtures are malformed
- [x] 1.2 Add replacement fixtures using a closed same-directory temporary file plus an existing target and a missing-source failure; verify the assertions inspect source disappearance, complete destination bytes, unspecified success, `file-error?` on failure, and preservation of the old destination
- [x] 1.3 Register the focused suite in the appropriate narrated test workflow and ensure its diagnostics name the door and operation under test; verify the suite appears in the workflow's discovered suite count and obeys `EMIT_VERBOSITY`/stderr conventions from `docs/OUTPUT.md`

## 2. Runtime and Library Implementation

- [x] 2.1 Implement the raw directory-list runtime entry point with `opendir`/`readdir`/`closedir`, `.`/`..` filtering, bare Emit-string names, complete-or-failure results, and cleanup on every path; verify `src/runtime/runtime.c` compiles cleanly and a focused probe distinguishes an empty successful list from failure
- [x] 2.2 Implement three-state `stat`/`lstat` classification entry points, mapping `ENOENT`/`ENOTDIR` to false and other host failures to error; verify focused probes cover an ordinary file, ordinary directory, linked directory, dangling link, missing path, and a reliably inducible error where the host permits it
- [x] 2.3 Implement the replacement runtime entry point as exactly one `rename(source, destination)` with no unlink, truncation, copy, or retry fallback; verify success replaces the target and failure with an absent source leaves the existing target byte-identical
- [x] 2.4 Add the four private primitive mappings and LLVM declarations to `src/emit.ss`; verify the source-driven Chez compiler emits calls to the expected runtime symbols with the correct arities and the emitted unit contains each required declaration
- [x] 2.5 Add handwritten `lib/emit/filesystem.sld` wrappers that export exactly the four public procedures, translate raw statuses to specified values, and raise existing kinded error objects with operation/path irritants; verify wrong arities/types remain catchable and every host-operation failure caught by `guard` satisfies `file-error?`
- [x] 2.6 Register `(emit filesystem)` in `emit-libs.scm` without adding it to the baked/prelude set or either standard library surface; verify manifest inspection shows one ordinary source entry and surface checks show no new `(scheme base)` or `(scheme file)` export

## 3. Door, Distribution, and Size Verification

- [x] 3.1 Make the focused filesystem suite pass through both `emit run` and `emit build`, comparing normalized Scheme results and final filesystem effects; verify listing, classification, replacement, failure, and file-error behavior agree across the two doors
- [x] 3.2 Add user-library and REPL coverage for importing `(emit filesystem)` and an unimported-name rejection case; verify the ordinary module artifact is reusable, the four exports resolve in each required context, and none is implicitly in scope
- [x] 3.3 Extend installed-layout tests so an Emit installed into a temporary prefix resolves and executes `(emit filesystem)` from an unrelated directory with no local manifest; verify both installed `emit run` and an installed standalone build use the shipped library and runtime support source
- [x] 3.4 Update README/module/library documentation to describe the non-standard library, its unsorted bare-name listing, link-following distinction, file-error behavior, and same-filesystem atomic replacement boundary; verify every documented import and command works as written and the Pitch prerequisite inventory no longer calls host filesystem access unavailable
- [x] 3.5 Measure and record stripped standalone sizes for equivalent probes with and without importing `(emit filesystem)`; verify the non-importing binary contains no filesystem-library unit and LTO removes unreferenced new runtime entry points, or document any material retained-size debt in `docs/PERFORMANCE.md` with the measured evidence

## 4. Regeneration Barrier and Final Validation

- [x] 4.1 Finish all compiler-source edits, run the source-driven `chez --libdirs src --script src/compile.ss` checks plus clean C compilation and focused fixture setup, and review the diff for the D1–D5 boundaries; verify no file included by `tools/regen.sh` still needs an edit before regeneration begins
- [x] 4.2 Run `make regen` once to convergence and make no subsequent compiler-source edits; verify every regenerated bootstrap member comes from the same source state and the fixed point is reached
- [x] 4.3 Run the focused filesystem, primitive/surface, module, artifact-cache, install-layout, and project-door suites after regeneration; verify every targeted suite passes before starting the full workflows
- [x] 4.4 Run `./run-all-tests.sh` and then the independent suites from `./run-dev-tests.sh` without changing compiler sources; verify every suite passes, with `test/trust-check.sh` expected to skip only while regenerated bootstrap IR is uncommitted
- [ ] 4.5 Run `openspec validate add-filesystem-access --strict`, review the final diff and test narration, and after committing run `test/trust-check.sh`; verify the change contains no general FFI, recursive policy, `(scheme file)` expansion, pre-delete replacement path, unexplained binary-size debt, or bootstrap drift
