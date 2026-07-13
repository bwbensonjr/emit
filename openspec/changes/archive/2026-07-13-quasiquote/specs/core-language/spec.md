## ADDED Requirements

### Requirement: Quasiquote construction

The compiler SHALL support `quasiquote` with `unquote` and `unquote-splicing` over list
structure. A quasiquoted datum SHALL evaluate to that structure as a constant, except that an
`unquote`d subform SHALL be replaced by the value of its expression and an `unquote-splicing`d
subform SHALL have the elements of its (list) value spliced into the enclosing list. Nesting
SHALL be respected: an `unquote`/`unquote-splicing` takes effect only at the matching
quasiquote level. The reader SHALL accept the sugar `` `x `` for `(quasiquote x)`, `,x` for
`(unquote x)`, and `,@x` for `(unquote-splicing x)`.

#### Scenario: Unquote a value into a list

- **WHEN** a program evaluates `` (let ((x 2)) `(a ,x b)) ``
- **THEN** the result is `(a 2 b)`

#### Scenario: Splice a list into a list

- **WHEN** a program evaluates `` (let ((ys (list 1 2))) `(0 ,@ys 3)) ``
- **THEN** the result is `(0 1 2 3)`

#### Scenario: Quasiquote with no unquotes is constant

- **WHEN** a program evaluates `` `(a b c) ``
- **THEN** the result is `(a b c)`

#### Scenario: Nested quasiquote

- **WHEN** a program evaluates `` (car `(a `(b ,(+ 1 2)))) ``
- **THEN** the result is the symbol `a` and the inner quasiquote is left intact (the `,(+ 1 2)`
  is not evaluated at the outer level)
