# Tasks

## 1. Fix cancellation status observation (#146)

- [x] 1.1 Replace the status-file existence/read pair in `test/test-runner-tests.py` with a guarded read that accepts `FileNotFoundError` and `ProcessLookupError` as disappearance on procfs hosts; preserve zombie tolerance, non-procfs liveness checks, and the live-child deadline. Verify the existing cancellation test passes on Linux with GNU timeout.
- [x] 1.2 Exercise the disappearing-status branch deterministically and verify a live descendant still causes failure; run `python3 test/test-runner-tests.py` and retain its result, without increasing timeouts or swallowing unrelated errors.

## 2. Correct Apple clang diagnostics (#139)

- [x] 2.1 Classify Apple clang before upstream clang in `src/emit.cpp` doctor reporting, show compatibility as unverified, and preserve effective-toolchain precedence and independent failures. Extend `test/doctor-tests.sh` with Apple, older upstream, compatible upstream, unavailable compiler, and Apple-plus-missing-dependency cases; verify with `bash tools/test.sh --suite installation-diagnostics`.
- [x] 2.2 Document the unverified Apple status in the existing doctor/toolchain documentation in `README.md`; verify doctor remains read-only with identical report stdout at every verbosity and the documented real macOS discovery scenario succeeds when prerequisites are present.

## 3. Add explicit standard-library precompilation (#148)

- [x] 3.1 Add `emit build --stdlib` parsing and help in `src/emit.cpp`, selecting the invoked binary's shipped manifest independently of project configuration. Extend `test/emit-cli-tests.sh` for help, argument conflicts, no stdin consumption, and no executable output; verify `bash tools/test.sh --suite cli-interface-help-final-value`.
- [x] 3.2 Refactor shared baked/unit registration as needed to prepare the complete shipped manifest in dependency order without invoking runtime initializers. Add isolated-cache coverage for an out-of-tree invocation, ambient project conflicts, included-source invalidation, and unreadable/failed units; verify the warm command prepares compile-time interfaces and library initialization effects remain deferred.
- [x] 3.3 Use the existing default-profile JIT and native object adapter to materialize all prepared library modules by symbol lookup without calling the symbols. Extend `test/native-object-cache-tests.sh` to verify first-use object generation, second-process reuse without generation, profile mismatch, and no initialization effects; run `bash tools/test.sh --suite native-object-cache`.
- [x] 3.4 Expose or verify cache persistence results for explicit warming while retaining ordinary best-effort fallback. Extend cache coverage for unwritable locations, incomplete/interrupted entries, repeated warming, and read-only prefixes; verify the explicit command fails when artifacts do not persist and ordinary run/REPL still succeed through fallback.
- [x] 3.5 Add concise start/completion narration with destination, counts, bytes, and duration; document `emit build --stdlib`, `EMIT_CACHE`, platform cache defaults, and default-profile scope in `README.md` and `docs/OUTPUT.md`. Verify quiet/default/verbose preserve empty warm-command stdout and run `bash tools/test.sh --suite artifact-cache-baked-set` plus the CLI suite.

## 4. Integrate installation warming (#148)

- [x] 4.1 Add `WARM_STDLIB` and a final best-effort warm hook to `Makefile` after the installed toolchain pin. Add isolated unprivileged-prefix tests verifying the installed binary prepares its own payload, first-use reuse, repeat-install reuse, and warning/retry behavior on a warm failure; run the installed-layout suite with a private `EMIT_CACHE`.
- [x] 4.2 Preserve payload-only installation for `DESTDIR`, root, and `WARM_STDLIB=0`, with a visible reason and end-user command. Update the old no-cache-on-install assertions in `test/install-layout-tests.sh` to name the deferred case; verify staging never executes the staged binary, no unexpected user cache is touched, and ordinary source execution still works.
- [x] 4.3 Disable build-stage warming in `packaging/homebrew/emit.rb.in`, `packaging/nix/emit.nix`, and `packaging/oci/Containerfile`; add Homebrew's best-effort post-install invocation. Extend existing channel render/policy checks to verify these hooks, including bottle post-install behavior and Nix/OCI deferral; document the per-user step and opt-out alongside existing installation instructions.
- [x] 4.4 Run `bash tools/test.sh --suite installed-layout-libraries-support-files` and the classified package/channel checks; verify relocation, toolchain pins, prefix idempotence, and install payload ownership still pass with warming enabled and deferred.

## 5. Aggregate default REPL startup narration (#149)

- [x] 5.1 Add a startup-scoped resolver summary in `src/emit.cpp` from ordered deduplicated effective manifests and roots; move startup-only manifest, chained-provider, and per-library detail to verbose. Extend REPL/resolver assertions for one default summary, verbose details, quiet suppression, baked-only startup, chained providers, and visible failures; verify banner/prompt and ordinary command/import narration retain their behavior.
- [x] 5.2 Update `docs/OUTPUT.md` library-resolution examples for the startup exception; verify identical program/session output across verbosity levels and run `bash tools/test.sh --suite repl-interactive-repl-native`, `--suite cli-interface-help-final-value`, and the relevant classified resolver checks.

## 6. Preserve top-level source order (#140)

- [x] 6.1 Add fresh ignored bindings for non-final program expressions in `src/parse.ss` at their source positions, preserving record expansion positions and both normal/duplicate-name `build-program` lowering. Add current-source regression cases for the issue's mutation and parameter examples, effects before any definition, duplicate definitions, mutual procedures, final values, exceptions, discarded values, and internal-body rejection; verify with `bash tools/test.sh units` before regeneration.
- [x] 6.2 Add shared end-to-end fixtures for `emit run`, `emit build` executables, REPL forms, and Chez-driven source compilation, including the SRFI 64 runner-current idiom. Register focused coverage in `tools/test-registry.json` where needed; verify expected values `2` and `5`, exact effect order, and stable error behavior without accepting stale native results for edited source.
- [x] 6.3 Document the ordered top-level behavior alongside existing language/compiler documentation. Format changed covered Scheme files using the pinned formatter and check the resulting diff; finish all compiler/assembly input edits before `make regen`, keeping any unrelated whole-set formatting change separate.

## 7. Cross the regeneration barrier and accept the integrated change

- [x] 7.1 Run explicit `make regen` to convergence after compiler inputs are final, retain its report and fingerprint, and do not edit compiler inputs again during acceptance. Verify every declared bootstrap module is produced; a failed/interrupted regen must be completed before native acceptance.
- [ ] 7.2 Run `bash tools/test.sh full`, `bash tools/test.sh units`, the classified targeted reference suites for the changed compiler/host/module inputs, and `bash tools/test.sh source`. Preserve suite IDs/reports and poll long-running suites; verify all pass, including isolated source consistency, without substituting fingerprint status for source proof.
- [ ] 7.3 Confirm the five issue reproductions now meet their scenarios and record cold first-use versus warm first-use durations, portable/native reuse counts, and startup stderr for quiet/default/verbose using isolated caches. Verify the measurements show precompilation reuse without claiming all startup cost is eliminated.
- [ ] 7.4 Run `openspec validate fix-recent-correctness-and-startup-issues --strict` and review the implementation diff against all five issue links; verify each issue has acceptance evidence and each fixing commit references its corresponding `Fixes #N`.

## Workflow follow-up

- Review and archive the change only after implementation and all acceptance tasks are complete.
- Leave the GitHub issues open during proposal review; close them through the validated fixing commits.
