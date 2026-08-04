## 1. Pin the defects with failing tests

- [x] 1.1 Add `test/project-door-tests.sh` that builds a throwaway project in a temp directory —
      one library importing `(scheme base)`, one library importing that library plus
      `(scheme inexact)`, a program, and a manifest naming **only** the project's own libraries and
      its `(program …)` entry — and asserts each door works there. Register it in
      `run-all-tests.sh` (Chez-free, default suite).
- [x] 1.2 In that suite, assert the two currently-failing cases so the suite fails before the fix:
      `emit repl` in the project directory resolves `map` and loads the project library, and
      `emit lib` on the library that imports `(scheme base)` writes both artifacts. Record the
      current failure text in a comment so the regression is recognizable.
- [x] 1.3 In that suite, assert the two cases that already pass — `emit run` and `emit build` +
      executing the delivered binary — so the fix cannot regress them.
- [x] 1.4 Add the double-load guard case: a second manifest that *does* name `(scheme base)` and
      `(emit internal)` (as the repository's own does), asserting the same session works and that
      exactly one module per baked member is added.

## 2. Compiler core: resolve a lone library's imports; mode 8's payload (IR-shaping)

All edits in this group are in `CORE_FLAT`, so they share ONE `make regen` (2.8) rather than one each.

- [x] 2.5 In `src/core.ss`, give `compile-library-form` an optional import-tables argument defaulting
      to `'()`, so its four existing callers are unchanged, and stop hardcoding `'()` in the body.
- [x] 2.6 In `compile-source-rehomed`'s lone-`define-library` branch (`src/core.ss:230`), compile the
      baked set for its export tables and resolve the library's declared imports against them, then
      pass those tables to `compile-library-form` — still emitting only the library's own module.
      Fixes `emit run --emit < lib.sld` for a library importing `(scheme base)`.
- [x] 2.7 In `src/repl-core.ss`, have mode 7's library branch and mode 11 resolve the library's
      declared imports through `repl-import-tables` instead of passing `'()`, and report an error
      naming the unresolved library when it returns `#f` — which is also the fix for a lone library's
      unresolvable import compiling silently.
- [x] 2.1 In `src/repl-core.ss`, change `run-register-baked-set` (mode 8) to return the members'
      initializer symbols newline-joined in the same order as the boundary-joined modules, replacing
      the single `(scheme base)` symbol kept "for protocol compatibility".
- [x] 2.2 Correct the stale comment on `repl-load-library-text`'s `already` branch — the REPL now
      double-loads by design and does see that status — and state that the guard covers every baked
      member by name.
- [x] 2.3 Confirm the run door is unaffected: it reads only `rt_car(rt_cdr(r))` (`src/emit.cpp:470`),
      so verify by inspection and by test that `emit run`/`emit build` emitted IR does not move.
- [x] 2.8 `make regen` once for the whole group, then re-record
      `test/module-scaffold-baseline.sha256` if it moves, with the delta explained in the commit
      message per that script's header protocol. Confirm `./run-dev-tests.sh` passes (self-host fixed
      point + trust-check) with `chez` available.

## 3. The REPL door registers and initializes the baked set

- [x] 3.1 In `emit_repl` (`src/emit.cpp`), after the JIT is created and `init-session` has run, call
      mode 8 when the prelude is enabled; split the returned IR on the boundary marker exactly as
      `compile_program` does, and `add_ir` each module.
- [x] 3.2 Run each member's initializer in the returned order, reusing the existing trap-guarded
      thunk helper (`run_init`), and report a failure as an error naming the member rather than
      continuing to the prompt (spec: "A failure to initialize the standard library is loud").
- [x] 3.3 Move `preload_libraries(manifest)` to run **after** registration, so a manifest entry for a
      baked member hits the `already` guard.
- [x] 3.4 Verify mode 6 (auto-import `(scheme base)`) now succeeds with no manifest entry, and that
      the "not loaded (missing from manifest?)" warning no longer fires in a project directory.
- [x] 3.5 Confirm `--no-prelude` skips registration entirely and still yields a bare session.
- [x] 3.6 Narrate the registered members at verbose verbosity only, per `docs/OUTPUT.md` (resolves
      design open question 2).

## 4. The `emit lib` door seeds its session before deriving either artifact

- [x] 4.1 Split `compile_program` (`src/emit.cpp`) into `seed_session` (init-session, mode 8 baked-set
      registration, `preload_user_libraries`) and `compile_unit` (mode 7), keeping the call order
      identical for `emit_run` and `emit_build` so their behavior and emitted IR are unchanged.
- [x] 4.2 Rewrite `emit_lib` to call `seed_session` once, then mode 11 (export table), then
      `compile_unit` — dropping its own `rt_repl_set(0, …)` init, which was discarding the seeding.
