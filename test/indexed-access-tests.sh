#!/usr/bin/env bash
# indexed-access-tests.sh -- change: checked-indexed-access (GitHub issue #70).
#
# Every indexed accessor validates its index against the length in the object's own
# header, and an out-of-range index is a diagnostic through the same trap mechanism
# the fixnum overflow diagnostics use.  What this pins:
#
#   * out-of-range READS trap instead of returning the heap word at the computed
#     address -- `(vector-ref (vector 1 2 3) 5)` used to print `()`;
#   * out-of-range WRITES do not reach memory, and the observable is a NEIGHBOURING
#     object: a store that trapped after landing is indistinguishable from one that
#     never happened unless something else's contents are checked afterwards, which
#     is why that case runs in the REPL (the one door that survives a trap and can
#     still be asked what `b` holds);
#   * NEGATIVE indices trap -- they used to read backwards from the object;
#   * `substring` validates both bounds AND their order; the reversed pair used to
#     compute a negative length, hand it to a size_t parameter, and die on a signal,
#     so the exit status is asserted to be non-zero AND below 128;
#   * a NEGATIVE construction size traps rather than producing an object whose
#     recorded length is negative (`(make-vector -1 0)` reported length -1, and
#     `(make-string -1 #\a)` died on SIGBUS);
#   * the bound for a string is its CODEPOINT count, not its byte length (design
#     D4) -- a multi-byte string indexed at its last codepoint must still work,
#     which is the case a plausible `str_len` guard wrongly rejects;
#   * IN-RANGE access is unchanged, checked first: an off-by-one in a bound test
#     breaks these before it breaks any trap;
#   * both doors agree -- the in-process runner and a standalone executable report
#     the same diagnostic -- and the runner's host survives the trap.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/indexed-access-tests.sh
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
HOST="build/emit repl"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

check () {  # <name> <program-text> <expected stdout>
  printf '%s\n' "$2" > "$TMP/p.scm"
  local got; got="$($RUN < "$TMP/p.scm" 2>"$TMP/e")"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => $got (expected $3)"; sed 's/^/         /' "$TMP/e"; fi
}

# A trap must report the given substring, exit non-zero, and NOT die on a signal.
# The 128 bound is the point of the substring cases: exit 139 (SIGSEGV) and 138
# (SIGBUS) are what two of these did before the guards, and a signal is not a
# diagnostic no matter what the shell reports.
trap_msg () {  # <name> <program-text> <substring the diagnostic must contain>
  printf '%s\n' "$2" > "$TMP/p.scm"
  local rc; $RUN < "$TMP/p.scm" >"$TMP/o" 2>"$TMP/e"; rc=$?
  if [ "$rc" -eq 0 ]; then
    bad "$1 (no trap; produced $(cat "$TMP/o"))"
  elif [ "$rc" -ge 128 ]; then
    bad "$1 (died on a signal: exit $rc): $(tail -1 "$TMP/e")"
  elif grep -qF -- "$3" "$TMP/e"; then
    ok "$1 => $(grep -m1 -F -- "$3" "$TMP/e")"
  else
    bad "$1 (trapped, but the message lacks '$3'): $(tail -1 "$TMP/e")"
  fi
}

repl () {  # <name> <expected newline-joined stdout>  <<forms
  local name="$1" want="$2"
  cat > "$TMP/r.scm"
  local got; got="$($HOST < "$TMP/r.scm" 2>/dev/null)"
  if [ "$got" = "$want" ]; then ok "$name"
  else
    bad "$name"
    echo "         got:  $(echo "$got" | tr '\n' '|')"
    echo "         want: $(echo "$want" | tr '\n' '|')"
  fi
}

echo "indexed access: an out-of-range index is a diagnostic, never an unchecked access"

# --- IN-RANGE access is unchanged --------------------------------------------
# First, for the same reason the overflow suite checks the boundary values first: a
# bound test that is off by one breaks these, not the traps.  Index 0 and
# length-1 are the two ends a `<=` where `<` belongs gets wrong.
check "every vector index from 0 to length-1" \
  '(let ((v (vector 10 20 30 40)))
     (display (list (vector-ref v 0) (vector-ref v 1) (vector-ref v 2) (vector-ref v 3))))' \
  '(10 20 30 40)'
