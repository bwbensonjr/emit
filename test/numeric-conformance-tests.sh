#!/usr/bin/env bash
# numeric-conformance-tests.sh -- change: numeric-conformance.
#
# R7RS 6.2 conformance for the two-type tower (61-bit exact integer + double).
# What this suite pins, by the defect it closes:
#
#   * FLONUM LITERALS IN IR (GitHub issue #24, design D1).  The emitter used to
#     interpolate the HOST's number->string into IR text, so a literal whose
#     shortest decimal carries an exponent emitted `fmul double 1e+02, 2.0` --
#     which LLVM rejects, an integer constant in a `double` position -- and the
#     failure was DOOR-SPECIFIC: Chez prints `100.0`, so the Chez-hosted path
#     compiled the same program fine.  Here we pin the values on every shipped
#     door; the byte-equality of the emitted IR TEXT between doors is pinned in
#     test/self-emit-equiv.sh, which is where IR equivalence lives.
#
#   * VALUE FIDELITY.  A literal must survive source -> IR text -> runtime double
#     bit-identically.  Emit's printer emits the shortest round-trippable decimal,
#     which is unique per double, so printing a 17-significant-digit literal back
#     unchanged is exactly the assertion that no bits were lost in the emitted
#     text.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/numeric-conformance-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# The program is an EXPRESSION and the runner prints its value (the convention the
# other numeric suites use), so no `display` -- which would add its own
# unspecified-value line to stdout.
check () {  # <name> <expression-text> <expected stdout>
  printf '%s\n' "$2" > "$TMP/p.scm"
  local got; got="$($RUN < "$TMP/p.scm" 2>"$TMP/e")"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => $got (expected $3)"; sed 's/^/         /' "$TMP/e"; fi
}

# The same program through `emit build` -- a standalone executable rather than the
# in-process runner -- so a literal that only the JIT path got right is caught.
# `emit build` delivers a manifest PROGRAM entry (not a bare file), so the case
# writes a one-entry manifest alongside its source.  A built executable prints its
# program's final value just as the runner does, so these are expressions too.
check_built () {  # <name> <program-text> <expected stdout>
  printf '%s\n' "$2" > "$TMP/b.scm"
  cat > "$TMP/b-libs.scm" <<EOF
((library (scheme base) (source "lib/scheme/base.sld"))
 (program floprog (source "$TMP/b.scm") (output "$TMP/floprog")))
EOF
  if ! EMIT_VERBOSITY=quiet build/emit build floprog --manifest "$TMP/b-libs.scm" \
        >"$TMP/bo" 2>"$TMP/be"; then
    bad "$1 (emit build failed)"; sed 's/^/         /' "$TMP/be" | tail -3; return
  fi
  local got; got="$("$TMP/floprog" 2>"$TMP/be")"
  if [ "$got" = "$3" ]; then ok "$1 (built) => $got"
  else bad "$1 (built) => $got (expected $3)"; sed 's/^/         /' "$TMP/be"; fi
}

# A program whose diagnostic is the point: it must FAIL and name the operation.
trap_msg () {  # <name> <program-text> <substring the diagnostic must contain>
  printf '%s\n' "$2" > "$TMP/p.scm"
  if $RUN < "$TMP/p.scm" >"$TMP/o" 2>"$TMP/e"; then
    bad "$1 (no trap; produced $(cat "$TMP/o"))"
  elif grep -qF -- "$3" "$TMP/e"; then
    ok "$1 => $(head -1 "$TMP/e")"
  else
    bad "$1 (trapped, but the message lacks '$3'): $(head -1 "$TMP/e")"
  fi
}

# The same program in the interactive REPL door.
check_repl () {  # <name> <expression-text> <expected substring of the output>
  local got
  got="$(printf '%s\n' "$2" | build/emit repl 2>"$TMP/re")"
  if printf '%s' "$got" | grep -qF -- "$3"; then ok "$1 (repl) => $3"
  else bad "$1 (repl): output lacks '$3'"; printf '%s\n' "$got" | sed 's/^/         /' | tail -4; fi
}

echo "flonum literals reach IR through a canonical formatter (issue #24)"

# --- the reported symptom, on the in-process runner ---------------------------
# Each of these lands a literal in an UNBOXED flonum region, which is the path that
# emitted a bare `1e+02` operand.  `(* 2.5 2.0)` was already fine (2.5 prints with a
# '.'), and is here so a formatter that breaks the working case is caught too.
check "exponent-framed literal in a region" '(* 100.0 2.0)' '2e+02'
check "large literal in a region"           '(+ 1e15 1.0)'  '1000000000000001.0'
check "overflow to infinity in a region"    '(* 1e308 10.0)' '+inf.0'
check "literal at the precision boundary"   '(+ 1e16 1.0)'  '1e+16'
check "the case that already worked"        '(* 2.5 2.0)'   '5.0'

# --- the boxed literal path (rt_flonum_lit's C string) ------------------------
# A bare literal is rebuilt at runtime by strtod, which reads `inf`/`nan` but NOT
# LLVM's 0x bit-pattern form -- so the two sites share the decimal core and diverge
# only on the non-finite spelling.
check "bare integral literal"    '100.0'   '1e+02'
check "bare subnormal literal"   '5e-324'  '5e-324'
check "bare infinity literal"    '1e400'   '+inf.0'
check "bare negative infinity"   '-1e400'  '-inf.0'
check "infinity survives arithmetic" '(+ 1e400 1.0)' '+inf.0'

