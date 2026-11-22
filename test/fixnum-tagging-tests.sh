#!/usr/bin/env bash
# Negative and boundary fixnums through the C runtime with undefined behavior trapped (#188).
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/llvm-env.sh
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
start=$SECONDS
say "compile test/fixnum-tagging-host.c -> $TMP/host  [-fsanitize=undefined, trap mode]"
"$CC" -std=gnu11 -O1 -fsanitize=undefined -fsanitize-trap=undefined -I"$GC_INC" \
  test/fixnum-tagging-host.c -L"$GC_LIB" -lgc -lm -o "$TMP/host"
status=0
if [ "${EMIT_VERBOSITY:-default}" = verbose ] || [ "${EMIT_VERBOSITY:-}" = v ] || [ "${EMIT_VERBOSITY:-}" = 2 ]; then
  "$TMP/host" || status=$?
else
  "$TMP/host" 2> "$TMP/cases" || status=$?
fi
if [ "$status" != 0 ]; then
  [ -f "$TMP/cases" ] && cat "$TMP/cases" >&2
  if [ "$status" -gt 128 ]; then
    printf 'fixnum tagging: undefined behavior trapped (signal %d) in the last case above\n' $((status - 128)) >&2
  fi
  exit 1
fi
cases=$(grep -c '^  case ' "$TMP/cases" 2>/dev/null || true)
say "test fixnum tagging -> C runtime arithmetic  [${cases:-all} cases, no undefined behavior, $((SECONDS - start))s]"
