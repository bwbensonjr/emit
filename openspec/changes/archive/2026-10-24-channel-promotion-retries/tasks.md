# Tasks

## 1. Homebrew rehearsal uses current Homebrew (#153, design D1)

- [x] 1.1 In `.github/workflows/channels.yml` `homebrew` job, add a step before the first `brew` use that runs `brew update` and narrates `brew --version` on stderr, keeping `HOMEBREW_NO_AUTO_UPDATE=1` for the rest of the job; verify by reading the job that `brew update` precedes `brew install`, `brew style`, and `brew audit`
- [x] 1.2 Add a `test/ci-policy-tests.py` case pinning that the `homebrew` job's `brew update` step comes before its `brew style` and `brew audit --strict` steps; verify `python3 test/ci-policy-tests.py` passes, and fails when the update step is moved after `brew style`
- [x] 1.3 Describe the update in the homebrew bullet of `docs/RELEASE-PIPELINE.md` "Distribution channels"; verify the bullet names the update and why (the tap's test-bot lints with current Homebrew)

## 2. Version comparison and backward-move guard (design D4)

- [x] 2.1 Add a `MAJOR.MINOR.PATCH` comparison helper to `tools/channel-promote.sh` that fails visibly on an unparseable version; verify with new `test/channel-promote-tests.sh` cases (`0.10.0 > 0.9.9`, equal versions, a malformed version rejected)
- [x] 2.2 In `channel-promote.sh oci`, read the `org.opencontainers.image.version` label of the image `latest` names. Skip moving `latest` with `[superseded]` when that version is newer, and treat a missing tag or label as older. Leave `oci-latest` unchecked. Verify with fixture cases: promoting `v1.0.0` after `v1.1.0` keeps `latest` on 1.1.0 and still succeeds, and `oci-latest` still rolls back. This needs the fixture images in `make_image` to carry the version label.

## 3. Already-merged and superseded pull-request promotions (#155, design D2)

- [x] 3.1 In `open_pull_request`, before touching the branch, compare the candidate with the base branch's copy. Return success with `[already merged]` when they are byte-identical. Return success with `[superseded by X.Y.Z]` when the base names a newer version: the formula version comes from its `emit-X.Y.Z.tar.gz` URL, and the Nix version from `release.json`'s `version`. Verify with fixture cases: after merging the fixture tap and flake branches into the bare remotes' `main`, a retry makes no `gh` call or push and succeeds; an older tag against a newer base is skipped as superseded.
- [x] 3.2 Reset a leftover promotion branch that has no open pull request onto the base before committing; verify with a fixture case where a merged branch's remote ref still exists and a new, different candidate is promoted: the new pull request branch has exactly one commit on top of the base
- [x] 3.3 Run `test/channel-promote-tests.sh` (Docker or `CHANNEL_TEST_REGISTRY` required); verify every existing check still passes alongside the new ones, and update its header comment to name this change

## 4. OCI re-tests a published version instead of rebuilding (#156, design D3)

- [x] 4.1 In the `oci` job, add a step that resolves `ghcr.io/<repo>:<version>` when the identity has a release tag. On a hit, copy that digest with `skopeo copy --preserve-digests` into `$RUNNER_TEMP/emit-image.tar` in the form the later steps read, and load it as `emit-candidate:<version>`. On "not found", build as today. Fail on any other inspection error. Narrate the branch taken and the digest. Verify by reading the job, and by a rehearsal dispatch with `tag=v0.2.0 publish=false` reporting the published digest `sha256:9e9e01ee…` under test.
- [x] 4.2 Confirm `docker load` accepts the copied archive and that `oci-digest.txt` and the promote step read the same digest as the registry; verify in that rehearsal run's log that the tested and published digests match
- [x] 4.3 Add a `test/ci-policy-tests.py` case pinning that the `oci` job resolves the published tag before its build step and builds only in the not-found branch, and that the resolve step holds no write credential beyond the job's existing ones; verify `python3 test/ci-policy-tests.py` passes
- [x] 4.4 Rewrite the oci bullet and the "Retry and rollback" list in `docs/RELEASE-PIPELINE.md`, covering:
  - a published version is re-tested, not rebuilt;
  - an already merged promotion succeeds unchanged;
  - an older release never moves `latest`, the formula, or the pin.

  Verify the retry text matches the behavior in `specs/distribution/spec.md`.

## 5. Integration

- [x] 5.1 Run the lightweight policy suites (`python3 test/ci-policy-tests.py`, `python3 test/test-classify-tests.py`, `bash test/release-tag-tests.sh`) and `openspec validate channel-promotion-retries --strict`; verify all pass
- [x] 5.2 Open the pull request and confirm its channel rehearsal passes, including the narrated Homebrew version and an OCI candidate build (a pull request has no release tag, so it builds)
- [x] 5.3 After merge, dispatch `gh workflow run channels.yml -f tag=v0.2.0 -f publish=true`; verify every job succeeds. Homebrew and Nix should report `[already merged]`, and `oci` should report `[unchanged]` for the published digest. Close #153, #155, and #156 with the run link.

## Workflow follow-up

- Sync the delta spec into `openspec/specs/distribution/spec.md` and archive the change after review.
