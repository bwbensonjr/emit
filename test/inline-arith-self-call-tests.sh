#!/usr/bin/env bash
# IR-shape regression tests for change: inline-fixnum-arith-and-self-calls.
# Asserts the emitter's codegen decisions on the emitted LLVM IR (via
# build/scheme-run --emit):
#   A       - fixnum numeric primitives (+ - = <) get an inline fast path guarded
#             by a fixnum-tag test, with the rt_* call kept on the slow path.
#   B-self  - a function's self-call is a direct `call fastcc @code_N` reusing
#             %self, not a closure-loaded indirect call, and stays musttail in
#             tail position.
# Value-equivalence is covered by the demo suites; this pins the generated shape.
# Run from the repo root: test/inline-arith-self-call-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN=build/scheme-run
make "$RUN" >/dev/null 2>&1 || { echo "build failed"; exit 1; }

pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# emit IR for a program (stdin) to a temp file, echo the path
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
emit () { "$RUN" --emit > "$TMP/out.ll" 2>/dev/null; echo "$TMP/out.ll"; }

# want <name> <file> <regex>   -- IR must contain a line matching regex
want () { if grep -Eq "$3" "$2"; then ok "$1"; else bad "$1 (missing: $3)"; fi; }
# reject <name> <file> <regex> -- IR must NOT contain a line matching regex
reject () { if grep -Eq "$3" "$2"; then bad "$1 (present but should not be: $3)"; else ok "$1"; fi; }

echo "inline-fixnum-arith / direct-self-call IR-shape tests"

# --- A: inline fixnum arithmetic --------------------------------------------
ll="$(printf '(define (f a b) (+ a b)) (display (f 1 2))\n' | emit)"
want   "A: + fixnum guard"    "$ll" 'and i64 %t[0-9]+, 7'
want   "A: + native add"      "$ll" 'add i64 %a0, %a1'
want   "A: + rt_add slow path" "$ll" 'call i64 @rt_add\(i64 %a0, i64 %a1\)'

ll="$(printf '(define (f a b) (- a b)) (display (f 3 1))\n' | emit)"
want   "A: - native sub"      "$ll" 'sub i64 %a0, %a1'

ll="$(printf '(define (f a b) (= a b)) (display (f 1 1))\n' | emit)"
want   "A: = native icmp eq"  "$ll" 'icmp eq i64 %a0, %a1'
want   "A: = boolean select"  "$ll" 'select i1 %t[0-9]+, i64 257, i64 1'

ll="$(printf '(define (f a b) (< a b)) (display (f 1 2))\n' | emit)"
want   "A: < native icmp slt" "$ll" 'icmp slt i64 %a0, %a1'

# --- B-self: direct self-call -----------------------------------------------
ack='(define (ack m n) (cond ((= m 0) (+ n 1)) ((= n 0) (ack (- m 1) 1)) (else (ack (- m 1) (ack m (- n 1)))))) (display (ack 3 3))'
ll="$(printf '%s\n' "$ack" | emit)"
want   "B-self: direct call to @code_N reusing %self" "$ll" 'call fastcc i64 @code_[0-9]+\(i64 %self,'
want   "B-self: tail self-call is musttail"           "$ll" 'musttail call fastcc i64 @code_[0-9]+\(i64 %self,'

# --- B-self negative: a call to a DIFFERENT function stays indirect ----------
# (h calls g, not itself -> must remain a closure-loaded indirect call, B-general
# is out of scope for this change)
mut='(define (g x) (+ x 1)) (define (h y) (g y)) (display (h 5))'
ll="$(printf '%s\n' "$mut" | emit)"
reject "B-self: non-self call NOT direct" "$ll" 'call fastcc i64 @code_[0-9]+\(i64 %self,'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
