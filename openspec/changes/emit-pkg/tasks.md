# Tasks

## 1. Runtime primitives and `(emit process)` (compiler-source edits; iterate under Chez)

- [x] 1.1 Add `rt_process_spawn`, `rt_process_read_all` and `rt_process_wait` to `src/runtime/runtime.c`, following design D2:
  - `posix_spawnp` with the inherited `environ`;
  - an optional stdout pipe;
  - flush Emit's stdout and stderr ports before spawning;
  - `EINTR` retry in wait;
  - the negated signal number for a signalled child.

  Verify that `make emit` builds cleanly.
- [x] 1.2 Declare `%process-spawn`, `%process-read-all` and `%process-wait` in the primitive tables of `src/emit.ss` and `src/parse.ss`, alongside the `%filesystem-*` entries. Verify that `bash tools/test.sh units` passes.
- [x] 1.3 Write `lib/emit/process.sld` exporting exactly `run-program` and `program-output`:
  - argument-type checks;
  - a `'file`-kinded error naming the program on a spawn failure;
  - read before wait.

  Register it in `emit-libs.scm`. Verify that a probe runs under the Chez source driver.
- [x] 1.4 Add `rt_filesystem_create_directory` and `rt_filesystem_delete_directory` to the runtime (D3: `mkdir`, and an `lstat`-driven walk that never follows links) and declare their primitives. Extend `lib/emit/filesystem.sld` with `create-directory` and `delete-directory` (optional `recursive?`). Verify with a source-driver probe.
- [x] 1.5 Add `test/process-execution-tests.sh` with these cases:
  - verbatim arguments;
  - exit codes 0 and 3;
  - signal -15;
  - captured output, including more than 64 KiB;
  - captured output on failure;
  - ordering after an unterminated parent write;
  - the missing program as a catchable `file-error?`;
  - a non-string argument;
  - the exact export surface;
  - names unbound without the import;
  - the same probe under `emit run` and as an `emit build` executable, with identical output.

  Register it in `tools/test-registry.json` and verify that it passes.
- [x] 1.6 Extend `test/filesystem-access-tests.sh` with these cases:
  - create a new directory;
  - create on an existing path raises an error;
  - recursive delete leaves an outside link target untouched;
  - non-recursive delete of a non-empty directory raises an error;
  - delete of a linked path raises an error;
  - the six-name export surface.

  Verify that it passes under both execution paths.
- [x] 1.7 Document `(emit process)` and the two filesystem additions in `docs/MODULES.md` and `docs/PRIMITIVES.md`, and add the POSIX dependency to `docs/WINDOWS.md`. Verify that the documented examples run as written.
- [x] 1.8 Record stripped sizes of a standalone executable with and without importing `(emit process)` in the design's Implementation Evidence section. Verify that the non-importing binary contains no `rt_process_*` symbol (`nm`).
- [x] 1.9 Make no further compiler-source edits. Run `make regen` to convergence, then `bash tools/test.sh full`, `bash tools/test.sh units`, the classified reference suites, and `bash tools/test.sh source`. Verify that all pass and that `python3 tools/source-fingerprint.py --status` matches.

## 2. `(emit pkg)` core (no regen inputs)

- [x] 2.1 Write `lib/emit/pkg.sld` with the entry procedure, option parsing, usage text (exit 2 on usage errors) and `EMIT_VERBOSITY`-aware narration helpers (D7). Register it in `emit-libs.scm`. Verify that a direct invocation without `--emit-version` reports "run through emit pkg".
- [x] 2.2 Implement reading and validating `package.scm` and record files with `read` (never `eval`), numeric version comparison with the development-build exception, and the declared-file set with relative-path and `..` checks. Verify with a Scheme unit probe over well-formed and malformed metadata.
- [x] 2.3 Implement the source layer (D4), and verify each with a fixture:
  - `--from DIR`, copying through text ports (non-ASCII text checked to round-trip);
  - commit resolution through `curl` with `--proto =https`;
  - archive download;
  - `tar` extraction with a single-top-level check;
  - the `EMIT_PKG_ARCHIVE`/`EMIT_PKG_COMMIT` override, with an error when only one is set.
