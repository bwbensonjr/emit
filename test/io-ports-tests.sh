#!/usr/bin/env bash
# io-ports-tests.sh -- change: scheme-io-library (ports, the eof object, and
# port-directed output).
#
# The hole this change fills is that a program could write to stdout and read
# nothing.  What this suite pins:
#
#   * the ROUND TRIP that motivated the change -- open a file for output, write,
#     close, open it for input, read it back;
#   * a file port and a string port produce identical results for the same text
#     and the same operation sequence.  That claim is the entire justification for
#     slurp-on-open (design D2), so it is a test, not an assertion;
#   * `read` over a port returns successive data and then the eof object, and
#     skips leading whitespace and comments -- it is the compiler's own reader
#     given a cursor, so this also pins that the two stay one reader;
#   * peek-char does not consume; read-line splits on line feeds INCLUDING a final
#     unterminated line; read-string returns short only at end of input;
#   * the eof object is distinct from #f, (), and the unspecified value, and
#     prints without faulting;
#   * write-string writes contents LITERALLY, where `write` would quote and escape;
#   * CLEANUP ON A NON-LOCAL EXIT (the design's stated risk, not the happy path):
#     call-with-port closes on a normal return, on an escape via a continuation,
#     AND on a raise.  A test that only exercised normal return would not test
#     dynamic-wind at all;
#   * a port-less `display` FOLLOWS `with-output-to-file` / `parameterize` -- the
#     R7RS requirement that forced the port-less output primitives to write
#     through a runtime destination cell rather than a hardwired stdout;
#   * error paths are diagnostics, not faults: a nonexistent file, a closed port,
#     get-output-string on a file port.
#
# CONVENTION (as in the sibling suites): the expectation is the program's STDOUT
# followed by its final value, which the runner prints in WRITE style -- so a
# string result comes back quoted and a character as #\c.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/io-ports-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# Every program here gets the two libraries that own the names this suite is ABOUT:
# (scheme file) has open-input-file / open-output-file / with-*-file / call-with-*-file and
# (scheme read) has `read`.  R7RS-small puts them outside (scheme base) and so does Emit
# (change: scheme-base-partition, issue #33), so they are no longer auto-imported.
#
# Prepended in the runner rather than written into each of the ~20 programs: the suite's
# subject IS these libraries, so every program either uses them or is a control that costs
# nothing by linking them, and one place to look beats twenty identical preambles.  The
# string-port and eof-object cases stay honest -- open-input-string, read-line, peek-char,
# read-string, write-string and the eof object are all still (scheme base), and the
# `unbound without its library` direction is asserted in
# test/prelude-base-run-tests.sh, not here.
IMPORTS='(import (scheme file))
(import (scheme read))'

check () {  # <name> <program-text> <expected stdout>
  printf '%s\n%s\n' "$IMPORTS" "$2" > "$TMP/p.scm"
  local got; got="$($RUN < "$TMP/p.scm" 2>"$TMP/e")"
  if [ "$got" = "$3" ]; then ok "$1"
  else bad "$1 => [$got] (expected [$3])"; sed 's/^/         /' "$TMP/e"; fi
}

echo "io ports: files, string ports, the eof object, port-directed output"

