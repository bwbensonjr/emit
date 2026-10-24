# Design

## Context

Motivation is in proposal.md. Requirements are in `specs/distribution/spec.md`.
The machinery this change adjusts was built by the archived
`2026-10-23-low-cost-distribution-channels` change (design D6, D7):

- `.github/workflows/channels.yml` has independent `homebrew`, `nix` and
  `nix-promote`, and `oci` jobs behind a shared `identity` job.
  - Rehearsals (pull request, or dispatch with `publish` off) never receive write
    credentials.
  - Promotion runs on dispatch with `publish` on, or after a successful tag-push
    "Source release".
- `tools/channel-promote.sh` holds all promotion logic and is exercised by
  `test/channel-promote-tests.sh` against a local `registry:2`, local bare git
  remotes, and `test/channel-gh-mock.sh`:
  - `oci`: push by digest. The version tag is created only if absent, and
    `latest` moves last.
  - `oci-latest`: rollback.
  - `tap` and `flake` share `open_pull_request`.
- The `homebrew` job sets `HOMEBREW_NO_AUTO_UPDATE=1` and never updates. On
  2026-10-24 its `brew style` passed a `def post_install` formula that the
  tap's test-bot rejected after its own `brew update --auto-update`
  (run 40091548455 and tap run 40053890768).
