# Design

## Context

See proposal.md for motivation and specs/distribution/spec.md for the channel
requirements. The facts below shape how the three channels are built.

- **Source releases are already validated end to end.** `tools/release-source.sh`
  packages one commit deterministically from an explicit directory list,
  `tools/release-check.sh` verifies it, `tools/ci-archive.sh` builds the exact
  archive offline with the checkout hidden and Chez absent, and
  `.github/workflows/release.yml` publishes only after the shared
  `compatibility.yml` gate passes. Only `v0.1.0` exists, and it predates the
  merged compiler and validation fixes.
- **The installed payload is already relocatable.** `make install` honors
  `PREFIX`/`DESTDIR`, and the binary resolves `../share/emit` from its real path
  before falling back to the compiled `PREFIX` (docs/INSTALLATION.md). Every
  channel installs the same `make install` tree; none needs a custom layout.
- **`emit build` rediscovers the C toolchain at run time.** `discover_toolchain`
  in `src/emit.cpp` layers explicit `CC`/`GC_*` over the installed
  `tools/llvm-env.sh --print-env`, then over build-time `EMIT_DEFAULT_*`.
  Discovery prefers any `clang` on PATH for `CC` (Apple clang on macOS) and the
  newest `llvm-config` it can find. That is the right default for a source build
  that follows the user's upgrades. It is wrong for a package that declared
  LLVM 22: a Homebrew user with `llvm` (23) installed, or only Apple clang on
  PATH, would link LLVM 22 IR with a different compiler. The spec's "another
  clang on PATH" and "LLVM keg not on PATH" scenarios fail today.
- **`emit` dynamically links LLVM's ORC API and libgc.** Every channel must
  retain the exact LLVM 22 shared library that `emit` was built against, plus a
  matching clang for AOT. On Linux, `-flto` AOT links need lld or the LLVMgold
  plugin. The CI recipe makes lld clang's default linker for that reason
  (docs/TOOLCHAIN.md).
- **`tools/ci-installed-smoke.sh` already checks the installed commands**
  (version, doctor, run, REPL, lib, build). It reads `VERSION` and fixtures from
  the checkout, so it cannot run against a package outside the checkout. It also
  does not cover persistent REPL state, SRFIs, macro-bearing libraries,
  non-baked imports, or a read-only payload.
- **None of this touches assembled compiler inputs.** `tools/llvm-env.sh`, the
  `Makefile`, and `src/emit.cpp` are absent from
  `tools/compiler-inputs.sh --list`, so no `make regen` barrier is crossed.

## Goals / Non-Goals

**Goals:**

- Make one upstream mechanism, a package toolchain pin, the way every channel
  (and any downstream packager) binds an installed Emit to its declared LLVM 22
  and libgc. Avoid three channel-specific wrapper scripts.
- Make one acceptance script, run against an installed `emit` command, the
  required check for all three channels and every platform.
- Make one metadata file the source of release identity for all channels.
- Keep rehearsal and promotion in a separate workflow that consumes an already
  published source release and never rebuilds what it tested.

**Non-Goals:**

- No change to the default discovery behavior of a plain source build or
  `make install`. The pin is opt-in at install time.
- No Homebrew bottles, `linux/arm64` image, or Nix systems beyond the two named.
  The recipes do not preclude them, but nothing tests them.
- No automatic tap merge or automatic flake bump. Promotion opens reviewable
  changes, and a maintainer merges them.
- No changes to the source-release workflow's gates. The channel workflow
  depends on them and does not duplicate them.

## Decisions

### D1. An opt-in installed toolchain pin, read by `llvm-env.sh`

`make install TOOLCHAIN_PIN=1` writes `share/emit/package/toolchain.env`. It
records the values this build resolved: `EMIT_LLVM_BIN`, `CC`, `GC_INC`,
`GC_LIB`, `GC_DYLIB`, and the LLVM version. `tools/llvm-env.sh` locates the file
relative to itself (`$_llvm_env_dir/../package/toolchain.env`). It parses only
known `KEY=value` lines and does not source the file. The resulting precedence
is:

1. explicit environment (`EMIT_LLVM_BIN`/`LLVM_CONFIG`/`CC`/`CXX`/`GC_*`),
   unchanged;
2. the package pin, if present. Its LLVM directory and `CC` apply only when no
   LLVM override is set, so an explicit `EMIT_LLVM_BIN` still derives its own
   clang as today. Its libgc values apply per value when the corresponding
   `GC_*` override is unset;
