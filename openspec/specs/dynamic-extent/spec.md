# dynamic-extent Specification

## Purpose

Defines the R7RS constructs governing what happens as control enters and leaves a dynamic
extent: escape continuations via `call-with-current-continuation`, `dynamic-wind`, and
parameter objects (`make-parameter` / `parameterize`); the single dynamic handler stack that
`guard` and `raise` share with them; and the deviations from R7RS that escape-only
continuations entail.
## Requirements
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

The procedure `parameterize` expands into SHALL be `with-parameters`, taking a list of parameter
objects, a list of values, and a thunk — a declared **extension** of `(scheme base)` (R7RS has no name
for it), so `parameterize` mentions only public names and the restoration logic lives in exactly one
place.

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

#### Scenario: The binding procedure is callable directly

- **WHEN** a program calls `with-parameters` with a computed list of parameters and values and a
  thunk
- **THEN** the parameters hold those values for the thunk's dynamic extent and are restored on exit,
  identically to `parameterize`

### Requirement: with-exception-handler is a named, public procedure

The language SHALL provide `with-exception-handler`, taking a handler procedure and a thunk, which
installs the handler as the current exception handler for the dynamic extent of the thunk and returns
the thunk's value. Installation and removal SHALL ride `dynamic-wind`, so an escape or a raise out of
the thunk restores the previous handler chain. `guard` SHALL be expressed in terms of this procedure
rather than a differently-spelled internal one, and the name SHALL be part of `(scheme base)`'s
declared public surface — it is R7RS's own spelling for exactly this operation.

`raise-continuable` remains unimplemented; a handler that returns normally SHALL fall through to the
unhandled path, as before.

#### Scenario: A handler installed by with-exception-handler sees a raised object

- **WHEN** a program calls `with-exception-handler` with a handler that escapes to a captured
  continuation, and the thunk raises
- **THEN** the handler runs with the raised object and control reaches the escape target

#### Scenario: The handler chain is restored on exit

- **WHEN** a program returns normally from `with-exception-handler`, and then raises with no
  enclosing handler
- **THEN** the raise takes the unhandled path, showing the installed handler was removed on exit

#### Scenario: guard is built on the public procedure

- **WHEN** a program with no explicit import uses `guard`
- **THEN** the expansion resolves `with-exception-handler` as a `(scheme base)` export and behaves as
  specified for `guard`

### Requirement: guard and raise participate in unwinding

The implementation SHALL maintain a single dynamic **handler stack** — the R7RS "current exception
handler" chain. `raise` SHALL invoke the current handler rather than transferring control directly,
and `guard` SHALL be expressed as a handler that escapes to the guard's continuation. There SHALL
NOT be a second, parallel mechanism for exceptions.

A condition detected by the **runtime** — a wrong-typed argument, an indexed access out of range, a
negative size, an exact integer overflow, a division by zero, or `apply` with an improper last
argument — SHALL enter this same handler stack, at the point the trap fires, with the same
unwinding obligations as any other raise. It is not a second mechanism: it is the existing one with
a new origin, which is what makes the "one mechanism, not two" clause above hold for the runtime's
diagnostics as well as for `raise`.

The runtime SHALL hand off **once** and SHALL NOT drive the unwinding itself. It builds the
condition and invokes an installed Scheme raiser; from that call onward the transfer belongs to the
handler chain — the handler is found in Scheme, the escape is an ordinary escape, and the
intervening `after` thunks run on the ordinary path. A runtime that instead called back into Scheme
once per `after` thunk would put a control transfer of unknown length inside its own error path,
which this requirement forbids.

Until a raiser is installed, and where none can be (a program compiled without the prelude has no
handler chain), a runtime-detected condition SHALL report and abort as it did before. That is the
correct behaviour in the absence of a handler chain, not a degraded one.

As a consequence, the `after` thunk of every `dynamic-wind` between the raise point and the handler
SHALL run, innermost first, **before** the handler's clauses are evaluated — the escape that `guard`
performs is an ordinary escape and unwinds on the ordinary path.

The behaviour of `guard` and `raise` SHALL otherwise be unchanged: a raised object is delivered to
the nearest enclosing `guard`, and an unhandled raise is rendered and terminates the program as
before.

