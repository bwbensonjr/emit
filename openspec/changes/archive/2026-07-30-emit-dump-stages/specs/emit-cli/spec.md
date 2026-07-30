## ADDED Requirements

### Requirement: Every door accepts `--dump` for per-pass stage inspection

`emit run`, `emit build`, `emit lib`, and `emit repl` SHALL accept a `--dump` flag that
prints the intermediate language after each named compiler pass. The flag SHALL also be
settable through the environment so that tools and scripts can enable it without editing a
command line. All dump output SHALL be written to standard error; the flag SHALL NOT alter
what any door writes to standard output, and SHALL NOT alter the delivered executable, the
library artifact, or the value a program computes.

#### Scenario: `--dump` on the run door

- **WHEN** `emit run --dump FILE` is run
- **THEN** the IL after each named pass is printed to standard error, and the program's
  value is still printed on standard output exactly as without `--dump`

#### Scenario: `--dump` does not perturb emitted IR

- **WHEN** the same program is compiled with `emit run --emit` and with
  `emit run --emit --dump`
- **THEN** the bytes written to standard output are byte-for-byte identical

#### Scenario: `--dump` on the lib door

- **WHEN** `emit lib SRC --dump` compiles a library
- **THEN** the stages of that library's unit compilation are printed to standard error, and
  the written `.ll` and `.exports` artifacts are byte-identical to those written without
  `--dump`

#### Scenario: `--dump` on the build door

- **WHEN** `emit build NAME --dump` delivers a native executable
- **THEN** the stages are printed to standard error and the delivered executable behaves
  identically to one built without `--dump`

#### Scenario: `--dump` in the REPL

- **WHEN** the user starts `emit repl --dump` and enters a top-level form
- **THEN** the stages of that form's incremental compilation are printed to standard error
  before its value is printed, and the session state is unaffected

#### Scenario: The environment enables dumping

- **WHEN** a door is run with the dump environment variable set and no `--dump` on the
  command line
- **THEN** it dumps as if `--dump` had been passed

### Requirement: Library units are dumped only on request

Because a program compiled with the auto-imported `(scheme base)` compiles that library
before the program itself, `--dump` SHALL by default dump only the **unit under
inspection** — the program for `run`/`build`, and the library named on the command line for
`lib`. A separate opt-in flag SHALL additionally dump the auto-imported `(scheme base)` and
any preloaded manifest libraries.

#### Scenario: The prelude's stages are not dumped by default

- **WHEN** `emit run --dump` compiles a program with the prelude auto-imported
- **THEN** the dump contains the program's stages and not the stages of `(scheme base)`

#### Scenario: Library units are dumped on request

- **WHEN** the same program is compiled with the opt-in all-units dump flag
- **THEN** the dump additionally contains the stages of `(scheme base)` and of each
  preloaded manifest library, each identified by its library name
