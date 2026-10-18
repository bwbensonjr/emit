#!/usr/bin/env bash
# Minimal GitHub release fixture for the publication transaction tests.
set -euo pipefail
[ "$1" = release ]; shift
operation=$1; shift
tag=$1; shift
state=${RELEASE_TEST_REMOTE:?}
case "$operation" in
  view)
    [ -f "$state/status" ] || exit 1
    jq -n --argjson draft "$(< "$state/status")" --rawfile body "$state/notes" \
      --arg archive "emit-${tag#v}.tar.gz" '{isDraft: $draft, body: $body, assets: [{name: $archive}, {name: "SHA256SUMS"}]}'
    ;;
  create)
    [ ! -f "$state/status" ]
    cp "$1" "$2" "$state/"
    shift 2
    while [ "$#" -gt 0 ]; do
      case "$1" in
        --notes-file) cp "$2" "$state/notes"; shift 2 ;;
        --title) shift 2 ;;
        --verify-tag|--draft) shift ;;
        *) exit 2 ;;
      esac
    done
    printf 'true\n' > "$state/status"
    ;;
  download)
    patterns=()
    while [ "$#" -gt 0 ]; do
      case "$1" in
        --pattern) patterns+=("$2"); shift 2 ;;
        --dir) destination=$2; shift 2 ;;
        *) exit 2 ;;
      esac
    done
    for pattern in "${patterns[@]}"; do cp "$state/$pattern" "$destination/"; done
    ;;
  edit)
    [ "$1" = --draft=false ]
    printf 'false\n' > "$state/status"
    ;;
  *) printf 'unexpected release mutation: %s\n' "$operation" >&2; exit 2 ;;
esac
