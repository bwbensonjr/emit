## ADDED Requirements

### Requirement: values produces multiple values

The `values` procedure SHALL accept any number of arguments and deliver them to
its continuation as that continuation's values. Calling `(values x)` with exactly
one argument SHALL return `x` unchanged — indistinguishable from evaluating `x`
directly — so that ordinary single-value code is unaffected by the presence of
`values`.

Calling `values` with zero arguments, or with two or more, SHALL produce a
distinguished multiple-values bundle that carries those arguments in order. The
bundle SHALL be disjoint from every user-visible value type (fixnum, boolean,
the empty list, pair, symbol, string, character, vector, bytevector, hash table,
record, closure): a legitimate single return value of any of those types SHALL
NOT be misidentified as a bundle.

`values` SHALL be an ordinary, shadowable binding provided by `(scheme base)`
(user-wins), not a reserved keyword.

#### Scenario: single value is the identity

- **WHEN** a program evaluates `(values 42)` in a single-value context, e.g.
  `(+ 1 (values 42))`
- **THEN** the result is `43` — `(values x)` behaves exactly as `x`

#### Scenario: a legitimate list value is not a bundle

- **WHEN** a program returns an ordinary list as a single value, e.g.
  `(call-with-values (lambda () (list 1 2 3)) (lambda (x) x))`
- **THEN** the consumer receives the one argument `(1 2 3)` — the list is a
  single value, not three values

### Requirement: call-with-values consumes produced values

The `call-with-values` procedure SHALL accept a producer thunk and a consumer
procedure. It SHALL call the producer with no arguments and apply the consumer to
the values the producer produced: a multiple-values bundle SHALL be spread so the
consumer receives one argument per produced value, and any other single result
SHALL be passed to the consumer as exactly one argument. The result of
`call-with-values` SHALL be whatever the consumer returns.

`call-with-values` SHALL be an ordinary, shadowable binding provided by
`(scheme base)`.

#### Scenario: multiple values are spread into the consumer

- **WHEN** a program runs
  `(call-with-values (lambda () (values 1 2 3)) (lambda (a b c) (+ a b c)))`
- **THEN** the result is `6` — the three produced values become the consumer's
  three arguments

#### Scenario: zero values

- **WHEN** a program runs
  `(call-with-values (lambda () (values)) (lambda () 'ok))`
- **THEN** the result is the symbol `ok` — the consumer is called with no
  arguments

#### Scenario: a single produced value

- **WHEN** a program runs
  `(call-with-values (lambda () 7) (lambda (x) (* x x)))`
- **THEN** the result is `49` — a producer that returns one ordinary value passes
  it as the consumer's single argument

#### Scenario: consumer receives a variadic list of values

- **WHEN** a program runs
  `(call-with-values (lambda () (values 1 2 3 4)) list)`
- **THEN** the result is `(1 2 3 4)` — the produced values are spread into the
  variadic `list`, reconstructing them as a list

### Requirement: the multiple-values bundle is memory-safe

The runtime representation of a multiple-values bundle SHALL be dispatched on its
runtime tag and subtype and SHALL NOT be interpreted as a type it is not. If a
zero-or-many bundle reaches a single-value continuation (an unspecified situation
under R7RS), the program SHALL fail safely — a type error or trap — and SHALL NOT
cause a memory fault, silent corruption, or miscomputation.

#### Scenario: a stray bundle fails safe, not unsafe

- **WHEN** a program uses a zero-or-many `values` result directly as an ordinary
  value, e.g. `(car (values 1 2))`
- **THEN** the program does not segfault or corrupt memory; it either raises/traps
  or otherwise fails safely (the exact behavior is unspecified per R7RS, but it is
  never memory-unsafe)
