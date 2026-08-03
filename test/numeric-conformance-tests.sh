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
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
