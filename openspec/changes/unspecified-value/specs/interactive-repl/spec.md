## MODIFIED Requirements

### Requirement: Read-eval-print loop prints results interactively

The project SHALL provide an interactive REPL driver that reads a Scheme form from input,
drives the existing reader/expander/codegen to produce the form's IR, executes it in the
persistent JIT host, and prints the resulting value using the runtime value printer, then
awaits the next form. Entering end-of-input SHALL end the session cleanly.

When the form's result is the unspecified value, the REPL SHALL print nothing for that result —
neither the value's written representation nor a trailing newline — and SHALL proceed directly to the
next prompt. Any other value, including `#f` and `()`, SHALL be printed as before. Output the form
itself produced (via `display`, `write`, `newline`, and the like) is unaffected: suppression applies
only to the echo of the result.

This keeps side-effecting forms quiet at the prompt, matching Chez Scheme's waiter and Racket's REPL,
and is the reason the unspecified value must be distinct from `#f` and `()` — those are legitimate
results that must still print.

#### Scenario: A form is read, evaluated, and printed

- **WHEN** the user enters `(+ 1 2)` at the REPL prompt
- **THEN** the REPL prints `3` and prompts for the next form

#### Scenario: End of input ends the session

- **WHEN** the input stream reaches end-of-file
- **THEN** the REPL exits cleanly without error

#### Scenario: A side-effecting form echoes nothing

- **WHEN** the user enters `(display "hi")` at the REPL prompt
- **THEN** the REPL prints `hi` — the form's own output — and then prompts for the next form with no
  echoed result value, rather than printing `hi()`

#### Scenario: An unspecified result from a mutation echoes nothing

- **WHEN** the user enters `(vector-set! v 0 1)` at the REPL prompt
- **THEN** the REPL prints nothing and prompts for the next form

#### Scenario: Legitimate #f and empty-list results still print

- **WHEN** the user enters `(null? 1)` and then `(list)` at the REPL prompt
- **THEN** the REPL prints `#f` and then `()` — suppression applies only to the unspecified value, not
  to falsity or emptiness
