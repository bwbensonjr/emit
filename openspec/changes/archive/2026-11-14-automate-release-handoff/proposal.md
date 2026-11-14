# Proposal

## Why

Everything after a versioned pull request merges is automated (tag, gated source release, channel
rehearsal and promotion), but the two ends of the pipeline are still manual memory work (#178).
Before the merge, a maintainer must remember to sync and archive the OpenSpec change, check the
version and changelog, decide what validation is still owed, commit bootstrap artifacts, and open
an accurate PR. After the merge, the generated Homebrew tap PR and Nix pin PR each wait for a
maintainer merge (the Nix PR's CI also waits for a manual run approval), so a published source
release is not yet a Homebrew or Nix release, and nothing reports the release end to end by its
exact commit and tag. The pipeline should be finished, not replaced.

## What Changes

- Add a documented entry point that finishes a completed versioned change: an agent skill
  (`emit-finish-change`) that does the judgment work (reading tasks against evidence, semantic
  spec sync, archive, PR prose), backed by a deterministic script (`tools/release-handoff.sh`)
  for every mechanical check and GitHub operation.
- `release-handoff.sh preflight` reports, per stage, whether the change can be handed off: base
  freshness, task completion, version advancement against current release tags
  (`tools/release-tag.sh check`), a matching nonempty changelog section, bootstrap and source
  fingerprint obligations, and the validation still owed for the diff as classified by the
  existing test classifier. It never reruns regeneration or suites only because documentation or
  archive metadata changed.
- `release-handoff.sh pr` creates or reuses the change's branch and PR; it never opens a duplicate.
  Preparing a PR never merges it: merging the reviewed versioned PR remains the release approval.
- `release-handoff.sh follow` traces one merged commit through `release-tag.yml`,
  `release.yml`, and `channels.yml` by exact head SHA and tag, never by "latest run", and reports
  the release URL, checksum, each channel's promotion PR and result, and the first failed stage.
- Name the lifecycle stages everywhere they are reported: implementation complete, ready for
  review, merged, tagged, source published, and channel available (per channel). A published
  source release is never reported as an available Homebrew release before the tap formula lands.
- Generated channel promotion PRs merge automatically after verification, the same way for both
  channels. The promoting job checks the release identity, that the PR diff is exactly the
  generated file (`Formula/emit.rb` on the tap, `packaging/release.json` in Emit) with the
  release's URL and checksum, the PR's branch and current head, and that the target repository
  enforces its required check; then it enables GitHub auto-merge pinned to that head. Any failed
  check leaves the PR open for a maintainer and reports why. Hand-written changes to either file
  keep manual review.
- The Nix pin PR is opened by a new dedicated credential, `NIX_PIN_TOKEN` (Emit only, Contents
  and Pull requests), instead of `GITHUB_TOKEN`, so its CI starts without a manual run approval
  and its required check can report. `nix-promote`'s `GITHUB_TOKEN` drops to `contents: read`.
- Establish enforceable merge policy: a ruleset on Emit's `main` requiring `Required validation`,
  and on the tap's `main` requiring a new `Required tap checks` aggregate over its `brew test-bot`
  matrix, both with no bypass actor, and auto-merge allowed in both repositories. A read-only
  `tools/repo-policy.sh check` verifies these settings, so drift is detected rather than assumed.
- Update `docs/RELEASES.md` and `docs/RELEASE-PIPELINE.md` to describe the handoff, the stages,
  the policy, and the token scopes (`HOMEBREW_TAP_TOKEN` gains Pull requests: Read and write;
  `NIX_PIN_TOKEN` is new).

Non-goals: Homebrew bottle publication (a separate follow-up needing a `brew pr-pull` path bound
to tested bottles); automatic merging of any Emit PR other than the verified Nix pin; a separate
GitHub App identity for automation; changes to the tag, source-release, or OCI mechanics.

## Capabilities

### New Capabilities

- `release-handoff`: finishing a completed versioned change into a reviewable PR (preflight
  checks, spec sync and archive in the same PR, idempotent PR management, owed validation) and
  following a merged commit through tag, source release, and channels with stage-specific status.

### Modified Capabilities

- `distribution`: adds verified automatic merging of generated Homebrew tap and Nix pin promotion
  PRs and the enforced merge policy it depends on.

## Impact

- New: `.claude/skills/emit-finish-change/SKILL.md`, `tools/release-handoff.sh`,
  `tools/repo-policy.sh`, tests `test/release-handoff-tests.sh` using the existing
  `test/release-gh-mock.sh` and `test/channel-gh-mock.sh` mocks.
- Changed: `tools/channel-promote.sh` (new `tap-merge` and `flake-merge` operations sharing one
  verification routine), `.github/workflows/channels.yml` (homebrew and nix-promote jobs enable
  verified auto-merge; nix-promote switches to `NIX_PIN_TOKEN`), `test/channel-promote-tests.sh`,
  `test/ci-policy-tests.py`, `tools/test-registry.json`, release documentation.
- Other repository: `bwbensonjr/homebrew-emit` gains a `Required tap checks` job, a `main`
  ruleset, and auto-merge enabled. Emit gains a `main` ruleset and auto-merge enabled. These are
  settings changes made by a maintainer and verified by `repo-policy.sh`.
- Credentials: `HOMEBREW_TAP_TOKEN` needs Pull requests: Read and write in addition to Contents.
  New secret `NIX_PIN_TOKEN`: fine-grained, `bwbensonjr/emit` only, Contents and Pull requests
  Read and write. `RELEASE_TAG_TOKEN` is unchanged.
- Emergencies: with no bypass actor, a direct push to `main` requires an admin to disable the
  ruleset temporarily, a deliberate and audit-logged step.
- Versioning: expected trivial (no `VERSION` bump). It changes CI, release tooling, and docs, but
  not `emit`'s behavior, the installed payload, or how a source archive builds; confirm when the
  implementation PR is assembled.
