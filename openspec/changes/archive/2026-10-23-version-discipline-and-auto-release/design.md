# Design

## Context

See `proposal.md` for motivation. The release machinery already exists and stays as it is:

- `VERSION` is the identity source. `Makefile` passes it to the host as `EMIT_VERSION`, and `emit --version` prints `emit <VERSION> (LLVM <LLVM_VERSION_STRING>)`.
- `tools/release-source.sh` rejects a tag that differs from `v<VERSION>` or a missing or empty `CHANGELOG.md` section. Its awk parser looks only for the version's own heading, so other `## ` sections, such as an `Unreleased` one, are ignored.
- The PR `package` job in `compatibility.yml` already runs `release-source.sh` for `v$(< VERSION)` whenever classification marks the change as release infrastructure. `tools/test-classify.py` gives `VERSION` the `release` category.
- `release.yml` (named `Source release`) publishes only on a tag push. `channels.yml` promotes only after a successful `Source release` run whose event was `push`.
- GitHub starts no workflow from a tag pushed with a workflow's own `GITHUB_TOKEN`. The exceptions, `workflow_dispatch` and `repository_dispatch`, cannot satisfy those `push` conditions.
- The REPL banner is a literal string in `emit_repl` in `src/emit.cpp`. Top-level usage comes from `usage(std::ostream&)`. `test/emit-cli-tests.sh` and `test/jit-optimization-tests.sh` grep the banner prefix, and `docs/PROJECTS.md` shows it in an example.
- `CLAUDE.md` is the project instruction file. `AGENTS.md` is a symlink to it.

## Goals / Non-Goals

**Goals:** one place that decides whether a version should be tagged, used by both the PR check and the tagging workflow; no change to the gated release or channel workflows; fail closed when the credential is missing.

**Non-Goals:**
- Automatically merging the Homebrew tap or Nix promotion pull requests.
- Inferring the bump level from commits or labels.
- Enforcing that every code PR bumps the version. The instruction covers that, and CI does not block trivial changes.
- Prerelease or build-metadata versions.
- Changing `emit --version` output.

## Decisions

### 1. Policy lives in `docs/RELEASES.md`, and the obligation in `CLAUDE.md`

`docs/RELEASES.md` stays the policy of record. It gains the feature rule, a bump-level table, the definition of trivial, and the `Unreleased` deferral convention. `CLAUDE.md` gets a short "Versioning and releases" section that states the obligation and points to the policy, so `AGENTS.md` gets it too.

The rules:
- One bump per pull request, at the highest level any part of it warrants.
- A pull request that contains several changes still gets one bump, not one per change.
- "Unless instructed otherwise" means the requester can defer the bump or choose its level. A deferred change goes under `## Unreleased`.

Duplicating the full policy in `CLAUDE.md` would let the two copies drift.

### 2. One decision tool: `tools/release-tag.sh`

`tools/release-tag.sh check [COMMIT]` validates the commit's `VERSION`:
- It is a plain `MAJOR.MINOR.PATCH` SemVer.
- No `v<VERSION>` tag exists.
- It is greater than the highest existing `v*` release tag, compared numerically by component.
- It has a nonempty changelog section, checked by reusing the `release-source.sh` heading rule.

`tools/release-tag.sh plan` reports, on stdout, whether a push should tag (`tag=v0.2.0`) or skip with a reason (already tagged, `VERSION` unchanged). Narration goes to stderr as `docs/OUTPUT.md` requires.

The pull-request policy job runs `check` when classification includes `release`. That catches a stale or colliding version before merge. The tagging workflow runs the same decision again at push time, because the pull-request result may be stale. For example, if two version pull requests are open at once, the second to merge would fail there instead of tagging a version that is no longer the highest.

Alternatives considered: inline workflow shell, which is untestable and duplicated; or extending `tools/ci-policy.py`, which plans job selection and should not reach into tags and the changelog.

### 3. A dedicated `release-tag.yml` pushes the tag with a repository-scoped token

