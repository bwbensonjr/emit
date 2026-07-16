## Why

The toolchain is hardwired to one install layout — macOS Homebrew with LLVM keg-pinned to
`llvm@22` and libgc under `/opt/homebrew`. The same five values (`llvm-bin`, `clang`, `clang++`,
`gc-inc`, `gc-lib`) are duplicated across four locations, none env-driven in the Chez driver, so
the project does not build on a stock Linux/apt install (LLVM 22 at `/usr/lib/llvm-22`, libgc via
`pkg-config bdw-gc`) or any non-Homebrew layout. There is also a real portability bug — the JIT
exit hardcodes `libgc.dylib`, which does not exist on Linux — and the AOT path shells out to a bare
`clang` that need not be on PATH. A developer with a perfectly good, discoverable LLVM cannot use it.

## What Changes

- Add a single shared discovery layer (`tools/llvm-env.sh`) that locates the LLVM toolchain via
  `llvm-config` and libgc via `pkg-config bdw-gc`, derives the shared-library extension
  (`.so`/`.dylib`) from the platform, and lets explicit environment overrides win at every step.
- Loosen the version requirement from a hard `llvm@22` pin to **any recent LLVM** — a documented
  soft floor (default 19; overridable) that warns (never fails) below it, with no upper bound.
- Route all four toolchain consumers through the shared layer, removing the duplicated
  Homebrew-only defaults: `Makefile`, `bin/scheme-compile`, `tools/regen.sh`, and `src/compile.ss`
  (which reads the layer's exported `EMIT_LLVM_*` vars with a `llvm-config`/`pkg-config` self-probe
  fallback so `chez --script` still works standalone).
- Fix the `libgc.dylib` JIT bug and the bare-`clang` AOT assumption so all three backends
  (AOT, JIT, bitcode) work on a machine where the toolchain is discoverable but not at the
  Homebrew paths and not on PATH.
- Replace the macOS-only "install with: brew install llvm@22" error text with a platform-neutral
  message naming the `apt`/`brew` options and the override variable.
- Update docs (`README.md`, `src/TOOLCHAIN.md`, `LLVM.md`) to describe discovery and both install paths.

## Capabilities

### New Capabilities
- `toolchain-discovery`: How emit locates its build/runtime toolchain — the LLVM tools (`clang`,
  `clang++`, `lli`, `llvm-as`, `llvm-link`, `llvm-config`) and Boehm libgc — across install layouts
  (apt, Intel/ARM Homebrew, Nix, custom), with environment overrides taking precedence, a
  version floor rather than an exact pin, a platform-correct shared-library extension, a single
  discovery implementation shared by every consumer, and discovery narration on stderr.

### Modified Capabilities
<!-- None. Tool location and the LLVM version were never expressed as spec requirements or
     scenarios; they lived in prose, docs, and src/compile.ss constants. The IR dialect
     ("LLVM 22 syntax") in aot-codegen is unchanged by this change. -->

## Impact

- **New**: `tools/llvm-env.sh` (reuses `tools/log.sh` for narration).
- **Build/scripts**: `Makefile` (29-37), `bin/scheme-compile` (21-24), `tools/regen.sh` (30-35),
  `test/self-host-fixpoint.sh` (31-35), plus hardcoded test scripts `test/repl.ss` (27-28) and
  `test/repl-batch-tests.sh` (21).
- **Compiler driver**: `src/compile.ss` — `gc-inc`/`gc-lib` (45-46), host-target `clang` probe (54),
  `llvm-bin`/`tool`/`gc-dylib` (157-159), `require-llvm-tools` (163-170), AOT `link` (174), and the
  modular jit/bitcode backends (~405-438, 468-469) that reuse `tool`/`gc-dylib`.
- **Docs**: `README.md`, `src/TOOLCHAIN.md`, `LLVM.md`, `run-all-tests.sh` comment.
- **Dependencies**: no new runtime deps; relies on `llvm-config` and `pkg-config` (both already
  assumed present) for discovery. AOT prefers a `clang` on PATH and falls back to the discovered
  LLVM clang, so no `clang` on PATH is *required*. `spike/*/run.sh` are non-shipping and out of scope.
