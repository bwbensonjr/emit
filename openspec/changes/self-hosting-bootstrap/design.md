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

## Gate-check findings (2026-07-14, task 1.1–1.3)

Prerequisites are all archived (1.1 ✓). Nondeterminism audit is clean (1.3 ✓): the only
gensym is `util.ss`'s reset-per-compile monotonic counter; no hashtables, `sort`, `random`,
or symbol-hash anywhere in the core. Output is deterministic, so the fixed point is
attainable on that axis.

But the empirical compile (1.2 — feeding core constructs through `chez … compile.ss`)
found the core is **not yet compilable by scheme-llvm**. Three residual gaps, each loops
back to a (new) prerequisite change; **tasks 2.x–3.x are blocked until they close**:

- **G1 — internal `define` is unsupported (major, unanticipated).** scheme-llvm's parser
  rejects body-level defines: `parse: 'define' is only allowed at the top level`. The core's
  passes use internal defines pervasively (`parse.ss`, `expand.ss`, `convert-assignments.ss`
  ~5 each; others fewer). Fix path: grow the language to accept internal defines (body
  defines → `letrec*`), or rewrite every internal define in the core to `letrec`/`let`.
  Recommend a new prerequisite change `internal-defines` (grow — it's a standard, contained
  expander feature and avoids churning the whole core).
- **G2 — `emit.ss` byte/UTF-8/hex escaping.** `hex2`/`llvm-cstring` use `string->utf8`,
  `bytevector-length`, `bytevector-u8-ref`, `(number->string b 16)` (radix arg — the
  in-language `number->string` is base-10/one-arg), and `string-upcase`. None exist in
  scheme-llvm. Fix path: rewrite the escaping in-language over `string-ref`/`char->integer`
  with a hex-digit table and an in-language UTF-8 encoder, or grow the needed byte ops.
  Recommend a new prerequisite change `emit-cstring-in-language`.
- **G3 — path-C standalone I/O shell.** A native `schemec` filter must read all of stdin
  into a string and write the IR string to stdout, but the language has no stdin-read or
  raw string-write (`display`) primitive — the runtime only has `rt_write` (values, quoted).
  This is an architectural fork: **(a)** grow two I/O primitives so the assembled core + a
  thin `main` compiles to a standalone `schemec`, or **(b)** skip standalone `schemec` and go
  straight to path A (embed the compiled core in the C++ host, which does the I/O and passes
  strings across the JIT boundary — no language I/O primitives). D1 chose path C; G3 is the
  cost of that choice.

Assembly work also remains (independent of the gaps): de-`library` `match.sls`/`util.ss`
into top-level `define-syntax`/`define`s, concatenate the `include`d passes into one program,
and switch `core.ss`'s `read-forms` (Chez `read`/`open-input-string`) to the in-language
`read-all-from-string` ([[stdin-source-reader]], done).

**Recommendation:** this umbrella change is correctly gated and should stay open/blocked.
Land `internal-defines` (G1) and `emit-cstring-in-language` (G2) as new prerequisite changes,
resolve the G3 path-C-vs-A fork, then resume at task 2.1.

## Open Questions

- Stage-0 artifact policy (D3).
- Where the REPL loop lives after self-hosting (compiled Scheme calling the host to JIT, vs
  host driving compiled `compile-form`) — `interactive-repl` D4 leans to the former.
- Does any pass rely on Chez evaluation order / non-guaranteed behavior that self-compilation
  would expose?
