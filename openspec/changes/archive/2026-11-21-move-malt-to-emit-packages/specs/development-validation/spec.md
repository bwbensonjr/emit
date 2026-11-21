# Spec Delta

## ADDED Requirements

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
