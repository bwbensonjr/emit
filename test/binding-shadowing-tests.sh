#!/usr/bin/env bash
# binding-shadowing-tests.sh -- change: binding-aware-expander (issues #103, #92, #79).
#
# One defect seen from three sides: the expander used to decide what an identifier MEANS
# from how it was SPELLED.  What this pins, end to end through the shipped binary:
#
#   * a binding shadows a macro keyword -- let, let*, letrec, a lambda formal (including
#     the rest formal), an internal define, a named let whose name IS the keyword, and a
#     top-level define.  R7RS 4.2/5.3: a keyword is a binding like any other.
#   * a `syntax-rules` literal does not match an identifier bound at the use site, so
#     `(let ((=> #f)) (cond (#t => 'ok)))` is an ordinary clause (R7RS 4.2.1's own
#     illustration), while an UNSHADOWED `=>` is still receiver syntax.
#   * a `syntax-rules` template may reference a `define-record-type` binding, on the
#     program path and at the REPL as well as in a library.
#
# WHY THESE SHAPES AND NOT PRETTIER ONES.  Most of them used to fail SILENTLY: `(when 5)`
# is a legal use of the `when` macro with an empty body, so a shadowed `when` answered the
# unspecified value and the program kept running.  Each row therefore asserts the VALUE,
# never just the exit status -- a suite that only checked for the absence of an error
# would have passed against the bug.  The `else`/`cond` pair is here for the same reason
# in reverse: with two clauses the shadowed `else` fell through correctly by accident, and
# only the single-clause form exposed it, so both are pinned.
#
# Chez-FREE: drives build/emit, which is where the fix has to land to matter.
# Run from the repo root:  test/binding-shadowing-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

RUN="build/emit run"
HOST="build/emit repl"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

check () {  # <name> <program-text> <expected stdout>
  printf '%s\n' "$2" > "$TMP/p.scm"
  local got; got="$($RUN "$TMP/p.scm" 2>"$TMP/e" | tr '\n' ' ' | sed 's/ *$//')"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => '$got' (expected '$3')"; sed 's/^/         /' "$TMP/e"; fi
}

# last non-empty line of a REPL session, the way the other REPL suites read a value
check_repl () {  # <name> <input> <expected>
  local got; got="$(printf '%s' "$2" | $HOST 2>/dev/null | awk 'NF{v=$0} END{print v}')"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => '$got' (expected '$3')"; fi
}

echo "a binding shadows a macro keyword (issue #103)"

check let-shadow      '(display (let ((when (lambda (x) x))) (when 5)))'            5
check lambda-shadow   '(display ((lambda (unless) (unless 7)) (lambda (x) (* x 6))))' 42
check rest-shadow     '(display ((lambda (a . when) (car when)) 1 9))'             9
check letrec-shadow   '(display (letrec ((cond (lambda (x) (* x 5)))) (cond 4)))'   20
check let*-shadow     '(display (let* ((and (lambda (a b) (- a b))) (z (and 9 2))) z))' 7
check toplevel-shadow '(define (when x) (* x 2))
(display (when 5))'                                                                10
check internal-shadow '(define (g n) (define when (lambda (x) (* x 3))) (when n))
(display (g 5))'                                                                   15

# The shape that started this (found by mode 17 of the unit pipeline): the loop name of a
# named let IS a macro keyword, so the recursive call must call the loop.  `str-search` in
# src/core.ss is the compiler's own instance of it.
check named-let-shadow '(define-syntax my-or (syntax-rules () ((_ a b) (let ((t a)) (if t t b)))))
(define (f n) (let my-or ((j 0)) (if (>= j n) (quote done) (my-or (+ j 1)))))
(display (f 3))'                                                                   done

# ...and an UNSHADOWED keyword still expands, which is what makes the above a narrowing
# rather than a removal.
check keyword-still-works '(display (when (> 2 1) 5))'                             5
check do-still-works      '(display (do ((i 0 (+ i 1)) (acc (quote ()) (cons i acc))) ((= i 3) acc)))' "(2 1 0)"
check nested-do           '(display (do ((i 0 (+ i 1)) (t (quote ()) (cons (do ((j 0 (+ j 1)) (s 0 (+ s j))) ((= j i) s)) t))) ((= i 4) t)))' "(3 1 0 0)"

# An INTERNAL auxiliary keyword is shadowable too, and that half is a fix: before, this
# expanded `%do-step` (the helper `do` uses for a defaulted step) and silently answered its
# argument, 4.  The converse shape -- a `do` loop VARIABLE named %do-step, where the
# expansion needs the keyword inside the scope that binds it -- is issue #106 and is
# deliberately not asserted here: pinning a known-wrong answer would have to be un-pinned
# to fix it.
check aux-keyword-shadow '(display (let ((%do-step (lambda (x) (* x 11)))) (%do-step 4)))' 44

echo "a syntax-rules literal is narrowed by the use site's bindings (issue #92)"

# R7RS 4.2.1 gives this exact form as the reason auxiliary keywords must be matched
# hygienically.  It used to trap: `ok` was taken as the receiver and called.
check arrow-shadowed   "(display (let ((=> #f)) (cond (#t => (quote ok)))))"        ok
check arrow-unshadowed "(display (cond ((assv 2 (quote ((1 a) (2 b)))) => cadr) (else (quote none))))" b
# else, in both arities -- the two-clause form passed even before the fix (the `(else ...)`
# rule requires else to be the ONLY clause, so it could not match), the one-clause form did
# not.  Pinning both is what stops a future reader from concluding this area is covered.
check else-shadowed-2  "(display (let ((else #f)) (cond (else (quote wrong)) (#t (quote right)))))" right
check else-shadowed-1  "(display (let ((else #f)) (cond (else (quote wrong)))))"    "#<unspecified>"
check else-unshadowed  "(display (cond (#f (quote no)) (else (quote yes))))"        yes

echo "a template may reference a define-record-type binding (issue #79)"

record_prog='(define-record-type box (mk v) box? (v unbox))
(define-syntax m (syntax-rules () ((_ e) (mk e))))
(display (unbox (m 5)))'
check record-template "$record_prog" 5
# the accessor and predicate reach a template too, not just the constructor
check record-template-all '(define-record-type pt (mkpt x y) pt? (x px) (y py))
(define-syntax mk2 (syntax-rules () ((_ a b) (mkpt a b))))
(define-syntax getx (syntax-rules () ((_ p) (px p))))
(define-syntax isit (syntax-rules () ((_ p) (pt? p))))
(display (list (getx (mk2 3 4)) (isit (mk2 3 4))))'                                "(3 #t)"

echo "dev->ship fidelity: the same three answers at the REPL"

# The REPL is a separate path for both defects: each form is expanded on its own, so
# neither the record's bindings nor a define's displacement of a keyword can come from an
# enclosing letrec the way they do for a program.
check_repl repl-record   "$record_prog"$'\n'                                       5
check_repl repl-toplevel $'(define (when x) (* x 2))\n(display (when 5))\n'         10
check_repl repl-arrow    "(display (let ((=> #f)) (cond (#t => (quote ok)))))"$'\n' ok
check_repl repl-keyword  $'(display (when (> 2 1) 5))\n'                           5

echo "-------------------------------------------"
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
