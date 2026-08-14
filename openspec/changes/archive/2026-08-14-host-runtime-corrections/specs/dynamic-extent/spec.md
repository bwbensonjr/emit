## MODIFIED Requirements

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
