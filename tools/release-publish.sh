#!/usr/bin/env bash
# Run only after the workflow validates these exact downloaded assets.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
if [ "${1:-}" = --help ]; then printf 'Usage: tools/release-publish.sh TAG ASSET_DIRECTORY\n'; exit 0; fi
if [ "$#" != 2 ]; then printf 'Usage: tools/release-publish.sh TAG ASSET_DIRECTORY\n' >&2; exit 2; fi
tag=$1
assets=$(cd "$2" && pwd -P)
version=$(< VERSION)
[ "$tag" = "v$version" ]
[ "$(git rev-parse "refs/tags/$tag^{commit}")" = "$(git rev-parse HEAD)" ]
tools/release-check.sh "$assets"
archive="emit-$version.tar.gz"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
say "prepare $assets -> GitHub release $tag"
if gh release view "$tag" --json isDraft,body,assets > "$work/release.json"; then
  draft=$(jq -r .isDraft "$work/release.json")
  jq -r .body "$work/release.json" > "$work/remote-notes"
  # GitHub normalizes trailing newlines in notes.
  [ "$(< "$work/remote-notes")" = "$(< "$assets/RELEASE-NOTES.md")" ] || { printf 'release: existing notes differ\n' >&2; exit 1; }
  for asset in "$archive" SHA256SUMS; do
    if jq -e --arg name "$asset" '.assets[] | select(.name == $name)' "$work/release.json" >/dev/null; then
      gh release download "$tag" --pattern "$asset" --dir "$work"
      cmp "$work/$asset" "$assets/$asset" || { printf 'release: public asset differs: %s\n' "$asset" >&2; exit 1; }
    elif [ "$draft" = true ]; then
      gh release upload "$tag" "$assets/$asset"
    else
      printf 'release: published release is missing %s; refusing mutation\n' "$asset" >&2; exit 1
    fi
  done
  if [ "$draft" = false ]; then
    say "verify $tag -> existing publication preserved  [2 matching assets]"
    exit 0
  fi
else
  gh release create "$tag" "$assets/$archive" "$assets/SHA256SUMS" \
    --verify-tag --draft --title "Emit $version" --notes-file "$assets/RELEASE-NOTES.md"
fi
# Verify the stored bytes while still draft, before making anything public.
mkdir "$work/uploaded"
gh release download "$tag" --pattern "$archive" --pattern SHA256SUMS --dir "$work/uploaded"
cmp "$assets/$archive" "$work/uploaded/$archive"
cmp "$assets/SHA256SUMS" "$work/uploaded/SHA256SUMS"
say "publish validated $tag -> public source release  [2 verified assets]"
gh release edit "$tag" --draft=false