- [x] 4.3 Verify a library importing `(scheme base)`, a library importing another manifest library,
      and a library importing both compile to artifacts; and that an unresolvable import is reported
      with no artifact written.
- [x] 4.4 Verify `emit lib`'s unit `.ll` stays byte-identical to the unit the run and AOT doors emit
      for the same source, for an importing library as well as an import-free one (the `emit-cli`
      spec's one-compile-unit-core requirement).

## 5. Diagnostics name the door

- [x] 5.1 Drop the leaked `repl:` prefix from diagnostics the non-REPL doors print, so `emit lib`
      reports `emit lib: unbound variable map`. Strip it **host-side** in `src/emit.cpp` rather than
      changing the `(error 'repl …)` raise sites: the prefix comes from `error-object-message`, so
      editing the raise sites would be IR-shaping *and* would change the REPL's own output, which the
      `emit-cli` spec requires to stay as it is. Confirm the REPL's per-form error reporting is
      unchanged.

## 6. Verification and measurement

- [x] 6.1 Run `./run-all-tests.sh` — all suites green, including the new `project-door-tests.sh` and
      the existing `prelude-base-repl-tests.sh`, `modules-repl-tests.sh`, `repl-host-tests.sh`,
      `install-layout-tests.sh`, and `library-partition-tests.sh`.
- [x] 6.2 Run `./run-dev-tests.sh` with `chez` present — backend equivalence, the self-hosting fixed
      point, and the trust-check.
- [x] 6.3 Measure `emit repl` startup wall time before and after (prelude enabled, and
      `--no-prelude`), from inside the repo and from a project directory. Report the delta; if it is
      material, add a `docs/PERFORMANCE.md` entry rather than absorbing it (design D6).
- [x] 6.4 Confirm `make install` + an installed `emit repl` / `emit run` from an unrelated directory
      still work, and that an installed session no longer needs the installed manifest to have the
      standard library.

## 7. User documentation

- [x] 7.1 Write `docs/PROJECTS.md`: prerequisites (cloned checkout, LLVM + libgc, `make`), project
      layout, a first program with `emit run`, adding a library, the manifest (`library` and
      `program` entries, paths relative to the manifest), the `emit repl` development loop including
      importing your own library, `emit build` for a delivered executable, and `emit lib` for a
      single artifact.
- [x] 7.2 Document which names need which import — `(scheme base)` auto-imported, and
      `(scheme cxr)` / `(scheme read)` / `(scheme file)` / `(scheme inexact)` by explicit import —
      linking to `docs/MODULES.md` for the full surface rather than restating it.
- [x] 7.3 Document looking inside a compile (`--dump`, `--dump-all`) and the `EMIT_VERBOSITY`
      control, linking to `docs/OUTPUT.md`.
- [x] 7.4 Document the current limits a project will hit: no macro exports from a library,
      whole-library imports only (no `only`/`except`/`prefix`), no `include`/`cond-expand` (#18), a
      library using `define-record-type` must import `(scheme base)`, the bounded exact-integer
      range, and that `emit run` and a delivered executable both print the program's final value.
- [x] 7.5 Document that after this change the baked `(scheme base)` wins over a manifest entry, so a
      compiler developer editing `lib/scheme/base.sld` refreshes the REPL with `make regen`
      (design D5).
- [x] 7.6 Verify the document by making its example project the one `test/project-door-tests.sh`
      builds, so the commands and outputs it prints are the ones the suite asserts.
- [x] 7.7 Add the index line to `docs/README.md` and a pointer from `README.md`'s quick start.

## 8. Spec sync and housekeeping

- [x] 8.1 Remove `docs/MODULES.md`'s note that a hand-written manifest must also name
      `(emit internal)`, and its pointer to #39 as an open proposal; describe the baked set as
      registered on every door instead.
- [x] 8.2 Sync the delta specs into `openspec/specs/{module-system,emit-cli,interactive-repl}` and
      archive the change.
- [x] 8.3 Close **#39** referencing the fixing commit; note in the closing comment that the fix also
      covered `emit lib`, which the issue did not know about.
- [x] 8.4 File the deferred items found while walking the workflow, each with symptom, reproduction,
      cause, and a possible fix: the final-value print on a delivered executable; missing
      `emit --help`. Reference `homebrew-tap-distribution` for `--version` rather than filing it.
- [x] 8.5 Update `openspec/explorations/library-sources-and-artifacts.md` — the manifest/baked-set
      relationship it maps changes here, so add a LANDED note to Finding 1 recording that the
      "baked libraries are CWD-independent, manifest libraries are not" axis now holds on all four
      doors rather than only the run door.
