#!/usr/bin/env bash
# Program effects must precede later initializers on every compilation path.
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
repo=$PWD
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
export EMIT_CACHE="$work/cache" EMIT_VERBOSITY=quiet
source_host=${1:-}
checks=0
say "test ordered top-level forms -> ${source_host:-native and REPL}"
fixture() {
  local name=$1 expected=$2
  cat >"$work/$name.scm"
  if [ "$source_host" = --source ]; then
    chez --libdirs src --script src/compile.ss "$work/$name.scm" \
      -L "$repo/lib" -o "$work/$name-source" >"$work/compile.out" 2>"$work/compile.err" \
      || { cat "$work/compile.err" >&2; exit 1; }
    actual=$("$work/$name-source")
    [ "$actual" = "$expected" ] || { echo "$name source: $actual != $expected" >&2; exit 1; }
    checks=$((checks + 1))
  else
    for level in -O0 -O1 -O2; do
      actual=$(build/emit run "$level" -L "$repo/lib" "$work/$name.scm")
      [ "$actual" = "$expected" ] || { echo "$name run $level: $actual != $expected" >&2; exit 1; }
      checks=$((checks + 1))
    done
    build/emit build "$work/$name.scm" -L "$repo/lib" -o "$work/$name"
    actual=$("$work/$name")
    [ "$actual" = "$expected" ] || { echo "$name AOT: $actual != $expected" >&2; exit 1; }
    actual=$(build/emit repl -L "$repo/lib" <"$work/$name.scm" 2>"$work/repl.err")
    [ "$actual" = "$expected" ] || { echo "$name REPL: $actual != $expected" >&2; exit 1; }
    checks=$((checks + 2))
  fi
}
fixture mutation '(2 5 8)' <<'SCM'
(import (scheme base) (scheme write))
(define x 1)
(set! x 2)
(define y x)
(define p (make-parameter #f))
(p 5)
(define r (p))
(define toplevel-effect.0 7)
(set! toplevel-effect.0 8)
(define last toplevel-effect.0)
(write (list y r last))
SCM
fixture redefine 12 <<'SCM'
(import (scheme base) (scheme write))
(define x 1)
(display x)
(define x 2)
(display x)
SCM
fixture leading startinitend <<'SCM'
(import (scheme base) (scheme write))
(display "start")
(define x (begin (display "init") 42))
(display "end")
SCM
fixture discarded 42 <<'SCM'
(import (scheme base) (scheme write))
(begin (values 1 2) (display ""))
(define x 42)
(write x)
SCM
fixture caught caughtinitend <<'SCM'
(import (scheme base) (scheme write))
(guard (e (else (display "caught"))) (error "stop"))
(define x (begin (display "init") 42))
(display "end")
SCM
fixture record 2 <<'SCM'
(import (scheme base) (scheme write))
(define x 1)
(set! x 2)
(define-record-type item (make-item value) item? (value item-value))
(define r (make-item x))
(write (item-value r))
SCM
fixture srfi-runner '#t' <<'SCM'
(import (scheme base) (scheme write) (srfi 64))
(test-runner-current (test-runner-null))
(test-begin "ordered")
(define runner (test-runner-current))
; The REPL prints a bare expression's value, so bind test-end's result.
(define ended (test-end "ordered"))
(write (if runner #t #f))
SCM
# An effect that calls a top-level procedure must not move after later effects.
fixture procedure-effect 1234 <<'SCM'
(import (scheme base) (scheme write))
(define (one) (display "1"))
(one)
(display "2")
(define three (begin (display "3") 3))
(display "4")
SCM
fixture srfi-nested-runner '(2 0)' <<'SCM'
(import (scheme base) (scheme write) (srfi 64))
(define runner (test-runner-null))
(define (run-counts thunk)
  (let ((r (test-runner-null)))
    (test-with-runner r (thunk))
    (list (test-runner-pass-count r) (test-runner-fail-count r))))
(test-runner-current runner)
(test-begin "nested")
; Keep these expressions (the REPL prints values, so end each with no value).
(begin (test-equal '(1 0) (run-counts (lambda () (test-equal 1 1)))) (if #f #f))
(begin (test-equal 4 (+ 2 2)) (if #f #f))
(define ended (test-end "nested"))
(write (list (test-runner-pass-count runner) (test-runner-fail-count runner)))
SCM
say "test ordered top-level forms -> passed  [$checks checks]"
