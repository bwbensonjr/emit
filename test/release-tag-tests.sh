#!/usr/bin/env bash
# Exercise tools/release-tag.sh in temporary Git repositories; the developer's tags are untouched.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
repo=$PWD
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
checks=0
fixture="$work/repository"
mkdir -p "$fixture/tools"
cp tools/release-tag.sh tools/changelog-section.awk tools/log.sh "$fixture/tools/"
git -C "$fixture" init -q
say "stage release-tag fixture -> $fixture"
cd "$fixture"
commit() {
  git add -A
  git -c user.name="Release Tests" -c user.email="release-tests@example.invalid" commit -qm "$1"
}
release() {
  printf '%s\n' "$1" > VERSION
  printf '# Changelog\n\n%s\n\nEntry for %s.\n' "${2:-## $1}" "$1" > CHANGELOG.md
  commit "release $1"
}
accept() {
  tools/release-tag.sh check > "$work/out" 2> "$work/err" || { cat "$work/err" >&2; printf 'test: rejected %s\n' "$1" >&2; exit 1; }
  checks=$((checks + 1))
}
# Reject, and require the diagnostic to contain $2.
reject() {
  if tools/release-tag.sh check > "$work/out" 2> "$work/err"; then
    printf 'test: accepted %s\n' "$1" >&2; exit 1
  fi
  grep -Fq -- "$2" "$work/err" || { cat "$work/err" >&2; printf 'test: %s diagnostic lacks "%s"\n' "$1" "$2" >&2; exit 1; }
  checks=$((checks + 1))
}
plan() { tools/release-tag.sh plan "$@" 2> "$work/err"; }
expect_plan() {
  local expected=$1 got
  shift
  got=$(plan "$@") || { cat "$work/err" >&2; printf 'test: plan failed, expected %s\n' "$expected" >&2; exit 1; }
  [ "$got" = "$expected" ] || { printf 'test: plan printed "%s", expected "%s"\n' "$got" "$expected" >&2; exit 1; }
  checks=$((checks + 1))
}

release 0.1.0
accept "a first version with no release tags"
expect_plan tag=v0.1.0 --no-base
git tag v0.1.0
reject "an already tagged version" "v0.1.0 is already tagged"
expect_plan skip=tagged --no-base

release 0.1.1 "## [0.1.1] - 2026-10-23"
accept "an advancing version with a bracketed, dated heading"
release 0.2.0
accept "an advancing version with a plain heading"
expect_plan tag=v0.2.0
git tag v0.2.0

# A change that leaves VERSION alone is not released, even when untagged history exists.
printf 'note\n' > README.md
commit "docs: unrelated"
expect_plan skip=unchanged
expect_plan skip=unchanged --base HEAD~1

release 0.1.9
reject "a version lower than the latest tag" "does not advance past release tag v0.2.0"
expect_plan_fails() {
  if plan "$@" > "$work/out"; then printf 'test: plan accepted %s\n' "$(cat "$work/out")" >&2; exit 1; fi
  [ ! -s "$work/out" ] || { printf 'test: failing plan printed a decision\n' >&2; exit 1; }
  checks=$((checks + 1))
}
expect_plan_fails

release 0.9.0
git tag v0.9.0
release 0.10.0
accept "0.10.0 after 0.9.0 (numeric comparison)"
git tag v0.10.0
release 0.9.1
reject "0.9.1 after 0.10.0 (numeric comparison)" "does not advance past release tag v0.10.0"

# Missing, empty, and Unreleased-only sections all fail; Unreleased never stands in for a version.
printf '0.11.0\n' > VERSION
printf '# Changelog\n\n## Unreleased\n\nPending work.\n\n## 0.10.0\n\nOld.\n' > CHANGELOG.md
commit "release without a section"
reject "a missing changelog section" "missing or empty CHANGELOG.md section for 0.11.0"
expect_plan_fails
printf '# Changelog\n\n## 0.11.0\n\n## 0.10.0\n\nOld.\n' > CHANGELOG.md
commit "release with an empty section"
reject "an empty changelog section" "missing or empty CHANGELOG.md section for 0.11.0"
printf '# Changelog\n\n## Unreleased\n\nPending work.\n\n## 0.11.0\n\nNew.\n' > CHANGELOG.md
commit "release beside an Unreleased section"
accept "a version section beside an Unreleased section"

# Non-release tags and malformed versions.
git tag v0.99.0-rc.1
accept "a prerelease tag is not a release to advance past"
printf '0.12.0-rc.1\n' > VERSION
commit "prerelease version"
reject "a prerelease VERSION" "is not MAJOR.MINOR.PATCH"

# Quiet output carries the decision only.
release 0.12.0
EMIT_VERBOSITY=quiet tools/release-tag.sh plan > "$work/out" 2> "$work/err"
[ "$(cat "$work/out")" = tag=v0.12.0 ] && [ ! -s "$work/err" ] || { printf 'test: quiet plan was not silent\n' >&2; exit 1; }
checks=$((checks + 1))
cd "$repo"
say "test release-tag -> version decisions  [$checks checks, ${SECONDS}s]"
