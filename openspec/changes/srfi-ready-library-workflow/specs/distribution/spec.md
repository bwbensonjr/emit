# Spec Delta

## ADDED Requirements

### Requirement: Selected SRFIs ship as optional ordinary libraries

Emit SHALL ship `(srfi 1)`, `(srfi 2)`, `(srfi 8)`, `(srfi 227)`, and the documented
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

### Requirement: Installed SRFI sources preserve their complete source closure

Installation SHALL include the selected libraries' nested includes and required
license notices at paths usable without the source tree. SRFI 1/2/8/227 sources
SHALL match their pinned upstream bytes. The SRFI 64 port SHALL retain a pinned
pristine reference and reproducible adaptation record. Installation SHALL NOT
ship test programs, compiled units, or generated test logs.

#### Scenario: Nested includes survive staging

- **WHEN** `make install` stages the payload under `PREFIX` and `DESTDIR`
- **THEN** all SRFI 64 nested includes and other SRFI includes occupy the expected
  relative locations and every shipped library compiles using only installed files

#### Scenario: Provenance guards detect drift

- **WHEN** a shipped upstream source differs from its recorded package digest, or
  the SRFI 64 port differs from applying its recorded patch to the pinned reference
- **THEN** verification fails and identifies the mismatched source

#### Scenario: Source installation is repeatable and self-contained

- **WHEN** installation is repeated into the same staging prefix
- **THEN** the payload is unchanged, includes applicable copyright/license notices,
  and contains no paths or symlinks requiring the checkout's test directory
