# Proposal

## Why

The v0.2.0 release was the first to exercise channel promotion end to end, and it
exposed three defects in the channels workflow:

- The Homebrew rehearsal approved a formula that the tap's own CI rejected (#153).
- Retrying a channel failed in the two cases a retry is most likely to meet:
  - `nix-promote` failed when its pull request had already merged (#155).
  - `oci` failed whenever the version tag already existed (#156).

`docs/RELEASE-PIPELINE.md` says a failed channel is retried by dispatching the
same tag with `publish` on, and that channels which already promoted see their
own results unchanged. Today a retry can't succeed unless every channel was
still unpromoted.

## What Changes

- **Homebrew rehearsal uses current Homebrew.** The `homebrew` job updates
  Homebrew before rendering, linting, and installing, and narrates the version it
  ran. Its `brew style` and `brew audit --strict` then apply the same rules as the
  tap's `brew test-bot` (#153).
- **A promotion already merged counts as success.** When the base branch of the
  tap or this repository already carries the identical file, the promotion reports
  `[already merged]` and opens no pull request. Today it tries to open an empty
  one (#155). This covers both the Homebrew and the Nix promotion.
- **A published OCI version is re-tested, not rebuilt.** When
  `ghcr.io/bwbensonjr/emit:<version>` already exists, the `oci` job copies that
  digest from the registry and runs the full acceptance against it. A promotion
  then finds the tag already at the tested digest. The job builds the image only
  when no version tag exists yet. "Promote exactly what was tested" keeps holding,
  without depending on a reproducible image build (#156).
- **Moving pointers never move backward.** A retry or rehearsal of an older
  release does not re-point `latest`, and opens no tap or Nix pull request that
  would downgrade a newer pinned version; each case is narrated as
  `[superseded]`. Immutable version tags are unaffected, and the explicit
  `oci-latest` rollback still moves `latest` to any validated digest. This is a
  pre-existing hole in the same retry path, included so that "retry with the same
  tag" is safe for any tag.
- `docs/RELEASE-PIPELINE.md`'s retry and rollback text describes the new
  behavior.
- No `VERSION` bump. The change touches CI configuration, channel tooling,
  tests, and documentation. Shipped behavior, the installed payload, and the
  source-release build are unchanged.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `distribution`: three added requirements, placed beside "Channel publication
  promotes tested candidates with recoverable updates", which stays unchanged:
  - retries succeed for channels that already promoted;
  - promotion never moves a channel to an older release;
  - the Homebrew rehearsal applies current Homebrew rules.

## Impact

- `.github/workflows/channels.yml`:
  - `homebrew` job: a Homebrew update step and version narration.
  - `oci` job: resolve the published version, then either copy that digest or
    build.
- `tools/channel-promote.sh`:
  - `open_pull_request`: the merged and superseded checks.
  - `oci`: the `latest` ordering check.
- `test/channel-promote-tests.sh`: new fixture cases for a merged promotion, a
  superseded promotion, and an older version's retry leaving `latest` unchanged.
- `test/ci-policy-tests.py`: pins the Homebrew update ordering and the OCI
  resolve-or-build structure.
- `docs/RELEASE-PIPELINE.md`: the Distribution channels section.
- Closes #153, #155, #156. No compiler, runtime, or installed-payload changes;
  no `make regen`.
