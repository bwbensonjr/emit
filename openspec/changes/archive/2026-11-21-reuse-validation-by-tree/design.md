# Design

## Context

See proposal.md (Why) for the measured 0.11.0 cycle. These are the parts of the current pipeline the design depends on:

- `compatibility.yml` runs on `pull_request`, on push to `main`, weekly, on dispatch, and through `workflow_call` from `release.yml` for `v*` tags. Its `policy` job classifies the diff (`tools/test.sh --classify`) and turns that into a plan (`tools/ci-policy.py plan`). The plan gates `prepare`, `native`, `verification`, `package`, and `archive`. `Required validation` aggregates the jobs the plan names, and it is the only status check the `main` ruleset requires (`strict_required_status_checks_policy: false`).
- No checkout step sets `ref:`, so every job in a run tests `github.sha`. For `pull_request` that is GitHub's synthetic merge commit, not the PR head. The tree a PR run validated is therefore the merge ref's tree. With 0.11.0 it was also the head tree, because the branch contained `main`.
- The plan is uploaded as the `validation-plan` artifact (`plan.json`, `classification.json`), with the default 90-day retention.
- `archive` needs `prepare`: it downloads the toolchain bundle that `prepare` resolves. Resolving an approved bundle takes under a minute.
- `tools/test-classify.py` sets `code = not docs_only`. Packaging-only diffs therefore get `code: true` even though the classifier gives them no source, unit, or archive obligation (the comment at line 47 says so).
- Prior decisions this design refines, in `2026-10-19-streamline-build-and-test/design.md`:
  - line 27: "no reuse of another commit's native correctness result as a release result";
  - line 95: "Main ... validate[s] the actual merged tree ... do not silently reuse pre-merge results. Tag gates validate the actual tagged source even if its parent already passed."
  
  Both were about validating source other than what ships. Reuse here requires the identical tree, and it is never silent.

## Goals / Non-Goals

**Goals:**
- A merge commit or a tag whose tree has already been validated by a sufficient run executes no native or verification jobs.
- Release-only coverage runs before merge.
- Packaging-only diffs provision no toolchain.
- Every fallback is to today's behavior, never to a skip.

**Non-Goals:**
- Reusing results across different trees, for example when `main` moved after the PR ran. Turning on strict up-to-date checks in the ruleset would make that rare, but that is a policy choice outside this change.
- Changing the weekly scheduled run or `workflow_dispatch` rehearsals. Both still execute everything; a dispatch is how the complete gate is rehearsed on purpose.
- Making the channel rehearsal a required check. Today it is not required for packaging pull requests either, so (C) does not weaken merge gating. Promotion pull requests are opened only after their channel already passed acceptance.
- Changing the channel workflows, `release-tag.yml`, or `tools/release-handoff.sh`.

## Decisions

### D1. Record the tested tree in the plan, and compare against that

`policy` records `tree` (`git rev-parse HEAD^{tree}` after checkout) and `sha` in `plan.json`. Reuse compares the current run's tree with the candidate plan's recorded `tree`, not with the PR head's tree. That is the tree the candidate's jobs actually built and tested. Plans without a `tree` field, including every run made before this change, are never reused.

Rejected alternative: comparing against the PR head tree from the API. A head that lags `main` has a different tree from the merge ref that was tested, so the comparison would prove nothing about the tested tree.

### D2. One reuse tool, run in the `policy` job

The new `tools/ci-reuse.py` takes the current plan and returns it either unchanged or with a `reused` block. It needs only `GH_TOKEN` (`contents: read`, `actions: read`, `pull-requests: read`), and narrates every step on stderr per `docs/OUTPUT.md`. Lookup:

1. Only on `push` to `main` and on `tag` events; other events return the plan unchanged.
2. `GET commits/{sha}/pulls` gives the pull requests associated with the commit.
3. For each one, list `compatibility.yml` runs with `event=pull_request` and `head_sha=<PR head>`, newest first. Keep only runs that concluded `success`, came from this repository (not a fork), and whose `Required validation` job succeeded.
4. Download each kept run's `validation-plan` artifact and accept the first plan that:
   - records the same `tree`;
   - has no `reused` block (no chained reuse);
   - covers the current plan (D3).
5. Any API error, missing artifact, or parse failure returns the plan unchanged, with the reason narrated.

Rejected alternative: making the main-push trigger conditional, or dropping it. With non-strict checks the merge tree can differ from the tested tree, and then the push run is the only validation of what landed.

### D3. Sufficiency is monotone over plan fields

A candidate covers a plan when each of `code`, `source`, `units`, `verification`, `archive`, and `reference_full` is true in the candidate wherever it is true in the current plan, the candidate's `reference` list contains the current one, and the candidate's `mode` is `full` whenever the current plan's is. A tag plan is comprehensive, so only a `full`-mode, archive-rehearsing PR run (D4) can cover it. A main-push plan needs only the normal code gates.

