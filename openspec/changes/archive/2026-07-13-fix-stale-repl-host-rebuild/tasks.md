## 1. Dependency-driven host build

- [x] 1.1 Confirm no caller passes a custom `OUT` to `src/repl/build-host.sh` (decides whether the script is retired or kept as a wrapper). — No caller passes `OUT`; kept as a thin wrapper over the Make target.
- [x] 1.2 Add a Makefile (top-level or `build/Makefile`) with a `build/repl-host` target depending on `build/host.o` and `build/runtime-host.o`.
- [x] 1.3 Add per-object rules: `build/runtime-host.o: src/runtime/runtime.c`, `build/host.o: src/repl/host.cpp`, each also depending on the Makefile so a recipe/flag change forces a rebuild.
- [x] 1.4 Port the exact compile/link commands from `build-host.sh` (LLVM@22 clang/clang++, `-DRT_NO_MAIN`, `llvm-config` flags, `-rdynamic`, libgc) into the rules.
- [x] 1.5 Either retire `build-host.sh` or reduce it to a thin wrapper that invokes the Make target (per 1.1). — Kept as a thin `exec make build/repl-host` wrapper.

## 2. Route callers through the freshness-aware build

- [x] 2.1 In `src/compile.ss`, change `ensure-host` to invoke the Make target on every REPL launch (via `system`), erroring on non-zero exit, instead of gating on `(file-exists? repl-host-path)`. — make output routed to stderr (`1>&2`) so it never pollutes the REPL's stdout value framing.
- [x] 2.2 In `test/repl-interactive-tests.sh`, replace the `[ ! -x build/repl-host ]` gate with an unconditional call to the Make target.
- [x] 2.3 Apply the same change to `test/repl-equiv-tests.sh` and `test/repl-host-tests.sh`. — `test/repl-batch-tests.sh` was in the original list but uses `test/repl-batch.ss` (recompile-all via clang), NOT `build/repl-host`, so it needs no change.

## 3. Verification

- [x] 3.1 From a clean tree (`make clean`), build via the target and confirm a working host is produced.
- [x] 3.2 Reproduce the original failure: `touch src/runtime/runtime.c`, and confirm the next REPL/test run rebuilds before evaluating (no `Failed to materialize symbols`). Live REPL `(map ...)` returned `(1 4 9 16)`; `make -q` reported stale (exit 1) after touch.
- [x] 3.3 Confirm an up-to-date binary triggers no recompilation (`make -q` exit 0 / "up to date").
- [x] 3.4 Run `./test/repl-interactive-tests.sh` and `./test/repl-equiv-tests.sh`; confirmed `library-map`, `in-language-reader`, and `prelude` pass (12/0 and 14/0), including when the host started stale.
- [x] 3.5 Run `./run-all-tests.sh`; all 7 suites pass.

## 4. Documentation

- [x] 4.1 Note the accepted mtime caveat (checkout/clone can set source mtimes behind an existing binary) near the build recipe or in `src/repl/`/`build/` docs. — Documented in the `Makefile` header and `src/TOOLCHAIN.md`.
- [x] 4.2 Update any references to `build-host.sh` (e.g. `run-all-tests.sh` header, `src/repl/` notes) to point at the new build entry point. — Updated `README.md`, `src/README.md`, `src/TOOLCHAIN.md`. (`run-all-tests.sh` does not reference `build-host.sh`.)
