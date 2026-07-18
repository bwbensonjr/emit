#!/usr/bin/env bash
# modules-run-tests.sh -- the module RUN door (change: run-door-user-libraries).
# Chez-FREE: drives the shipped `emit run`, which registers the baked-in
# (scheme base), preloads the manifest's user libraries into the JIT (without running
# their __init), then compiles the whole program against them via the mode-dispatched
# embedded compiler and runs it in-process.  This is the third module door, at parity
# with the AOT and REPL doors.
#
# The final section (dev->ship fidelity vs the AOT door) is Chez-GATED: it compares the
# run-door value and program-module bytes to the Chez AOT driver's.
#
# Run from the repo root:  test/modules-run-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

MOD=test/modules
MAN="$MOD/emit-libs.scm"
RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

check () {  # <name> <src> <expected>
  local name="$1" src="$2" want="$3"
  local got; got="$($RUN --manifest "$MAN" < "$src" 2>"$TMP/$name.err")"
  if [ "$got" = "$want" ]; then echo "  [OK  ] $name => $got"; pass=$((pass+1))
  else echo "  [FAIL] $name => $got  (expected $want)"; sed 's/^/         /' "$TMP/$name.err"; fail=$((fail+1)); fi
}

# assert a run FAILS (non-zero) and its diagnostic matches a regex
check_fail () {  # <name> <src> <manifest> <regex>
  local name="$1" src="$2" man="$3" re="$4"
  if $RUN --manifest "$man" < "$src" >"$TMP/$name.out" 2>"$TMP/$name.err"; then
    echo "  [FAIL] $name  (expected non-zero exit, but it succeeded)"; fail=$((fail+1)); return
  fi
  if grep -qE "$re" "$TMP/$name.err"; then
    echo "  [OK  ] $name  (failed as expected)"; pass=$((pass+1))
  else
    echo "  [FAIL] $name  (failed, but not matching /$re/)"; sed 's/^/         /' "$TMP/$name.err"; fail=$((fail+1))
  fi
}

echo "module run door (emit run, Chez-free)"
check run-import   "$MOD/prog-mylib.scm"   142   # import (mylib); greet -> 142
check run-chain    "$MOD/prog-chain.scm"    15   # (chain-a) -> (chain-b), transitive
check run-diamond  "$MOD/prog-diamond.scm"  35   # (dia-a)+(dia-b) both import (dia-c), once each
check run-rename   "$MOD/prog-rename.scm"   77   # (rename-lib): importer sees fmap

echo "run door: a plain program needs no manifest ((scheme base) is baked in)"
RUNABS="$PWD/build/emit"
plain="$TMP/plain.scm"; printf '(map (lambda (x) (* x x)) (list 1 2 3))\n' > "$plain"
got="$(cd "$TMP" && "$RUNABS" run < plain.scm 2>/dev/null)"    # run from a dir with NO manifest present
if [ "$got" = "(1 4 9)" ]; then echo "  [OK  ] run-no-manifest => $got"; pass=$((pass+1))
else echo "  [FAIL] run-no-manifest => $got  (expected (1 4 9))"; fail=$((fail+1)); fi

echo "run door: import errors are reported and exit non-zero"
check_fail run-cycle   "$MOD/prog-cycle.scm"   "$MOD/emit-libs-cycle.scm" "cyclic|unresolved"
check_fail run-missing "$MOD/prog-missing.scm" "$MAN"                     "not found in the manifest"

# --- dev->ship fidelity vs the AOT door (Chez-gated) -----------------------
if command -v chez >/dev/null 2>&1; then
  echo "dev->ship fidelity: run door matches the AOT door"
  # a minimal manifest so both doors build exactly the program's closure (base + mylib)
  min="$TMP/min-libs.scm"
  printf '((library (scheme base) (source "lib/scheme/base.sld"))\n (library (mylib) (source "%s/mylib.sld")))\n' "$MOD" > "$min"

  # value parity
  chez --libdirs src --script src/compile.ss "$MOD/prog-mylib.scm" --manifest "$min" -o "$TMP/aot" >/dev/null 2>&1
  aot_val="$("$TMP/aot" 2>/dev/null)"
  run_val="$($RUN --manifest "$min" < "$MOD/prog-mylib.scm" 2>/dev/null)"
  if [ "$run_val" = "$aot_val" ] && [ "$run_val" = "142" ]; then
    echo "  [OK  ] value-parity  (run=$run_val aot=$aot_val)"; pass=$((pass+1))
  else
    echo "  [FAIL] value-parity  (run=$run_val aot=$aot_val)"; fail=$((fail+1))
  fi

  # program-module byte-identity (modulo the driver's target header, which the
  # embedded --emit omits by convention -- clang supplies the triple).
  $RUN --manifest "$min" --emit < "$MOD/prog-mylib.scm" > "$TMP/run.emit"
  awk -v d="$TMP" 'BEGIN{n=0;f=sprintf("%s/ru.%02d.ll",d,0)}
     /^; ==EMIT-UNIT-BOUNDARY==$/{n++;f=sprintf("%s/ru.%02d.ll",d,n);next}{print > f}' "$TMP/run.emit"
  run_prog="$(ls "$TMP"/ru.*.ll | tail -1)"
  grep -v '^target datalayout\|^target triple' "$TMP/aot.ll" > "$TMP/aot.noheader.ll"
  if cmp -s "$run_prog" "$TMP/aot.noheader.ll"; then
    echo "  [OK  ] program-module byte-identical to AOT (modulo target header)"; pass=$((pass+1))
  else
    echo "  [FAIL] program-module differs from AOT"; fail=$((fail+1))
  fi
else
  echo "chez not found -- skipping AOT-fidelity comparison."
fi

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
