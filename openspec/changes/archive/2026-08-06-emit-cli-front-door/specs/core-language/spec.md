## ADDED Requirements

### Requirement: A program's reported final value suppresses the unspecified value

A program SHALL report its final value on completion, using the runtime's write-style value printer.
When that value is **the unspecified value**, the program SHALL print nothing for it — neither the
value's written representation nor a trailing newline. Any other final value, including `#f` and
`()`, SHALL be printed as before.

This is the program-level counterpart of the interactive door's existing echo-suppression rule
(`interactive-repl`, "Read-eval-print loop prints results interactively"). The two SHALL agree: a
form that prints nothing at the prompt SHALL print nothing as a program's last form, so the
development loop and the delivered artifact do not disagree about the same value.

**It is a reporting policy, not a property of the value.** An explicit `(write (if #f #f))` or
`(display (if #f #f))` SHALL still render `#<unspecified>`, as the unspecified value's own
requirement demands; suppression applies only to the automatic report of the program's final value.
Output the program itself produced is unaffected.

The rule SHALL hold identically on every exit — running in process, a delivered native executable,
the batch JIT, and bitcode — so that a program's standard output is byte-identical however it is
run. This is what makes the suppression safe: the doors continue to agree, which is the property the
unsuppressed report existed to protect.

This requirement is why the unspecified value must remain distinct from `#f` and `()`: those are
legitimate final values that must still print.

#### Scenario: A program ending in output prints no trailing value

- **WHEN** a program whose last form is `(newline)` (or any form yielding the unspecified value) is
  run
- **THEN** its standard output is exactly the output the program produced, with no `#<unspecified>`
  line appended

#### Scenario: A delivered executable agrees with the in-process run

- **WHEN** the same program is run in process and as a delivered native executable
- **THEN** the two produce byte-identical standard output

#### Scenario: A legitimate #f or empty-list final value still prints

- **WHEN** a program's final value is `#f`, and separately when it is `()`
- **THEN** each is printed, because suppression applies only to the unspecified value

#### Scenario: An explicit write of the unspecified value is unaffected

- **WHEN** a program evaluates `(write (if #f #f))`
- **THEN** it writes `#<unspecified>`, because the suppression is a policy of the final-value report
  and not of the value printer
