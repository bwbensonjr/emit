## Context

Today's calling convention (`src/emit.ss`, documented in `LLVM.md` "Calling convention"):

- Every Scheme function is `tailcc i64 (i64 %self, i64 %a0 … i64 %a{K-1})`, one shared
  prototype where `K = max-arity` over the whole program (`*arity*`).
- `%self` is the called closure (arg 0), from which free variables load.
- Calls pad missing trailing arguments with the literal `0`.
- One uniform signature is what makes `musttail` legal: LLVM requires caller and callee
  prototypes (and calling conventions) to match for a guaranteed tail call.

This is elegant for fixed-arity direct-style code and is why the 10M-iteration
`countdown` runs in bounded stack. But it structurally blocks growth:

- **No argument count.** A callee cannot tell how many real arguments arrived, so a rest
  parameter `(lambda (a b . rest) …)` cannot know where `rest` begins.
- **Padding is ambiguous.** A padded `0` is bit-identical to a real fixnum `0`.
- **`apply` is bounded.** Spreading a runtime list of unknown length into positional
  arguments is impossible past `K`.

The `musttail` constraints that any candidate must respect (LLVM Language Reference):
matching calling convention and prototype caller/callee; call in genuine tail position
immediately followed by `ret`; no access to caller allocas/varargs. So the winning
convention must keep **one uniform prototype** across all Scheme functions.

## Goals / Non-Goals

**Goals:**
- Choose a calling convention that supports (a) fixed arity, (b) dotted rest parameters,
  (c) fully variadic `lambda`, and (d) `apply` on runtime lists of arbitrary length.
- Preserve guaranteed tail calls (`musttail`) on x86_64/AArch64 under one uniform
  prototype.
- Keep the fixed-arity hot path cheap (no per-call allocation) — bounded-stack
  `countdown`-style loops must stay allocation-free.
- Keep emission simple/transparent, consistent with the project values.

**Non-Goals:**
- Implementing the chosen convention in `src/emit.ss` (separate later change).
- Keyword/optional arguments, multiple return values, `call/cc`, register-pinned
  allocator threading (JWA) — future concerns, only noted where they'd constrain the
  choice.

## Decisions

### Candidate conventions to evaluate

| # | convention | rest/variadic | apply (unbounded) | musttail | hot-loop cost |
|---|------------|---------------|-------------------|----------|---------------|
| 0 | **fixed max-arity + pad** (today) | ✗ | ✗ | ✓ | none — baseline |
| 1 | **argc register + positional**: `(self, argc, a0…a{K-1})` | rest ✓ (collect `a[fixed..argc)`) | ✗ (capped at `K`) | ✓ | none |
| 2 | **argc + overflow spill**: `(self, argc, a0…a{K-1}, overflow_ptr)` — args ≥ `K` passed as a heap list/vector | ✓ | ✓ | ✓ (uniform sig) | none until overflow; small on overflow |
| 3 | **single arg-vector**: `(self, argc, args_ptr)` — all args in a heap vector | ✓ | ✓ | ✓ | **alloc per call** — kills hot loops |
| 4 | **hybrid**: known-arity direct fast calls + a slow uniform `apply` entry per closure | ✓ | ✓ | ✓ | none fast path; slow path allocates |

### Leading hypothesis (to confirm, not assume)

**Candidate 2 (argc + overflow spill).** It keeps a single uniform prototype (so
`musttail` holds), keeps the common fixed-arity call allocation-free, collects rest
parameters from the positional slots plus the overflow list, and makes `apply` unbounded
via the overflow pointer. Candidate 4 (hybrid) is the fallback if measured overhead of
threading `argc`/overflow through every call proves non-trivial; Candidate 3 is expected
to lose on hot-loop cost; Candidate 1 is rejected if `apply` must be unbounded (it must,
for `apply` over arbitrary lists).

The spike's job is to make this a *measured* conclusion.

### Evaluation rubric

1. **Correctness:** rest params and `apply` produce right results on shared test inputs.
2. **`musttail` preserved:** a tail-recursive loop under the convention compiles with
   `musttail` (no LLVM error) and runs in bounded stack (`countdown`-scale).
3. **Hot-loop overhead:** wall-clock of a 10M fixed-arity tail loop vs. the current
   baseline.
4. **Emission complexity:** approximate `.ll`-generation LOC / conceptual weight.
5. **Simplicity/transparency:** readability of the emitted IR and the emitter logic.

### Shared test inputs (both/all candidates run the same)

- A fixed-arity tail loop (bounded-stack check).
- A dotted-rest function, e.g. `(lambda (a . rest) …)` summing `rest`.
- An `apply` of a runtime-built list longer than `K`.

## Risks / Trade-offs

- **`musttail` may reject a candidate signature** on a target → Mitigation: the spike
  emits and compiles real `.ll` for each candidate rather than reasoning on paper; a
  rejection eliminates the candidate immediately.
- **Overflow allocation cost** (candidate 2/4 slow path) → Mitigation: measure; the hot
  path (no overflow) must match baseline, which is the acceptance bar.
- **Whole-program `K` interacts with variadic** → decide whether `K` stays
  whole-program-max or becomes per-call; note the consequence for `argc` framing.
- **Spike overreach** → keep experiments throwaway and minimal (hand-written `.ll` is
  fine); the deliverable is the decision + `LLVM.md` update, not polished code.
- **Decision must not contradict `LLVM.md`** → the "Calling convention" and "Tail calls"
  sections are updated as part of capture, keeping docs consistent (as the nanopass spike
  did for the pass framework).

## Verdict (recorded after the spike)

**Chosen: Candidate 2 — argc + overflow spill.** Uniform prototype
`tailcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)`:
`argc` = real arg count (fixed-arity callees ignore it), `a0..a{K-1}` = positional slots
(`K` = whole-program max fixed arity, as today), `overflow` = pointer to a heap vector of
args beyond `K` (or null). Rest params collect `a[fixed..min(argc,K))` ++ `overflow[0..]`;
`apply` fills positional slots then spills the tail into `overflow`, so it is unbounded.

Evidence (`spike/calling-convention/`, real LLVM 22 IR, 100e6 tail iterations, Apple
silicon — full data in that dir's `RESULTS.md`):

| candidate | 100e6 completes (musttail/bounded stack) | ns/call | rest | unbounded apply |
|-----------|:---:|---------|:---:|:---:|
| 0 fixed max-arity (today) | ✅ | ~0.51–0.58 | ✗ | ✗ |
| **2 argc + overflow (chosen)** | ✅ | ~0.50–0.53 (**≈0 vs baseline**) | ✅ | ✅ |
| 3 single arg-vector | ✅ | ~2.75–2.80 (**~5.4×**) | ✅ | ✅ |

`sumv` under the candidate-2 prototype returned 30 for `(2; 10,20)` (empty rest) and 15
for `(5; 1,2,[3,4,5])` (apply spreading 5 args across 2 slots + a 3-element overflow),
confirming feasibility.

Rejected: **1** (no overflow → `apply` capped at `K`); **3** (~5.4× hot-loop overhead from
per-call memory traffic); **4 hybrid** (unnecessary — candidate 2's hot-path overhead is
already ~0, so the extra fast/slow-path complexity buys nothing; held in reserve only if a
post-GC re-measurement shows overflow threading matters).

**Not implemented here.** Lowering this convention in `src/emit.ss` (widening the shared
prototype, generating rest-collection and `apply`) is a separate future change; the
3-backend equivalence harness will guard that cross-cutting codegen change.
