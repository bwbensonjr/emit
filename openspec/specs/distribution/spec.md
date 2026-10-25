# distribution Specification

## Purpose

Defines what an installed Emit consists of and where it lives: the requirement that an
installation be self-sufficient for **every path** — the binary, the default manifest and the
library sources it names, and the support files the delivering paths require, each placed where
the binary's own lookups will find it — the `make install` target that produces that layout under
a `PREFIX`/`DESTDIR` staging convention, and the guarantee that installing an Emit leaves the
from-source developer workflow untouched. It also defines the release-bound distribution channels
-- a Homebrew tap, a Nix flake, and an OCI image -- that install one validated source release with
its declared toolchain, the installed acceptance checks every channel passes, and how tested
candidates are promoted and recovered.

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

### Requirement: Distribution channels identify one validated source release

Each stable channel SHALL identify an exact Emit release version, source commit, archive URL, and SHA-256 digest. Initial promotion SHALL use a new validated release containing the merged compiler and validation fixes. Stable packages SHALL NOT consume floating source refs or substitute a different source on download or integrity failure.

#### Scenario: Initial channel metadata is prepared

- **WHEN** the first stable channel packages are prepared
- **THEN** they select a release newer than `v0.1.0` containing the accepted fixes and passing the existing source-release gates
- **AND** the published `v0.1.0` tag and assets remain unchanged

#### Scenario: Package source identity disagrees

- **WHEN** the downloaded archive fails its expected digest or reports a different Emit version
- **THEN** package validation fails before promotion and does not fall back to a branch checkout

### Requirement: Channel dependencies select a maintained LLVM major

Channel recipes SHALL initially select LLVM 22 with matching headers, libraries, clang, clang++, and LLVM tools, plus Boehm GC. Package builds and ordinary native checks SHALL consume committed bootstrap artifacts without Chez or regeneration. Channel selection SHALL preserve Emit's explicit toolchain overrides and its general floor-based discovery contract.

#### Scenario: A package build has another clang on PATH

- **WHEN** a package build also sees a system clang from a different LLVM major
- **THEN** its recipe selects and verifies its declared LLVM 22 toolchain for compilation and linking

#### Scenario: Independent verification is requested

- **WHEN** a maintainer explicitly requests source units or independent-host reference verification
- **THEN** Chez is an explicit verification dependency and its absence fails that requested check
- **AND** ordinary installation and execution do not require Chez

### Requirement: The Homebrew tap installs a complete source-built Emit

The `bwbensonjr/emit/emit` formula SHALL build the selected release from source on Apple Silicon macOS with declared `llvm@22` and `bdw-gc` dependencies. Its installation SHALL support all Emit commands with LLVM keg tools absent from the user's PATH. Initial delivery SHALL NOT depend on Emit bottles or global toolchain symlinks.

#### Scenario: A user installs through the tap

- **WHEN** Homebrew installs the formula on the supported platform
- **THEN** it acquires declared dependencies and installs the release's binary, libraries, support files, and applicable license notices
- **AND** version and installed-command checks pass through the Homebrew-linked command

#### Scenario: The LLVM keg is not on PATH

- **WHEN** the installed command runs from an unrelated directory with only the normal Homebrew and system PATH entries
- **THEN** library compilation and AOT execution use a compatible installed toolchain without requiring shell configuration

### Requirement: The Nix flake provides locked package and development environments

The repository flake SHALL expose `packages.default` and `devShells.default` for `aarch64-darwin` and `x86_64-linux`. The package SHALL use the selected release archive and locked dependencies. The development shell SHALL supply the native build tools without requiring Chez; a separately selectable verification shell SHALL include Chez. Installed commands SHALL retain their required Nix runtime closure.

#### Scenario: A sandbox builds the package

- **WHEN** the locked package is built after declared sources and dependencies are available
- **THEN** compilation and installation succeed without network access, Chez, Git metadata, or regeneration

#### Scenario: An installed Nix package runs outside a development shell

- **WHEN** a user invokes the package from a fresh environment without the original source/build directory or development shell
- **THEN** every Emit command finds its installed sources, native libraries, and required compiler/linker inputs through its retained closure

#### Scenario: A developer selects a shell

