# performance-evaluation Specification

## Purpose

Define reproducible performance investigations that connect observed costs to generated code and controlled experiments, allowing maintainers and agents to compare alternatives without weakening correctness.

## Requirements

### Requirement: Investigations identify reproducible inputs and execution conditions

Performance reports SHALL identify source revisions and dirty inputs, fixture hashes, correctness oracles, platform, toolchain, compiler/linker options, execution path, and cache state. They SHALL provide reproduction commands and distinguish compilation, startup, execution, and output costs where relevant. Missing provenance SHALL be explicit.

#### Scenario: Another maintainer repeats a comparison

- **WHEN** a performance comparison is published
- **THEN** its versioned fixtures, build commands, settings, and expected results allow both sides to be reconstructed without retained temporary files
- **AND** unavailable historical evidence is identified rather than treated as verified

### Requirement: Measurements retain samples and isolate the claimed cause

Comparisons SHALL preserve raw samples, sample order, warm-up policy, and median and spread. They SHALL use alternating or randomized paired runs, validate results, and distinguish elapsed time, process CPU, allocation volume, collection activity, resident memory, and artifact size. Unavailable metrics SHALL be marked unavailable, never inferred from another metric.

#### Scenario: A release changes both a representation and its printing

- **WHEN** an investigation attributes a slowdown to printing
- **THEN** controlled workloads separate printing from representation/traversal costs before causal attribution
- **AND** background contention and insufficient resolution are recorded as limitations

### Requirement: Generated-code evidence tests a stated hypothesis

Each evaluated optimization SHALL state its predicted mechanism and affected workloads before comparison. Reports SHALL connect the relevant source operation to emitted IR, optimized IR, and final machine code where applicable, showing surviving calls, allocations, checks, or dependencies. Artifact differences alone SHALL NOT establish an execution speedup.

#### Scenario: An indirect call disappears without a timing benefit

- **WHEN** a candidate removes a call in generated code but the timing comparison is inconclusive
- **THEN** the report records the code change and inconclusive timing separately
- **AND** does not claim a measured speedup

### Requirement: Alternatives have explicit acceptance and rejection evidence

Investigations SHALL compare the baseline with focused alternatives using equivalent work and preserved correctness. Acceptance criteria SHALL be declared before candidate timing and cover the intended benefit, unaffected controls, memory, size, and complexity. Rejected and inconclusive experiments SHALL retain their evidence and rationale; unstable timing SHALL NOT become a mandatory CI gate.

#### Scenario: A faster candidate retains excessive memory

- **WHEN** a candidate improves throughput but exceeds the declared retention or complexity budget
- **THEN** the report records the trade-off and rejects it or explicitly revises the design before acceptance

### Requirement: Maintainers and agents share one evaluation process

The repository SHALL provide a documented investigation process, a reusable report template, executable writer fixtures and measurement tooling, and a repository agent skill that follows that process. The skill SHALL reference the documentation rather than maintain a separate methodology. Tool narration and machine data SHALL follow the existing output convention.

#### Scenario: A maintainer investigates without an agent

- **WHEN** the maintainer follows the documented writer investigation commands
- **THEN** the fixtures, samples, correctness checks, and report can be produced without invoking the skill

#### Scenario: An agent investigates a later issue

- **WHEN** the performance evaluation skill is invoked
- **THEN** it uses the shared process and template, labels uncertainty, and selects validation according to the changed inputs
