# distribution Specification

## Purpose

Defines what an installed Emit consists of and where it lives: the requirement that an
installation be self-sufficient for **every path** — the binary, the default manifest and the
library sources it names, and the support files the delivering paths require, each placed where
the binary's own lookups will find it — the `make install` target that produces that layout under
a `PREFIX`/`DESTDIR` staging convention, and the guarantee that installing an Emit leaves the
from-source developer workflow untouched.

## Requirements

### Requirement: An installed Emit is self-sufficient for the standard libraries

An installed Emit SHALL resolve every shipped library from an arbitrary working directory, whether
or not the user's project carries a manifest. Non-baked shipped `.sld` sources SHALL be installed in
the conventional hierarchy beneath `<prefix>/share/emit/lib`, so `(scheme inexact)` is available as
`<prefix>/share/emit/lib/scheme/inexact.sld` without a per-library mapping.

The installed manifest SHALL remain at `<prefix>/share/emit/emit-libs.scm` and MAY contain exact
library entries for compatibility, generated libraries, or exceptional layouts. Its relative paths
SHALL resolve against the manifest as before. The executable-relative and compiled-prefix resolver
tiers SHALL each pair that manifest candidate with its sibling `lib` root, resolving the running
executable through symbolic links before deriving the executable-relative location.

A project's providers SHALL precede installed providers, so a project can override a non-baked
shipped library without embedding an unstable package-manager prefix. Library source SHALL remain
the installed contract; compiled library artifacts SHALL be produced locally on demand and SHALL
not be installed.

#### Scenario: A non-baked-in standard library imports from an arbitrary directory

- **WHEN** Emit is installed and a program imports `(scheme inexact)` from a directory containing no
  project manifest or library root
- **THEN** the source resolves conventionally from the installed `scheme/inexact.sld` and the
  program produces its expected value

#### Scenario: A project with its own manifest keeps the shipped libraries

- **WHEN** a project supplies only its own conventional libraries and imports `(scheme inexact)`
- **THEN** the project library resolves from the project root, the standard library resolves from
  the installed root, and no project file names the installation prefix

#### Scenario: Nothing in the installed tree depends on the build directory

- **WHEN** the source tree is removed after installation
- **THEN** the installed binary still resolves every shipped library through its executable-relative
  or compiled-prefix providers

#### Scenario: A symlinked executable finds its conventional root

- **WHEN** `emit` is invoked through a symlink outside the prefix
- **THEN** resolving the real executable locates the sibling installed manifest and `lib` root

### Requirement: `make install` produces the installed layout

The project SHALL provide an `install` make target that stages the built binary, the default
manifest, the shipped library sources, and the **support files the delivering paths require** into a
prefix. The target SHALL honor a `PREFIX` variable (defaulting to `/usr/local`) for the installed
paths that get compiled into the binary, and a `DESTDIR` variable (defaulting to empty) prepended to
every path it writes, so a packager can stage into a temporary root without changing what the binary
was built to look for.

A support file SHALL be installed under `<prefix>/share/emit/` at the **same repo-relative subpath**
it occupies in the source tree, so one lookup serves both the checkout and the installed layout.
The support files are the toolchain-discovery script and everything it needs to run, and the C
runtime source compiled into every delivered executable.

Support files ship as **source**, consistent with library sources: no compiled artifact
(`runtime.o`, an archive) is part of the install contract, so installation never puts artifact
staleness on the install surface.

The target SHALL narrate what it installs and where, in the project's tool-output format, and SHALL
be idempotent — running it twice over the same prefix leaves the same tree and does not fail.

#### Scenario: Installing into a staging root

- **WHEN** `make install PREFIX=/usr/local DESTDIR=<staging>` is run
- **THEN** the binary lands at `<staging>/usr/local/bin/emit`, the manifest at
  `<staging>/usr/local/share/emit/emit-libs.scm`, and each shipped `.sld` under
  `<staging>/usr/local/share/emit/lib/`, with the compiled-in default prefix still `/usr/local`

#### Scenario: The support files land at their repo-relative subpaths

- **WHEN** `make install PREFIX=<prefix>` is run
- **THEN** the toolchain-discovery script and its own dependencies land under
  `<prefix>/share/emit/tools/`, and the C runtime source under `<prefix>/share/emit/src/runtime/`,
  each at the same subpath it has in the source tree

#### Scenario: A second install over the same prefix succeeds

- **WHEN** `make install` is run twice against the same prefix
- **THEN** the second run completes successfully and the resulting tree is identical to the first

#### Scenario: The install is narrated

- **WHEN** `make install` runs at default verbosity
- **THEN** it names the destination prefix and the files installed on standard error, and at
  `EMIT_VERBOSITY=quiet` prints no narration

### Requirement: Installation refreshes configuration-sensitive build outputs

`make install` SHALL install a binary built for the command's effective native toolchain and
`PREFIX`, even when an older `build/emit` already exists. `DESTDIR` SHALL affect only the staging
destination and SHALL NOT become part of the binary's compiled-in installation prefix.

#### Scenario: Install follows a toolchain upgrade

- **WHEN** `build/emit` was produced with one LLVM installation and `make install` later resolves a
  different effective LLVM configuration
- **THEN** the command rebuilds and relinks `build/emit` before copying it into the prefix
- **AND** the installed binary starts successfully against the newly resolved LLVM installation

#### Scenario: Install uses a changed prefix

- **WHEN** an existing `build/emit` was compiled with one `PREFIX` and `make install` is invoked with
  a different `PREFIX`
- **THEN** the installed binary contains the new compiled-in prefix and is copied to that prefix

#### Scenario: Staging does not change the compiled-in prefix

- **WHEN** `make install PREFIX=/usr/local DESTDIR=<staging>` is invoked for an otherwise current
  build
- **THEN** the installed binary retains `/usr/local` as its compiled-in prefix while being written
  beneath `<staging>/usr/local`

#### Scenario: Repeated install with the same configuration is incremental

- **WHEN** `make install` is repeated with unchanged sources, toolchain, flags, and `PREFIX`
- **THEN** it recopies the required install payload without needlessly recompiling or relinking the
  native binary

### Requirement: The from-source developer workflow is unaffected by installation

Installation SHALL be additive: an in-repo invocation of any path SHALL continue to resolve the
repository's own `./emit-libs.scm` for every library that manifest names, and the repository's own
support files for every support file the source tree provides, even when a different Emit is
installed on the system — because the working-directory and checkout candidates are searched before
the executable-relative and installed-prefix ones.

Chaining SHALL NOT weaken this: a later candidate is consulted only for a name the repository's
manifest does not resolve, so no library the repository ships can be supplied by an installed Emit.
When a later candidate does supply a library, the narration SHALL name the manifest it came from,
so a resolution reaching outside the checkout is visible rather than silent.

#### Scenario: The repo manifest wins over an installed one

- **WHEN** a path is invoked from the repository root while an Emit is also installed under a
  prefix carrying its own manifest
- **THEN** the repository's `./emit-libs.scm` and its `lib/` sources are the ones used for every
  library the repository's manifest names

#### Scenario: The repo's support files win over installed ones

- **WHEN** `emit build` is invoked from the repository while an Emit is also installed under a
  prefix carrying its own support files
- **THEN** the checkout's own toolchain-discovery script and C runtime source are the ones used

#### Scenario: A resolution that reaches an installed manifest is narrated

- **WHEN** a path resolves a library from a searched candidate later than the first
- **THEN** the manifest that supplied it is named on standard error at default verbosity

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
