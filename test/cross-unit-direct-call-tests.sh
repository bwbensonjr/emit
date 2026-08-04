#!/usr/bin/env bash
# cross-unit-direct-call-tests.sh -- change: cross-unit-direct-calls.
#
# A call whose operator resolves to an imported library procedure of matching
# arity is lowered to a DIRECT call to that procedure's code label instead of
# loading a code pointer out of its closure.  This suite pins the emitted shape
# and the boundaries of the rule, on the shipped Chez-free doors:
#
#   * a fixed-arity import is direct-called, with the global still loaded and
#     passed as the callee's `self` (it carries the captured environment) and the
#     four-instruction code-pointer chain gone;
#   * each such label gets a `declare`, since it is defined in another unit;
#   * an ARITY MISMATCH stays indirect and still traps exactly as before -- the
#     easy thing to get wrong, since a direct call would bypass the callee's
#     entry arity check;
#   * a VARIADIC export is never direct-called (no label is recorded for one);
#   * a USER library gets the same treatment, not only (scheme base);
#   * program-unit code labels are untouched (still code_N) -- only LIBRARY
#     procedure labels are name-derived;
#   * redefining a library name at the REPL is still observed correctly: the
#     redefinition binds a fresh program global, so previously-compiled code keeps
#     direct-calling the library binding it captured.  This is the observable face
#     of the immutability argument the lowering rests on (design D4).
#
# Value-equivalence across all library usage is covered by the demo suites; this
# pins the codegen decision and its edges.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/cross-unit-direct-call-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
MAN=test/modules/emit-libs.scm
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# Emit a program's IR and keep only the PROGRAM module -- `emit run --emit` writes
# the (scheme base) unit, a boundary marker, then the program, and every assertion
# here is about the importing side.
prog_ir () {  # <src-text> [manifest] -> path to the program half
  local text="$1" man="${2:-}"
  printf '%s\n' "$text" > "$TMP/p.scm"
  if [ -n "$man" ]; then $RUN --manifest "$man" --emit < "$TMP/p.scm" > "$TMP/all.ll" 2>/dev/null
  else                  $RUN --emit < "$TMP/p.scm" > "$TMP/all.ll" 2>/dev/null; fi
  # the program is the LAST part: the baked standard library is a partition, so there is
  # one boundary marker per baked member and "from the first marker on" would include a
  # library (change: scheme-base-partition).
  awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n = 0; delete L; next } { L[++n] = $0 }
       END { for (i = 1; i <= n; i++) print L[i] }' "$TMP/all.ll" > "$TMP/prog.ll"
  echo "$TMP/prog.ll"
}

want   () { if grep -Eq "$3" "$2"; then ok "$1"; else bad "$1 (missing: $3)"; fi; }
reject () { if grep -Eq "$3" "$2"; then bad "$1 (present but should not be: $3)"; else ok "$1"; fi; }

echo "cross-unit direct-call IR-shape tests"

# --- a fixed-arity (scheme base) import is direct-called ---------------------
ll="$(prog_ir '(display (zero? 1))')"
want   "direct: call to the callee code label" "$ll" \
       'call fastcc i64 @"scheme\.base:code:zero\?"\(i64 %t[0-9]+,'
want   "direct: the global is still loaded (it carries the environment)" "$ll" \
       'load i64, ptr @"scheme\.base:zero\?"'
want   "direct: the label is declared external" "$ll" \
       '^declare fastcc i64 @"scheme\.base:code:zero\?"\(i64(, i64)+, ptr\)$'
# the four-instruction code-pointer chain must be gone from THIS call: nothing
# masks the loaded global on the line after it any more.
if grep -A1 'load i64, ptr @"scheme\.base:zero?"' "$ll" | grep -q 'and i64 .*, -8'; then
  bad "direct: code-pointer chain removed"
else
  ok  "direct: code-pointer chain removed"
fi

# --- arity mismatch: indirect, and still traps -------------------------------
ll="$(prog_ir '(display (zero? 1 2))')"
reject "arity mismatch: NOT direct-called" "$ll" \
       'call fastcc i64 @"scheme\.base:code:zero\?"'
want   "arity mismatch: still loads the code pointer" "$ll" \
       'call fastcc i64 ?%t[0-9]+\(i64 %t[0-9]+, i64 2,'
printf '(display (zero? 1 2))\n' > "$TMP/bad.scm"
if out="$($RUN "$TMP/bad.scm" 2>&1)"; then
  bad "arity mismatch: traps at run time (it did not)"
elif printf '%s' "$out" | grep -q "arity error"; then
  ok  "arity mismatch: traps at run time with an arity error"
else
  bad "arity mismatch: traps at run time (wrong diagnostic: $out)"
fi

# --- a variadic export records no label and stays indirect -------------------
ll="$(prog_ir '(display (list 1 2 3))')"
reject "variadic export: never direct-called" "$ll" 'call fastcc i64 @"scheme\.base:code:list"'

# --- program-unit labels are untouched ---------------------------------------
ll="$(prog_ir '(define (f a b) (+ a b)) (display (f 1 2)) (display (f 3 4))')"
want   "program unit: labels are still counter-derived" "$ll" '^define fastcc i64 @code_[0-9]+\('
reject "program unit: no name-derived label" "$ll" '^define fastcc i64 @"?[^"]*code:'

# --- a USER library gets the same treatment ----------------------------------
ll="$(prog_ir '(import (mylib)) (display (greet))' "$MAN")"
want   "user library: direct call to its export" "$ll" \
       'call fastcc i64 @"mylib:code:greet"\(i64 %t[0-9]+,'
want   "user library: the label is declared external" "$ll" \
       '^declare fastcc i64 @"mylib:code:greet"\(i64(, i64)+, ptr\)$'
got="$(printf '(import (mylib)) (greet)\n' | $RUN --manifest "$MAN" 2>/dev/null)"
[ "$got" = "142" ] && ok "user library: value unchanged (142)" || bad "user library: value $got"

# --- REPL redefinition still resolves to the captured binding (design D4) -----
# use-car captured (scheme base)'s car and must keep it; the redefined car is a
# fresh program global that later forms see.
out="$(printf '(define (use-car p) (car p))\n(define (car x) 99)\n(car (list 1 2))\n(use-car (list 1 2))\n' \
        | build/emit repl 2>/dev/null | tr -d ' >' | grep -v '^$')"
if [ "$out" = "$(printf '99\n1')" ]; then
  ok "REPL: the redefinition and the captured library binding each resolve correctly"
else
  bad "REPL: redefinition/captured binding (got: $(printf '%s' "$out" | tr '\n' '/'))"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