3. discovery, unchanged;
4. the compiled-in `EMIT_DEFAULT_*`, unchanged.

The pin is validated when read. A pinned LLVM directory without an executable
`clang`, or a major other than the recorded one, fails with a message naming
the pin file. It never falls through silently to discovery, which is the
package equivalent of the existing "unusable override" rule. `--print-env`
gains `EMIT_TOOLCHAIN_ORIGIN` (`override`, `package`, `discovery`) so
`emit doctor` can report where the AOT toolchain came from.

The recipes pass stable paths as explicit build inputs, and the pin records
whatever the build used. Homebrew uses `opt` paths rather than versioned
`Cellar` paths, Nix uses store paths, and OCI uses the image's fixed paths. The
pin does not resolve symlinks of its own. Recording `llvm-config --bindir` would
capture a `Cellar` path that disappears on a patch upgrade.

*Alternatives considered.* **Per-channel wrapper scripts** (`write_env_script`,
`wrapProgram --set-default`, image `ENV`) would satisfy each channel. They would
put the same precedence logic in three places in three languages, and downstream
packagers would have to reinvent it. Homebrew's `write_env_script` also
overrides rather than defaults, which breaks explicit overrides. **Baking LLVM
paths into the binary as a higher layer** would change `src/emit.cpp`'s
documented ordering ("a recorded path ... must never beat a live answer") for
every build, not only packaged ones. **A pin in the checkout** (for example
`tools/toolchain.env`) could alter a developer's build if a stray file
appeared. `package/` does not exist in the repository, and `.gitignore` covers
it.

### D2. One release-identity file feeds every channel

`packaging/release.json` records the channel release: `version`, `tag`,
`commit`, `archive_url`, and `sha256`. The Homebrew formula is rendered from a
template, `packaging/homebrew/emit.rb.in`, by `tools/channel-render.sh`. The
flake reads the file with `builtins.fromJSON`, and the OCI build receives its
values as build arguments. A post-release promotion pull request is the only
thing that updates it, and the change is reviewable.

`release-source.sh`'s explicit directory list excludes `flake.nix`,
`flake.lock`, and `packaging/`. A released archive therefore never carries a pin
to an older release, and a release-source test asserts that exclusion. The
in-archive recipe stays `make` / `make install`.

Until the first channel release exists, `release.json` is absent. The flake then
exposes only `packages.candidate` (built from `self`) and the shells, and the
spec's `packages.default` arrives with the first promotion pull request. Every
consumer validates the version against the archive's `VERSION` and the digest
against `sha256` before building. A mismatch fails, and there is no fallback
(spec: "Package source identity disagrees").

*Alternative:* hard-code the version and hash separately in each recipe. That
makes three places that can disagree, and the spec requires one identity.

### D3. Installed acceptance is one script, run where the installed command runs

`tools/channel-accept.sh --emit PATH --expect-version V --report FILE` runs from
a fresh workspace, using copied fixtures from `test/channel-accept/`. It sets a
private `EMIT_CACHE` and unsets the `EMIT_MANIFEST`/library-path variables. It
runs eleven checks in order, and runs all of them even after a failure:

- version identity;
- `doctor`;
- JIT `run` with a non-baked import;
- a scripted `repl` that defines a value and then uses it in later inputs;
- `(srfi 1)` and `(srfi 64)` imports;
- shipped libraries outside the baked set;
- a fixture library exporting `define-syntax` macros, compiled with `emit lib`;
- a program importing that library under `run`;
- an AOT `build` of the program, whose executable is run;
- an AOT `build` of the macro-library program, whose executable is run;
- a check that the installed `share/emit` payload is byte-identical to its
  digest before the run.

The report is JSON on the path given: the source digest, platform, `emit
--version`, the doctor toolchain selection, pin, compiler, and libgc lines, each
check's outcome and duration, and the overall result. Narration goes to stderr
per docs/OUTPUT.md. A missing or failed check fails the run.

The script runs *where `emit` runs*, so an AOT executable runs in the
environment it was linked for. It uses only bash and POSIX utilities, because
the OCI image carries no Python. Homebrew, Nix, and source archives run it on
the host. The OCI job mounts `tools/` and `test/channel-accept/` read-only
inside the container, preserving their relative layout. *Rejected:* wrapping
`docker run` as a multi-word command from the host. Every AOT executable would
then need a second container invocation, and the host would need the image's
runtime libraries.

