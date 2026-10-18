# Spec Delta

## RENAMED Requirements

- FROM: `### Requirement: A Chez-gated check guarantees the committed IR is not stale`
- TO: `### Requirement: Source consistency and independent-host verification are separate checks`

## MODIFIED Requirements

### Requirement: Source consistency and independent-host verification are separate checks

A Chez-free check SHALL regenerate current compiler sources in an isolated clean checkout and compare every committed bootstrap module byte-for-byte. It SHALL run once for compiler/bootstrap/assembly-input changes and every release, failing on stale IR. Separately, Chez-seeded re-derivation SHALL verify the independent-host fixed point once per release and on scheduled/manual reference runs; absence of Chez SHALL NOT suppress source consistency.

#### Scenario: Un-regenerated compiler change is caught

- **WHEN** compiler source changes without matching regenerated bootstrap IR
- **THEN** source-consistency validation reports a mismatch and fails even with Chez absent
- **AND** the developer's checkout and bootstrap files are not modified

#### Scenario: An independent host reproduces the fixed point

- **WHEN** reference validation builds the current compiler source under Chez and then self-compiles it
- **THEN** the resulting stable compiler and baked modules match committed IR
- **AND** this is reported separately from Chez-free source consistency without requiring a rebuild of frozen genesis

#### Scenario: Host-only edits do not trigger compiler regeneration

- **WHEN** a change touches only native host integration and no compiler, bootstrap, or assembly inputs
- **THEN** classification does not require source-consistency regeneration and native host validation still runs

#### Scenario: Required verification is unavailable

- **WHEN** a required source-consistency or independent-host check cannot execute
- **THEN** its gate fails rather than treating a missing tool or skipped check as success

### Requirement: No developer-facing compiler capability requires Chez

Every capability needed to build, run, inspect, or debug a program SHALL remain reachable through shipped binaries without Chez, including per-pass inspection and bootstrap regeneration. Chez SHALL remain an independent verification and frozen-genesis host, not a native test prerequisite. Source units and targeted cross-host checks SHALL be separately selectable; the developer verification entry point SHALL retain source consistency, reference parity, and independent-host checks.

#### Scenario: A Chez-free machine can inspect the pipeline

- **WHEN** a developer with no `chez` on PATH builds the compiler, runs a program, starts the REPL, and inspects the IL after each pass
- **THEN** all four succeed through the shipped binary, and no step reports a missing Chez

#### Scenario: Chez remains the verification host

- **WHEN** the complete developer verification entry point runs with Chez available
- **THEN** it verifies source/bootstrap consistency, independent-host fixed-point re-derivation, and shipped stage-dump parity against the Chez driver
- **AND** those obligations remain individually selectable with separately reported costs

#### Scenario: The Chez driver's dump is retained as the reference

- **WHEN** the shipped binary's stage dump and the Chez driver's stage dump are produced for the same program
- **THEN** the two agree on the stage names, their order, and intermediate forms, compared structurally rather than byte-for-byte

#### Scenario: Fast units exercise edited source directly

- **WHEN** source-unit validation runs after a compiler pass is edited and before regeneration
- **THEN** it tests the current source under Chez without first running the native regression or bootstrap suites
- **AND** its result does not claim that the committed native compiler incorporates those edits