# --- the eof object ----------------------------------------------------------
# R7RS requires the eof object to be distinguishable from EVERY other object; a
# program that reads a #f datum must still be able to tell that from end of input.
check "the eof object is distinct from #f, (), and the unspecified value" \
  '(list (eof-object? (eof-object)) (eof-object? #f) (eof-object? (quote ()))
         (eq? (eof-object) #f) (eof-object? (if #f #f)))' \
  '(#t #f #f #f #f)'
check "the eof object prints without faulting, in both styles" \
  '(begin (display (eof-object)) (write (eof-object)) (quote ok))' \
  '#<eof>#<eof>ok'

# --- the round trip ----------------------------------------------------------
# NOTE the `let`: a top-level (define x (read ...)) would be hoisted with the other
# define inits and run BEFORE the commands that write the file.
check "round trip: write a file, close it, read it back" \
  "(begin
     (let ((out (open-output-file \"$TMP/rt.txt\")))
       (display \"hello \" out) (write \"quoted\" out) (newline out)
       (write-string \"line2\" out) (close-port out))
     (let ((in (open-input-file \"$TMP/rt.txt\")))
       (let* ((a (read-line in)) (b (read-line in)) (c (read-line in)))
         (close-port in)
         (list a b (eof-object? c)))))" \
  '("hello \"quoted\"" "line2" #t)'

check "output to a file port is complete once the port is closed" \
  "(begin
     (let ((out (open-output-file \"$TMP/c.txt\")))
       (write-string \"abc\" out) (close-port out))
     (let ((in (open-input-file \"$TMP/c.txt\")))
       (let ((s (read-string 100 in))) (close-port in) s)))" \
  '"abc"'

# --- a file port and a string port are the SAME object (design D2) -----------
# This is what slurp-on-open buys; if it ever stops holding, the two constructors
# have drifted into two implementations.
check "a file port and a string port agree on the same text" \
  "(begin
     (let ((out (open-output-file \"$TMP/same.txt\")))
       (write-string \"ab
cd\" out) (close-port out))
     (let ((ops (lambda (p) (list (read-char p) (peek-char p) (read-line p) (read-line p)))))
       (let ((fr (ops (open-input-file \"$TMP/same.txt\")))
             (sr (ops (open-input-string \"ab
cd\"))))
         (list (equal? fr sr) fr))))" \
  '(#t (#\a #\b "b" "cd"))'

# --- character / line / string input ----------------------------------------
check "peek-char does not consume" \
  '(let ((p (open-input-string "ab"))) (list (peek-char p) (read-char p) (read-char p)))' \
  '(#\a #\a #\b)'
check "read-line splits on line feeds and keeps neither" \
  '(let ((p (open-input-string "one
two"))) (list (read-line p) (read-line p) (eof-object? (read-line p))))' \
  '("one" "two" #t)'
# The final line has no terminator: it must come back as-is, not be dropped.
check "read-line returns an unterminated final line" \
  '(let ((p (open-input-string "a
b"))) (list (read-line p) (read-line p)))' \
  '("a" "b")'
check "read-string returns short only at end of input" \
  '(let ((p (open-input-string "abcdef")))
     (list (read-string 3 p) (read-string 10 p) (eof-object? (read-string 1 p))))' \
  '("abc" "def" #t)'
check "read-char returns the eof object past the end" \
  '(let ((p (open-input-string "a"))) (list (read-char p) (eof-object? (read-char p))))' \
  '(#\a #t)'

# --- read, over the compiler's own reader ------------------------------------
check "read returns successive data, then the eof object" \
  '(let ((p (open-input-string "(1 2) foo"))) (list (read p) (read p) (eof-object? (read p))))' \
  '((1 2) foo #t)'
check "read skips leading whitespace and comments" \
  '(let ((p (open-input-string "; a comment

   42 next"))) (list (read p) (read p)))' \
  '(42 next)'
check "read accepts the external representations the reader accepts" \
  '(let ((p (open-input-string "#(1 2) \"s\" #\\a 1.5 (a . b)")))
     (list (read p) (read p) (read p) (read p) (read p)))' \
  '(#(1 2) "s" #\a 1.5 (a . b))'
# The port cursor is a discipline over the SAME rd-datum the compiler front end uses, so
# every lexeme that reader gains, `read` gains (change: reader-lexical-conformance).  Both
# comment forms, over a FILE port -- the cursor has to land past the comment, not merely
# skip it, which a string-port-only case would not distinguish.
check "read over a file port skips both comment forms" \
  "(begin
     (let ((out (open-output-file \"$TMP/comments.scm\")))
       (write-string \"#| a #| nested |# block |# (a b) #;(skip me) 42\" out)
       (close-port out))
     (let ((p (open-input-file \"$TMP/comments.scm\")))
       (let* ((x (read p)) (y (read p)) (z (eof-object? (read p))))
         (close-port p) (list x y z))))" \
  '((a b) 42 #t)'
check "read over a port takes the prefixed numbers and bar-quoted identifiers" \
  '(let ((p (open-input-string "#x1f |a b| #i2")))
     (list (read p) (symbol->string (read p)) (read p)))' \
  '(31 "a b" 2.0)'
check "reader directives persist across successive reads and can be restored" \
  '(let ((p (open-input-string "#!fold-case ABC DEF #!no-fold-case GHI")))
     (list (read p) (read p) (read p)))' \
  '(abc def GHI)'
check "a directive inside a datum remains active to its right" \
  '(let ((p (open-input-string "(A #!fold-case B) C")))
     (list (read p) (read p)))' \
  '((A b) c)'
check "datum labels reconstruct cycles and sharing through read" \
  '(let* ((p (read (open-input-string "#0=(a . #0#)")))
          (v (read (open-input-string "#0=#(a #0#)")))
          (s (read (open-input-string "(#0=(a) #0#)"))))
     (list (eq? p (cdr p)) (eq? v (vector-ref v 1))
           (eq? (car s) (cadr s))))' \
  '(#t #t #t)'
check "datum-label bindings do not persist across port reads" \
  '(let ((p (open-input-string "#0=(a) #0#")))
     (read p)
     (guard (e (else (read-error? e))) (read p) #f))' \
  '#t'
check "written cyclic data can be read back with the same back edge" \
  '(let* ((x (list 1 2)) (out (open-output-string)))
     (set-cdr! (cdr x) x)
     (write x out)
     (let ((back (read (open-input-string (get-output-string out)))))
       (list (car back) (car (cdr back)) (eq? back (cdr (cdr back))))))' \
  '(1 2 #t)'
check "malformed and unresolved datum labels are catchable read errors" \
  '(define (bad? text)
     (guard (e (else (read-error? e)))
       (read (open-input-string text))
       #f))
   (list (bad? "#0#") (bad? "#0=#0#")
         (bad? "(#0=(a) #0=(b))") (bad? "#0=")
         (bad? "#12x") (bad? "#=(a)"))' \
  '(#t #t #t #t #t #t)'

# --- port predicates and first-classness -------------------------------------
check "an input port is recognized by its predicates" \
  '(let ((p (open-input-string "x")))
     (list (port? p) (input-port? p) (output-port? p) (textual-port? p)))' \
  '(#t #t #f #t)'
check "an output port is not an input port" \
  '(let ((p (open-output-string))) (list (port? p) (input-port? p) (output-port? p)))' \
  '(#t #f #t)'
check "a non-port satisfies none of the port predicates" \
  '(list (port? 42) (port? (quote ())) (input-port? "s"))' \
  '(#f #f #f)'
check "a port is a first-class value (stored in a list, then read from)" \
  '(let ((xs (list (open-input-string "hi")))) (read-char (car xs)))' \
  '#\h'

# --- output ports -------------------------------------------------------------
check "a string port accumulates what was written" \
  '(let ((p (open-output-string)))
     (display "ab" p) (write-char #\c p) (get-output-string p))' \
  '"abc"'
check "all five output procedures accept a port" \
  '(let ((p (open-output-string)))
     (display "d" p) (write "w" p) (write-char #\c p) (write-string "s" p) (newline p)
     (get-output-string p))' \
  '"d\"w\"cs\n"'
check "port-directed output writes nothing to standard output" \
  '(let ((p (open-output-string))) (display "hidden" p) (quote done))' \
  'done'

# --- write-string is display narrowed to strings, NOT write -------------------
check "write-string writes contents literally" \
  '(begin (write-string "a\"b") (quote ok))' \
  'a"bok'
check "write would quote and escape the same string" \
  '(begin (write "a\"b") (quote ok))' \
  '"a\"b"ok'
check "write-string to a port writes contents literally" \
  '(let ((p (open-output-string))) (write-string "a\"b" p) (get-output-string p))' \
  '"a\"b"'

# --- the current ports are parameter objects ---------------------------------
check "(display x (current-output-port)) matches (display x)" \
  '(begin (display "x" (current-output-port)) (display "x") (quote done))' \
  'xxdone'
# A port-less display compiles to a bare primcall, so following a rebinding of
# current-output-port is NOT automatic -- it is what the runtime destination cell
# exists for.  If this fails, the port-less display went to the real stdout.
check "parameterize on current-output-port redirects a PORT-LESS display" \
  '(let ((p (open-output-string)))
     (parameterize ((current-output-port p)) (display "inside") (write-string "!"))
     (display "outside")
     (get-output-string p))' \
  'outside"inside!"'
check "with-output-to-file redirects for the dynamic extent, then restores" \
  "(begin
     (with-output-to-file \"$TMP/w2f.txt\" (lambda () (display \"redirected\") (newline)))
     (display \"after\")
     (let ((in (open-input-file \"$TMP/w2f.txt\")))
       (let ((s (read-line in))) (close-port in) s)))" \
  'after"redirected"'
check "with-input-from-file rebinds current-input-port for the extent" \
  "(begin
     (let ((out (open-output-file \"$TMP/wif.txt\")))
       (write-string \"from-file\" out) (close-port out))
     (with-input-from-file \"$TMP/wif.txt\"
       (lambda () (read-line (current-input-port)))))" \
  '"from-file"'

# --- cleanup on a NON-LOCAL exit (the design's stated risk) ------------------
check "call-with-port closes on a normal return" \
  '(let ((p (open-input-string "xy")))
     (call-with-port p (lambda (q) (read-char q)))
     (list (port-closed? p) (input-port-open? p)))' \
  '(#t #f)'
check "call-with-port closes when the body ESCAPES via a continuation" \
  '(let ((p (open-input-string "xy")))
     (list (call/cc (lambda (k) (call-with-port p (lambda (q) (k (quote escaped))))))
           (port-closed? p)))' \
  '(escaped #t)'
check "call-with-port closes when the body RAISES" \
  '(let ((p (open-input-string "xy")))
     (list (guard (e (#t (quote caught))) (call-with-port p (lambda (q) (error "boom"))))
           (port-closed? p)))' \
  '(caught #t)'
check "with-output-to-file restores the parameter when the thunk raises" \
  "(let ((before (current-output-port)))
     (guard (e (#t (quote caught)))
       (with-output-to-file \"$TMP/raise.txt\" (lambda () (error \"boom\"))))
     (eq? before (current-output-port)))" \
  '#t'

# --- lifecycle ----------------------------------------------------------------
check "closing a port twice is permitted and has no further effect" \
  '(let ((p (open-input-string "a"))) (close-port p) (close-port p) (quote twice-ok))' \
  'twice-ok'
check "get-output-string still works after the port is closed" \
  '(let ((p (open-output-string))) (display "kept" p) (close-port p) (get-output-string p))' \
  '"kept"'

# --- error paths: a diagnostic, never a fault --------------------------------
check "opening a nonexistent file for input is a catchable error" \
  '(guard (e (#t (error-object-message e))) (open-input-file "/no/such/file/here"))' \
  '"open-input-file: cannot open file for input"'
check "opening an unwritable path for output is a catchable error" \
  '(guard (e (#t (error-object-message e))) (open-output-file "/no/such/dir/x.txt"))' \
  '"open-output-file: cannot open file for output"'
check "reading from a closed port is a catchable error" \
  '(guard (e (#t (error-object-message e)))
     (let ((p (open-input-string "a"))) (close-port p) (read-char p)))' \
  '"read-char: port is closed"'
check "get-output-string on a FILE port is a catchable error" \
  "(guard (e (#t (error-object-message e)))
     (let ((p (open-output-file \"$TMP/nf.txt\"))) (get-output-string p)))" \
  '"get-output-string: not a string port"'
check "reading from a non-port is a catchable error" \
  '(guard (e (#t (error-object-message e))) (read-char 42))' \
  '"read-char: not an input port"'

# A port-directed write to a value that is not an open output port is a PRIMITIVE
# type error: it reports and aborts, exactly as `(+ 1 "a")` does, rather than
# raising a catchable object.  Pinned here so the difference from the prelude-level
# errors above stays deliberate and visible rather than becoming a surprise.
printf '%s\n' '(display "x" (open-input-string "a"))' > "$TMP/wrongport.scm"
if $RUN < "$TMP/wrongport.scm" >"$TMP/wp.out" 2>"$TMP/wp.err"; then
  bad "port-directed output to an input port should exit non-zero (it succeeded)"
elif grep -q "not an open output port" "$TMP/wp.err"; then
  ok "port-directed output to an input port is a diagnostic + non-zero exit"
else
  bad "port-directed output to an input port: wrong diagnostic ($(cat "$TMP/wp.err"))"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
