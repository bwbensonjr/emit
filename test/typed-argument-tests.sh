#!/usr/bin/env bash
# typed-argument-tests.sh -- change: checked-primitive-arguments
# (GitHub issues #84, #82, #78).
#
# Every primitive that dereferences an argument verifies the argument's tag first,
# so a wrong-typed argument is a diagnostic rather than an unchecked memory access.
# What this pins:
#
#   * `car`/`cdr` and the vector/string/bytevector accessors REPORT on a wrong-typed
#     argument instead of dying on a signal -- `(car (quote ()))` used to exit 139;
#   * the type check runs BEFORE the length load, which is the whole point: a bound
#     read from an unverified object is itself an unchecked access, so
#     `(vector-ref (quote ()) 0)` must report a TYPE error, never a range error
#     computed from garbage (this is the hole in checked-indexed-access, #70/#72);
#   * wrong-typed WRITES do not reach memory, with a NEIGHBOURING object checked --
#     a store that trapped after landing is indistinguishable from one that never
#     happened unless something else's contents are read afterwards, which is why
#     that case runs in the REPL (the one door that survives a trap);
#   * calling a NON-PROCEDURE reports rather than loading a code pointer out of a
#     value that is not a closure -- `((quote not-a-proc) 1)` used to exit 138;
#   * `apply` rejects a final argument that is not a proper list.  These three are
#     the only cases here that were silently WRONG rather than fatal: `(apply + 3)`
#     returned 0 and `(apply + (quote (2 3 . 4)))` returned 5;
#   * pairs are MUTABLE (`set-car!`/`set-cdr!`/`list-set!`), and the mutators are
#     checked from birth -- an unchecked pair store is strictly worse than the
#     unchecked reads it would accompany;
#   * a trap is NOT catchable by `guard` (design D5).  That is deliberate and is
#     pinned here so the non-goal cannot rot into an assumption: making the runtime's
#     traps catchable is GitHub issue #89, and it would change every existing trap;
#   * RIGHT-TYPED access is unchanged, checked first: an over-tight guard breaks
#     these before it breaks any trap;
#   * both doors agree -- the in-process runner and a standalone executable report
#     the same diagnostic -- and the runner's host survives the trap.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/typed-argument-tests.sh
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
# The 128 bound is what most of these cases are about: exit 139 (SIGSEGV) and 138
# (SIGBUS) are what they did before the guards, and a signal is not a diagnostic no
# matter what the shell reports.
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

echo "typed arguments: a wrong-typed argument is a diagnostic, never an unchecked access"

# --- RIGHT-TYPED access is unchanged -----------------------------------------
# First, for the same reason the indexed-access suite checks in-range access first:
# an over-tight predicate breaks these, not the traps.  Every guarded accessor
# appears here with an argument of its own type.
check "car and cdr over a list" \
  '(let ((xs (list 1 2 3)))
     (display (list (car xs) (cadr xs) (cddr xs) (car (cdr (cdr xs))))))' \
  '(1 2 (3) 3)'
check "the vector accessors over a vector" \
  '(let ((v (vector 10 20 30)))
     (vector-set! v 1 99)
     (display (list (vector-length v) (vector-ref v 0) (vector-ref v 1))))' \
  '(3 10 99)'
check "the string accessors over a string" \
  '(let ((s (make-string 3 #\a)))
     (string-set! s 1 #\b)
     (display (list (string-length s) (string-ref s 1) (substring s 0 2))))' \
  '(3 b ab)'
check "the bytevector accessors over a bytevector" \
  '(let ((b (bytevector 5 6 7)))
     (bytevector-u8-set! b 0 9)
     (display (list (bytevector-length b) (bytevector-u8-ref b 0))))' \
  '(3 9)'
check "a multi-byte string is still codepoint-indexed" \
  '(display (list (string-length "hállo") (string-ref "hállo" 1) (substring "hállo" 0 3)))' \
  '(5 á hál)'
check "procedures are called directly, as values, and through apply" \
  '(define (f x) (* x 2))
(display (list (f 3) (map f (list 1 2)) (apply f (list 4)) ((lambda (g) (g 5)) f)))' \
  '(6 (2 4) 8 10)'
check "a record and a port still work through their accessors" \
  '(define-record-type point (make-point x y) point? (x point-x) (y point-y set-point-y!))
