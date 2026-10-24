# Changelog

## 0.3.0

Installations ship a prebuilt standard library, so the first command after installing no longer
compiles it. On an Apple Silicon laptop, a first `emit run` importing `(scheme char)` takes 0.26 s
instead of 17.7 s, and a first `emit repl` starts in 0.16 s instead of 16.9 s. `make install`
behaves differently, as described below.

- An installation now carries a read-only shared library cache in `share/emit/library-cache`:
  the shipped libraries' portable IR, compile-time interfaces, and `-O1` native objects, compiled
  by the installed binary. Every user's `emit run`, `emit repl`, and `emit build` reads it before
  their own cache, and new entries still go only to the user's cache. A shared entry that does
  not match the running binary, the library sources, the CPU, LLVM, or the optimization profile
  is a miss, and the command falls back to the user's cache or compiles. Deleting the directory
  is always safe.
- Adds `emit build --stdlib --shared`, which rebuilds the shared cache from scratch for the
  invoked binary and swaps it into place only once it is complete. `EMIT_SHARED_CACHE` relocates
  the shared cache, or disables it when set to the empty string.
- `make install` without `DESTDIR` now prepares the shared cache, about 8 MB in the prefix,
  instead of warming the installing user's cache, and privileged installs prepare it too.
  Staged installs and `WARM_STDLIB=0` still defer. `make uninstall` removes the shared cache.
- The Homebrew formula, the Nix package, and the OCI image ship the shared cache. The Homebrew
  caveat asking users to run `emit build --stdlib` is gone. An image's native objects match the
  CPU of the runner that built it; on other hosts they are generated once into the user's
  cache, while the portable entries still serve every host.
- `emit doctor` reports the user and shared cache locations, and whether the shared cache was
  prepared by the running binary. Verbose cache narration names the cache each reuse came from,
  `[shared]` or `[user]`, and `emit build --stdlib` reports how many entries the shared cache
  supplied.

## 0.2.1

Corrects how Homebrew prepares the standard libraries, and makes distribution-channel retries
safe. No language or CLI changes.

- Homebrew no longer prepares the standard-library cache during installation. The 0.2.0 notes
  said `post_install` prepared it, but Homebrew runs post-install work in a sandbox with a
  temporary `HOME`, so the cache it filled was discarded. The formula's caveats now name
  `emit build --stdlib`; without it, the first command after installing compiles the libraries
  itself, which takes about a minute (#154).
- Re-running distribution-channel promotion for a published release succeeds for channels that
  already promoted it. An OCI retry re-tests the published image instead of rebuilding it, and
  no channel moves back to an older release (#153, #155, #156).

## 0.2.0

Standard-library precompilation, source-order program evaluation, quieter REPL startup, and
automatic releases. The top-level evaluation order of programs changes, as described below.

- Adds `emit build --stdlib`, which precompiles the installation's standard libraries
  (portable IR, compile-time interfaces, and `-O1` native objects) so later commands start
  faster. `make install` runs it after an unprivileged, non-staged install, and defers it for
  `DESTDIR`, root, and `WARM_STDLIB=0`, naming the command to run. Homebrew prepares it in
  `post_install` (#148).
- Evaluates a program's top-level forms in source order. An expression between definitions now
  runs at its position, so later initializers observe earlier mutations and parameter updates,
  under `emit run`, `emit build`, and the REPL. Programs that relied on every definition
  initializing before any top-level expression ran see the new order (#140).
- Summarizes REPL library sources in one `resolve libraries ->` startup line; per-manifest and
  per-library startup lines move to verbose. `emit repl` now accepts `-q` and `-v` (#149).
- The REPL banner and top-level `emit --help` name the Emit and build-time LLVM versions,
  matching `emit --version`. Per-verb help and program output are unchanged.
- `emit doctor` reports Apple clang's textual-IR compatibility as unverified instead of
  rejecting the default macOS compiler (#139).
- Adds `make uninstall`, which removes exactly the files `make install` wrote under the same
  `PREFIX` and `DESTDIR`.
- Releases automatically: merging a `VERSION` change to `main` tags it, and the existing gated
  source release and distribution channels follow. Every non-trivial change now bumps the
  version under the policy in `docs/RELEASES.md`, and pull requests that change `VERSION` must
  advance past every release tag.
- Fixes a race in the test runner's cancellation check with `/proc` entry removal (#146).

## 0.1.1

Distribution channels and validation fixes. No incompatible language or CLI changes.

- Installs through a Homebrew tap (`brew install bwbensonjr/emit/emit`, Apple Silicon), a
  Nix flake (`aarch64-darwin`, `x86_64-linux`), and a `ghcr.io/bwbensonjr/emit` image
  (`linux/amd64`), each built from this release's source archive against LLVM 22.
- Adds `make install TOOLCHAIN_PIN=1`, which records a package's toolchain so `emit build` uses
  the declared clang and libgc instead of whatever clang is first on `PATH`; explicit
  environment overrides still win. `emit doctor` reports the toolchain origin and pin.
- Shares one installed acceptance check (`tools/channel-accept.sh`) across source-release and
  channel validation, and documents downstream packaging in `docs/PACKAGING.md`.
- Makes exported library metadata canonical, so `.exports` bytes no longer depend on binding
  graph sharing (#136).
- Streamlines development validation and CI toolchain provisioning, and completes the pinned
  LLVM backend tools and Chez compatibility used by reference verification (#137).

## 0.1.0

Initial public source release of Emit.

- Provides the `emit` command for Scheme compilation, execution, REPL, and library workflows.
- Builds from committed bootstrap IR with LLVM and libgc, without Chez Scheme.
- Establishes the initial release identity and source-build compatibility baseline.
- Adds `emit --version` and read-only `emit doctor` installation diagnostics.
- Verifies relocatable installed payloads and automates source archives, checksums,
  compatibility checks, and tagged release publication.