The read-only scenario is tested directly. The Nix store is read-only by
construction. For Homebrew and the source archive, the harness runs
`chmod -R a-w` on the installed prefix before acceptance. The image runs with
`--read-only` and writable mounts only at `/work` and `/cache`. The
payload-digest check catches writes that the permissions alone would not
reveal, for example when running as root.

Offline execution reuses the network-denial wrappers in `tools/ci-archive.sh`
(a Linux namespace and macOS `sandbox-exec`). They are factored into
`tools/offline-run.sh` so the archive and channel jobs share one
implementation. OCI acceptance uses `--network none` instead.

The script's own regression checks live in `test/install-layout-tests.sh`,
which is already in the full and compat profiles. That suite runs one passing
run against a read-only pinned install, and one run whose wrong version, broken
fixture, and payload-writing launcher must each fail their own check while the
remaining checks pass.

### D4. Homebrew: a source-only formula built with explicit keg paths

The formula `bwbensonjr/emit/emit` declares `depends_on "llvm@22"`,
`depends_on "bdw-gc"`, `depends_on arch: :arm64`, and `depends_on :macos`. It
builds with `LLVM_CONFIG`, `EMIT_LLVM_BIN`, `CXX`, `CC`, `GC_INC`, and `GC_LIB`
set explicitly to `Formula["llvm@22"].opt_*` and `Formula["bdw-gc"].opt_*`.
Explicit values keep superenv shims out of the recorded pin and out of
`EMIT_DEFAULT_CC`. It runs `make` and then
`make install PREFIX=#{prefix} TOOLCHAIN_PIN=1`, and installs `LICENSE` and the
vendored notices. The formula's `test do` covers version, `run`, and `build` of
a small program. The full acceptance script runs in CI against
`$(brew --prefix)/bin/emit` with a PATH of only Homebrew's `bin` and the system
directories.

Rehearsal points the rendered formula's `url` at a local candidate archive
(`file://`) inside a throwaway local tap. It runs
`brew install --build-from-source` and never touches the public tap.

*Alternative:* `depends_on "llvm"` (unversioned). That follows Homebrew's
major-version bumps into an ORC ABI the binary was not built for, which is the
instability docs/DISTRIBUTION.md already names.

### D5. Nix: one derivation function, three uses

`packaging/nix/emit.nix` is a `callPackage`-style function over `src`. The flake
instantiates it three ways:

