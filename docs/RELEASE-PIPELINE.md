# Source release preparation

Emit source releases contain committed bootstrap IR and the source, vendored
data, licenses, tools, tests, and documentation needed to build and install.
They require an installed LLVM/clang toolchain, C++ development environment,
libgc headers and library, GNU make, Bash, and standard Unix utilities. Chez,
Git metadata, and network access are unnecessary for the extracted source
build. LLVM and libgc remain dynamic system dependencies. These releases do
not provide binary bundles, signatures, attestations, or installers.

Prepare `VERSION` and the matching nonempty `CHANGELOG.md` section, complete
integration checks, and commit the release state before tagging. The changelog
heading is `## <VERSION>` or `## [<VERSION>]` (the latter may be followed by
` - <date>`). The first
release identity is `0.1.0` and tag `v0.1.0`. From a checkout, package a concrete
commit into a fresh directory:

```sh
assets=$(mktemp -d)
tools/release-source.sh HEAD "$assets" v0.1.0
tools/release-check.sh "$assets"
test/release-source-tests.sh
```

`release-source.sh` reads metadata from the specified commit, not working-tree
files. It uses an explicit source directory list and `git archive` with a
versioned root and timestamp-free gzip compression. Untracked files, local build
outputs, account configuration, and Git metadata cannot enter the archive.
Repeated packaging of one commit produces identical bytes with the same Git
and gzip implementation. Existing output assets must match byte for byte.
`release-check.sh` verifies the checksum, root, required payload files, and
version, and proves that a deliberately corrupted copy fails verification.
The fixture tests also rehearse publication, download comparison, an unchanged
retry, and rejection of differing public assets through a local GitHub mock.

For a downloaded release, verify and build:

```sh
shasum -a 256 -c SHA256SUMS
tar -xzf emit-0.1.0.tar.gz
cd emit-0.1.0
make
staging=$(mktemp -d)
make install PREFIX=/usr/local DESTDIR="$staging"
tools/ci-installed-smoke.sh "$staging/usr/local"
```

On Linux, `sha256sum -c SHA256SUMS` is equivalent. Select matching clang,
clang++, and llvm-config as described in [toolchain CI](TOOLCHAIN.md). No build
step fetches dependencies. With dependencies provisioned, the stricter CI
validation can be reproduced from a checkout with
`tools/ci-archive.sh "$assets"`. Linux requires passwordless sudo and mount/network
namespaces; macOS requires `sandbox-exec`. The wrapper extracts to a fresh
temporary directory, hides the checkout, denies network access to the complete
build process tree, verifies connectivity fails, checks Chez is unavailable,
builds and stages installation, then exercises installed version, doctor, run,
scripted REPL, library compilation, and an AOT executable. Its temporary
workspace is retained for inspection. Native dependencies must live outside
the checkout that the sandbox hides.

`.github/workflows/release.yml` handles `v*` tags. Classified release/packaging/
installation infrastructure PRs rehearse source packaging and both offline
archive builds in the shared compatibility workflow before any tag exists.
Documentation-only PRs provision no toolchain. A manual release dispatch rehearses the complete gate
without publishing. For the exact release commit it:

1. Requires full native regression in all four Linux/macOS and LLVM 22/23 cells,
   plus one canonical Chez-free source/bootstrap consistency proof and one
   complete independent-host reference proof (with direct source units).
2. Rejects tag/version/changelog mismatches and packages once, comparing a
   second local package for determinism.
3. Transfers that archive and checksums to Linux and macOS archive validators.
4. Downloads the same artifact into the publication job, creates a draft,
   uploads the validated archive and `SHA256SUMS`, and compares downloaded bytes
   before making the release public. The matching changelog section is the
   release body.

All external Actions use full commit SHA pins verified from their official
release pages. Only the publication job receives `contents: write`; checkout
does not retain credentials. Publication jobs for one tag are serialized.

A failed native, source, reference, identity, archive, or missing-result gate
leaves no public release. The final required-check aggregate rejects unexpected
skips and cancellation. Every tag tests its actual committed source even if its
parent already passed. Shared candidate toolchains are prepared once per tuple
and consumed by native/reference/archive jobs after validation; they are not
reused correctness results. Trusted default-branch toolchain bundles and exact
source fallback are documented in [toolchain CI](TOOLCHAIN.md).

Release concurrency never cancels publication for PR activity. This workflow
does not create a tag during a rehearsal, and manual dispatch cannot publish.
Retry the failed
workflow after addressing the failure. A draft may be inspected before retry;
the script accepts only matching notes and existing asset bytes. For an already
public release, a retry verifies both assets and leaves them untouched. Missing
or differing public assets fail instead of being overwritten. Never move a
published tag or replace its payload: correct a public release with a new patch
version and changelog section. Before publication, fixes require a fresh
validated release commit. Record the resulting release URL and checksum in the
implementation handoff after successful publication.
