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
#   * an immutable VARIADIC export records its ordinary and exact-minimum labels;
#     exact-minimum calls use the empty-rest entry while larger valid counts use
#     the ordinary entry, including through the overflow slots;
#   * too-few, apply, and value-position uses of that export stay indirect;
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

# The old fixed row stays byte-identical while a variadic row appends its explicit
# `rest` marker and exact-minimum entry label.
mkdir -p "$TMP/artifacts"
build/emit lib test/modules/mylib.sld -o "$TMP/artifacts" >/dev/null 2>&1
build/emit lib test/modules/varlib.sld -o "$TMP/artifacts" >/dev/null 2>&1
want   "table: fixed call row is unchanged" "$TMP/artifacts/mylib.exports" \
       '\(greet "mylib:code:greet" 0\)'
reject "table: fixed call row has no rest marker" "$TMP/artifacts/mylib.exports" \
       '\(greet "mylib:code:greet" 0 rest\)'
want   "table: variadic row records minimum arity, rest, and fast label" \
       "$TMP/artifacts/varlib.exports" \
       '\(collect "varlib:code:collect" 2 rest "min-entry:\$varlib\$ccode\$ccollect"\)'
want   "unit: closure code pointer remains the ordinary checked entry" \
       "$TMP/artifacts/varlib.ll" \
       'store i64 ptrtoint \(ptr @"varlib:code:collect" to i64\), ptr'

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

# --- a variadic export is direct-called at every valid static count -----------
src='(import (varlib))
(list (collect 1 2)
      (collect 1 2 3 4)
      (collect 1 2 3 4 5 6 7 8 9 10))'
ll="$(prog_ir "$src" "$MAN")"
want "variadic minimum: direct call" "$ll" \
     'call fastcc i64 @"min-entry:\$varlib\$ccode\$ccollect"\(i64 %t[0-9]+, i64 2,'
want "variadic minimum: fast label is declared" "$ll" \
     '^declare fastcc i64 @"min-entry:\$varlib\$ccode\$ccollect"\(i64(, i64)+, ptr\)$'
want "variadic above minimum: direct call" "$ll" \
     'call fastcc i64 @"varlib:code:collect"\(i64 %t[0-9]+, i64 4,'
want "variadic beyond slots: direct call" "$ll" \
     'call fastcc i64 @"varlib:code:collect"\(i64 %t[0-9]+, i64 10,'
want "variadic direct: closure global still loaded for self/rooting" "$ll" \
     'load i64, ptr @"varlib:collect"'
if grep -A3 'load i64, ptr @"varlib:collect"' "$ll" | grep -q 'and i64 .*, -8'; then
  bad "variadic direct: code-pointer chain removed"
else
  ok "variadic direct: code-pointer chain removed"
fi
got="$(printf '%s\n' "$src" | $RUN --manifest "$MAN" 2>/dev/null)"
want_value='((1 2 ()) (1 2 (3 4)) (1 2 (3 4 5 6 7 8 9 10)))'
[ "$got" = "$want_value" ] \
  && ok "variadic direct: rest values preserved through positional overflow" \
  || bad "variadic direct: value $got (expected $want_value)"

# A statically invalid count deliberately keeps the old indirect/trap path.
ll="$(prog_ir '(import (varlib)) (collect 1)' "$MAN")"
reject "variadic too few: NOT direct-called" "$ll" \
       'call fastcc i64 @"(varlib:code:collect|min-entry:\$varlib\$ccode\$ccollect)"'
want "variadic too few: still loads the code pointer" "$ll" \
     'call fastcc i64 ?%t[0-9]+\(i64 %t[0-9]+, i64 1,'
printf '(import (varlib)) (collect 1)\n' > "$TMP/bad-var.scm"
if out="$($RUN --manifest "$MAN" "$TMP/bad-var.scm" 2>&1)"; then
  bad "variadic too few: traps at run time (it did not)"
elif printf '%s' "$out" | grep -q "arity error"; then
  ok "variadic too few: traps at run time with an arity error"
else
  bad "variadic too few: wrong diagnostic ($out)"
fi

# `apply` owns a dynamic argv and value-position use is not a call to the imported
# binding, so neither is rewritten to known-app.
ll="$(prog_ir '(import (varlib)) (apply collect (list 1 2 3))' "$MAN")"
reject "variadic apply: stays indirect" "$ll" \
       'call fastcc i64 @"(varlib:code:collect|min-entry:\$varlib\$ccode\$ccollect)"'
