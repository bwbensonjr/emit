#!/usr/bin/env bash
# Package only committed, explicitly selected source inputs.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
usage() { printf 'Usage: tools/release-source.sh COMMIT OUTPUT_DIRECTORY [TAG]\n'; }
if [ "${1:-}" = --help ]; then usage; exit 0; fi
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then usage >&2; exit 2; fi
commit=$(git rev-parse --verify "$1^{commit}")
output=$2
version=$(git show "$commit:VERSION")
if ! printf '%s\n' "$version" | LC_ALL=C grep -Eq '^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-(0|[1-9][0-9]*|[0-9A-Za-z-]*[A-Za-z-][0-9A-Za-z-]*)(\.(0|[1-9][0-9]*|[0-9A-Za-z-]*[A-Za-z-][0-9A-Za-z-]*))*)?(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$'; then
  printf 'release: invalid VERSION in %s\n' "$commit" >&2; exit 1
fi
tag=${3:-v$version}
if [ "$tag" != "v$version" ]; then
  printf 'release: tag %s does not match VERSION %s\n' "$tag" "$version" >&2; exit 1
fi
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
say "check $commit -> $tag release identity"
git show "$commit:CHANGELOG.md" > "$work/changelog"
awk -v version="$version" '
  /^## / { if (found) exit; if ($0 == "## [" version "]" || $0 == "## " version || index($0, "## [" version "] - ") == 1) { found=1; next } }
  found { print; if ($0 ~ /[^[:space:]]/) content=1 }
  END { if (!found || !content) exit 1 }
' "$work/changelog" > "$work/RELEASE-NOTES.md" || { printf 'release: missing or empty changelog section for %s\n' "$version" >&2; exit 1; }
# Keep developer account configuration and unrelated history out of the payload.
# A missing required path fails git archive, rather than reducing the closure.
inputs=(VERSION CHANGELOG.md LICENSE LLVM.md Makefile README.md AGENTS.md CLAUDE.md
  bootstrap demos docs emit-libs.scm lib run-all-tests.sh run-dev-tests.sh src test tools vendor)
if git ls-tree -r "$commit" -- "${inputs[@]}" | grep -q '^160000 '; then
  printf 'release: submodule inputs are not supported\n' >&2; exit 1
fi
archive="emit-$version.tar.gz"
say "archive $commit -> $output/$archive"
git -c core.attributesFile=/dev/null archive --format=tar --prefix="emit-$version/" "$commit" -- "${inputs[@]}" | gzip -n -9 > "$work/$archive"
(cd "$work" && shasum -a 256 "$archive" > SHA256SUMS)
tools/release-check.sh "$work"
mkdir -p "$output"
# A local retry follows the same immutable-payload rule as publication.
for asset in "$archive" SHA256SUMS RELEASE-NOTES.md; do
  if [ -e "$output/$asset" ]; then
    cmp "$work/$asset" "$output/$asset" || { printf 'release: existing asset differs: %s\n' "$output/$asset" >&2; exit 1; }
  else
    cp "$work/$asset" "$output/$asset"
  fi
done
say "package $commit -> $output/$archive  [$(bytes "$output/$archive") bytes, ${SECONDS}s]"
