## ADDED Requirements

### Requirement: Program top-level effects follow source order

A program SHALL evaluate definition initializers and intervening top-level expressions in source order, exactly once. Later initializers SHALL observe earlier effects. Batch compilation SHALL preserve existing mutual procedure visibility, last-definition-wins behavior, final-expression results, and rejection of interleaved definitions in internal bodies.

#### Scenario: Mutation precedes a later initializer

- **WHEN** a program evaluates `(define x 1) (set! x 2) (define y x) (write y)` after its imports
- **THEN** `emit run`, a delivered `emit build` executable, and independent source compilation print `2`, agreeing with the same REPL forms

#### Scenario: Parameter update precedes a later initializer

- **WHEN** a program evaluates `(define p (make-parameter #f)) (p 5) (define r (p)) (write r)`
- **THEN** every compilation path prints `5`

#### Scenario: Effects interleave with redefinitions

- **WHEN** a program evaluates `(define x 1) (write x) (define x 2) (write x)`
- **THEN** the writes occur in order and produce `12`

#### Scenario: An expression precedes every definition

- **WHEN** a program writes `start`, then defines a value with an initializer that writes `init`, then writes `end`
- **THEN** its output is `startinitend` and each effect occurs once

#### Scenario: Mutual procedures remain visible

- **WHEN** top-level procedures refer to each other and are called after their definitions
- **THEN** their references resolve and their results match existing behavior

#### Scenario: Final values and internal bodies retain their contracts

- **WHEN** a program contains interleaved top-level effects and ends in a value-producing expression
- **THEN** its final value is preserved without duplicate evaluation
- **AND** placing a definition after an expression inside a lambda body still produces the existing frontend error
