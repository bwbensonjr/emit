#!/usr/bin/env bash
# catchable-errors-tests.sh -- change: catchable-errors-with-kinds (issues #85, #89).
#
# Two things that meet at the error object: a runtime-detected error is now a
# CONDITION a `guard` can catch, and every error object carries a KIND that
# `read-error?` / `file-error?` answer over.  What this pins:
#
#   * each trap family reaches a handler -- wrong type, out-of-range index,
#     negative size, fixnum overflow, division by zero, and `apply` with an
#     improper last argument;
#   * the caught object is an ordinary error object: `error-object?` is true, the
#     message is the diagnostic, and the irritants are EMPTY.  The empty irritant
#     list is not cosmetic -- it is what holds an uncaught trap's text byte-identical
#     (design D7), so it is checked here rather than assumed;
#   * TWO traps in sequence are both caught.  This is the flag-clearing regression
#     (design D4): the in-flight flag is cleared where the longjmp LANDS, not after
#     the raiser call, and getting that wrong makes exactly the second trap fatal;
#   * a trap raised INSIDE a handler reports and aborts rather than recursing;
#   * the four kinds, from all four sources, plus a non-error object;
#   * a violation of the runtime's own invariants stays fatal (design D2) -- an
#     arity error is not delivered to a handler;
#   * `delete-file` / `file-exists?`, including the file error on a missing path.
#
# Uncaught wording is NOT re-checked here: it is byte-identical by construction
# (the same snprintf, then err_write over a message with no irritants) and the
# whole of run-all-tests.sh would fail if it moved.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/catchable-errors-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

check () {  # <name> <program-text> <expected stdout>
  printf '%s\n' "$2" > "$TMP/p.scm"
  local got; got="$($RUN < "$TMP/p.scm" 2>"$TMP/e")"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => $got (expected $3)"; sed 's/^/         /' "$TMP/e"; fi
}

# <name> <program-text> <substring the stderr must contain>
aborts () {
  printf '%s\n' "$2" > "$TMP/a.scm"
  if $RUN < "$TMP/a.scm" >"$TMP/a.out" 2>"$TMP/a.err"; then
    bad "$1 (it succeeded: $(cat "$TMP/a.out"))"
  elif grep -q "$3" "$TMP/a.err"; then
    ok "$1"
  else
    bad "$1 (wrong report: $(cat "$TMP/a.err"))"
  fi
}

echo "catchable errors: runtime traps as conditions, and the error-object kind"

# --- every trap family reaches a handler (issue #89) -------------------------
check "a wrong-typed argument is caught" \
  '(guard (e (#t (list (quote caught) (error-object? e)))) (+ 1 (quote a)))' \
  '(caught #t)'
check "car of a non-pair is caught" \
  '(guard (e (#t (quote caught))) (car 7))' 'caught'
check "an out-of-range index is caught" \
  '(guard (e (#t (quote caught))) (vector-ref (vector 1 2) 9))' 'caught'
check "a negative allocation size is caught" \
  '(guard (e (#t (quote caught))) (make-vector -1 0))' 'caught'
check "fixnum overflow is caught" \
  '(guard (e (#t (quote caught))) (* 1000000000000000000 1000000000000000000))' 'caught'
check "division by zero is caught" \
  '(guard (e (#t (quote caught))) (/ 1 0))' 'caught'
check "apply with an improper last argument is caught" \
  '(guard (e (#t (quote caught))) (apply + (quote (2 3 . 4))))' 'caught'
