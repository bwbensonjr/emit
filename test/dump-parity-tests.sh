#!/usr/bin/env bash
# dump-parity-tests.sh -- the shipped binary's stage dump must agree with the Chez
# driver's (change: emit-dump-stages, design D5).  Chez-gated: this is the check that
# turns the Chez driver's `pretty-print` dumper into an independent REFERENCE for the
# in-language one, rather than leaving the shipped dump unverifiable.
#
# Comparison is STRUCTURAL (test/dump-parity.ss reads both streams back as data): the
# two dumpers are independent, so bracket style and line breaking differ by design.
#
# Two paths, each compared against its own reference, because the compiler has two
# front halves and the doors do not use the same one:
#
#   modular  (compile-program-with-imports, stage `parse+rename+imports`) -- what the
#            Chez driver takes by default and what EVERY shipped door takes, since
#            (scheme base) is auto-imported.  chez driver  vs  `emit run --dump`.
#   whole-program (compile-forms, stage `parse+rename`) -- the Chez driver's
#            --no-prelude path and the `schemec` filter.  chez --no-prelude  vs
#            `EMIT_DUMP_LEVEL=2 build/schemec` (the filter has no flags; the
#            environment variable IS its channel).
#
# Under --no-prelude the prelude's procedures are unbound, so those cases stay inside
# the primitives.
#
# Run from the repo root: test/dump-parity-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

command -v chez >/dev/null 2>&1 || { echo "chez not found -- skipping dump parity"; exit 0; }
make emit >/dev/null 2>&1 || { echo "fatal: could not build build/emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

# Compare one program's dump on one path.  $1 = case name, $2 = path (modular|whole),
# $3 = source text.
#
# Both sides run at EMIT_VERBOSITY=quiet: an explicit --dump outranks the verbosity level
# (the Chez driver's own precedence, which the doors copy), so quiet keeps the dump while
# stripping the surrounding link/status narration -- which would otherwise land inside the
# last section and fail to read back as data.
parity () {
  local name="$1" path="$2" src="$3"
  printf '%s\n' "$src" > "$TMP/$name.scm"
  local chez_extra="" ok=1
  [ "$path" = "whole" ] && chez_extra="--no-prelude"
  if ! EMIT_VERBOSITY=quiet chez --libdirs src --script src/compile.ss \
         "$TMP/$name.scm" -o "$TMP/$name.chez" $chez_extra --dump \
         >/dev/null 2>"$TMP/$name.ref.err"; then
    echo "  [FAIL] $name: the Chez driver failed"; sed 's/^/         /' "$TMP/$name.ref.err" | tail -5
    fail=$((fail+1)); return
  fi
  if [ "$path" = "modular" ]; then
    EMIT_VERBOSITY=quiet build/emit run --dump "$TMP/$name.scm" \
      >/dev/null 2>"$TMP/$name.got.err" || ok=0
  else
    EMIT_DUMP_LEVEL=2 build/schemec <"$TMP/$name.scm" \
      >/dev/null 2>"$TMP/$name.got.err" || ok=0
  fi
  if [ "$ok" -eq 0 ]; then
    echo "  [FAIL] $name: the shipped binary failed"; sed 's/^/         /' "$TMP/$name.got.err" | tail -5
    fail=$((fail+1)); return
  fi
  printf '  %-16s ' "$name"
  if chez --script test/dump-parity.ss "$TMP/$name.ref.err" "$TMP/$name.got.err"; then
    pass=$((pass+1))
  else
    fail=$((fail+1))
  fi
}

echo "modular path (every shipped door): chez driver vs emit run --dump"

# recursion + a let-bound temporary from the n-ary `=` desugaring
parity fact modular '(letrec ([fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))]) (fact 5))'

# a captured mutable (convert-assignments must box it) behind a closure
parity counter modular '(define (counter) (let ([n 0]) (lambda () (set! n (+ n 1)) n)))
(define c (counter))
(c) (c)'

# a user macro: the expand stage must agree after hygienic renaming, which allocates
# gensyms -- so this also checks the two paths keep the SAME counter sequence.
parity macro modular '(define-syntax swap!
  (syntax-rules () [(_ a b) (let ([tmp a]) (set! a b) (set! b tmp))]))
(define x 1) (define y 2) (swap! x y) (list x y)'

# quote of nested structure: the fixnum/char/string/#f/dotted-pair const arms of both
# printers.  No vector: a vector CONSTANT does not compile at all ("emit: bad const"),
# independent of dumping.
parity data modular '(define v (quote (1 (2 #\a "s") #f (x . y)))) (cons v (quote end))'

# a prelude procedure, so the program resolves an IMPORTED global (resolve-globals)
parity imports modular '(map (lambda (x) (* x x)) (list 1 2 3))'

# a string constant holding a quote, a backslash and a newline.  The dump must READ BACK
# as the same data, which is only true because the runtime printer escapes in write style
# -- it did not, so this case produced `(const "a"b")` and no reader could read it.
parity escapes modular '(display "a\"b\\c\nd")'

echo "whole-program path (schemec): chez driver --no-prelude vs schemec"

# primitives only -- the prelude's procedures are unbound on this path
parity fact-np whole '(letrec ([fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))]) (fact 5))'
parity counter-np whole '(define (counter) (let ([n 0]) (lambda () (set! n (+ n 1)) n)))
(define c (counter))
(c) (c)'
parity data-np whole '(define v (quote (1 (2 #\a "s") #f (x . y)))) (cons v (quote end))'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
