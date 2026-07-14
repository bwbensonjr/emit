<!-- Applies only if the "grow" path (D1) is chosen. If "avoid" is chosen, this change is an
     internal compiler refactor and adds no capability requirement (delete this delta). -->

## ADDED Requirements

### Requirement: Multiple return values

The language SHALL support multiple return values: `values` returns zero or more values,
`call-with-values` applies a consumer to the values produced by a producer thunk, and the
`let-values` derived form binds the values of an expression to a list of identifiers. A
single value SHALL behave as an ordinary expression result (degenerate case).

#### Scenario: let-values binds several values

- **WHEN** a program evaluates `(let-values ([(a b) (values 1 2)]) (+ a b))`
- **THEN** the result is `3`

#### Scenario: call-with-values

- **WHEN** a program evaluates `(call-with-values (lambda () (values 1 2 3)) list)`
- **THEN** the result is `(1 2 3)`

#### Scenario: single value is ordinary

- **WHEN** a value produced with `values` of one argument is used in expression position
- **THEN** it behaves exactly as that single value
