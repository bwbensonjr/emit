# Proposal

## Why

Every executable `emit build` delivers links Boehm libgc dynamically (`link_clang` in
`src/emit.cpp` passes `-L$GC_LIB -lgc`), so it records an absolute load path such as
`/opt/homebrew/opt/bdw-gc/lib/libgc.1.dylib` and fails to start on any machine that lacks that
exact libgc install. That undercuts the project's goal that standalone, self-contained native
executables are a first-class deliverable: today a "standalone" Emit program still needs its
recipient to install bdw-gc. Linking libgc's static archive removes that runtime dependency at a
measured cost of about 145 KB per executable on macOS arm64 (a trivial libgc program goes from
33,520 to 178,976 bytes, and `otool -L` then lists only `libSystem`).

## What Changes

- `emit build` gains a `--static-gc` option that links libgc's static archive (`libgc.a`) into the
  delivered executable instead of the shared library, so the executable has no runtime dependency
  on libgc.
- The default stays the shared link; the option is opt-in, so existing builds, sizes, and tests are
  unchanged.
- The static archive is located beside the shared library, in the libgc library directory the
  existing toolchain discovery already resolves (`GC_LIB`); no new discovery layer or override
  variable.
- When `--static-gc` is requested and no `libgc.a` is present, `emit build` fails before linking
  with a diagnostic naming the path it looked for and how to fix it (install a libgc that ships the
  archive, or point `GC_LIB` at one); it never falls back silently to a dynamic link.
- `emit build` narration states which libgc link mode it used, so the delivered artifact's
  dependency shape is visible.
- `emit doctor` reports whether a static libgc archive is available, as information, without
  failing when it is absent.
- `emit build --help` documents the option.

Non-goals: linking libc, libm, or the platform runtime statically (macOS does not support a fully
static executable); linking the `emit` compiler binary itself statically against libgc (it also
depends on LLVM's shared libraries, so removing libgc alone would not make it relocatable); a
`(program …)` manifest clause selecting the link mode (the manifest grammar lives in the embedded
compiler, so that would be a compiler-source edit and a `make regen` barrier; it can follow
separately); changing the JIT (`emit run`, `emit repl`), which loads libgc into the host process.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `project-build`: `emit build` gains an opt-in static libgc link mode, its failure behavior when
  the archive is absent, and narration of the link mode used.
- `emit-cli`: `emit doctor` additionally reports static libgc archive availability without treating
  its absence as a failure.

## Impact

- `src/emit.cpp`: `emit_build` option parsing and `usage_build`; `link_clang` link line; the
  missing-archive diagnostic; `emit_doctor` reporting. Native host C++ only, reached through plain
  `make`; no compiler-source, prelude, or bootstrap IR change, so no `make regen`.
- Linux link line may need `-lpthread` after the archive (libgc is built threaded); macOS needs
  nothing extra.
- Tests: a `--static-gc` case in the `emit build` project tests that inspects the delivered binary
  with `otool -L` / `ldd`, skipping with a stated reason when the toolchain has no `libgc.a`.
- CI: `tools/ci-provision.sh` builds libgc with `-DBUILD_SHARED_LIBS=ON` only, so the private CI
  toolchain has no archive; the static case needs either a second static libgc build in that prefix
  or an explicit skip there. Homebrew `bdw-gc` and Debian `libgc-dev` ship `libgc.a`; nixpkgs
  `boehmgc` may not.
- Docs: `docs/PROJECTS.md` (building executables), `docs/TOOLCHAIN.md` (archive location), and
  `CHANGELOG.md` with a minor `VERSION` bump (new feature).
