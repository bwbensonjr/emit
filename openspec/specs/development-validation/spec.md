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

Validation SHALL classify documentation, native-host, runtime, compiler-source, library, build/test infrastructure, packaging, and release-input changes. It SHALL union obligations for mixed changes and select full code validation for unclassified paths or unavailable change history. Documentation-only classification SHALL use an explicit allowlist excluding executable inputs and fixtures. The selection and reason SHALL be inspectable before execution.

#### Scenario: Documentation changes avoid compiler provisioning

- **WHEN** every changed file is allowlisted non-executable documentation
- **THEN** CI runs lightweight validation and a successful policy result without provisioning LLVM or running a compiler matrix

#### Scenario: Mixed and unknown changes retain code coverage

- **WHEN** a diff includes documentation and runtime changes, an unknown path, or an unresolved comparison base
- **THEN** classification does not treat it as documentation-only and enables the conservative code gates

#### Scenario: Deleted and renamed inputs remain visible

- **WHEN** compiler sources or build inputs are deleted or renamed
- **THEN** both sides of the change participate in classification and required source or infrastructure checks remain selected

#### Scenario: Packaging-only changes rely on channel rehearsal

- **WHEN** every changed file is a channel recipe outside the source archive (`packaging/**`, `flake.nix`, or `flake.lock`) or allowlisted documentation
- **THEN** compatibility CI provisions no LLVM toolchain and runs no native, source, unit, or archive jobs
- **AND** the distribution-channel rehearsal runs and is that change's proof

#### Scenario: Packaging mixed with code keeps code coverage

- **WHEN** a diff changes a channel recipe together with any input that is not a channel recipe or documentation
- **THEN** classification selects the code gates that input requires, in addition to channel rehearsal

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

### Requirement: An executed result can satisfy an identical tree

A validation run SHALL be satisfied by an earlier run, instead of executing its native, source, unit, and reference jobs, only when the earlier run is a successful same-repository pull-request run that executed those jobs itself, the tree it tested is identical to the tree being validated, and its recorded plan covers every gate the current plan requires. Otherwise the run SHALL execute its jobs.

#### Scenario: A merge commit with the pull request's tree is not re-tested

- **WHEN** a push to `main` creates a merge commit whose tree is identical to the tree its pull request's last run tested, and that run's required validation succeeded
- **THEN** the push run reuses that result and provisions no toolchain

#### Scenario: A different tree is validated in full

- **WHEN** `main` moved after the pull request's last run, so the merge commit's tree differs from the tree that run tested
- **THEN** the push run executes its required jobs exactly as it would without reuse

#### Scenario: Insufficient coverage is not reused

- **WHEN** the candidate run's recorded plan omits a gate the current plan requires, such as `full` mode, complete reference verification, or archive rehearsal for a release tag
- **THEN** the current run executes its required jobs

#### Scenario: A reused result is never a source of reuse

- **WHEN** the only candidate run with an identical tree itself reused another run's result
- **THEN** that candidate is rejected and the current run executes its required jobs

#### Scenario: Fork and toolchain-recipe runs are not reused

- **WHEN** the candidate run came from a fork, or the change touches an input of trusted dependency preparation
- **THEN** the candidate is rejected and the current run executes its required jobs with trusted toolchains

### Requirement: Reuse is visible and verifiable

Each run SHALL record whether it executed or reused. A reusing run SHALL name the reused run, its commit, its tree, and that run's plan in its narration, its uploaded plan, and its aggregated required check, so the evidence can be followed to the executed jobs. When reuse cannot be determined, for example because the API is unavailable or the plan artifact is missing or unreadable, the run SHALL execute instead of failing or passing.

#### Scenario: The aggregated check names its evidence

- **WHEN** a run's required check succeeds through reuse
- **THEN** its log and plan artifact name the reused run's URL, commit, tree, and mode

#### Scenario: Reuse lookup failure falls back to execution

- **WHEN** the reuse lookup cannot reach the GitHub API, or the candidate's plan artifact has expired or does not parse
- **THEN** the run narrates the reason and executes its required jobs

### Requirement: External package coverage transfers are explicit

Transferring external package assertions out of Emit SHALL document their new executable owners, hosts, and triggers in the coverage inventory. The transfer SHALL retain package execution-path coverage in emit-packages and package-contract coverage in Emit before retiring the old suites.

#### Scenario: Package semantics move to their owning repository

- **WHEN** the pinned collection suites are retired
- **THEN** the coverage map names collection-owned checks for package semantics and execution paths, including artifact reuse and source-driver checks
- **AND** Emit retains executable fixture checks for installation, update, and library-root resolution

### Requirement: Emit package integration validation is self-contained

Emit's required build, test, and release gates SHALL validate the package contract using Emit-owned fixtures. They SHALL NOT fetch the external collection or depend on its availability or revision. Emit SHALL maintain no collection compatibility pin. External package semantics and their compatibility with released Emit SHALL be owned by emit-packages.

#### Scenario: Collection commits require no Emit maintenance

- **WHEN** emit-packages publishes another commit without a change to Emit
- **THEN** Emit's required validation inputs are unchanged and no pin edit, Emit pull request, or Emit release is needed

#### Scenario: Collection unavailability does not affect Emit gates

- **WHEN** the collection repository is unavailable and Emit's other declared prerequisites are present
- **THEN** Emit's package integration checks run from fixtures without contacting the collection

#### Scenario: An Emit package-contract regression fails locally

- **WHEN** Emit can no longer install or update a valid fixture package or resolve its installed library
- **THEN** Emit's required checks fail with the affected operation and expected and actual result
