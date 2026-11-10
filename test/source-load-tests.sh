#!/usr/bin/env bash
# Procedure-based source loading across the REPL and emit run hosts.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh

emit="$PWD/build/emit"
manifest="$PWD/emit-libs.scm"
if [ ! -x "$emit" ]; then
  echo "source load tests require build/emit; run make emit first" >&2
  exit 1
fi

tmp="$(mktemp -d)"
if [ "${EMIT_KEEP_TEST_TMP:-0}" = 1 ]; then
  echo "test: retain source load fixtures -> $tmp" >&2
else
  trap 'rm -rf "$tmp"' EXIT
fi
pass=0
fail=0

ok() { echo "  [OK  ] $1"; pass=$((pass + 1)); }
bad() { echo "  [FAIL] $1" >&2; fail=$((fail + 1)); }
has_line() { grep -Fqx -- "$2" "$1"; }
has_line_once() {
  local count
  count=$(grep -Fxc -- "$2" "$1" || true)
  [ "$count" -eq 1 ]
}

mkdir -p "$tmp/tree/outer"
cat > "$tmp/define.scm" <<'SCHEME'
(define loaded-value 40)
(+ 10 20)
SCHEME
cat > "$tmp/increment.scm" <<'SCHEME'
(set! load-counter (+ load-counter 1))
SCHEME
cat > "$tmp/two.scm" <<'SCHEME'
(set! loaded-value (+ loaded-value 2))
SCHEME
cat > "$tmp/bad-runtime.scm" <<'SCHEME'
(set! load-counter (+ load-counter 1))
(error "loader-stop")
(set! load-counter (+ load-counter 100))
SCHEME
cat > "$tmp/bad-reader.scm" <<'SCHEME'
(set! load-counter (+ load-counter 1))
(
(set! load-counter (+ load-counter 100))
SCHEME
cat > "$tmp/bad-compile.scm" <<'SCHEME'
(set! load-counter (+ load-counter 1))
(missing-load-compiler-binding)
(set! load-counter (+ load-counter 100))
SCHEME
cat > "$tmp/feature.scm" <<'SCHEME'
(import (scheme char))
(define-syntax double
  (syntax-rules () ((_ value) (+ value value))))
(define loaded-char-result (char-alphabetic? #\a))
SCHEME
cat > "$tmp/ports.scm" <<'SCHEME'
(display "PORT-MARKER")
(newline)
(+ 10 20)
SCHEME
cat > "$tmp/tree/outer/main.scm" <<'SCHEME'
(load "sibling.scm")
SCHEME
cat > "$tmp/tree/outer/sibling.scm" <<'SCHEME'
(set! sibling-count (+ sibling-count 1))
SCHEME
mkdir -p "$tmp/tree/splice/parts"
cat > "$tmp/tree/splice/main.scm" <<'SCHEME'
(include "parts/first.scm")
(set! trace (cons 'outer-end trace))
SCHEME
cat > "$tmp/tree/splice/parts/first.scm" <<'SCHEME'
(set! trace (cons 'include-before trace))
(load "child.scm")
(include "second.scm")
(set! trace (cons 'include-after trace))
SCHEME
cat > "$tmp/tree/splice/child.scm" <<'SCHEME'
(include "child-tail.scm")
SCHEME
cat > "$tmp/tree/splice/child-tail.scm" <<'SCHEME'
(set! trace (cons 'child trace))
SCHEME
cat > "$tmp/tree/splice/parts/second.scm" <<'SCHEME'
(set! trace (cons 'second trace))
SCHEME
cat > "$tmp/redefine-old.scm" <<'SCHEME'
(define evolving-proc (lambda () 10))
SCHEME
cat > "$tmp/redefine-new.scm" <<'SCHEME'
(define saved-proc evolving-proc)
(define evolving-proc (lambda () 20))
SCHEME
cat > "$tmp/escape.scm" <<'SCHEME'
(dynamic-wind
  (lambda () (set! wind-before (+ wind-before 1)))
  (lambda () (escape-load 'escaped))
  (lambda () (set! wind-after (+ wind-after 1))))
(set! after-escape (+ after-escape 1))
SCHEME
cat > "$tmp/escape-wrapper.scm" <<'SCHEME'
(load "escape.scm")
(set! wrapper-after (+ wrapper-after 1))
SCHEME
cat > "$tmp/after-escape.scm" <<'SCHEME'
(set! post-escape (+ post-escape 1))
SCHEME
cat > "$tmp/gc-load.scm" <<'SCHEME'
(define gc-garbage-slot #f)
(let loop ((n 0))
  (if (< n 150000)
      (begin
        (set! gc-garbage-slot (cons (string-copy "temporary garbage") '()))
        (loop (+ n 1)))
      'done))
SCHEME
: > "$tmp/empty.scm"

echo "REPL load scope, errors, ports, paths, and escapes"
cat > "$tmp/repl.in" <<SCHEME
(import (scheme load))
(define load-counter 0)
(define load-alias load)
(load-alias "$tmp/define.scm")
loaded-value
(load "$tmp/two.scm")
loaded-value
(load "$tmp/feature.scm")
(double 21)
loaded-char-result
(load "$tmp/redefine-old.scm")
(load "$tmp/redefine-new.scm")
(list (saved-proc) (evolving-proc))
(load "$tmp/increment.scm")
(load "$tmp/increment.scm")
(list 'repeated load-counter)
(set! load-counter 0)
(guard (e (#t 'caught)) (load "$tmp/bad-runtime.scm"))
(list 'runtime-count load-counter)
(guard (e (#t 'reader-caught)) (load "$tmp/bad-reader.scm"))
(list 'reader-count load-counter)
(guard (e (#t 'compile-caught)) (load "$tmp/bad-compile.scm"))
(list 'compile-count load-counter)
(let ((before-in (current-input-port)) (before-out (current-output-port))
      (out (open-output-string)))
  (parameterize ((current-output-port out))
    (load "$tmp/ports.scm"))
  (list (eq? before-in (current-input-port))
        (eq? before-out (current-output-port))
        (equal? (get-output-string out) "PORT-MARKER\\n")))
(load (string-append "$tmp/" "empty.scm"))
(guard (e ((file-error? e) (quote missing-caught))) (load "$tmp/missing.scm"))
(guard (e (#t 'type-caught)) (load 12))
(guard (e (#t 'arity-caught)) (load "$tmp/empty.scm" 'interaction))
(guard (e (#t (display (error-object-message e)) (newline) 'library-caught))
  (load "$tmp/define-library.scm"))
42
SCHEME
cat > "$tmp/define-library.scm" <<'SCHEME'
(define-library (unsupported-loaded-library)
  (export value)
  (begin (define value 1)))
SCHEME
"$emit" repl < "$tmp/repl.in" > "$tmp/repl.out" 2> "$tmp/repl.err"

for expected in 40 42 '#t' '(repeated 2)' '(runtime-count 1)' \
  '(reader-count 2)' '(compile-count 3)' '(10 20)' caught reader-caught \
  compile-caught type-caught arity-caught library-caught missing-caught; do
  if has_line "$tmp/repl.out" "$expected"; then :; else
    bad "REPL expected output line $expected"
  fi
done
if ! has_line "$tmp/repl.out" 100 && ! has_line "$tmp/repl.out" 101 \
  && ! has_line "$tmp/repl.out" 102 && ! has_line "$tmp/repl.out" 103 \
  && ! has_line "$tmp/repl.out" 30; then
  ok "REPL loads stop at runtime, reader, and compile failures; completed effects remain"
else
  bad "REPL executed a later form after load failure or echoed a loaded expression"
fi
if has_line "$tmp/repl.out" "(#t #t #t)" && ! grep -Fq 'PORT-MARKER' "$tmp/repl.out"; then
  ok "loaded output uses the parameterized port and current input/output port identities persist"
else
  bad "loaded output or current port identity changed"
fi
if ! grep -q 'loader-stop' "$tmp/repl.err" && ! grep -q 'reader-caught' "$tmp/repl.err"; then
  ok "caught loader failures stay in Scheme handlers"
else
  bad "caught loader failure leaked to host stderr"
fi
if grep -Fq "libraries are not defined at the prompt: (unsupported-loaded-library)" \
  "$tmp/repl.out" "$tmp/repl.err"; then
  ok "loaded define-library retains the named interaction-context diagnostic"
else
  bad "loaded define-library did not use the existing named diagnostic"
fi

# Nested relative loads resolve beside their current source even when the outer file
# is outside cwd. A later outer relative path still resolves against the working dir.
cat > "$tmp/tree/repl-paths.in" <<SCHEME
(import (scheme load))
(define sibling-count 0)
(define load-counter 0)
(load "tree/outer/main.scm")
sibling-count
(load "define.scm")
loaded-value
SCHEME
(cd "$tmp" && "$emit" repl --manifest "$manifest" --no-manifest-chain < tree/repl-paths.in) \
  > "$tmp/paths.out" 2> "$tmp/paths.err"
if has_line_once "$tmp/paths.out" 1 && has_line_once "$tmp/paths.out" 40; then
  ok "nested sibling path and restored outer working-directory resolution"
else
  bad "nested path resolution"
fi

cat > "$tmp/tree/splice.in" <<'SCHEME'
(import (scheme load))
(define trace '())
(load "tree/splice/main.scm")
(reverse trace)
SCHEME
(cd "$tmp" && "$emit" repl --manifest "$manifest" --no-manifest-chain < tree/splice.in) \
  > "$tmp/splice.out" 2> "$tmp/splice.err"
if has_line_once "$tmp/splice.out" '(include-before child second include-after outer-end)'; then
  ok "nested load restores source-relative include origins and pending splice order"
else
  bad "nested include/splice ordering"
fi

# Capture the continuation in the same top-level form that invokes load. Invoking it
# from the loaded file must unwind the loader, run dynamic-wind cleanup, and skip both
# the loaded file's following form and continue at the caller's post-call/cc forms.
cat > "$tmp/escape.in" <<SCHEME
(import (scheme load))
(define wind-before 0)
(define wind-after 0)
(define after-escape 0)
(define post-escape 0)
(define wrapper-after 0)
(define escape-load #f)
(let ((escape-result
        (call/cc (lambda (k)
                   (set! escape-load k)
                   (load "escape-wrapper.scm")))))
  (list escape-result wind-before wind-after after-escape wrapper-after))
(load "after-escape.scm")
post-escape
(+ 20 22)
SCHEME
(cd "$tmp" && "$emit" repl --manifest "$manifest" --no-manifest-chain < escape.in) \
  > "$tmp/escape.out" 2> "$tmp/escape.err"
if has_line_once "$tmp/escape.out" "(escaped 1 1 0 0)" \
  && has_line_once "$tmp/escape.out" 1 && has_line_once "$tmp/escape.out" 42; then
  ok "same-form continuation escape runs dynamic-wind cleanup and the REPL remains usable"
else
  bad "continuation escape/dynamic-wind counts"
fi

cat > "$tmp/gc.in" <<SCHEME
(import (scheme load))
(define gc-held (vector (list 'retained 1) (lambda (n) (+ n 25))))
(display "GC-LIVE-BEGIN" (current-error-port))
(newline (current-error-port))
(load "$tmp/gc-load.scm")
(display "GC-LIVE-END" (current-error-port))
(newline (current-error-port))
(list (car (vector-ref gc-held 0)) ((vector-ref gc-held 1) 17))
SCHEME
GC_PRINT_STATS=1 GC_INITIAL_HEAP_SIZE=65536 GC_FREE_SPACE_DIVISOR=1 \
  EMIT_VERBOSITY=quiet "$emit" repl --manifest "$manifest" --no-manifest-chain \
  < "$tmp/gc.in" > "$tmp/gc.out" 2> "$tmp/gc.err"
if has_line_once "$tmp/gc.out" '(retained 42)' \
  && awk '/GC-LIVE-BEGIN/{inside=1; next} /GC-LIVE-END/{inside=0} \
         inside && /GC #[0-9]+/{found=1} END{exit !found}' "$tmp/gc.err"; then
  ok "caller values survive nested compilation and allocations that trigger collection"
else
  bad "load heap survival / collection stress"
fi

echo "emit run load scope and host boundaries"
cat > "$tmp/run-one.scm" <<'SCHEME'
(define run-loaded 40)
(define (run-add n) (+ n 2))
SCHEME
cat > "$tmp/run-two.scm" <<'SCHEME'
(import (scheme write))
(set! run-loaded (run-add run-loaded))
(write run-loaded)
(newline)
SCHEME
cat > "$tmp/run.scm" <<SCHEME
(import (scheme base) (scheme load))
(import (scheme write))
(define x 900)
(define (checked-load name) (load name))
(checked-load "$tmp/run-one.scm")
(checked-load "$tmp/run-two.scm")
(write x)
(newline)
SCHEME
if "$emit" run "$tmp/run.scm" > "$tmp/run.out" 2> "$tmp/run.err"; then
  run_output=$(cat "$tmp/run.out")
else
  run_output=""
fi
printf '%s\n' 42 900 > "$tmp/run.expected"
printf '%s\n' "$run_output" > "$tmp/run.actual"
if cmp -s "$tmp/run.expected" "$tmp/run.actual"; then
  ok "emit run load scope persists across calls and is separate from batch bindings"
else
  bad "emit run load scope"
fi

cat > "$tmp/no-capture.scm" <<SCHEME
(import (scheme base) (scheme load))
(import (scheme write))
(define x 900)
(guard (e (#t (display "isolated"))) (load "$tmp/read-x.scm"))
(newline)
SCHEME
printf '%s\n' '(import (scheme write))' '(write x)' > "$tmp/read-x.scm"
if "$emit" run "$tmp/no-capture.scm" > "$tmp/no-capture.out" 2> "$tmp/no-capture.err"; then
  no_capture_output=$(cat "$tmp/no-capture.out")
else
  no_capture_output=""
fi
if [ "$no_capture_output" = isolated ]; then
  ok "loaded run file cannot capture batch top-level bindings; its failure is catchable"
else
  bad "emit run load scope captured a batch binding or lost catchability"
fi

# A program admits both units before running initializers. Loading from a's
# initializer must still initialize b, which the program has not reached yet.
mkdir -p "$tmp/init-lib"
cat > "$tmp/init-lib/load-init-a.sld" <<SCHEME
(define-library (load-init-a)
  (export a)
  (import (scheme base) (scheme load))
  (begin (define a (begin (load "$tmp/init-loaded.scm") 1))))
SCHEME
cat > "$tmp/init-lib/load-init-b.sld" <<'SCHEME'
(define-library (load-init-b)
  (export b)
  (import (scheme base))
  (begin (display "b-init") (newline) (define b 7)))
SCHEME
cat > "$tmp/init-loaded.scm" <<'SCHEME'
(import (scheme base) (load-init-b))
(write b)
(newline)
SCHEME
cat > "$tmp/init-main.scm" <<'SCHEME'
(import (scheme base) (load-init-a) (load-init-b))
(write (list a b))
(newline)
SCHEME
printf 'b-init\n7\n(1 7)\n' > "$tmp/init.expected"
if "$emit" run -L "$tmp/init-lib" "$tmp/init-main.scm" \
    > "$tmp/init.out" 2> "$tmp/init.err" \
    && cmp -s "$tmp/init.expected" "$tmp/init.out"; then
  ok "load during library initialization initializes an admitted dependency exactly once"
else
  bad "load during library initialization skipped or repeated a dependency"
fi

# A statically linked program resolves the public binding and catches its unsupported
# host error without a compiler or LLVM payload in the executable.
cat > "$tmp/static.scm" <<SCHEME
(import (scheme base) (scheme load) (scheme write))
(guard (e (#t (display "unsupported") (newline)))
  (load "unused.scm"))
SCHEME
if "$emit" build "$tmp/static.scm" -o "$tmp/static" > /dev/null 2> "$tmp/static-build.err"; then
  static_output=$("$tmp/static")
else
  static_output=""
fi
if [ "$static_output" = unsupported ]; then
  ok "static executable reports catchable unsupported-host error"
else
  bad "static unsupported-host fixture did not build or handle the error"
fi
if command -v otool >/dev/null 2>&1; then
  deps=$(otool -L "$tmp/static")
elif command -v ldd >/dev/null 2>&1; then
  deps=$(ldd "$tmp/static" 2>&1 || true)
else
  deps=""
fi
case "$deps" in
  *LLVM*|*clang*|*schemec*) bad "static executable links a compiler or LLVM dependency" ;;
  *) ok "static load binding adds no compiler or LLVM shared-library dependency" ;;
esac

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
