#!/usr/bin/env bash
# End-to-end tests for the interactive REPL driver (change: interactive-repl,
# Group 5): `compile.ss --repl` driving `emit repl` as a co-process.  Feeds a
# scripted session on stdin and checks the values echoed on stdout (prompts and
# diagnostics go to stderr, so stdout is values only).
# Run from the repo root: test/repl-interactive-tests.sh
set -u
cd "$(dirname "$0")/.."

# Rebuild the host if the runtime/host sources changed (not just if it is
# missing): make no-ops when it is already up to date.
make emit >/dev/null || { echo "host build failed"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

check () {  # name  flags  expected-newline-joined  <<session
  local name="$1" flags="$2" want="$3"
  local got
  got="$(chez --libdirs src --script src/compile.ss --repl $flags 2>/dev/null)"
  if [ "$got" = "$want" ]; then
    echo "  [OK  ] $name"; pass=$((pass+1))
  else
    echo "  [FAIL] $name"
    echo "         got:  $(printf '%s' "$got" | tr '\n' '|')"
    echo "         want: $(printf '%s' "$want" | tr '\n' '|')"
    fail=$((fail+1))
  fi
}

echo "interactive REPL end-to-end tests"

# --- core model, no prelude (fast) ---
# NB: a top-level `define` echoes NOTHING (change: unspecified-value -- its value is the
# unspecified value, which the REPL suppresses), so the expectations below carry only the
# values of the non-define forms.  Each define's EFFECT is still asserted, by the form
# that follows it.
check earlier-define --no-prelude "42" <<'EOF'
(define x 41)
(+ x 1)
EOF

check redefinition --no-prelude "4" <<'EOF'
(define y 1)
(define y 2)
(+ y y)
EOF

check heap-persist --no-prelude "1" <<'EOF'
(define p (cons 1 2))
(car p)
EOF

check error-recovery --no-prelude "$(printf '25\n36')" <<'EOF'
(define (sq n) (* n n))
(sq 5)
(nope 1)
(sq 6)
EOF

check arity-trap-survives --no-prelude "$(printf '!trap: arity error: expected 1 argument(s), got 2\n81')" <<'EOF'
(define (f n) (* n n))
(f 1 2)
(f 9)
EOF

# spec: forward references are rejected (a referenced to b before b exists),
# and the session recovers so later forms work
check forward-ref-rejected --no-prelude "11" <<'EOF'
(define a (+ b 1))
(define b 10)
(+ b 1)
EOF

# issue #5: `set!` on a global defined earlier in the session.  Referencing one
# always worked; assigning it was rejected as unbound, because resolve-globals'
# set! arm assumed every target was a renamed local.  The store must hit the SAME
# slot the define created, so a closure compiled before the set! sees the new value.
check set-global --no-prelude "$(printf '5\n7\n7\n8')" <<'EOF'
(define n 5)
n
(define (get) n)
(set! n 7)
n
(get)
(set! n (+ n 1))
n
EOF

# ... and a define AFTER a set! still allocates a fresh generation
check set-then-redefine --no-prelude "40" <<'EOF'
(define n 1)
(set! n 2)
(define n 30)
(set! n 40)
n
EOF

# issue #5: what `set!` must still REFUSE.  An unbound name is an error as before;
# an IMPORTED binding is refused because a unit's globals are written only by its
# own __init, which is what cross-unit direct calls rest on (design D4 of
# cross-unit-direct-calls) -- and the session recovers either way.
check set-unbound-rejected --no-prelude "9" <<'EOF'
(set! nope 1)
(define ok 9)
ok
EOF

check set-imported-rejected "" "$(printf '3\n3')" <<'EOF'
(define (use-len xs) (length xs))
(use-len (quote (1 2 3)))
(set! length 1)
(use-len (quote (1 2 3)))
EOF

# spec: interned symbols stay eq? across forms (shared symbol table)
check symbol-eq-persist --no-prelude "#t" <<'EOF'
(define s (quote foo))
(eq? s (quote foo))
EOF

# --- with prelude: macros, library, user macros, the in-language reader ---
check cond-macro "" "$(printf 'neg\npos')" <<'EOF'
(define (classify n) (cond ((< n 0) (quote neg)) (else (quote pos))))
(classify -3)
(classify 7)
EOF

check library-map "" "$(printf '(1 4 9 16)')" <<'EOF'
(map (lambda (x) (* x x)) (quote (1 2 3 4)))
EOF

# define-syntax acknowledges on stderr; stdout carries only the two values
check user-macro "" "$(printf '42\n10')" <<'EOF'
(define-syntax twice (syntax-rules () ((_ e) (+ e e))))
(twice 21)
(twice 5)
EOF

check in-language-reader "" "$(printf '(a (b c) 42)')" <<'EOF'
(read-from-string "(a (b c) 42)")
EOF

# spec (error-and-guard-conditions): (error who msg irritant) reports the
# who/message/irritant diagnostic (echoed as !trap: ...) and the session
# survives, so the following form still yields its value (7).
check error-reports-and-survives "" "$(printf '!trap: parse: bad expression x\n7')" <<'EOF'
(define (boom) (error 'parse "bad expression" 'x))
(boom)
(+ 3 4)
EOF

# spec (interactive-repl): a form whose result is THE unspecified value echoes NOTHING --
# no value and no newline -- so side-effecting forms stay quiet at the prompt (change:
# unspecified-value).  Only the two `(+ ...)` forms and `display`'s own "hi" reach stdout;
# the four unspecified-valued forms between them contribute nothing at all.
check unspec-echo-suppressed "" "$(printf '1\nhi2')" <<'EOF'
(+ 0 1)
(if #f #f)
(void)
(display "hi")
(vector-set! (make-vector 2 0) 0 1)
(+ 1 1)
EOF

# ... but #f and () are LEGITIMATE results and must still print: they are exactly the two
# values Emit used to conflate with "unspecified", which is why the new value is distinct
# from both.  An explicit (write (if #f #f)) also still prints -- suppression is a REPL
# display policy, not a property of the value.
check unspec-suppression-is-narrow "" "$(printf '#f\n()\n#<unspecified>')" <<'EOF'
(null? 1)
(list)
(write (if #f #f))
EOF

# spec: end-of-input ends the session cleanly (exit code 0)
printf '(+ 1 2)\n' | chez --libdirs src --script src/compile.ss --repl --no-prelude >/dev/null 2>&1
if [ "$?" -eq 0 ]; then
  echo "  [OK  ] eof-clean-exit"; pass=$((pass+1))
else
  echo "  [FAIL] eof-clean-exit (nonzero exit on EOF)"; fail=$((fail+1))
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
