# Spec Delta

## ADDED Requirements

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
