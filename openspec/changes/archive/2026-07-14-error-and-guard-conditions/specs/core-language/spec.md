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

<!-- Guard requirement dropped (D2, 2026-07-14): the only R6RS `guard` site is the
     REPL recovery in the driver (compile.ss), not the pure core; decompose-core-driver
     (archived) confirmed the split. No in-language `guard` is required by the core, so
     this change adds `error` only. See design.md D2. -->

