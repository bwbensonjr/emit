# Source release preparation

Emit source releases contain committed bootstrap IR and the source, vendored
data, licenses, tools, tests, and documentation needed to build and install.
They require an installed LLVM/clang toolchain, C++ development environment,
libgc headers and library, GNU make, Bash, and standard Unix utilities. Chez,
Git metadata, and network access are unnecessary for the extracted source
build. LLVM and libgc remain dynamic system dependencies. These releases do
not provide binary bundles, signatures, attestations, or installers.

Prepare `VERSION` and the matching nonempty `CHANGELOG.md` section, complete
integration checks, and commit the release state before tagging. Normally the
version bump arrives in a pull request and merging it to `main` creates the tag
([automatic release tagging](#automatic-release-tagging)); the commands below
package and check a commit by hand. The changelog
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

## Automatic release tagging

`.github/workflows/release-tag.yml` turns a merged version bump into a release,
so no step depends on a maintainer pushing a tag
([version policy](RELEASES.md#bumping-the-version)):

1. A push to `main` that changes `VERSION` starts it (`paths: [VERSION]`).
2. It checks that the `RELEASE_TAG_TOKEN` secret is present and can push to this
   repository, with an authenticated `git push --dry-run`. A missing or
   read-only token fails here, naming the secret, before any tag exists.
3. `tools/release-tag.sh plan` decides. It prints `skip=unchanged` when
   `VERSION` equals the previous `main`, `skip=tagged` when `v<VERSION>`
   already exists, and otherwise runs `check`: a plain `MAJOR.MINOR.PATCH`
   version greater than every `v*` release tag, with a nonempty changelog
   section. A version that fails `check` fails the run and creates no tag.
4. It creates the annotated tag `v<VERSION>` at the pushed commit and pushes
   that one ref with the token, never forced, so an existing tag is never moved.

The tag push is an ordinary `push` from a credential other than `GITHUB_TOKEN`.
GitHub starts no workflow from a tag pushed with `GITHUB_TOKEN`, which is why
the token exists. The push starts **Source release** above, which runs every
gate and publishes, and its successful run starts **Distribution channels**
below. Neither workflow changes, and neither can be started into publishing
any other way. The Homebrew tap and Nix promotion pull requests still need a
maintainer merge.

Pull requests get the same decision early: when `VERSION` changes, the policy
job of `compatibility.yml` runs `tools/release-tag.sh check HEAD` against the
fetched tags. The push-time `plan` remains authoritative, because two version
pull requests can both pass and only the first to merge still advances.

**The token.** `RELEASE_TAG_TOKEN` is a fine-grained personal access token
limited to `bwbensonjr/emit`, with **Contents: Read and write** and nothing else.
`GITHUB_TOKEN` in this workflow stays `contents: read`, the checkout keeps no
credentials, and only the preflight and push steps see the secret.
`test/ci-policy-tests.py` pins those properties. To create or rotate it:

1. In GitHub settings, under Developer settings > Fine-grained tokens, generate
   a token for the repository owner with repository access limited to
   `bwbensonjr/emit`, permission Contents: Read and write, and an expiry.
2. Store it: `gh secret set RELEASE_TAG_TOKEN --repo bwbensonjr/emit`, which
   reads the value from standard input.
3. Confirm the name is listed: `gh secret list --repo bwbensonjr/emit`.
4. Revoke the old token after the next run's preflight passes.

**Retry.** If the run failed before tagging, for example because the secret was
missing or expired, fix the cause and dispatch the workflow on `main`:

```sh
gh workflow run release-tag.yml --ref main
```

Dispatch tags the current `main` when its `VERSION` is untagged and passes
`check`, and otherwise reports `skip=tagged`. If commits landed on `main` after
the bump, dispatch tags the current head rather than the bump commit. A tag
pushed by hand at the bump commit, `git tag -a vX.Y.Z <commit>` and
`git push origin vX.Y.Z`, remains equivalent.

**Failed gates.** Once the tag exists, Source release owns the outcome. A
transient failure is rerun on the same tag. A defect is fixed forward by
merging a later version: the tag is never moved or deleted, and no public
release or channel promotion occurs for the failed version.

**Rollback.** Disabling or deleting `release-tag.yml` returns releases to
manual tag pushes. Nothing else depends on it.

## Distribution channels

`.github/workflows/channels.yml` builds, tests, and promotes the Homebrew, Nix,
and OCI channels ([Installation](INSTALLATION.md#distribution-channels)). It
consumes a published source release and never changes it. Each channel promotes
exactly the artifact it tested.

| Trigger | Source | Publishes |
| --- | --- | --- |
| Pull request touching channel inputs (`packaging/`, `flake.*`, `tools/channel-*.sh`, `tools/offline-run.sh`, `test/channel-accept/`, the workflow) | candidate archive packaged from the PR head | nothing |
| Manual dispatch, `tag` empty | candidate archive from the dispatched ref | nothing |
| Manual dispatch, `tag` set, `publish` off | that release's published archive | nothing |
| Manual dispatch, `tag` set, `publish` on; or a successful tag-push run of "Source release" | that release's published archive | each channel that passed |

The **identity** job runs the release-source and promotion regression tests. It
then downloads the release archive and `SHA256SUMS`, verifies them, and writes
the release identity with `tools/channel-identity.sh` (version, tag, commit,
URL, SHA-256). For a rehearsal, it packages a candidate archive instead. Every
channel job verifies that identity before building, and there is no fallback
to a branch checkout.

The three channel jobs are independent:

- **homebrew** (`macos-15`) renders `packaging/homebrew/emit.rb.in` into a
  throwaway local tap. It runs `brew style` and `brew audit --strict`, builds
  from source, and runs `brew test`.
- **nix** (`x86_64-linux` on `ubuntu-24.04`, `aarch64-darwin` on `macos-15`)
  builds `packages.candidate`, or `packages.default` from the release identity.
  It also runs the flake's sandboxed acceptance check.
- **oci** (`ubuntu-24.04`) builds `packaging/oci/Containerfile` once for
  `linux/amd64`, into an image archive. It loads that archive and checks
  argument and exit-status forwarding through the entrypoint.

Each channel then runs `tools/channel-accept.sh` against its installed command,
with the network denied (`tools/offline-run.sh`, or `--network none`) and the
checkout hidden. Every job uploads its JSON report.

Promotion uses `tools/channel-promote.sh` and is safe to retry:

- **OCI** pushes the tested archive with `skopeo --preserve-digests`, so the
  registry digest is the tested digest. The version tag is created only if it
  is absent. A version tag that already resolves to the tested digest succeeds
  unchanged. One that resolves to a different digest fails, and the version tag
  is never overwritten. `latest` moves last.
- **Homebrew** opens or reuses a pull request on `bwbensonjr/homebrew-emit`
  that sets `Formula/emit.rb`.
- **Nix** opens or reuses a pull request in this repository that sets
  `packaging/release.json`, after both systems passed.

Both pull requests are reviewed and merged by a maintainer.

Permissions:

- Only the oci job holds `packages: write`.
- Only `nix-promote` holds `contents: write` and `pull-requests: write`.
- The `HOMEBREW_TAP_TOKEN` secret, a fine-grained token limited to the tap
  repository, reaches only publish-gated steps. Each promoting job first checks
  its credential, before building.

`test/ci-policy-tests.py` pins these properties.

Retry and rollback:

- **A failed channel** is retried alone, by dispatching the workflow with the
  same `tag` and `publish` on. Channels that already promoted see their own
  results unchanged. The source release is never retagged.
- **OCI rollback** re-points `latest` to a previously validated digest:
  `tools/channel-promote.sh oci-latest ghcr.io/bwbensonjr/emit sha256:...`.
  Digests are recorded in each run's `channel-oci` artifact.
- **Homebrew and Nix rollback** reverts the promotion pull request's commit,
  which restores the previous formula or `packaging/release.json`.
- **A broken release** is never repaired in place. Ship a new patch release,
  and let the channels follow it.

Rehearse a published release without publishing (the workflow must be on the
default branch):

```sh
gh workflow run channels.yml -f tag=vX.Y.Z -f publish=false
```

`v0.1.0` predates the toolchain pin and the shared acceptance fixtures, so the
first channel release is the release after it.
