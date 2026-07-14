## ADDED Requirements

### Requirement: Integer division primitives

The language SHALL provide `quotient` and `remainder` on integers with truncating-toward-zero
semantics: for integers n and d (d ≠ 0), `(quotient n d)` is n/d truncated toward zero and
`(remainder n d)` satisfies `(+ (* (quotient n d) d) (remainder n d))` = n. Division by zero
SHALL raise a runtime trap (consistent with other runtime errors).

#### Scenario: quotient and remainder

- **WHEN** a program evaluates `(quotient 17 5)` and `(remainder 17 5)`
- **THEN** the results are `3` and `2`

#### Scenario: truncation toward zero with negatives

- **WHEN** a program evaluates `(quotient -17 5)` and `(remainder -17 5)`
- **THEN** the results are `-3` and `-2`

### Requirement: number->string for decimal integers

The standard prelude SHALL provide `(number->string n)` producing the base-10 signed decimal
text of the integer n, such that it round-trips with the reader's integer parsing.

#### Scenario: positive and negative

- **WHEN** a program evaluates `(number->string 420)` and `(number->string -7)`
- **THEN** the results are the strings `"420"` and `"-7"`

#### Scenario: zero

- **WHEN** a program evaluates `(number->string 0)`
- **THEN** the result is the string `"0"`

#### Scenario: round-trips with the reader

- **WHEN** a program reads `(read-from-string (number->string n))` for an integer n in range
- **THEN** the result equals n
