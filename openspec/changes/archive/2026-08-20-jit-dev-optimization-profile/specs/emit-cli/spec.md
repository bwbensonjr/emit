## ADDED Requirements

### Requirement: The shipped JIT doors expose an optimization profile

`emit run` and `emit repl` SHALL accept exactly the optimization options `-O0`, `-O1`, and
`-O2`.  With no explicit option they SHALL use `-O1`.  `-O0` SHALL preserve the unoptimized JIT
backend behavior for diagnosis and measurement, while `-O1` and `-O2` SHALL select progressively
stronger standard LLVM optimization profiles before JIT execution.

At most one optimization option SHALL be accepted per invocation.  An unsupported level or
conflicting levels SHALL be a usage error naming the invoked door and offending options.  The
`build` and `lib` doors SHALL continue to reject these JIT-only options as unknown.  The `run` and
`repl` help text SHALL list the options and identify `-O1` as the default.

#### Scenario: Run defaults to the development profile

- **WHEN** a program is executed with `emit run` and no optimization option
- **THEN** it is JITted with the `-O1` profile and produces the same value and output as the
  unoptimized path

#### Scenario: Run accepts each supported profile

- **WHEN** the same program is executed separately with `emit run -O0`, `emit run -O1`, and
  `emit run -O2`
- **THEN** all three invocations succeed and produce byte-identical program output

#### Scenario: Repl accepts each supported profile

- **WHEN** a session is started separately with `emit repl -O0`, `emit repl -O1`, and
  `emit repl -O2`
- **THEN** each invocation starts a working session under the requested profile

#### Scenario: Unsupported and conflicting profiles are usage errors

- **WHEN** a JIT door is passed an unsupported level such as `-O3`, or more than one of
  `-O0`, `-O1`, and `-O2`
- **THEN** it names the door and options on standard error and exits non-zero without compiling
  or running user source

#### Scenario: Non-JIT doors reject a JIT profile

- **WHEN** `emit build` or `emit lib` is passed `-O0`, `-O1`, or `-O2`
- **THEN** it rejects the option as unknown rather than changing its existing backend profile

#### Scenario: Help documents the profile contract

- **WHEN** `emit run --help` or `emit repl --help` is requested
- **THEN** the usage text lists `-O0`, `-O1`, and `-O2`, explains their JIT scope, and identifies
  `-O1` as the default

### Requirement: A JIT profile is not silently ignored by a non-executing run mode

`emit run --emit` SHALL continue to write the compiler-produced, pre-backend modular IR used by
regen and byte-identity checks.  It SHALL NOT optimize or otherwise change those bytes.  Because
`--emit` and `--resolve-program` do not start a JIT, combining either mode with a JIT optimization
option SHALL be a usage error rather than a successful invocation that ignored the option.

#### Scenario: Emitted IR remains the compiler artifact

- **WHEN** a program is compiled with `emit run --emit`
- **THEN** stdout contains the same modular IR bytes as before this change and no JIT optimization
  is performed

#### Scenario: Emit mode rejects a JIT profile

- **WHEN** `emit run --emit` is combined with `-O0`, `-O1`, or `-O2`
- **THEN** the invocation reports the conflicting options on standard error, writes no IR to
  stdout, and exits non-zero

#### Scenario: Resolve mode rejects a JIT profile

- **WHEN** `emit run --resolve-program` is combined with `-O0`, `-O1`, or `-O2`
- **THEN** the invocation reports the conflicting options on standard error, writes no resolved
  paths to stdout, and exits non-zero
