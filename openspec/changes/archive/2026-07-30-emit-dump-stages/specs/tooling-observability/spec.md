## MODIFIED Requirements

### Requirement: The project's tools conform to the observability principle

The build, compile, regeneration, and test tooling SHALL be brought into conformance with
this capability. Specifically, `Makefile` targets, the shipped `emit` binary's four doors
(`run`, `build`, `lib`, `repl`), the `schemec` filter, `tools/regen.sh`,
`run-all-tests.sh`, `run-dev-tests.sh`, and the compiler driver's stage logging SHALL each
announce their actions, report their relevant metrics, and respect the format, stream, and
verbosity requirements above.

The compiler's per-pass stage announcements SHALL be available from the shipped binary as
well as from the Chez driver: at `verbose` verbosity each door SHALL announce each frontend
pass by name in the order it runs. (The tool list previously named `bin/scheme-compile`,
which was removed when the doors were unified behind `emit <verb>`.)

#### Scenario: Each listed tool announces action, inputs/outputs, and metrics

- **WHEN** any of `Makefile` targets, an `emit` door, `schemec`, `tools/regen.sh`,
  `run-all-tests.sh`, `run-dev-tests.sh`, or the compiler driver runs at the default level
- **THEN** it announces the action it performs, names its inputs and outputs, and reports
  the metrics relevant to that action

#### Scenario: A test runner reports a per-suite and total summary

- **WHEN** `run-all-tests.sh` or `run-dev-tests.sh` finishes
- **THEN** it reports each suite's pass/fail result and its timing, plus a total count and
  total elapsed time

#### Scenario: A door announces its passes at verbose verbosity

- **WHEN** an `emit` door compiles a program at `verbose` verbosity
- **THEN** each frontend pass is announced by name, on standard error, in the order it runs

## ADDED Requirements

### Requirement: The Chez-free doors honor the project verbosity control

Every door of the shipped compiler SHALL honor the project's single verbosity control at
all three levels, including the levels that require the embedded compiler itself (not only
its C++ host) to narrate. Raising or lowering verbosity SHALL NOT change any door's
standard-output bytes.

#### Scenario: Quiet silences a door completely

- **WHEN** a door is run at the `quiet` level
- **THEN** it emits only errors and its data output — no stage announcements and no
  narration from either the host or the embedded compiler

#### Scenario: Verbosity does not change data output

- **WHEN** a door that writes a data payload to standard output is run at each verbosity
  level in turn
- **THEN** the standard-output bytes are identical at every level
