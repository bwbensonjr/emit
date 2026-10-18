# Distribution and Installation

Status: exploration. Input to the OpenSpec design/change process; each
step in the sequence below is intended to become its own change. This
file can be edited and changed to reflect decision and priority changes.

## Goals

1. **Fast first run.** A new user goes from nothing to a working `emit repl`
   with one command on macOS and Linux.
2. **Distro-friendly source build.** Packagers can build from a source
   release against the system LLVM and libgc, offline, with `PREFIX` and
   `DESTDIR`, and without Chez.
3. **Standalone deliverables.** Executables produced by `emit build` run on
   machines without Emit, LLVM, or libgc installed.
4. **Batteries included.** Shipped libraries (SRFIs, `(scheme …)`, `(emit …)`)
   are found automatically, and third-party R7RS libraries are easy to use.
5. **Trustworthy releases.** Every binary artifact is checksummed and carries
   verifiable build provenance.
6. **Low maintenance.** Distribution must not require ongoing per-release
   manual work from a single maintainer.

## Current state

- The committed `bootstrap/*.ll` means a source build needs only LLVM 19+,
  libgc, and a C/C++ compiler. No bootstrap binary is required.
- `emit` links the LLVM C++ ORC/LLJIT API dynamically. That API is not stable
  across LLVM majors.
- `emit build` writes textual IR and forks `clang`, so the user's `clang` must
  be at least as new as the LLVM linked into `emit`.
- Library lookup uses a `PREFIX` baked in at build time.
- `make install` already honors `PREFIX` and `DESTDIR`, and toolchain
  discovery honors `LLVM_CONFIG`.
- There are no tagged releases or binary artifacts yet.

## Key tradeoffs

### System LLVM vs. bundled LLVM

| | System LLVM (dynamic) | Bundled LLVM (static) |
|---|---|---|
| Examples | Crystal, Odin, TinyGo via `go install` | Rust, Julia, Zig, TinyGo releases |
| Size | Small | Large (roughly 50–150 MB) |
| Works anywhere | No; depends on the installed LLVM major | Yes; unpack and run |
| Distro policy | Preferred (no embedded copies) | Discouraged |
| Maintenance | Tracking LLVM majors and package-manager bumps | Building LLVM in CI |

**Direction:** support both. The system-LLVM source build is the
first-class path for distros, Homebrew, and Nix. Static prebuilt tarballs
serve users who want a self-contained install.

### `clang` at AOT time

Forking `clang` couples the AOT path to whatever `clang` is on `PATH`, which
can be a different LLVM version from the libraries linked into `emit`.

**Direction:** emit object files in-process through LLVM's `TargetMachine`,
then call the system `cc` only for the final link. Ship the runtime
prebuilt as `libemitrt.a` with libgc linked in statically. Embedding `lld`
is possible later, but on macOS the SDK is still needed, so `cc` is the
practical minimum.

### Relocatable vs. prefix-baked layout

A baked `PREFIX` breaks tarballs, version managers, and Nix store paths.

**Direction:** find the library root relative to the executable first
(`<exe>/../share/emit/lib`, using `/proc/self/exe` or
`_NSGetExecutablePath`), then fall back to the baked `PREFIX`.

### Distribution channels

| Channel | Benefit | Cost or constraint |
|---|---|---|
| Source release | Required by distros; already works | Users install LLVM and libgc themselves |
| Homebrew personal tap | Maintainer-controlled; source build avoids Gatekeeper | Pin `llvm@N` to avoid breakage on LLVM bumps |
| homebrew-core | Discoverability | Notability threshold (stars/forks/watchers); not eligible yet |
| Nix flake | Reproducible; pins LLVM exactly; low effort | Smaller audience |
| Docker/OCI image | Zero-install trial; useful for CI | Not a day-to-day install |
| Static tarball + `install.sh` | Best first-run experience | LLVM CI build time; macOS signing |
| Version manager (`emitup`, mise/asdf plugin) | Multiple versions and channels | Not worth it until users need multiple versions |
| Distro packages (AUR, Debian, Fedora) | Native installs | Usually downstream volunteers; upstream's job is to make it easy |
| Windows | Broader reach | Toolchain and linker work; defer (WSL only for now) |

