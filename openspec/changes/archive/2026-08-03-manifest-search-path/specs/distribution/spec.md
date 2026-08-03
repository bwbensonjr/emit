## ADDED Requirements

### Requirement: An installed Emit is self-sufficient for the standard libraries

An installed Emit SHALL be able to resolve every library it ships without the user's current
working directory containing anything. A library that is *not* baked into the binary is reachable
only through a manifest, so installation SHALL place the manifest and the library sources it names
where the binary's own manifest lookup will find them.

Concretely, an installation SHALL satisfy the executable-relative candidate of the manifest lookup
procedure: for a binary installed at `<prefix>/bin/emit`, the manifest SHALL be installed at
`<prefix>/share/emit/emit-libs.scm`, and every relative `(source …)` it names SHALL exist relative
to that manifest — so `lib/scheme/base.sld` in the installed manifest means
`<prefix>/share/emit/lib/scheme/base.sld`.

Library **source** (`.sld`) is what ships. Compiled library artifacts are not part of the install
contract; an installed door compiles a needed library on demand exactly as an in-repo door does.

#### Scenario: A non-baked-in standard library imports from an arbitrary directory

- **WHEN** Emit is installed under a prefix and a program importing `(scheme inexact)` is run from
  a directory containing no `emit-libs.scm` and no `lib/`
- **THEN** the program compiles and runs, producing the same value it produces when run from the
  source tree

#### Scenario: Nothing in the installed tree depends on the build directory

- **WHEN** the installation prefix is inspected after the source tree it was built from has been
  removed
- **THEN** the installed `emit` still resolves and runs a program importing a shipped library, so
  no installed path refers back into the build tree

### Requirement: `make install` produces the installed layout

The project SHALL provide an `install` make target that stages the built binary, the default
manifest, and the shipped library sources into a prefix. The target SHALL honor a `PREFIX`
variable (defaulting to `/usr/local`) for the installed paths that get compiled into the binary,
and a `DESTDIR` variable (defaulting to empty) prepended to every path it writes, so a packager can
stage into a temporary root without changing what the binary was built to look for.

The target SHALL narrate what it installs and where, in the project's tool-output format, and SHALL
be idempotent — running it twice over the same prefix leaves the same tree and does not fail.

#### Scenario: Installing into a staging root

- **WHEN** `make install PREFIX=/usr/local DESTDIR=<staging>` is run
- **THEN** the binary lands at `<staging>/usr/local/bin/emit`, the manifest at
  `<staging>/usr/local/share/emit/emit-libs.scm`, and each shipped `.sld` under
  `<staging>/usr/local/share/emit/lib/`, with the compiled-in default prefix still `/usr/local`

#### Scenario: A second install over the same prefix succeeds

- **WHEN** `make install` is run twice against the same prefix
- **THEN** the second run completes successfully and the resulting tree is identical to the first

#### Scenario: The install is narrated

- **WHEN** `make install` runs at default verbosity
- **THEN** it names the destination prefix and the files installed on standard error, and at
  `EMIT_VERBOSITY=quiet` prints no narration

### Requirement: The from-source developer workflow is unaffected by installation

Installation SHALL be additive: an in-repo invocation of any door SHALL continue to resolve the
repository's own `./emit-libs.scm` even when a different Emit is installed on the system, because
the working-directory candidate is searched before the executable-relative and installed-prefix
candidates.

#### Scenario: The repo manifest wins over an installed one

- **WHEN** a door is invoked from the repository root while an Emit is also installed under a
  prefix carrying its own manifest
- **THEN** the repository's `./emit-libs.scm` and its `lib/` sources are the ones used