(define p (make-point 3 4))
(set-point-y! p 9)
(let ((o (open-output-string)))
  (write-string "ok" o)
  (display (list (point-x p) (point-y p) (get-output-string o))))' \
  '(3 9 ok)'

# --- car/cdr of a non-pair (issue #84) ---------------------------------------
# All four used to exit 139.  `(car (quote ()))` is the single most common way a
# Scheme program fails, which is why a guarantee with a hole here is not one.
trap_msg "car of the empty list" '(display (car (quote ())))' \
  "car: not a pair: got the empty list"
trap_msg "cdr of the empty list" '(display (cdr (quote ())))' \
  "cdr: not a pair: got the empty list"
trap_msg "car of a fixnum" '(display (car 7))' \
  "car: not a pair: got a fixnum"
trap_msg "cdr of a string" '(display (cdr "abc"))' \
  "cdr: not a pair: got a string"
trap_msg "car of a procedure" '(display (car car))' \
  "car: not a pair: got a procedure"

# --- the TYPE check precedes the LENGTH load ---------------------------------
# The substance of this change.  `CHECK_INDEX` reads its bound from the object's
# own header via an unchecked `as_ptr`, so on a non-vector the bound came from
# whatever word sat at that address: the index was guarded, the object was not.
# Each of these must report a TYPE error naming the object -- a RANGE error here
# would mean the length was still read from the wrong-typed value.
trap_msg "vector-ref on the empty list reports a type error, not a range error" \
  '(display (vector-ref (quote ()) 0))' "vector-ref: not a vector: got the empty list"
trap_msg "vector-length of a fixnum" '(display (vector-length 7))' \
  "vector-length: not a vector: got a fixnum"
trap_msg "vector-set! on a string" '(begin (vector-set! "abc" 0 1) (display "survived"))' \
  "vector-set!: not a vector: got a string"
trap_msg "string-ref on a fixnum" '(display (string-ref 7 0))' \
  "string-ref: not a string: got a fixnum"
trap_msg "string-length of the empty list" '(display (string-length (quote ())))' \
  "string-length: not a string: got the empty list"
trap_msg "substring of a vector" '(display (substring (vector 1 2) 0 1))' \
  "substring: not a string: got a vector"
trap_msg "bytevector-u8-ref on a fixnum" '(display (bytevector-u8-ref 7 0))' \
  "bytevector-u8-ref: not a bytevector: got a fixnum"
trap_msg "bytevector-length of a symbol" '(display (bytevector-length (quote a)))' \
  "bytevector-length: not a bytevector: got a symbol"
# A tag-7 heap object of the WRONG HEADER: the primary tag matches a vector's, so
# only the header check separates them.  A guard written as a bare tag test would
# wave this through and then read the string's byte pointer as an element.
trap_msg "vector-ref on a string is caught by the header, not the tag" \
  '(display (vector-ref "abc" 0))' "vector-ref: not a vector: got a string"
trap_msg "bytevector-u8-ref on a vector is caught by the header" \
  '(display (bytevector-u8-ref (vector 1 2) 0))' \
  "bytevector-u8-ref: not a bytevector: got a vector"
# A non-fixnum INDEX (design D10): UNFIX shifts the tagged pointer right by three,
# so this used to report `index out of range: <huge>` -- a true statement about the
# wrong defect.
trap_msg "a non-integer index names the index, not a range" \
  '(display (vector-ref (vector 1 2 3) "x"))' \
  "vector-ref: index is not an exact integer: got a string"

# --- the STRING family, found by the sweep (task 2) --------------------------
# Not in the proposal's original enumeration, and every one of them segfaulted:
# these are user-facing (scheme base) names, not %-internals.  `symbol->string` is
# the worst shape in the set -- `sym_name` reads word 0 as a `char *` and hands it
# straight to strlen, so a wrong-typed argument dereferences twice.
trap_msg "string=? on a fixnum" '(display (string=? 7 "a"))' \
  "string=?: not a string: got a fixnum"
trap_msg "string=? on a wrong-typed SECOND argument" '(display (string=? "a" 7))' \
  "string=?: not a string: got a fixnum"
trap_msg "string-append on a fixnum" '(display (string-append 7 "a"))' \
  "string-append: not a string: got a fixnum"
trap_msg "string->symbol on a fixnum" '(display (string->symbol 7))' \
  "string->symbol: not a string: got a fixnum"
trap_msg "symbol->string on a fixnum" '(display (symbol->string 7))' \
  "symbol->string: not a symbol: got a fixnum"
