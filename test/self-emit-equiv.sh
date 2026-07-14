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

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
