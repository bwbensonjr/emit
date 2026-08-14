#!/usr/bin/env bash
# printer-cycles-tests.sh -- change: host-runtime-corrections (issues #90, #94, #97).
#
# The host runtime's two formatters, and the trap delivery they share:
#
#   * DATUM LABELS.  `write` and `display` terminate on a cyclic datum, emitting `#N=` at a
#     node's first occurrence and `#N#` at every later one (R7RS 6.13.3).  All four routes:
#     stdout, a string port, a cycle through a cdr, and a cycle through a car or a vector
#     element.  Before this every one of them printed until the process was killed -- and the
#     string-port route also grew the heap, since the output accumulated in the port.
#   * ONLY CYCLES ARE LABELLED.  Shared but acyclic structure is written in full, twice; that
#     is the `write` / `write-shared` distinction, and pinning it is what stops a future
#     change from quietly turning `write` into `write-shared`.
#   * THE TRAP FORMATTER IS BOUNDED INSTEAD.  `err_write` renders irritants into a static
#     buffer with no allocation, so it truncates rather than labels.  A cyclic irritant used
#     to spin forever having emitted ZERO bytes -- the buffer stopped filling but the walk
#     never stopped.
#   * CHARACTER NAMES.  `write` names every R7RS character and hex-escapes any other
#     non-graphic one, so no raw control byte leaves it.  `display` is unaffected.  The
#     round-trip row is load-bearing: the printer's table is C and the reader's is
#     in-language (`rd-char-name`), so they cannot be one table and only a round trip keeps
#     them in agreement.
#   * THE SESSION SURVIVES A COMPILER-INTERNAL TRAP.  A form that makes the compiler itself
#     trap used to exit(1) and take the REPL session with it, because only the RUN of a
#     compiled form was trap-bracketed and never the compile.
#
# Every row asserts a value or an exit status.  Two of these defects were hangs and one was
# silent, so "it didn't error" would have passed against all three.
#
# Chez-FREE: drives build/emit.  Timeouts are real assertions here, not safety nets.
# Run from the repo root:  test/printer-cycles-tests.sh
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

# `timeout` is how a hang is distinguished from a wrong answer.  Absent on a stock macOS,
# so probe for it the way test/r7rs-suite-tests.sh does rather than assume.
if   command -v timeout  >/dev/null 2>&1; then TO="timeout 10"
elif command -v gtimeout >/dev/null 2>&1; then TO="gtimeout 10"
else TO=""; say "printer-cycles: no timeout(1) -- a regression here will HANG instead of failing"
fi

check () {  # <name> <program-text> <expected stdout, newlines as spaces>
  printf '%s\n' "$2" > "$TMP/p.scm"
  local got
  got="$($TO $RUN "$TMP/p.scm" 2>"$TMP/e" | tr '\n' ' ' | sed 's/ *$//')"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => '$got' (expected '$3')"; sed 's/^/         /' "$TMP/e"; fi
}

echo "datum labels: write and display terminate on a cycle (issue #90)"

check cyclic-cdr      '(define x (list 1 2)) (set-cdr! (cdr x) x) (write x)'      "#0=(1 2 . #0#)"
check cyclic-self     '(define x (list 1)) (set-cdr! x x) (write x)'              "#0=(1 . #0#)"
check cyclic-car      '(define y (list 1 2 3)) (set-car! y y) (write y)'          "#0=(#0# 2 3)"
check cyclic-vector   '(define v (vector 1 2)) (vector-set! v 1 v) (write v)'     "#0=#(1 #0#)"
check cyclic-display  '(define x (list 1)) (set-cdr! x x) (display x)'            "#0=(1 . #0#)"
# the string port is a separate exclusion row in the R7RS manifest and the worse hang of the
# two: the runaway output accumulated in the port's buffer rather than going to a terminal
check cyclic-strport  '(define p (open-output-string))
(define x (list 1))
(set-cdr! x x)
(write x p)
(display (get-output-string p))'                                                  "#0=(1 . #0#)"

echo "only cycles are labelled; acyclic output is unchanged"

check shared-acyclic  '(define s (list 1 2)) (write (list s s))'                  "((1 2) (1 2))"
# A CAR-CYCLE PLUS SHARING FURTHER DOWN THE LIST -- the shape that caught a real bug in the
# scan's unwind: clearing path marks "while the node is still on the path" let a nested scan
# (entered through a car that points at an ancestor) clear marks the outer walk owned, after
# which a later node looked like a back edge and got a label it should not have.  The unwind
# now clears exactly the nodes each invocation pushed.  Chez prints this identically.
check car-cycle-shared '(define shared (list 7 8))
(define p3 (list shared))
(define p2 (cons 0 p3))
(define p1 (cons 1 p2))
(set-car! p2 p1)
(write p1)'                                                                       "#0=(1 #0# (7 8))"
check nested-acyclic  '(write (list 1 (list 2 3) (vector 4 5) "s" #\a))'          '(1 (2 3) #(4 5) "s" #\a)'
check improper        '(write (cons 1 2))'                                        "(1 . 2)"
check deep-list       '(write (list 1 2 3 4 5 6 7 8 9 10))'                       "(1 2 3 4 5 6 7 8 9 10)"

