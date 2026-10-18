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
for input in VERSION CHANGELOG.md tools/release-source.sh tools/release-check.sh tools/release-publish.sh; do
  cp "$input" "$work/repository/$input"
done
git -C "$work/repository" init -q
git -C "$work/repository" add .
git -C "$work/repository" -c user.name="Release Tests" -c user.email="release-tests@example.invalid" commit -qm "test: source archive fixture"
cd "$work/repository"
tools/release-source.sh HEAD "$work/first"
tools/release-source.sh HEAD "$work/second"
diff -r "$work/first" "$work/second"
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
say "test release source -> packaging and publication guards  [12 checks, ${SECONDS}s]"
