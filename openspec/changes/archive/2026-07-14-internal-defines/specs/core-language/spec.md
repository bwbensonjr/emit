## ADDED Requirements

### Requirement: Internal defines with letrec* semantics

The language SHALL accept a run of `define` forms at the head of a `lambda`, `let`, `letrec`,
or `begin` body, binding those names over the rest of the body with `letrec*` semantics: each
defined name is visible to the body expressions and to the other defines in the run, so mutual
and forward references within the run resolve. The defines SHALL produce the same core-IL as
the equivalent top-level defines. A `define` that does not form part of the leading run (i.e.
appears after a non-define body expression) SHALL remain an error.

#### Scenario: Internal define is bound over the body

- **WHEN** `((lambda (x) (define y (+ x 1)) (* y y)) 4)` is evaluated
- **THEN** the result is `25`

#### Scenario: Mutual reference within a body

- **WHEN** a body defines two procedures that call each other (e.g. even?/odd?) before a
  trailing expression that calls one of them
- **THEN** the mutual references resolve and the expression yields the correct result

#### Scenario: Define after a body expression is rejected

- **WHEN** a body places a `(define …)` after a non-define expression
- **THEN** compilation reports an error (defines must lead the body)
