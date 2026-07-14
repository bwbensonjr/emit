## ADDED Requirements

### Requirement: Type predicate primitives

The language SHALL provide the type predicates `symbol?`, `string?`, `char?`, `boolean?`,
`integer?`, and `exact?` as primitives, each returning `#t` or `#f` by inspecting the runtime
type tag of its argument. `symbol?`, `string?`, and `char?` SHALL be true exactly for values of
those types; `boolean?` SHALL be true exactly for `#t` and `#f`. In the current fixnum-only
number representation `integer?` and `exact?` SHALL both be true exactly for numbers; they are
provided under distinct names for forward compatibility. Together with the existing `pair?`,
`null?`, and `vector?`, these complete the set of type predicates the compiler core relies on.

#### Scenario: Predicates classify by type

- **WHEN** a program evaluates `(symbol? 'a)`, `(string? "x")`, `(char? #\z)`, `(boolean? #f)`,
  and `(integer? 7)`
- **THEN** each yields `#t`

#### Scenario: Predicates reject other types

- **WHEN** a program evaluates `(symbol? 1)`, `(string? 'a)`, and `(char? "x")`
- **THEN** each yields `#f`
