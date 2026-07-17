## ADDED Requirements

### Requirement: Bytevector data type and operations

The compiler SHALL provide a mutable, fixed-length bytevector data type and the operations
`make-bytevector`, `bytevector`, `bytevector-u8-ref`, `bytevector-u8-set!`,
`bytevector-length`, and `bytevector?`. Each element is an exact integer in the range
0–255 (a byte). `(make-bytevector k fill)` SHALL return a bytevector of `k` bytes each
initialized to `fill`. `(bytevector b …)` SHALL return a bytevector of its byte arguments in
order. `(bytevector-u8-ref bv i)` SHALL return the `i`-th byte (0-based) as a fixnum.
`(bytevector-u8-set! bv i byte)` SHALL replace the `i`-th byte with `byte` in place.
`(bytevector-length bv)` SHALL return the byte count as a fixnum. `(bytevector? x)` SHALL
return `#t` iff `x` is a bytevector. Out-of-range indices and out-of-range byte values are
undefined for this subset (matching `vector-ref` / `string-ref`).

#### Scenario: Construct and index

- **WHEN** a program evaluates `(bytevector-u8-ref (bytevector 10 20 30) 1)`
- **THEN** the result is `20`

#### Scenario: Length

- **WHEN** a program evaluates `(bytevector-length (make-bytevector 4 0))`
- **THEN** the result is `4`

#### Scenario: Mutation

- **WHEN** a program evaluates `(let ((bv (make-bytevector 2 0))) (bytevector-u8-set! bv 0 255) (bytevector-u8-ref bv 0))`
- **THEN** the result is `255`

#### Scenario: Predicate

- **WHEN** a program evaluates `(bytevector? (bytevector 1))` and `(bytevector? (vector 1))`
- **THEN** the results are `#t` and `#f`

### Requirement: Bytevector printing and reader syntax

A bytevector SHALL print as `#u8(` followed by its byte values separated by spaces and a
closing `)`. `read-from-string` SHALL read `#u8(...)` syntax as a bytevector of the
parenthesized byte data.

#### Scenario: Bytevector prints in #u8(...) form

- **WHEN** a program's result value is `(bytevector 1 2 3)`
- **THEN** it prints as `#u8(1 2 3)`

#### Scenario: Reader reads a bytevector literal

- **WHEN** a program evaluates `(bytevector-u8-ref (read-from-string "#u8(7 8 9)") 2)`
- **THEN** the result is `9`

### Requirement: Structural equality over bytevectors

`equal?` SHALL treat two bytevectors as equal iff they have the same length and equal bytes
at every index.

#### Scenario: Byte-wise equality

- **WHEN** a program evaluates `(equal? (bytevector 1 2 3) (bytevector 1 2 3))`
- **THEN** the result is `#t`
