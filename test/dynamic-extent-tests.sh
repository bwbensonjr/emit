#!/usr/bin/env bash
# dynamic-extent-tests.sh -- change: dynamic-extent (rung 3 of the call/cc staircase,
# openspec/explorations/continuations-and-control.md).
#
# Escape continuations, dynamic-wind, and parameter objects, plus `guard`/`raise`
# re-expressed over one handler stack (design D4).  What this pins:
#
#   * escape works, and a non-invoked continuation returns normally;
#   * a continuation invoked OUTSIDE its extent is a diagnostic, not undefined
#     behaviour.  D5's whole argument for keeping the standard `call/cc` name is
#     conditional on this firing, so it is a test, not an assertion;
#   * `dynamic-wind`'s `after` runs on a normal return, on an escape crossing it,
#     and on a raise crossing it -- and BEFORE the guard clause, which is the
#     correctness crux: a longjmp cannot run intervening thunks, so unwinding has
#     to happen on the Scheme side first;
#   * nested winds unwind innermost first;
#   * an `after` that itself raises runs exactly once, outer cleanup still runs,
#     and the new object wins (the rule settled in task 1.2);
#   * a non-matching `guard` reraises outward, with intervening cleanup run once
#     (task 1.3 -- a documented R7RS deviation, since reraising in the ORIGINAL
#     dynamic environment needs re-entry, which is rung 4);
#   * parameters read, bind, and restore -- including after an escape;
#   * `guard`/`raise` behaviour is otherwise unchanged, including the non-zero
#     exit of an unhandled raise.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/dynamic-extent-tests.sh
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

echo "dynamic extent: escape continuations, dynamic-wind, parameters"

# --- escape continuations ----------------------------------------------------
check "escape from mid-computation" \
  '(+ 1 (call/cc (lambda (k) (+ 100 (k 41)))))' '42'
check "a non-invoked continuation returns normally" \
  '(call/cc (lambda (k) 7))' '7'
check "early exit from a fold" \
  '(call/cc (lambda (k) (fold-left (lambda (a x) (if (> x 2) (k x) (+ a x))) 0 (list 1 2 3 4))))' '3'

# --- the out-of-extent diagnostic (design D1/D5) -----------------------------
check "invoking a continuation outside its extent is a diagnostic" \
  '(begin (define saved #f)
          (call/cc (lambda (k) (set! saved k) 0))
          (guard (e (#t (error-object-message e))) (saved 1)))' \
  '"call/cc: continuation invoked outside its extent"'

# --- dynamic-wind ------------------------------------------------------------
check "after runs on a normal return" \
  '(begin (define g (quote ()))
          (define v (dynamic-wind (lambda () (set! g (cons 1 g)))
                                  (lambda () (quote body))
                                  (lambda () (set! g (cons 2 g)))))
          (list v (reverse g)))' \
  '(body (1 2))'

check "after runs when a continuation escapes past it" \
  '(begin (define g (quote ()))
          (define v (call/cc (lambda (k)
            (dynamic-wind (lambda () (set! g (cons 1 g)))
                          (lambda () (k (quote out)) (set! g (cons 99 g)))
                          (lambda () (set! g (cons 2 g)))))))
          (list v (reverse g)))' \
  '(out (1 2))'

# THE crux: the after thunk must run BEFORE the guard clause is evaluated.
check "after runs before the guard clause sees the object" \
  '(begin (define g (quote ()))
          (define v (guard (e (#t (set! g (cons (quote clause) g)) e))
            (dynamic-wind (lambda () #t)
                          (lambda () (raise (quote bang)))
                          (lambda () (set! g (cons (quote after) g))))))
          (list v (reverse g)))' \
  '(bang (after clause))'

check "nested winds unwind innermost first" \
  '(begin (define g (quote ()))
          (call/cc (lambda (k)
            (dynamic-wind (lambda () #t)
              (lambda () (dynamic-wind (lambda () #t)
                                       (lambda () (k 0))
                                       (lambda () (set! g (cons (quote inner) g)))))
              (lambda () (set! g (cons (quote outer) g))))))
          (reverse g))' \
  '(inner outer)'

# --- an after thunk that itself raises (task 1.2) ----------------------------
check "a raising after thunk runs once, outer cleanup still runs, new object wins" \
  '(begin (define g (quote ()))
          (define v (guard (e (#t e))
            (call/cc (lambda (k)
              (dynamic-wind (lambda () #t)
                (lambda () (dynamic-wind (lambda () #t)
                             (lambda () (k (quote escaping)))
                             (lambda () (set! g (cons (quote i) g))
                                        (raise (quote from-after)))))
                (lambda () (set! g (cons (quote o) g))))))))
          (list v (reverse g)))' \
  '(from-after (i o))'

# --- a non-matching guard reraises outward (task 1.3) ------------------------
check "a non-matching guard passes the object outward, cleanup run once" \
  '(begin (define g (quote ()))
          (define v (guard (e ((symbol? e) (list (quote outer) e)))
            (guard (e2 ((string? e2) (quote inner)))
              (dynamic-wind (lambda () #t)
                            (lambda () (raise (quote sym)))
                            (lambda () (set! g (cons 1 g)))))))
          (list v (length g)))' \
  '((outer sym) 1)'

# --- parameters --------------------------------------------------------------
check "a parameter returns its value when called" \
  '(let ((p (make-parameter 10))) (p))' '10'
check "parameterize binds for the extent and restores after" \
  '(let ((p (make-parameter 1))) (list (p) (parameterize ((p 2)) (p)) (p)))' \
  '(1 2 1)'
check "the converter applies to the initial and the bound value" \
  '(let ((p (make-parameter 1 (lambda (x) (* x 10)))))
     (list (p) (parameterize ((p 2)) (p)) (p)))' \
  '(10 20 10)'
check "an escape out of parameterize restores the previous value" \
  '(begin (define p (make-parameter 1))
          (define v (call/cc (lambda (k) (parameterize ((p 9)) (k (p))))))
          (list v (p)))' \
  '(9 1)'
check "a parameter is substitutable for a plain accessor" \
  '(let ((p (make-parameter 5))) ((lambda (get) (get)) p))' '5'

# --- guard / raise unchanged -------------------------------------------------
check "guard still catches and selects a clause" \
  '(guard (e ((symbol? e) (list (quote sym) e)) (else (quote other))) (raise (quote boom)))' \
  '(sym boom)'
check "error objects still flow through guard" \
  '(guard (e (#t (error-object-message e))) (error "bad thing" 1 2))' \
  '"bad thing"'

# an unhandled raise still renders and exits non-zero
printf '(begin (display "before") (newline) (raise (quote nope)))\n' > "$TMP/u.scm"
if $RUN < "$TMP/u.scm" >"$TMP/u.out" 2>"$TMP/u.err"; then
  bad "an unhandled raise still exits non-zero (it succeeded)"
else
  if grep -q "nope" "$TMP/u.err" && grep -q "before" "$TMP/u.out"; then
    ok "an unhandled raise still renders and exits non-zero"
  else
    bad "an unhandled raise: wrong output ($(cat "$TMP/u.err"))"
  fi
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
