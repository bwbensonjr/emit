# release-handoff Specification

## Purpose

Defines how a completed versioned Emit change is prepared into one reviewable pull request with
its specifications archived, and how a merged release is followed by exact identity through
tagging, source publication, and channel availability.

## Requirements

### Requirement: A documented entry point prepares a completed versioned change for review

Emit SHALL provide one documented entry point that takes an explicitly named OpenSpec change and
prepares it for review: preflight checks, specification sync and archive, commit of the complete
intended diff, and creation of the pull request. A maintainer SHALL NOT need to sequence those
operations by hand.

#### Scenario: A completed change is handed off

- **WHEN** a maintainer runs the entry point for a change whose tasks are complete and whose preflight passes
- **THEN** the change's delta specifications are merged into the main specifications, the change is archived, and both are committed on the change's branch
- **AND** a pull request is opened whose body names the change, its archive path, the version, the validation evidence, and the issues it references

#### Scenario: No change is named

- **WHEN** the entry point is started without naming a change
- **THEN** it lists the active changes and stops without modifying anything

### Requirement: Implementation, specifications, archive, and release metadata land together

The pull request for a versioned change SHALL contain the implementation, the updated main
specifications, the archived change, `VERSION`, and its changelog section. Archiving SHALL NOT
require a later cleanup pull request or an extra version bump. A pull request MAY be opened as a
draft earlier, but it SHALL NOT be marked ready for review before sync and archive are committed.

#### Scenario: A draft pull request exists before archive

- **WHEN** a draft pull request already exists for the change and archive has not been committed
- **THEN** the entry point commits sync and archive to the same branch before marking the pull request ready for review

#### Scenario: The merged release contains its specifications

- **WHEN** the versioned pull request merges
- **THEN** the merge commit that is tagged contains the archived change and the updated main specifications

### Requirement: Preflight reports stage-specific readiness before any handoff write

Before writing, the handoff SHALL check base freshness, task completion against recorded
evidence, specification conflicts, version advancement over every existing release tag, a
matching nonempty changelog section, and bootstrap obligations. Each failed check SHALL be named
with its stage and a corrective action, and SHALL stop the handoff.

#### Scenario: Tasks are incomplete

- **WHEN** the named change has unchecked tasks
- **THEN** preflight fails at the implementation stage, lists the unchecked tasks, and commits nothing

#### Scenario: Checked tasks lack evidence

- **WHEN** every task is checked but a required validation has no recorded passing result for the current inputs
- **THEN** preflight reports the missing evidence instead of treating checked boxes as proof

#### Scenario: A concurrent version merged first

- **WHEN** another pull request has released the same or a higher version since this branch was cut
- **THEN** preflight fails at the version stage, names the conflicting tag, and asks for a higher version and changelog heading

#### Scenario: A delta conflicts with the main specification

- **WHEN** a modified requirement in the change no longer matches the main specification it rewrites
- **THEN** the handoff stops before archive and names the requirement and the divergent scenarios or prose

#### Scenario: Bootstrap output is stale

- **WHEN** the diff changes a compiler input and the committed bootstrap does not correspond to the current source
- **THEN** preflight fails at the bootstrap stage and names `make regen` and the source check as the remedy

### Requirement: The handoff determines owed validation from the diff

The handoff SHALL classify the change's diff with the project's existing change classification
and report which validation is owed and which already has passing evidence for the same inputs.
It SHALL NOT rerun compiler regeneration or test suites only because documentation, specifications,
or archive metadata changed.

#### Scenario: Only archive metadata changed since validation

- **WHEN** the only commits after the last passing validation are the specification sync and archive
- **THEN** the handoff reports the earlier validation as current and runs no regeneration or suite

#### Scenario: A compiler input changed after validation

- **WHEN** a compiler input changed after the last passing validation
- **THEN** the handoff reports regeneration, the full native suite, and the source check as owed

### Requirement: Re-running the handoff is idempotent

Re-running the handoff SHALL reuse the existing branch and pull request, SHALL update the pull
request body in place, and SHALL NOT open a duplicate pull request, move or create a tag, or
alter a published release or channel.

#### Scenario: The handoff runs twice

- **WHEN** the handoff is run again for a change that already has an open pull request
- **THEN** the same pull request is reported and updated, and no second pull request exists

#### Scenario: The change was already archived

- **WHEN** the handoff is re-run after the change was archived on the branch
- **THEN** it recognizes the archive, skips sync and archive, and does not archive twice

### Requirement: Preparing a pull request never merges it

The handoff SHALL report the pull request's required-check status and the concrete next action,
and SHALL NOT merge the pull request unless the maintainer explicitly requests it. Merging the
reviewed versioned pull request SHALL remain the release approval.

#### Scenario: Checks pass

- **WHEN** the pull request's required checks all succeed
- **THEN** the handoff reports the pull request as ready to merge and names merging it as the release action, without merging

#### Scenario: A required check fails

- **WHEN** a required check fails on the pull request
- **THEN** the handoff reports the failed check and its run link and does not report the pull request as ready

### Requirement: A merged release is followed by its exact identity

Following a release SHALL start from the merged commit SHA and SHALL select the tagging,
source-release, and channel workflow runs whose head commit or tag matches it, never the latest
run or latest `main`. It SHALL report each stage's state and the first failed stage, and SHALL
stop reporting dependent stages as successful after a failure.

#### Scenario: A release completes

- **WHEN** the merged commit is tagged, its source release publishes, and every channel promotes
- **THEN** the report names the change archive, pull request, merged commit, tag, release URL, archive SHA-256, each channel's promotion pull request or digest, and its result

#### Scenario: Unrelated runs are newer

- **WHEN** a later push to `main` started newer workflow runs
- **THEN** the report still describes only the runs for the followed commit and tag

#### Scenario: Source release fails

- **WHEN** the source-release run for the tag fails
- **THEN** the report names the failed stage and run, reports no channel as available, and names rerun or a forward patch version as the remedy

### Requirement: Reports distinguish the release lifecycle stages

Handoff and follow reports SHALL use the stages implementation complete, ready for review, merged,
tagged, source published, and channel available, where channel available is reported per channel.
A channel SHALL be reported available only when its published pointer names the release.

#### Scenario: The tap pull request has not merged

- **WHEN** the source release is published and the Homebrew promotion pull request is open
- **THEN** the report shows source published and Homebrew pending, and does not report a Homebrew release

#### Scenario: The tap formula lands

- **WHEN** the tap's `main` formula names the release archive and checksum
- **THEN** the report shows Homebrew available for that version
