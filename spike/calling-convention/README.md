# calling-convention spike

Throwaway experiments backing the decision on how Scheme functions pass arguments so that
dotted rest params, variadic `lambda`, and `apply` work while keeping guaranteed tail
calls (`musttail`) under one uniform prototype. Kept as a reference (like
`spike/nanopass/`), not wired into the compiler.

- `experiments.ll` — hot-loop candidates 0/2/3 + a candidate-2 variadic/`apply` demo.
- `driver.c` — bump allocator, timing, feasibility checks.
- `run.sh` — verify IR, build with the pinned LLVM 22 clang, run.
- `RESULTS.md` — measured numbers and the verdict.

Run:

    spike/calling-convention/run.sh

Verdict (see `RESULTS.md`): **candidate 2, argc + overflow spill** —
`tailcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)`. It preserves
`musttail`, costs ~0 on the fixed-arity hot path vs. today's convention, and expresses
rest params and unbounded `apply`. Recorded in `LLVM.md` (Calling convention / Tail calls).

Implementing this convention in `src/emit.ss` is a **separate future change** — this spike
only decides it.
