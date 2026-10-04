#!/usr/bin/env bash
# snow-package-tests.sh -- vendored snow-fort.org SRFI packages, compiled unmodified, on every
# compilation path (change: portable-library-surface, design D12).  See test/snow/README.md.
#
# One program (test/snow/smoke.scm) imports (srfi 8) and (srfi 2) from the conventional root
# test/snow/lib.  It must produce the same value through the Chez driver (when chez is
# installed), `emit run`, a delivered `emit build` executable, and `emit repl`.
#
# Run from anywhere:  test/snow-package-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$(pwd)"
SNOW="$ROOT/test/snow"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }
EMIT="$ROOT/build/emit"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

WANT='(1 (2 3) 10 #f 2 1 #t "(a \"b\")")'
SMOKE="$SNOW/smoke.scm"
COMMON=(--no-manifest-chain --manifest "$ROOT/emit-libs.scm" -L "$SNOW/lib")

expect () {  # <name> <got> <errfile>
  if [ "$2" = "$WANT" ]; then ok "$1 => $2"
  else bad "$1 => $2  (expected $WANT)"; tail -5 "$3" | sed 's/^/         /'; fi
}

echo "snow-fort packages, unmodified: (srfi 8) receive and (srfi 2) and-let*"

# the vendored sources are present (test/snow/README.md records their origin and digests)
for f in 8.sld 8.scm 2.sld 2.scm; do
  [ -s "$SNOW/lib/srfi/$f" ] || bad "vendored $f is missing"
done

got="$(cd "$TMP" && "$EMIT" run "${COMMON[@]}" "$SMOKE" 2>"$TMP/run.err")"
expect "emit run" "$got" "$TMP/run.err"

if (cd "$TMP" && "$EMIT" build "$SMOKE" "${COMMON[@]}" -o "$TMP/smoke" >"$TMP/build.out" 2>"$TMP/build.err"); then
  got="$("$TMP/smoke" 2>"$TMP/exe.err")"
  expect "emit build (delivered executable)" "$got" "$TMP/exe.err"
else
  bad "emit build (build failed)"; tail -5 "$TMP/build.err" | sed 's/^/         /'
fi

# The REPL prints every form's value; the program's last value is the line that matters.
got="$(cd "$TMP" && "$EMIT" repl "${COMMON[@]}" < "$SMOKE" 2>"$TMP/repl.err" | awk 'NF{v=$0} END{print v}')"
expect "emit repl" "$got" "$TMP/repl.err"

if command -v chez >/dev/null 2>&1; then
  if chez --libdirs src --script src/compile.ss "$SMOKE" --manifest "$ROOT/emit-libs.scm" \
       -L "$SNOW/lib" -o "$TMP/smoke-chez" >"$TMP/chez.build" 2>&1; then
    got="$("$TMP/smoke-chez" 2>"$TMP/chez.err")"
    expect "Chez driver" "$got" "$TMP/chez.err"
  else
    bad "Chez driver (build failed)"; tail -5 "$TMP/chez.build" | sed 's/^/         /'
  fi
else
  echo "  chez not found -- skipping the Chez driver."
fi

echo
echo "snow packages: $pass passed, $fail failed"
[ "$fail" = 0 ]
