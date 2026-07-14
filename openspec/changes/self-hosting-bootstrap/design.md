## Context

Self-hosting decomposes into (see the exploration): grow/avoid/downgrade the remaining Chez
dependencies until the core is expressible, then compile the core with itself. The `match`
and vectors steps are done; the other prerequisites are proposed. This change is the join
point that verifies the whole thing.

## Goals / Non-Goals

**Goals:** a stage-1 `schemec` produced by the Chez-hosted compiler; the driver/host using it
instead of Chez (path C); a byte-identical fixed-point proof.

**Non-Goals:** in-process embedding (path A) — end state, likely a follow-up; removing Chez
from the *build* entirely (stage-0 artifact policy is an open question); self-hosting the
driver (it stays Chez/bash by design — [[decompose-core-driver]]).

## Decisions

### D1: Path C before path A

Compile the core AOT to `schemec` and have the driver/REPL host shell out to it per program/
form (replacing `chez … compile.ss`). This removes Chez at compile time with far less
integration than embedding, and is a stepping stone to A. A survives in spirit from
`interactive-repl` D4 (loop logic in Scheme, thin host) — just compiled Scheme, not Chez.

### D2: Fixed-point (triple) test is the acceptance criterion

Stage-1 = core compiled by Chez-hosted compiler. Stage-2 = core compiled by stage-1
`schemec`. Require `diff` of the emitted IR to be empty. Non-identical output means a
self-application bug (name gensym nondeterminism, ordering, etc.) to chase down. This is the
definition of done.

### D3: Bootstrap-artifact policy (open)

Either (a) always bootstrap from Chez until the language is fully self-sufficient, or (b)
check in a stage-0 `.ll`/native `schemec` so the build no longer needs Chez. Decide when
stage-1 is stable; (a) is simpler initially.

## Risks / Trade-offs

- **Nondeterministic output breaks the fixed point** → the compiler already uses a
  deterministic gensym counter (`util.ss reset-counter!`); audit for any remaining ordering/
  hash nondeterminism before the triple test.
- **A prerequisite turns out insufficient** → the gate check (task 1) catches "core still
  uses X" before attempting the build; each gap loops back to its step's change.

## Migration Plan

1. Gate check: compile the core with scheme-llvm; fix any residual unsupported construct
   (loops back to the relevant prerequisite change).
2. Build stage-1 `schemec`; wire the driver/host to use it (path C).
3. Run the triple test; require byte-identical stage-1/stage-2 IR.
4. Decide the stage-0 artifact policy (D3).
5. (Later, separate change) path A: embed the compiled compiler in the host.

## Open Questions

- Stage-0 artifact policy (D3).
- Where the REPL loop lives after self-hosting (compiled Scheme calling the host to JIT, vs
  host driving compiled `compile-form`) — `interactive-repl` D4 leans to the former.
- Does any pass rely on Chez evaluation order / non-guaranteed behavior that self-compilation
  would expose?
