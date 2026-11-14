# Design

## Context

The post-merge pipeline is described in `docs/RELEASE-PIPELINE.md` and pinned by
`test/ci-policy-tests.py`: `release-tag.yml` (push to `main` touching `VERSION`) creates
`v<VERSION>` with `RELEASE_TAG_TOKEN`; the tag push starts `release.yml`; its successful run
starts `channels.yml`, whose `homebrew` job renders `packaging/homebrew/emit.rb.in`, accepts it,
and calls `tools/channel-promote.sh tap`, which opens or reuses the tap pull request on branch
`emit-<tag>` with `HOMEBREW_TAP_TOKEN`. `nix-promote` opens `channels/release-<tag>` in Emit with
`GITHUB_TOKEN`; OCI pushes digests.

Observed on 2026-11-10: `allow_auto_merge` is false in both repositories; neither has a ruleset or
branch protection; the tap's only workflow is `tests.yml` (`brew test-bot`, matrix
`macos-26` and `ubuntu-latest`, jobs named `test-bot (<os>)`), with no aggregate job. Emit's
compatibility workflow already ends in a `Required validation` aggregate. `tools/test-classify.py`
already treats `openspec/**/*.md` and `openspec/changes/**/.openspec.yaml` as documentation, so
a sync-and-archive commit alone classifies as lightweight. Both release tokens are fine-grained
PATs belonging to the maintainer's account, so pull requests they open are authored by the same
account a maintainer uses by hand, and any ruleset bypass granted to the maintainer is also
granted to them. The Nix pin PR is opened with `GITHUB_TOKEN`; GitHub starts no `pull_request`
workflow for it without a maintainer approving the run, so its required check never reports on
its own.

Recorded traps that shape the design: `.permissions.push` reports the account's role, not a
fine-grained token's scope, so credential checks must exercise the operation; "does not close #N"
in a PR body still closes #N; `openspec archive` re-applies deltas unless given `--skip-specs`
after a manual sync; a MODIFIED delta must be diffed against the live main spec.

## Goals / Non-Goals

**Goals:**
- Judgment (is the work actually done, how do deltas merge, what does the PR say) stays with the
  agent; everything checkable or mutating on GitHub is a deterministic, testable script.
- Every script narrates per `docs/OUTPUT.md`, prints machine-readable `key=value` results on
  stdout, and is safe to rerun.
- Homebrew and Nix promotions behave the same: one verification routine, one policy check, one
  set of status words.
- Automatic promotion merge fails closed: any doubt leaves today's behavior (an open PR for a
  human).

**Non-Goals:**
- No new release system or workflow trigger. Tag, source-release, and OCI mechanics are
  unchanged; the only new credential is `NIX_PIN_TOKEN` (D7).
- No automatic merge of any Emit pull request other than a verified Nix pin.
- No GitHub App or machine-user identity for automation; that would let the maintainer keep a
  ruleset bypass the automation lacks, and is a possible follow-up.
- No bottles.

## Decisions

### D1. Skill for judgment, script for mechanics

The entry point is an agent skill, `.claude/skills/emit-finish-change/SKILL.md`, alongside the
OpenSpec skills. It drives `tools/release-handoff.sh` and performs the steps a script cannot do
correctly: reading tasks against code and evidence, semantic delta sync (following the existing
`openspec-sync-specs` skill, then `openspec archive --skip-specs`), and writing PR prose.
Alternative rejected: one shell script that runs `openspec archive` directly. Archive would
re-apply deltas mechanically, which is exactly the silent-truncation and dropped-scenario failure
the project has already hit; and checkboxes are not acceptance.

### D2. `tools/release-handoff.sh` subcommands

- `preflight CHANGE [--base REF]`: one line per stage, `stage=<name> status=<ok|fail|owed>` with
  a reason. Stages: `base` (branch contains current `origin/main`), `tasks` (no unchecked boxes in
  `tasks.md`), `specs` (`openspec validate CHANGE --strict`, plus a scenario-and-prose diff of each
  MODIFIED requirement against the live main spec), `version` (`tools/release-tag.sh check HEAD`
  after fetching tags; skipped with `status=ok reason=trivial` when `VERSION` is unchanged and the
  classifier says trivial, `fail` when it is unchanged but the diff is non-trivial and no
  `Unreleased` entry exists), `bootstrap` (when a compiler input from
  `tools/compiler-inputs.sh --list` changed: `python3 tools/source-fingerprint.py --status` must
  match), and `validation` (D3). Exit nonzero on any `fail`.
- `pr CHANGE [--draft|--ready] --body-file F`: finds the open PR by head branch; creates it only
  if none exists, otherwise edits title and body. `--ready` refuses unless the archive directory
  exists on the branch and `openspec/changes/CHANGE` does not.
- `status [PR]`: required-check state for the PR head (`Required validation`), with run links.
- `follow SHA`: see D5.

