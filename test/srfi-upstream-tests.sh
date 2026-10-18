#!/usr/bin/env bash
# Execute pinned upstream suites unchanged, checking runner results and status.
# EMIT_SNOW_HOST=chez tests compiler-source edits before the regen barrier.
set -uo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
HOST="${EMIT_SNOW_HOST:-both}"
EMIT="$ROOT/build/emit"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
export EMIT_CACHE="$TMP/cache"
pass=0; fail=0
ok () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }
case "$HOST" in
  chez) hosts=(chez) ;;
  native) hosts=(run build repl) ;;
  both)
    hosts=(run build repl)
    if command -v chez >/dev/null; then hosts+=(chez); fi ;;
  *) echo "EMIT_SNOW_HOST must be chez, native, or both" >&2; exit 2 ;;
esac
if [ "$HOST" != chez ]; then make emit >/dev/null || exit 1; fi
COMMON=(--manifest "$ROOT/emit-libs.scm" --no-manifest-chain -L "$ROOT/lib")

write_driver () { # destination suite source
  # Upstream imports remain byte-identical; overlapping re-exports denote the
  # same original bindings and need no precedence rule.
  printf '%s\n' \
    '(import (srfi 1) (scheme base) (scheme file) (scheme write) (scheme process-context) (srfi 64))' \
    "(define acceptance-suite \"$2\")" \
    "(include \"$ROOT/test/snow/acceptance-runner.scm\")" \
    "(include \"$3\")" > "$1"
}

run_driver () { # host driver stem
  local host="$1" driver="$2" stem="$3" status
  export EMIT_SNOW_RESULTS="$stem.results"
  case "$host" in
    chez)
      chez --libdirs src --script src/compile.ss "$driver" \
        --manifest "$ROOT/emit-libs.scm" -L "$ROOT/lib" -o "$stem.exe" \
        >"$stem.compile.out" 2>"$stem.compile.err"
      status=$?
      printf '%s\n' "$status" > "$stem.compile.status"
      [ "$status" -eq 0 ] || return "$status"
      "$stem.exe" >"$stem.out" 2>"$stem.err" ;;
    run)
      "$EMIT" run "$driver" "${COMMON[@]}" >"$stem.out" 2>"$stem.err" ;;
    repl)
      "$EMIT" repl "${COMMON[@]}" < "$driver" >"$stem.out" 2>"$stem.err" ;;
    build)
      "$EMIT" build "$driver" "${COMMON[@]}" -o "$stem.exe" \
        >"$stem.compile.out" 2>"$stem.compile.err"
      status=$?
      printf '%s\n' "$status" > "$stem.compile.status"
      [ "$status" -eq 0 ] || return "$status"
      mkdir -p "$TMP/delivered"
      mv "$stem.exe" "$TMP/delivered/$(basename "$stem").exe" || return 1
      (cd "$TMP/delivered" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST \
        PATH=/usr/bin:/bin "./$(basename "$stem").exe") >"$stem.out" 2>"$stem.err" ;;
  esac
  status=$?
  printf '%s\n' "$status" > "$stem.status"
  return "$status"
}

valid_results () { # stem expected complete datum
  [ -f "$1.results" ] && [ "$(<"$1.results")" = "$2" ]
}

echo "complete upstream SRFI suites [hosts=$HOST]"
bash test/snow-provenance-tests.sh || exit 1
for number in 1 2 8 227 64; do
  case "$number" in
    1) version=0.1.3; counts='147 0 0 0 0 0' ;;
    2) version=0.1.1; counts='29 0 0 0 0 0' ;;
    8) version=0.1.2; counts='2 0 0 0 0 0' ;;
    227) version=0.1.3; counts='13 0 0 0 0 0' ;;
    # Two expected-failure declarations are part of the pristine self-test.
    64) version=0.1.7; counts='47 0 0 2 0 0' ;;
  esac
  suite="srfi-$number"
  source="$ROOT/test/snow/packages/$suite-$version/test.scm"
  write_driver "$TMP/$suite.scm" "$suite" "$source"
  for host in "${hosts[@]}"; do
    stem="$TMP/$suite-$host"
    start=$SECONDS
    say "run $source -> $stem.results [host=$host]"
    if run_driver "$host" "$TMP/$suite.scm" "$stem" && \
       valid_results "$stem" "(complete \"$suite\" $counts)"; then
      ok "$suite [$host] $counts [$((SECONDS-start))s]"
    else
      bad "$suite [$host] incomplete or unexpected results"
      for suffix in compile.err compile.status out err status results; do
        if [ -f "$stem.$suffix" ]; then
          printf '         %s:\n' "$suffix"
          sed 's/^/         /' "$stem.$suffix"
        fi
      done
    fi
  done
done

# Both children exit 0. The result check must still reject failure or absence.
for control in intentional-failure missing-completion; do
  write_driver "$TMP/$control.scm" intentional "$ROOT/test/snow/$control.scm"
  for host in "${hosts[@]}"; do
    stem="$TMP/$control-$host"
    if ! run_driver "$host" "$TMP/$control.scm" "$stem"; then
      bad "$control [$host] could not exercise successful-exit control"
      cat "$stem.err" "$stem.compile.err" 2>/dev/null
    elif valid_results "$stem" '(complete "intentional" 1 0 0 0 0 0)'; then
      bad "$control [$host] accepted invalid completion"
    elif [ "$control" = intentional-failure ] && \
         ! valid_results "$stem" '(complete "intentional" 0 1 0 0 0 0)'; then
      bad "$control [$host] lost failed assertion evidence"
    elif [ "$control" = missing-completion ] && [ -s "$stem.results" ]; then
      bad "$control [$host] fabricated completion"
    else
      ok "$control [$host] rejected despite exit 0"
    fi
  done
done

# A correct completion datum cannot override a nonzero process status.
write_driver "$TMP/nonzero-status.scm" intentional "$ROOT/test/snow/nonzero-status.scm"
for host in "${hosts[@]}"; do
  stem="$TMP/nonzero-status-$host"
  if run_driver "$host" "$TMP/nonzero-status.scm" "$stem"; then
    bad "nonzero-status [$host] accepted failing child"
  elif [ -f "$stem.status" ] && [ "$(<"$stem.status")" = 7 ] && \
       valid_results "$stem" '(complete "intentional" 1 0 0 0 0 0)'; then
    ok "nonzero-status [$host] rejected despite passing counts"
  else
    bad "nonzero-status [$host] lost status or completion evidence"
    cat "$stem.err" "$stem.compile.err" "$stem.status" "$stem.results" 2>/dev/null
  fi
done
echo "upstream SRFIs: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
