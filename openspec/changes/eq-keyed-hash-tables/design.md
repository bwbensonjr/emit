## Context

See [proposal.md](proposal.md) for motivation. Emit's hash table is an opaque
`HDR_HASHTABLE` wrapper around a mutable three-slot spine: count, bucket vector, and a
currently unused slot. Prelude operations hard-code `%hash` and `equal?` for bucket
selection and scans.

That implementation is correct for records because Emit records are identity values, but
`%hash` currently returns the common extended-object header for records. Every document
record therefore lands in one bucket. Pitch cannot use that table for its broader identity
contract in any case, because pairs, vectors, strings, and bytevectors use structural
hashing and comparison; it currently uses a linear `eq?` association list instead.

Emit uses the non-moving Boehm collector, so the tagged identity of a live heap object is
stable. The committed bootstrap compiler does not know a new primitive until a regenerated
compiler has been produced, while `(scheme base)` is itself compiled by that bootstrap.

## Goals / Non-Goals

**Goals:**

- Reuse one hash-table type and operation family for `equal?` and `eq?` key contracts.
- Keep identity hashing constant-time with respect to key structure and useful for bucket
  distribution across separately allocated objects.
- Preserve existing table behavior, representation opacity, printing, and callers.
- Cross the self-hosting boundary without leaving mixed-source bootstrap artifacts.

**Non-Goals:**

- Arbitrary user-supplied equivalence predicates or hash procedures.
- R6RS hashtable compatibility or its `make-eq-hashtable` spelling.
- Weak keys, ordered iteration, concurrency guarantees, or new traversal operations.
- A numeric performance threshold tied to one machine; the blocking Pitch corpus is an
  integration completion check, not a benchmark contract.

## Decisions

### D1. Add `make-eq-hash-table` beside the existing constructor

`make-hash-table` remains the zero-argument `equal?` constructor. The new
`make-eq-hash-table` constructor returns the same disjoint hash-table type, and every
existing `hash-table-*` operation derives comparison behavior from its table.

A separate constructor makes equality visible at allocation without adding optional
procedure arguments or a second operation family. The spelling follows Emit's existing
`hash-table` names. Adopting R6RS `make-eq-hashtable` would introduce an isolated
compatibility spelling, while accepting arbitrary equality/hash procedures would enlarge
the contract beyond the blocker.

### D2. Store an equality-mode flag in the reserved spine slot

The spine's third slot records `#f` for the existing `equal?` mode and `#t` for identity
mode. Internal bucket lookup, removal, insertion, and rehash helpers receive the table or
mode and select `equal?`/`%hash` or `eq?`/`%eq-hash` together. Selecting both from one flag
prevents an equality/hash mismatch that could make an entry unreachable.

Storing predicate and hash closures in each table was considered. A boolean mode is more
transparent, allocates no closures, keeps the standalone library smaller, and is sufficient
for the two specified contracts. The internal spine accessor is not exported, so the flag
does not become mutable public state.

### D3. Hash identity in one runtime primitive

`%eq-hash` hashes immediate values from their canonical tagged word and heap values from a
mixed form of their tagged identity, masked into a non-negative fixnum. It never descends
through object contents. Boehm does not move live allocations, so the value stays stable for
the lifetime required by a table entry. Mixing before masking avoids publishing a raw
address-shaped value and improves low-bit bucket distribution.

Implementing identity hashing in Scheme would require an existing identity map and be
circular. Reusing `%hash` would retain structural work for pairs, vectors, strings, and
bytevectors and would keep all records in the same bucket, defeating the change.

### D4. Keep representation and printing independent of key mode

Both constructors use `HDR_HASHTABLE`; `hash-table?` recognizes both, and the printer keeps
the opaque `#<hash-table N>` form. Enumeration and copying operations expose entries but not
the equality mode. No serialized representation or ABI-visible header is added.

### D5. Treat Pitch as a downstream integration gate

Emit's focused and backend tests establish the language contract. After those pass, the
Pitch port changes only `make-identity-table`'s storage construction and delegates through
its existing table interface. Its complete print/configuration/format corpus must run
without narrowing and retain Chez behavior; the run records observed timing rather than
asserting a machine-specific limit.

The smaller 82-entry layout corpus remains useful parity coverage but is not accepted as a
substitute because it did not expose the blocker.

## Risks / Trade-offs

- **[Equality and hashing modes diverge]** → Select both from the same immutable internal
  mode flag and test distinct-but-equal keys through set/ref/delete/grow.
- **[Identity hashes change after collection]** → Rely only on Boehm's documented non-moving
  allocation identity and stress the same keys across intervening allocations.
- **[Pointer-derived hashes expose or cluster addresses]** → Mix the tagged identity before
  converting it to a non-negative fixnum; require correctness under collisions.
- **[A new primitive breaks bootstrap regeneration]** → Introduce and regenerate the
  primitive substrate before any baked prelude source references `%eq-hash`, completing the
  full test barrier between the two compiler-source edit phases.
- **[The Pitch blocker has another dominant cause]** → Keep the Emit capability independently
  specified and tested, then require the un-narrowed downstream corpus before considering
  the Pitch task unblocked.

## Migration Plan

1. Add the runtime/compiler `%eq-hash` substrate without referencing it from the prelude;
   iterate through the Chez source driver, run `make regen`, and complete the required test
   barrier so the committed bootstrap compiler recognizes the primitive.
2. Add the prelude mode, constructor, surface, and tests; iterate without regeneration, then
   run `make regen`, `./run-all-tests.sh`, and `./run-dev-tests.sh` after all compiler-source
   edits are finished.
3. After committing regenerated bootstrap IR, run `test/trust-check.sh` as the post-commit
   fixed-point check.
4. Update the Pitch port's identity-table backing store, run its complete task 4.6 corpus
   without narrowing, and record the outcome before marking that task complete.

Rollback is a normal revert of each complete regeneration phase. If regeneration is
interrupted, restore committed `bootstrap/` or rerun to convergence before continuing; never
retain a mixed-source bootstrap set.
