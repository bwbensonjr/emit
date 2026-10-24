# Proposal

## Why

Emit has a semantic-versioning policy and a fully gated release pipeline, but nothing asks a change to declare its version impact, and shipping still depends on someone remembering to push a tag. PR #150 merged a new command mode and two observable behavior changes, yet `main` still reports `0.1.1` and no channel carries that work. Running `emit` also hides which version is in use, except through an explicit `emit --version`.

## What Changes

- Project instructions (`CLAUDE.md`, linked as `AGENTS.md`) and `docs/RELEASES.md` require every non-trivial change to bump `VERSION` under SemVer with a matching `CHANGELOG.md` section, unless the requester says otherwise. They define what counts as trivial and how a change whose bump was deferred reaches a later release.
- The 0.x compatibility policy is completed: new compatible features advance the minor version, alongside incompatible changes. Until now the policy named only incompatible changes and fixes.
- A pull request that changes `VERSION` must name a version greater than the latest release tag that has not already been tagged.
- **Automatic release:** a merge to `main` that changes `VERSION` creates tag `v<VERSION>` for that commit. The existing gated `Source release` workflow then publishes the release, and the existing channel workflow builds, tests and promotes Homebrew, Nix and OCI. No step depends on a maintainer pushing a tag. Homebrew and Nix still promote through reviewable pull requests, as the distribution spec requires.
- The REPL banner and top-level `emit --help` report the Emit version and build-time LLVM version. `emit run`, `emit build` and `emit lib` output is unchanged.
- Release `0.2.0`, covering the PR #150 work and this change, is the first release shipped this way.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `source-releases`: the version policy gains the feature rule, the per-change bump obligation and pull-request version checks. A new requirement releases each version merged to `main` automatically.
- `emit-cli`: the REPL banner and top-level help identify the Emit and LLVM versions, consistent with `emit --version`.

## Impact

- **Documentation:** `CLAUDE.md`, `docs/RELEASES.md`, `docs/RELEASE-PIPELINE.md`, `README.md`, `docs/PROJECTS.md` (banner example), `CHANGELOG.md`.
- **Native host:** `src/emit.cpp` (banner and help text). No compiler or bootstrap regeneration.
- **CI:** a new workflow that tags version changes on `main`, and a version-increase check on pull requests that change `VERSION`. `release.yml` and `channels.yml` are unchanged.
- **Tests:** banner and help assertions in `test/emit-cli-tests.sh` and `test/jit-optimization-tests.sh`, a tag-decision test, and pins in `test/ci-policy-tests.py`.
- **Repository settings:** a new repository secret, holding a fine-grained token limited to this repository with Contents read and write. GitHub does not start workflows from tags pushed with a workflow's own `GITHUB_TOKEN`, so the tag must be pushed with a separate credential. The maintainer must create the token before the `0.2.0` merge.
- **Release cadence:** every non-trivial merged change becomes a release. That runs the full release gate (all four platform/LLVM cells plus reference checks) and opens channel pull requests for the maintainer to merge.
