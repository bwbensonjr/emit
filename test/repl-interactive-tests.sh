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

# Reader directives belong to the interactive source, not merely to the one
# host-sliced form that contains them.  The first directive therefore folds the
# next two data, the second restores case, and a directive inside a list carries
# into the following top-level datum.  Datum labels also have to survive the
# completeness scan and reach the compiler reader with their full extent.
check reader-state-and-labels "" "$(printf 'abc\ndef\nGHI\n(A b)\nc\n#t')" <<'EOF'
#!fold-case
'ABC
'DEF
#!no-fold-case
'GHI
(list 'A #!fold-case 'B)
'C
(let ((x '#0=(a . #0#))) (eq? x (cdr x)))
EOF

# spec (error-and-guard-conditions): (error who msg irritant) reports the
# who/message/irritant diagnostic (echoed as !trap: ...) and the session
# survives, so the following form still yields its value (7).
check error-reports-and-survives "" "$(printf '!trap: parse: bad expression x\n7')" <<'EOF'
(define (boom) (error 'parse "bad expression" 'x))
(boom)
(+ 3 4)
EOF

# change: catchable-errors-with-kinds.  A runtime trap now travels a LONGER route to
# the host's rt_trap frame -- it is raised into the handler chain first, and only an
# UNHANDLED one reaches the host -- so the REPL's survival path is worth re-pinning
# from both sides.  Trap, recover, trap again: the second must be reported too (the
# in-flight flag is cleared where the longjmp lands, design D4), and a trap CAUGHT by
# a guard must reach neither the report nor the session's end.
check trap-recover-trap "" "$(printf '!trap: +: not a number\n5\n!trap: car: not a pair: got a fixnum\n11')" <<'EOF'
(+ 1 'a)
(+ 2 3)
(car 7)
(+ 5 6)
EOF

check trap-caught-does-not-reach-the-host "" "$(printf 'caught\n12\ncaught\n13')" <<'EOF'
(guard (e (#t 'caught)) (+ 1 'a))
(+ 5 7)
(guard (e (#t 'caught)) (vector-ref (vector 1) 9))
(+ 6 7)
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

# --- the input-completeness probe and the two comment forms -------------------
# (change: reader-lexical-conformance, design D5.)  The probe shares `rd-skip-ws` with
# the reader, so a comment in LEADING position comes free; what needs fc-hash/fc-list to
# mirror the forms themselves is a comment INSIDE a form and a `#;` whose datum is on the
# next line.  Get those wrong and the probe reports "malformed" where the reader would say
# "incomplete" -- the two disagreeing about the same text, which is the failure the shared
# helper exists to prevent.  Each of these is typed across lines, so it only produces a
# value if every intermediate prefix was answered "keep typing".
check block-comment-across-lines --no-prelude "3" <<'EOF'
#| a block comment
   spanning several
   lines, with a #| nested |# one inside |#
(+ 1 2)
EOF

check block-comment-inside-a-form --no-prelude "3" <<'EOF'
(+ 1 #| inline
      and continued on the next line |# 2)
EOF

check datum-comment-across-lines --no-prelude "4" <<'EOF'
(+ 1
   #;
   99
   3)
EOF

check datum-comment-before-close --no-prelude "1" <<'EOF'
(+ 1 #;99)
EOF

# ... and a session RECOVERS: the forms after a comment are evaluated normally, which is
# what says the comment was consumed rather than swallowing the rest of the input.
check comments-then-more-forms --no-prelude "$(printf '3\n7')" <<'EOF'
#| one |#
(+ 1 2)
#| two |# (+ 3 4)
EOF

# a bar-quoted identifier is a datum extent like a string, at the prompt too
check bar-quoted-identifier "" '"a b"' <<'EOF'
(symbol->string (quote |a b|))
EOF

# --- a list and a string typed across lines (change: reader-input-termination) -------
# The reader now REPORTS an unterminated list or string instead of closing it at end of
# input (issue #66), while the probe still answers "incomplete" for that same text.  That
# divergence is DIRECTIONAL and intended (design D4): a host reading a stream can supply
# more input, a source file cannot.  These are the cases that break if the two
# implementations are ever "unified" on the grounds that they look redundant -- each form
# below only produces a value if every intermediate prefix was answered "keep typing".
check list-across-lines --no-prelude "(1 2)" <<'EOF'
(display (cons 1
               (cons 2 (quote ()))))
EOF

check nested-list-across-lines --no-prelude "6" <<'EOF'
(+ 1
   (+ 2
      3))
EOF

check string-across-lines --no-prelude "$(printf 'a\nb')" <<'EOF'
(display "a
b")
EOF

# ...and a truncated form at the prompt does not take the session down: end of input with a
# list still open ends the session, and a COMPLETE form typed after an error still runs.
check error-then-more-forms --no-prelude "$(printf '3\n7')" <<'EOF'
(+ 1 2)
(+ 3 4)
EOF

# A MULTI-BYTE character before a form boundary must not shorten the form.  The probe
# answers in CODEPOINTS and the host's accumulation buffer is BYTES, so slicing one by the
# other truncated every form preceded by non-ASCII text -- by exactly (bytes - codepoints).
# It was invisible while the reader closed an unterminated list at end of input: the dropped
# trailing parens were silently supplied and the value came out right, leaving only a
# stray-text "malformed input" on stderr.  demos/prelude.scm is the case in the tree (one
# em-dash, two bytes, exactly the two closing parens below it), which is why
# repl-equiv-tests.sh caught this and no prompt test did.
check multibyte-comment-before-form --no-prelude "3" <<'EOF'
; an em dash — two bytes, one codepoint
(+ 1
   2)
EOF

# Two of them, and inside a string rather than a comment, so the count is what matters and
# not where the bytes came from.
# (display emits no newline, so the two forms' output runs together as "αβ3".)
check multibyte-string-before-form "" "αβ3" <<'EOF'
(display "αβ")
(+ 1
   2)
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
