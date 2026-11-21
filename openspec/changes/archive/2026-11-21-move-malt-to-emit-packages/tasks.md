# Tasks

## 1. Create the emit-packages repository

- [x] 1.1 Install `git-filter-repo` (`uv tool install git-filter-repo`). In a scratch clone of Emit, filter to the D5 path set and rename the paths into the `lib/malt/...` and `packages/malt/...` layout. Verify the result has Malt's six commits with sensible messages and a tree that differs from Emit's `lib/malt/` only by location; if not, fall back to a fresh first commit that records Emit's source commit, with `PROVENANCE.md` pointing at Emit's history.
- [x] 1.2 Confirm with the user, then create `bwbensonjr/emit-packages` on GitHub (using the `bwbensonjr` `gh` account) and push the history from 1.1. Verify `gh repo view bwbensonjr/emit-packages` succeeds and `git diff` of `lib/malt/` against Emit's current tree is empty.
- [x] 1.3 Add `packages/malt/package.scm` (name, version, minimum Emit `0.10.0`, license, provided libraries) and a top-level `README.md` that documents the layout, the `checks.scm` contract (D1), and the `EMIT_LIBRARY_PATH` install recipe. Verify by running the README recipe from an unrelated directory against an installed Emit 0.10.0: it imports `(malt learner)` and evaluates a gradient.
- [x] 1.4 Port the check programs to `packages/malt/tests/` as self-checking programs (core, training, the direct/unprefixed/notation references, and XOR with its tolerance moved into Scheme per D2), each ending in a completion datum, and declare them in `packages/malt/checks.scm`. Verify each program prints its expected completion line through `emit run` against Emit 0.10.0.
- [x] 1.5 Move the package-level checks that are not execution-path checks into the collection: the export-surface check (`malt-core-exports.py`, `export-map.json`) the provenance check (`check.py` without `--upstream`), the rejection of `ext1-∇`/`ext2-∇` imports, and the explicit `(scheme base)`/`(malt learner)` import conflict, all under `tools/test-packages.sh EMIT`. Verify all pass with no Racket on `PATH`.
- [x] 1.6 Write the collection's driver, which runs every declared check through `emit run`, `emit repl`, and `emit build` for a given `emit` binary, with roots `lib/` and the package's `tests/`, narrating per `docs/OUTPUT.md` conventions. Add CI that installs the latest Emit release and runs the driver plus 1.5's checks. Verify CI is green and record the commit as the first pin.

## 2. Add the pinned suite to Emit, with Malt still in tree

- [x] 2.1 Add `tools/emit-packages-pin.sh` with the full 40-hex SHA from 1.6 and the origin, in the pitch-pin `KEY="value"` form. Verify that both `bash` sourcing and a Python reader obtain the same values.
- [x] 2.2 Write Emit's driver (D1, D3): resolve `EMIT_PACKAGES_DIR` (unpinned), else the verified `build/emit-packages/<commit>/` cache, else a shallow fetch of the exact commit; verify `HEAD` against the pin; run each `checks.scm` entry through run, REPL, build, and the artifact path (publish every `package.scm` library with `emit lib`, run against them, require each reported as reused), and with `--source` through the Chez source driver. Verify all three cases in the `development-validation` delta: a good pin passes, a corrupted cache or wrong commit fails naming both commits, and an `EMIT_PACKAGES_DIR` run is labelled unpinned with its commit and dirty state.
- [x] 2.3 Verify offline behavior: with a populated cache and the network disabled (for example an unreachable origin override), the suite runs without fetching. Without a cache, it fails, naming the fetch error rather than passing.
- [x] 2.4 Register `emit-packages-pinned` (full) and `emit-packages-pinned-source` (reference, `chez: true`) in `tools/test-registry.json`, moving the coverage IDs of the seven `malt-*` entries onto them and onto `srfi-27-install` (D4). Verify `bash tools/test.sh --list` shows both, the coverage-inventory check reports no orphaned IDs, and `bash tools/test.sh --suite emit-packages-pinned` passes against the current tree.
- [x] 2.5 Split the SRFI 27 assertions out of `test/malt-install-tests.sh` into `test/srfi-27-install-tests.sh`, registered as `srfi-27-install`. Verify it passes against a staged installation from an unrelated directory, covering the `distribution` delta's three SRFI 27 scenarios.
- [x] 2.6 Document the pinned suite, the pin-move procedure, and `EMIT_PACKAGES_DIR` in `docs/DEVELOPMENT.md`. Verify the documented pin-move and local-checkout commands run as written.

