# Spec Delta

## MODIFIED Requirements

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
