## Context

The AOT path today (`src/compile.ss`): emit `OUT.ll`, then
`clang -I<gc> -L<gc> runtime.c OUT.ll -lgc -o OUT`. The C `main` in `runtime.c` calls
`GC_INIT()`, then `scheme_entry()` (defined in the emitted IR), then `rt_write()` on the
result. `LLVM.md` "Backends" names three exits from the IR — AOT (done), JIT (phase-1:
`lli`), bitcode — and calls all three staying green a core thesis and regression target.
Only AOT exists.

Key structural fact that shapes the JIT design: **`main` lives in the runtime, not the
emitted IR.** `lli` executes the *input module's* `main`, so the program IR alone has no
entry point. The clean resolution is to link the runtime into the module at the IR level
before running.

## Goals / Non-Goals

**Goals:**
- Run a program via `lli` in-process and via bitcode, from the *same* emitted `.ll` and
  *same* `runtime.c`, with no change to `src/emit.ss` or the runtime.
- Keep AOT the default; add JIT/bitcode as selectable exits.
- Ship a 3-way equivalence harness (AOT vs JIT vs bitcode → identical stdout for every
  demo) as the durable deliverable.

**Non-Goals:**
- In-process ORC JIT via the C-API FFI, live redefinition/REPL (phase 2, `LLVM.md`).
- Precise GC, optimization passes, `opt` pipelines (bitcode is emitted for inspection,
  not optimized here).
- Any change to the value representation, calling convention, or emitted IR.

## Decisions

### D1 — JIT = `llvm-link` the runtime in, then `lli`

Pipeline:
```
runtime.c ──clang -emit-llvm -c──▶ runtime.bc ┐
                                                ├─ llvm-link ─▶ combined.bc ─ lli -load=libgc ─▶ run
OUT.ll ─────llvm-as──────────────▶ OUT.bc ─────┘
```
`llvm-link` merges the runtime (bringing its C `main`, `rt_*`, and the `GC_INIT` call)
with the program module; `lli` then runs `main` and resolves `libgc` via `-load`.

**Why this over the alternatives:**
- *`lli -load runtime.so OUT.ll`* (no link) — rejected: `lli` runs the *input module's*
  `main`, but `main` is in the runtime, so `OUT.ll` has no entry point.
- *Emit a `main` wrapper into the IR for the JIT path* — rejected: needs an `emit.ss`
  change and a `rt_init` shim, and the emitted `main` would collide with the C `main` on
  the AOT link. Keeping `main` solely in C keeps all three exits sharing one runtime.

### D2 — Bitcode backend = `llvm-as` of the emitted `.ll`

The bitcode exit writes `OUT.bc` (`llvm-as OUT.ll`), the inspectable/`opt`-able artifact.
The JIT path's `combined.bc` is the linked form of the same content; the plain program
`OUT.bc` is what the "bitcode backend" produces as its deliverable.

### D3 — The equivalence harness is the real deliverable

A `demos/run-backends.sh` runs each demo through all three exits and asserts
byte-identical stdout. This operationalizes the `LLVM.md` thesis ("all three should stay
working … a regression test target") and becomes the guard for every later change. It
supersedes nothing in `run-tests.sh`; it can wrap or extend it.

### D4 — Backend selection surface

Add `--backend aot|jit|bitcode` to `src/compile.ss`, default `aot` so current invocations
are unchanged. (A thin separate `src/run.ss` is an acceptable alternative if it keeps
`compile.ss` simple — settle at apply-time.)

## Risks / Trade-offs

- **Boehm GC under `lli`** → `libgc` is conservative and scans the machine stack/registers;
  it must initialize and collect correctly inside `lli`'s JIT'd execution. Mitigation:
  the equivalence harness includes the allocation-heavy demos (`length`, `counter`) and
  the 10M `countdown`; a divergence surfaces immediately.
- **`musttail` under `lli`** → modern `lli` uses the ORC JIT (same codegen as `llc`), so
  `musttail` should be honored on x86_64/AArch64; the `countdown` demo in the harness is
  the bounded-stack check. (`LLVM.md` gotcha: `musttail` target support.)
- **Tool availability / version skew** → `lli`/`llvm-as`/`llvm-link` must match the LLVM
  22 pin; note in `TOOLCHAIN.md` and fail with a clear message if absent.
- **Three-way sync cost** → this is the accepted, intended cost; the harness is what makes
  it cheap to maintain rather than a hidden liability.
- **`libgc` load path portability** (Homebrew paths already hard-coded for AOT) →
  reuse the same `gc-lib` location for `lli -load`; keep it in one place.
