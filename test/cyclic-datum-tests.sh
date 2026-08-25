#!/usr/bin/env bash
# cyclic-datum-tests.sh -- issues #75 and #108: cycle-safe predicates,
# persistent reader directives, datum labels, and compiled constant topology.
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

make emit >/dev/null 2>&1 || { echo "failed to build build/emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

if   command -v timeout  >/dev/null 2>&1; then TO="timeout 30"
elif command -v gtimeout >/dev/null 2>&1; then TO="gtimeout 30"
else TO=""; say "cyclic-datum: no timeout(1) -- a termination regression can hang"
fi

check () { # name, source, expected stdout
  local name="$1" source="$2" want="$3" got
  printf '%s\n%s\n' '(import (scheme read))' "$source" > "$TMP/$name.scm"
  got="$($TO build/emit run "$TMP/$name.scm" 2>"$TMP/$name.err")"
  if [ "$got" = "$want" ]; then ok "$name => $got"
  else bad "$name => [$got], expected [$want]"; sed 's/^/         /' "$TMP/$name.err"; fi
}

echo "cycle-safe list? and equal?"
check predicates-file "$(cat test/cyclic-datum-source.scm)" \
  '(#f #t #f #t #t #t #t #t #t #t #f #f #f #f #t #t #t #t #t #t)'
check list-shapes \
  '(let ((self (list 1)) (multi (list 1 2 3)))
     (set-cdr! self self)
     (set-cdr! (cddr multi) (cdr multi))
     (write (list (list? (list 1 2)) (list? (cons 1 2))
                  (list? self) (list? multi))))' \
  '(#t #f #f #f)'
check unequal-shape \
  '(let ((a (list 1)) (b (list 1 2)))
     (set-cdr! a a) (set-cdr! (cdr b) b) (write (equal? a b)))' \
  '#f'
check vector-and-mixed-cycles \
  '(let* ((va (vector #f 1)) (vb (vector #f 1)) (vc (vector #f 2))
          (pa (cons va (quote ()))) (pb (cons vb (quote ())))
          (pc (cons vc (quote ()))))
     (vector-set! va 0 pa) (vector-set! vb 0 pb) (vector-set! vc 0 pc)
     (write (list (equal? va vb) (equal? va vc)
                  (equal? pa pb) (equal? pa pc) (equal? pa va))))' \
  '(#t #f #t #f #f)'
check large-acyclic \
  '(write (equal? (iota 4000) (iota 4000)))' \
  '#t'
check cyclic-hash \
  '(let ((a (list 1)) (b (list 1)) (va (vector #f)) (vb (vector #f)))
     (set-cdr! a a) (set-cdr! b b)
     (vector-set! va 0 va) (vector-set! vb 0 vb)
     (write (list (= (%hash a) (%hash b)) (= (%hash va) (%hash vb))
                  (let ((h (make-hash-table)))
                    (hash-table-set! h a 7)
                    (hash-table-ref/default h b 0)))))' \
  '(#t #t 7)'

echo "persistent directives and datum-label scope on ports"
check source-directives \
  '#!fold-case
   (define X (quote ABC))
   (write X)
   #!no-fold-case
   (write (quote DEF))' \
  'abcDEF'
check port-directives \
  '(let ((p (open-input-string "#!fold-case ABC DEF #!no-fold-case GHI")))
     (write (list (read p) (read p) (read p))))' \
  '(abc def GHI)'
