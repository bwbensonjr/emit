#!/usr/bin/env bash
# scheme-base-gen-check.sh -- guard that the committed partition .sld files are not stale
# (change: module-prelude-scheme-base, Stage 3; N members: scheme-base-partition).
#
# src/prelude.scm is the single source of truth for the standard library, and
# src/prelude-surface.scm's partition says which library each definition lands in.  The
# committed lib/**/*.sld files are GENERATED from those two by tools/gen-scheme-base.ss.
# This guard regenerates the WHOLE SET into a temp tree and diffs every member against
# its committed copy, failing if someone edited a source without regenerating (or
# hand-edited a generated file).  Chez-GATED (the generator runs under Chez).
#
# Every member is checked, not just (scheme base): a partition that emits N files can go
# stale in N places, and the substrate is the one whose contents move when a private
# helper is re-homed.
#
# Run from the repo root:  test/scheme-base-gen-check.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

if ! command -v chez >/dev/null 2>&1; then
  echo "chez not found -- skipping (scheme base) generation guard."; exit 0
fi

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
if ! chez --script tools/gen-scheme-base.ss "$TMP" >/dev/null 2>"$TMP/err"; then
  echo "  [FAIL] generator errored"
  sed 's/^/           /' "$TMP/err" | head -10
  exit 1
fi

# The declared member paths, from the declaration itself -- so adding a member to the
# partition extends this guard with no edit here.  Each is a repo-relative path in the
# fourth position of a *prelude-libraries* entry, i.e. the quoted string on its line.
paths="$(awk '
  !grab && /\(define \*prelude-libraries\*/ { grab = 1; next }
  grab {
    if (match($0, /"[^"]+"/)) print substr($0, RSTART + 1, RLENGTH - 2)
    if (index($0, "))")) grab = 0
  }' src/prelude-surface.scm)"

if [ -z "$paths" ]; then
  echo "  [FAIL] could not read the partition's member paths from src/prelude-surface.scm"
  exit 1
fi

pass=0; fail=0
for p in $paths; do
  if [ ! -f "$p" ]; then
    echo "  [FAIL] $p is declared by the partition but not committed"
    echo "         generate it with: chez --script tools/gen-scheme-base.ss"
    fail=$((fail+1)); continue
  fi
  if diff -q "$TMP/$p" "$p" >/dev/null 2>&1; then
    echo "  [OK  ] $p is in sync with src/prelude.scm"
    pass=$((pass+1))
  else
    echo "  [FAIL] $p is STALE vs src/prelude.scm"
    echo "         regenerate with: chez --script tools/gen-scheme-base.ss"
    diff "$p" "$TMP/$p" | sed 's/^/           /' | head -20
    fail=$((fail+1))
  fi
done

# A generated file nobody declares is an orphan from an earlier partition: it would still
# be installed and still resolve through the manifest, silently shipping a stale library.
declared=" $(echo $paths) "          # newline-separated -> space-delimited, for the match
for f in $(find lib -name '*.sld' | sort); do
  case "$declared" in
    *" $f "*) ;;
    *) if head -2 "$f" | grep -q 'GENERATED from src/prelude.scm'; then
         echo "  [FAIL] $f is generated but no longer declared by the partition (orphan)"
         fail=$((fail+1))
       fi ;;
  esac
done

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
