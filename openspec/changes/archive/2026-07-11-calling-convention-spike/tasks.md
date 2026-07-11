## 1. Setup

- [x] 1.1 Create the tracked `spike/calling-convention/` directory (kept as a reference, not discarded)
- [x] 1.2 Capture the current baseline: the fixed max-arity convention from `src/emit.ss` and a 10M fixed-arity tail loop as the hot-loop reference (time it)
- [x] 1.3 Write the shared test inputs as intended behavior: a fixed-arity tail loop, a dotted-rest function summing its rest args, and an `apply` over a runtime-built list longer than the fixed width

## 2. Candidate experiments (throwaway .ll)

- [x] 2.1 Candidate 1 (argc register + positional): analyzed — subsumed by candidate 2; rejected because `apply` would be capped at K without an overflow path
- [x] 2.2 Candidate 2 (argc + overflow spill): hand-write `.ll`, run rest-args + unbounded `apply`
- [x] 2.3 Candidate 4 (hybrid fast/slow) — evaluated; not needed (candidate 2 hot-path overhead is ~0), held in reserve
- [x] 2.4 Candidate 3 (single arg-vector): implemented to confirm the expected per-call allocation cost

## 3. Verify the hard constraints per candidate

- [x] 3.1 Confirm `musttail` compiles (no LLVM error) for a tail-recursive loop under each surviving candidate's uniform prototype
- [x] 3.2 Confirm bounded stack at `countdown` scale for each surviving candidate (100e6 iterations complete)
- [x] 3.3 Measure hot-loop wall-clock vs. the baseline; confirm the no-overflow path matches baseline

## 4. Decide

- [x] 4.1 Score each candidate on the rubric (correctness, musttail, hot-loop overhead, emission complexity, transparency)
- [x] 4.2 Write the verdict: the chosen convention and rationale, including how rest params and `apply` are lowered and how `K`/`argc` are framed

## 5. Capture output

- [x] 5.1 Record the full comparison and verdict in this change's `design.md`
- [x] 5.2 Update `LLVM.md` "Calling convention" and "Tail calls" sections to match the decision
- [x] 5.3 Tidy `spike/calling-convention/` and keep it as a reference implementation
- [x] 5.4 Sync the `aot-codegen` added-requirement delta into `openspec/specs/`
