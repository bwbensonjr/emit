# Calling-convention spike — results and verdict

Goal: choose the calling convention for Scheme functions that supports dotted rest
parameters, variadic `lambda`, and `apply` over arbitrary-length lists, while preserving
guaranteed tail calls (`musttail`) under one uniform prototype and keeping the fixed-arity
hot path allocation-free.

Method: real LLVM IR (`experiments.ll`, plain untagged `i64` — tagging is orthogonal to
the CC question) built with the pinned LLVM 22 clang and run via `driver.c` (`run.sh`).
The loop bodies carry `noinline optnone` so the recursive calls are actually emitted (no
closed-form folding); `musttail` is still honored. Each loop does 100e6 tail-recursive
iterations — completion proves the tail calls are guaranteed (bounded stack); the timing
is per-call overhead. `arm64-apple-macosx`, Apple silicon.

## Numbers (3 runs, ns per tail call)

| candidate | prototype | 100e6 completes? | ns/call | vs baseline |
|-----------|-----------|:---:|---------|-------------|
| **0 fixed max-arity** (today) | `(self, a0..a{K-1})`, pad with 0 | ✅ | ~0.51–0.58 | baseline |
| **2 argc + overflow spill** | `(self, argc, a0..a{K-1}, ov_ptr)` | ✅ | ~0.50–0.53 | **≈ 0 (within noise)** |
| **3 single arg-vector** | `(self, argc, args_ptr)`, alloc per call | ✅ | ~2.75–2.80 | **~5.4× slower** |

Feasibility (candidate 2, `sumv` under the uniform prototype):

- `sumv(2; 10,20)` → **30** — dotted-rest with an empty rest list.
- `sumv(5; 1,2,[3,4,5])` → **15** — `apply` spreading a 5-arg call: first `K=2` in the
  positional slots, the remaining 3 in the overflow vector. The overflow can be any
  length, so `apply` is **unbounded**.

## Verdict — Candidate 2 (argc + overflow spill)

Adopt a single uniform prototype
`tailcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)`:

- `argc` = number of real arguments. Fixed-arity callees ignore it.
- `a0..a{K-1}` = positional slots, `K` = whole-program max fixed arity (as today).
- `overflow` = pointer to a heap vector of the args beyond `K` (or null). A dotted-rest
  callee collects `rest` from `a[fixed..min(argc,K))` followed by `overflow[0..]`. `apply`
  fills the positional slots then spills the tail into `overflow`.

Why it wins on the evidence:

- **musttail preserved** — 100e6 iterations complete under the wider uniform prototype.
- **Hot path is free** — threading `argc` + `overflow` costs nothing measurable vs. the
  current fixed convention (both ~0.5 ns/call).
- **Rest + unbounded apply both work** — demonstrated by `sumv`.

Candidates rejected:

- **1 (argc, no overflow)** — cannot express `apply` on lists longer than `K`.
- **3 (arg-vector)** — ~5.4× hot-loop overhead from per-call memory traffic; unacceptable
  for tight tail loops (`countdown`).
- **4 (hybrid fast/slow paths)** — unnecessary: candidate 2's overhead is already ~0, so
  the extra complexity buys nothing. Kept in reserve only if a future measurement (post
  real value-representation + GC) shows overflow threading matters.

## Caveats

- Untagged `i64` and a bump allocator (not Boehm) — deliberate: isolates the CC cost.
  Overflow allocation in production goes through the real allocator; that cost is paid
  only when `argc > K` (never on fixed-arity calls).
- `optnone` loop bodies measure per-call overhead, not optimized steady state; the
  comparison is apples-to-apples across candidates (same body shape), which is what the
  decision needs.
- `K` stays whole-program-max fixed arity, as today; `argc` is what makes variadic and
  `apply` expressible on top of that.
