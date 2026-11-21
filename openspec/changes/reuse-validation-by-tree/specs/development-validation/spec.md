# Spec Delta

## MODIFIED Requirements

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

## ADDED Requirements

### Requirement: An executed result can satisfy an identical tree

A validation run SHALL be satisfied by an earlier run, instead of executing its native, source, unit, and reference jobs, only when the earlier run is a successful same-repository pull-request run that executed those jobs itself, its head tree is identical to the tree being validated, and its recorded plan covers every gate the current plan requires. Otherwise the run SHALL execute its jobs.

#### Scenario: A merge commit with the pull request's tree is not re-tested

- **WHEN** a push to `main` creates a merge commit whose tree is identical to the head tree of its pull request, and that pull request's required validation succeeded
- **THEN** the push run reuses that result and provisions no toolchain

#### Scenario: A different tree is validated in full

- **WHEN** `main` moved after the pull request's last run, so the merge commit's tree differs from the validated head tree
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
