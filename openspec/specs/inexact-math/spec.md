# inexact-math

## Purpose

The `(scheme inexact)` library: R7RS-small §6.2.6's inexact-only surface -- the non-finite
predicates and the transcendental and root procedures -- and its status as an ordinary,
explicitly imported standard library distinct from the auto-imported `(scheme base)`.

## Requirements

### Requirement: The (scheme inexact) library

The implementation SHALL provide `(scheme inexact)` as an R7RS-small standard library, importable
with `(import (scheme inexact))` and exporting `finite?`, `infinite?`, `nan?`, `exp`, `log`,
`sin`, `cos`, `tan`, `asin`, `acos`, `atan`, and `sqrt`.

Unlike `(scheme base)`, `(scheme inexact)` SHALL NOT be auto-imported: its bindings SHALL be
absent from a program that does not import it, and the names SHALL remain available for a program
to define itself. It SHALL be an ordinary library — resolved through the library manifest,
compiled to a unit artifact, and linked like any other — rather than a special case in the
compiler, so that the same bindings are available identically on every door (`emit run`,
`emit repl`, and a program built with `emit build`).

#### Scenario: Importing the library makes its procedures available

- **WHEN** a program begins with `(import (scheme inexact))` and evaluates `(sqrt 4)` and
  `(exp 0)`
- **THEN** the results are the flonums `2.0` and `1.0`

#### Scenario: Without the import the names are not bound

- **WHEN** a program that does not import `(scheme inexact)` references `sqrt`
- **THEN** compilation reports an unbound variable, rather than resolving to a library binding

#### Scenario: A program may define the names itself

- **WHEN** a program that does not import `(scheme inexact)` defines its own `sqrt` and calls it
- **THEN** its own definition is used, with no conflict

#### Scenario: Every door agrees

- **WHEN** the same program importing `(scheme inexact)` is run through `emit run`, evaluated in
  `emit repl`, and built into an executable with `emit build`
- **THEN** all three produce the same observable results

### Requirement: Non-finite predicates

`(scheme inexact)` SHALL provide `finite?`, `infinite?`, and `nan?`. `finite?` SHALL be true for
a real that is neither an infinity nor a NaN — including every exact integer. `infinite?` SHALL
be true for a positive or negative infinity only. `nan?` SHALL be true for a NaN only. Each
SHALL raise a runtime trap for a non-numeric argument.

Because a NaN is not numerically equal to itself, `nan?` SHALL be the supported way to detect
one; a program SHALL NOT need to rely on `(= x x)`.

#### Scenario: Classifying finite values

- **WHEN** a program evaluates `(finite? 3)`, `(finite? 3.5)`, `(infinite? 3.5)`, and
  `(nan? 3.5)`
- **THEN** the results are `#t`, `#t`, `#f`, and `#f`

#### Scenario: Classifying infinities

- **WHEN** a program evaluates `(infinite? (/ 1.0 0.0))`, `(finite? (/ 1.0 0.0))`, and
  `(infinite? (/ -1.0 0.0))`
- **THEN** the results are `#t`, `#f`, and `#t`

#### Scenario: Classifying a NaN

- **WHEN** a program evaluates `(nan? (sqrt -1.0))`, `(finite? (sqrt -1.0))`, and
  `(infinite? (sqrt -1.0))`
- **THEN** the results are `#t`, `#f`, and `#f`

### Requirement: Transcendental and root procedures

`(scheme inexact)` SHALL provide `exp`, `log`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, and
`sqrt`. Each SHALL accept any real argument — exact or inexact — and SHALL return an **inexact**
result. `log` SHALL accept an optional second argument, the base, computing `(/ (log z) (log b))`.
`atan` SHALL accept an optional second argument, computing the two-argument arctangent with the
quadrant determined by both operands' signs. A non-numeric argument SHALL raise a runtime trap.

`sqrt` SHALL return the inexact principal square root, and SHALL NOT return an exact root for an
exact perfect square: `(sqrt 4)` is `2.0`. The exact integer square root is
`exact-integer-sqrt` in `(scheme base)`.

Out-of-domain arguments SHALL follow IEEE 754 rather than raising a trap: a result that is
mathematically undefined or complex SHALL be a NaN, and a result that diverges SHALL be an
infinity. Emit is real-only, so no complex result is available, and R7RS §6.2.3 permits the
inexact non-finite answer. Returning a NaN also keeps the outcome testable with `nan?`, which a
trap — being uncatchable — would not be.

#### Scenario: Ordinary values

- **WHEN** a program evaluates `(exp 0)`, `(log 1)`, `(sin 0)`, `(cos 0)`, and `(sqrt 2)`
- **THEN** the results are the flonums `1.0`, `0.0`, `0.0`, `1.0`, and a value approximating
  `1.4142135623730951`

#### Scenario: An exact argument yields an inexact result

- **WHEN** a program evaluates `(sqrt 4)` and `(inexact? (sqrt 4))`
- **THEN** the results are the flonum `2.0` and `#t` — not the exact `2`

#### Scenario: The optional second arguments

- **WHEN** a program evaluates `(log 8 2)` and `(atan 1 1)`
- **THEN** the results are flonums approximating `3.0` and `0.7853981633974483`

#### Scenario: Out-of-domain arguments yield NaN, not a trap

- **WHEN** a program evaluates `(sqrt -1.0)`, `(log -1.0)`, and `(asin 2.0)`
- **THEN** each result is a NaN for which `nan?` is `#t`, and the program continues rather than
  aborting

#### Scenario: A divergent argument yields an infinity

- **WHEN** a program evaluates `(log 0.0)` and `(exp 1000.0)`
- **THEN** the results are negative infinity and positive infinity, each satisfying `infinite?`
