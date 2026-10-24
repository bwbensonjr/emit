# Spec Delta

## ADDED Requirements

### Requirement: Channel promotion retries succeed for already promoted channels

Re-running channel promotion for a published release SHALL succeed without change for every channel that already promoted it. A Homebrew or Nix promotion whose content is already on the target's base branch SHALL report it as merged and open no pull request. When the release's OCI version tag exists, the job SHALL accept-test that published digest instead of a rebuild, and promote nothing new.

#### Scenario: A promotion pull request has already merged

- **WHEN** a channel promotion for a release runs again after its tap or Nix pull request merged
- **THEN** the promotion reports that the identical file is already on the base branch and succeeds
- **AND** it creates no commit, branch update, or pull request

#### Scenario: The OCI version tag already exists

- **WHEN** an OCI rehearsal or promotion runs for a release whose version tag is published
- **THEN** the job copies that published digest, runs the full channel acceptance against it, and reports the tested digest
- **AND** a promotion leaves the version tag unchanged and succeeds

#### Scenario: No OCI version tag exists yet

- **WHEN** an OCI rehearsal or promotion runs for a release with no published version tag, or for a candidate archive
- **THEN** the job builds the image from the release archive and tests and promotes that build as before

### Requirement: Channel promotion never moves a channel to an older release

A channel promotion SHALL NOT move the OCI `latest` tag, the Homebrew tap formula, or the Nix release pin from a newer release to an older one. It SHALL report the skipped update as superseded and succeed. Immutable version tags SHALL still be published for any release, and an explicit rollback of `latest` to a previously validated digest SHALL remain available.

#### Scenario: An older release is promoted again

- **WHEN** promotion runs for a release older than the one `latest`, the tap formula, or the Nix pin currently names
- **THEN** that pointer is left unchanged and the promotion reports it as superseded
- **AND** the job succeeds

#### Scenario: A maintainer rolls back latest

- **WHEN** a maintainer explicitly re-points `latest` to a previously validated digest of an older release
- **THEN** the rollback succeeds and no version tag changes

### Requirement: The Homebrew rehearsal applies current Homebrew rules

The Homebrew channel job SHALL update Homebrew before it lints, audits, installs, or tests the rendered formula, so it applies the rules the tap's own CI applies. It SHALL report the Homebrew version it used.

#### Scenario: Homebrew adds a formula rule

- **WHEN** a Homebrew release adds a style or audit rule that the rendered formula violates
- **THEN** the next channel rehearsal fails at that check before any promotion
- **AND** its log names the Homebrew version that applied the rule
