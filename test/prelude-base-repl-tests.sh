#!/usr/bin/env bash
# prelude-base-repl-tests.sh -- Stage 3 (scheme base) auto-import, REPL door
# (change: module-prelude-scheme-base).  Chez-FREE: drives the shipped
# build/repl-host, which preloads (scheme base), auto-imports it into the session
# scope, and merges the derived-form macros -- so prelude procedures and macros work
# interactively with no prepended prelude.  --no-prelude yields an empty session.
#
# Run from the repo root:  test/prelude-base-repl-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

export EMIT_MANIFEST=test/modules/emit-libs.scm
HOST=build/repl-host
make "$HOST" >/dev/null 2>&1 || { echo "failed to build $HOST"; exit 1; }

pass=0; fail=0
run_last () { printf '%s' "$1" | "$HOST" 2>/dev/null | awk 'NF{v=$0} END{print v}'; }
check () {  # <name> <input> <expected>
  local got; got="$(run_last "$2")"
  if [ "$got" = "$3" ]; then echo "  [OK  ] $1 => $got"; pass=$((pass+1))
  else echo "  [FAIL] $1 => $got  (expected $3)"; fail=$((fail+1)); fi
}

echo "(scheme base) auto-import (REPL door)"
check repl-procs  $'(map (lambda (x) (* x x)) (filter (lambda (x) (> x 0)) (list -1 2 -3 4)))\n' "(4 16)"
check repl-case   $'(case 2 ((1) (quote one)) ((2) 2) (else (quote x)))\n'                       2
check repl-cond   $'(cond ((zero? 0) (quote z)) (else (quote n)))\n'                              z
check repl-shadow $'(define (map f xs) (quote mine))\n(map car (list))\n'                         mine

# --no-prelude: prelude names (procedure AND macro) unbound; primitives still work.
echo "--no-prelude REPL (empty session)"
np_proc_err="$(printf '(map (lambda (x) x) (list 1))\n' | "$HOST" --no-prelude 2>&1 >/dev/null)"
np_prim="$(printf '(+ 2 3)\n' | "$HOST" --no-prelude 2>/dev/null | awk 'NF{v=$0}END{print v}')"
if echo "$np_proc_err" | grep -q "unbound variable map" && [ "$np_prim" = "5" ]; then
  echo "  [OK  ] no-prelude  (map unbound; primitive + still works => 5)"; pass=$((pass+1))
else
  echo "  [FAIL] no-prelude  (map should be unbound; + should be 5, got $np_prim)"; fail=$((fail+1))
fi

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
