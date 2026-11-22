# Tasks

## 1. Native host

- [x] 1.1 Add a `user_library_root(std::string *origin)` helper in `src/emit.cpp` beside `user_cache_location()`, implementing design D1 (absolute `XDG_DATA_HOME` then `HOME/.local/share`, empty string when neither is usable, never creating anything). Verify with the new suite's location cases (task 3.1).
- [x] 1.2 In `LibraryResolver::prepare`, add the user root as a directory provider with identity `user` after the project root and before the installed manifest loop, inside the `options_.library_paths` guard. Verify with the new suite's precedence and opt-out cases.
- [x] 1.3 Update doctor's directory row to print the locating rule for the user provider (`[user, XDG_DATA_HOME; missing]`), and print `user library root: unavailable (...)` when the helper returns empty, without counting a failure. Verify with the new suite's doctor cases and `bash tools/test.sh --suite doctor`.
- [x] 1.4 Update `usage_shared` and `usage_doctor` to list the user root and its location in the library lookup summary. Verify with the help case in the new suite.

## 2. Chez source driver

- [x] 2.1 In `src/compile.ss`, add the same location rule and append the root in `configured-library-roots` after `(project-library-root)` and before the `EMIT_PREFIX` root, and update the usage string. Verify with the new suite's parity case and `bash tools/test.sh units`.

## 3. Tests

- [x] 3.1 Add `test/user-library-root-tests.sh` covering: `XDG_DATA_HOME` selection, `HOME` fallback when `XDG_DATA_HOME` is unset, empty, or relative; resolution from an unrelated directory; project over user; `EMIT_LIBRARY_PATH` over user; user over an installed non-baked library; baked libraries unaffected; `--no-library-paths`; a missing root; doctor rows (missing, available, unavailable); help text. Each case sets its own `HOME` and `XDG_DATA_HOME` under a temp directory. Verify it passes with `bash tools/test.sh --suite user-library-root`.
- [x] 3.2 Add a Chez parity case (reference profile, beside `hybrid-library-resolution-chez`) that resolves the same user-root-only library through `compile.ss` and `emit run`. Verify with `bash tools/test.sh --suite <id>` when Chez is available.
- [x] 3.3 Register both suites in `tools/test-registry.json` (the native suite in `full`, the Chez one in `reference`), add them to `tools/test-runner.py` extras only if needed, and move the full-profile pin in `test/validation-coverage-tests.py` and its count in `docs/VALIDATION-COVERAGE.md`. Verify with `python3 test/validation-coverage-tests.py`.
- [x] 3.4 Extend the package-collection install check (the distribution "Malt" scenarios, in `test/srfi-27-install-tests.sh` or the emit-packages pinned suite) with the "collection linked as the user root" case and an explicitly empty user root in the negative case. Verify with that suite.
- [x] 3.5 Update suites that pin doctor provider rows or REPL startup summaries (`test/doctor-tests.sh` and any others the full run turns up) for the extra `user` row. Verify with `bash tools/test.sh full`.

## 4. Documentation and release

- [x] 4.1 Update `docs/MODULES.md` (provider list and a note on shadowing shipped libraries), `docs/DOCTOR.md`, `docs/PROJECTS.md`, `docs/DISTRIBUTION.md`, and `README.md`; replace the `EMIT_LIBRARY_PATH` setup for the package collection with a clone or link at the user root, keeping `EMIT_LIBRARY_PATH` as the override. Verify by grepping for stale "installed manifest" tier lists that omit the user root.
- [x] 4.2 Bump `VERSION` to 0.12.0 and add a `CHANGELOG.md` section. Verify with `tools/release-handoff.sh preflight user-library-root`.
- [x] 4.3 Run the classified validation: `bash tools/test.sh dev --changed main`, `bash tools/test.sh units`, and the new suites; leave the full and reference profiles to CI (the release PR runs full mode). No `make regen`: neither `src/emit.cpp` nor `src/compile.ss` is an assembled compiler input (`bash tools/compiler-inputs.sh --list`).

## Workflow follow-up

- Finish with the `emit-finish-change` skill (sync, archive, PR).
- After 0.12.0 is released, update the `bwbensonjr/emit-packages` README install instructions to use the user root.
- At this release's tag, confirm tag validation reuse and record the cycle's runner-minutes in `docs/RELEASE-PIPELINE.md`.