check "every string index from 0 to length-1" \
  '(let ((s "abcd"))
     (display (list (string-ref s 0) (string-ref s 1) (string-ref s 2) (string-ref s 3))))' \
  '(a b c d)'
check "every bytevector index from 0 to length-1" \
  '(let ((b (bytevector 5 6 7)))
     (display (list (bytevector-u8-ref b 0) (bytevector-u8-ref b 1) (bytevector-u8-ref b 2))))' \
  '(5 6 7)'
check "in-range writes still land" \
  '(let ((v (make-vector 3 0)) (b (make-bytevector 2 0)) (s (make-string 2 #\x)))
     (vector-set! v 2 99) (bytevector-u8-set! b 1 42) (string-set! s 0 #\y)
     (display (list (vector-ref v 2) (bytevector-u8-ref b 1) s)))' \
  '(99 42 yx)'
check "substring at both bounds is unchanged" \
  '(display (list (substring "abcdef" 0 6) (substring "abcdef" 2 4) (substring "abcdef" 3 3)))' \
  '(abcdef cd )'
check "a zero-length construction is not a negative one" \
  '(display (list (vector-length (make-vector 0 0)) (bytevector-length (make-bytevector 0 0))
                  (string-length (make-string 0 #\a))))' \
  '(0 0 0)'

# --- the string bound is a CODEPOINT bound (design D4) -----------------------
# "h<a-acute>llo" is 5 codepoints in 6 bytes.  A guard written against str_len
# accepts index 5 (past the end) and, on a longer string, would reject a valid
# index; a guard against str_cplen gets both right.  This case is the reason the
# distinction is in the design at all.
NONASCII='hállo'
check "a multi-byte string reports its codepoint length" \
  "(display (string-length \"$NONASCII\"))" '5'
check "a multi-byte string indexed at its last codepoint" \
  "(display (string-ref \"$NONASCII\" 4))" 'o'
check "a multi-byte string indexed across the wide character" \
  "(display (list (string-ref \"$NONASCII\" 0) (string-ref \"$NONASCII\" 1) (string-ref \"$NONASCII\" 2)))" \
  '(h á l)'
check "substring spanning a multi-byte character" \
  "(display (list (substring \"$NONASCII\" 0 3) (substring \"$NONASCII\" 1 2)))" \
  '(hál á)'
# One past the last codepoint -- inside the BYTE length, so this is the case a
# str_len guard would wave through.
trap_msg "one past the last codepoint of a multi-byte string" \
  "(display (string-ref \"$NONASCII\" 5))" "string-ref: index out of range: 5 (length 5)"

# --- out-of-range READS trap -------------------------------------------------
trap_msg "a vector read past the end" '(display (vector-ref (vector 1 2 3) 5))' \
  "vector-ref: index out of range: 5 (length 3)"
trap_msg "a vector read at the length" '(display (vector-ref (vector 1 2 3) 3))' \
  "vector-ref: index out of range: 3 (length 3)"
trap_msg "a string read at the length" '(display (string-ref "abc" 3))' \
  "string-ref: index out of range: 3 (length 3)"
trap_msg "a string read far past the end" '(display (string-ref "abc" 100000))' \
  "string-ref: index out of range: 100000 (length 3)"
trap_msg "a bytevector read past the end" '(display (bytevector-u8-ref (bytevector 1 2) 7))' \
  "bytevector-u8-ref: index out of range: 7 (length 2)"

# --- NEGATIVE indices trap ---------------------------------------------------
trap_msg "a negative string index" '(display (string-ref "abc" -5))' \
  "string-ref: index out of range: -5 (length 3)"
trap_msg "a negative vector index" '(display (vector-ref (vector 1) -1))' \
  "vector-ref: index out of range: -1 (length 1)"
trap_msg "a negative bytevector index" '(display (bytevector-u8-ref (bytevector 1 2) -1))' \
  "bytevector-u8-ref: index out of range: -1 (length 2)"

# --- out-of-range WRITES do not reach memory ---------------------------------
trap_msg "a vector write past the end" \
  '(begin (vector-set! (vector 1 2 3) 5 999) (display "survived"))' \
  "vector-set!: index out of range: 5 (length 3)"
# ~32 MB past the object: still mapped memory, so this one used to complete and
# exit 0 rather than fault.  A guard is the only thing that catches it.
trap_msg "a far vector write" \
  '(begin (vector-set! (vector 1 2 3) 4000000 1) (display "survived"))' \
  "vector-set!: index out of range: 4000000 (length 3)"
trap_msg "a negative vector write" \
  '(begin (vector-set! (vector 1 2 3) -1 999) (display "survived"))' \
  "vector-set!: index out of range: -1 (length 3)"
trap_msg "a bytevector write past the end" \
  '(begin (bytevector-u8-set! (bytevector 1 2) 7 9) (display "survived"))' \
  "bytevector-u8-set!: index out of range: 7 (length 2)"
trap_msg "a string write past the end" \
  '(begin (string-set! (make-string 3 #\a) 3 #\z) (display "survived"))' \
  "string-set!: index out of range: 3 (length 3)"
trap_msg "a string write at a negative index" \
  '(begin (string-set! (make-string 3 #\a) -1 #\z) (display "survived"))' \
  "string-set!: index out of range: -1 (length 3)"

# --- substring: both bounds, and their ORDER (design D5) ---------------------
# The `end` case used to return a string containing bytes from past the source;
# the reversed pair used to exit 139 with GC "Failed to expand heap" warnings,
# which is why trap_msg asserts an exit below 128.
trap_msg "substring with an end past the string" '(display (substring "abc" 0 10))' \
  "substring: end out of range: 10 (length 3)"
trap_msg "substring with a start past the string" '(display (substring "abc" 7 8))' \
  "substring: start out of range: 7 (length 3)"
trap_msg "substring with a negative start" '(display (substring "abc" -1 2))' \
  "substring: start out of range: -1 (length 3)"
trap_msg "substring with start greater than end" '(display (substring "abcdef" 4 1))' \
  "substring: start greater than end: 4 > 1"
# Both bounds individually in range, still reversed -- the distinct condition D5
# names.  Neither bound check catches this one.
trap_msg "substring reversed within the string" '(display (substring "abcdef" 5 2))' \
  "substring: start greater than end: 5 > 2"

# --- a NEGATIVE construction size traps --------------------------------------
trap_msg "make-vector with a negative size" '(display (vector-length (make-vector -1 0)))' \
  "make-vector: negative size: -1"
trap_msg "make-bytevector with a negative size" \
  '(display (bytevector-length (make-bytevector -1 0)))' \
  "make-bytevector: negative size: -1"
trap_msg "make-string with a negative size" '(display (string-length (make-string -1 #\a)))' \
  "make-string: negative size: -1"

# --- records (design D6) -----------------------------------------------------
# Records had no field count at all, so checking them meant adding one:
# { HDR_RECORD, td, field-count, field0, ... }.  Field 0 therefore moved from slot
# 2 to slot 3, and the ONE other place that knows the layout is the port decode in
# the runtime (a port IS a record, and its field 0 holds the stream handle).  The
# two in-range cases below are that shift's regression guard -- if the offset were
# wrong, accessors would read the type descriptor or the count instead of a field,
# and every port operation would fail to find its handle.
check "record accessors and modifiers read the right fields" \
  '(define-record-type point (make-point x y) point? (x point-x) (y point-y set-point-y!))
(define p (make-point 3 4))
(set-point-y! p 9)
(display (list (point? p) (point-x p) (point-y p)))' \
  '(#t 3 9)'
check "a port still finds its handle through field 0" \
  '(let ((p (open-output-string)))
     (write-string "ok" p)
     (display (list (port? p) (output-port? p) (get-output-string p))))' \
  '(#t #t ok)'
# The internal accessors are Scheme-reachable as prims, so the guard D6 argues for
# -- catching a compiler field-index bug -- can be pinned directly.  The message
# says `internal` because these have no user-facing Scheme spelling: seeing one
# means a bug in the compiler, not in the program.
trap_msg "an out-of-range record read" \
  '(define-record-type point (make-point x y) point? (x point-x) (y point-y))
(define p (make-point 3 4))
(display (%record-ref p 5))' \
  "record-ref (internal): index out of range: 5 (length 2)"
trap_msg "an out-of-range record write" \
  '(define-record-type point (make-point x y) point? (x point-x) (y point-y))
(define p (make-point 3 4))
(%record-set! p -1 0)
(display "survived")' \
  "record-set! (internal): index out of range: -1 (length 2)"

# --- the FIRST-CLASS primitive path (design D2/fact 3) -----------------------
# `apply` reaches the primitive as a VALUE, not through a direct call, so this is
# the path an emitter-side check would have left open.  It used to segfault.
trap_msg "a vector accessor reached through apply" \
  '(display (apply vector-ref (list (vector 1 2 3) 99)))' \
  "vector-ref: index out of range: 99 (length 3)"
trap_msg "a string accessor reached through apply" \
  '(display (apply string-ref (list "abc" 9)))' \
  "string-ref: index out of range: 9 (length 3)"
trap_msg "an accessor passed as a higher-order argument" \
  '(display (map (lambda (i) (vector-ref (vector 1 2 3) i)) (list 0 1 5)))' \
  "vector-ref: index out of range: 5 (length 3)"

# --- the REPL door: the host survives, and the NEIGHBOUR is unmodified -------
# This is the case that distinguishes a real fix from one that traps after the
# store has already landed.  The REPL is the only door that can be asked what `b`
# holds afterwards -- under `emit run` the trap ends the program, so the store's
# effect is unobservable.  Before the guards this session printed `#(7 8 9 999)`-
# style corruption or a modified `b` and never trapped at all.
repl "an out-of-range write leaves a neighbouring object untouched" \
  "$(printf '#(7 8 9)\n!trap: vector-set!: index out of range: 5 (length 3)\n#(7 8 9)\n3')" <<'EOF'
(define a (vector 1 2 3))
(define b (vector 7 8 9))
b
(vector-set! a 5 999)
b
(+ 1 2)
EOF

repl "the session survives each accessor's trap in turn" \
  "$(printf '!trap: vector-ref: index out of range: 5 (length 3)\n!trap: string-ref: index out of range: 3 (length 3)\n!trap: bytevector-u8-ref: index out of range: 7 (length 2)\n!trap: substring: start greater than end: 4 > 1\n!trap: make-vector: negative size: -1\n3')" <<'EOF'
(vector-ref (vector 1 2 3) 5)
(string-ref "abc" 3)
(bytevector-u8-ref (bytevector 1 2) 7)
(substring "abcdef" 4 1)
(make-vector -1 0)
(+ 1 2)
EOF

# --- a standalone executable reports the same thing and exits non-zero -------
# `emit build` delivers a named program from a manifest, so the case needs one.
# Absolute source paths: a manifest's relative paths resolve against its own
# directory (change: manifest-search-path), and this manifest lives in $TMP.
cat > "$TMP/exe.scm" <<'EOF'
(begin (display "before") (newline) (vector-ref (vector 1 2 3) 5))
EOF
cat > "$TMP/emit-libs.scm" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld"))
 (library (scheme base) (source "$PWD/lib/scheme/base.sld"))
 (program idx-app (source "$TMP/exe.scm") (output "$TMP/exe")))
EOF
if EMIT_VERBOSITY=quiet build/emit build idx-app --manifest "$TMP/emit-libs.scm" \
     >"$TMP/build.log" 2>&1; then
  "$TMP/exe" >"$TMP/exe.out" 2>"$TMP/exe.err"; rc=$?
  if [ "$rc" -eq 0 ]; then
    bad "a standalone executable exits non-zero on an out-of-range index (it exited 0)"
  elif [ "$rc" -ge 128 ]; then
    bad "a standalone executable died on a signal (exit $rc)"
  elif grep -qF "vector-ref: index out of range: 5 (length 3)" "$TMP/exe.err" \
       && grep -q "before" "$TMP/exe.out"; then
    ok "a standalone executable renders the same diagnostic and exits non-zero"
  else
    bad "a standalone executable: wrong output ($(tail -1 "$TMP/exe.err"))"
  fi
else
  bad "a standalone executable: build failed"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
