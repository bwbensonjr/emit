## 1. Gate check (prerequisites)

- [x] 1.1 Confirm all prerequisites are done: [[decompose-core-driver]], [[prelude-cxr-and-case]], [[integer-division-number-format]], [[multiple-values]], [[error-and-guard-conditions]], [[stdin-source-reader]] (plus the completed `match`/syntax-rules and vectors work). — all archived.
- [x] 1.2 Compile the core with scheme-llvm; for any residual unsupported construct, loop back to the relevant prerequisite change and record the gap. — **gaps found (see design.md "Gate-check findings"): G1 internal defines unsupported, G2 emit.ss byte/hex/UTF-8 escaping, G3 path-C I/O shell. Blocks tasks 2–3.**
- [x] 1.3 Audit for output nondeterminism (gensym counter, ordering) that would break the fixed point. — clean: only the reset-per-compile counter; no hashtables/sort/random.

## 2. Stage-1 build (path C)  — BLOCKED on G1/G2/G3 (see design.md gate-check findings)

- [ ] 2.1 Build the core AOT to a native `schemec` using the Chez-hosted compiler.
- [ ] 2.2 Wire the driver/REPL host to invoke `schemec` (text→IR) instead of `chez … compile.ss`.
- [ ] 2.3 Confirm program results are unchanged under the `schemec` path.

## 3. Fixed-point (triple) test

- [ ] 3.1 Compile the core with stage-1 `schemec` to produce stage-2 IR.
- [ ] 3.2 Require stage-1 and stage-2 IR to be byte-identical; chase any diff to a self-application bug.
- [ ] 3.3 Add the triple test to the suite as the self-hosting regression.

## 4. Policy + follow-up

- [ ] 4.1 Decide the stage-0 artifact policy (always bootstrap from Chez vs. check in a stage-0 `schemec`).
- [ ] 4.2 Note path A (in-process embedding of the compiled compiler in the host) as a separate follow-up change.
