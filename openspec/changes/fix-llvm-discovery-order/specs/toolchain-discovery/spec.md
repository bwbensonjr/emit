# Spec Delta

## MODIFIED Requirements

### Requirement: The toolchain is located flexibly, not by a fixed install path

The project SHALL locate its LLVM toolchain (`clang`, `clang++`, `lli`, `llvm-as`, `llvm-link`,
`llvm-config`) and Boehm libgc through discovery rather than a single hardcoded install path, so
that any install layout in which `llvm-config` and libgc are findable — Linux distribution packages,
Intel or Apple-silicon Homebrew, Nix, or a custom build — works without editing source or build
files. Discovery SHALL use `llvm-config` as the anchor for the LLVM tools (its `--bindir` locating
the tool directory) and `pkg-config bdw-gc` for libgc's include and library directories, with
documented fallbacks when `pkg-config` has no `bdw-gc` entry. The macOS-Homebrew `llvm@22` keg
SHALL be one discovered layout among several, not a precondition. When multiple `llvm-config`
candidates exist in known install prefixes and no higher-precedence override or `PATH` candidate
has been selected, discovery SHALL select the candidate reporting the newest LLVM version rather
than inferring version order from candidate path names.

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

#### Scenario: Newest known-prefix LLVM wins when Homebrew kegs coexist

- **WHEN** no LLVM override or `PATH` candidate is available, unversioned Homebrew `llvm` reports
  LLVM 23, and a coexisting Homebrew `llvm@22` keg reports LLVM 22
- **THEN** discovery selects the unversioned LLVM 23 toolchain even though the `llvm@22` candidate's
  path sorts later lexicographically

#### Scenario: Higher-precedence selection remains authoritative

- **WHEN** an explicit override or an `llvm-config` candidate on `PATH` selects an older valid LLVM
  while a newer candidate also exists in a known install prefix
- **THEN** discovery uses the override or `PATH` candidate without replacing it through fallback ranking
