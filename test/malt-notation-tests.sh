#!/usr/bin/env bash
# Focused mathematical notation acceptance, shared with installed-library checks.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain Malt notation diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
COMMON=(--no-manifest-chain --manifest "$ROOT/emit-libs.scm" -L "$ROOT/lib" -L "$ROOT/test/malt-reference")
SOURCE="$ROOT/test/malt-reference/notation.scm"
EMIT="$ROOT/build/emit"
check_output() {
  if [ "$(awk 'NF {last=$0} END {print last}' "$1")" != '(malt-notation 48)' ]; then
    cat "$1" >&2
    say "fail Malt notation -> $1 [expected 48 assertions]"
    exit 1
  fi
}
if [ "${1:-}" = --source ]; then
  command -v chez >/dev/null
  say "compile $SOURCE -> $TMP/source [Chez source driver]"
  chez --libdirs src --script src/compile.ss "$SOURCE" "${COMMON[@]}" -o "$TMP/source" \
    > "$TMP/compile.out" 2> "$TMP/compile.err" || { cat "$TMP/compile.err" >&2; exit 1; }
  "$TMP/source" > "$TMP/source.out"
  check_output "$TMP/source.out"
elif [ "$#" = 0 ]; then
  for mode in run repl build; do
    say "test $SOURCE -> $TMP/$mode.out [native $mode, 48 assertions]"
    case "$mode" in
      run) "$EMIT" run "${COMMON[@]}" "$SOURCE" > "$TMP/run.out" 2> "$TMP/run.err" ;;
      repl) "$EMIT" repl "${COMMON[@]}" < "$SOURCE" > "$TMP/repl.out" 2> "$TMP/repl.err" ;;
      build)
        "$EMIT" build "${COMMON[@]}" "$SOURCE" -o "$TMP/notation" > "$TMP/compile.out" 2> "$TMP/build.err"
        (cd "$TMP" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST PATH=/usr/bin:/bin ./notation) > "$TMP/build.out" ;;
    esac || { cat "$TMP/$mode.err" >&2; exit 1; }
    check_output "$TMP/$mode.out"
  done
else
  say "usage: test/malt-notation-tests.sh [--source]"
  exit 2
fi
for name in ext1-∇ ext2-∇; do
  printf '(import (only (malt learner) %s))\n' "$name" > "$TMP/unsupported.scm"
  say "reject $name -> unavailable export diagnostic [1 import]"
  if [ "${1:-}" = --source ]; then
    COMMAND=(chez --libdirs src --script src/compile.ss)
  else
    COMMAND=("$EMIT" run)
  fi
  if "${COMMAND[@]}" "${COMMON[@]}" "$TMP/unsupported.scm" > "$TMP/reject.out" 2> "$TMP/reject.err"; then
    say "fail $name -> unsupported export accepted"
    exit 1
  fi
  grep -Fq "$name" "$TMP/reject.err"
done
say "verify Malt notation -> complete [48 assertions per execution path, 2 rejected exports]"
