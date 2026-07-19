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

### Requirement: the multiple-values bundle is a disjoint, safely-printable type

The runtime representation of a multiple-values bundle SHALL be a heap type
dispatched on its tag and header, **disjoint** from every user-visible value type,
so that `%mv?` (and thus `call-with-values`) never misidentifies a legitimate
single value — list, vector, record, string, etc. — as a bundle, and never
misroutes one. The final-value printer SHALL render a stray bundle **safely** (a
fixed marker such as `#<values>`) rather than crash or misprint.

Using a zero-or-many bundle where an ordinary single value is expected is "an
error" (R7RS latitude): the runtime applies the SAME unchecked semantics it
already applies to any type confusion — e.g. `(car x)` for a non-pair `x` — so a
misused bundle is no less safe than any other value used out of type. This change
does NOT add type-checking to the pair accessors (that is a separate concern); it
only guarantees the bundle is disjoint and that a bundle reaching the printer is
rendered safely.

#### Scenario: a stray top-level bundle prints safely

- **WHEN** a program's top-level value is a zero-or-many bundle, e.g. the whole
  program is `(values 1 2)`
- **THEN** the runner prints a safe fixed rendering (e.g. `#<values>`) and
  completes without a segfault or memory error — the disjoint header lets the
  printer recognize the bundle rather than misread it as another type
