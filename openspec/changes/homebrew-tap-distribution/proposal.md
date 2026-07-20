## Why

Installing Emit today means cloning the repo, manually installing a recent LLVM + Boehm
libgc, and running `make`. There is no one-command install and no released artifact — the
tree only has `main`, with no tags. We want people on macOS to install Emit through an
established, trusted package manager that also resolves the heavy toolchain dependencies for
them, rather than a `curl | sh` script. A Homebrew tap is the lowest-effort, fully
owner-controlled way to deliver exactly that, and macOS is the first target.

## What Changes

- **Establish Semantic Versioning** for the project, starting at `0.1.0`. The version tracks
  Emit's user-facing surface (the accepted language and the CLI); the internal bootstrap IR,
  self-hosting fixed point, and the existing `compiler-stamp-version` artifact marker are
  separate axes, not part of this contract. MAJOR stays `0` during development; the `1.0.0`
  decision is deferred until Emit supports a consistent Scheme-standard subset (e.g. R7RS-small).
- **Record the version once in a committed source-of-truth artifact** (not derived from git, so
  tarball builds with no `.git` resolve it), surfaced through `emit --version` and in the REPL
  startup banner.
- **Introduce a tagged release** (`vMAJOR.MINOR.PATCH`) producing a stable source tarball.
  The committed bootstrap IR travels in the tarball, so a release build needs neither Chez
  nor `make regen` — only LLVM + libgc + `make`. This is the prerequisite for any package
  manager and does not exist yet.
- **Publish a Homebrew tap** (`bwbensonjr/emit`) with a `emit` formula that:
  - declares `depends_on "llvm"` and `depends_on "bdw-gc"`, so `brew install` resolves the
    LLVM + Boehm GC dependencies for the user;
  - **tracks the unversioned `llvm` formula** (the current stable major), rather than pinning
    a `llvm@NN` keg — coherent with the existing `toolchain-discovery` requirement that the
    LLVM version is a floor, not an exact pin, and robust against Homebrew's removal of old
    versioned kegs;
  - **builds from source** (`make`) at install time — no prebuilt bottles in this change, so
    the runtime `libLLVM` SONAME coupling does not yet apply (every install re-links against
    the LLVM brew currently provides);
  - **wires the keg-only clang path** so a Homebrew-installed `emit build` / `emit lib` finds
    its LLVM toolchain (clang, llvm-config) after install, since Homebrew's `llvm` is keg-only
    and neither `clang` nor `llvm-config` land on `PATH`.
- **Document the `brew tap … && brew install emit` path** in the README as the recommended
  macOS install, alongside the existing from-source instructions.
- **Explicitly defer** bottles (prebuilt binaries), the LLVM-major-bump rebuild CI, and the
  Linux/apt and Nix channels to later changes; capture them as non-goals so the scope stays a
  working macOS source-build tap.

## Capabilities

### New Capabilities
- `distribution`: how Emit is packaged and delivered to end users for installation — the
  release artifact contract and the macOS Homebrew tap (dependency resolution, LLVM version
  tracking policy, source build, and post-install toolchain wiring). Future channels (bottles,
  apt, Nix) extend this capability.

### Modified Capabilities
<!-- None. toolchain-discovery is referenced (floor-not-pin) but its requirements do not change. -->

## Impact

- **Version source-of-truth**: a committed version artifact (e.g. a `VERSION` file) read by the
  build/binary; small additions to the CLI for `emit --version` and to the REPL banner.
- **New (packaging repo/dir)**: a Homebrew formula (`emit.rb`) in a tap repository
  (`homebrew-emit`), referencing a released tarball + its SHA256.
- **Release process**: a tagging + tarball convention (and, minimally, checking that a clean
  tarball builds with only LLVM + libgc + make).
- **Post-install toolchain wiring**: whatever mechanism lets a brew-installed `emit` resolve
  the keg's `llvm-config`/`clang` (a recorded default, wrapper, or env) — this is the one place
  that touches how `emit`/discovery behaves when installed, and must not regress the from-source
  developer experience.
- **Docs**: `README.md` gains the Homebrew install path.
- **No change** to the compiler, runtime, committed IR, or `toolchain-discovery` behavior.
