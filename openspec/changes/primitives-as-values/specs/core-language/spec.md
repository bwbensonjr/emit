## ADDED Requirements

### Requirement: Primitives usable as first-class values

The standard library SHALL make the primitives it exposes usable as first-class values — at
minimum `car`, `cons`, and `string-append` — so they can be passed to higher-order procedures
such as `map`, `apply`, and the folds. A reference to one of these names in value position
SHALL evaluate to a procedure with the primitive's behavior, while a direct call in operator
position SHALL continue to compile to the primitive. `string-append` SHALL be variadic,
accepting any number of string arguments (zero arguments yielding the empty string), so that
`(apply string-append list-of-strings)` is well-defined for any arity.

#### Scenario: Primitive passed to a higher-order procedure

- **WHEN** a program evaluates `(map car (list (cons 1 2) (cons 3 4)))`
- **THEN** it yields `(1 3)` — `car` resolves as a value — and a direct `(car (cons 1 2))` still
  compiles to the primitive

#### Scenario: apply over variadic string-append

- **WHEN** a program evaluates `(apply string-append (list "a" "b" "c"))`
- **THEN** it yields `"abc"`, and `(apply string-append (list))` yields `""`
