#!/usr/bin/env bash
# Assemble declared baked library files into a Scheme source-string definition.
# The compiler parses and validates the named define-library forms at runtime.
set -eu
cd "$(dirname "$0")/.."

usage() {
  echo "Usage: bash tools/bake-libraries.sh GENERATED_ROOT OUTPUT_FILE [--declaration PATH] [-q|-v]"
}
declaration=src/prelude-surface.scm
arguments=()
while [ "$#" -gt 0 ]; do
  case "$1" in
    --help|-h) usage; exit 0 ;;
    --declaration)
      [ "$#" -ge 2 ] || { echo "bake-libraries: missing argument for $1" >&2; exit 2; }
      declaration=$2; shift 2 ;;
    -q) export EMIT_VERBOSITY=quiet; shift ;;
    -v) export EMIT_VERBOSITY=verbose; shift ;;
    -*) echo "bake-libraries: unknown option $1" >&2; usage >&2; exit 2 ;;
    *) arguments+=("$1"); shift ;;
  esac
done
[ "${#arguments[@]}" = 2 ] || { usage >&2; exit 2; }
root=${arguments[0]%/}
output=${arguments[1]}
. tools/log.sh
[ -f "$declaration" ] || { echo "bake-libraries: missing declaration $declaration" >&2; exit 1; }

# Match the inventory's complete declaration block before reading destinations.
# A formatter may wrap an entry between its baked flag, imports, and path.
paths=$(awk '
  !grab && /\(define \*prelude-libraries\*/ { grab = 1 }
  grab {
    line = $0; sub(/;.*/, "", line)
    block = block " " line
    depth += gsub(/\(/, "(", line) - gsub(/\)/, ")", line)
    if (depth == 0) {
      while (match(block, /"[^"]+"/)) {
        prefix = substr(block, 1, RSTART - 1)
        path = substr(block, RSTART + 1, RLENGTH - 2)
        if (prefix ~ /[[:space:]]#t[[:space:]]/) print path
        block = substr(block, RSTART + RLENGTH)
      }
      exit
    }
  }' "$declaration")
[ -n "$paths" ] || { echo "bake-libraries: no baked paths declared in $declaration" >&2; exit 1; }

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
count=0
while IFS= read -r path; do
  [ -n "$path" ] || continue
  file="$root/$path"
  [ -f "$file" ] || { echo "bake-libraries: missing generated member $path under $root" >&2; exit 1; }
  # Drop only whole-line comments. Semicolons inside source strings stay intact.
  awk '!/^[[:space:]]*;/' "$file" >> "$tmp"
  printf '\n' >> "$tmp"
  count=$((count + 1))
done <<EOF
$paths
EOF

{
  printf '(define *baked-library-source* "'
  sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' "$tmp"
  printf '")\n'
} > "$output"
say "bake $count declared library source(s) from $root -> $output [$(bytes "$output") bytes]"
