# Tasks

## 1. Option and link line (`src/emit.cpp`)

- [x] 1.1 Parse `--static-gc` in `emit_build` for both manifest-program and direct-source builds, and reject it with `--stdlib` like the other build options; verify `emit build --static-gc --stdlib` is a usage error and `emit build --bogus` still reports an unknown option.
- [x] 1.2 Document `--static-gc` in `usage_build`; verify `emit build --help` lists it with a one-line description.
- [x] 1.3 Give `link_clang` a static-GC parameter that replaces `-lgc` with the absolute `$GC_LIB/libgc.a` path and appends `-lpthread` on Linux (design D1, D5), leaving the default link line byte-identical; verify by `-v` output or a clang `-###` probe that the default line is unchanged.
- [x] 1.4 Before linking, check that `$GC_LIB/libgc.a` is a readable regular file when `--static-gc` is set; otherwise print the diagnostic naming the path and the `GC_LIB` fix, write nothing, and exit non-zero (design D4); verify with `GC_LIB` pointed at a directory holding only the shared library.
- [x] 1.5 Narrate the link mode at default verbosity (`link libgc static <path>` or `link libgc shared`), silent under `EMIT_VERBOSITY=quiet`, per `docs/OUTPUT.md`; verify by building `hello.scm` both ways at default and quiet verbosity.

## 2. Doctor (`src/emit.cpp`)

- [x] 2.1 Add the informational `libgc static archive: PATH [available|unavailable]` line to `emit_doctor` without counting absence as a failed check (design D6); verify `emit doctor` exits zero with Homebrew `bdw-gc` and also with `GC_LIB` pointed at a shared-only directory.

## 3. Tests

- [x] 3.1 Add a `--static-gc` case to `test/project-command-tests.sh` that builds a small program, asserts `otool -L` (Darwin) or `readelf -d` (Linux) names no libgc, and compares its output with the default build; when `$GC_LIB/libgc.a` is absent it prints a skip naming the path. Verify it passes locally on macOS.
- [x] 3.2 Add a case that runs the static executable with libgc made unfindable (for example a copy of the binary run with the libgc directory absent from every loader search path, or in a minimal container on Linux), proving it starts without libgc; verify it passes locally.
- [x] 3.3 Add a case for the missing-archive diagnostic (shared-only `GC_LIB`), asserting non-zero exit, the named path in stderr, and no output file; verify it passes locally.
- [x] 3.4 Add a manifest-program case (`emit build my-app --static-gc`) asserting the executable lands at the entry's output path with no libgc dependency; verify it passes locally.

## 4. CI toolchain

- [x] 4.1 In `tools/ci-provision.sh`, add a second libgc 8.2.8 configure/build/install with `-DBUILD_SHARED_LIBS=OFF` into the same `$prefix/gc` so `libgc.a` sits beside the shared library, add a verification step that links a probe against the archive, and bump the toolchain identity from `recipe-6` to `recipe-7`; verify the provision script runs to completion and the cache key changes.
- [x] 4.2 Confirm the new test cases run (not skip) on the Linux and macOS CI cells; if the Linux link needs libraries beyond `-lpthread`, add them to the D5 list and record the answer in `design.md`'s Open Questions.

## 5. Documentation and release

- [x] 5.1 Document `--static-gc` in `docs/PROJECTS.md` (building executables: what it removes, the ~145 KB cost, how to check with `otool -L`/`ldd`, libgc's license notice for redistribution) and the archive location in `docs/TOOLCHAIN.md`, including which channels ship `libgc.a`; verify links and examples by running them.
- [x] 5.2 Bump `VERSION` from `0.4.0` to `0.5.0` and add a matching nonempty `CHANGELOG.md` section describing the option; verify `cat VERSION` and the changelog header agree.

## 6. Validation

- [x] 6.1 Run `make` and the classified native checks for a host change (`bash tools/test.sh dev --changed main`, plus `test/project-command-tests.sh` in full); no `make regen` is needed because no compiler input changed, which `bash tools/compiler-inputs.sh --list` confirms. Verify all pass, or record any known-red suites as pre-existing.
- [x] 6.2 Run `make format-check` (no Scheme sources should change) and `openspec validate static-gc-link --strict`; verify both pass.

## Workflow follow-up

- Archive the change with `/opsx:archive` after merge.
- Consider a later change for a `(program …)` manifest clause selecting the link mode, and for making static the default once every channel ships `libgc.a`.
