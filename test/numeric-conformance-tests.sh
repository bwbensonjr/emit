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
((library (scheme base) (source "$PWD/lib/scheme/base.sld"))
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
echo "every comparison is a first-class value; max/min are variadic (issue #26)"

# --- operator position is UNCHANGED -------------------------------------------
# Checked first: `> <= >=` are still frontend rewrites over `<`/`=` there, and the
# value-position work must not disturb them.
check "all five comparisons in operator position" \
  '(list (= 4 4 4) (< 1 2 3) (> 3 2 1) (<= 1 1 2) (>= 3 3 2))' '(#t #t #t #t #t)'
check "and their false cases" \
  '(list (= 4 5) (< 3 2) (> 2 3) (<= 2 1) (>= 1 2))' '(#f #f #f #f #f)'
check "operands are evaluated once each in a chain" \
  '(let ((n 0)) (list (< 0 (begin (set! n (+ n 1)) 5) 10) n))' '(#t 1)'
check "fewer than two operands compare true" \
  '(list (> 5) (<= 5) (>=) (<))' '(#t #t #t #t)'

# --- value position: the reported symptom -------------------------------------
# `(map > ...)` reported "unbound variable >": the three derived comparisons were
# frontend rewrites with no binding, unlike `=`/`<` which are integrable.
check "the derived comparisons as values under map" \
  '(list (map > (list 3 1) (list 2 4)) (map <= (list 1 5) (list 2 4)) (map >= (list 3 1) (list 3 4)))' \
  '((#t #f) (#t #f) (#t #f))'
check "the derived comparisons applied to a list" \
  '(list (apply > (list 3 2 1)) (apply <= (list 1 1 2)) (apply >= (list 3 3 2)))' \
  '(#t #t #t)'
check "= and < as values still work" \
  '(list (apply = (list 4 4)) (apply < (list 1 2 3)) (map < (list 1 5) (list 2 4)))' \
  '(#t #t (#t #f))'
check "a value-position comparison chains like the operator form" \
  '(list (apply > (list 3 1 2)) (apply <= (list 1 2 2 3)) (apply >= (list 3 1)))' \
  '(#f #t #t)'
check "value and operator position agree on direction" \
  '(list (> 3 2) (apply > (list 3 2)) (< 3 2) (apply < (list 3 2)))' '(#t #t #f #f)'
check "trivial arity as a value" \
  '(list (apply > (list 5)) (apply <= (quote ())))' '(#t #t)'
check "a comparison passed to a higher-order procedure" \
  '(letrec ((pick (lambda (op a b) (if (op a b) a b)))) (list (pick > 3 5) (pick <= 3 5)))' \
  '(5 3)'

# --- max / min ----------------------------------------------------------------
check "max is variadic" '(list (max 1 2 3) (max 5) (max 3 1 2))' '(3 5 3)'
check "min exists and is variadic" '(list (min 1 2 3) (min 5) (min -1 -2))' '(1 5 -2)'
check "contagion when the winning argument is inexact" \
  '(list (max 3 4.0) (min 3.0 4))' '(4.0 3.0)'
# The case a naive fold gets wrong: the winner is exact, but an inexact argument
# was present, so R7RS requires an inexact result.
check "contagion when the winning argument is EXACT" \
  '(list (max 3.0 4) (min 3 4.0))' '(4.0 3.0)'
check "the contagion result really is inexact" \
  '(list (inexact? (max 3.0 4)) (exact? (max 3 4)))' '(#t #t)'
check "max/min are first-class and applicable" \
  '(list (apply max (list 1 7 3)) (map min (list 1 5) (list 4 2)))' '(7 (1 2))'
trap_msg "max of a non-number" "(max 1 'a)" "not a number"

echo
echo "the R7RS 6.2 procedure inventory (issue #27)"

# --- predicates ---------------------------------------------------------------
# The TYPE predicates apply to any object; the arithmetic ones require a number.
check "tower predicates over both types" \
  '(list (complex? 3) (rational? 3.5) (exact-integer? 3) (exact-integer? 3.0))' \
  '(#t #t #t #f)'
check "rational? is false for the non-finite values" \
  '(list (rational? (/ 1.0 0.0)) (rational? (- (/ 1.0 0.0) (/ 1.0 0.0))) (rational? "x"))' \
  '(#f #f #f)'
check "sign and parity" \
  '(list (positive? 3) (negative? -3.5) (odd? 7) (even? 7) (even? 8.0))' \
  '(#t #t #t #f #t)'
trap_msg "parity of a non-integral argument" '(odd? 7.5)' "not an integer: 7.5"

# --- integer arithmetic -------------------------------------------------------
check "absolute value, square, and powers" \
  '(list (abs -7) (abs -7.5) (square 5) (expt 2 10))' '(7 7.5 25 1024)'
check "exactness of gcd and lcm" \
  '(list (gcd 32 -36) (gcd) (lcm 32 -36) (lcm) (gcd 12 18 27))' '(4 0 288 1 3)'
check "a negative exponent yields an inexact result" '(expt 2 -1)' '0.5'
check "expt corner cases" '(list (expt 0 0) (expt 2.0 3) (expt 2 0))' '(1 8.0 1)'
check "exact-integer-sqrt returns two values" \
  '(call-with-values (lambda () (exact-integer-sqrt 17)) list)' '(4 1)'
check "exact-integer-sqrt on a perfect square" \
  '(call-with-values (lambda () (exact-integer-sqrt 16)) list)' '(4 0)'
# The overflow rule is INHERITED from + - *, not reimplemented: (abs FIXNUM_MIN) is
# 2^60, one past the range.
trap_msg "abs of the most negative fixnum" '(abs -1152921504606846976)' \
  "fixnum overflow"
trap_msg "expt past the fixnum range" '(expt 2 61)' "fixnum overflow"
trap_msg "lcm past the fixnum range" '(lcm 1152921504606846975 3)' "fixnum overflow"

# --- rounding -----------------------------------------------------------------
check "the four roundings" \
  '(list (floor 2.7) (ceiling 2.1) (truncate -2.7) (round 2.7))' '(2.0 3.0 -2.0 3.0)'
# R7RS requires round-half-to-EVEN, which floor(x + 0.5) would get wrong.
check "ties round to even" '(list (round 2.5) (round 3.5) (round -2.5) (round 0.5))' \
  '(2.0 4.0 -2.0 0.0)'
check "an exact argument is returned exactly" \
  '(list (floor 5) (round 5) (exact? (round 5)) (ceiling -5))' '(5 5 #t -5)'
# The inexact arm stays in double, so a magnitude too large for a fixnum rounds to
# itself instead of raising the overflow diagnostic.
check "a large-magnitude flonum rounds without overflow" '(floor 1e30)' '1e+30'

# --- the R7RS division operators ----------------------------------------------
check "truncating operators agree with quotient/remainder" \
  '(list (truncate-quotient -17 5) (truncate-remainder -17 5) (quotient -17 5) (remainder -17 5))' \
  '(-3 -2 -3 -2)'
check "flooring operators round toward negative infinity" \
  '(list (floor-quotient -17 5) (floor-remainder -17 5) (modulo -17 5))' '(-4 3 3)'
check "flooring quotient over the four sign combinations" \
  '(list (floor-quotient 17 5) (floor-quotient -17 5) (floor-quotient 17 -5) (floor-quotient -17 -5))' \
  '(3 -4 -4 3)'
check "the two-value forms" \
  '(list (call-with-values (lambda () (floor/ -17 5)) list) (call-with-values (lambda () (truncate/ -17 5)) list))' \
  '((-4 3) (-3 -2))'
trap_msg "division by zero in the two-value form" '(floor/ 5 0)' "division by zero"

# --- rational parts and the conversion spellings ------------------------------
check "integer-valued rational parts" \
  '(list (numerator 7) (denominator 7) (numerator 7.0) (denominator 7.0))' '(7 1 7.0 1.0)'
trap_msg "a non-integral argument to denominator" '(denominator 0.5)' "not an integer"
check "the R7RS conversion spellings" \
  '(list (inexact 3) (exact 3.0) (inexact? (inexact 3)) (exact? (exact 3.0)))' \
  '(3.0 3 #t #t)'
trap_msg "exact of a non-integral flonum still traps" '(exact 2.5)' "not an integer"

# --- number I/O ---------------------------------------------------------------
check "number->string in each radix" \
  '(list (number->string 255 16) (number->string 10 2) (number->string -8 8) (number->string 420))' \
  '("ff" "1010" "-10" "420")'
check "number->string still handles the boundaries" \
  '(list (number->string 0) (number->string -7) (number->string -1152921504606846976))' \
  '("0" "-7" "-1152921504606846976")'
trap_msg "a non-decimal radix with an inexact argument" '(number->string 1.5 16)' \
  "radix must be 10"
check "string->number: integers, flonums, and failure" \
  '(list (string->number "42") (string->number "-2.5") (string->number "abc") (string->number ""))' \
  '(42 -2.5 #f #f)'
check "string->number in a radix" \
  '(list (string->number "ff" 16) (string->number "1010" 2) (string->number "ff" 10))' \
  '(255 10 #f)'
check "string->number round-trips with number->string" \
  '(list (string->number (number->string 1234)) (string->number (number->string -2.5)) (string->number (number->string 255 16) 16))' \
  '(1234 -2.5 255)'
# string->number shares the READER's grammar, so the two must agree on every token.
check "string->number agrees with the reader" \
  '(list (equal? (string->number "42") (read-from-string "42")) (equal? (string->number "-2.5") (read-from-string "-2.5")))' \
  '(#t #t)'
trap_msg "an unsupported radix" '(string->number "1" 5)' "unsupported radix"

echo
echo "the reader accepts the non-finite numeric tokens (issue #25)"

# The printer always emitted these, but the reader classified them as SYMBOLS, so a
# program could not read back its own output -- write/read silently turned a number
# into an identifier.
check "the three tokens read as numbers" \
  '(list (number? (read-from-string "+inf.0")) (number? (read-from-string "-inf.0")) (number? (read-from-string "+nan.0")))' \
  '(#t #t #t)'
check "and are no longer symbols" \
  '(list (symbol? (read-from-string "+inf.0")) (symbol? (read-from-string "+nan.0")))' \
  '(#f #f)'
check "with the right values" \
  '(list (read-from-string "+inf.0") (read-from-string "-inf.0") (read-from-string "+nan.0"))' \
  '(+inf.0 -inf.0 +nan.0)'
check "write/read now round-trips an infinity" \
  '(list (= (read-from-string (number->string (/ 1.0 0.0))) (/ 1.0 0.0)) (= (read-from-string (number->string (/ -1.0 0.0))) (/ -1.0 0.0)))' \
  '(#t #t)'
# A NaN is not = to itself, which is correct IEEE behaviour and the reason `nan?`
# exists in (scheme inexact) -- pinned here so a "fix" never makes it self-equal.
check "a read NaN is still not equal to itself" \
  '(= (read-from-string "+nan.0") (read-from-string "+nan.0"))' '#f'
check "string->number agrees with the reader on them" \
  '(list (string->number "+inf.0") (string->number "+nan.0"))' '(+inf.0 +nan.0)'
check "as source literals too" '(list +inf.0 -inf.0)' '(+inf.0 -inf.0)'
# Only the three exact tokens: a near miss stays a symbol, so the special case cannot
# swallow ordinary identifiers.
check "near-miss tokens remain symbols" \
  '(list (symbol? (read-from-string "+inf")) (symbol? (read-from-string "inf.0")) (symbol? (read-from-string "+inf.00")) (symbol? (read-from-string "+nan.1")))' \
  '(#t #t #t #t)'
# The rest of #25 is deliberately deferred (radix/exactness prefixes, rationals);
# pinned so the deferral is visible rather than assumed.
check "the deferred reader syntax is unchanged" \
  '(list (symbol? (read-from-string "1/2")) (symbol? (read-from-string "#e1.0")) (string->number "1/2"))' \
  '(#t #t #f)'

echo
echo "(scheme inexact): Emit's second standard library"

# An ordinary manifest-resolved library, NOT auto-imported and NOT baked in -- which
# is what makes it a test of the module system rather than a second special case.
check "importing it makes its procedures available" \
  '(import (scheme inexact)) (list (sqrt 4) (exp 0) (log 1) (sin 0) (cos 0))' \
  '(2.0 1.0 0.0 0.0 1.0)'
# (sqrt 4) is 2.0, NOT the exact 2: the exact root is exact-integer-sqrt in
# (scheme base).  An exact argument is accepted and the result is always inexact.
check "an exact argument yields an inexact result" \
  '(import (scheme inexact)) (list (sqrt 4) (inexact? (sqrt 4)) (exact? (sqrt 4)))' \
  '(2.0 #t #f)'
check "the optional second arguments" \
  '(import (scheme inexact)) (list (log 8 2) (atan 1 1))' \
  '(3.0 0.7853981633974483)'
check "the non-finite predicates" \
  '(import (scheme inexact)) (list (finite? 3) (finite? 3.5) (infinite? (/ 1.0 0.0)) (infinite? 3.5) (nan? 3.5))' \
  '(#t #t #t #f #f)'
# Out-of-domain follows IEEE: a NaN, not a trap.  Emit is real-only so no complex
# result is available, and a NaN stays testable where an uncatchable trap would not.
check "out-of-domain arguments yield NaN and the program continues" \
  '(import (scheme inexact)) (list (nan? (sqrt -1.0)) (nan? (log -1.0)) (nan? (asin 2.0)))' \
  '(#t #t #t)'
check "divergent arguments yield an infinity" \
  '(import (scheme inexact)) (list (infinite? (log 0.0)) (infinite? (exp 1000.0)) (log 0.0))' \
  '(#t #t -inf.0)'
# The whole point of the library being a library: its names are ABSENT without the
# import, so they stay available for a program to define itself.
check "a program may define the names itself when it does not import" \
  '(define (sqrt x) (quote mine)) (list (sqrt 4) (sqrt 9))' '(mine mine)'
check "user-wins shadowing still applies with the import" \
  '(import (scheme inexact)) (define (sqrt x) (quote mine)) (list (sqrt 4) (exp 0))' \
  '(mine 1.0)'
trap_msg "without the import the names are unbound" '(sqrt 4)' "unbound variable sqrt"

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
