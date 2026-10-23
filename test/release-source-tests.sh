#!/usr/bin/env bash
# Test real Git archives without committing or changing the developer's worktree.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
repo=$PWD
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
say "stage HEAD -> $work/repository  [isolated packaging fixture]"
mkdir "$work/repository"
git archive HEAD | tar -xf - -C "$work/repository"
# Overlay release inputs so this test also works before their first commit.
for input in VERSION CHANGELOG.md tools/release-source.sh tools/release-check.sh tools/release-publish.sh \
             tools/channel-identity.sh; do
  cp "$input" "$work/repository/$input"
done
# Channel recipes live in the repository but never in a source archive: a released archive must
# not carry a pin to an older release (change: low-cost-distribution-channels, design D2).
mkdir -p "$work/repository/packaging/homebrew"
printf '{}\n' > "$work/repository/packaging/release.json"
printf '# formula\n' > "$work/repository/packaging/homebrew/emit.rb.in"
printf '{ }\n' > "$work/repository/flake.nix"
printf '{}\n' > "$work/repository/flake.lock"
git -C "$work/repository" init -q
git -C "$work/repository" add .
git -C "$work/repository" -c user.name="Release Tests" -c user.email="release-tests@example.invalid" commit -qm "test: source archive fixture"
cd "$work/repository"
tools/release-source.sh HEAD "$work/first"
tools/release-source.sh HEAD "$work/second"
diff -r "$work/first" "$work/second"
if tar -tzf "$work/first/emit-$(< VERSION).tar.gz" | grep -E '^[^/]+/(flake\.nix|flake\.lock|packaging/)'; then
  printf 'test: channel recipes entered the source archive\n' >&2; exit 1
fi
# The channel identity describes the archive, verifies it, and rejects every disagreement.
archive="$work/first/emit-$(< VERSION).tar.gz"
url="https://github.com/bwbensonjr/emit/releases/download/v$(< VERSION)/emit-$(< VERSION).tar.gz"
tools/channel-identity.sh describe "$archive" --tag "v$(< VERSION)" --commit "$(git rev-parse HEAD)" \
  --url "$url" > "$work/identity.json"
tools/channel-identity.sh verify "$work/identity.json" "$archive"
reject_identity() {
  if tools/channel-identity.sh verify "$1" "$2" > "$work/identity.out" 2> "$work/identity.err"; then
    printf 'test: channel identity accepted %s\n' "$3" >&2; exit 1
  fi
}
reject_identity "$work/identity.json" "$work/corrupt-placeholder" "a missing archive"
sed 's/"sha256": "[0-9a-f]*"/"sha256": "'"$(printf '0%.0s' $(seq 64))"'"/' "$work/identity.json" > "$work/wrong-digest.json"
reject_identity "$work/wrong-digest.json" "$archive" "a wrong digest"
sed -e "s/$(< VERSION)/9.9.9/g" "$work/identity.json" > "$work/wrong-version.json"
reject_identity "$work/wrong-version.json" "$archive" "a different version"
grep -v '"commit"' "$work/identity.json" > "$work/missing-field.json"
reject_identity "$work/missing-field.json" "$archive" "a missing field"
sed 's#https://#file:///#' "$work/identity.json" > "$work/file-url.json"
reject_identity "$work/file-url.json" "$archive" "a file:// URL outside rehearsal"
reject_identity "$work/absent.json" "$archive" "a missing identity file"
tools/release-source.sh HEAD "$work/first"
if tools/release-source.sh HEAD "$work/mismatch" v9.9.9 > "$work/mismatch.out" 2> "$work/mismatch.err"; then
  printf 'test: mismatched release tag accepted\n' >&2; exit 1
fi
[ ! -e "$work/mismatch" ]
cp -R "$work/first" "$work/corrupt"
printf 'corrupt\n' >> "$work/corrupt/emit-$(< VERSION).tar.gz"
if tools/release-check.sh "$work/corrupt" > "$work/corrupt.out" 2> "$work/corrupt.err"; then
  printf 'test: corrupt release archive accepted\n' >&2; exit 1
fi
EMIT_VERBOSITY=quiet tools/release-source.sh HEAD "$work/quiet" > "$work/quiet.out" 2> "$work/quiet.err"
[ ! -s "$work/quiet.out" ]
[ ! -s "$work/quiet.err" ]
diff -r "$work/first" "$work/quiet"
git tag "v$(< VERSION)"
mkdir "$work/bin" "$work/remote"
cp "$repo/test/release-gh-mock.sh" "$work/bin/gh"
chmod +x "$work/bin/gh"
export PATH="$work/bin:$PATH" RELEASE_TEST_REMOTE="$work/remote"
cp -R "$work/first" "$work/wrong-notes"
printf 'Unrelated release notes.\n' > "$work/wrong-notes/RELEASE-NOTES.md"
if tools/release-publish.sh "v$(< VERSION)" "$work/wrong-notes" > "$work/wrong-notes.out" 2> "$work/wrong-notes.err"; then
  printf 'test: notes differing from archived changelog accepted\n' >&2; exit 1
fi
[ ! -e "$work/remote/status" ]
tools/release-publish.sh "v$(< VERSION)" "$work/first"
[ "$(< "$work/remote/status")" = false ]
cmp "$work/first/emit-$(< VERSION).tar.gz" "$work/remote/emit-$(< VERSION).tar.gz"
tools/release-publish.sh "v$(< VERSION)" "$work/first"
printf 'different\n' >> "$work/remote/emit-$(< VERSION).tar.gz"
if tools/release-publish.sh "v$(< VERSION)" "$work/first" > "$work/retry.out" 2> "$work/retry.err"; then
  printf 'test: differing public asset accepted\n' >&2; exit 1
fi
printf '# Changelog\n' > CHANGELOG.md
git add CHANGELOG.md
git -c user.name="Release Tests" -c user.email="release-tests@example.invalid" commit -qm "test: missing release notes"
if tools/release-source.sh HEAD "$work/no-notes" > "$work/notes.out" 2> "$work/notes.err"; then
  printf 'test: missing release notes accepted\n' >&2; exit 1
fi
[ ! -e "$work/no-notes" ]
printf '0.2.0-rc.1+build.1\n' > VERSION
printf '# Changelog\n\n## [0.2.0-rc.1+build.1]\n\nPrerelease packaging fixture.\n' > CHANGELOG.md
git add VERSION CHANGELOG.md
git -c user.name="Release Tests" -c user.email="release-tests@example.invalid" commit -qm "test: prerelease source identity"
git tag v0.2.0-rc.1+build.1
tools/release-source.sh HEAD "$work/prerelease" v0.2.0-rc.1+build.1
tools/release-check.sh "$work/prerelease"
[ -s "$work/prerelease/emit-0.2.0-rc.1+build.1.tar.gz" ]
say "test release source -> packaging and publication guards  [19 checks, ${SECONDS}s]"
