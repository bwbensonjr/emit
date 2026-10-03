# Tasks

## 1. Content-sensitive build configuration

- [ ] 1.1 Make `build/llvm.mk` re-evaluate shared toolchain discovery on each Make invocation and
  replace the include only when its content changes; verify a focused test observes one refresh for
  changed discovery and no restart loop or timestamp change for identical discovery.
- [ ] 1.2 Generate an atomic, content-sensitive signature of every effective variable used by the
  native compile/link recipes and baked defaults; verify the test covers compiler, LLVM, libgc,
  flags, and `PREFIX`, while excluding `DESTDIR`.
- [ ] 1.3 Add the signature as a prerequisite of all affected native objects and binaries, with no
  dependency from committed bootstrap IR; verify a changed controlled input rebuilds the affected
  targets and an unchanged input produces no compile or link commands.
- [ ] 1.4 Update the Makefile and toolchain documentation/comments to explain discovery refresh,
  signature ownership, and the distinction from `make regen`; verify the documented no-op and
  changed-configuration commands match the focused test.

## 2. Install integration

- [ ] 2.1 Extend `test/install-layout-tests.sh` so changing `PREFIX` with an existing build proves
  `emit.o` is rebuilt and the installed binary uses the new compiled-in fallback; verify the staged
  binary resolves that prefix from an unrelated directory without its executable-relative support
  tree.
- [ ] 2.2 Cover `DESTDIR` and repeated installation explicitly: verify changing only `DESTDIR` does
  not recompile or relink, while a second identical install remains successful and incremental.
- [ ] 2.3 Add a controlled toolchain-identity transition that exercises the real Make dependency
  graph without requiring two LLVM majors; verify `make install` relinks before copying and the
  resulting installed REPL evaluates a trivial form.

## 3. Integration verification

- [ ] 3.1 Run the focused toolchain and installed-layout tests, including the no-change Make case,
  and verify all cases pass on the available macOS Make implementation.
- [ ] 3.2 Run `./run-all-tests.sh` and `./run-dev-tests.sh`; verify both suites pass and
  `git diff bootstrap/` remains empty, confirming that the native-build fix did not cross the
  regeneration barrier.