- **WHEN** a developer enters the default shell or the verification shell
- **THEN** the default supplies the documented native source-build tools and the verification shell additionally supplies Chez
- **AND** entering either shell does not regenerate bootstrap artifacts

### Requirement: The OCI image supports Scheme development with its installed toolchain

`ghcr.io/bwbensonjr/emit` SHALL provide a `linux/amd64` image identifying its Emit release, source revision, and selected dependencies. The final image SHALL contain the installed Emit payload and native dependencies needed for `run`, `repl`, `lib`, and `build`. It SHALL support a non-root process with a writable mounted workspace and cache. Base images SHALL be selected by digest.

#### Scenario: A user runs the final image offline

- **WHEN** the image is run with networking disabled, a writable workspace, and no mounted Emit checkout
- **THEN** installed command checks, a non-baked library import, and compilation and execution of an AOT program succeed
- **AND** the process does not need Chez or a build-stage filesystem

#### Scenario: A caller supplies a host user identity

- **WHEN** the image is run with an arbitrary non-root UID/GID and writable workspace/cache paths
- **THEN** Emit can evaluate, compile, and write outputs without attempting to modify the installed payload
- **AND** the image's documented entrypoint forwards Emit arguments and process status

### Requirement: Channel acceptance exercises the installed payload

Each advertised channel and platform SHALL pass installed acceptance checks from outside the checkout with private writable caches and no Chez. Checks SHALL cover version identity, doctor, JIT evaluation, persistent REPL state, shipped libraries and SRFIs, macro-bearing library compilation/import, and AOT execution. A failed or missing required result SHALL prevent that channel's promotion.

#### Scenario: A package candidate is tested

- **WHEN** a channel candidate is validated
- **THEN** its checks use the installed command with source/build directories unavailable for lookup and networking disabled after dependency acquisition
- **AND** the report records source digest, platform, dependency versions, selected checks, and outcomes

#### Scenario: A package tries to write beside installed sources

- **WHEN** the installed payload is read-only and private cache/workspace paths are writable
- **THEN** library compilation and the installed acceptance program succeed without modifying the package installation

### Requirement: Channel publication promotes tested candidates with recoverable updates

Channel promotion SHALL require a successful exact source release and its own passing candidate checks. PR and rehearsal jobs SHALL NOT publish stable packages. OCI publication SHALL promote the tested image digest without rebuilding and preserve version tags on retries. Homebrew and Nix updates SHALL be reviewable changes recording exact inputs. Failed promotion SHALL retain diagnostics and a recoverable previous channel version.

#### Scenario: A rehearsal completes

- **WHEN** package validation runs for a PR or non-publishing manual rehearsal
- **THEN** it produces reports and candidate identities without updating the public tap, stable registry tags, or release assets

#### Scenario: An OCI publication is retried

- **WHEN** the version tag already resolves to the intended tested digest
- **THEN** the retry succeeds without changing it
- **AND** a different existing digest causes a visible failure instead of an overwrite

#### Scenario: One channel update fails

- **WHEN** one channel fails after the source release or another channel succeeds
- **THEN** its failure is reported separately and can be retried without retagging the source release or replacing other published artifacts
- **AND** rollback selects a previously validated package revision or digest without rewriting an immutable version tag

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

### Requirement: Packaging instructions state dependencies and supported behavior

Documentation SHALL describe supported channel platforms, exact installation and version checks, upgrade/removal and recovery, and an offline source build with PREFIX/DESTDIR. It SHALL distinguish Chez-free use/native checks from optional independent-host verification and describe dynamic LLVM/libgc and AOT toolchain requirements. Advertised support SHALL match the tested channel matrix and current language limitations.

#### Scenario: A downstream maintainer packages a release

- **WHEN** a maintainer follows the packaging instructions with declared native dependencies already installed
- **THEN** the documented build, staged installation, and selected native checks require neither network access nor Chez
- **AND** complete verification has separate commands and prerequisites without suggesting missing checks are successes

#### Scenario: A user chooses a channel

- **WHEN** a user reads its installation instructions
- **THEN** the instructions identify its Emit release and supported OS/architecture, explain its dependency model, and link to current language limitations
- **AND** they do not claim that a source package or OCI image supplies standalone static executables

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