The script never merges; merging is only reachable by the maintainer (or the agent on explicit
instruction) running `gh pr merge --merge`, matching the repository's merge-commit convention.

### D3. Owed validation is computed, not rerun

`preflight` runs the existing classifier against the base (`tools/test.sh dev --changed BASE`
plan mode and `tools/test-classify.py`) and reports the owed profile. Evidence it accepts: a
matching source fingerprint for compiler inputs, and a successful `Required validation` on the
PR's current head as the evidence of record. When the only commits after the last validated
commit are classified as documentation (the sync-and-archive commit), the earlier result stands
and nothing is rerun locally. CI still validates the PR as a whole; the rule constrains the agent,
not CI. Alternative rejected: storing a bespoke local evidence ledger. The fingerprint and CI
already bind results to inputs.

### D4. Verified auto-merge for generated promotion PRs

`channel-promote.sh` gains one shared routine, `merge_generated REPO BRANCH PATH SOURCE HEAD`,
exposed as two operations that mirror the existing `tap` and `flake`:

| Operation | Job | Repository | Branch | File | Expected bytes |
| --- | --- | --- | --- | --- | --- |
| `tap-merge TAG FORMULA IDENTITY HEAD` | `homebrew` | `bwbensonjr/homebrew-emit` | `emit-<tag>` | `Formula/emit.rb` | the rendered formula, whose `url`/`sha256` must also equal the identity |
| `flake-merge TAG IDENTITY HEAD` | `nix-promote` | `bwbensonjr/emit` | `channels/release-<tag>` | `packaging/release.json` | the `identity.json` both Nix systems accepted, whose `tag` must equal TAG |

The routine:

1. Resolves the open PR for the head branch; if none is open and the target's `main` already has
   the identical file, reports `[already merged]` and exits 0.
2. Checks the target's policy (D6). On failure: report `[manual merge: <reason>]`, exit 0 (the
   source release and other channels are unaffected; the report shows that channel pending).
3. Verifies the PR: base `main`; changed files exactly PATH; the file at the PR head is
   byte-identical to SOURCE; the head SHA equals HEAD, the commit `tap` or `flake` produced or
   reused in this job (printed as `head=<sha>` and passed through a step output, never re-read as
   "latest").
4. If auto-merge is already enabled for that head, reports `[auto-merge pending]`; otherwise runs
   `gh pr merge --auto --merge --match-head-commit <sha>`.

Any verification mismatch exits 0 with `[manual merge: <mismatch>]` and a job summary warning:
a non-generated diff is a maintainer's concern, not a failed release. GitHub's native auto-merge
then waits for the target's required check, so no job sits polling.
Alternative rejected: polling checks from the channel job and merging directly. It holds a runner
for the target's CI time and duplicates what the ruleset enforces.

Trust rests on content, not authorship: because both promotion tokens are the maintainer's own
PATs, a hand-written PR and a generated one share an author. Only the generated path ever requests
auto-merge, and only for a head whose bytes it verified, so manual PRs keep review by default.

A merged Nix pin changes `packaging/release.json` on Emit's `main` but not `VERSION`, so it starts
no release.

### D5. Following a release by identity

`follow SHA` resolves each stage from the commit, never from recency:

| Stage | Lookup |
| --- | --- |
| tagged | `release-tag.yml` run with `head_sha=SHA`; then `git ls-remote` for `v<VERSION at SHA>` pointing at SHA |
| source published | `release.yml` run with `head_sha=SHA`, event `push`, ref the tag; `gh release view <tag>` assets and `SHA256SUMS` |
| channels | `channels.yml` run with event `workflow_run` and `head_sha=SHA`; job conclusions and artifacts |
| Homebrew available | tap `main` `Formula/emit.rb` names the release URL and digest; else the `emit-<tag>` PR state |
| Nix available | Emit `main` `packaging/release.json` names the tag; else the `channels/release-<tag>` PR state |
| OCI available | `ghcr.io/bwbensonjr/emit:<version>` digest from the `channel-oci` artifact |

The first non-success stage is reported with its run URL and remedy from
`RELEASE-PIPELINE.md` (rerun on the same tag, dispatch channels with `publish`, or fix forward),
and later stages print `blocked`. `--wait` polls with backoff until a terminal state; without it,
one snapshot. The final report carries the stable identity list from the spec.

### D6. Merge policy as maintained settings, verified by `tools/repo-policy.sh`

- Tap: add a `Required tap checks` job to `tests.yml` (`needs: test-bot`, `if: always()`, fails
  unless every matrix leg succeeded), enable `allow_auto_merge`, and add a `main` ruleset requiring
  that check with no approval count (a single maintainer cannot approve their own PRs).
  Delivered as a reviewed PR on the tap plus documented `gh api` settings.
- Emit: enable `allow_auto_merge` and add a `main` ruleset requiring `Required validation`, also
  with no approval count.