want   "variadic apply: uses the dynamic argv path" "$ll" 'call ptr @rt_apply_argv'
ll="$(prog_ir '(import (varlib)) (map collect (list 1) (list 2))' "$MAN")"
reject "variadic value position: stays indirect" "$ll" \
       'call fastcc i64 @"(varlib:code:collect|min-entry:\$varlib\$ccode\$ccollect)"'
want   "variadic value position: closure remains first-class" "$ll" \
       'load i64, ptr @"varlib:collect"'

# --- program-unit labels are untouched ---------------------------------------
ll="$(prog_ir '(define (f a b) (+ a b)) (display (f 1 2)) (display (f 3 4))')"
want   "program unit: labels are still counter-derived" "$ll" '^define fastcc i64 @code_[0-9]+\('
reject "program unit: no name-derived label" "$ll" '^define fastcc i64 @"?[^"]*code:'

# --- local known calls use the same split without changing closure identity ---
src='(let ((prefix 7))
       (letrec ((collecting (lambda (x . rest) (list prefix x rest))))
         (list (collecting 1)
               (collecting 1 2 3)
               (apply collecting (list 1 2 3 4)))))'
ll="$(prog_ir "$src")"
want "local variadic minimum: direct fast call" "$ll" \
     'call fastcc i64 @"min-entry:\$code_[0-9]+"\(i64 %t[0-9]+, i64 1,'
want "local variadic above minimum: ordinary direct call" "$ll" \
     'call fastcc i64 @code_[0-9]+\(i64 %t[0-9]+, i64 3,'
want "local variadic closure: code pointer remains ordinary" "$ll" \
     'store i64 ptrtoint \(ptr @code_[0-9]+ to i64\), ptr'
want "local variadic apply: remains dynamic" "$ll" 'call ptr @rt_apply_argv'
got="$(printf '%s\n' "$src" | $RUN 2>/dev/null)"
[ "$got" = "((7 1 ()) (7 1 (2 3)) (7 1 (2 3 4)))" ] \
  && ok "local variadic: capturing direct/ordinary/apply values agree" \
  || bad "local variadic values: $got"

src='(define (countdown n . rest)
       (if (= n 0) (if (null? rest) (quote done) rest)
           (countdown (- n 1))))
     (countdown 100000)'
ll="$(prog_ir "$src")"
want "variadic self tail call: exact minimum uses fast entry" "$ll" \
     'musttail call fastcc i64 @"min-entry:\$code_[0-9]+"\(i64 %self, i64 1,'
got="$(printf '%s\n' "$src" | $RUN 2>/dev/null)"
[ "$got" = "done" ] && ok "variadic self tail call: bounded-stack value" \
                   || bad "variadic self tail call: $got"

# --- generated labels cannot alias legal Scheme procedure names -------------
# This is intentionally compiled through the source driver so it guards task 4.7
# before regeneration as well as the shipped compiler afterward.
collision_man="$TMP/collision-libs.scm"
collision_art="$TMP/collision-artifacts"
printf '((library (emit internal) (source "%s/lib/emit/internal.sld") (artifacts "%s"))\n (library (scheme base) (source "%s/lib/scheme/base.sld") (artifacts "%s"))\n (library (min-label-collision) (source "%s/test/modules/min-label-collision.sld") (artifacts "%s")))\n' \
  "$PWD" "$collision_art" "$PWD" "$collision_art" "$PWD" "$collision_art" > "$collision_man"
printf '%s\n' '(import (scheme base) (min-label-collision))' \
  '(write (list (foo 7) (foo.min 8)))' '(newline)' > "$TMP/collision.scm"
if chez --libdirs src --script src/compile.ss "$TMP/collision.scm" \
     --manifest "$collision_man" -o "$TMP/collision" >"$TMP/collision.build" 2>&1; then
  got="$("$TMP/collision" 2>/dev/null)"
  [ "$got" = "((7) 8)" ] \
    && ok "collision namespace: foo and foo.min both link and run" \
    || bad "collision namespace values: $got"
else
  bad "collision namespace: source-driver build failed"
  sed 's/^/         /' "$TMP/collision.build"
fi
collision_ll="$collision_art/min-label-collision.ll"
fast_label='min-entry:$min-label-collision$ccode$cfoo'
for label in 'min-label-collision:code:foo' \
             'min-label-collision:code:foo.min' "$fast_label"; do
  count="$(grep -Fc "define fastcc i64 @\"$label\"(" "$collision_ll" 2>/dev/null || true)"
  [ "$count" -eq 1 ] \
    && ok "collision namespace: one definition for $label" \
    || bad "collision namespace: $count definitions for $label"
done

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
