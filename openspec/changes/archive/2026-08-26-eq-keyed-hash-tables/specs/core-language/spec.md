## MODIFIED Requirements

### Requirement: Hash-table data type and operations

The compiler SHALL provide a mutable hash-table data type and the operations
`make-hash-table`, `make-eq-hash-table`, `hash-table?`, `hash-table-set!`,
`hash-table-ref`, `hash-table-ref/default`, `hash-table-delete!`,
`hash-table-contains?`, `hash-table-size`, `hash-table-keys`, `hash-table-values`,
and `hash-table->alist`.

- `(make-hash-table)` SHALL return a new, empty table whose keys are compared with
  `equal?`.
- `(make-eq-hash-table)` SHALL return a new, empty table whose keys are compared with
  `eq?` and whose lookup does not traverse compound key contents.
- `(hash-table? x)` SHALL return `#t` iff `x` is a hash table made by either
  constructor.
- `(hash-table-set! ht key val)` SHALL associate `key` with `val`, replacing any
  association whose key is equivalent under `ht`'s key comparison, and return an
  unspecified value.
- `(hash-table-ref/default ht key default)` SHALL return the value associated with an
  equivalent `key`, or `default` if none is present.
- `(hash-table-contains? ht key)` SHALL return `#t` iff an equivalent `key` is present.
- `(hash-table-delete! ht key)` SHALL remove any association for an equivalent `key`.
- `(hash-table-size ht)` SHALL return the number of associations as a fixnum.
- `(hash-table-keys ht)` / `(hash-table-values ht)` SHALL return a list of the keys /
  values.
- `(hash-table->alist ht)` SHALL return a list of `(key . value)` pairs.

Tables made by both constructors SHALL grow by rehashing into a larger bucket store as
associations are added, keeping lookup amortized O(1).

#### Scenario: Set and retrieve

- **WHEN** a program evaluates `(let ((h (make-hash-table))) (hash-table-set! h "a" 1) (hash-table-ref/default h "a" 0))`
- **THEN** the result is `1`

#### Scenario: Missing key returns default

- **WHEN** a program evaluates `(hash-table-ref/default (make-hash-table) "x" 42)`
- **THEN** the result is `42`

#### Scenario: Overwrite an equal? key

- **WHEN** a program evaluates `(let ((h (make-hash-table))) (hash-table-set! h "k" 1) (hash-table-set! h "k" 2) (hash-table-ref/default h "k" 0))`
- **THEN** the result is `2`

#### Scenario: Delete and contains?

- **WHEN** a program evaluates `(let ((h (make-hash-table))) (hash-table-set! h 'k 9) (hash-table-delete! h 'k) (hash-table-contains? h 'k))`
- **THEN** the result is `#f`

#### Scenario: Size and growth

- **WHEN** a program inserts 100 distinct keys into a fresh table from either constructor and evaluates `(hash-table-size h)`
- **THEN** the result is `100` and every inserted key is still retrievable

#### Scenario: Predicate

- **WHEN** a program applies `hash-table?` to tables from both constructors and to `(vector 1)`
- **THEN** the results are `#t`, `#t`, and `#f`

#### Scenario: Identity table preserves distinct equal objects

- **WHEN** two separately allocated lists are `equal?` but not `eq?` and are inserted into one table made by `make-eq-hash-table`
- **THEN** the table has two associations and retrieves each list's own value

#### Scenario: Identity table replaces the same object

- **WHEN** one compound object is inserted twice into a table made by `make-eq-hash-table`
- **THEN** the table has one association containing the second value

#### Scenario: Cyclic identity keys terminate

- **WHEN** a cyclic pair or vector is inserted, retrieved, tested, and deleted in a table made by `make-eq-hash-table`
- **THEN** every operation terminates and observes the association by object identity

### Requirement: Value-to-hash primitive

The runtime SHALL provide these hashing primitives:

- `%hash` SHALL map any value to a fixnum hash code such that `equal?` values produce
  equal hash codes, using content where structural equality requires it.
- `%eq-hash` SHALL map any value to a fixnum hash code such that `eq?` values produce
  equal hash codes. Its result for one live object SHALL remain stable, and computing it
  SHALL not traverse pair, vector, string, bytevector, record, or other heap-object
  contents.

#### Scenario: Equal values hash equally

- **WHEN** a program evaluates `(= (%hash "abc") (%hash (string-append "ab" "c")))`
- **THEN** the result is `#t`

#### Scenario: One identity has a stable identity hash

- **WHEN** a program evaluates `%eq-hash` repeatedly on the same heap object before and after allocations
- **THEN** every result is the same fixnum

#### Scenario: Cyclic identity hashing terminates

- **WHEN** a program evaluates `%eq-hash` on a cyclic pair or vector
- **THEN** evaluation terminates with a fixnum without inspecting the cycle
