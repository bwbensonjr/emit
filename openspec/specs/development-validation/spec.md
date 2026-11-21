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

### Requirement: The external package collection is validated at a pinned commit

Emit SHALL record exactly one pinned commit of the external package collection in its tree. A classified native suite SHALL run that commit's package checks against the Emit under test. The suite's result SHALL depend only on the pin and the Emit under test, never on later collection commits. Moving the pin SHALL be an explicit, reviewed edit.

#### Scenario: A later collection commit does not change Emit's result

- **WHEN** the package collection gains a commit that breaks one of its packages and Emit's pin is unchanged
- **THEN** the suite still checks the pinned commit and its result is unchanged

#### Scenario: An Emit change that breaks a pinned package fails validation

- **WHEN** an Emit change makes a pinned package check produce a different value
- **THEN** the suite fails, naming the package, the check, the execution path, and the expected and actual values

#### Scenario: The fetched checkout is verified against the pin

- **WHEN** the suite obtains the collection, from its cache or by fetching
- **THEN** it verifies that the checkout's commit equals the pin before running any check, and fails naming both commits otherwise

### Requirement: Pinned package checks run on every execution path

Each pinned package check SHALL run through `emit run`, `emit repl`, a standalone executable built by `emit build`, and `emit run` consuming published artifacts of every library the package declares. Each path SHALL produce the check's expected value. The reference profile SHALL also run each check through the Chez source driver. Checks SHALL NOT require Racket or the upstream package's checkout.

#### Scenario: Native profile covers four execution paths

- **WHEN** the full native profile runs the pinned suite
- **THEN** every package check passes through `emit run`, `emit repl`, a built executable, and the artifact path, and each reports the check's expected value

#### Scenario: The artifact path consumes published artifacts

- **WHEN** the suite publishes each library a package declares with `emit lib` and runs a check against those artifacts
- **THEN** every declared library the check loads is reported as reused from its published artifact, at least one is, and the suite fails naming any declared library that was compiled from source instead

#### Scenario: Reference profile adds the source driver

- **WHEN** the reference profile runs the pinned suite with Chez available
- **THEN** every package check also passes through the Chez source driver with the same expected value

#### Scenario: No foreign host is needed

- **WHEN** the pinned suite runs on a machine without Racket
- **THEN** it runs every check without skipping any for that reason

### Requirement: A local collection checkout can stand in for the pin

A developer SHALL be able to point the pinned suite at a local collection checkout. Such a run SHALL be labelled unpinned in its narration and report, and SHALL NOT be accepted as pinned evidence.

#### Scenario: An unpushed collection change is tested against Emit

- **WHEN** the suite runs with a local collection checkout selected
- **THEN** it runs that checkout's package checks and its report labels the result unpinned with the checkout's commit and dirty state

#### Scenario: Offline development with an existing cache

- **WHEN** the suite runs without network access and a verified checkout of the pinned commit is already cached
- **THEN** it runs from the cache without attempting a fetch