echo "the trap formatter truncates instead (issue #90, second half)"

# The report must arrive and the process must exit; before, this produced no output at all
# and never returned.  Asserting on the leading text, since the truncation point is a
# property of the buffer size rather than something to pin.
cyc_irritant='(define x (list 1 2)) (set-cdr! (cdr x) x) (error "boom" x)'
printf '%s\n' "$cyc_irritant" > "$TMP/ci.scm"
if $TO $RUN "$TMP/ci.scm" >"$TMP/ci.out" 2>"$TMP/ci.err"; then
  bad "cyclic-irritant (it succeeded; a trap was expected)"
elif grep -q "boom (1 2 1 2" "$TMP/ci.err" && grep -q '\.\.\.' "$TMP/ci.err"; then
  ok "cyclic-irritant  (truncated with ... and reported)"
else
  bad "cyclic-irritant (wrong report: $(head -c 120 "$TMP/ci.err"))"
fi

# ...and an ordinary irritant list is rendered exactly as before
printf '(error "msg" 1 2 3)\n' > "$TMP/oi.scm"
if $TO $RUN "$TMP/oi.scm" 2>&1 | grep -q "^msg 1 2 3$"; then
  ok "ordinary-irritants  (msg 1 2 3, unchanged)"
else
  bad "ordinary-irritants ($($TO $RUN "$TMP/oi.scm" 2>&1 | head -1))"
fi

echo "write names its characters, display does not (issue #94)"

check char-named   '(write (integer->char 0)) (write (integer->char 7)) (write (integer->char 8))
(write #\tab) (write #\newline) (write (integer->char 13)) (write (integer->char 27))
(write #\space) (write (integer->char 127))' \
  '#\null#\alarm#\backspace#\tab#\newline#\return#\escape#\space#\delete'
check char-hex     '(write (integer->char 1)) (write (integer->char 31)) (write (integer->char 128))' \
  '#\x1#\x1f#\x80'
check char-literal '(write #\A) (write #\λ) (write #\0)'                          '#\A#\λ#\0'
# display writes the RAW character in every case -- write-char and the port procedures
# depend on it, so this row is the guard against "fixing" display too
check display-raw  '(display #\A) (display #\space) (display #\B)'                "A B"
check char-in-list '(write (list #\a #\tab))'                                     '(#\a #\tab)'

# The two tables cannot be shared (C printer, in-language reader), so agreement is checked
# rather than assumed: write each character, read the text back, compare.
check char-roundtrip '(import (scheme read))
(define (rt n)
  (let ((c (integer->char n)) (p (open-output-string)))
    (write c p)
    (eqv? c (read (open-input-string (get-output-string p))))))
(display (map rt (list 0 1 7 8 9 10 13 27 31 32 65 127 128 159 955)))' \
  "(#t #t #t #t #t #t #t #t #t #t #t #t #t #t #t)"

echo "the REPL survives a trap inside the compiler (issue #97)"

# `(define-values (x y . z) ...)` is the shortest form that makes the COMPILER trap (the
# frontend destructures it with a bare car -- issue #91).  Before this the session exited 1
# and the following form was never read.  After it, compile-one-form's guard catches the
# trap, which also means the session snapshot it holds is restored (repl-core design D3).
sess="$(printf '(define-values (x y . z) (values 1 2 3))\n(display (+ 40 2))\n' | $TO $HOST 2>&1)"
sess_status=$?
last="$(printf '%s' "$sess" | awk 'NF{v=$0} END{print v}')"
if [ "$sess_status" -eq 0 ] && printf '%s' "$sess" | grep -q "car: not a pair" \
   && printf '%s' "$last" | grep -q 42; then
  ok "repl-compiler-trap  (reported, session survived, next form ran)"
else
  bad "repl-compiler-trap (status=$sess_status, last='$last')"
  printf '%s\n' "$sess" | sed 's/^/         /'
fi

# ...and a trap in USER code still behaves as it always has: reported as !trap:, session up.
usess="$(printf '(vector-ref (vector 1) 9)\n(display 7)\n' | $TO $HOST 2>&1)"
if printf '%s' "$usess" | grep -q "!trap: vector-ref: index out of range" \
   && printf '%s' "$usess" | awk 'NF{v=$0} END{print v}' | grep -q 7; then
  ok "repl-user-trap  (!trap:, session survived)"
else
  bad "repl-user-trap ($(printf '%s' "$usess" | tail -2 | tr '\n' ' '))"
fi

echo "-------------------------------------------"
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
