# Spec Delta

## Purpose

Defines Emit's public release identity, tested source-build compatibility, and the contents and validation of tagged source releases consumed by users and packagers.

## ADDED Requirements

### Requirement: Public releases have one semantic version identity

Emit SHALL use a committed semantic version independent of Git availability. Release tags SHALL be `v<VERSION>`. The documented compatibility surface SHALL cover the accepted language and public CLI; before 1.0, incompatible changes SHALL increment the minor version and compatible fixes SHALL increment the patch version. Internal artifact compatibility stamps SHALL remain independent.

#### Scenario: First release identity

- **WHEN** the first public release is prepared
- **THEN** the committed version is `0.1.0`, its tag is `v0.1.0`, and its changelog section identifies that version

#### Scenario: Archive builds retain version identity

- **WHEN** Emit is built from an extracted release archive without `.git`
- **THEN** it reports the same Emit version as a build from the tagged commit

#### Scenario: Version-only changes rebuild the host

- **WHEN** only the committed release version changes and an older native binary exists
- **THEN** the next build reports the new version without requiring a clean build or bootstrap regeneration

### Requirement: Source compatibility is checked across the supported matrix

CI SHALL build from committed bootstrap IR without Chez for each LLVM major 19 through 23 on both Linux and macOS. Each cell SHALL select and report its intended LLVM major and verify installed command behavior. A missing toolchain or failed cell SHALL fail the check rather than silently reduce coverage. Tested coverage SHALL NOT impose an LLVM upper bound on discovery.

#### Scenario: Every supported combination is exercised

- **WHEN** compatibility CI runs for a proposed change or release commit
- **THEN** all ten platform/LLVM combinations build and test with the selected matching headers, libraries, and tools
- **AND** bootstrap IR is consumed as committed, without regeneration

#### Scenario: Installed commands are exercised

- **WHEN** a matrix cell completes its build and staged installation
- **THEN** version and doctor checks, a program run, scripted REPL evaluation, library compilation, and a delivered AOT executable all pass using installed files from an unrelated directory

#### Scenario: A matrix dependency cannot be provisioned

- **WHEN** a required LLVM major is unavailable to a matrix job
- **THEN** that cell fails visibly and release publication remains blocked

### Requirement: Source archives contain an offline build and install closure

A release SHALL include `emit-<VERSION>.tar.gz` with one `emit-<VERSION>/` root, committed bootstrap IR, and all sources, vendored inputs, support files, tests, documentation, and license notices needed for the documented source build and install. It SHALL exclude Git metadata, local build/cache outputs, and secrets. With documented native dependencies installed, build and installation SHALL require neither network access nor Chez.

#### Scenario: Packager builds from the published payload

- **WHEN** the archive is extracted without a checkout, Git metadata, Chez, or network access
- **THEN** `make` and `make install PREFIX=/usr/local DESTDIR=<staging>` succeed with the documented LLVM, C/C++, libgc, and build utilities
- **AND** the installed commands find their shipped sources and support files

### Requirement: Tagged publication validates and identifies its exact payload

Release automation SHALL reject a tag/version/changelog mismatch, validate the extracted source archive, and require compatibility checks for the tagged commit before publication. It SHALL publish that validated archive, a SHA-256 checksum file, and notes from the matching changelog section. Workflow actions SHALL be pinned by commit SHA. Published versions SHALL NOT be silently overwritten with different payloads.

#### Scenario: Valid tag produces a complete release

- **WHEN** `v0.1.0` matches the committed version and changelog and all release checks pass
- **THEN** publication provides `emit-0.1.0.tar.gz`, `SHA256SUMS`, and the `0.1.0` release notes
- **AND** the checksum verifies the exact archive that passed validation

#### Scenario: Invalid identity or failed validation stops publication

- **WHEN** tag identity differs from the version file or changelog, a matrix check fails, or the extracted archive fails validation
- **THEN** no public release is published

#### Scenario: A release job is retried

- **WHEN** publication is retried for an already published version
- **THEN** existing published assets are preserved and differing bytes cause a visible failure