## 3. Remove Malt from Emit

- [x] 3.1 Delete `lib/malt/` and its `LIBDIRS` and notice entries in the `Makefile`. Verify that a staged `make install` payload contains no `malt/` library directory, and that a program importing `(malt learner)` against it fails with the unresolved-library diagnostic from an unrelated directory, then succeeds with the pinned collection's `lib/` in `EMIT_LIBRARY_PATH`. Add both as a check in `test/srfi-27-install-tests.sh` or a sibling installed-payload test.
- [x] 3.2 Delete the seven `malt-*` registry entries, `test/malt-*`, and `test/malt-reference/`. Verify `bash tools/test.sh --list` no longer shows them, `git grep -n 'test/malt'` finds nothing outside `openspec/changes/archive/`, and the pinned suites still pass.
- [x] 3.3 Delete `demos/malt-xor.scm` and regenerate `test/module-scaffold-baseline.sha256` (D6). Verify the baseline diff is exactly one removed line (`malt-xor`), and that `demos/run-tests.sh` and the baseline harness pass.
- [x] 3.4 Delete `docs/MALT.md`, `docs/MALT-CORE.md`, and `docs/MALT-MEASUREMENTS.md`. Update `README.md`, `docs/MODULES.md`, `docs/CUSTOM-WRITERS.md`, `docs/RANDOM.md`, `docs/PERFORMANCE.md`, and `docs/PERFORMANCE-EVALUATION.md` to point at `bwbensonjr/emit-packages`, and add a note to the `docs/performance/writer-*` evidence that Malt now lives there. Verify `git grep -n 'MALT\(-CORE\|-MEASUREMENTS\)\?\.md'` finds no broken links outside archives.
- [x] 3.5 Update `openspec/explorations/malt-learner.md` with a status line recording the move. Verify `openspec validate --all` passes.
- [x] 3.6 Bump `VERSION` to `0.11.0` and add a nonempty `CHANGELOG.md` section that marks the removal as breaking and gives the `EMIT_LIBRARY_PATH` migration recipe. Verify the release metadata checks pass (`tools/release-handoff.sh preflight`).

## 4. Integration validation

- [x] 4.1 Run `bash tools/test.sh dev --changed main` and then `bash tools/test.sh full`, preserving reports. Run the reference suites `emit-packages-pinned-source` and `srfi-27-source` with Chez. Verify all pass; any red suite is either fixed or shown to be one of the known `#117` lli JIT failures. No `make regen` is needed, because no assembled compiler input changes (confirm with `bash tools/compiler-inputs.sh --list` against the diff).
- [x] 4.2 Run `make format-check` on edited covered Scheme sources (`tools/*.ss` if the driver is Scheme). Verify it is clean, or skipped because `pitch` is not on `PATH`.

## Workflow follow-up

- Finish the change with the `emit-finish-change` skill: sync the four spec deltas, then delete the now-empty `openspec/specs/malt-learner/` main spec (and confirm `openspec validate --all` and `openspec list --specs`). Archive with `--skip-specs` after a manual sync, and open the versioned pull request.
- After the merge releases 0.11.0, open the first `emit-packages` change: the differentiable `= < <= > >=` exports matching upstream `main.rkt`.
- Scaffold the follow-on change `user-library-root`.