trap_msg "string-copy on a vector" '(display (string-copy (vector 1 2)))' \
  "string-copy: not a string: got a vector"
trap_msg "write-string on a fixnum" '(display (write-string 7))' \
  "write-string: not a string: got a fixnum"
check "the string family is unchanged on strings and symbols" \
  '(display (list (string=? "ab" "ab") (string-append "ab" "cd") (string-copy "ab")
                  (symbol->string (quote abc)) (string->symbol "xy")))' \
  '(#t abcd ab abc xy)'

# --- the error-object accessors, reached from inside a guard clause ----------
# The recovery path itself used to crash: `(error-object-message e)` on a value
# that is not an error object dereferenced it.
trap_msg "error-object-message on a fixnum" '(display (error-object-message 7))' \
  "error-object-message: not an error object: got a fixnum"
trap_msg "error-object-irritants on a string" '(display (error-object-irritants "x"))' \
  "error-object-irritants: not an error object: got a string"
check "the error-object accessors are unchanged on an error object" \
  '(display (guard (e (#t (list (error-object? e) (error-object-message e)
                                (error-object-irritants e))))
             (error "boom" 1 2)))' \
  '(#t boom (1 2))'

# --- calling a NON-PROCEDURE (issue #84, second half) ------------------------
# The callee's code pointer is loaded out of a value that is not a closure and
# jumped to: exit 138 (SIGBUS) before this change.
trap_msg "calling a symbol" '(display ((quote not-a-proc) 1))' \
  "call: not a procedure: got a symbol"
trap_msg "calling a fixnum" '(display (let ((f 7)) (f 1 2)))' \
  "call: not a procedure: got a fixnum"
trap_msg "calling the empty list" '(display ((car (list (quote ()))) 1))' \
  "call: not a procedure: got the empty list"
# Reached through a value rather than an operator position, so the emitter cannot
# have known the type statically.
trap_msg "calling a non-procedure taken from a list" \
  '(display (map (lambda (g) (g 1)) (list (lambda (x) x) 7)))' \
  "call: not a procedure: got a fixnum"

# --- apply's final argument must be a PROPER LIST (issue #78) ----------------
# The only cases in this suite that were silently WRONG rather than fatal:
# rt_apply_argv took rt_list_length of a non-pair as 0 and built the argument
# vector from the leading arguments alone, dropping the rest without comment.
trap_msg "apply with a non-list final argument" '(display (apply + 3))' \
  "apply: last argument is not a proper list"
trap_msg "apply with leading arguments and a non-list tail" '(display (apply + 3 4))' \
  "apply: last argument is not a proper list"
trap_msg "apply with an improper final list" '(display (apply + (quote (2 3 . 4))))' \
  "apply: last argument is not a proper list"
check "apply with a proper list is unchanged" \
  '(display (list (apply + (list 2 3)) (apply + 1 2 (list 3 4)) (apply + (quote ()))))' \
  '(5 10 0)'

# --- the FIRST-CLASS primitive path ------------------------------------------
# `apply` reaches the primitive as a VALUE, so this is the path an emitter-side
# check would have left open (primitive-layer requires it to be the same procedure).
trap_msg "car reached through apply" '(display (apply car (list 7)))' \
  "car: not a pair: got a fixnum"
trap_msg "vector-ref reached through apply" \
  '(display (apply vector-ref (list (quote ()) 0)))' \
  "vector-ref: not a vector: got the empty list"
trap_msg "car passed as a higher-order argument" \
  '(display (map car (list (list 1) 7)))' "car: not a pair: got a fixnum"

# --- pairs are MUTABLE, and the mutators are checked (issue #82) -------------
check "set-car! and set-cdr! mutate in place" \
  '(display (list (let ((x (list 1 2))) (set-car! x 9) x)
                  (let ((x (list 1 2))) (set-cdr! x (quote (7))) x)))' \
  '((9 2) (1 7))'
check "the mutation is visible through every reference to the pair" \
  '(let* ((a (list 1 2)) (b a))
     (set-car! a 9)
     (display (list b (eq? a b))))' \
  '((9 2) #t)'
check "a circular structure can be constructed" \
  '(let ((x (list 1))) (set-cdr! x x) (display (list (eq? x (cdr x)) (car (cdr (cdr x))))))' \
  '(#t 1)'
check "list-set! stores into the k-th pair" \
  '(let ((xs (list 1 2 3))) (list-set! xs 1 9) (display xs))' \
  '(1 9 3)'
check "set-car! and set-cdr! are first-class values" \
  '(let ((x (list 1 2)))
     (apply set-car! (list x 9))
     (display x))' \
  '(9 2)'
