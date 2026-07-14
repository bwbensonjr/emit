## ADDED Requirements

### Requirement: Pure compiler core is separable from the I/O driver

The compiler SHALL be structured as a pure core that maps source forms (or source text) to
LLVM IR text, and a driver that performs all input/output — reading source, writing the
`.ll`, invoking the C toolchain/JIT, and supplying the host target header. The core SHALL NOT
perform file, subprocess, or port I/O, so that the self-hosting target is the core alone.

#### Scenario: Core produces IR without I/O

- **WHEN** the pure core is given a program's forms (or source string)
- **THEN** it returns the program's LLVM IR text without reading or writing any file,
  spawning any process, or requiring the host target header

#### Scenario: Driver behavior is unchanged

- **WHEN** the driver compiles a program through the refactored core
- **THEN** the emitted IR and program results are identical to before the split, and all
  existing CLI modes (AOT, JIT, bitcode, `--dump`, `--no-prelude`, `--repl`) behave as before

#### Scenario: Core runs as a text filter

- **WHEN** source text is provided on stdin in the core's filter mode
- **THEN** the corresponding IR text is written to stdout, with the target header and
  toolchain invocation left to the driver/host
