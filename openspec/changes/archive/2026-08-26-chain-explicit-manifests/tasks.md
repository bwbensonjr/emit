## 1. Manifest Resolution and CLI Surface

- [x] 1.1 Refactor `resolve_manifests` in `src/emit.cpp` to select an explicit project manifest first, skip the current-directory candidate in that case, append readable installed candidates when chaining is enabled, and stop after the first manifest when disabled; verify an ordinary `make emit` compiles the changed host without touching `bootstrap/`.
- [x] 1.2 De-duplicate manifest candidates by canonical file identity while retaining the first path spelling and resolution order; verify an explicit path naming the installed manifest is narrated and preloaded exactly once.
- [x] 1.3 Add the valueless `--no-manifest-chain` option to `emit run`, `repl`, `build`, and `lib`, pass its policy to the shared resolver, and update each verb's usage text; verify every verb accepts the option and still rejects unknown options with a non-zero usage error.
- [x] 1.4 Preserve downstream invariants by keeping program resolution on `first_manifest`, library resolution on the full vector, and manifest-relative paths paired with their supplying manifests; verify focused tests distinguish first-manifest programs from chained libraries and resolve project/installed relative paths from their respective directories.

## 2. Regression and Compatibility Coverage

- [x] 2.1 Replace `test/install-layout-tests.sh`'s old “explicit manifest does not chain” assertion with an installed-binary `emit run` case launched from a third, unrelated directory; verify an absolute project `--manifest` supplies project entries, ignores an unrelated `./emit-libs.scm`, and falls through to installed non-baked standard libraries.
- [x] 2.2 Add an out-of-tree `emit build NAME --manifest FILE` fixture whose program and output paths are relative to the project manifest and whose source imports at least `(scheme file)` and `(scheme process-context)`; verify the executable is delivered at the project-relative output and runs correctly.
- [x] 2.3 Exercise the same explicit-chain behavior through `EMIT_MANIFEST`, plus `--manifest` precedence over a conflicting environment value; verify the environment-selected project chains installed libraries and the flag-selected project wins when both are present.
- [x] 2.4 Add chain-policy edge cases for project override precedence, first-manifest-only program lookup, a missing explicit file, `--no-manifest-chain` failure on an installed-only import, canonical duplicate suppression, default/quiet narration, and all four doors; verify the focused CLI and installed-layout suites cover every scenario in the delta spec.
- [x] 2.5 Audit repository commands and tests using `--manifest` or `EMIT_MANIFEST` for intentional fixture isolation, adding `--no-manifest-chain` where they rely on the old behavior; verify `rg` finds no documented or test assertion that still treats `--manifest` alone as hermetic.

## 3. Documentation and Migration

- [x] 3.1 Update `docs/PROJECTS.md` to state that explicit and discovered project manifests both extend installed libraries, that explicit selection excludes the caller's current-directory manifest, and that hermetic callers add `--no-manifest-chain`; verify the out-of-tree project example matches the tested command.
- [x] 3.2 Update `docs/MODULES.md` and command help to describe the two-phase candidate order, first-manifest library/program precedence, `EMIT_MANIFEST` parity, de-duplication, narration, and the bootstrap Chez driver's unchanged scope; verify searches for “explicit”, “hermetic”, and “chain” no longer contradict the delta spec.

## 4. Verification and Delivery

- [x] 4.1 Run `make emit`, the focused CLI tests, and `test/install-layout-tests.sh`; verify the new issue #114 reproduction passes and all focused suites report zero failures without `make regen` or a `bootstrap/` diff.
- [x] 4.2 Run `./run-all-tests.sh` and `./run-dev-tests.sh` after the host-C++ and documentation edits are complete; verify every applicable suite passes and record any intentional trust-check skip caused by the uncommitted planning/implementation diff.
- [x] 4.3 Run `openspec validate chain-explicit-manifests --strict`, review `git diff --check` and the complete change diff, and ensure the eventual fixing commit message includes `Fixes #114`; verify validation and whitespace checks pass and only intended files changed.
