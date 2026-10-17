# Spec Delta

## MODIFIED Requirements

### Requirement: Escape continuations via call-with-current-continuation

The language SHALL provide `call-with-current-continuation` and its abbreviation `call/cc`, taking a
procedure of one argument and applying it to a **continuation object**. The continuation object SHALL
be a procedure accepting zero or more arguments; invoking it SHALL cause `call/cc` to return those
values in order, abandoning whatever computation was in progress.

If the procedure returns normally instead, `call/cc` SHALL return all its values.

The continuations provided SHALL be **escape continuations**: valid only within the dynamic extent of
the `call/cc` that captured them. Invoking a continuation **after** that extent has ended SHALL raise
an error identifying the cause; it SHALL NOT resume the ended computation and SHALL NOT produce
undefined behaviour. Programs requiring re-entrant continuations — generators, coroutines,
backtracking — are therefore NOT supported, and this restriction SHALL be recorded in the
implementation's R7RS conformance notes.

#### Scenario: A continuation escapes from the middle of a computation

- **WHEN** a program evaluates `(+ 1 (call/cc (lambda (k) (+ 100 (k 41)))))`
- **THEN** the result is `42` — the `(+ 100 …)` is abandoned

#### Scenario: A continuation not invoked returns normally

- **WHEN** a program evaluates `(call/cc (lambda (k) 7))`
- **THEN** the result is `7`

#### Scenario: Escaping from a loop

- **WHEN** a program uses `call/cc` to return early from a fold over a list as soon as a predicate holds
- **THEN** the result is the value passed to the continuation, and the remaining elements are not processed

#### Scenario: Invoking a continuation outside its extent is a diagnostic

- **WHEN** a program stores the continuation captured by `call/cc` in a variable, allows the `call/cc`
  to return, and then invokes the stored continuation
- **THEN** the program reports an error identifying that the continuation was invoked outside its
  extent, rather than resuming, crashing, or producing a wrong value

#### Scenario: Zero and multiple escape values reach the receiver

- **WHEN** a `call-with-values` producer invokes a live captured continuation with zero or several arguments
- **THEN** its consumer receives exactly those values in order
- **AND** passing one list as one argument continues to deliver a single list value

#### Scenario: Normal multiple-value returns are preserved

- **WHEN** the procedure passed to `call/cc` returns zero or several values without invoking its continuation
- **THEN** the enclosing receiver gets the same values as an ordinary producer returning them

#### Scenario: Multiple-value transfers preserve dynamic unwinding

- **WHEN** a multiple-value escape crosses nested winds and a parameterized extent
- **THEN** cleanup runs innermost first, parameters are restored, and the receiver gets every escape value

#### Scenario: Expired continuations are rejected at every arity

- **WHEN** a stored continuation is invoked after its extent with zero or several arguments
- **THEN** it reports the lifetime error before any wind stack is unwound
