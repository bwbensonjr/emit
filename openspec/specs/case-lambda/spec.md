# case-lambda Specification

## Purpose

Defines R7RS-small arity-dispatched procedures through the explicitly imported `(scheme case-lambda)` standard library.

## Requirements

### Requirement: The case-lambda standard library

Emit SHALL provide an ordinary importable `(scheme case-lambda)` library that exports the `case-lambda` syntax. The library SHALL be available to source programs, user libraries, the REPL, `emit run`, and standalone builds through the same module artifact mechanism as other non-baked standard libraries.

#### Scenario: An imported case-lambda macro works through both execution doors

- **WHEN** a program imports `(scheme case-lambda)`, defines a procedure with `case-lambda`, and is executed once with `emit run` and once as an AOT executable
- **THEN** both executions select the same clause and return the same value

#### Scenario: A user library exports a case-lambda procedure

- **WHEN** a manifest library imports `(scheme case-lambda)`, defines and exports an arity-dispatched procedure, and a program calls that export
- **THEN** the call succeeds without the importer needing to import `(scheme case-lambda)` itself

### Requirement: Clause selection follows source order

A `case-lambda` procedure SHALL select the first clause, in source order, whose formals accept the supplied arguments. The selected clause SHALL have the lexical scope and result behavior of an ordinary `lambda` with those formals and body.

#### Scenario: An earlier dotted clause wins

- **WHEN** a procedure has `((x . rest) 'first)` before `((x y) 'second)` and is called with two arguments
- **THEN** it returns `first`

#### Scenario: The selected clause returns multiple values

- **WHEN** a matching clause returns two values
- **THEN** the `case-lambda` call returns those same two values

### Requirement: Every R7RS formal shape is accepted

Each clause SHALL accept the same fixed-list, dotted-list, or rest-only formal syntax as `lambda`. A fixed clause SHALL match exactly its number of formals, a dotted clause SHALL match at least its fixed prefix, and a rest-only identifier SHALL match any number of arguments.

#### Scenario: Pitch-style fixed and catch-all clauses dispatch

- **WHEN** a `case-lambda` contains zero-, one-, and two-argument fixed clauses followed by a rest-only clause
- **THEN** calls of arity zero through two choose their fixed clauses and a call of arity three chooses the rest-only clause

#### Scenario: A dotted clause receives its remaining arguments

- **WHEN** a clause has formals `(x y . rest)` and is called with four arguments
- **THEN** `x` and `y` receive the first two arguments and `rest` is a list of the final two

### Requirement: An unmatched arity reports an error

Calling a `case-lambda` procedure when no clause accepts the supplied arguments SHALL signal an error through Emit's catchable exception path rather than selecting a clause, returning an unspecified value, or aborting outside the handler chain.

#### Scenario: A guard catches an unmatched arity

- **WHEN** a zero-argument-only `case-lambda` procedure is called with one argument inside `guard`
- **THEN** the guard receives the error and the process remains usable