### D4. A `VERSION`-changing PR is planned like a tag

`ci-policy.py plan` treats `pull_request` with the `release` category as comprehensive. That gives `mode: full` (all four full cells), `reference_full`, and `archive`; `archive` already follows from `VERSION`. The policy job's `release` category check already exists for `release-tag.sh check`.

This applies whether or not the PR is a draft. `tools/release-handoff.sh` opens versioned PRs as drafts and uses the draft's run as its validation evidence, then marks the PR ready. Marking ready starts no new run (`ready_for_review` is not a trigger), so a draft-only rule would cost a second, full run per release.

Rejected alternative: full mode only once a PR leaves draft. That is what the earlier review suggested, but in the handoff flow it means paying a normal run plus a full run instead of one full run.

### D5. Skip execution jobs, but keep the tag's packaging

When `reused` is present, the plan sets `execute: false` and rewrites `required` to `policy` plus, if `archive` is set, `prepare`, `package`, and `archive`. In `compatibility.yml`:
- `native` and `verification` add `needs.policy.outputs.execute == 'true'` to their conditions.
- `prepare` runs when `(code && execute) || archive`.

The tag run therefore still packages the archive itself, checks reproducibility, and builds it offline on both systems (the spec requires that). `release.yml` publishes the bytes its own `package` job produced, unchanged.

### D6. Toolchain-recipe changes are never reused

The classifier gains a `toolchain` flag, set when a path is an input of trusted dependency preparation: the `paths` list of `dependency-preparation.yml`, kept equal to it by a contract test. A plan with `toolchain: true` is never reused. A PR that changes a recipe may have run on a candidate-built toolchain, and a release must run on trusted bundles.

### D7. Packaging-only diffs are not code

In `classify_paths`, `code` becomes false when the categories are a subset of `{documentation, packaging}`. `docs_only` keeps its meaning. `ci-policy.py plan` then sets `code` false, `required` becomes `["policy"]`, and `channels` stays true. A packaging-only plan on a tag cannot occur in practice; tag and dispatch events stay comprehensive in any case.

### D8. Aggregation reports reuse

`ci-policy.py aggregate` prints, on success with `reused`, one line in this form:

```
ci: required gates satisfied by reuse  [run <url>; sha <short>; tree <short>; mode <mode>]
```

The reusing run's `validation-plan` artifact includes the `reused` block, so its evidence chain stays inspectable after the fact.

## Risks / Trade-offs

- **[Flaky failures hidden by a lucky pass]** Today the PR, push, and tag runs each give a flaky suite another chance to show. → The weekly full run still runs. A flaky suite should be fixed, not caught by repetition. The fallback keeps full execution whenever trees differ.
- **[Runner image drift between PR and tag]** A run that passes on the PR's runner image could fail on a newer image at the tag. → The weekly run catches drift. Release time is when the tested bytes matter, and those are what the PR validated.
- **[A PR run's artifact is PR-controlled]** A same-repository PR run's workflow code comes from the PR. → Tree identity means that code is the code being merged. Forks are excluded (D2). Only collaborators with write access create same-repository PRs.
- **[Higher cost per release PR push]** A `full` run costs about 175 runner-minutes versus about 103. → One release PR usually gets few pushes, superseded runs are cancelled, and `VERSION` is normally bumped while finishing a change, so earlier pushes on the branch stay on the normal plan.
- **[Artifact expiry]** A tag cut more than 90 days after its PR ran finds no plan. → It falls back to full execution.
- **[Weaker evidence on `main`]** The `main` branch's own push run no longer re-executes. → It names the run that did. `follow` and `preflight` read `Required validation`, which still reports success with that evidence.

## Migration Plan

1. Land the classifier change (D6, D7) and policy changes (D3–D5, D8) with fixture tests, and the tree-recording plan (D1). Runs recorded before this land have no `tree`, so the first push to `main` after landing executes as today.
2. Land `tools/ci-reuse.py` behind its own fixtures, plus a `--dry-run --sha SHA` mode for local inspection with `gh`.
3. Confirm on this change's own pull request: the run records `tree`, and a local dry run against the PR's merge ref finds the PR's own run as an eligible candidate.
4. The first merge after landing exercises main-push reuse. The next release exercises tag reuse; `follow` and the `Source release` log show the reuse line.

Rollback: revert the commit. Nothing stored changes format destructively; old plans simply lack `tree` and `reused`.

## Open Questions

- Should `docs/RELEASE-PIPELINE.md` keep a per-release runner-minute table, or is a one-time before/after measurement in this change enough? Either way the task list records the next release's numbers once.