**A trap delivered into the handler chain SHALL reach the chain of the code that trapped.** The
mechanism that raises a runtime trap as a condition (see `core-language`) is a host-level installation,
and a host process may hold more than one instance of the standard library — a compiler linked with its
own, plus one compiled for the code it is compiling. Each instance has its own `guard`/handler chain,
so the raiser in effect SHALL be the one belonging to the code currently executing rather than
whichever instance was initialized last. Without this, handlers installed by one instance silently
never see traps raised in its own code, and the failure appears as an unrelated abort several layers
from its cause.

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

#### Scenario: One mechanism, not two

- **WHEN** a `guard` and an escape continuation both unwind past the same `dynamic-wind`
- **THEN** the `after` thunk runs exactly once in each case, and the observable order is the same,
  because both take the same unwinding path

#### Scenario: A runtime trap unwinds like any other raise

- **WHEN** a `dynamic-wind` sits between a trapping expression — `(vector-ref (vector 1) 9)` — and
  an enclosing `guard`, and both the `after` thunk and the guard clause record their execution
- **THEN** the `after` thunk's record precedes the guard clause's, exactly as it does for a `raise`

#### Scenario: A runtime trap is delivered to the current handler

- **WHEN** a program evaluates a trapping expression inside `with-exception-handler`'s thunk
- **THEN** the installed handler is invoked with the condition, rather than the computation aborting

#### Scenario: Delivering a trap does not disarm the mechanism

- **WHEN** a program catches a runtime trap and then evaluates a second trapping expression inside
  another `guard`
- **THEN** the second is caught as well

#### Scenario: A guard in one library instance catches its own trap

- **WHEN** a host holds two instances of the standard library, code in the first installs a `guard`,
  and a runtime trap fires inside that code while the second instance is the most recently initialized
- **THEN** the first instance's handler runs, rather than the trap walking the second instance's empty
  chain and escaping to the host

### Requirement: An after thunk that itself raises or escapes

A `dynamic-wind`'s entry SHALL be removed from the wind list **before** its `after` thunk runs, so
that a raise or escape originating inside that `after` cannot re-enter it. An `after` thunk SHALL
therefore never run twice, and unwinding SHALL never loop.

When an `after` thunk raises or escapes during an unwind, the **new** transfer takes over: it
unwinds from the (already shallower) wind depth to its own target, running the remaining `after`
thunks on the way. The original transfer's destination is abandoned. Cleanup is therefore not
skipped — only the destination changes.

#### Scenario: An after thunk that raises does not run twice

- **WHEN** a program escapes past a `dynamic-wind` whose `after` thunk raises, and that raise is
  caught by an enclosing `guard`
- **THEN** the `after` thunk has run exactly once, and the guard clause receives the object the
  `after` raised — not the original escape's value

#### Scenario: Outer cleanup still runs when an inner after thunk raises

- **WHEN** two `dynamic-wind`s are being unwound, the inner one's `after` raises, and a `guard`
  outside both catches it
- **THEN** the outer `after` thunk still runs, because the new transfer unwinds through it

### Requirement: A non-matching guard reraises in the guard's dynamic environment

When no `guard` clause matches and there is no `else`, the object SHALL be reraised to the next
enclosing handler.

R7RS specifies that this reraise occurs "within the dynamic environment of the original call to
`raise`". This implementation SHALL instead reraise in the **`guard`'s** dynamic environment, and
SHALL document the deviation: returning to the raise point requires re-entering a continuation whose
extent has ended, which escape continuations cannot do. A consequence is that any `dynamic-wind`
`after` thunk between the raise point and the `guard` has already run by then, and SHALL NOT run
again.

#### Scenario: A non-matching guard passes the object outward

- **WHEN** a raise is enclosed by an inner `guard` whose clauses all fail and an outer `guard` that
  matches
- **THEN** the outer `guard`'s clause receives the original object

#### Scenario: Cleanup between the raise point and a non-matching guard runs once

- **WHEN** a `dynamic-wind` sits between a raise and an inner non-matching `guard`, with an outer
  `guard` that matches, and the `after` thunk records each run
- **THEN** the `after` thunk has run exactly once by the time the outer clause is evaluated

