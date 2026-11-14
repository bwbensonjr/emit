# Releases

## Version and compatibility policy

The committed [`VERSION`](../VERSION) file is the release version source of truth. It uses
Semantic Versioning and is embedded in each native `emit` build. Release tags use the form
`v<VERSION>`; the changelog contains a matching version section. Builds from source archives
therefore retain their identity without Git metadata.

The compatibility surface is Emit's accepted Scheme language and public command-line interface.
While the major version is zero, an incompatible change or a new compatible feature advances the
minor version, and a compatible fix advances the patch version. The first release is `0.1.0`.
The `1.0.0` milestone will establish the compatibility promise for the language and CLI.

## Bumping the version

Every non-trivial change increments `VERSION` and adds a matching, nonempty `CHANGELOG.md`
section in the same pull request, unless the requester explicitly defers the bump or chooses its
level. Merging a `VERSION` change to `main` releases it automatically; see
[`RELEASE-PIPELINE.md`](RELEASE-PIPELINE.md#automatic-release-tagging).

| Change | Before 1.0 | Example |
|---|---|---|
| Incompatible language or CLI change | minor | `0.2.3` -> `0.3.0` |
| New compatible command, option, or language feature | minor | `0.1.1` -> `0.2.0` |
| Compatible fix, including performance and diagnostics | patch | `0.2.0` -> `0.2.1` |
| Trivial change | none | -- |

A change is **trivial** when it leaves the shipped behavior, the installed payload, and the
source-release build unchanged. Documentation, comments, layout-only formatting, tests, CI
configuration, and OpenSpec planning artifacts qualify. A change that alters what `emit` does,
what `make install` installs, or what a release archive builds is not trivial, however small.

A pull request takes **one bump**, at the highest level any part of it warrants. Several changes
in one pull request still produce one version, not one per change.

The new version must be greater than every existing `v*` release tag and not yet tagged.
`tools/release-tag.sh check` enforces that on every pull request that changes `VERSION`, and
compares versions numerically by component, so `0.10.0` follows `0.9.0`.

### Deferring a bump

When the requester defers a bump, record the change under an `## Unreleased` heading at the top of
`CHANGELOG.md` and leave `VERSION` alone. No release is created. The next pull request that bumps
the version renames `## Unreleased` to its `## X.Y.Z` heading, folding the deferred entries into
that release, and chooses the level from everything the release now contains. Release tooling
reads only the version's own section, so an `Unreleased` section never reaches release notes.

Internal compatibility identifiers remain independent of the release version. In particular,
bootstrap IR, compiler artifacts, cache metadata, and compile-time library interfaces retain
their own compatibility stamps and rules. Changing `VERSION` rebuilds the native host and does
not regenerate bootstrap IR.

The top-level command reports the version embedded at build time with `emit --version`. The LLVM
version in that output is also the LLVM used to build the binary; runtime tool discovery does not
change that identity.

## Finishing a versioned change

A completed change reaches review as **one pull request** carrying the implementation, the updated
main specifications under `openspec/specs/`, the archived change under `openspec/changes/archive/`,
`VERSION`, and its changelog section. Archiving never needs a later cleanup pull request or a
second bump. The entry point is the `emit-finish-change` agent skill. It does the judgment work
and drives `tools/release-handoff.sh` for every check and GitHub operation (change
automate-release-handoff):

```sh
tools/release-handoff.sh preflight CHANGE   # stage=<name> status=<ok|owed|fail> lines; writes nothing
tools/release-handoff.sh pr CHANGE --title "feat: ..." --body-file BODY [--draft | --ready]
tools/release-handoff.sh status [PR]        # the Required validation check and the next action
tools/release-handoff.sh follow SHA [--wait] # after the merge: tag, release, and channels
```

`preflight` checks six stages:

- **base**: a feature branch containing current `main`;
- **tasks**: every task checked; checked boxes are claims, judged against validation;
- **specs**: `openspec validate --strict`, and each delta against the *live* main spec, so a
  MODIFIED requirement cannot silently drop a scenario added since it was written;
- **version**: an advancing bump with its changelog section, or a trivial change, or a deferral
  under `## Unreleased`;
- **bootstrap**: when a compiler input changed, `bootstrap/` corresponds to the current source;
- **validation**: the checks the diff obliges, and whether `Required validation` passed on the
  pull request.

When only documentation, such as the sync-and-archive commit, follows a passing validation,
nothing is rerun. `pr` reuses the branch's open pull request and edits it in place, and refuses
`--ready` until the archive is committed. Nothing in the handoff merges: **merging the reviewed
versioned pull request is the release approval.**

## Release lifecycle

Reports from the handoff and from `follow` use these stages, and never report a later stage early:

| Stage | Means |
| --- | --- |
| implementation complete | tasks done; validation owed or passed |
| ready for review | archived and committed; pull request ready; checks reported |
| merged | the pull request is on `main` |
| tagged | `v<VERSION>` exists at the merge commit ([automatic tagging](RELEASE-PIPELINE.md#automatic-release-tagging)) |
| source published | the GitHub release has the validated archive and `SHA256SUMS` |
| channel available | per channel: the tap formula, the Nix pin on `main`, or the OCI version tag names the release |

A published source release is not yet a Homebrew release: Homebrew is available only once the
tap's `main` formula names the release archive and checksum. `follow` selects every workflow run
by the merge commit and tag, never the latest run, and names the first failed stage with its
remedy. Its identity lines are the archive, pull request, merge commit, tag, release URL, archive
SHA-256, tap and Nix pull requests, and OCI digest.
