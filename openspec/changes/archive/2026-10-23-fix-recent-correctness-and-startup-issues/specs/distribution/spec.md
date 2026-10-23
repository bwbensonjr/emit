## ADDED Requirements

### Requirement: User installation prepares the first standard-library invocation

An unprivileged non-staged source install SHALL invoke the installed `emit build --stdlib` after its payload and toolchain configuration are complete. Homebrew SHALL warm from an end-user post-install hook. Installation SHALL offer `WARM_STDLIB=0` to defer warming. Automatic warming SHALL be best-effort, with failure reported and the explicit retry command shown; a complete source installation SHALL remain usable.

#### Scenario: Normal user installation warms its installed executable

- **WHEN** a user installs to a writable prefix without `DESTDIR` or a warm opt-out
- **THEN** installation prepares that installed executable's libraries in the installing user's cache
- **AND** the first default-profile REPL or run invocation reuses the prepared entries

#### Scenario: A staged install is only a payload operation

- **WHEN** `make install` uses a nonempty `DESTDIR`
- **THEN** it does not run the staged binary or populate any user's cache
- **AND** it narrates the deferral and names `emit build --stdlib` for the eventual user

#### Scenario: A privileged install avoids warming the wrong user

- **WHEN** installation runs as root
- **THEN** it does not populate root's or an inferred other user's cache
- **AND** it prints the command the end user can run after installation

#### Scenario: Sandboxed packaging defers user-local work

- **WHEN** Nix or OCI builds the distribution payload in a sandbox or image build
- **THEN** its recipe disables warming and documents the end-user command
- **AND** the Homebrew recipe defers build-stage warming to its post-install hook

#### Scenario: Warming is unavailable or explicitly deferred

- **WHEN** automatic warming fails or installation uses `WARM_STDLIB=0`
- **THEN** the complete source payload remains installed and usable
- **AND** non-quiet output identifies the failure or deferral and the explicit retry command

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
the installed contract; compiled library artifacts SHALL be produced locally on demand or by
explicit standard-library warming, including an installation hook, and SHALL not be installed
as part of the prefix payload.

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

#### Scenario: Relocation can rebuild local cache entries

- **WHEN** a source installation is relocated after its user cache was warmed
- **THEN** stale path-dependent entries are rejected or rebuilt normally and no cached build-tree path is required for correctness
