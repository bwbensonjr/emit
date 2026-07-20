## ADDED Requirements

### Requirement: Emit publishes semantically-versioned tagged releases with a self-contained source tarball

The project SHALL publish versioned releases identified by a `vMAJOR.MINOR.PATCH` git tag that
follows Semantic Versioning, each with a downloadable source tarball. The version SHALL
communicate compatibility over Emit's user-facing surface — the accepted language (which Scheme
programs compile and run) and the CLI (the `emit` verbs and their flags); the internal
bootstrap IR, the self-hosting fixed point, and the `compiler-stamp-version` artifact marker are
NOT part of this versioned contract and are versioned on their own axes. While Emit is under
active development the MAJOR version SHALL remain `0` (SemVer's "no stability guarantee yet"),
and the decision to release `1.0.0` — which begins the promise that a MAJOR bump signals a
breaking change to the language/CLI surface — SHALL be deferred until Emit supports a consistent
subset of a Scheme standard (e.g. R7RS-small). The tarball SHALL contain the committed bootstrap
IR (`bootstrap/*.ll`) so that building the release requires only a discoverable LLVM toolchain,
Boehm libgc, and `make` — and SHALL NOT require Chez Scheme or a `make regen` step. A release
SHALL be buildable from a clean extraction of its tarball into the single user-facing `emit`
binary using the project's default build.

#### Scenario: A release tarball builds without Chez

- **WHEN** a release tarball is extracted into a clean directory on a machine that has a
  discoverable LLVM toolchain and libgc but no Chez Scheme
- **THEN** the default build (`make`) produces the `emit` binary by linking the committed IR
- **AND** no Chez Scheme invocation and no IR regeneration occurs

#### Scenario: Releases are versioned by a SemVer tag

- **WHEN** a release is published
- **THEN** it is identified by a `vMAJOR.MINOR.PATCH` git tag following Semantic Versioning
- **AND** a package definition can reference that release by a stable URL and its tarball's
  SHA256 checksum

#### Scenario: MAJOR stays zero during development

- **WHEN** a release is published while Emit is under active development (before the `1.0.0`
  decision)
- **THEN** its MAJOR version component is `0`

### Requirement: The release version is defined once in the source tree and surfaced to users

The release version SHALL be recorded in a single source-of-truth artifact committed to the
repository (not derived from git metadata), so that a build from a release tarball — which
carries no `.git` history — resolves the same version a build from a checkout would. The
`emit` binary SHALL report this version through `emit --version`, and the interactive REPL
SHALL include it in its startup banner. The reported version SHALL match the git tag of the
release the binary was built from (the tag being the source-of-truth value prefixed with `v`).

#### Scenario: `emit --version` reports the source-of-truth version

- **WHEN** a user runs `emit --version`
- **THEN** it prints the version recorded in the committed version artifact
- **AND** for a released build that value matches the release's `vMAJOR.MINOR.PATCH` tag

#### Scenario: The REPL banner shows the version

- **WHEN** a user starts `emit repl`
- **THEN** the startup banner includes the same version reported by `emit --version`

#### Scenario: A tarball build reports the version without git

- **WHEN** `emit` is built from a release tarball that contains no `.git` directory
- **THEN** `emit --version` still reports the correct version, read from the committed artifact
  rather than from git metadata

### Requirement: A macOS Homebrew tap installs Emit and resolves its toolchain dependencies

The project SHALL provide a Homebrew tap containing an `emit` formula such that
`brew tap <owner>/emit && brew install emit` installs a working `emit` on macOS. The formula
SHALL declare its LLVM and Boehm GC dependencies (`depends_on "llvm"`, `depends_on "bdw-gc"`)
so that Homebrew resolves and installs the toolchain for the user rather than requiring a
manual toolchain install. The formula SHALL build Emit from a tagged release tarball.

#### Scenario: One-command install resolves dependencies

- **WHEN** a macOS user with Homebrew but without LLVM or libgc runs
  `brew install <owner>/emit/emit`
- **THEN** Homebrew installs the `llvm` and `bdw-gc` dependencies
- **AND** builds and installs the `emit` binary
- **AND** `emit` is available on the user's `PATH`

#### Scenario: Installed emit runs a program

- **WHEN** Emit has been installed via the tap
- **THEN** `emit run` on a sample program produces the expected result using the
  Homebrew-provided toolchain

### Requirement: The Homebrew formula tracks the unversioned LLVM, not a pinned major

The `emit` formula SHALL depend on Homebrew's unversioned `llvm` formula (the current stable
major) and SHALL NOT pin a specific `llvm@NN` keg. This keeps packaging coherent with the
`toolchain-discovery` requirement that the LLVM version is a floor rather than an exact pin,
and avoids a hard install failure when Homebrew deprecates and removes an old versioned LLVM
keg. Because this change builds Emit from source at install time (no bottle), each install
links against whatever `llvm` Homebrew currently provides.

#### Scenario: Install uses the current Homebrew LLVM

- **WHEN** `brew install emit` runs on a machine where Homebrew's `llvm` is some supported
  major at or above the project's floor
- **THEN** the formula builds Emit against that `llvm` and installs successfully, with no
  dependency on a specific `llvm@NN` keg

#### Scenario: No dependency on a removable versioned keg

- **WHEN** the formula's dependencies are inspected
- **THEN** they reference the unversioned `llvm` formula
- **AND** they do not reference a specific `llvm@NN` versioned keg that Homebrew may later
  remove

### Requirement: A Homebrew-installed emit resolves its LLVM toolchain for build and lib

After installation via the tap, `emit build` and `emit lib` — which fork `clang` and rely on
`llvm-config`-based discovery — SHALL locate the Homebrew LLVM toolchain even though Homebrew's
`llvm` is keg-only (its `clang` and `llvm-config` are not on the user's `PATH`, and the only
`PATH` `clang` is typically Apple's Xcode clang). The formula SHALL wire the installed `emit`
to the keg's toolchain (for example, by recording the resolved LLVM location as a default, or
installing a wrapper/environment) so that the AOT and library paths work out of the box. This
wiring SHALL NOT regress the from-source developer workflow, where discovery and the
`EMIT_LLVM_BIN` / `LLVM_CONFIG` overrides continue to apply.

#### Scenario: Installed `emit build` finds the keg toolchain

- **WHEN** a user who installed Emit via the tap runs `emit build` on a program, with only
  Apple's Xcode `clang` on `PATH` and Homebrew's `llvm` keg-only
- **THEN** `emit build` resolves the Homebrew LLVM `clang`/`llvm-config` and links a working
  standalone executable
- **AND** it does not silently fall back to a toolchain that cannot serve as Emit's backend

#### Scenario: From-source overrides still win

- **WHEN** a developer building from source sets `EMIT_LLVM_BIN` or `LLVM_CONFIG` to a chosen
  toolchain
- **THEN** that override takes precedence, unchanged by the formula's post-install wiring
