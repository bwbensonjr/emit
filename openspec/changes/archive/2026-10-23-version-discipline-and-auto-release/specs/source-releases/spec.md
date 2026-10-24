## MODIFIED Requirements

### Requirement: Public releases have one semantic version identity

Emit SHALL use a committed semantic version independent of Git availability. Release tags SHALL be `v<VERSION>`. The documented compatibility surface SHALL cover the accepted language and public CLI; before 1.0, incompatible changes and new compatible features SHALL increment the minor version and compatible fixes SHALL increment the patch version. Internal artifact compatibility stamps SHALL remain independent.

Every non-trivial change SHALL increment `VERSION` and add a matching nonempty `CHANGELOG.md` section, unless the requester explicitly defers or overrides the bump. A trivial change SHALL leave the shipped behavior, the installed payload, and the source-release build unchanged; documentation, comments, layout-only formatting, tests, CI configuration, and planning artifacts qualify. A change whose bump is deferred SHALL be recorded under an `Unreleased` changelog heading that the next version section absorbs. A pull request that changes `VERSION` SHALL name a version greater than every existing release tag and not yet tagged; the check SHALL fail the pull request otherwise.

#### Scenario: First release identity

- **WHEN** the first public release is prepared
- **THEN** the committed version is `0.1.0`, its tag is `v0.1.0`, and its changelog section identifies that version

#### Scenario: Archive builds retain version identity

- **WHEN** Emit is built from an extracted release archive without `.git`
- **THEN** it reports the same Emit version as a build from the tagged commit

#### Scenario: Version-only changes rebuild the host

- **WHEN** only the committed release version changes and an older native binary exists
- **THEN** the next build reports the new version without requiring a clean build or bootstrap regeneration

#### Scenario: A new compatible feature advances the minor version

- **WHEN** a change adds a compatible command, option, or language feature while the major version is zero
- **THEN** its `VERSION` advances the minor version and resets the patch version, for example `0.1.1` to `0.2.0`

#### Scenario: A version change that does not advance is rejected

- **WHEN** a pull request sets `VERSION` to a version equal to or less than the latest release tag, or to one that is already tagged
- **THEN** its version check fails and names the conflicting tag

#### Scenario: A deferred bump reaches the next release

- **WHEN** a non-trivial change merges with its bump explicitly deferred
- **THEN** its changelog entry sits under `Unreleased`, no release is created for it, and the next version section includes it

## ADDED Requirements

### Requirement: A version merged to main is released automatically

When a push to the default branch changes `VERSION` to an untagged version, automation SHALL create the annotated tag `v<VERSION>` at that commit. It SHALL push the tag with a credential that starts the source-release workflow, so publication and channel promotion follow with no manual step. It SHALL apply the version rules of the release identity requirement, SHALL NOT move or replace an existing tag, and SHALL keep every source-release gate.

#### Scenario: Merging a version bump releases it

- **WHEN** a pull request that changes `VERSION` from `0.1.1` to `0.2.0` with a `## 0.2.0` changelog section merges to `main`
- **THEN** tag `v0.2.0` is created at the merge commit
- **AND** the source release for `v0.2.0` runs every release gate and publishes the validated archive
- **AND** the distribution channels build, test, and promote that release

#### Scenario: Merges without a version change are not released

- **WHEN** a commit reaches `main` without changing `VERSION`
- **THEN** no tag or release is created

#### Scenario: An existing tag is never replaced

- **WHEN** a commit reaches `main` whose `VERSION` already has a `v<VERSION>` tag
- **THEN** the existing tag is unchanged and no release is started

#### Scenario: A version that no longer advances is not tagged

- **WHEN** a merged `VERSION` lacks a nonempty changelog section or is not greater than every existing release tag
- **THEN** the automation fails with a diagnostic naming the reason, and no tag is created

#### Scenario: A missing credential fails visibly before tagging

- **WHEN** the tagging credential is absent or cannot push tags
- **THEN** the automation fails with a diagnostic naming the credential, and no tag is created

#### Scenario: A failed release gate is corrected forward

- **WHEN** an automatically created tag's source release fails a gate
- **THEN** no public release or channel promotion occurs for that version
- **AND** a transient failure can be rerun on the same tag, while a defect is fixed by merging a later version
