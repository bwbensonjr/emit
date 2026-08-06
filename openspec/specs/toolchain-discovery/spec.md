# toolchain-discovery Specification

## Purpose

Defines how the project locates its LLVM toolchain and Boehm libgc across differing
install layouts (distribution packages, Homebrew, Nix, custom builds) through discovery
rather than a fixed install path, how explicit environment overrides take precedence, how
the LLVM version requirement is treated as a floor, how toolchain artifacts are named in a
platform-correct way, how discovery is single-sourced and narrates its actions, and how an
installed binary falls back to the toolchain it was built against when discovery finds nothing.

## Requirements

### Requirement: The toolchain is located flexibly, not by a fixed install path

The project SHALL locate its LLVM toolchain (`clang`, `clang++`, `lli`, `llvm-as`, `llvm-link`,
`llvm-config`) and Boehm libgc through discovery rather than a single hardcoded install path, so
that any install layout in which `llvm-config` and libgc are findable — Linux distribution packages,
Intel or Apple-silicon Homebrew, Nix, or a custom build — works without editing source or build
files. Discovery SHALL use `llvm-config` as the anchor for the LLVM tools (its `--bindir` locating
the tool directory) and `pkg-config bdw-gc` for libgc's include and library directories, with
documented fallbacks when `pkg-config` has no `bdw-gc` entry. The macOS-Homebrew `llvm@22` keg
SHALL be one discovered layout among several, not a precondition.

#### Scenario: Builds on a distribution-package LLVM install

- **WHEN** the project is built on a machine whose only LLVM is a distribution package (e.g.
  `llvm-config` resolvable as `llvm-config-<N>` with tools under `/usr/lib/llvm-<N>/bin`) and whose
  libgc is described by `pkg-config bdw-gc`, with no Homebrew paths present
- **THEN** the build locates the toolchain and libgc through discovery and completes, and all three
  backends (AOT, JIT, bitcode) run, without any edit to source, `Makefile`, or scripts

#### Scenario: Homebrew keg still resolves

- **WHEN** the project is built on macOS where LLVM is a Homebrew keg (off PATH) and libgc is under
  the Homebrew prefix
- **THEN** discovery finds the keg's `llvm-config` and libgc and the build behaves as before this change

### Requirement: Explicit environment overrides take precedence over discovery

At every discovery step the project SHALL honor an explicit environment override when set, using the
discovered value only as the default. The override interface SHALL be consistent across every
consumer — the build (`Makefile`), the shell drivers (`bin/scheme-compile`, `tools/regen.sh`), and
the Chez compiler driver (`src/compile.ss`) — so that pointing the whole project at a chosen
toolchain is a matter of setting variables, not editing files. When an override names a location
that does not provide the required tools, the project SHALL fail with a clear message that names the
offending path and the override variable.

#### Scenario: Override selects a specific toolchain

- **WHEN** a developer sets the toolchain override variable(s) to a valid alternate LLVM/libgc
  location and builds or compiles a program through any backend
- **THEN** the project uses the overridden location in preference to whatever discovery would have found

#### Scenario: Invalid override fails clearly

- **WHEN** a developer sets the toolchain override to a location that lacks the required tools
- **THEN** the build or compile fails with a message naming the missing path and the override variable,
  rather than falling back silently or emitting a macOS-only "brew install" instruction

### Requirement: The LLVM version requirement is a floor, not an exact pin

The project SHALL accept any LLVM version at or above a documented minimum, with no upper bound, and
SHALL NOT require an exact major version. When the discovered LLVM's major version is below the
documented floor, the project SHALL emit a warning and continue rather than fail. The floor SHALL be
overridable by an environment variable. Tool-presence checks SHALL probe the discovered tools rather
than testing for a single absolute pinned path.

#### Scenario: A newer LLVM is accepted without warning

- **WHEN** the discovered LLVM major version is at or above the documented floor
- **THEN** the project uses it with no version warning

#### Scenario: An older LLVM warns but proceeds

- **WHEN** the discovered LLVM major version is below the documented floor
- **THEN** the project emits a single warning naming the discovered version and the floor, and continues

### Requirement: Toolchain artifacts are named in a platform-correct way

The project SHALL derive the shared-library file extension for libgc from the host platform —
`.dylib` on macOS, `.so` on Linux and other ELF platforms — wherever a shared-object path is needed
(notably the `lli -load=` argument used by the JIT backend), rather than assuming a single extension.
The `.dylib` assumption that previously broke the JIT backend off macOS SHALL be removed.

