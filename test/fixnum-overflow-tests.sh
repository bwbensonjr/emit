#!/usr/bin/env bash
# fixnum-overflow-tests.sh -- change: fixnum-overflow-trap.
#
# Exact integers are fixnums with a 61-bit payload, so the representable range is
# [-2^60, 2^60) = [-1152921504606846976, 1152921504606846975].  R7RS 6.2.3 permits
# that restriction but allows only two outcomes when a result leaves the range:
# report the violation, or coerce to inexact.  Emit reports.  What this pins:
#
#   * `+ - *` trap at BOTH bounds, and the diagnostic names the operands (the
#     format settled in the change's task 1.1) -- so a wrapped literal is
#     debuggable;
#   * the boundary values themselves are untouched: every result that FITS is
#     still produced exactly, which is the half of the change most at risk from an
#     off-by-one in the range test;
#   * the overflow is caught on the INLINE fast path, not only in rt_* -- a
#     both-fixnum operation never reaches the runtime otherwise, which is exactly
#     the hole this change closed;
#   * `quotient` and `/` trap on the single out-of-range exact quotient
#     (FIXNUM_MIN / -1), while `modulo`/`remainder` -- in range for every input --
#     keep returning 0 (design D6);
#   * `inexact->exact` traps outside the range instead of performing an
#     out-of-range float->int cast (design D5), including the round-trip
#     (inexact->exact (exact->inexact max-fixnum)) that used to yield FIXNUM_MIN;
#   * an out-of-range source LITERAL is a diagnostic, inherited from the trapping
#     `+`/`*` in the reader's own digit accumulator rather than a bounds check
#     written there (design D4 -- the line stays untouched when bignums land);
#   * a standalone executable exits non-zero on the trap while the in-process
#     runner's host survives it.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/fixnum-overflow-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

MAX=1152921504606846975      # 2^60 - 1, the largest fixnum
MIN=-1152921504606846976     # -2^60,    the smallest fixnum

check () {  # <name> <program-text> <expected stdout>
  printf '%s\n' "$2" > "$TMP/p.scm"
  local got; got="$($RUN < "$TMP/p.scm" 2>"$TMP/e")"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => $got (expected $3)"; sed 's/^/         /' "$TMP/e"; fi
}

trap_msg () {  # <name> <program-text> <substring the diagnostic must contain>
  printf '%s\n' "$2" > "$TMP/p.scm"
  if $RUN < "$TMP/p.scm" >"$TMP/o" 2>"$TMP/e"; then
    bad "$1 (no trap; produced $(cat "$TMP/o"))"
  elif grep -qF -- "$3" "$TMP/e"; then     # -- : the messages start with `-:` / `/:`
    ok "$1 => $(head -1 "$TMP/e")"
  else
    bad "$1 (trapped, but the message lacks '$3'): $(head -1 "$TMP/e")"
  fi
}

echo "fixnum overflow: exact integer results outside [-2^60, 2^60) are diagnostics"

# --- the boundary values are UNCHANGED ---------------------------------------
# Checked first: a range test that is off by one breaks these, not the traps.
check "the largest fixnum reads and prints" "$MAX" "$MAX"
check "the smallest fixnum reads and prints" "$MIN" "$MIN"
check "arithmetic up to the bound is exact" \
  "(list (+ $MAX -1) (- $MAX 1) (* 576460752303423487 2))" \
  "(1152921504606846974 1152921504606846974 1152921504606846974)"
check "reaching the bound exactly does not trap" \
  "(list (+ 1152921504606846974 1) (- -1152921504606846975 1))" \
  "($MAX $MIN)"
check "ordinary arithmetic is untouched" \
  '(list (+ 1 2 3) (* 2 3 4) (- 10 1 2) (+ 1 2.0) (* 2 0.5))' \
  '(6 24 7 3.0 1.0)'

# --- + - * trap at both bounds ------------------------------------------------
trap_msg "+ past the upper bound"  "(+ $MAX 1)"  "+: fixnum overflow: $MAX + 1"
trap_msg "- past the lower bound"  "(- $MIN 1)"  "-: fixnum overflow: $MIN - 1"
trap_msg "* past the upper bound"  '(* 1000000000000 1000000000)' \
  "*: fixnum overflow: 1000000000000 * 1000000000"
trap_msg "negating the smallest fixnum" "(- 0 $MIN)" "-: fixnum overflow: 0 - $MIN"
trap_msg "* accumulating past the bound" \
  '(let loop ((i 0) (acc 1)) (if (= i 40) acc (loop (+ i 1) (* acc 3))))' \
  "*: fixnum overflow"

