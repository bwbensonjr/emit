## ADDED Requirements

### Requirement: One emitted IR drives AOT, JIT, and bitcode exits

The compiler SHALL take a single emitted LLVM IR module to three interchangeable exits —
a native executable (AOT), in-process JIT execution via `lli`, and a bitcode artifact —
without changes to the emitted IR or the C runtime between exits. AOT SHALL remain the
default exit.

#### Scenario: JIT execution via lli

- **WHEN** a demo program is built with the JIT backend selected
- **THEN** the compiler links the runtime into the program IR at the IR level and runs it
  via `lli` (resolving `libgc`), and the run reports the program's value — the same value
  the AOT executable reports

#### Scenario: Bitcode emission

- **WHEN** a demo program is built with the bitcode backend selected
- **THEN** the compiler writes a `.bc` bitcode artifact from the same emitted `.ll`,
  suitable for inspection and `opt`

#### Scenario: AOT remains the default

- **WHEN** a program is compiled with no backend explicitly selected
- **THEN** the compiler produces a native executable exactly as before this change

### Requirement: Backends produce identical results (regression harness)

The project SHALL provide a regression harness that runs every demo through all three
backends and asserts identical results, operationalizing the "one frontend, many
backends" thesis as a standing check.

#### Scenario: Cross-backend equivalence across the demo suite

- **WHEN** the backend regression harness is run over the demo suite (including the
  allocation-heavy and 10M-iteration tail-recursion demos)
- **THEN** for each demo the AOT, JIT, and bitcode backends produce byte-identical
  standard output, and the harness fails if any backend diverges or errors