- [x] 2.4 Implement the D6 write protocol:
  - lock;
  - pending-record recovery;
  - symbolic-link checks on every managed directory and path component;
  - staging and all checks before any write;
  - journal, atomic placement and pruning of dropped files;
  - commit and cleanup, with the lock released on every exit path.

  Verify with the interruption and lock cases in 3.2.
- [x] 2.5 Implement `install`, `list`, `available`, `remove` and `update` on top of 2.2–2.4, with data on standard output sorted by name. Verify with the cases in 3.2.

## 3. The `pkg` verb, tests and shipping

- [x] 3.1 Add the `pkg` verb to `src/emit.cpp`:
  - locate `tools/pkg.scm` through `support_file`, with a named diagnostic if it is missing;
  - pass `--emit-version` and `--data-dir` from `user_library_root()`;
  - dispatch through the `emit run` path;
  - add `usage_pkg`, the top-level verb list, `emit help pkg`, and the unknown-verb message.

  Write the driver `tools/pkg.scm`. Verify that `emit pkg --help` exits 0 and `emit frobnicate` lists `pkg`.
- [x] 3.2 Add `test/package-manager-tests.sh`. It uses a temporary `XDG_DATA_HOME` and builds fixture collections, including a two-package fixture and a copy of the pinned emit-packages tree. Every case changes nothing when it refuses. Cases:
  - usage errors;
  - no user root;
  - install `--from` and resolution from an unrelated directory;
  - install through a `file://` archive with a fixed commit;
  - the commit shown by `list`;
  - an unknown package;
  - a missing declared file;
  - a too-new minimum, with numeric comparison;
  - a linked root and a linked subdirectory;
  - an unowned file in the way and coexistence with a user file;
  - collision with another package's file;
  - all-or-nothing with one bad name;
  - an injected pending record that is recovered;
  - a held lock;
  - `list` with no network;
  - `remove` leaving user files;
  - `update` replacing an edited file and deleting a dropped one;
  - an updated library being recompiled on the next run;
  - missing `curl` (restricted `PATH`) and a failed download;
  - a quiet install that prints nothing;
  - `--from` with no `curl` or `tar` on `PATH`.

  Register it as `package-manager` (full, host). Verify that it passes.
- [x] 3.3 Add `tools/pkg.scm` to the install support files and the `make uninstall` list. Extend `test/srfi-27-install-tests.sh` (or `test/install-layout-tests.sh`) with these checks:
  - the staged payload contains the driver, `pkg.sld` and `process.sld`, and uninstall removes them;
  - the staged installation runs `emit pkg list` from an unrelated directory;
  - `emit pkg install --from` with Malt resolves `(malt learner)`.

  Verify that the suite passes.
- [x] 3.4 Have `test/emit-packages-tests.sh` additionally install the pinned collection with `emit pkg install --from` into a temporary user root and run one Malt program from it. Verify that the `emit-packages-pinned` suite passes.
- [x] 3.5 Update `test/validation-coverage-tests.py` and `docs/VALIDATION-COVERAGE.md` for the new suites. Verify that `python3 test/validation-coverage-tests.py` passes.
- [x] 3.6 Write `docs/PACKAGES.md` covering:
  - the commands;
  - the source and commit pinning;
  - the state layout;
  - the safety rules;
  - recovery from a stale lock;
  - the testing overrides, marked test-only.

  Link it from the README, `docs/PROJECTS.md` and `docs/DISTRIBUTION.md`, and note conformance in `docs/OUTPUT.md`. Verify that every documented command runs as written against a fixture.
- [ ] 3.7 Bump `VERSION` to 0.13.0 and add the `CHANGELOG.md` 0.13.0 section. Verify that `tools/release-handoff.sh preflight emit-pkg` reports `version ok`.
- [x] 3.8 Run `bash tools/test.sh dev --changed origin/main` and the `package-manager`, `process-execution`, `filesystem-access-extension`, `srfi-27-install` and `emit-packages-pinned` suites. Verify that all pass and that preflight's validation stage is satisfied or owed only to CI.

## Workflow follow-up

- Before merging the 0.13.0 pull request, emit-packages must have a protected `main` that requires the "Package checks" status, and `checks.yml` must have a Linux job.
- After the release, update the emit-packages README so `emit pkg install` is the primary install path and linking is the hand-managed alternative.
- Finish with the `emit-finish-change` skill: sync the specs, archive, and open the pull request.
