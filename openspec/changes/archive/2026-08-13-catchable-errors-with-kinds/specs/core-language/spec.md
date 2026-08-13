## ADDED Requirements

### Requirement: The runtime trap mechanism raises a catchable condition

A runtime-detected error arising from **data** SHALL be raised as a condition into the same handler
chain as `raise`, so that an enclosing `guard` can catch it. It SHALL NOT bypass the handler chain to
abort the computation directly.

This SHALL apply to every diagnostic that the requirements above describe as reported "via the
runtime trap mechanism" — a wrong-typed argument to a primitive, an indexed access out of range, a
negative size, exact integer overflow, division by zero — and to `apply` when its last argument is
not a proper list. Those requirements are unchanged in what they detect and in what they report; this
requirement states what the mechanism they name does with it.

The raised object SHALL be an error object: `error-object?` SHALL be true for it, and
`error-object-message` SHALL return the diagnostic text. Its irritants SHALL be the empty list, so
that the text of an **uncaught** diagnostic is exactly what it was before — the message and nothing
else.

**A violation of the runtime's own invariants SHALL remain fatal** and SHALL NOT be raised. This
covers exhaustion of the escape/guard frame stack, an escape to a frame that is no longer live, an
allocation failure, and an arity mismatch. The distinction is that a condition about data leaves the
runtime's machinery intact and a handler can meaningfully run, whereas these report that the
machinery itself is unsound — and a handler would run on the very structures whose invariant failed.

When no handler is installed, a raised trap SHALL report and abort exactly as an uncaught `error`
does: under a host that installs the outermost trap the abort is reported and the process survives;
in a standalone executable it terminates with a nonzero status.

The mechanism SHALL be re-entrant-safe: a trap raised while a trap is already being delivered SHALL
report and abort rather than recurse.

#### Scenario: A wrong-typed argument is caught by guard

- **WHEN** a program evaluates `(guard (e (#t (list 'caught (error-object? e)))) (+ 1 'a))`
- **THEN** the result is `(caught #t)` — the trap is delivered to the handler rather than
  terminating the program

#### Scenario: An out-of-range index is caught by guard

- **WHEN** a program evaluates `(guard (e (#t 'caught)) (vector-ref (vector 1 2) 9))`
- **THEN** the result is the symbol `caught`

#### Scenario: apply with an improper last argument is caught

- **WHEN** a program evaluates `(guard (e (#t 'caught)) (apply + '(2 3 . 4)))`
- **THEN** the result is the symbol `caught`

#### Scenario: The caught object carries the diagnostic

- **WHEN** a program catches the trap from `(vector-ref (vector 1 2) 9)` and reads
  `(error-object-message e)` and `(error-object-irritants e)`
- **THEN** the message is the same diagnostic text the uncaught trap reports, and the irritants are
  the empty list

#### Scenario: An uncaught trap reports exactly as before

- **WHEN** a program evaluates `(+ 1 'a)` with no enclosing `guard`
- **THEN** the reported text is unchanged from before this requirement, and the program aborts as it
  did — the host survives, or a standalone executable exits nonzero

#### Scenario: Two traps in sequence are both catchable

- **WHEN** a program catches a trap and then evaluates a second trapping expression inside another
  `guard`
- **THEN** the second is caught as well — delivering a trap does not leave the mechanism disarmed

#### Scenario: A trap raised inside a handler does not recurse

- **WHEN** a `guard` handler itself evaluates a trapping expression while handling a trap
- **THEN** the program reports and aborts rather than recursing without bound

#### Scenario: Exhausting the escape frame stack stays fatal

- **WHEN** a program nests escapes or guards past the runtime's frame limit
- **THEN** it reports and aborts, and the condition is not delivered to any handler

### Requirement: Error objects carry a source kind, exposed as read-error? and file-error?

An error object SHALL carry a **kind** identifying what raised it, and the language SHALL provide
`read-error?` and `file-error?` over it. Each SHALL be true only for an object raised by its own
source, and false for every other object, including a non-error object.

- An object raised by `error` SHALL satisfy neither predicate.
- An object raised because a **read** failed on malformed input SHALL satisfy `read-error?` and not
  `file-error?`.
- An object raised because a **file operation** could not be performed SHALL satisfy `file-error?`
  and not `read-error?`.
- An object raised by the runtime trap mechanism SHALL satisfy neither, while still satisfying
  `error-object?`.

The kind SHALL NOT be exposed as a public accessor. `read-error?` and `file-error?` are the whole of
the R7RS-small surface over it, so the encoding remains an internal representation detail that a
later change may replace without altering any specified behaviour.

Adding the kind SHALL NOT change the message or irritants of any error object, nor the text that an
uncaught one reports.

#### Scenario: An error object from error is neither kind

- **WHEN** a program evaluates
  `(guard (exn (else (list (read-error? exn) (file-error? exn)))) (error "BOOM!"))`
- **THEN** the result is `(#f #f)`

#### Scenario: A malformed read raises a read error

- **WHEN** a program reads malformed datum text from a port inside a `guard` and applies
  `read-error?` to the caught object
- **THEN** the result is `#t`, and `file-error?` on the same object is `#f`

#### Scenario: Opening a nonexistent file raises a file error

- **WHEN** a program evaluates
  `(file-error? (guard (exn (else exn)) (open-input-file "no such file")))`
- **THEN** the result is `#t`, and `read-error?` on the same object is `#f`

#### Scenario: The predicates are false for a non-error object

- **WHEN** a program evaluates `(guard (e (#t (list (read-error? e) (file-error? e)))) (raise 'boom))`
- **THEN** the result is `(#f #f)`

#### Scenario: A caught trap is an error object of neither kind

- **WHEN** a program catches the trap from `(+ 1 'a)` and applies `error-object?`, `read-error?`, and
  `file-error?` to it
- **THEN** the results are `#t`, `#f`, and `#f`