The new workflow:
- **Triggers:** `push` to `main` with a `paths: [VERSION]` filter, plus `workflow_dispatch` to retry tagging the current `main`.
- **Permissions:** the top level is `contents: read`, and no job requests write.
- **Concurrency:** one group, never cancelled.
- **Steps:**
  1. Check out with full history and tags, without persisted credentials.
  2. Check that `RELEASE_TAG_TOKEN` is present.
  3. Prove it can push using an authenticated `git push --dry-run`, rather than the GitHub permissions API, which reports the account's role instead of the token's scope.
  4. Run `tools/release-tag.sh plan`.
  5. Create the annotated tag `v<VERSION>` at `github.sha` and push only that ref, using the token.
- **Actions:** every action is pinned by SHA, like the other workflows.

The tag push is an ordinary `push` event from a non-`GITHUB_TOKEN` credential, so `Source release` runs and publishes. `channels.yml` then promotes through its existing `workflow_run` path. Neither file changes.

Alternatives considered:
- **`GITHUB_TOKEN` plus calling `release.yml` through `workflow_call`.** The caller's event would be `push` to `main`, not a tag. Both the publish condition and channel promotion would need restructuring, and promotion would no longer be keyed to a `Source release` run.
- **`repository_dispatch` or `workflow_dispatch` of `release.yml`.** By design, dispatch can rehearse but cannot publish.
- **A GitHub App installation token.** It's narrower and expires, but it needs an App to be registered and installed. A fine-grained token limited to this repository with Contents read and write matches the existing `HOMEBREW_TAP_TOKEN` approach. Moving to an App later changes only this workflow's credential step.

### 4. One version string for `--version`, help, and the banner

A helper returns `emit <VERSION> (LLVM <LLVM_VERSION_STRING>)`. `emit --version` and the first line of `usage()` both use it, so help and `--version` cannot disagree. The banner reads `Emit <VERSION> (embedded compiler, ORC/LLJIT, LLVM <LLVM_VERSION_STRING>).  ^D to exit.` and stays on stderr at every verbosity.

The tests stop grepping the old literal. They assert the banner and the first help line against `emit --version`, so a future version bump doesn't break them.

### 5. Ship this change as `0.2.0`

This change sets `VERSION` to `0.2.0` and writes a `## 0.2.0` section covering PR #150 and this change. Merging it is the first automatic release. The token secret must exist before the merge. If it doesn't, the tagging run fails visibly, and dispatching `release-tag.yml` after adding the secret tags the same commit.

## Risks / Trade-offs

- **The token can write repository contents.** → Limit it to this repository, use it only in the tag step, and push only the single tag ref. Document rotation in `docs/RELEASE-PIPELINE.md`.
- **A tag whose release fails is left without a public release.** → This matches the existing forward-fix policy. Rerun transient failures on the same tag; fix defects with a later version.
- **Every non-trivial merge costs a full release gate and two channel pull requests.** → Batch related work into one pull request, or defer bumps with `Unreleased`. Channel pull requests stay reviewable by design.
- **Two version pull requests can conflict.** → Push-time `plan` refuses a version that is no longer the highest. The second author rebases and bumps again.
- **A stale pull-request check could pass a version that is no longer valid.** → The tagging workflow is authoritative and re-checks against current tags.
- **Changelog heading formats.** → `check` uses the same heading rule as `release-source.sh` and is tested against both `## X.Y.Z` and `## [X.Y.Z] - date`.

## Migration Plan

1. The maintainer creates the fine-grained token and adds it as the `RELEASE_TAG_TOKEN` repository secret.
2. Merge this change, with `VERSION` set to `0.2.0`.
3. `release-tag.yml` tags `v0.2.0`. `Source release` publishes it, and `channels.yml` opens the Homebrew tap and Nix pull requests and pushes OCI. The maintainer merges the two channel pull requests.

**Rollback:** disable or delete `release-tag.yml`; releases fall back to manual tag pushes, and nothing else depends on it. A published tag is never moved.
