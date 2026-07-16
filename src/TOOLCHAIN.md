# Toolchain (core-lambda-slice)

Recorded during implementation (design task 1.2).

| tool | required | example on a machine | note |
|------|----------|----------------------|------|
| Chez Scheme | host | 10.4.1 | |
| clang / LLVM (AOT) | recent | Apple clang 21 / apt clang 22 | AOT default; see below |
| LLVM tools (JIT/bitcode) | LLVM 19+ | Homebrew `llvm` or apt `llvm-22` | discovered, see below |
| libgc (Boehm) | any | 8.2.x (`pkg-config bdw-gc`) | headers `gc.h` / `gc/gc.h` |
| llc | — | not installed | not needed; `clang foo.ll` compiles IR directly |

## Toolchain discovery for the JIT/bitcode backends

The toolchain is **discovered**, not pinned to a fixed path (change:
`allow-llvm-install-flexibility`). `tools/llvm-env.sh` is the single discovery
implementation: it locates the LLVM tools via `llvm-config` (`--bindir`) and libgc via
`pkg-config bdw-gc`, and it feeds every consumer — the `Makefile` (`--print-make`
fragment), the shell drivers (they source it), and `src/compile.ss` (which shells out to
`--print-env`, since a `chez --script` cannot source the layer).

The JIT (`lli`) and bitcode (`llvm-as`, `llvm-link`, `clang`) exits use those discovered
tools; `libgc` is loaded into `lli` via `-load=<libdir>/libgc.<ext>` where `<ext>` is
`.dylib` on macOS and `.so` elsewhere. The AOT exit prefers a system `clang` on `PATH`
(keeping the macOS Apple-clang default) and otherwise uses the discovered LLVM clang.

Discovery is overridable at every step: `LLVM_CONFIG` / `EMIT_LLVM_BIN` select the LLVM
tools, `CC` selects the AOT compiler, `GC_INC` / `GC_LIB` / `GC_DYLIB` select libgc, and
`EMIT_LLVM_MIN` (default 19) sets the warn-only version floor. `require-llvm-tools` fails
with a platform-neutral message (naming the `apt`/`brew` packages and `EMIT_LLVM_BIN`) if
a needed tool is missing.

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

Under the hood the AOT link is (paths come from discovery — `$CC`, `$GC_INC`, `$GC_LIB`):

    $CC -I$GC_INC -L$GC_LIB \
        src/runtime/runtime.c <program>.ll -lgc -o <program>

The 3-way equivalence harness (`demos/run-backends.sh`) runs every demo through all
three backends and asserts identical results.

## Interactive REPL: the persistent ORC/LLJIT host

The interactive REPL (change `interactive-repl`) executes entered forms in a long-lived
process built on **LLVM ORC v2 / LLJIT** (`src/repl/host.cpp`). It requires an LLVM
**development** install (headers + `llvm-config`) — the same one discovered by
`tools/llvm-env.sh` for the JIT/bitcode backends (Homebrew `llvm`, apt `llvm-NN`, etc.):

    make build/repl-host              # dependency-driven; rebuilds when sources change

The top-level `Makefile` owns the recipe (per-object rules for `runtime-host.o` and
`host.o`, each also depending on the `Makefile`), so the host is rebuilt whenever
`src/runtime/runtime.c`, `src/repl/host.cpp`, or the recipe changes — a stale host would
otherwise silently lack any `rt_*` added since it was last built, breaking the prelude.
`src/repl/build-host.sh` remains as a thin wrapper over `make build/repl-host`. Staleness
is by mtime, so a `git checkout`/`clone` that sets source mtimes behind an existing binary
may not trigger a rebuild; recover with `touch` on the source or `make clean`.

The build:

- compiles the C runtime (`src/runtime/runtime.c`) with `-DRT_NO_MAIN` so its standalone
  `main` is omitted (the host supplies its own);
- compiles `host.cpp` against `$(llvm-config --cxxflags)`;
- links with `$(llvm-config --ldflags --libs orcjit native --system-libs)` plus `-lgc`,
  and **`-rdynamic`** so the JIT resolves `rt_*` / GC symbols from the host process via
  `DynamicLibrarySearchGenerator::GetForCurrentProcess`.

The host reads a simple wire protocol on stdin — `"<entry-symbol> <byte-count>\n"` then
that many bytes of IR — adds each form's module to the running JIT, looks up its
`@__repl_N` thunk, calls it, and prints the value with `rt_write` (or `!<error>` on a
compile/JIT failure or a runtime trap). Runtime traps (e.g. arity errors) `longjmp` back
to the host loop via the `rt_trap` hook in `runtime.c`, so the session survives; when
`rt_trap` is null (the standalone executables) a trap still `exit(1)`s as before.

Drive it with the batch frame generator (a stand-in for the Group 5 interactive driver):

    chez --libdirs src --script test/repl-frames.ss <session>.scm | build/repl-host

End-to-end host tests: `test/repl-host-tests.sh`.