- **No bypass actor on either ruleset.** Bypass is granted per GitHub identity, and both promotion
  tokens act as the maintainer, so a maintainer bypass would also exempt the automation: a bug or
  leaked token could push to `main` or force-merge past the check, and auto-merge requested by a
  bypass actor might not wait for the check at all. An emergency direct push instead means an
  admin disables the ruleset, pushes, and re-enables it, which is deliberate and audit-logged.
  Alternative rejected for now: keep the maintainer bypass and move automation to a GitHub App
  identity (see Non-Goals).
- `tools/repo-policy.sh check [--repo R]` reads rulesets and repository settings with `gh api` and
  prints one `policy=<name> status=<ok|fail>` line per setting: auto-merge allowed, the required
  check present, and an empty bypass list. `tap-merge` and `flake-merge` call the subset for their
  target.
- Credential preflights exercise the operations themselves (per the recorded trap): an
  authenticated `git push --dry-run` and a pull-request read with the token. The homebrew job
  extends its existing preflight; the `nix` job gains a publish-gated first step for
  `NIX_PIN_TOKEN`, so a bad token fails before either Nix system builds.

### D7. A dedicated `NIX_PIN_TOKEN` for the Nix promotion

`nix-promote` switches from `GITHUB_TOKEN` to a new secret, `NIX_PIN_TOKEN`: a fine-grained PAT
limited to `bwbensonjr/emit` with Contents and Pull requests Read and write. A PR it opens starts
Emit's compatibility workflow normally, so `Required validation` reports without the run approval
the `github-actions` PRs need today, and auto-merge can complete. `nix-promote`'s `GITHUB_TOKEN`
drops to `contents: read`; `test/ci-policy-tests.py` then pins that no channels job holds
`contents: write` or `pull-requests: write`, and that `NIX_PIN_TOKEN` reaches only publish-gated
steps.
Alternative rejected: widening `RELEASE_TAG_TOKEN` with Pull requests permission. That token is
deliberately Contents-only for tag pushes; one token per purpose keeps each rotation and each
leak's blast radius small.

### D8. Versioning of this change

This change edits CI, release tooling, docs, and a skill; it does not change `emit`, the installed
payload, or the archive build, so it is trivial under `docs/RELEASES.md` and takes no `VERSION`
bump. Its first end-to-end exercise is therefore the next versioned change, which is the intended
acceptance run.

## Risks / Trade-offs

- [A compromised or buggy promotion could auto-merge a bad formula or pin] → Both files are
  generated from a release that passed every gate and the channel's own acceptance; the PR bytes
  are compared to them; the target's own CI must pass; rollback is reverting the merge commit.
- [Ruleset drift silently disables safety] → The merge operations check policy every time,
  including an empty bypass list, and fail closed to manual merge; `repo-policy.sh` is part of
  the handoff preflight's report.
- [Emit's `main` ruleset blocks a needed direct push] → Deliberate: an admin disables the ruleset
  for the push and re-enables it. The tag workflow pushes tags only, which the branch ruleset
  does not cover, so releases are unaffected.
- [`NIX_PIN_TOKEN` could merge an arbitrary Emit PR] → It can only request auto-merge, which still
  waits for `Required validation` with no bypass; the code path requests it only for a verified
  pin. Its expiry is documented with the other tokens' rotation steps.
- [Nix pin PRs now run the full compatibility workflow] → They already did once approved; the
  difference is that they start without a person.
- [Tap CI matrix renamed upstream by `brew tap-new` templates] → The aggregate job is the only
  required name, so leg renames do not break the ruleset.
- [Follow misattributes a rerun] → Lookups filter by head SHA and event; reruns keep the same run
  id and report the latest attempt.
- [Testing against real GitHub could publish] → All tests use `test/release-gh-mock.sh` and
  `test/channel-gh-mock.sh` with local bare repositories; no test holds a real token.

## Migration Plan

1. Land the tap's aggregate job PR; confirm its check reports on a tap PR.
2. Create `NIX_PIN_TOKEN` and rotate `HOMEBREW_TAP_TOKEN` with Pull requests: Read and write,
   before merging step 3, because the `nix` job's new preflight fails a publishing run without
   `NIX_PIN_TOKEN`.
3. Merge this change's Emit PR (no release). The merge operations report
   `[manual merge: <policy>]` until step 4.
4. Apply both rulesets (no bypass actor) and `allow_auto_merge` in both repositories; run
   `tools/repo-policy.sh check`.
5. The next versioned change is finished with the skill and followed to Homebrew and Nix
   availability.

Rollback: disable auto-merge in a repository (or delete its ruleset); that channel's merge
operation then falls back to manual merge with no code change. Reverting `nix-promote` to
`GITHUB_TOKEN` restores the old approval-gated Nix PRs.

## Open Questions

- Whether the tap's allowed merge methods include merge commits; if only squash is allowed,
  `tap-merge` uses the allowed method. This does not change verification. (Emit uses merge
  commits.)
