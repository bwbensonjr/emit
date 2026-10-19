# development-validation Specification

## Purpose

Defines how Emit developers obtain focused feedback, select comprehensive verification, preserve regression coverage, and reproduce CI validation with bounded and observable costs.

## Requirements

### Requirement: Validation profiles are explicit and selectable

A shared validation command SHALL expose development, full-native, compatibility, source-consistency, source-unit, and reference profiles with stable suite identifiers. It SHALL support listing and selecting suites, reject unknown or empty selections, and report selected checks and their results. The development profile SHALL NOT be presented as comprehensive validation.

#### Scenario: Developer selects a regression suite

- **WHEN** a developer requests an existing suite by its identifier
- **THEN** that suite runs without executing unrelated suites and its result determines the command status

#### Scenario: Invalid selection does not pass vacuously

- **WHEN** a requested profile or suite is unknown or selection yields no runnable checks
- **THEN** validation reports the selection error and exits non-zero

#### Scenario: Full native validation is independent of Chez

- **WHEN** full-native validation runs without Chez installed
- **THEN** the complete native regression inventory executes, with no missing-Chez success skips

### Requirement: Change classification is conservative and visible

Validation SHALL classify documentation, native-host, runtime, compiler-source, library, build/test infrastructure, and release-input changes. It SHALL union obligations for mixed changes and select full code validation for unclassified paths or unavailable change history. Documentation-only classification SHALL use an explicit allowlist excluding executable inputs and fixtures. The selection and reason SHALL be inspectable before execution.

#### Scenario: Documentation changes avoid compiler provisioning

- **WHEN** every changed file is allowlisted non-executable documentation
- **THEN** CI runs lightweight validation and a successful policy result without provisioning LLVM or running a compiler matrix

#### Scenario: Mixed and unknown changes retain code coverage

- **WHEN** a diff includes documentation and runtime changes, an unknown path, or an unresolved comparison base
- **THEN** classification does not treat it as documentation-only and enables the conservative code gates

#### Scenario: Deleted and renamed inputs remain visible

- **WHEN** compiler sources or build inputs are deleted or renamed
- **THEN** both sides of the change participate in classification and required source or infrastructure checks remain selected

### Requirement: Regression assertions have explicit retained coverage

Every existing native and developer regression assertion SHALL have an owner in a versioned coverage inventory, including its host, profile, isolation requirements, and required trigger. Moving a check to a less frequent profile SHALL be explicit. Removing a duplicate SHALL require equivalent retained assertions; costly tests SHALL NOT be removed solely for being slow.

#### Scenario: A slower suite is reorganized

- **WHEN** repeated setup or duplicate executions are removed from a suite
- **THEN** its original behavioral assertions remain mapped to executable checks and negative-case isolation is preserved

#### Scenario: Full and reference inventories remain auditable

- **WHEN** maintainers compare the old runners with the new inventory
- **THEN** every old assertion group is retained or has an explained equivalent replacement, including performance and cross-host-only checks

### Requirement: Parallel checks do not share mutable build state

Validation SHALL bound concurrency and prevent simultaneous writes to shared build outputs, configuration, caches, installed fixtures, or bootstrap artifacts. Checks with shared mutations SHALL run serially or in isolated workspaces. A failed worker SHALL fail the aggregate result, retain its diagnostics, and be reaped on cancellation.

#### Scenario: Configuration and installation tests overlap

- **WHEN** checks that change PREFIX, VERSION, or effective native configuration are selected together
- **THEN** each observes its intended configuration without races or mutation of the developer's source checkout

#### Scenario: Concurrent and serial executions agree

- **WHEN** the same selected suites run with one worker and with bounded parallel workers
- **THEN** their assertion outcomes agree and no worker failure is lost

### Requirement: Feedback performance is measured separately from coverage reduction

Validation reports SHALL identify commit, platform, toolchain, selected coverage, cache state, build/provision/test durations, and suite results. Before-and-after evidence SHALL cover compiler, runtime, native-host, and documentation edits. Comparisons SHALL distinguish fewer checks from faster execution of equal coverage and SHALL NOT count skips, provisioning, or queued time as test speedups.

#### Scenario: A performance comparison is published

- **WHEN** implementation claims improved development feedback
- **THEN** reproducible measurements show the selected edit workflow and equal-coverage full-suite timing, with cold and warm dependency costs distinguished

### Requirement: Superseded PR work is cancellable without weakening release gates

CI SHALL cancel obsolete runs for the same PR while keeping different PRs independent. Release publication SHALL NOT be cancelled by a newer PR run. Required check aggregation SHALL distinguish intentional documentation-only omissions from missing or failed required code checks.

#### Scenario: A PR receives another commit

- **WHEN** a newer validation run starts for the same PR
- **THEN** obsolete PR validation is cancelled while unrelated PRs and tagged release validation continue

### Requirement: CI toolchains are reusable and verified

CI SHALL reuse immutable dependency installations identified by OS, architecture, LLVM/libgc revisions, build recipe, and relevant SDK constraints. It SHALL verify artifact digest, trusted producer identity, selected versions, and native compiler/linker/runtime probes before use. Caches SHALL be optional acceleration, with an exact-recipe source fallback. Untrusted PR runs SHALL NOT publish trusted toolchains.

#### Scenario: A cold validation runner reuses a toolchain

- **WHEN** its ref-scoped cache is absent but a matching trusted toolchain artifact exists
- **THEN** it verifies and uses that installation without rebuilding LLVM

#### Scenario: An artifact is invalid or unavailable

- **WHEN** dependency verification fails or no matching artifact exists
- **THEN** the invalid installation is not used and CI either provisions the exact documented recipe or fails visibly without substituting a major or skipping checks

#### Scenario: Reference backend prerequisites are exercised

- **WHEN** a toolchain is provisioned or restored for verification
- **THEN** its pinned `llvm-as`, `llvm-link`, and `lli` assemble, link, and execute a bitcode probe, in addition to native embedding probes
- **AND** the Chez driver resolves relative library roots on the CI Chez version without relying on unavailable host procedures