# --- value fidelity: bits survive the round trip through IR text --------------
check "17 significant digits round-trip" \
  '1.4142135623730951' '1.4142135623730951'
check "17 digits survive an unboxed region" \
  '(* 1.4142135623730951 1.0)' '1.4142135623730951'
check "the value is the one the reader read" \
  '(= 1.4142135623730951 (* 1.4142135623730951 1.0))' '#t'
check "a literal equals the arithmetic that produces it" \
  '(list (= 0.1 (/ 1.0 10.0)) (= 100.0 (* 10.0 10.0)))' '(#t #t)'
check "negative zero keeps its sign" '-0.0' '-0.0'

# --- the other doors ----------------------------------------------------------
# The whole point of #24 was that the doors disagreed, so the symptom case is
# re-run as a standalone executable and in the REPL.
check_built "exponent-framed literal" '(* 100.0 2.0)' '2e+02'
check_built "17 significant digits"   '1.4142135623730951' '1.4142135623730951'
check_repl  "exponent-framed literal" '(* 100.0 2.0)' '2e+02'
check_repl  "17 significant digits"   '1.4142135623730951' '1.4142135623730951'

echo
echo "the integer-division family validates its arguments (issue #23)"

# --- the exact behaviour is UNCHANGED -----------------------------------------
# Checked first: a guard that is wrong about fixnums breaks these, not the traps.
check "quotient and remainder on exact integers" \
  '(list (quotient 17 5) (remainder 17 5) (modulo 17 5))' '(3 2 2)'
check "truncation toward zero with negatives" \
  '(list (quotient -17 5) (remainder -17 5) (modulo -17 5))' '(-3 -2 3)'
check "modulo takes the sign of the divisor" \
  '(list (modulo -7 3) (modulo 7 -3) (remainder -7 3))' '(2 -2 -1)'

# --- an integral flonum is accepted, with contagion ---------------------------
# `(quotient 7.0 2)` used to return a shifted heap pointer -- a different number on
# each run.  The rule is uniform across the family: integer-VALUED is what matters,
# and an inexact argument makes the result inexact.
check "integral flonum dividend" \
  '(list (quotient 7.0 2) (remainder 7.0 2) (modulo 7.0 2))' '(3.0 1.0 1.0)'
check "integral flonum divisor" \
  '(list (quotient 7 2.0) (remainder 7 2.0) (modulo 7 2.0))' '(3.0 1.0 1.0)'
check "negative integral flonums keep the family's signs" \
  '(list (quotient -7.0 2.0) (remainder -7.0 2.0) (modulo -7.0 2.0))' '(-3.0 -1.0 1.0)'
check "the result is inexact, not merely equal" \
  '(list (inexact? (quotient 7.0 2)) (exact? (quotient 7 2)))' '(#t #t)'

# --- a non-integral or non-numeric argument traps -----------------------------
trap_msg "quotient of a non-integral flonum" '(quotient 7.5 2)' \
  "quotient: not an integer: 7.5"
trap_msg "remainder of a non-integral flonum" '(remainder 7.5 2)' \
  "remainder: not an integer: 7.5"
# modulo used to return the fractional 1.5 here -- unspecified before, a trap now.
trap_msg "modulo of a non-integral flonum" '(modulo 7.5 2)' \
  "modulo: not an integer: 7.5"
trap_msg "non-integral divisor" '(quotient 7 2.5)' "quotient: not an integer: 2.5"
trap_msg "quotient of a symbol" "(quotient 'a 2)" "quotient: not a number"
trap_msg "remainder of a string" '(remainder "x" 2)' "remainder: not a number"
trap_msg "modulo of a list" "(modulo (list 1) 2)" "modulo: not a number"
trap_msg "division by zero still traps with its own message" '(quotient 1 0)' \
  "division by zero: quotient"
trap_msg "inexact division by zero traps too" '(quotient 7.0 0.0)' \
  "division by zero: quotient"

# --- integer->char requires a Unicode scalar value ----------------------------
# Compared as code points: writing the characters themselves would put a raw NUL
# byte in the expected output.
check "ordinary code points still work" \
  '(list (char->integer (integer->char 65)) (char->integer (integer->char 955)) (char->integer (integer->char 0)))' \
  '(65 955 0)'
check "the top of the range works" '(char->integer (integer->char 1114111))' '1114111'
trap_msg "a code point past the Unicode range" '(integer->char 1152921504606846975)' \
  "integer->char: not a Unicode scalar value"
trap_msg "a negative code point" '(integer->char -1)' \
  "integer->char: not a Unicode scalar value: -1"
trap_msg "just past the top of the range" '(integer->char 1114112)' \
  "integer->char: not a Unicode scalar value: 1114112"
trap_msg "a surrogate code point" '(integer->char 55296)' \
  "integer->char: not a Unicode scalar value: 55296"
trap_msg "an inexact code point" '(integer->char 65.0)' \
  "integer->char: not an exact integer"

# `integer?` is the predicate the guard is defined against, so it must agree.
check "integer? and the guard agree on what an integer is" \
  '(list (integer? 7) (integer? 7.0) (integer? 7.5) (integer? (/ 1.0 0.0)))' \
  '(#t #t #f #f)'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