- `packages.candidate` from `self`;
- `packages.default` from a `fetchurl` of `release.json`'s archive and digest
  (once D2's file exists);
- a check derivation that runs `make` plus the native unit checks in the
  sandbox.

The derivation uses `llvmPackages_22` and `boehmgc`, runs `patchShebangs` on
`tools/`, and builds with `make` followed by
`make install PREFIX=$out TOOLCHAIN_PIN=1`. `CC` for AOT is a clang whose
default linker is lld on Linux (`llvmPackages_22.clangUseLLVM`, or an
equivalent `wrapCCWith` over `llvmPackages_22.bintools`), so `-flto` links work
without a gold plugin. On `aarch64-darwin` it is the standard wrapped clang. The
store path recorded in the pin keeps that clang, its libc and SDK inputs, and
libgc in the runtime closure, which satisfies "retains its required Nix runtime
closure." `wrapProgram` adds only `coreutils` and `bash` to PATH for the
installed `llvm-env.sh`. It sets no toolchain variables, because the pin
supplies them.

`devShells.default` provides `llvmPackages_22` tools, `boehmgc`, GNU make,
`pkg-config`, and Python. It does not include Chez. `devShells.verify` adds
`chez`. Neither shell runs a hook beyond exporting `LLVM_CONFIG`, so entering a
shell never regenerates anything. `flake.lock` pins nixpkgs. The build reads
only `src` and declared inputs, and Nix's sandbox gives "no network" on Linux.
macOS CI sets `sandbox = true` explicitly.

### D6. OCI: Ubuntu base pinned by digest, distribution LLVM 22, single-arch

`packaging/oci/Containerfile` is a two-stage build. The builder stage takes the
already-verified source archive as build context, checks its `sha256` against a
build argument, and runs `make` and `make install PREFIX=/opt/emit
TOOLCHAIN_PIN=1`.

The final stage starts from the same digest-pinned Ubuntu base. It installs
`clang-22`, `lld-22`, `llvm-22`, `libgc1`, `libgc-dev`, and `libc6-dev` at
exact package versions recorded in the Containerfile. It writes a
`clang.cfg` beside `clang-22` with `-fuse-ld=lld` so AOT `-flto` links do not
depend on LLVMgold, copies `/opt/emit` from the builder, and installs nothing
else. It leaves out Chez, Git, Python, and the source tree. The image:

- sets `WORKDIR /work`, `ENV EMIT_CACHE=/cache`, and `ENV HOME=/work`, so an
  arbitrary UID has a writable home;
- creates `/work` and `/cache` with mode 1777;
- leaves `/opt/emit` root-owned and read-only to others;
- uses an exec-form `ENTRYPOINT ["/opt/emit/bin/emit"]`, so arguments and exit
  status pass through unchanged;
- carries `org.opencontainers.image.{version,revision,source,licenses}` labels
  plus `io.github.bwbensonjr.emit.llvm`.

The first implementation task confirms that the selected Ubuntu release
publishes `llvm-22` packages. If it does not, the same stage uses apt.llvm.org's
versioned packages, with the repository key pinned by fingerprint and package
versions pinned exactly. The design and the acceptance checks are unchanged
either way.

*Alternative:* copy the CI-provisioned LLVM 22 bundle (`tools/ci-provision.sh`)
into the image. It is the best-pinned toolchain the repository has. However, it
is a private prefix with absolute paths from a runner's temporary directory, so
relocating it into an image is new and untested work. Distribution packages are
the conventional, smaller, and maintained choice for a development image.

### D7. A separate channel workflow with build-once, promote-exact semantics

`.github/workflows/channels.yml` has three triggers:

- **Pull requests** classified as packaging changes (`tools/test-classify.py`
  gains a `packaging` class covering `packaging/**`, `flake.*`,
  `tools/channel-*.sh`, and `test/channel-accept/**`). These run a rehearsal
  against a candidate archive packaged from the PR head.
- **`workflow_dispatch` with a `tag` input and `publish: false`** runs a
  rehearsal against that published release.
- **`workflow_dispatch` with `publish: true`, or a `workflow_run` of a
  successful "Source release" on a tag**, runs promotion.

The jobs, which are independent so that one channel's failure never blocks or
undoes another, are:

1. **identity**: downloads the published archive and `SHA256SUMS`, verifies
   them, and checks the tag, `VERSION`, and commit. On a rehearsal, it packages
   the candidate archive instead.
2. **homebrew** (`macos-15`, arm64): renders the formula, installs it from a
   local tap, runs acceptance, and uploads the report. On promotion it pushes a
   branch to `bwbensonjr/homebrew-emit` and opens a pull request. That requires
   the `HOMEBREW_TAP_TOKEN` secret, a fine-grained token scoped to that
   repository, which is the only credential that job receives.
3. **nix** (`ubuntu-24.04` x86_64 and `macos-15` aarch64): builds the package
   and the check, runs acceptance against `result/bin/emit` outside any shell,
   and uploads the report. On promotion it opens a pull request in this
   repository that updates `packaging/release.json` (and `flake.lock` only if
   intended).
4. **oci** (`ubuntu-24.04`): runs `docker buildx build --output
   type=oci,dest=emit.oci` and loads that same archive. It runs acceptance
   inside the container (D3) as a non-root UID with `--network none
   --read-only`, then checks the default entrypoint's argument and status
   forwarding separately, and records the manifest digest. On promotion it runs `skopeo copy --preserve-digests
   oci-archive:emit.oci docker://ghcr.io/bwbensonjr/emit@<digest>` and then tags
   the result. Only this job gets `packages: write`.

Tag rules for the image:

- The immutable version tag `X.Y.Z` is created only if it is absent. If it
  already resolves to the tested digest, the job succeeds without changes. If
  it resolves to a different digest, the job fails visibly.
- The moving tag `latest` is updated last. Rollback re-points `latest` to a
  previously validated digest. It never retags `X.Y.Z`.
- Homebrew and Nix roll back by reverting their pull-request commit, which
  restores the prior pinned release.

All actions are pinned by full SHA, as in `release.yml`. PR and rehearsal runs
have no write permissions and no tap token.

*Alternative:* add channel jobs to `release.yml`. That would couple a
third-party registry or tap outage to the source release's success. The spec
requires that a channel failure be retryable without retagging the source.

### D8. The initial release is selected by the existing SemVer policy

The channel release is the next version after `0.1.0`: minor if the merged
changes include an incompatible language or public CLI change, patch
otherwise. The changelog review decides which. It is cut through the unchanged
`release.yml` and includes D1's pin and D3's acceptance script, so its own
archive gate exercises them. `v0.1.0` is untouched.

## Risks / Trade-offs

- [Homebrew upgrades `llvm@22` within the major, and the `emit` binary links
  the new dylib] → The ORC C++ ABI is expected to be stable within a major. The
  formula records the LLVM version in the pin, and `llvm-env.sh` fails on a
  major mismatch rather than continuing. A patch-version ABI break would surface
  in the tap's next CI run, and the fix is a formula revision bump.
- [`llvm@22` is absent, or deprecated, in Homebrew when the formula lands] → An
  early task confirms it. Homebrew keeps versioned LLVM formulae for several
  majors. If it is gone, the change pauses, because the spec fixes LLVM 22.
- [Nix clang on `aarch64-darwin` cannot perform `-flto` AOT links with the
  default ld64/libLTO pairing] → Acceptance runs a real AOT build on that
  platform. If it fails, the derivation selects a `wrapCCWith` that passes the
  matching `libLTO`, and the failure blocks promotion until then.
- [`clang.cfg` in the image is easy to lose in a base-image bump] → Acceptance's
  AOT check fails without it, and the Containerfile comment names why it
  exists.
- [The pin makes packaged Emit stop following the user's LLVM] → This is
  intended for packages and is documented. Explicit `EMIT_LLVM_BIN`/`CC`
  overrides still win, and `emit doctor` names the origin.
- [Pin paths go stale when the package manager moves dependencies] → Homebrew
  `opt` paths and Nix store paths are stable by design. The image is immutable.
  Pin validation fails loudly instead of falling back.
- [Tap token or GHCR ownership is not configured when promotion first runs] →
  A preflight step checks token scope and package write access before any
  build, and rehearsals never need either credential.
- [Channel CI cost: three new jobs, plus a Homebrew `llvm@22` install, on
  every packaging PR] → Channel jobs run only for the `packaging` class and on
  manual or release triggers, not on ordinary compiler PRs.

## Migration Plan

1. Land D1 (pin), D3 (acceptance script, and `ci-installed-smoke.sh` as its
   caller), the recipes, and `channels.yml` with rehearsal only. Packaging PRs
   rehearse all three channels against a candidate archive.
2. Prepare and cut the channel release through the existing `release.yml`
   (D8).
3. Run `channels.yml` in rehearsal mode against the published tag, then in
   promotion mode. Merge the tap and flake pull requests after review, and
   confirm `ghcr.io/bwbensonjr/emit:X.Y.Z` resolves to the tested digest.
4. Rollback for each channel follows D7. The source release is never retagged,
   and a broken channel ships a patch release or a formula revision.

## Open Questions

- Whether the tap repository already exists under `bwbensonjr`, or is created
  during the credential-verification task. Either way, it starts with the
  formula as its first content.

## Resolved dependency availability (task 1.1, 2026-10-22)

- **Homebrew:** `llvm@22` 22.1.8 and `bdw-gc` 8.2.12 are current, neither is
  deprecated, and both have `arm64_sequoia` and `arm64_tahoe` bottles. The
  `macos-15` runner therefore installs the dependencies from bottles, and only
  Emit builds from source.
- **nixpkgs:** `pkgs/development/compilers/llvm/default.nix` on master carries
  `22.1.8` (`llvmPackages_22`). `boehmgc` builds on both systems. The flake lock
  pins the revision.
- **OCI base:** Ubuntu 24.04 (noble) has no `llvm-toolchain-22`. Ubuntu 26.04
  (resolute) publishes `clang-22`, `lld-22`, and `llvm-22-dev` at
  `1:22.1.2-1ubuntu1` and `libgc-dev` at `1:8.2.12-1` in the Release pocket.
  D6 uses the distribution packages, so apt.llvm.org is not needed. The base is
  `ubuntu:26.04`, pinned to the image index
  `sha256:c098726dd9b9733f3e885f8de0ef375206a311b0a317eadc40d347b1115fb944`. The
  index digest fixes every platform's manifest, including `linux/amd64`
  (`sha256:42527649dbc4f9197a6073f426f488cbff0e9cc9f2afce32d91c383e4875634a`).
  It also lets the identical recipe build natively for `linux/arm64` during
  local verification, because emulated amd64 BuildKit fails to unpack archives
  ("Function not implemented"). CI builds and publishes only `linux/amd64`.
