# Proposal

## Why

One Emit release currently runs the compatibility matrix five times, and three of those runs test the same source tree. The 0.11.0 cycle used about 580 runner-minutes and took about 90 minutes from merge to "available on every channel":

- PR #199's head, the merge commit on `main`, and the `v0.11.0` tag all had tree `a56b233`, and each ran the matrix: about 103, 107, and 173 runner-minutes.
- The Nix pin pull request (#200) changed only `packaging/release.json`. It ran the full native matrix once on the pull request and again on `main`, about 176 runner-minutes, although design D7 of `low-cost-distribution-channels` meant packaging changes to be validated by channel rehearsal alone.
- Full-mode coverage first runs on the tag. A failure there cannot be fixed by moving the tag, so the only remedy is a new patch release.

Earlier decisions ruled out reusing pre-merge results "silently" and reusing "another commit's native correctness result" (`streamline-build-and-test`, design lines 27 and 95). The concern behind them was validating source that differs from what ships. A result whose tree is byte-identical to the tree being validated, and whose reuse is visible in the plan, does not have that problem.

## What Changes

- **Reuse by tree identity.** A run on a push to `main`, or the validation for a release tag, may reuse a successful `Required validation` from a same-repository pull-request run whose head tree is identical. That run must have executed its proofs itself (no reuse of a reuse), and its recorded plan must be at least as comprehensive as the plan being satisfied. The tag requires `full` mode. The plan, the narration, and the aggregated check name the reused run, its commit, and its tree. Anything not identical, or not provably sufficient, falls back to today's execution.
- **Release pull requests run release validation.** A pull request that changes `VERSION` is planned in `full` mode with archive rehearsal: all four full native cells, complete reference verification, source and units, and both offline archive builds. Release-only failures then surface before merge, and the tag can reuse that result.
- **Packaging-only changes skip the native matrix.** A diff whose categories are only `packaging` and `documentation` provisions no LLVM toolchain and runs no native cells; the distribution-channel rehearsal is its proof. Channel promotion pull requests such as #200 become rehearsal-only.
- The tag workflow still packages, checks, and offline-builds the exact archive itself before publishing. Reuse replaces only the native matrix and verification jobs.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `development-validation`: packaging-only classification is no longer treated as code, and a new requirement covers when an executed validation result may satisfy another run of an identical tree.
- `source-releases`: version-changing pull requests run release-level validation, and tagged publication may satisfy its matrix and verification gates with a result reused for the identical tree, while still building and checking its archive itself.

## Impact

- `tools/test-classify.py`: the `code` flag excludes packaging-only diffs.
- `tools/ci-policy.py`: the plan gains the release-PR mode and a reuse decision; aggregation accepts a reused source and reports it.
- New `tools/ci-reuse.py`: locates the candidate pull-request run through the GitHub API, verifies tree identity, the run's provenance, and its recorded plan, and narrates the decision on stderr.
- `.github/workflows/compatibility.yml`: the `policy` job decides on reuse; `prepare`, `native`, and `verification` are skipped when a result is reused; the plan artifact records the mode and the reuse source. The tag path through `release.yml` is unchanged apart from inheriting this.
- Tests: `test/test-classify-tests.py`, `test/ci-policy-tests.py`, and new reuse fixtures.
- Docs: `docs/RELEASE-PIPELINE.md`, `docs/DEVELOPMENT.md`, and `docs/RELEASES.md` describe the new trigger table.
- No compiler, runtime, or bootstrap input changes, so no `make regen`. This is CI infrastructure with no change to shipped behavior or the installed payload, so it should qualify as trivial under the versioning policy; the finish step can confirm.
