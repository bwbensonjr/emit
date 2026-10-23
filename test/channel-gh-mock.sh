#!/usr/bin/env bash
# Minimal `gh pr` fixture for tools/channel-promote.sh tests: records pull requests per head branch.
set -euo pipefail
state=${CHANNEL_TEST_GH:?}
[ "$1" = pr ]; shift
operation=$1; shift
repo="" head="" title=""
while [ "$#" -gt 0 ]; do
  case "$1" in
    --repo) repo=$2; shift 2 ;;
    --head) head=$2; shift 2 ;;
    --title) title=$2; shift 2 ;;
    --body|--state|--json|--jq) shift 2 ;;
    *) printf 'unexpected gh argument: %s\n' "$1" >&2; exit 2 ;;
  esac
done
record="$state/$(printf '%s' "$repo/$head" | tr '/' '_')"
case "$operation" in
  list) [ -f "$record" ] && printf 'https://github.com/%s/pull/1\n' "$repo" || true ;;
  create)
    [ ! -f "$record" ] || { printf 'gh: a pull request for %s already exists\n' "$head" >&2; exit 1; }
    printf '%s\n' "$title" > "$record"
    printf 'https://github.com/%s/pull/1\n' "$repo"
    ;;
  *) printf 'unexpected gh pr operation: %s\n' "$operation" >&2; exit 2 ;;
esac
