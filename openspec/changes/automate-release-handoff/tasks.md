# Tasks

## 1. Repository policy check

- [x] 1.1 Add `tools/repo-policy.sh check [--repo R]` (design D6): read `allow_auto_merge`, the `main` rulesets, their required status checks, and their bypass actors with `gh api`; print one `policy=<name> status=<ok|fail> reason=...` line per setting on stdout, narration on stderr per `docs/OUTPUT.md`; exit nonzero on any `fail`. Know the expected check per repository (`Required validation` for Emit, `Required tap checks` for the tap). Verify with a new `test/repo-policy-tests.sh` against a `gh` mock covering intact policy, auto-merge disabled, missing ruleset, a ruleset that requires a different check name, and a ruleset with a bypass actor.
- [x] 1.2 Register `test/repo-policy-tests.sh` in the lightweight policy job of `compatibility.yml`, beside `test/release-tag-tests.sh`, and verify it runs there. (Not `tools/test-registry.json`: its suites are native-profile groups with coverage pins, and the release-tooling tests have always run in the policy job.)

## 2. Verified promotion auto-merge

- [x] 2.1 Make `tools/channel-promote.sh tap` and `flake` print the promoted head as `head=<sha>` on stdout (pushed or reused commit), and verify `test/channel-merge-tests.sh` asserts it for new, reused, and already-current branches of both.
- [x] 2.2 Add the shared `merge_generated` routine and the `tap-merge TAG FORMULA IDENTITY HEAD` and `flake-merge TAG IDENTITY HEAD` operations (design D4): already-merged short circuit, the target's policy subset from 1.1, PR verification (base, sole changed file, byte-identical to the generated file, formula URL and SHA-256 or pin tag against the identity, head equals HEAD), idempotent `gh pr merge --auto --merge --match-head-commit`. Mismatches and missing policy exit 0 with a `[manual merge: <reason>]` line. Verify in a new registry-free `test/channel-merge-tests.sh` (run by the channels identity job and the policy job; `test/channel-promote-tests.sh` needs a registry) with `test/gh-fixture-mock.sh`, for each operation: a verified PR requests auto-merge once; a rerun reports `[auto-merge pending]`; merged reports `[already merged]`; an extra file, an edited file, a wrong digest or tag, a moved head, disabled auto-merge, a missing ruleset, and a bypass actor each yield manual merge and no merge request.
- [x] 2.3 Wire `tap-merge` into the `homebrew` job of `.github/workflows/channels.yml` after `tap`, publish-gated, passing `head` through a step output; extend its credential preflight with a pull-request read using `HOMEBREW_TAP_TOKEN`. Verify a PR rehearsal run skips both publish-gated steps.
- [x] 2.4 Switch `nix-promote` to `NIX_PIN_TOKEN` (design D7) for `flake` and a following publish-gated `flake-merge`, and drop its `GITHUB_TOKEN` permissions to `contents: read`; add a publish-gated first step in the `nix` job that checks `NIX_PIN_TOKEN` with an authenticated `git push --dry-run` and a pull-request read, naming the secret on failure. Verify a PR rehearsal run skips the preflight and promotion.
- [x] 2.5 Extend `test/ci-policy-tests.py` to pin: `HOMEBREW_TAP_TOKEN` and `NIX_PIN_TOKEN` reach only publish-gated steps; `tap-merge` and `flake-merge` run only when `publish == 'true'`; no channels job holds `contents: write` or `pull-requests: write`. Verify `python3 test/ci-policy-tests.py` passes and fails on a mutated workflow that restores `nix-promote`'s write permissions.
- [x] 2.6 Update `docs/RELEASE-PIPELINE.md` (Distribution channels: promotion, permissions, retry, rollback) to describe verified auto-merge for both channels, manual-merge fallbacks, the end of the Nix run-approval step, the tap token's added Pull requests permission, and `NIX_PIN_TOKEN` with create and rotate steps modeled on `RELEASE_TAG_TOKEN`'s; replace "Both pull requests are reviewed and merged by a maintainer". Verify every `[...]` status word in the doc matches the script's output.

## 3. Handoff preflight

- [x] 3.1 Add `tools/release-handoff.sh preflight CHANGE [--base REF]` with the stages of design D2 (`base`, `tasks`, `specs`, `version`, `bootstrap`, `validation`), each printing `stage=<name> status=<ok|fail|owed> reason=...`, reusing `tools/release-tag.sh check`, `tools/compiler-inputs.sh --list`, `tools/source-fingerprint.py --status`, and `tools/test-classify.py` rather than reimplementing them. With no CHANGE, list active changes and exit 2 without writing. Verify with `test/release-handoff-tests.sh` using temporary repositories: unchecked tasks fail `tasks`; a concurrent higher tag fails `version` naming it; an unchanged `VERSION` with a non-trivial diff and no `Unreleased` entry fails; a stale fingerprint after a compiler-input change fails `bootstrap`; an `openspec`-only commit after validation reports nothing owed.
- [x] 3.2 Implement the `specs` stage's MODIFIED check: for each MODIFIED requirement, list scenario titles and prose paragraphs present in the live main spec but absent from the delta, and fail naming them. Verify with a fixture delta that drops one scenario from a main requirement.
- [x] 3.3 Register `test/release-handoff-tests.sh` in the lightweight policy job (see 1.2); verify it runs with no network and no real token.

