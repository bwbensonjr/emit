## REMOVED Requirements

### Requirement: User installation prepares the first standard-library invocation

**Reason**: Installation no longer warms the installing user's cache, and the package channels no
longer defer. Every installation whose final location is known prepares a shared library cache
instead. Replaced by "Installation prepares the shared library cache".

**Migration**: `WARM_STDLIB=0` keeps deferring preparation, and staged `DESTDIR` installs still
defer. A user who relied on install-time warming of their own cache gets the same first-run benefit
from the shared cache; `emit build --stdlib` still warms the user cache on request.

## MODIFIED Requirements

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
staleness on the install surface. The one derived content an installation MAY hold is the shared
library cache under `<prefix>/share/emit/`, produced by the installed executable itself and
disposable: the installation SHALL remain complete and usable without it.

The target SHALL narrate what it installs and where, in the project's tool-output format, and SHALL
be idempotent — running it twice over the same prefix leaves the same tree and does not fail.
The matching `uninstall` target SHALL remove the shared library cache along with the files it
installed.

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
- **THEN** the second run completes successfully and the resulting tree is identical to the first,
  apart from a shared library cache that holds only the reinstalled executable's entries

#### Scenario: The install is narrated

- **WHEN** `make install` runs at default verbosity
- **THEN** it names the destination prefix and the files installed on standard error, and at
  `EMIT_VERBOSITY=quiet` prints no narration

#### Scenario: Uninstall removes the shared cache

- **WHEN** `make uninstall` runs against a prefix whose installation prepared a shared library cache
- **THEN** the shared cache directory is removed along with the installed files

## ADDED Requirements

### Requirement: Installation prepares the shared library cache

An installation whose final location is known SHALL prepare the shared library cache by invoking the
installed `emit build --stdlib --shared` after its payload and toolchain configuration are complete.
This applies to `make install` without `DESTDIR`, privileged or not. Installation SHALL NOT write any
user's cache.

#### Scenario: A normal installation prepares the shared cache

- **WHEN** a user installs to a writable prefix without `DESTDIR` or a deferral
- **THEN** installation prepares the installed executable's shared library cache under the prefix
- **AND** the first default-profile REPL or run invocation by any user on that host reuses the
  prepared entries
- **AND** no user's cache is written by the installation

#### Scenario: A privileged install prepares the shared cache

- **WHEN** installation runs as root without `DESTDIR`
- **THEN** it prepares the shared cache under the prefix, readable by every user
- **AND** it does not populate root's or any other user's cache

### Requirement: Installation preparation can be deferred and never blocks installation

A staged `DESTDIR` install SHALL defer preparation, and `WARM_STDLIB=0` SHALL defer it for any
install. Each deferral SHALL be narrated with the end-user command. Automatic preparation SHALL be
best-effort: a failure SHALL be reported with the retry command, and the installation SHALL remain
complete and usable.

#### Scenario: A staged install is only a payload operation

- **WHEN** `make install` uses a nonempty `DESTDIR`
- **THEN** it does not run the staged binary or prepare any cache
- **AND** it narrates the deferral and names `emit build --stdlib` for the eventual user

#### Scenario: Preparation is unavailable or explicitly deferred

- **WHEN** automatic preparation fails or installation uses `WARM_STDLIB=0`
- **THEN** the complete source payload remains installed and usable
- **AND** non-quiet output identifies the failure or deferral and the explicit retry command

### Requirement: Packaged installs ship a shared cache for their final executable

The Homebrew, Nix, and OCI recipes SHALL each prepare the shared library cache against the executable
bytes that are finally installed, at the final installed path. The Homebrew recipe SHALL run no
post-install step and SHALL NOT ask the user to run `emit build --stdlib`.

#### Scenario: Packaged installs ship a matching shared cache

- **WHEN** Homebrew, Nix, or OCI builds the distribution payload
- **THEN** the installed payload includes a shared library cache prepared by the installed
  executable at its final installed path

#### Scenario: Post-install packaging steps come first

- **WHEN** a recipe rewrites or wraps the installed executable after installation, as Nix's fixup
  does
- **THEN** the recipe prepares the shared cache only after that step

### Requirement: Channel acceptance verifies the shipped shared cache

Installed acceptance for every channel SHALL verify that the shipped shared library cache exists and
was produced by the installed executable, and that a standard-library import with an empty private
user cache reuses shipped portable entries rather than compiling them. A shared cache that is
missing or does not match its executable SHALL fail the channel's acceptance and prevent its
promotion. Acceptance SHALL NOT require shared native objects to match the acceptance host's CPU.

#### Scenario: A packaging step rewrites the executable after preparation

- **WHEN** a recipe prepares the shared cache and a later packaging step changes the installed
  executable's bytes
- **THEN** acceptance reports the shared cache as not matching the executable and the channel is not
  promoted

#### Scenario: A published image is re-tested on another runner

- **WHEN** an OCI image's acceptance runs on a host whose CPU differs from the build host's
- **THEN** shipped portable entries are still required to be reused, and native objects generated
  for the acceptance host do not fail the check
