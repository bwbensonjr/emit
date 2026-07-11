## Why

`LLVM.md` calls "one frontend, three exits from the IR (AOT, JIT, bitcode)" a **core
project thesis and a regression test target** — but only AOT exists. The cost of keeping
three backends in sync is proportional to how big the emitted-IR surface is, so doing
this **now**, while emission is ~230 lines and the demo suite is tiny, is the cheapest it
will ever be. The lasting payoff is a **cross-backend regression harness**: every demo
run through AOT, JIT, and bitcode must produce identical output — a safety net that
guards every later language and codegen change.

## What Changes

- Add a **JIT backend** using `lli` (the phase-1 pragmatic JIT named in `LLVM.md`): link
  the emitted program IR with the runtime and run it in-process via `lli`, resolving
  `libgc` at load time.
- Add a **bitcode backend**: emit `.bc` (via `llvm-as`/`llvm-link`) as an inspectable /
  `opt`-able artifact from the same emitted `.ll`.
- Add a **backend selector** so a program can be built/run via any of the three exits,
  with **AOT remaining the default** (existing usage unchanged).
- Add a **3-way equivalence harness** that runs every demo through AOT, JIT, and bitcode
  and asserts byte-identical results.
- **No emitter or runtime change.** All three exits consume the *same* emitted `.ll` and
  the *same* `runtime.c`; the JIT/bitcode paths reuse the existing C `main` by linking the
  runtime in at the IR level (`llvm-link`), so nothing in `src/emit.ss` or `runtime.c`
  moves.

## Capabilities

### New Capabilities
- `backends`: the compiler can take a single emitted IR to three interchangeable exits —
  native executable (AOT), in-process JIT execution (`lli`), and bitcode — and the three
  are verified to produce identical results by a regression harness.

### Modified Capabilities
<!-- None. AOT behavior (aot-codegen) is unchanged; JIT/bitcode are additive exits. -->

## Impact

- **Code:**
  - `src/compile.ss` — add a backend selector (e.g. `--backend aot|jit|bitcode`, default
    `aot`) and the `lli`/`llvm-as`/`llvm-link` driver steps; or a thin `src/run.ss`
    runner alongside it.
  - `demos/run-backends.sh` (new) or an extension of `demos/run-tests.sh` — the 3-way
    equivalence harness.
- **Toolchain:** requires `lli`, `llvm-as`, `llvm-link` from the pinned LLVM 22 (note in
  `src/TOOLCHAIN.md` / `LLVM.md`). `libgc` must be loadable by `lli`.
- **Unaffected:** `src/emit.ss`, `src/runtime/runtime.c`, `src/passes/**` — the emitted IR
  and runtime are backend-agnostic by design.
- **Explicitly out of scope (phase 2, per `LLVM.md`):** in-process ORC JIT via the C-API
  FFI (`libLLVM`), live per-form redefinition/REPL, precise GC, optimization passes.
