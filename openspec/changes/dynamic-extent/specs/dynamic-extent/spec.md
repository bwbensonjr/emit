## ADDED Requirements

### Requirement: Escape continuations via call-with-current-continuation

The language SHALL provide `call-with-current-continuation` and its abbreviation `call/cc`, taking a
procedure of one argument and applying it to a **continuation object**. The continuation object SHALL
be a procedure of one argument; invoking it SHALL cause `call/cc` to return that argument, abandoning
whatever computation was in progress.

If the procedure returns normally instead, `call/cc` SHALL return its value.

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

- **WHEN** a program uses `call/cc` to return early from a fold over a list as soon as a predicate
  holds
- **THEN** the result is the value passed to the continuation, and the remaining elements are not
  processed

#### Scenario: Invoking a continuation outside its extent is a diagnostic

- **WHEN** a program stores the continuation captured by `call/cc` in a variable, allows the `call/cc`
  to return, and then invokes the stored continuation
- **THEN** the program reports an error identifying that the continuation was invoked outside its
  extent, rather than resuming, crashing, or producing a wrong value

### Requirement: dynamic-wind runs its after thunk on every exit

The language SHALL provide `dynamic-wind`, taking three thunks — `before`, `thunk`, `after`. It SHALL
call `before`, then `thunk`, then `after`, and return the value of `thunk`.

`after` SHALL be called on **every** exit from `thunk`: a normal return, an escape via a continuation
captured outside the `dynamic-wind`, and a `raise` that is not handled within `thunk`. When several
`dynamic-wind`s are exited at once, their `after` thunks SHALL run **innermost first**.

#### Scenario: after runs on a normal return

- **WHEN** a program runs a `dynamic-wind` whose `thunk` returns normally, recording each step
- **THEN** the recorded order is `before`, the body, `after`, and the value is the body's value

#### Scenario: after runs when a continuation escapes past it

- **WHEN** a program captures a continuation outside a `dynamic-wind` and invokes it from inside the
  `thunk`
- **THEN** the `after` thunk runs before control reaches the `call/cc` return point

#### Scenario: after runs when a raise crosses it

- **WHEN** a program raises inside a `dynamic-wind` whose `thunk` is enclosed by a `guard` outside the
  `dynamic-wind`
- **THEN** the `after` thunk runs before the guard clause is evaluated

#### Scenario: Nested winds unwind innermost first

- **WHEN** a program escapes from inside two nested `dynamic-wind`s to a point outside both, each
  recording its `after`
- **THEN** the inner `after` is recorded before the outer one

### Requirement: Parameter objects and parameterize

The language SHALL provide `make-parameter`, returning a **parameter object**: a procedure that,
called with zero arguments, returns the parameter's current value. `make-parameter` SHALL accept an
optional **converter** procedure, applied to the initial value and to every value subsequently bound.

The language SHALL provide `parameterize`, binding one or more parameter objects to new values for
the dynamic extent of its body and restoring the previous values on exit. Restoration SHALL occur on
**every** exit, including an escape and an unhandled raise, on the same terms as `dynamic-wind`.

#### Scenario: A parameter returns its value when called

- **WHEN** a program evaluates `(let ((p (make-parameter 10))) (p))`
- **THEN** the result is `10`

#### Scenario: parameterize binds for the dynamic extent and restores after

- **WHEN** a program evaluates
  `(let ((p (make-parameter 1))) (list (p) (parameterize ((p 2)) (p)) (p)))`
- **THEN** the result is `(1 2 1)`

#### Scenario: The converter is applied to the initial and bound values

- **WHEN** a program makes a parameter with a converter and reads it, then reads it inside a
  `parameterize`
- **THEN** both values are the converter's results, not the raw arguments

#### Scenario: An escape out of parameterize restores the previous value

- **WHEN** a program escapes via a continuation out of a `parameterize` body and then reads the
  parameter
- **THEN** the value read is the one in effect before the `parameterize`

#### Scenario: A parameter is callable like any accessor procedure

- **WHEN** a program passes a parameter object where a zero-argument procedure is expected and the
  receiver calls it
- **THEN** the parameter's current value is returned, so a parameter is substitutable for a plain
  accessor at the call site

### Requirement: guard and raise participate in unwinding

`guard` and `raise` SHALL share one unwinding mechanism with escape continuations, so that the
`after` thunk of every `dynamic-wind` between the raise point and the handler runs, innermost first,
**before** the handler's clauses are evaluated.

The behaviour of `guard` and `raise` SHALL otherwise be unchanged: a raised object is delivered to
the nearest enclosing `guard`, and an unhandled raise is rendered and terminates the program as
before.

#### Scenario: Existing guard behaviour is preserved

- **WHEN** a program raises an error object caught by an enclosing `guard` with no `dynamic-wind`
  involved
- **THEN** the clause selected and the value produced are the same as before this change

#### Scenario: An unhandled raise still terminates as before

- **WHEN** a program raises with no enclosing `guard`
- **THEN** the object is rendered and the program terminates non-zero, as before this change

#### Scenario: Cleanup runs before the handler sees the object

- **WHEN** a `dynamic-wind` sits between a `raise` and its `guard`, and both the `after` thunk and
  the guard clause record their execution
- **THEN** the `after` thunk's record precedes the guard clause's
