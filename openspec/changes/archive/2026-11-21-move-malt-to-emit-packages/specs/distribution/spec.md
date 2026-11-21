# Spec Delta

## REMOVED Requirements

### Requirement: Malt and random library sources ship with their source closure

**Reason**: `(malt learner)` no longer ships with Emit; it moves to the `bwbensonjr/emit-packages` collection. The SRFI 27 half of this requirement is retained, without its learner scenarios, as "Random library sources ship with their source closure".

**Migration**: Installations still carry SRFI 27 exactly as before. To use `(malt learner)` with an installed Emit, clone `bwbensonjr/emit-packages` and add its `lib/` directory as a library root, for example through `EMIT_LIBRARY_PATH`.

## ADDED Requirements

### Requirement: Random library sources ship with their source closure

Installation SHALL include SRFI 27's complete source and license closure as an optional ordinary library with project-provider precedence. Its adapted third-party code SHALL retain pinned provenance and attribution. Installation SHALL NOT require network access, tests, or precompiled library artifacts.

#### Scenario: Installed SRFI 27 works outside its checkout

- **WHEN** a staged installation is exercised from an unrelated directory with the source checkout unavailable and an empty private cache
- **THEN** SRFI 27 imports resolve, run/REPL/build checks pass, and all needed source and license files come from the installation

#### Scenario: No SRFI 27 import has no PRNG payload

- **WHEN** a program does not import SRFI 27 directly or transitively
- **THEN** its library units are not compiled, initialized, or linked
- **AND** a no-import executable has no PRNG or entropy symbols retained solely because those sources ship

#### Scenario: Installation is complete and repeatable

- **WHEN** the same payload is staged twice
- **THEN** its source and notice files are identical, contain no references requiring external checkout paths, and import correctly without test fixtures

### Requirement: The installed payload carries no package-collection libraries

Installation SHALL NOT include `(malt learner)`, its internal libraries, or its license and provenance files. A library provided by the external package collection SHALL resolve from an installed Emit only through a library root the user supplies.

#### Scenario: An installed Emit does not resolve Malt by itself

- **WHEN** a program importing `(malt learner)` is run against a staged installation from an unrelated directory with no manifest, no `-L` root, no `EMIT_LIBRARY_PATH`, and no project `lib/`
- **THEN** compilation fails with the resolver's unresolved-library diagnostic naming `(malt learner)`
- **AND** the staged payload contains no file under a `malt/` library directory

#### Scenario: A supplied collection root resolves Malt

- **WHEN** the same program is run against the same installation with the package collection's `lib/` directory in `EMIT_LIBRARY_PATH`
- **THEN** `(malt learner)` resolves from that root and the program completes