### macOS signing

Browsers set the quarantine attribute and `curl` does not. That means
`curl | sh` and Homebrew source builds work without signing, while a
browser-downloaded tarball is refused unless it is Developer ID signed and
notarized (paid Apple Developer account).

**Direction:** defer notarization. Document the
`xattr -d com.apple.quarantine` workaround.

### Supply chain

- Publish SHA-256 checksums, and have `install.sh` verify them.
- Add GitHub artifact attestations with `actions/attest-build-provenance`.
  This gives SLSA Build Level 2, and users verify with
  `gh attestation verify <file> --repo bwbensonjr/emit`.
- Pin GitHub Actions by commit SHA.

### Libraries and ecosystem

- Keep shipped libraries as ordinary sources under `share/emit/lib/`.
- Emit already resolves Snow (snow-fort.org) R7RS packages from local
  directories via `-L` / `EMIT_LIBRARY_PATH`. The remaining gap is an
  explicit fetch step, not network imports: either document installing
  with `snow-chibi` (and propose Emit as a recognized implementation
  upstream), or add an `emit pkg` verb that resolves the Snow index,
  verifies and installs packages with their dependencies into a
  project-local directory on the default search path, and records
  exact versions in a lockfile. Imports stay resolved from disk only,
  so builds remain reproducible and offline-capable.  Emit advertises
  an `emit` feature identifier so packages' `cond-expand` clauses
  select the right code.
- Propose Emit support upstream in Akku's per-implementation environment
  setup.
- Ship precompiled artifacts for bundled libraries in binary releases to cut
  REPL startup time (see `docs/PERFORMANCE.md`).

## Suggested sequence

Each step is a candidate OpenSpec change. Later steps assume the earlier
ones.

### 1. Release foundations

- Establish semantic versioning for Emit and make `emit --version`
  report the Emit version and the LLVM version it was built with.
- Locate the library root relative to the executable, with the baked
  `PREFIX` as fallback.
- Add `emit doctor`, which prints the LLVM version, cc/clang, libgc, and the
  library search paths in effect.
- Add a CI matrix that builds from source against each supported LLVM major
  (19–23) on Linux and macOS, so the committed `bootstrap/*.ll` is checked
  for compatibility.
- Cut the first tagged `0.x` release with a source tarball, checksums, and a
  changelog.

### 2. Low-cost channels

- Create a Homebrew tap (`bwbensonjr/homebrew-emit`) that builds from source
  and depends on a pinned `llvm@N` and `bdw-gc`.
- Add a Nix flake exposing `packages.default` and a dev shell.
- Publish a `ghcr.io/bwbensonjr/emit` image built in CI.
- Write a packaging note for downstream maintainers covering the build
  inputs, the offline test suite, and how to run with Chez optional.

### 3. Decouple AOT from `clang`

- Emit objects in-process with `TargetMachine`; link with the system `cc`.
- Build and install `libemitrt.a` with libgc linked in statically.
- Verify that delivered executables run on a machine with no Emit, LLVM, or
  libgc installed.

### 4. Self-contained binaries

- Add a CI job that builds a static LLVM (release, no asserts, needed targets
  only) and caches it.
- Produce tarballs for linux-x86_64, linux-aarch64 (against an older glibc
  baseline), and macos-arm64, including precompiled bundled libraries.
- Add `install.sh` with checksum verification.
- Add artifact attestations to the release workflow. Consider adopting the
  `dist` tool's generic mode for this.

### 5. Ecosystem and reach (as demand appears)

- Snow consumption and an upstream Akku integration.
- A mise/asdf plugin; build `emitup` only if multi-version demand appears.
- Submit to homebrew-core once Emit meets the notability threshold.
- Support distro packaging efforts (AUR first).
- Windows support and macOS notarization.

