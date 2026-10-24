# Tasks

## 1. Versioning policy and instructions

- [x] 1.1 Extend `docs/RELEASES.md` with the 0.x feature rule (incompatible changes and new compatible features take a minor bump, fixes a patch bump), a bump-level table, the definition of trivial changes, one bump per pull request, and the `## Unreleased` deferral convention. Verify the text agrees with the `source-releases` delta requirement.
- [x] 1.2 Add a concise "Versioning and releases" section to `CLAUDE.md` that states the bump obligation, the trivial-change exemption, and the requester override, and links `docs/RELEASES.md`. Verify `AGENTS.md` (a symlink) shows the same section.

## 2. Version decision tool

- [x] 2.1 Add `tools/release-tag.sh`:
  - `check [COMMIT]` validates the `MAJOR.MINOR.PATCH` form, that no `v<VERSION>` tag exists, that the version is greater than every `v*` tag by numeric comparison, and that a nonempty changelog section exists under the `release-source.sh` heading rule.
  - `plan` prints `tag=v<VERSION>`, or `skip=<reason>` when `VERSION` is unchanged or already tagged.
  - Narration goes to stderr according to `docs/OUTPUT.md`.
- [x] 2.2 Add `test/release-tag-tests.sh` with temporary Git repositories. Verify:
  - an advancing version with a `## X.Y.Z` heading, and with a `## [X.Y.Z] - date` heading, passes;
  - an equal, lower, or already tagged version fails and names the tag;
  - a missing or empty section fails;
  - an `Unreleased` section is ignored;
  - numeric comparison holds, for example `0.10.0` is greater than `0.9.0`;
  - `plan` skips when `VERSION` is unchanged.

## 3. Automatic tagging and pull-request checks

- [x] 3.1 Run `tools/release-tag.sh check` in the pull-request policy job of `.github/workflows/compatibility.yml` when classification includes `release`, with tags fetched. Register `test/release-tag-tests.sh` in that job's lightweight policy checks. Verify the job selects the check only for `VERSION` changes, using the classification tests.
- [x] 3.2 Add `.github/workflows/release-tag.yml` as design decision 3 describes:
  - **Triggers:** `push` to `main` with `paths: [VERSION]`, plus `workflow_dispatch`.
  - **Permissions:** top-level `contents: read`.
  - **Concurrency:** a non-cancelling group.
  - **Credential:** a `RELEASE_TAG_TOKEN` presence check and a `git push --dry-run` preflight.
  - **Tagging:** run `plan`, create the annotated tag at `github.sha`, and push only that ref.
  - **Actions:** all pinned by SHA.
- [x] 3.3 Extend `test/ci-policy-tests.py` to pin the release-tag workflow contract: triggers, read-only `GITHUB_TOKEN` permissions, the secret confined to the preflight and push steps, a single tag ref pushed, SHA-pinned actions, and that `release.yml` and `channels.yml` are unchanged in trigger and publish conditions. Verify with `python3 test/ci-policy-tests.py`.
- [x] 3.4 Document the automatic path in `docs/RELEASE-PIPELINE.md`: the trigger, the token's scope, creation and rotation, retry by dispatch, forward fixes for failed gates, and that the channel pull requests still need a maintainer merge. Verify the "Source release" and "Distribution channels" sections stay consistent.

## 4. Version in the REPL banner and help

- [x] 4.1 In `src/emit.cpp`, add one version-line helper used by `emit --version` and as the first line of `usage()`. Change the REPL banner to `Emit <VERSION> (embedded compiler, ORC/LLJIT, LLVM <LLVM_VERSION>).  ^D to exit.` Verify `build/emit --version` is byte-identical to before, and that `emit --help`, `emit -h`, and `emit help` start with that line.
- [x] 4.2 Update `test/emit-cli-tests.sh` and `test/jit-optimization-tests.sh` to compare the banner and the first help line against `emit --version` instead of a literal. Add assertions that per-verb help and `emit run` stdout have no version line. Update the banner example in `docs/PROJECTS.md`. Verify with `bash tools/test.sh --suite cli-interface-help-final-value` and the JIT optimization suite.

## 5. Release 0.2.0

- [x] 5.1 Set `VERSION` to `0.2.0` and add a `## 0.2.0` section to `CHANGELOG.md` covering:
  - `emit build --stdlib` and install-time warming (#148);
  - top-level source order (#140);
  - REPL startup summary (#149);
  - Apple clang doctor status (#139);
  - the cancellation test fix (#146);
  - the version in the REPL banner and help;
  - automatic releases.

  Verify `tools/release-tag.sh check HEAD` passes, and that `tools/release-source.sh HEAD <dir> v0.2.0` produces notes matching the section.
- [x] 5.2 Run the classified validation for the host, documentation, and CI changes (`bash tools/test.sh dev --changed main`, the CLI and installation suites, and every lightweight policy script in `compatibility.yml`), plus `openspec validate version-discipline-and-auto-release --strict`. Verify all pass.
- [x] 5.3 Confirm with the maintainer that the `RELEASE_TAG_TOKEN` secret exists: a fine-grained token limited to `bwbensonjr/emit` with Contents read and write. Verify with `gh secret list --repo bwbensonjr/emit`, which shows the name but never the value, before the pull request is merged.

## Workflow follow-up

- Sync and archive the change before the 0.2.0 pull request merges, so the release archive carries the updated specs.
- After the merge, confirm `release-tag.yml` created `v0.2.0` and `Source release` published it. Confirm `channels.yml` opened the Homebrew tap and Nix pull requests and pushed OCI, then merge the channel pull requests.
