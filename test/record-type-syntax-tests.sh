#!/usr/bin/env bash
# Regression tests for malformed define-record-type (change:
# validate-record-type-syntax).  A malformed record form must be REJECTED with a
# recoverable compile-time error -- never a segmentation fault, a silent
# miscompile, or a spurious exit -- uniformly across the interactive host and the
# batch compilers.  The reported bug was `(define-record-type <point> (x y))`
# segfaulting build/repl-host (exit 139); these tests pin that shut and cover the
# sibling malformed shapes, plus assert that a well-formed record is unaffected.
# Run from the repo root: test/record-type-syntax-tests.sh
set -u
cd "$(dirname "$0")/.."

HOST=build/repl-host
RUN=build/scheme-run
CC=build/schemec
# Rebuild what the tests drive (no-ops when already up to date).
make "$RUN" "$HOST" schemec >/dev/null 2>&1 || { echo "build failed"; exit 1; }

SEGV=139   # 128 + SIGSEGV(11): the crash this change eliminates
pass=0; fail=0
ok ()   { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad ()  { echo "  [FAIL] $1"; fail=$((fail+1)); }

# --- interactive host: malformed form is recoverable -------------------------
# Feed the malformed form, then a trivial expression.  The REPL must NOT crash,
# must report an error on stderr, and must stay alive to evaluate the next form
# (so stdout is exactly the follow-up value).
repl_recovers () {  # name  malformed-form
  local name="$1" form="$2" out err rc
  out="$(printf '%s\n(+ 1 2)\n' "$form" | "$HOST" 2>/tmp/rt-$$.err)"; rc=$?
  err="$(cat /tmp/rt-$$.err)"; rm -f /tmp/rt-$$.err
  if [ "$rc" -eq "$SEGV" ]; then bad "$name (repl segfaulted, exit $rc)"; return; fi
  if [ "$out" != "3" ]; then bad "$name (repl did not recover; stdout=[$out])"; return; fi
  case "$err" in
    *error*) ok "$name (repl: reported error, recovered)";;
    *) bad "$name (repl: no error diagnostic on stderr)";;
  esac
}

# --- batch compiler: malformed form is a clean non-zero compile error --------
batch_rejects () {  # name  runner  malformed-form
  local name="$1" runner="$2" form="$3" err rc
  printf '%s\n(display 1)\n' "$form" | "$runner" >/dev/null 2>/tmp/rt-$$.err; rc=$?
  err="$(cat /tmp/rt-$$.err)"; rm -f /tmp/rt-$$.err
  if [ "$rc" -eq "$SEGV" ]; then bad "$name ($runner segfaulted, exit $rc)"; return; fi
  if [ "$rc" -eq 0 ]; then bad "$name ($runner exited 0; expected a compile error)"; return; fi
  case "$err" in
    *define-record-type*) ok "$name ($runner: exit $rc, diagnostic)";;
    *) bad "$name ($runner: exit $rc but no record diagnostic)";;
  esac
}

echo "define-record-type syntax-validation tests"

# The reported crash and the sibling malformed shapes.
BAD_REPORTED='(define-record-type <point> (x y))'          # the reported segfault
BAD_EMPTY='(define-record-type)'                           # no name/ctor/pred
BAD_NOFIELDACC='(define-record-type point (make-point x) point? (x))'  # field spec has no accessor
BAD_CTORFIELD='(define-record-type point (make-point z) point? (x point-x))'  # ctor field not declared
BAD_PREDLIST='(define-record-type point (make-point x) (point?) (x point-x))'  # predicate not a symbol

echo " interactive host recovers (no segfault):"
repl_recovers reported     "$BAD_REPORTED"
repl_recovers empty        "$BAD_EMPTY"
repl_recovers no-accessor  "$BAD_NOFIELDACC"
repl_recovers ctor-field   "$BAD_CTORFIELD"
repl_recovers pred-list    "$BAD_PREDLIST"

echo " batch scheme-run rejects (clean non-zero):"
batch_rejects reported    "$RUN" "$BAD_REPORTED"
batch_rejects no-accessor "$RUN" "$BAD_NOFIELDACC"

echo " batch schemec rejects (clean non-zero):"
batch_rejects reported    "$CC" "$BAD_REPORTED"

# --- well-formed record is unaffected ----------------------------------------
echo " well-formed record still compiles:"
good='(define-record-type point (make-point x y) point? (x point-x) (y point-y))'
# The REPL echoes each form's value, so the record definition prints a procedure
# and the accessor call prints its result on the last line -- check that result.
out="$(printf '%s\n(point-x (make-point 3 4))\n' "$good" | "$HOST" 2>/dev/null | tail -1)"
if [ "$out" = "3" ]; then ok "well-formed => 3"; else bad "well-formed => [$out] (expected 3)"; fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
