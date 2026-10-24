#!/usr/bin/env bash
# Decide whether a commit's VERSION may become a release tag. The pull-request check and the
# tagging workflow both use this, so they cannot disagree (change: version-discipline-and-auto-release).
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
usage() {
  printf 'Usage: tools/release-tag.sh check [COMMIT]\n'
  printf '       tools/release-tag.sh plan [--base BASE | --no-base] [COMMIT]\n'
  printf '\n'
  printf 'check  fail unless COMMIT'"'"'s VERSION is MAJOR.MINOR.PATCH, untagged, greater than every\n'
  printf '       v* release tag, and has a nonempty CHANGELOG.md section.\n'
  printf 'plan   print tag=v<VERSION>, or skip=unchanged when VERSION equals BASE'"'"'s (default: the\n'
  printf '       first parent), or skip=tagged when v<VERSION> exists. Otherwise run check.\n'
}
fail() { printf 'release-tag: %s\n' "$*" >&2; exit 1; }

# Read VERSION from a commit and reject anything but plain MAJOR.MINOR.PATCH.
version_at() {
  local value
  value=$(git show "$1:VERSION" 2>/dev/null) || fail "no VERSION in $1"
  printf '%s\n' "$value" | LC_ALL=C grep -Eq '^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$' ||
    fail "VERSION '$value' in $1 is not MAJOR.MINOR.PATCH"
  printf '%s\n' "$value"
}

# Succeed when version $1 is numerically greater than version $2, component by component.
greater() {
  local IFS=.
  local -a a=($1) b=($2)
  local i
  for i in 0 1 2; do
    if [ "${a[$i]}" -gt "${b[$i]}" ]; then return 0; fi
    if [ "${a[$i]}" -lt "${b[$i]}" ]; then return 1; fi
  done
  return 1
}

tagged() { git rev-parse -q --verify "refs/tags/v$1" > /dev/null; }

check() {
  local commit=$1 version latest="" tag count=0
  version=$(version_at "$commit")
  if tagged "$version"; then fail "v$version is already tagged; choose a version greater than it"; fi
  # Only plain release tags take part; a tag such as v0.2.0-rc.1 is not a release to advance past.
  while IFS= read -r tag; do
    count=$((count + 1))
    if [ -z "$latest" ] || greater "${tag#v}" "${latest#v}"; then latest=$tag; fi
  done < <(git tag -l 'v*' | LC_ALL=C grep -E '^v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$' || true)
  vsay "check $commit: $count release tags, latest ${latest:-none}"
  if [ -n "$latest" ] && ! greater "$version" "${latest#v}"; then
    fail "VERSION $version does not advance past release tag $latest"
  fi
  git show "$commit:CHANGELOG.md" 2>/dev/null |
    awk -v version="$version" -f tools/changelog-section.awk > /dev/null ||
    fail "missing or empty CHANGELOG.md section for $version"
  say "check $commit VERSION $version -> v$version  [latest release ${latest:-none}, changelog section present]"
}

if [ "${1:-}" = --help ] || [ "${1:-}" = -h ]; then usage; exit 0; fi
[ "$#" -ge 1 ] || { usage >&2; exit 2; }
command=$1
shift
case "$command" in
  check)
    [ "$#" -le 1 ] || { usage >&2; exit 2; }
    commit=$(git rev-parse --verify "${1:-HEAD}^{commit}") || fail "unknown commit ${1:-HEAD}"
    check "$commit"
    ;;
  plan)
    base=parent
    while [ "$#" -gt 0 ]; do
      case "$1" in
        --base) [ "$#" -ge 2 ] || { usage >&2; exit 2; }; base=$2; shift 2 ;;
        --no-base) base=""; shift ;;
        -*) printf 'release-tag: plan: unknown option %s\n' "$1" >&2; usage >&2; exit 2 ;;
        *) break ;;
      esac
    done
    [ "$#" -le 1 ] || { usage >&2; exit 2; }
    commit=$(git rev-parse --verify "${1:-HEAD}^{commit}") || fail "unknown commit ${1:-HEAD}"
    version=$(version_at "$commit")
    if [ "$base" = parent ]; then
      base=$(git rev-parse -q --verify "$commit^1" || true)
    fi
    if [ -n "$base" ]; then
      base=$(git rev-parse --verify "$base^{commit}") || fail "unknown base commit $base"
      if [ "$(git show "$base:VERSION" 2>/dev/null || true)" = "$version" ]; then
        say "plan $commit -> skip  [VERSION $version unchanged since $base]"
        printf 'skip=unchanged\n'
        exit 0
      fi
    fi
    if tagged "$version"; then
      say "plan $commit -> skip  [v$version already tagged at $(git rev-parse "refs/tags/v$version^{commit}")]"
      printf 'skip=tagged\n'
      exit 0
    fi
    check "$commit"
    say "plan $commit -> v$version"
    printf 'tag=v%s\n' "$version"
    ;;
  *) printf 'release-tag: unknown command %s\n' "$command" >&2; usage >&2; exit 2 ;;
esac
