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