#### Scenario: JIT backend loads libgc on Linux

- **WHEN** a program is built with `--backend jit` on Linux, where libgc is `libgc.so`
- **THEN** the JIT exit loads the correct `libgc.so` and runs, producing the same value as the AOT exit

#### Scenario: JIT backend loads libgc on macOS

- **WHEN** a program is built with `--backend jit` on macOS, where libgc is `libgc.dylib`
- **THEN** the JIT exit loads `libgc.dylib` and runs as before this change

### Requirement: Discovery is single-sourced and narrates its actions

Toolchain discovery SHALL be implemented once, in a single shared layer, and consumed by the build
and every driver — the five previously duplicated definitions (LLVM bin directory, `clang`,
`clang++`, libgc include directory, libgc library directory) SHALL NOT be independently hardcoded in
multiple files. The Chez compiler driver, which cannot source the shared shell layer, SHALL consume
the same override interface (the layer's exported variables) and SHALL self-probe via
`llvm-config`/`pkg-config` when those variables are unset, so that a direct `chez --script` invocation
still resolves the toolchain. Discovery SHALL narrate what it resolved on stderr under the project's
verbosity control, per the observability convention.

#### Scenario: One discovery implementation feeds all consumers

- **WHEN** the toolchain location changes (a different `llvm-config` is discovered or overridden)
- **THEN** the build, the shell drivers, and the Chez driver all use the new location without
  editing a per-file default, because they resolve it through the one shared layer or its exported
  override interface

#### Scenario: The Chez driver resolves the toolchain standalone

- **WHEN** `src/compile.ss` is invoked directly (`chez --script`) with the override variables unset
- **THEN** it self-probes `llvm-config`/`pkg-config` and resolves the toolchain, rather than requiring
  a launcher to have set the variables first

#### Scenario: Discovery reports what it found

- **WHEN** discovery runs at the default verbosity
- **THEN** it announces the resolved LLVM tool directory, version, and libgc location on stderr,
  leaving stdout free of narration

### Requirement: An installed binary carries its build-time toolchain as a last-resort default

The values the build resolved for the C toolchain — the C compiler and the Boehm libgc include and
library directories — SHALL be recorded in the binary at build time and consulted as the **lowest
precedence** source when a delivering door needs them. The full precedence ladder SHALL be:

1. explicit environment overrides (`CC`, `GC_INC`, `GC_LIB`, and the `EMIT_GC_*` mirrors);
2. discovery through the shared toolchain-discovery script;
3. the compiled-in build-time defaults.

Placing the compiled-in values last is required, not incidental: a recorded path is the stalest
information available, so a live discovery result SHALL always win over it. The compiled-in values
exist for the case where discovery finds nothing — notably an installation whose LLVM is present but
off `PATH`, where neither `clang` nor `llvm-config` is discoverable without knowing the keg's
location.

When a door falls through to the compiled-in defaults and they do not work, the resulting failure
SHALL name the compiled-in path and identify it as a build-time default, so the user learns that the
toolchain the binary was built against has moved rather than seeing only the compiler's own error.

The recorded values SHALL be set by the same build that resolves them, so they cannot disagree with
what the project actually built against, and SHALL follow the `PREFIX`/`DESTDIR` convention already
used for the compiled-in installation prefix: staging into a temporary root SHALL NOT change the
recorded toolchain.

#### Scenario: An installed door links with no toolchain in the environment

- **WHEN** `emit build` is invoked from an installed prefix with no `CC`, `GC_INC`, or `GC_LIB` set,
  on the machine the binary was built on
- **THEN** it resolves a toolchain and produces a working executable, falling through to the
  compiled-in defaults if discovery yields nothing

#### Scenario: Discovery still wins over the compiled-in defaults

- **WHEN** a door needs the toolchain, the compiled-in defaults are present, and the discovery
  script also resolves a toolchain
- **THEN** the discovered values are used, so a toolchain upgraded after Emit was installed is
  followed rather than ignored

#### Scenario: An explicit override still wins over both

- **WHEN** `CC`, `GC_INC`, and `GC_LIB` are set explicitly
- **THEN** those values are used without consulting discovery or the compiled-in defaults

#### Scenario: A stale compiled-in default fails legibly

- **WHEN** a door falls through to the compiled-in defaults and the recorded location no longer
  provides the required tools
- **THEN** the failure names the recorded path and identifies it as a build-time default, rather
  than surfacing only the underlying compiler error