check directive-literals \
  '(let ((p (open-input-string "#!fold-case |MixedCase| #\\SPACE #\\Q")))
     (write (list (symbol->string (read p))
                  (char->integer (read p))
                  (read p))))' \
  '("MixedCase" 32 #\Q)'
check directive-position-and-delimiter \
  '(let ((p (open-input-string "(A #!fold-case B) C #!no-fold-case D")))
     (write (list (read p) (read p) (read p)
                  (guard (e (else (read-error? e)))
                    (read (open-input-string "#!fold-caseABC")) #f))))' \
  '((A b) c D #t)'
check labelled-topologies \
  '(let* ((pair (read (open-input-string "#0=(a b . #0#)")))
          (vec (read (open-input-string "#0=#(a #0#)")))
          (mixed (read (open-input-string "#0=(#(a #0#))")))
          (shared (read (open-input-string "(#0=(a) #0#)"))))
     (write (list (eq? pair (cddr pair))
                  (eq? vec (vector-ref vec 1))
                  (eq? mixed (vector-ref (car mixed) 1))
                  (eq? (car shared) (cadr shared)))))' \
  '(#t #t #t #t)'
check labelled-round-trip \
  '(let* ((x (list 1 2)) (out (open-output-string)))
     (set-cdr! (cdr x) x)
     (write x out)
     (let ((back (read (open-input-string (get-output-string out)))))
       (write (list (car back) (car (cdr back))
                    (eq? back (cdr (cdr back)))))))' \
  '(1 2 #t)'
check labelled-vector-round-trip \
  '(let* ((x (vector (quote a) #f)) (out (open-output-string)))
     (vector-set! x 1 x)
     (write x out)
     (let ((back (read (open-input-string (get-output-string out)))))
       (write (list (vector-ref back 0) (eq? back (vector-ref back 1))))))' \
  '(a #t)'

echo "malformed labels are catchable read errors"
check malformed-labels \
  '(define (bad? s)
     (guard (e (else (read-error? e))) (read (open-input-string s)) #f))
   (write (list (bad? "#0#") (bad? "#0=#0#")
                (bad? "(#0=(a) #0=(b))") (bad? "#0=")
                (bad? "#12x") (bad? "#=(a)")))' \
  '(#t #t #t #t #t #t)'
check port-label-scope \
  '(let ((p (open-input-string "#0=(a) #0#")))
     (read p)
     (write (guard (e (else (read-error? e))) (read p) #f)))' \
  '#t'

echo "compiler, REPL, and standalone doors"
got="$($TO build/emit run --dump test/cyclic-datum-source.scm 2>"$TMP/dump.err")"
if [ "$got" = '(#f #t #f #t #t #t #t #t #t #t #f #f #f #f #t #t #t #t #t #t)' ]; then
  ok "compiler stage dumping terminates on cyclic constants"
else
  bad "compiler stage dumping cyclic constants => [$got]"
  sed 's/^/         /' "$TMP/dump.err"
fi

got="$(printf '%s\n' '#!fold-case' "'ABC" "'DEF" '#!no-fold-case' "'GHI" \
  '(list (quote A) #!fold-case (quote B))' "'C" \
  '(let ((x (quote #0=(a . #0#)))) (eq? x (cdr x)))' \
  | $TO build/emit repl 2>"$TMP/repl.err")"
if [ "$got" = "$(printf 'abc\ndef\nGHI\n(A b)\nc\n#t')" ]; then
  ok "REPL directives persist between data; labelled constant => $(printf '%s' "$got" | tr '\n' ' ')"
else bad "REPL directives + labelled constant => [$got]"; sed 's/^/         /' "$TMP/repl.err"; fi

cat > "$TMP/emit-libs.scm" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld"))
 (library (scheme base) (source "$PWD/lib/scheme/base.sld"))
 (library (scheme read) (source "$PWD/lib/scheme/read.sld"))
 (program cyclic-app (source "$PWD/test/cyclic-datum-source.scm")))
EOF
if EMIT_VERBOSITY=quiet $TO build/emit build cyclic-app \
     --manifest "$TMP/emit-libs.scm" -o "$TMP/cyclic-app" >"$TMP/build.log" 2>&1; then
  got="$($TO "$TMP/cyclic-app" 2>"$TMP/aot.err")"
  if [ "$got" = '(#f #t #f #t #t #t #t #t #t #t #f #f #f #f #t #t #t #t #t #t)' ]; then
    ok "standalone labelled constants preserve topology"
  else
    bad "standalone labelled constants => [$got]"
    sed 's/^/         /' "$TMP/aot.err"
  fi
else
  bad "standalone labelled constants failed to build"
  sed 's/^/         /' "$TMP/build.log"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
