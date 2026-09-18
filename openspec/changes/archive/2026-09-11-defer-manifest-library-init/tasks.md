## 1. Baseline

- [x] 1.1 Record the before numbers for this repository's manifest — `emit repl` best-of-five wall
      clock, and the `repl -> session` line's transform/materialize under
      `EMIT_VERBOSITY=verbose` — so the change has a measured delta to claim and not an estimate.
      Verify by writing them into the change directory (a short `measurements.md`, as
      `cross-unit-variadic-direct-calls` did).
- [x] 1.2 Capture the observability baseline the change must preserve: session narration at
      default and verbose verbosity, `--dump` and `--dump-all` output for a session, and the
      stdout bytes of a scripted session. Verify by saving them as fixtures the later tasks diff
      against.

## 2. Core: the import arm resolves an init order (`src/repl-core.ss`)

- [x] 2.1 Change mode 3's `import-form?` arm to resolve the imported names through
      `run-closure-order` and return `(import . <newline-joined __init symbols>)` instead of
      `(import . "")`, and to **not** call `repl-import!`. Verify with a Chez-driver session
      (`chez --libdirs src --script src/compile.ss`) that an `(import (L))` returns the expected
      symbol list in dependency order for a two-library chain.
- [x] 2.2 Keep the unresolved-import error behavior: a name that is not a registered unit SHALL
      still error as "imported library not loaded" before any init symbol is returned. Verify the
      existing diagnostic is byte-identical for `(import (bad))`.
- [x] 2.3 Generalize mode 6 to take a library name in `repl-input`, empty input keeping its
      present meaning of `(scheme base)`. Verify the auto-import path is unchanged by the existing
      `test/prelude-base-repl-tests.sh`, and that mode 6 with a name merges that library's
      exports, macros and call rows.
- [x] 2.4 Confirm no other mode's payload shape changed, so `emit run`, `emit build` and `emit lib`
      are untouched. Verify with `test/modules-run-tests.sh` and `test/unit-pipeline-tests.sh`.

## 3. Host: defer the init and run it at the import (`src/emit.cpp`)

- [x] 3.1 Stop `preload_libraries` calling `run_init`; keep the read/cache-load/`add_ir` path and
      the startup narration exactly as they are. Verify a session still reports every registered
      manifest library at verbose verbosity, matching the 1.2 fixture.
- [x] 3.2 Add the host-side initialized set (D3: host state, not session state) and a helper that
      runs a newline-joined init list in order, skipping symbols already run. Verify a library
      imported from two separate forms initializes once, using a library whose body has an
      observable effect.
- [x] 3.3 Wire `process_form`'s `import` arm: run the returned inits, then call mode 6 with the
      library name to merge. Verify that a form importing a manifest library and then calling one
      of its procedures returns the same value as it does today.
- [x] 3.4 Report an init failure as an error naming the library, leave the names unbound (the
      merge in 3.3 never happens), and keep the session at the prompt. Verify with a library whose
      top-level body raises.
- [x] 3.5 Add the verbose narration for a deferred init per `docs/OUTPUT.md`, and settle the
      design's open question (name the imported library only, or the whole closure) when writing
      it. Verify the line is absent at default and quiet verbosity and never on stdout.

## 4. Tests

- [x] 4.1 Extend `test/modules-repl-tests.sh` with the spec's import-time cases: an unimported
      library is never initialized; an import initializes the library and its closure before its
      names are usable; a second import does not re-initialize; a failed init binds no names.
      Verify the suite passes.
- [x] 4.2 Add the path-agreement case: a session importing a library chain and a program importing
      the same chain initialize in the same order. Verify by comparing the orders the two paths
      report, so a future divergence fails rather than going unnoticed (design D4).
- [x] 4.3 Add the startup-cost case from the spec — the same manifest with and without an outsized
      library start in the same order of time. Verify it is written to compare orders of magnitude,
      not a fixed threshold, so it does not become a flaky timing test.
- [x] 4.4 Check the observability surface against the 1.2 fixtures: `test/dump-stages-tests.sh`,
      `test/dump-parity-tests.sh`, `test/repl-host-tests.sh` and `test/jit-optimization-tests.sh`
      pass, and the scripted session's stdout is byte-identical. This is the P3 lesson made a task.

## 5. Barrier crossing and integration

- [x] 5.1 Finish every `src/repl-core.ss` edit before starting the barrier, then run `make regen`
      and verify it converges (expect iteration 2, ~5 min, 5 self-compiles, after a
      compiler-source edit).
- [x] 5.2 Run `./run-all-tests.sh` and verify all suites pass.
- [x] 5.3 Run `./run-dev-tests.sh` and verify all suites pass, including `test/trust-check.sh`
      after committing (it `[SKIP]`s while `bootstrap/` is dirty, by design).
- [x] 5.4 Run `make format-check` (or `make format`) over the covered set and verify the
      hand-authored sources are clean; `src/emit.cpp` is C++ and outside it.

## 6. Record the outcome

- [x] 6.1 Re-measure with the 1.1 method and verify the startup delta against this repository's
      manifest, expecting `emit repl` to drop from ~2.21 s to roughly the ~0.4 s that registration
      without initialization costs.
- [x] 6.2 Update `docs/PERFORMANCE.md` P23: tick fix 1 with the measured before/after, and
      re-rate what remains (fix 2, the object-code cache, and fix 3, shrinking `(scheme char)`'s
      IR) now that the eager init is gone. Verify the entry names its OpenSpec change.
- [x] 6.3 Sync the delta into `openspec/specs/interactive-repl/spec.md` and archive the change.
      Synced and verified: the two ADDED requirements and the MODIFIED one are present with all
      their scenarios, and `openspec validate --specs` passes 27/27. Committed as 2f7bcdd, after
      which `test/trust-check.sh` reported "committed IR is exactly what the current source
      regenerates".
