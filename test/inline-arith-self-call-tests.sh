#!/usr/bin/env bash
# IR-shape regression tests for change: inline-fixnum-arith-and-self-calls.
# Asserts the emitter's codegen decisions on the emitted LLVM IR (via
# `emit run --emit`):
#   A       - fixnum numeric primitives (+ - = <) get an inline fast path guarded
#             by a fixnum-tag test, with the rt_* call kept on the slow path.
#             The arithmetic ops (+ - *) additionally detect overflow and branch
#             to that SAME slow call, so the runtime stays the single definition
#             of what an out-of-range result means (change: fixnum-overflow-trap).
#   B-self  - a function's self-call is a direct `call fastcc @code_N` reusing
#             %self, not a closure-loaded indirect call, and stays musttail in
#             tail position.
# Value-equivalence is covered by the demo suites; this pins the generated shape.
# Run from the repo root: test/inline-arith-self-call-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "build failed"; exit 1; }

pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# emit IR for a program (stdin) to a temp file, echo the path
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
emit () { $RUN --emit > "$TMP/out.ll" 2>/dev/null; echo "$TMP/out.ll"; }

# want <name> <file> <regex>   -- IR must contain a line matching regex
want () { if grep -Eq "$3" "$2"; then ok "$1"; else bad "$1 (missing: $3)"; fi; }
# reject <name> <file> <regex> -- IR must NOT contain a line matching regex
reject () { if grep -Eq "$3" "$2"; then bad "$1 (present but should not be: $3)"; else ok "$1"; fi; }
# eq <name> <actual> <expected> -- an exact count must match
eq () { if [ "$2" = "$3" ]; then ok "$1 ($2)"; else bad "$1 (got $2, expected $3)"; fi; }
# gt <name> <a> <b> -- a must be strictly greater than b
gt () { if [ "$2" -gt "$3" ]; then ok "$1 ($2 > $3)"; else bad "$1 (got $2, not > $3)"; fi; }

# Every probe below calls its function TWICE (change: simplify-known-calls).  A
# singly-called helper is now inlined into its one call site and, with constant
# arguments, folded away entirely -- so a one-call probe would compile to a bare
# constant and never reach the emitter path it is here to pin.  Two call sites
# keep the function a function.  This is a property of the probes, not of the
# codegen under test: the emitted shape for a real function is unchanged.

echo "inline-fixnum-arith / direct-self-call IR-shape tests"

# --- A: inline fixnum arithmetic --------------------------------------------
ll="$(printf '(define (f a b) (+ a b)) (display (f 1 2)) (display (f 3 4))\n' | emit)"
want   "A: + fixnum guard"    "$ll" 'and i64 %t[0-9]+, 7'
want   "A: + checked add"     "$ll" 'call \{i64, i1\} @llvm\.sadd\.with\.overflow\.i64\(i64 %a0, i64 %a1\)'
want   "A: + rt_add slow path" "$ll" 'call i64 @rt_add\(i64 %a0, i64 %a1\)'
# The overflow edge targets the SAME block the tag test falls back to (design D3),
# so there is exactly ONE rt_add call and one phi -- the slow path is not cloned.
want   "A: + overflow branches to fixslow" "$ll" 'br i1 %t[0-9]+, label %fixslow[0-9]+, label %fixmerge[0-9]+'
eq     "A: + exactly one rt_add call" "$(grep -c 'call i64 @rt_add(i64 %a0, i64 %a1)' "$ll")" 1
# Slow blocks are SHARED, not cloned: across the whole module the arithmetic
# diamonds have two edges into one slow block each, so branch targets outnumber
# block definitions.  (A per-diamond count would need the label numbering; this
# module-wide inequality is the same property, stated cheaply.)
gt     "A: fixslow blocks are shared, not cloned" \
       "$(grep -coE 'label %fixslow[0-9]+' "$ll")" "$(grep -cE '^fixslow[0-9]+:' "$ll")"

ll="$(printf '(define (f a b) (- a b)) (display (f 3 1)) (display (f 9 4))\n' | emit)"
want   "A: - checked sub"     "$ll" 'call \{i64, i1\} @llvm\.ssub\.with\.overflow\.i64\(i64 %a0, i64 %a1\)'

ll="$(printf '(define (f a b) (* a b)) (display (f 3 1)) (display (f 9 4))\n' | emit)"
want   "A: * untags one operand" "$ll" 'ashr i64 %a0, 3'
want   "A: * checked mul"     "$ll" 'call \{i64, i1\} @llvm\.smul\.with\.overflow\.i64'

ll="$(printf '(define (f a b) (= a b)) (display (f 1 1)) (display (f 1 2))\n' | emit)"
want   "A: = native icmp eq"  "$ll" 'icmp eq i64 %a0, %a1'
want   "A: = boolean select"  "$ll" 'select i1 %t[0-9]+, i64 257, i64 1'

ll="$(printf '(define (f a b) (< a b)) (display (f 1 2)) (display (f 4 3))\n' | emit)"
want   "A: < native icmp slt" "$ll" 'icmp slt i64 %a0, %a1'

# --- B-self: direct self-call -----------------------------------------------
ack='(define (ack m n) (cond ((= m 0) (+ n 1)) ((= n 0) (ack (- m 1) 1)) (else (ack (- m 1) (ack m (- n 1)))))) (display (ack 3 3))'
ll="$(printf '%s\n' "$ack" | emit)"
want   "B-self: direct call to @code_N reusing %self" "$ll" 'call fastcc i64 @code_[0-9]+\(i64 %self,'
want   "B-self: tail self-call is musttail"           "$ll" 'musttail call fastcc i64 @code_[0-9]+\(i64 %self,'

# --- B-self negative: a call to a DIFFERENT function stays indirect ----------
# (h calls g, not itself -> must remain a closure-loaded indirect call, B-general
# is out of scope for this change).  Both are called twice so neither is inlined
# away before the emitter sees the call (see the note on the probes above).
mut='(define (g x) (+ x 1)) (define (h y) (g y)) (display (h 5)) (display (h 6)) (display (g 7))'
ll="$(printf '%s\n' "$mut" | emit)"
reject "B-self: non-self call NOT direct" "$ll" 'call fastcc i64 @code_[0-9]+\(i64 %self,'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
