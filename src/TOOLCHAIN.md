# Toolchain (core-lambda-slice)

Recorded during implementation (design task 1.2).

| tool | pinned (LLVM.md) | actual on this machine | note |
|------|------------------|------------------------|------|
| Chez Scheme | host | 10.4.1 | |
| clang / LLVM | 22.x | Apple clang 21.0.0 (LLVM ~21) | see below |
| libgc (Boehm) | any | 8.2.12 (`/opt/homebrew`) | headers `gc/gc.h` |
| llc | — | not installed | not needed; `clang foo.ll` compiles IR directly |

## Deviation: clang 21, not the pinned LLVM 22

The walking skeleton is built against Apple clang 21, not the LLVM 22 pin in
`LLVM.md`. Functionally adequate for M1: opaque pointers (default since LLVM 15),
`tailcc`, and `musttail` are all present, and a toolchain probe linked and ran
correctly. The pin is a "phase" concern; revisit before relying on any
LLVM-22-specific IR feature.

## Build a program

    clang -I/opt/homebrew/include -L/opt/homebrew/lib \
          src/runtime/runtime.c <program>.ll -lgc -o <program>
