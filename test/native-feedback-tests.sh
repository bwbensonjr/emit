#!/usr/bin/env bash
# Focused native feedback, not a substitute for the complete regression inventory.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
say "test committed native compiler -> focused execution paths"
make all >/dev/null
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
emit="$PWD/build/emit"
export EMIT_VERBOSITY=quiet
cat > "$work/closure.scm" <<'SCHEME'
(import (scheme base) (scheme write))
(define (adder x) (lambda (y) (+ x y)))
(define result ((adder 19) 23))
(display result)
(newline)
SCHEME
[ "$("$emit" run "$work/closure.scm")" = 42 ]
"$emit" build "$work/closure.scm" -o "$work/closure"
[ "$("$work/closure")" = 42 ]
printf '(define counter 1)\n(set! counter (+ counter 41))\ncounter\n' \
  | "$emit" repl > "$work/repl.out"
grep -Eq '(^|[[:space:]])42[[:space:]]*$' "$work/repl.out"
"$emit" lib test/release-smoke.sld -o "$work/artifacts"
[ -s "$work/artifacts/release-smoke.ll" ]
# An error runs in its own process: the subsequent success proves no worker or
# shell accidentally treats the negative fixture as a successful compilation.
printf '(import (scheme base))\n(car 1)\n' > "$work/error.scm"
if "$emit" run "$work/error.scm" > "$work/error.out" 2> "$work/error.err"; then
  echo 'test: invalid car unexpectedly succeeded' >&2
  exit 1
fi
[ -s "$work/error.err" ]
[ "$("$emit" run "$work/closure.scm")" = 42 ]
printf 'test: focused native feedback passed [6 assertions, %ss]\n' "$SECONDS" >&2