check "a trap inside a called procedure is caught at the guard" \
  '(begin (define (f x) (vector-ref x 9))
          (guard (e (#t (quote caught))) (f (vector 1))))' 'caught'

# --- the caught object is an ordinary condition (design D6/D7) ---------------
check "the caught object carries the diagnostic as its message" \
  '(guard (e (#t (error-object-message e))) (vector-ref (vector 1 2) 9))' \
  '"vector-ref: index out of range: 9 (length 2)"'
check "the caught object has NO irritants (what holds uncaught text fixed)" \
  '(guard (e (#t (error-object-irritants e))) (vector-ref (vector 1 2) 9))' '()'
check "a caught trap is an error object of neither source kind" \
  '(guard (e (#t (list (error-object? e) (read-error? e) (file-error? e)))) (+ 1 (quote a)))' \
  '(#t #f #f)'

# --- the mechanism re-arms (design D4) ---------------------------------------
# The failure this catches is specific: clear the in-flight flag in the wrong place
# and the FIRST trap is caught while the second aborts the program.
check "two traps in sequence are both caught" \
  '(list (guard (e (#t (quote one))) (car 7)) (guard (e (#t (quote two))) (cdr 7)))' \
  '(one two)'
check "a trap caught inside a loop does not disarm the next" \
  '(map (lambda (v) (guard (e (#t (quote x))) (vector-ref v 9))) (list (vector 1) (vector 2) (vector 3)))' \
  '(x x x)'
check "a caught trap does not disturb a later ordinary raise" \
  '(list (guard (e (#t (quote trap))) (car 7)) (guard (e (#t e)) (raise (quote plain))))' \
  '(trap plain)'

# --- a trap while a trap is in flight (design D4) ----------------------------
aborts "a trap raised inside a handler reports and aborts, without recursing" \
  '(begin (display "before") (newline) (guard (e (#t (+ 1 (quote a)))) (car 7)))' \
  'not a number'

# --- the runtime's own invariants stay fatal (design D2) ---------------------
aborts "an arity error is not delivered to a handler" \
  '(begin (define (f a b) a) (guard (e (#t (quote caught))) (apply f (list 1))))' \
  'arity error'

# --- the kind, from all four sources (issue #85) -----------------------------
check "an object from error is neither kind" \
  '(guard (exn (else (list (read-error? exn) (file-error? exn)))) (error "BOOM!"))' \
  '(#f #f)'
check "a malformed read raises a read error" \
  '(guard (exn (else (list (read-error? exn) (file-error? exn)))) (read-from-string "(1 2"))' \
  '(#t #f)'
# (scheme read) carries its OWN copy of rd-report and of the kinded raisers under it
# -- anything that reports lives where `error` does, so it cannot come from the
# substrate.  This checks the copy raises the same kind the (scheme base) one does.
check "a read error through (scheme read) is a read error too" \
  '(import (scheme base) (scheme read))
   (guard (exn (else (list (read-error? exn) (file-error? exn))))
     (read (open-input-string "#\\nosuchname ")))' \
  '(#t #f)'
check "the predicates are false for a non-error object" \
  '(guard (e (#t (list (read-error? e) (file-error? e)))) (raise (quote boom)))' \
  '(#f #f)'
check "adding the kind left message and irritants alone" \
  '(guard (e (#t (list (error-object-message e) (error-object-irritants e)))) (error "bad thing" 1 2))' \
  '("bad thing" (1 2))'

# --- the file kind, and the two new file operations (design D8) --------------
check "opening a nonexistent file raises a file error" \
  '(import (scheme base) (scheme file))
   (list (file-error? (guard (exn (else exn)) (open-input-file "no such file")))
         (read-error? (guard (exn (else exn)) (open-input-file "no such file"))))' \
  '(#t #f)'
check "deleting a nonexistent file raises a file error" \
  '(import (scheme base) (scheme file))
   (file-error? (guard (exn (else exn)) (delete-file " no such file")))' \
  '#t'
check "file-exists? answers #f for a missing path and does not raise" \
  '(import (scheme base) (scheme file))
   (list (file-exists? " no such file") (quote continued))' \
  '(#f continued)'
check "delete-file removes a file that file-exists? then denies" \
  "(import (scheme base) (scheme file))
   (define path \"$TMP/df.txt\")
   (define p (open-output-file path))
   (write-string \"hi\" p)
   (close-port p)
   (define before (file-exists? path))
   (delete-file path)
   (list before (file-exists? path))" \
  '(#t #f)'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
