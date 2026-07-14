## ADDED Requirements

### Requirement: Two-armed if

The language SHALL accept a two-armed conditional `(if test then)` as equivalent to
`(if test then UNSPEC)`, where `UNSPEC` is the unspecified value (the value denoted by
`(if #f #f)`). When `test` is false and no alternative is given, the expression SHALL evaluate
to that unspecified value rather than being treated as a procedure call to `if`. Three-armed
`(if test then else)` SHALL be unaffected. This makes the `case` derived form's no-match
default and the `(if #f #f)` unspecified-value idiom valid throughout the language, including
in the compiler core itself.

#### Scenario: False test with no alternative yields the unspecified value

- **WHEN** a program evaluates `(if #f 1)`
- **THEN** it yields the unspecified value — identical to `(if #f #f)` — and does not error as
  an unbound `if` reference

#### Scenario: case with no matching key and no else

- **WHEN** a program evaluates `(case 9 ((1 2) 'a) ((3 4) 'b))` (no match, no `else` clause)
- **THEN** it compiles and yields the unspecified value (the macro's `(if #f #f)` default now
  parses)
