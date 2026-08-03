## ADDED Requirements

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

## MODIFIED Requirements

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
