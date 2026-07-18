## MODIFIED Requirements

### Requirement: not primitive

The compiler SHALL provide `not` as a boolean-negation operation that returns `#t` when its
argument is `#f` and `#f` for every other value. `not` SHALL be exposed as an ordinary,
first-class, shadowable binding in the always-present primitive layer, defined over a reserved
raw primcall; a direct, unshadowed call SHALL still compile to the bare primitive operation
(see the `primitive-layer` capability). It SHALL NOT require importing `(scheme base)`.

#### Scenario: Boolean negation

- **WHEN** a program evaluates `(not #f)`, `(not #t)`, and `(not 0)`
- **THEN** the results are `#t`, `#f`, and `#f` (only `#f` is false)

#### Scenario: not is first-class and shadowable

- **WHEN** a program evaluates `(map not (list #f 0 #t))`, or defines `(define (not x) 'mine)`
- **THEN** `not` behaves as an ordinary procedure value, and a user definition shadows it
  (user-wins), like any other binding

## ADDED Requirements

### Requirement: Reserved-keyword status is limited to raw primitive operators

Plain primitive names (`cons`, `+`, `car`, `not`, `eqv?`, …) SHALL NOT be reserved keywords;
they SHALL be ordinary, rebindable bindings. Only the raw `%`-prefixed primitive operators
and the genuine syntactic keywords (`lambda`, `if`, `let`, `letrec`, `quote`, `set!`,
`define`, `define-syntax`, `syntax-rules`, and the derived-form macros) SHALL be reserved.
The M1 documentation and any requirement that previously described a plain primitive name as a
"reserved primitive (not rebindable)" is superseded by this requirement together with the
`primitive-layer` capability.

#### Scenario: A plain primitive name can be rebound

- **WHEN** a program or the REPL binds a plain primitive name (`(define (car x) …)`, or a
  lexical `let` over `+`)
- **THEN** the binding is accepted and shadows the primitive in scope, with no
  reserved-keyword error
