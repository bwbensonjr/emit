#!/usr/bin/env bash
# modules-repl-tests.sh -- Stage 1 module REPL door (change:
# module-artifacts-vertical-slice).  Chez-FREE: drives the shipped build/repl-host,
# which preloads the manifest's libraries into the shared JITDylib and honors
# interactive (import (L)) by merging the unit's exports into the session scope.
#
# Run from the repo root:  test/modules-repl-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

export EMIT_MANIFEST=test/modules/emit-libs.scm
HOST=build/repl-host
make "$HOST" >/dev/null 2>&1 || { echo "failed to build $HOST"; exit 1; }

pass=0; fail=0
# feed <input> and grab the last non-empty stdout line (the final form's value)
run_last () { printf '%s' "$1" | "$HOST" 2>/dev/null | awk 'NF{v=$0} END{print v}'; }

check () {  # <name> <input> <expected-last-value>
  local got; got="$(run_last "$2")"
  if [ "$got" = "$3" ]; then echo "  [OK  ] $1 => $got"; pass=$((pass+1))
  else echo "  [FAIL] $1 => $got  (expected $3)"; fail=$((fail+1)); fi
}

echo "module vertical-slice (REPL door)"
check repl-import   $'(import (mylib))\n(greet)\n'                       142
check repl-both     $'(import (liba))\n(import (libb))\n(+ (a-val) (b-val))\n' 43
check repl-shadow   $'(import (mylib))\n(define (greet) 99)\n(greet)\n'  99

# an imported name is unbound until imported; the session must survive the error.
echo "unbound-before-import (session survives)"
errout="$(printf '(greet)\n(+ 2 3)\n' | "$HOST" 2>&1 >/dev/null)"   # stderr only
valout="$(printf '(greet)\n(+ 2 3)\n' | "$HOST" 2>/dev/null)"        # stdout only
if echo "$errout" | grep -q "unbound variable greet" && echo "$valout" | grep -qx "5"; then
  echo "  [OK  ] unbound-then-continue"; pass=$((pass+1))
else
  echo "  [FAIL] unbound-then-continue"; fail=$((fail+1))
fi

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