# The operands appear in the diagnostic, which is the whole point of the format:
# without them, a wrapped literal reports only "* overflowed" somewhere in read.
trap_msg "the diagnostic names both operands" "(* 4000000000 4000000000)" \
  "*: fixnum overflow: 4000000000 * 4000000000"

# --- the INLINE path catches it, not just rt_* --------------------------------
# Both operands are fixnums, so this is compiled to the inline fast path and never
# reaches rt_add unless the emitted overflow edge fires.  A variable operand keeps
# the constant folder (windowed to +/-(2^30-1)) out of it.
trap_msg "overflow is caught on the inline fast path" \
  "(let ((x $MAX)) (+ x 1))" "+: fixnum overflow"
trap_msg "overflow inside a loop body" \
  "(let loop ((i 0) (acc $MAX)) (if (= i 2) acc (loop (+ i 1) (+ acc 1))))" \
  "+: fixnum overflow"

# --- division: quotient and / trap; modulo and remainder do not ---------------
trap_msg "quotient of the smallest fixnum by -1" "(quotient $MIN -1)" \
  "quotient: fixnum overflow: $MIN / -1"
trap_msg "/ of the smallest fixnum by -1" "(/ $MIN -1)" \
  "/: fixnum overflow: $MIN / -1"
check "modulo and remainder are in range for every input" \
  "(list (modulo $MIN -1) (remainder $MIN -1) (quotient $MIN 1) (quotient $MAX -1))" \
  "(0 0 $MIN -1152921504606846975)"
trap_msg "division by zero still traps with its own message" \
  '(quotient 1 0)' "division by zero: quotient"

# --- inexact->exact ------------------------------------------------------------
trap_msg "inexact->exact well outside the range" '(inexact->exact 1e30)' \
  "inexact->exact: value outside fixnum range"
trap_msg "inexact->exact just outside the range" '(inexact->exact 1.5e18)' \
  "inexact->exact: value outside fixnum range"
trap_msg "the flonum round trip that used to wrap" \
  "(inexact->exact (exact->inexact $MAX))" \
  "inexact->exact: value outside fixnum range"
check "in-range conversions are unchanged" \
  '(list (inexact->exact 3.0) (inexact->exact -3.0) (exact->inexact 3) (inexact->exact 1e18))' \
  '(3 -3 3.0 1000000000000000000)'
trap_msg "a non-integral flonum still traps with its own message" \
  '(inexact->exact 2.5)' "inexact->exact: not an integer"

# --- an out-of-range source literal (design D4: inherited, not special-cased) --
trap_msg "a literal one past the upper bound" '1152921504606846976' "fixnum overflow"
trap_msg "a literal far past the bound"       '99999999999999999999' "fixnum overflow"
check "a literal AT the bound still reads"    "(list $MAX $MIN)" "($MAX $MIN)"

# --- a standalone executable exits non-zero ------------------------------------
# `emit build` delivers a named program from a manifest, so the case needs one.
printf '(begin (display "before") (newline) (+ %s 1))\n' "$MAX" > "$TMP/exe.scm"
cat > "$TMP/emit-libs.scm" <<EOF
((library (scheme base) (source "lib/scheme/base.sld"))
 (program ovf-app (source "$TMP/exe.scm") (output "$TMP/exe")))
EOF
if EMIT_VERBOSITY=quiet build/emit build ovf-app --manifest "$TMP/emit-libs.scm" \
     >"$TMP/build.log" 2>&1; then
  if "$TMP/exe" >"$TMP/exe.out" 2>"$TMP/exe.err"; then
    bad "a standalone executable exits non-zero on overflow (it exited 0)"
  elif grep -q "fixnum overflow" "$TMP/exe.err" && grep -q "before" "$TMP/exe.out"; then
    ok "a standalone executable renders the trap and exits non-zero"
  else
    bad "a standalone executable: wrong output ($(head -1 "$TMP/exe.err"))"
  fi
else
  bad "a standalone executable: build failed"
fi

# --- the in-process host survives the trap -------------------------------------
# Two programs down one runner: the first traps, the second must still evaluate.
printf '(+ %s 1)\n' "$MAX" > "$TMP/t1.scm"
$RUN < "$TMP/t1.scm" >/dev/null 2>&1
printf '(+ 1 2)\n' > "$TMP/t2.scm"
if [ "$($RUN < "$TMP/t2.scm" 2>/dev/null)" = "3" ]; then
  ok "the runner still works after a trap"
else
  bad "the runner still works after a trap"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
