## ADDED Requirements

### Requirement: The REPL banner and top-level help identify the running version

The `emit repl` banner SHALL name the Emit version and build-time LLVM version that `emit --version` reports, on standard error at every verbosity. The top-level usage summary SHALL begin with the `emit --version` line. Per-verb help and the output of every other command SHALL be unchanged.

#### Scenario: The REPL banner names the version

- **WHEN** `emit repl` starts at default, quiet, or verbose verbosity
- **THEN** standard error contains `Emit <VERSION> (embedded compiler, ORC/LLJIT, LLVM <LLVM_VERSION>).  ^D to exit.` with the same versions `emit --version` prints
- **AND** standard output carries only the session's results

#### Scenario: Top-level help starts with the version

- **WHEN** `emit --help`, `emit -h`, or bare `emit help` is run
- **THEN** the first line of standard output equals the output of `emit --version`, and the verb summary follows unchanged

#### Scenario: Program and verb output are unchanged

- **WHEN** `emit run`, `emit build`, `emit lib`, or `emit <verb> --help` is run
- **THEN** its standard output and narration contain no added version line
