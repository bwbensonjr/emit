## 1. Bootstrap the Identity-Hash Primitive

- [x] 1.1 Add the constant-time `rt_eq_hash` implementation for immediate and heap values; verify focused runtime coverage returns stable fixnums across allocations and terminates on cyclic objects
- [x] 1.2 Wire `%eq-hash` through the primitive recognizer, emitter table, and LLVM declarations without referencing it from the baked prelude; verify `chez --libdirs src --script src/compile.ss` compiles and runs a direct primitive probe
- [x] 1.3 Finish all first-phase compiler-source edits, run `make regen`, and verify the regenerated compiler and baked modules converge without mixed-source bootstrap artifacts
- [x] 1.4 Run `./run-all-tests.sh` and `./run-dev-tests.sh` for the primitive-only phase; verify existing hash tables and all compiler doors remain green before beginning the second source-edit phase

## 2. Add the Eq?-Keyed Table Surface

- [x] 2.1 Add the equality-mode spine flag and `make-eq-hash-table`, then route bucket indexing, lookup, replacement, deletion, and growth through matched `equal?`/`%hash` or `eq?`/`%eq-hash` behavior; verify the existing `make-hash-table` cases remain unchanged
- [x] 2.2 Publish `make-eq-hash-table` from `(scheme base)` while keeping representation helpers private; verify the generated surface check accepts the new constructor and rejects internal mode/hash helpers
- [x] 2.3 Add focused tests for distinct-but-equal objects, same-object replacement, cyclic pair/vector keys, contains/delete/enumeration, growth past the load threshold, opaque printing, and identity-hash stability across allocations; verify every case passes through the Chez source driver
- [x] 2.4 Add development, REPL, AOT, and backend-equivalence coverage for both table modes; verify the same programs produce identical values and effects through every door
- [x] 2.5 Update the hash-table and primitive documentation where the constructor/equality contract is enumerated; verify documentation and generated-library drift checks name `make-eq-hash-table` consistently

## 3. Regenerate and Verify the Complete Emit Change

- [x] 3.1 Finish every second-phase compiler-source edit, run `make regen`, and verify fixed-point convergence plus regenerated `bootstrap/` and baked `(scheme base)` artifacts
- [x] 3.2 Run `./run-all-tests.sh` and `./run-dev-tests.sh`; verify the full suite is green and trust-check reports its documented dirty-bootstrap skip until the regenerated artifacts are committed
- [x] 3.3 Run `openspec validate eq-keyed-hash-tables --strict` and review the final Emit diff; verify no custom hash/equality API, R6RS compatibility surface, weak-table behavior, or unrelated prelude expansion entered the change

## 4. Unblock the Pitch Port

- [x] 4.1 In Pitch's existing `port-pitch-to-emit-r7rs` change, replace only the identity-table association-list backing store with `make-eq-hash-table`; verify the Pitch table tests preserve distinct equal objects, cyclic keys, and all existing callers without interface changes
- [x] 4.2 Run the complete Pitch print/configuration/format corpus without narrowing it and compare behavior with the Chez baseline; record the observed timing and mark Pitch task 4.6 complete only when the formerly blocking run finishes with parity
- [x] 4.3 After the Emit implementation is committed, run `test/trust-check.sh`; verify committed bootstrap IR regenerates byte-identically before treating the downstream prerequisite revision as final
