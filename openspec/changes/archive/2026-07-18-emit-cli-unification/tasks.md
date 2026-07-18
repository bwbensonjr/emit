## 1. Merge the hosts into one `emit` binary (run/repl/build verbs)

- [x] 1.1 Refactor `src/run.cpp` and `src/repl/host.cpp` so their `main` bodies become internal entry functions (`emit_run(argc,argv)`, `emit_repl(argc,argv)`); dedup the shared helpers (`read_file`, `scm_str`, `status_of`, `add_ir`, JIT setup, `preload_user_libraries`) into one place.
- [x] 1.2 Add a unified `main` that dispatches `argv[1]`: `run` → emit_run, `repl` → emit_repl, `build` → the build pipeline (task 2), `lib` → the lib pipeline (task 3); unknown/missing verb → usage error naming the verbs, non-zero exit.
- [x] 1.3 Add a `Makefile` target building `build/emit` from the merged object(s) + `runtime-host.o` + `embed-repl.ll` + `scheme.base.ll` (the same IR both hosts link today). Keep the old `scheme-run`/`repl-host` targets temporarily (removed in phase 5).
- [x] 1.4 Verify `emit run` / `emit repl` behavior parity against the current binaries (run a program, an import chain, a cycle error; a REPL import+eval session).

## 2. `emit build` inside the binary (fork clang)

- [x] 2.1 Implement `emit build [NAME] [--manifest F] [-o OUT] [--no-prelude]`: resolve the program entry (mode 10), emit the program IR in-process (the `--emit` path), split units on the boundary marker, and `fork`/`exec` `clang` with the discovered toolchain flags to link runtime + units → native exe. Mirror `bin/scheme-compile`'s flags exactly.
- [x] 2.2 Single-source toolchain discovery: have the `emit` launcher export `CC`/`GC_INC`/`GC_LIB`/host-triple from `tools/llvm-env.sh` (or consult `--print-env`); the binary reads them from the environment.
- [x] 2.3 Narrate per `docs/OUTPUT.md` (program, resolved source, exe path + size; `EMIT_VERBOSITY`).
- [x] 2.4 Parity test: `emit build NAME` vs. emitting the resolved source's IR and linking it directly produce executables that run to the identical value.

## 3. `emit lib` — the compile-unit door (new mode)

- [x] 3.1 In `src/repl-core.ss`, add a dispatch mode (next free integer, 11) that returns a library source's readable export table text (`(NAME ((external . "mangled") …))`); document it in the mode-list comment. `make regen` and confirm byte-stability.
- [x] 3.2 Implement `emit lib SRC [-o DIR] [--manifest F]`: emit the lone unit `.ll` (the `--emit` path on a `define-library`) and write `<name>.ll` + `<name>.exports` under `DIR` (default `build/lib`), named by the library's `define-library` name. (Decide `.stamp` per design open question.)
- [x] 3.3 Test: `emit lib` writes `.ll` + `.exports`; the `.ll` is byte-identical to the unit the run/AOT doors emit for the same source; the `.exports` lists the exports.

## 4. Cutover: drive everything through `emit`

- [x] 4.1 `tools/regen.sh` and `tools/log.sh`: replace `scheme-run` invocations with `emit run` (`emit run --emit` for the IR path). Verify the self-hosting fixed point still converges and the trust-check passes (clean-tree `make regen` ⇒ empty `git diff bootstrap/`).
- [x] 4.2 Migrate every `test/*.sh`, `run-all-tests.sh`, `run-dev-tests.sh`, and `demos/*.sh` to `emit <verb>`; run the full Chez-free suite + the Chez-gated suites green.
- [x] 4.3 Update docs: `README.md`, `docs/MODULES.md`, `docs/OUTPUT.md`, `docs/PERFORMANCE.md`, `src/README.md`, `src/TOOLCHAIN.md` to `emit <verb>`.

## 5. Remove the old entry points

- [x] 5.1 Delete `bin/scheme-compile` and `bin/emit` (bash); drop the `scheme-run` / `repl-host` / `bin/scheme-compile` `Makefile` targets and any `src/repl/build-host.sh` / `src/run-boot.cpp` references no longer needed (keep `schemec`, the bootstrap seed).
- [x] 5.2 Acceptance grep-sweep: no non-archive file references `scheme-run`, `repl-host`, or `scheme-compile` except as historical notes; every door reachable only through `emit`.

## 6. Explorations note

- [x] 6.1 Update `openspec/explorations/packaging-and-emit-cli.md`: mark slice #1 landed (unified `emit` binary, four verbs, old names removed), and note the CLI-naming/back-compat question resolved as "rename now."
