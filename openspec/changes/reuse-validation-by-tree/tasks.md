# Tasks

## 1. Classification: packaging is not code, toolchain inputs are visible

- [x] 1.1 In `tools/test-classify.py`, set `code` false when the categories are a subset of `{documentation, packaging}`, keeping `docs_only` and `channels` unchanged (D7). Update `test_channel_inputs_rehearse_channels_only` in `test/test-classify-tests.py` to assert `code` is false for each packaging path, and add a case that packaging plus any non-packaging, non-documentation path keeps `code` true. Verify `python3 test/test-classify-tests.py` passes and that, with `aaacde4` checked out, `tools/test.sh --classify 269b8b9 --ci` reports `code: false`.
- [x] 1.2 Add the `toolchain` flag, set for any path in the `paths` list of `.github/workflows/dependency-preparation.yml` (D6), with a contract test that reads the workflow and fails if the two lists differ. Verify the classifier tests pass and a fixture diff touching `tools/ci-provision.sh` reports `toolchain: true`.

## 2. Policy: release-PR mode, tree recording, sufficiency, aggregation

- [x] 2.1 In `tools/ci-policy.py plan`, treat a `pull_request` whose classification includes `release` as comprehensive: `mode: full`, `reference_full`, `archive` (D4). Add a `test/ci-policy-tests.py` case: a `VERSION`-only PR plans four full cells, full reference, and archive rehearsal; an ordinary code PR is unchanged. Verify the tests pass.
- [x] 2.2 Add the plan fields `tree`, `sha`, and `execute` (default true), and a `covers(candidate, plan)` function implementing D3. Test it with fixtures: full covers normal; normal does not cover a tag plan; a missing `tree`, a `reused` block, or `toolchain: true` in either plan is never covered. Verify `python3 test/ci-policy-tests.py`.
- [x] 2.3 Add `apply_reuse(plan, candidate)`, which sets `reused`, `execute: false`, and rewrites `required` per D5. Make `aggregate` print the D8 line and reject a plan whose `reused` block lacks a run URL, sha, or tree. Verify with aggregation fixtures for both reused and executed plans, including a reused tag plan that still requires `prepare`, `package`, and `archive`.
- [x] 2.4 Update the packaging-only scenario in `test/ci-policy-tests.py`: required is `["policy"]` and channels stay selected. Verify the tests pass.

## 3. The reuse lookup

- [x] 3.1 Write `tools/ci-reuse.py` (D2): input is the plan JSON plus `--event` and `--sha`; output is the plan, unchanged or with reuse applied through 2.3; narration goes to stderr per `docs/OUTPUT.md` and is controlled by `EMIT_VERBOSITY`. Put the GitHub API calls behind one small client so tests can replay recorded responses. Verify `--help` and a non-push, non-tag event returning the plan unchanged.
- [x] 3.2 Add `test/ci-reuse-tests.py` with recorded API fixtures (shaped from the real 0.11.0 responses: `commits/269b8b9/pulls` -> #199, run 44898188684), covering: an eligible same-tree candidate; a different tree; a fork head repository; a failed `Required validation` job; a missing or expired artifact; an artifact without `tree`; a chained `reused` plan; an API error; and a candidate that does not cover a tag plan. Each rejection must leave the plan unchanged and name its reason. Verify the tests pass and register them in the policy job's lightweight checks.
- [x] 3.3 Add `--dry-run --sha SHA` for local use with `gh`. Verify that against `269b8b9` it finds run 44898188684 and rejects it with "plan has no recorded tree".

## 4. Workflow wiring

- [x] 4.1 In `compatibility.yml`, have `policy` record `tree` and `sha`, run `tools/ci-reuse.py` on push and tag events with `GH_TOKEN` and `pull-requests: read`, export `execute`, and upload the final plan. Gate `native` and `verification` on `execute`, and `prepare` on `(code && execute) || archive` (D5). Extend `test_workflow_contract` in `test/ci-policy-tests.py` to assert those conditions and the permission. Verify the tests pass and `actionlint` (if available) reports nothing new.
- [x] 4.2 Document the trigger table, reuse rules, fallback, and the D8 log line in `docs/RELEASE-PIPELINE.md`, and the release-PR full mode in `docs/DEVELOPMENT.md` and `docs/RELEASES.md`. Verify `git grep -n "every release gate\|four full"` in those files matches the new behavior.

## 5. Integration validation

- [ ] 5.1 Open this change's pull request and confirm its `policy` job records `tree` in the uploaded plan and that `Required validation` succeeds. Then run `tools/ci-reuse.py --dry-run --event push --sha <PR merge ref>` locally and confirm it selects that run as eligible.
- [x] 5.2 Confirm `bash tools/test.sh --classify` on the change's diff selects no compiler regeneration (no assembled compiler input changes) and that `make format-check` is clean or skipped (no covered Scheme sources change).

## Workflow follow-up

- Decide at finish whether the change is trivial under the versioning policy (CI configuration only, no shipped behavior, payload, or source-release build change); if so, no `VERSION` bump.
- After the first merge to `main` following this change, check that the push run's `Required validation` prints the reuse line and runs no `native` jobs.
- At the next release, record that cycle's runner-minutes and merge-to-channels time beside the 0.11.0 numbers in the proposal, in `docs/RELEASE-PIPELINE.md`.
