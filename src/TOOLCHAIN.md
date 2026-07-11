# Toolchain (core-lambda-slice)

Recorded during implementation (design task 1.2).

| tool | pinned (LLVM.md) | actual on this machine | note |
|------|------------------|------------------------|------|
| Chez Scheme | host | 10.4.1 | |
| clang / LLVM (AOT) | 22.x | Apple clang 21.0.0 (LLVM ~21) | AOT default; see below |
| LLVM 22 tools (JIT/bitcode) | 22.x | Homebrew `llvm@22` 22.1.4 | keg off PATH, see below |
| libgc (Boehm) | any | 8.2.12 (`/opt/homebrew`) | headers `gc/gc.h` |
| llc | — | not installed | not needed; `clang foo.ll` compiles IR directly |

## LLVM 22 keg for the JIT/bitcode backends

The JIT (`lli`) and bitcode (`llvm-as`) exits use the pinned **LLVM 22** tools from the
Homebrew keg at `/opt/homebrew/opt/llvm@22/bin/` (installed via `brew install llvm@22`).
The keg is intentionally *not* on `PATH`, so `src/compile.ss` drives these tools by
absolute path (`lli`, `llvm-as`, `llvm-link`, and the keg's `clang`). It fails with a
clear message if the keg is missing. `libgc` is loaded into `lli` via
`-load=/opt/homebrew/lib/libgc.dylib`. The AOT exit still uses the system (Apple) clang.

## Deviation: clang 21, not the pinned LLVM 22

The walking skeleton is built against Apple clang 21, not the LLVM 22 pin in
`LLVM.md`. Functionally adequate for M1: opaque pointers (default since LLVM 15),
`tailcc`, and `musttail` are all present, and a toolchain probe linked and ran
correctly. The pin is a "phase" concern; revisit before relying on any
LLVM-22-specific IR feature.

## Build / run a program (three backends)

    # AOT (default): native executable
    chez --libdirs src --script src/compile.ss <program>.scm -o <out>

    # Bitcode: writes <out>.bc (inspectable/opt-able) + a native exe from it
    chez --libdirs src --script src/compile.ss <program>.scm -o <out> --backend bitcode

    # JIT: llvm-link the runtime in, run in-process via lli (prints the value)
    chez --libdirs src --script src/compile.ss <program>.scm -o <out> --backend jit

Under the hood the AOT link is:

    clang -I/opt/homebrew/include -L/opt/homebrew/lib \
          src/runtime/runtime.c <program>.ll -lgc -o <program>

The 3-way equivalence harness (`demos/run-backends.sh`) runs every demo through all
three backends and asserts identical results.
