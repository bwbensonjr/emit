# Spec Delta

## MODIFIED Requirements

### Requirement: Tools and pipeline stages announce their actions

Every tool, script, and pipeline stage in the project SHALL emit a concise
informational message describing the action it is performing and the concrete inputs it
consumes and outputs it produces. A developer reading the output SHALL be able to tell,
without consulting the source, which stage is running and what artifacts it reads and
writes. Silent success (an action that produces no describing output) SHALL NOT be the
default behavior for any action that reads or writes a file, links a binary, or runs a
compilation.

Ordinary `emit run` execution SHALL suppress host and compiler narration at default and quiet verbosity, including manifest resolution, cache, compilation, and loading progress. Verbose execution SHALL retain narration on stderr. Diagnostics, explicit dump requests, program output, existing final-value reporting, and `--emit` data behavior SHALL remain available. This command-specific exception SHALL take precedence over the general default-narration rule.

#### Scenario: A build step names its output artifact

- **WHEN** a `Makefile` target links a binary or the driver emits an IR file
- **THEN** the output includes a message naming the action and the resulting artifact
  (e.g. `link repl-host -> build/repl-host`)
- **AND** the message identifies the principal input(s) when they are not obvious from
  the target name

#### Scenario: A compiler pass identifies itself

- **WHEN** the compiler runs its frontend passes at a verbosity that shows stage progress
- **THEN** each pass announces the stage it represents (e.g. `expand`, `convert-closures`,
  `lower`, `emit`) in the order it runs

#### Scenario: An action with no describing output is a defect

- **WHEN** a tool reads or writes a file, links a binary, or compiles a program
- **THEN** it produces at least one message describing that action unless the active
  verbosity level is `quiet` or the command is ordinary `emit run` execution at default verbosity

### Requirement: Verbosity is controllable

Tools SHALL support a concise default level of output and SHALL allow that level to be
raised (to include per-stage and per-metric detail) or lowered (to errors only) through a
consistent control, without changing the tool's data contract. The concise default SHALL
be informative enough to follow the work but SHALL NOT flood the terminal with per-item
detail.

Ordinary `emit run` execution SHALL suppress host and compiler narration at default and quiet verbosity, including manifest resolution, cache, compilation, and loading progress. Verbose execution SHALL retain narration on stderr. Diagnostics, explicit dump requests, program output, existing final-value reporting, and `--emit` data behavior SHALL remain available. This command-specific exception SHALL take precedence over the general default-narration rule.

#### Scenario: Quiet suppresses narration

- **WHEN** a tool is run at the `quiet` level
- **THEN** it emits only errors and its data output, with no informational narration

#### Scenario: Verbose adds per-stage detail

- **WHEN** a tool is run at the `verbose` level
- **THEN** it emits per-stage and per-metric detail beyond the concise default

#### Scenario: Default is concise

- **WHEN** a tool other than ordinary `emit run` execution is run with no verbosity override
- **THEN** it announces its principal actions and headline metrics but not every
  per-item step

### Requirement: The project's tools conform to the observability principle

The build, compile, regeneration, formatting, and test tooling SHALL be brought into
conformance with this capability. Specifically, `Makefile` targets, the shipped `emit`
binary's four commands (`run`, `build`, `lib`, `repl`), the `schemec` filter,
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
well as from the Chez driver: at `verbose` verbosity each path SHALL announce each frontend
pass by name in the order it runs. (The tool list previously named `bin/scheme-compile`,
which was removed when the commands were unified behind `emit <verb>`.)

Ordinary `emit run` execution SHALL suppress host and compiler narration at default and quiet verbosity, including manifest resolution, cache, compilation, and loading progress. Verbose execution SHALL retain narration on stderr. Diagnostics, explicit dump requests, program output, existing final-value reporting, and `--emit` data behavior SHALL remain available. This command-specific exception SHALL take precedence over the general default-narration rule.

#### Scenario: Each listed tool announces action, inputs/outputs, and metrics

- **WHEN** any of `Makefile` targets, an `emit` command, `schemec`, `tools/regen.sh`,
  `tools/format.sh`, `run-all-tests.sh`, `run-dev-tests.sh`, or the compiler driver runs at
  the default level, except ordinary `emit run` execution
- **THEN** it announces the action it performs, names its inputs and outputs, and reports
  the metrics relevant to that action

#### Scenario: A test runner reports a per-suite and total summary

- **WHEN** `run-all-tests.sh` or `run-dev-tests.sh` finishes
- **THEN** it reports each suite's pass/fail result and its timing, plus a total count and
  total elapsed time

#### Scenario: A command announces its passes at verbose verbosity

- **WHEN** an `emit` command compiles a program at `verbose` verbosity
- **THEN** each frontend pass is announced by name, on standard error, in the order it runs

#### Scenario: A formatting run reports its covered set and its counts

- **WHEN** the formatting tool finishes at the default level
- **THEN** its output names the covered set it resolved, the number of files considered,
  the number changed or that would change, and the elapsed time

#### Scenario: A skipped formatting gate says so

- **WHEN** the commit-time formatting gate runs and the formatter is unavailable
- **THEN** it reports the skip and names what it looked for, rather than exiting silently

#### Scenario: Script execution is quiet by default

- **WHEN** a successful script prints `Hello world` and runs through `emit run` or its shebang with verbosity unset
- **THEN** stdout contains the program output and stderr contains no manifest, compilation, cache, or loading narration

#### Scenario: Quiet execution retains failures and verbose observation

- **WHEN** the script is run at verbose verbosity or fails at default verbosity
- **THEN** verbose progress is on stderr without changing stdout, and failures remain visible with a nonzero exit status
