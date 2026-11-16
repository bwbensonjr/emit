# Distribution Delta

## MODIFIED Requirements

### Requirement: Selected SRFIs ship as optional ordinary libraries

Emit SHALL ship `(srfi 1)`, `(srfi 2)`, `(srfi 8)`, `(srfi 27)`, `(srfi 227)`, and the documented
`(srfi 64)` port as ordinary sources under `lib/srfi/`. They SHALL be available
through existing checkout and installed conventional roots, loaded through
explicit imports, and excluded from the baked and implicit import sets.
Project providers SHALL retain precedence over installed copies.

#### Scenario: An installed program needs no test-fixture path

- **WHEN** an installed Emit runs, builds, or interactively imports a program using
  the shipped SRFIs from an unrelated directory with no custom SRFI roots
- **THEN** each library and dependency resolves through installed providers and
  works without `test/snow`, a checkout, or network access

#### Scenario: Checkout sources use the same conventional layout

- **WHEN** a command runs in the checkout or uses its manifest's conventional root
- **THEN** SRFI imports resolve from `lib/srfi/` and do not require fixture paths

#### Scenario: Unused SRFIs add no session or executable payload

- **WHEN** a program or session never imports a SRFI directly or transitively
- **THEN** the SRFI is neither compiled, registered, initialized, nor linked merely
  because its source is installed
- **AND** the session gains none of its public bindings

#### Scenario: A project overrides an installed SRFI

- **WHEN** an exact project entry or an earlier project root supplies a non-baked SRFI
- **THEN** that provider is selected ahead of the installed copy on every command

#### Scenario: Availability is queried through the library resolver

- **WHEN** a program tests `(library (srfi 64))` with installed providers enabled
- **THEN** it observes the same selected provider as an import
- **AND** shipping these sources does not add new global SRFI feature identifiers

## ADDED Requirements

### Requirement: Malt and random library sources ship with their source closure

Installation SHALL include `(malt learner)`, its internal libraries and includes, and SRFI 27's complete source and license closure. They SHALL remain optional ordinary libraries with project-provider precedence. Substantial adapted third-party code SHALL retain pinned provenance and attribution. Installation SHALL NOT require the upstream Malt checkout, Racket, network access, tests, or precompiled library artifacts.

#### Scenario: Installed learner works outside its checkout

- **WHEN** a staged installation is exercised from an unrelated directory with the source checkout unavailable and an empty private cache
- **THEN** learner and SRFI 27 imports resolve, run/REPL/build checks pass, and all needed source and license files come from the installation

#### Scenario: No learner import has no learner payload

- **WHEN** a program does not import Malt or SRFI 27 directly or transitively
- **THEN** those library units are not compiled, initialized, or linked
- **AND** a no-import executable has no learner/PRNG/entropy symbols retained solely because those sources ship

#### Scenario: Installation is complete and repeatable

- **WHEN** the same payload is staged twice
- **THEN** its source and notice files are identical, contain no references requiring external checkout paths, and import correctly without test fixtures
