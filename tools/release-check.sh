#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
if [ "${1:-}" = --help ]; then printf 'Usage: tools/release-check.sh ASSET_DIRECTORY\n'; exit 0; fi
if [ "$#" != 1 ]; then printf 'Usage: tools/release-check.sh ASSET_DIRECTORY\n' >&2; exit 2; fi
assets=$(cd "$1" && pwd -P)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
# Accept exactly one checksum entry with a safe, versioned filename.
[ "$(wc -l < "$assets/SHA256SUMS" | tr -d ' ')" = 1 ]
LC_ALL=C grep -Eq '^[0-9a-f]{64}  emit-(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-(0|[1-9][0-9]*|[0-9A-Za-z-]*[A-Za-z-][0-9A-Za-z-]*)(\.(0|[1-9][0-9]*|[0-9A-Za-z-]*[A-Za-z-][0-9A-Za-z-]*))*)?(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?\.tar\.gz$' "$assets/SHA256SUMS"
archive=$(sed 's/^[^ ]*  //' "$assets/SHA256SUMS")
say "verify $assets/SHA256SUMS -> $archive"
if ! (cd "$assets" && shasum -a 256 -c SHA256SUMS > "$work/checksum.log" 2>&1); then
  sed 's/^/release: /' "$work/checksum.log" >&2
  exit 1
fi
root=${archive%.tar.gz}
tar -tzf "$assets/$archive" > "$work/files"
awk -v root="$root/" 'index($0, root) != 1 || /(^|\/)\.\.(\/|$)/ || /(^|\/)(\.git|build|\.cache)(\/|$)/ { bad=1 } END { exit bad }' "$work/files"
for input in VERSION CHANGELOG.md LICENSE Makefile AGENTS.md CLAUDE.md bootstrap/embed.ll bootstrap/embed-repl.ll bootstrap/schemec.ll bootstrap/scheme.base.ll bootstrap/emit.internal.ll src/emit.cpp src/runtime/runtime.c tools/llvm-env.sh tools/log.sh emit-libs.scm lib/scheme/base.sld lib/scheme/inexact.sld vendor/unicode/17.0.0/LICENSE.txt; do
  grep -Fx "$root/$input" "$work/files" >/dev/null || { printf 'release: missing %s\n' "$input" >&2; exit 1; }
done
version=$(tar -xOf "$assets/$archive" "$root/VERSION")
[ "$root" = "emit-$version" ]
# Corruption must be rejected by the same checksum verifier.
cp "$assets/$archive" "$work/$archive"
cp "$assets/SHA256SUMS" "$work/SHA256SUMS"
printf 'corrupt\n' >> "$work/$archive"
if (cd "$work" && shasum -a 256 -c SHA256SUMS >/dev/null 2>&1); then
  printf 'release: corrupted archive passed checksum verification\n' >&2; exit 1
fi
say "check $assets/$archive -> source closure  [$(wc -l < "$work/files" | tr -d ' ') entries, corruption rejected]"
