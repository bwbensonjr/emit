## MODIFIED Requirements

### Requirement: The project's tools conform to the observability principle

The build, compile, regeneration, formatting, and test tooling SHALL be brought into
conformance with this capability. Specifically, `Makefile` targets, the shipped `emit`
binary's four doors (`run`, `build`, `lib`, `repl`), the `schemec` filter,
`tools/regen.sh`, `tools/format.sh`, `run-all-tests.sh`, `run-dev-tests.sh`, and the
compiler driver's stage logging SHALL each announce their actions, report their relevant
metrics, and respect the format, stream, and verbosity requirements above.

The formatting tool SHALL name the covered set it resolved and report the counts that make
a formatting run observable — files considered, files changed or that would change — with
its elapsed time, on standard error. Its commit-time gate SHALL announce a skip, and the
reason for it, rather than passing silently when the formatter is unavailable: a gate that
is quiet when it does nothing is indistinguishable from a gate that is quiet because
everything passed.

The compiler's per-pass stage announcements SHALL be available from the shipped binary as
well as from the Chez driver: at `verbose` verbosity each door SHALL announce each frontend
pass by name in the order it runs. (The tool list previously named `bin/scheme-compile`,
which was removed when the doors were unified behind `emit <verb>`.)

#### Scenario: Each listed tool announces action, inputs/outputs, and metrics

- **WHEN** any of `Makefile` targets, an `emit` door, `schemec`, `tools/regen.sh`,
  `tools/format.sh`, `run-all-tests.sh`, `run-dev-tests.sh`, or the compiler driver runs at
  the default level
- **THEN** it announces the action it performs, names its inputs and outputs, and reports
  the metrics relevant to that action

#### Scenario: A test runner reports a per-suite and total summary

- **WHEN** `run-all-tests.sh` or `run-dev-tests.sh` finishes
- **THEN** it reports each suite's pass/fail result and its timing, plus a total count and
  total elapsed time

#### Scenario: A door announces its passes at verbose verbosity

- **WHEN** an `emit` door compiles a program at `verbose` verbosity
- **THEN** each frontend pass is announced by name, on standard error, in the order it runs

#### Scenario: A formatting run reports its covered set and its counts

- **WHEN** the formatting tool finishes at the default level
- **THEN** its output names the covered set it resolved, the number of files considered,
  the number changed or that would change, and the elapsed time

#### Scenario: A skipped formatting gate says so

- **WHEN** the commit-time formatting gate runs and the formatter is unavailable
- **THEN** it reports the skip and names what it looked for, rather than exiting silently
