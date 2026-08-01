# Toolchain

What you need to build and use Emit. The compiler is self-hosting and ships as
committed IR under `bootstrap/`, so **`make` needs only LLVM + libgc** — it links
that IR and never runs a Scheme host.

| tool | required | example on a machine | note |
|------|----------|----------------------|------|
| LLVM **development** install | LLVM 19+ (22 tested) | Homebrew `llvm`, apt `llvm-NN` | headers + `llvm-config`; ORC/LLJIT is linked into `build/emit` |
| libgc (Boehm) | any | 8.2.x (`pkg-config bdw-gc`) | headers `gc.h` / `gc/gc.h` |
| clang (AOT link) | recent | Apple clang 21 / apt clang 22 | a system `clang` is preferred; else the discovered LLVM one |
| Chez Scheme | **no** — verification only | 10.4.1 | `./run-dev-tests.sh` and `src/compile.ss`; auto-skipped when absent |
| llc | — | not installed | not needed; `clang foo.ll` compiles IR directly |

`./run-all-tests.sh` (the default suite) is Chez-free. `./run-dev-tests.sh` uses
Chez as an independent second host — the anti-stale trust-check, the fixed-point
re-derivation, and the reference the shipped `--dump` is checked against — and
exits 0 with a skip notice if `chez` is not on `PATH`.

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

Two different LLVMs are therefore normally in play at once — a system `clang` for
the AOT link, the discovered LLVM for the JIT/bitcode exits and the ORC host. That
is deliberate, not a version skew to fix: the emitted IR uses only opaque pointers
(default since LLVM 15), `fastcc`, and `musttail`, all long-settled, so either
consumes it.

## Build and run

    make                      # build/emit -- links committed IR, LLVM only, no Chez
    build/emit run prog.scm   # compile and run in process
    build/emit repl           # interactive REPL
    build/emit build NAME     # deliver a native executable
    build/emit lib SRC        # compile one library to its .ll + .exports artifact

Every verb also takes `--dump` / `--dump-all` (stage trace to stderr) and honours
`EMIT_VERBOSITY` (see `../docs/OUTPUT.md`).

The Chez driver reaches the same core and adds the three-backend exits plus the
tree-shaking AOT ship path:

    chez --libdirs src --script src/compile.ss prog.scm -o out                    # AOT
    chez --libdirs src --script src/compile.ss prog.scm -o out --backend bitcode  # .bc + exe
    chez --libdirs src --script src/compile.ss prog.scm -o out --backend jit      # lli

Under the hood the AOT link is (paths come from discovery — `$CC`, `$GC_INC`,
`$GC_LIB`; each imported library is a separate unit module):

    $CC -O2 -flto -Wno-override-module -I$GC_INC -L$GC_LIB \
        src/runtime/runtime.c <unit>.ll ... <program>.ll -lgc -o <program>

`-O2 -flto` is the **release profile** (changes: `aot-release-profile`,
`cross-unit-direct-calls`): LTO is what lets the optimizer act across unit
boundaries, which is what makes the emitter's cross-unit direct calls worth
emitting. The JIT/REPL door stays unoptimized. See `../docs/PERFORMANCE.md` P5.

The 3-way equivalence harness (`demos/run-backends.sh`) runs every demo through all
three backends and asserts identical results.

## Interactive REPL: the persistent ORC/LLJIT host

The `repl` verb executes entered forms in a long-lived process built on **LLVM ORC v2 /
LLJIT** (`src/emit.cpp`, changes `interactive-repl`, `emit-cli-unification`) — which is
why the LLVM *development* install in the table above is a hard requirement, not just a
convenience for the bitcode exits.

    make                              # (or `make emit`) builds build/emit

The top-level `Makefile` owns the recipe (per-object rules for `runtime-host.o` and
`emit.o`, each also depending on the `Makefile`), so the binary is rebuilt whenever
`src/runtime/runtime.c`, `src/emit.cpp`, or the recipe changes — a stale binary would
otherwise silently lack any `rt_*` added since it was last built, breaking the prelude.
Staleness is by mtime, so a `git checkout`/`clone` that sets source mtimes behind an existing
binary may not trigger a rebuild; recover with `touch` on the source or `make clean`.

Note what is **not** a prerequisite: the committed `bootstrap/*.ll` are checked-in
*inputs*, not build products, so editing a `.ss` source does not rebuild them. Use
`make regen` for that (design D4); `test/trust-check.sh` is the CI guard that catches a
compiler edit which forgot it.

The build:

- compiles the C runtime (`src/runtime/runtime.c`) with `-DRT_NO_MAIN` so its standalone
  `main` is omitted (the host supplies its own);
- compiles `emit.cpp` against `$(llvm-config --cxxflags)`;
- links with `$(llvm-config --ldflags --libs orcjit native --system-libs)` plus `-lgc`,
  and **`-rdynamic`** so the JIT resolves `rt_*` / GC symbols from the host process via
  `DynamicLibrarySearchGenerator::GetForCurrentProcess`.

The host does **no** compilation of its own and speaks no wire protocol: it links the
compiler's own compiled IR and calls into it in process over the runtime's REPL channel
(`rt_repl_set(mode, bytes, len)` then `scheme_entry()`; the modes are enumerated at
`repl-dispatch` in `src/repl-core.ss`, change `repl-embedded-incremental`). Per entered
form it asks mode 2 whether the buffer holds a complete datum, mode 3 to compile it, then
adds the returned module to the running JIT, looks up its `@__repl_N` thunk, calls it,
and prints the value with `rt_write` (or `!<error>` on a compile/JIT failure or a trap).

This is why the REPL and the batch compiler cannot drift: they are the same core, in the
same process, reached through different modes of one entry point.

Runtime traps (e.g. arity errors) `longjmp` back to the host loop via the `rt_trap` hook
in `runtime.c`, so the session survives; when `rt_trap` is null (the standalone
executables) a trap still `exit(1)`s as before.

Drive it by piping source straight in — there is no frame generator any more:

    printf '(define (f x) (* x x))\n(f 7)\n' | build/emit repl

End-to-end host tests: `test/repl-host-tests.sh`; interactive behaviour:
`test/repl-interactive-tests.sh`.
