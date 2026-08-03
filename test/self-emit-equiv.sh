#!/usr/bin/env bash
# Self-emission equivalence (fix-emit-eval-order): the IR that the native
# `schemec` emits for a program MUST be byte-identical to the IR the Chez-hosted
# compiler emits for it.  Both compile the raw source with no prelude and no
# target header (`--emit-ir --no-prelude` vs the schemec filter), so any
# difference is a self-application divergence in the emitter -- e.g. temp
# ordering from host argument-evaluation order.  Requires build/schemec
# (`make build/schemec`).  Run from the repo root: test/self-emit-equiv.sh
set -u
cd "$(dirname "$0")/.."

if [ ! -x build/schemec ]; then
  echo "  build/schemec missing -- run: make build/schemec" >&2
  exit 1
fi

pass=0; fail=0

check () {  # name  source-text
  local name="$1" src="$2"
  local ref sc
  ref="$(printf '%s' "$src" | chez --libdirs src --script src/compile.ss --emit-ir --no-prelude 2>/dev/null)"
  sc="$(printf '%s'  "$src" | build/schemec 2>/dev/null)"
  if [ "$ref" = "$sc" ]; then
    echo "  [OK  ] $name (byte-identical)"; pass=$((pass+1))
  else
    echo "  [FAIL] $name (schemec IR differs from Chez-hosted)"; fail=$((fail+1))
  fi
}

echo "self-emission equivalence (schemec IR == Chez-hosted IR)"
check plain-call  '(letrec ([f (lambda (a b) (+ a b))]) (f 3 4))'
check nested-call '(letrec ([g (lambda (x) (* x 2))] [f (lambda (y) (+ y 1))]) (f (g 5)))'
check closure-cap '(letrec ([make (lambda (n) (lambda (x) (+ x n)))]) ((make 10) 5))'
check recursion   '(letrec ([fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))]) (fact 5))'
check apply       '(letrec ([f (lambda (a b) (+ a b))]) (apply f (quote (3 4))))'

# Flonum literals (change: numeric-conformance, design D1 / GitHub issue #24).
#
# This suite could not see #24: every case above is exact, and the emitter used to
# render a flonum literal with the HOST's number->string.  The two hosts print the
# same shortest-round-trip DIGITS with different framing -- Chez `100.0`/`1e15`/
# `5e-324|1` vs Emit's %g loop `1e+02`/`1e+15`/`5e-324` -- so the IR text diverged
# by door, and self-hosted the `1e+02` form was not even valid LLVM (an integer
# constant in a `double` position).  Byte equality here is the assertion that the
# canonical formatter, not the host printer, decides the text.
#
# The spread is chosen for the framing disagreements: an integral value (no '.' in
# Emit's output), the exponent threshold in both directions, a subnormal (where Chez
# appends `|BITS`), and a 17-significant-digit value.
check flo-boxed-integral  '(letrec ([f (lambda (x) x)]) (f 100.0))'
check flo-unboxed-exp     '(letrec ([f (lambda (x) (* x 2.0))]) (f 100.0))'
check flo-large           '(letrec ([f (lambda (x) (+ x 1.0))]) (f 1e15))'
check flo-huge            '(letrec ([f (lambda (x) (* x 10.0))]) (f 1e308))'
check flo-small           '(letrec ([f (lambda (x) (* x 1.0))]) (f 1e-7))'
check flo-tiny-positional '(letrec ([f (lambda (x) (* x 1.0))]) (f 0.000123))'
check flo-subnormal       '(letrec ([f (lambda (x) x)]) (f 5e-324))'
check flo-17-digits       '(letrec ([f (lambda (x) (* x 1.0))]) (f 1.4142135623730951))'
check flo-negative        '(letrec ([f (lambda (x) (+ x -2.5))]) (f -0.9))'
check flo-mixed-region    '(letrec ([f (lambda (x) (* (+ x 100.0) 1e15))]) (f 2.5))'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