- `open_pull_request` looks only for an *open* pull request on the branch. After
  the v0.2.0 Nix pin merged (#152), a retry found the branch content current, no
  open pull request, and called `gh pr create` on an empty diff (#155).
- The `oci` job always rebuilds. The Containerfile installs pinned apt package
  versions on a digest-pinned base, but the image is not bit-reproducible, so a
  retry's digest differed from the published `0.2.0` and the promote correctly
  refused to overwrite it (#156).

## Goals / Non-Goals

**Goals:**

- Dispatching the same tag with `publish` on succeeds for every channel that
  already promoted, and promotes the ones that had not.
- Each promoted or confirmed artifact is the one the job's acceptance tested.
- A retry of any tag, including an older one, is safe.

**Non-Goals:**

- Reproducible OCI image builds.
- Running `brew test-bot` itself in the rehearsal.
- Multi-architecture images, bottles, or any new channel.
- Automatic merging of tap or Nix pull requests.

## Decisions

### D1. Update Homebrew in the job, keep auto-update off afterwards (#153)

The `homebrew` job runs `brew update` as its first Homebrew step and narrates
`brew --version`. `HOMEBREW_NO_AUTO_UPDATE=1` stays set, so no later command
updates in the middle of the job: everything after the explicit update sees one
Homebrew.

The tap's `brew test-bot --only-tap-syntax` is essentially `brew style` plus
`brew audit` for the tap. With current Homebrew, our `brew style` and
`brew audit --strict` cover the same rules. `brew install` and `brew test` also
then run against the dependency versions users get.

*Alternative:* use `Homebrew/actions/setup-homebrew`, as the tap does. It
updates Homebrew too, but it adds an action pin and a token input to a job that
promotes with a tap credential, which buys nothing over one command.

*Alternative:* run `brew test-bot` in a git-backed scratch tap. That mirrors the
tap more closely but rebuilds what our job already does, and test-bot's
cleanup steps are designed for a disposable runner. Rejected as duplication.

### D2. A promotion compares with the base branch first (#155)

`open_pull_request` gains two checks before it touches any branch. Both read
the base branch's copy of the file, which is `main` on the target repository:

1. **Already merged:** the base's file is byte-identical to the candidate.
   Narrate `promote <path> -> <base>  [already merged]` and return success. No
   clone writes, push, or `gh` call follow.
2. **Superseded:** the base names a newer release than the candidate (D4). Narrate
   `[superseded by <version>]` and return success.

Otherwise the existing branch and pull request logic runs unchanged. A stale
leftover branch from a merged pull request is reset onto the base before
committing, so a later, different promotion never builds on a merged branch's
history.

*Alternative:* treat a `gh pr create` "No commits between" error as success.
That parses an error string from one tool version, and still pushes to the
stale branch first. Rejected.

### D3. A published OCI version is copied and re-tested instead of rebuilt (#156)

A new first step in the `oci` job resolves `ghcr.io/bwbensonjr/emit:<version>`
when the run has a release tag. A pull-request candidate never resolves one. The
lookup uses the read access of the job's `GITHUB_TOKEN`, and an inspection
failure other than "not found" fails the job, matching `remote_digest`.

- **Tag exists:** the job copies that digest with
  `skopeo copy --preserve-digests docker://…@<digest>` into the image archive
  the later steps already use, and loads it into Docker. Acceptance, entrypoint
  forwarding, and payload checks run unchanged. On promotion,
  `channel-promote.sh oci` finds the version tag already at the tested digest
  and takes its existing `[unchanged]` path.
- **Tag absent:** the job builds the image, as today.

The job narrates which branch it took and the digest under test, and the
`channel-oci` artifact records both.

This preserves "promote exactly what was tested" with no reproducibility claim.
A rehearsal of a published release now tests what users actually pull, which a
rebuild never did.

*Alternative:* reproducible builds (`SOURCE_DATE_EPOCH`, BuildKit
`rewrite-timestamp`, pinned apt snapshots). Apt layer contents and package
availability are outside our control, and the result would be fragile across
BuildKit versions. Rejected for this change; it can come later without changing
this behavior.

*Alternative:* skip OCI entirely when the tag exists. That would report success
without testing anything. Rejected.

### D4. Moving pointers compare versions and never go backward

A version is a plain `MAJOR.MINOR.PATCH`, which `tools/release-tag.sh` already
enforces for releases. Comparison is numeric per field.

- **OCI `latest`:** before moving it, `channel-promote.sh oci` reads the
  `org.opencontainers.image.version` label of the image `latest` names. If that
  version is newer than the one being promoted, it leaves `latest` alone and
  narrates `[superseded]`. A `latest` that is missing, or has no label, is
  treated as older. `oci-latest` (rollback) does not check, by design.
- **Homebrew:** the base formula's version is read from its `url`, using the
  `emit-X.Y.Z.tar.gz` asset name that `tools/channel-render.sh` writes.
- **Nix:** the base `packaging/release.json`'s version is read from its
  `version` field.

The version-comparison helper lives once in `channel-promote.sh` and gets fixture
coverage. `release-tag.sh` keeps its own copy because it orders git tags, not
channel contents; neither script sources the other.

*Alternative:* consult the repository's `v*` tags. The pointer's own content is
the truth about what users get, and it works without fetching tags in every job.

## Risks / Trade-offs

- **A Homebrew release can turn the rehearsal red with no change to this
  repository.** That is the point: the tap's CI would fail the same way. The
  version narration makes the cause visible.
- **The `oci` job's copied image comes from the registry, not this run.** It is
  addressed by digest, so its content is exactly what is published, and it
  passes the same acceptance as a fresh build.
- **Version parsing depends on the formula URL shape and the image label.** Both
  are generated by this repository's own tools. An unparseable version fails the
  promotion visibly instead of guessing.
- **A stale branch reset rewrites a branch with no open pull request.** Branches
  named `emit-vX.Y.Z` and `channels/release-vX.Y.Z` belong to the promotion
  tooling, and the reset happens only when no open pull request uses them.

## Migration Plan

Land on `main`, then dispatch `channels.yml` with `tag=v0.2.0` and
`publish=true`. Every job should now succeed:

- `homebrew` reports `[already merged]`.
- `nix-promote` reports `[already merged]`.
- `oci` tests the published `sha256:9e9e01ee…` and reports `[unchanged]`.

That run is the end-to-end acceptance for #155 and #156. #153 is accepted by
the narrated Homebrew version in the same run's `homebrew` job. Rollback is a
revert of the merge; no published artifact changes.
