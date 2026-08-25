## MODIFIED Requirements

### Requirement: with-exception-handler is a named, public procedure

The language SHALL provide `with-exception-handler`, taking a handler procedure and a thunk, which
installs the handler as the current exception handler for the dynamic extent of the thunk and returns
the thunk's value. Installation and removal SHALL ride `dynamic-wind`, so an escape or a raise out of
the thunk restores the previous handler chain. `guard` SHALL be expressed in terms of this procedure
rather than a differently-spelled internal one, and the name SHALL be part of `(scheme base)`'s
declared public surface — it is R7RS's own spelling for exactly this operation.

While the installed handler is running for either `raise` or `raise-continuable`, the current
exception handler SHALL be the handler that was current when the installed handler was established.
If a handler invoked by `raise-continuable` returns, the installed handler SHALL become current again
before evaluation resumes in the protected thunk.

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

#### Scenario: The handler is current again after continuable delivery

- **WHEN** a handler returns from one `raise-continuable` and the protected thunk immediately invokes
  `raise-continuable` again
- **THEN** the same installed handler receives the second object

## ADDED Requirements

### Requirement: raise-continuable resumes with handler values

The language and `(scheme base)` SHALL provide `raise-continuable`. It SHALL invoke the current
exception handler with the raised object in the dynamic environment specified for R7RS exception
handlers. If the handler returns normally, all values it returns SHALL become the values returned by
`raise-continuable`, and evaluation SHALL continue at its call site without unwinding the protected
dynamic extent.

#### Scenario: A warning handler supplies a replacement value

- **WHEN** a handler returns `42` for `(raise-continuable "warning")` in the expression
  `(+ (raise-continuable "warning") 23)`
- **THEN** the expression evaluates to `65`

#### Scenario: Multiple handler values are preserved

- **WHEN** a continuable handler returns two values and the call is consumed by `call-with-values`
- **THEN** the receiver obtains both values in order

#### Scenario: Dynamic-wind remains active across a continuable raise

- **WHEN** `raise-continuable` occurs in a `dynamic-wind` body and its handler returns
- **THEN** the after thunk has not run at the resumption point and runs exactly once when the body
  later exits