## 4. Handoff pull request and status

- [x] 4.1 Add `release-handoff.sh pr CHANGE [--draft|--ready] --body-file F` and `status [PR]` (design D2): find by head branch, create only when absent, edit otherwise; `--ready` refuses until the archive exists on the branch and the active change directory is gone; `status` reports `Required validation` for the current head with run links and never merges. Verify in `test/release-handoff-tests.sh` with `test/release-gh-mock.sh`: a second `pr` edits rather than creates; `--ready` before archive fails at stage `archive`; failing and passing checks are reported as such; no mock `merge` call is ever made.
- [x] 4.2 Add a PR body template section to the skill (4.3) that uses `Refs #N` or `Fixes #N` deliberately and avoids negated closing keywords; verify by rendering the template for a fixture change and grepping for `close #`, `closes #`, `fix #` outside a `Fixes`/`Closes` line.
- [x] 4.3 Add `.claude/skills/emit-finish-change/SKILL.md` (design D1): select the change explicitly; run `preflight` and stop on `fail`; judge task completion against code and evidence; sync deltas per the `openspec-sync-specs` skill, run `openspec validate --all` and the stray-delta-header grep on main specs, then `openspec archive CHANGE --skip-specs`; commit the full intended diff including bootstrap when owed; run `pr`; report `status` and the merge action without merging. Verify by a dry walkthrough on a fixture change in a scratch clone, recording the commands issued.

## 5. Following a release

- [x] 5.1 Add `release-handoff.sh follow SHA [--wait]` (design D5): resolve tagging, source-release, channels, and per-channel availability by head SHA and tag; print one `stage=` line per lifecycle stage with `ok|pending|failed|blocked`, the first failure's run URL and remedy, and the final identity list (archive, PR, commit, tag, release URL, SHA-256, tap and Nix PRs, OCI digest). Verify in `test/release-handoff-tests.sh` with the mocks: a full success; newer unrelated runs on `main` are ignored; a failed source release marks channels `blocked`; an open tap PR reports Homebrew `pending` while source is `ok`; a merged tap formula reports Homebrew `ok`.

## 6. Documentation

- [x] 6.1 Update `docs/RELEASES.md` and `docs/RELEASE-PIPELINE.md` with the handoff entry point, the lifecycle stage vocabulary, the rulesets (no bypass actor, and the disable-push-re-enable emergency procedure) and auto-merge settings with the `gh api` commands to apply them, and `tools/repo-policy.sh`. Verify the documented commands match each script's `--help`.
- [x] 6.2 Add a pointer to the skill in `CLAUDE.md` under "Versioning and releases"; verify `AGENTS.md` shows it.

## 7. Tap repository and settings

- [x] 7.1 Open a PR on `bwbensonjr/homebrew-emit` adding the `Required tap checks` aggregate job to `.github/workflows/tests.yml` (`needs: test-bot`, `if: always()`, fails unless every leg succeeded); verify the check appears on that PR and fails when a leg is forced to fail in a scratch branch.
- [x] 7.2 With the maintainer, before merging this change's Emit PR (design Migration Plan step 2): create `NIX_PIN_TOKEN` (fine-grained, `bwbensonjr/emit` only, Contents and Pull requests Read and write) and rotate `HOMEBREW_TAP_TOKEN` with Pull requests: Read and write. Verify both names appear in `gh secret list --repo bwbensonjr/emit`. (HOMEBREW_TAP_TOKEN already had Pull requests: Read and write, since it already opens the tap PR; no rotation was needed.)

The post-merge settings step (auto-merge, `main` rulesets with no bypass actor, `tools/repo-policy.sh check`) is rollout, not implementation, and is tracked on #178 so this change can archive in its own pull request.

## 8. Integration

- [x] 8.1 Run `python3 test/ci-policy-tests.py`, `test/channel-promote-tests.sh`, `test/release-handoff-tests.sh`, `test/repo-policy-tests.sh`, `openspec validate --all --strict`, and `make format-check`; confirm no compiler input changed, so no `make regen` is owed. Record results in the PR.

The post-merge rehearsal (`channels.yml` with `publish=false`, then `release-handoff.sh follow` against the latest release) is likewise tracked on #178.

## Workflow follow-up

- Finish the next versioned change with `emit-finish-change` and follow it to Homebrew and Nix availability as the end-to-end acceptance run; confirm its Nix pin PR started CI without a run approval and merged on its own.
- File a follow-up issue for a GitHub App identity for automation, which would let the maintainer keep a ruleset bypass the automation lacks.
- Archive this change after review; it takes no `VERSION` bump (design D8).
