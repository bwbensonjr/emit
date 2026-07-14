## ADDED Requirements

### Requirement: error aborts with a diagnostic

The language SHALL provide `(error who message irritant ...)` which reports a diagnostic
(the who, the message, and the irritants) and aborts the current computation via the runtime
trap mechanism. Under a host that installs the trap hook (the REPL host) the abort is caught
and reported without terminating the process; in a standalone executable it terminates with a
nonzero status. A general resumable condition system is NOT provided.

#### Scenario: error reports and aborts under the REPL host

- **WHEN** a form evaluates `(error 'parse "bad expression" 'x)` in the interactive REPL
- **THEN** the session reports the diagnostic (who/message/irritant) and remains alive for
  the next form, rather than returning a value

#### Scenario: error terminates a standalone program

- **WHEN** a standalone (AOT) program evaluates `(error 'oops "no")`
- **THEN** the program terminates with a nonzero exit status after reporting the diagnostic

### Requirement: minimal single-level guard (if required by the core)

Where the compiler core needs to recover from an aborted computation, the language SHALL
provide a single-level `guard` form `(guard (var clause ...) body ...)` that evaluates
`body`, and on an abort runs the first matching clause with `var` bound to the diagnostic.
This is a single, non-resumable catch, not a general handler stack. (If the core needs no
recovery — recovery living in the driver/host — this requirement does not apply.)

#### Scenario: guard recovers from an abort

- **WHEN** `(guard (e (#t 'recovered)) (error 'x "boom"))` is evaluated
- **THEN** the result is `'recovered` (the handler ran on the abort)