# The wrong-typed WRITE.  Under the old pattern these would have been the first
# unchecked stores through a pair pointer -- worse than the unchecked reads.
trap_msg "set-car! on a fixnum" '(begin (set-car! 7 1) (display "survived"))' \
  "set-car!: not a pair: got a fixnum"
trap_msg "set-cdr! on the empty list" \
  '(begin (set-cdr! (quote ()) 1) (display "survived"))' \
  "set-cdr!: not a pair: got the empty list"
trap_msg "set-car! on a vector" '(begin (set-car! (vector 1) 1) (display "survived"))' \
  "set-car!: not a pair: got a vector"

# --- a trap is NOT catchable by `guard` (design D5) --------------------------
# Deliberate, and pinned so it cannot rot into an assumption.  `rt_fatal` longjmps
# to the HOST frame; the Scheme handler chain (`*handlers*`) is unreachable from C.
# Routing traps into it is issue #89 and would change every existing trap at once.
# What a guard DOES catch is `error` -- checked here so the contrast is explicit.
check "guard catches error, which is a raise" \
  '(display (guard (e (#t (list (quote caught) (error-object-message e)))) (error "boom")))' \
  '(caught boom)'
trap_msg "guard does not catch a type trap" \
  '(display (guard (e (#t (quote caught))) (car (quote ()))))' \
  "car: not a pair: got the empty list"
trap_msg "guard does not catch a range trap either (unchanged behaviour)" \
  '(display (guard (e (#t (quote caught))) (vector-ref (vector 1 2) 9)))' \
  "vector-ref: index out of range: 9 (length 2)"

# --- the REPL door: the host survives, and the NEIGHBOUR is unmodified -------
# The case that distinguishes a real fix from one that traps after the store has
# landed.  The REPL is the only door that can be asked what `b` holds afterwards --
# under `emit run` the trap ends the program, so the store's effect is unobservable.
repl "a wrong-typed write leaves a neighbouring object untouched" \
  "$(printf '#(7 8 9)\n!trap: vector-set!: not a vector: got a string\n#(7 8 9)\n3')" <<'EOF'
(define a "abc")
(define b (vector 7 8 9))
b
(vector-set! a 0 999)
b
(+ 1 2)
EOF

repl "the session survives each type trap in turn" \
  "$(printf '!trap: car: not a pair: got the empty list\n!trap: vector-ref: not a vector: got a fixnum\n!trap: string-ref: not a string: got the empty list\n!trap: call: not a procedure: got a symbol\n!trap: apply: last argument is not a proper list: got a fixnum\n!trap: set-car!: not a pair: got a fixnum\n3')" <<'EOF'
(car (quote ()))
(vector-ref 7 0)
(string-ref (quote ()) 0)
((quote not-a-proc) 1)
(apply + 3)
(set-car! 7 1)
(+ 1 2)
EOF

# --- a standalone executable reports the same thing and exits non-zero -------
# `emit build` delivers a named program from a manifest, so the case needs one.
# Absolute source paths: a manifest's relative paths resolve against its own
# directory (change: manifest-search-path), and this manifest lives in $TMP.
cat > "$TMP/exe.scm" <<'EOF'
(begin (display "before") (newline) (car (quote ())))
EOF
cat > "$TMP/emit-libs.scm" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld"))
 (library (scheme base) (source "$PWD/lib/scheme/base.sld"))
 (program typ-app (source "$TMP/exe.scm") (output "$TMP/exe")))
EOF
if EMIT_VERBOSITY=quiet build/emit build typ-app --manifest "$TMP/emit-libs.scm" \
     >"$TMP/build.log" 2>&1; then
  "$TMP/exe" >"$TMP/exe.out" 2>"$TMP/exe.err"; rc=$?
  if [ "$rc" -eq 0 ]; then
    bad "a standalone executable exits non-zero on a wrong-typed argument (it exited 0)"
  elif [ "$rc" -ge 128 ]; then
    bad "a standalone executable died on a signal (exit $rc)"
  elif grep -qF "car: not a pair: got the empty list" "$TMP/exe.err" \
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
