#!/usr/bin/env bash
# reader-datum-parity-tests.sh -- change: reader-datum-parity (issues #64, #52).
#
# The reader reads #(...) and #u8(...), and core-language requires that it SHALL.
# Three places downstream had no arm for the result and degraded to `?` or an error:
#
#   * encode-const could not LOWER a vector or bytevector constant, so `'#(1 2)` was
#     a compile failure -- `emit: emit: bad const ?`;
#   * render-datum had no vector arm, so that diagnostic could not even name the
#     literal it choked on: the `?` IS the renderer;
#   * repl-irritant->string rendered every non-symbol/string/number irritant as `?`,
#     so an interactive (import (bad)) of a library that failed to load dropped the
#     one part of the message the user typed.
#
# The middle one is why these land together.  render-datum writes the EXPORT TABLE
# (change: library-macro-export), so a datum it renders as `?` corrupts a compilation
# artifact rather than merely reading poorly.  That was already happening, masked only
# because encode-const failed loudly first -- so fixing the lowering ALONE would have
# turned a loud compile failure into a silent miscompile.  Hence the table assertions
# here, not just the value ones.
#
# Chez-FREE (default suite).  Run from the repo root:  test/reader-datum-parity-tests.sh
set -u
cd "$(dirname "$0")/.."

EMIT=build/emit
make emit >/dev/null 2>&1 || { echo "failed to build $EMIT"; exit 1; }
EMITABS="$PWD/$EMIT"
REPO="$PWD"

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# Run a program through `emit run` and compare stdout exactly.
val () {  # <name> <source-text> <expected-stdout>
  local name="$1" src="$2" want="$3"
  printf '%s\n' "$src" > "$TMP/$name.scm"
  local got
  got="$(cd "$TMP" && "$EMITABS" run "$name.scm" 2>"$TMP/$name.err")"
  if [ "$got" = "$want" ]; then ok "$name => $got"
  else bad "$name => [$got]  want [$want]"; sed 's/^/         /' "$TMP/$name.err"; fi
}

echo "quoted vector and bytevector constants lower (issue #64)"

val const-vec        "(display '#(1 2))"                          "#(1 2)"
val const-bytevec    "(display (quote #u8(1 2)))"                 "#u8(1 2)"
val const-vec-nested "(display (car (quote (#(a) b))))"           "#(a)"
val const-vec-empty  "(display '#())"                             "#()"
val const-bv-empty   "(display '#u8())"                           "#u8()"

# Every element type the constant encoder handles, including a nested vector and a
# nested bytevector -- each element goes through encode-const recursively, so a type
# it cannot lower would surface here rather than only for the whole-vector case.
# `write`, not `display`: display drops the quoting that distinguishes the string "s"
# and the character #\c from the symbols beside them, which is exactly what this asserts.
val const-vec-hetero "(write '#(a \"s\" #\\c #t #f 1 2.5 () (p . q) #(n) #u8(7)))" \
  "#(a \"s\" #\\c #t #f 1 2.5 () (p . q) #(n) #u8(7))"

# A constant must equal the runtime-built value -- the point of lowering it at all.
val const-vec-equal  "(display (equal? '#(1 2 3) (vector 1 2 3)))"    "#t"
val const-bv-equal   "(display (equal? '#u8(1 2 3) (bytevector 1 2 3)))" "#t"

# Deep nesting: a vector inside a bytevector's sibling position inside a list.
val const-deep "(display '((#(1 #(2 #(3))) . #u8(4)) 5))" "((#(1 #(2 #(3))) . #u8(4)) 5)"

# A vector constant reached through a procedure body rather than at top level.
val const-in-body "(define (f) '#(1 2))(display (f))" "#(1 2)"

echo
echo "labelled cyclic and shared constants retain graph identity"

val const-pair-cycle \
  "(let ((x (quote #0=(a . #0#)))) (write (eq? x (cdr x))))" \
  "#t"
val const-vector-cycle \
  "(let ((x (quote #0=#(a #0#)))) (write (eq? x (vector-ref x 1))))" \
  "#t"
val const-mixed-cycle \
  "(let ((x (quote #0=(#(a #0#))))) (write (eq? x (vector-ref (car x) 1))))" \
  "#t"
val const-shared-pair \
  "(let ((x (quote (#0=(a) #0#)))) (write (eq? (car x) (cadr x))))" \
  "#t"

echo
echo "the same constants inside a LIBRARY body (the path #64 asked about)"

mkdir -p "$TMP/proj"
cat > "$TMP/proj/vlib.sld" <<'EOF'
(define-library (vlib)
  (import (scheme base))
  (export vconst bvconst pcycle shared)
  (begin
    (define (vconst) (quote #(1 2)))
    (define (bvconst) (quote #u8(3 4)))
    (define (pcycle) (quote #0=(p . #0#)))
    (define (shared) (quote (#1=(s) #1#)))))
EOF
cat > "$TMP/proj/emit-libs.scm" <<EOF
((library (vlib) (source "vlib.sld")))
EOF
cat > "$TMP/proj/usev.scm" <<'EOF'
(import (vlib))
(display (vconst))
(display (bvconst))
(display (let ((x (pcycle))) (eq? x (cdr x))))
(display (let ((x (shared))) (eq? (car x) (cadr x))))
EOF
got="$(cd "$TMP/proj" && "$EMITABS" run usev.scm 2>"$TMP/usev.err")"
[ "$got" = "#(1 2)#u8(3 4)#t#t" ] && ok "library body constants retain cyclic/shared topology => $got" \
  || { bad "library body constants => [$got]"; sed 's/^/         /' "$TMP/usev.err"; }

echo
echo "an exported macro TEMPLATE holding a vector round-trips the export table"

# This is the silent corruption.  Before the change `emit lib` exited 0 having written
#   ((veclib) () () (((vconst () ((_) quote ?))) () ()))
# -- the literal became `?`.  Assert the TABLE, not just the value: the value assertion
# alone would pass on a table that is wrong but never re-read in this run.
cat > "$TMP/proj/veclib.sld" <<'EOF'
(define-library (veclib)
  (import (scheme base))
  (export vmac)
  (begin
    (define-syntax vmac
      (syntax-rules ()
        ((_) (quote #(1 2)))))))
EOF
if (cd "$TMP/proj" && EMIT_VERBOSITY=quiet "$EMITABS" lib veclib.sld -o build/lib) \
     >"$TMP/lib.log" 2>&1; then
  T="$TMP/proj/build/lib/veclib.exports"
  grep -q '#(1 2)' "$T" && ok "export table records #(1 2)" \
    || { bad "export table lost the vector"; sed 's/^/         /' "$T"; }
  if grep -q ' ?' "$T"; then
    bad "export table still contains a ? placeholder"; sed 's/^/         /' "$T"
  else
    ok "export table has no ? placeholder"
  fi
else
  bad "emit lib on a vector-bearing template failed"; sed 's/^/         /' "$TMP/lib.log"
fi

# A BYTEVECTOR in a template is refused, not written.  R7RS spells it #u8(...), which
# Chez's `read` rejects (Chez uses #vu8), and the driver reads export tables back with
# `read` on its artifact-reuse path -- so a table carrying #u8(...) is a rendering the
# other door cannot read back, which render-char's rule already forbids.  Loud error,
# not the silent `?` it used to write.  (A bytevector CONSTANT is unaffected: see the
# library-body case above, which passes.)
cat > "$TMP/proj/bvlib.sld" <<'EOF'
(define-library (bvlib)
  (import (scheme base))
  (export bvmac)
  (begin
    (define-syntax bvmac
      (syntax-rules ()
        ((_) (quote #u8(3 4)))))))
EOF
rm -f "$TMP/proj/build/lib/bvlib.exports"
if (cd "$TMP/proj" && "$EMITABS" lib bvlib.sld -o build/lib) >"$TMP/bvlib.log" 2>&1; then
  bad "emit lib should refuse a bytevector in a macro template"
  sed 's/^/         /' "$TMP/bvlib.log"
else
  if grep -q 'bytevector' "$TMP/bvlib.log" && [ ! -e "$TMP/proj/build/lib/bvlib.exports" ]; then
    ok "emit lib refuses a bytevector template and writes no table"
  else
    bad "emit lib bytevector-template diagnostic"; sed 's/^/         /' "$TMP/bvlib.log"
  fi
fi

# ...and an importer expanding those macros must produce the real values, which is what
# the table being right actually buys.
cat > "$TMP/proj/emit-libs2.scm" <<EOF
((library (veclib) (source "veclib.sld")))
EOF
cat > "$TMP/proj/usemac.scm" <<'EOF'
(import (veclib))
(display (vmac))
EOF
got="$(cd "$TMP/proj" && "$EMITABS" run usemac.scm --manifest emit-libs2.scm 2>"$TMP/usemac.err")"
[ "$got" = "#(1 2)" ] && ok "importer expands the macro to the real vector => $got" \
  || { bad "macro expansion => [$got]"; sed 's/^/         /' "$TMP/usemac.err"; }

echo
echo "a labelled cyclic datum in an exported macro template round-trips the table"

cat > "$TMP/proj/cyclelib.sld" <<'EOF'
(define-library (cyclelib)
  (import (scheme base))
  (export cyclemac sharedmac)
  (begin
    (define-syntax cyclemac
      (syntax-rules ()
        ((_) (quote #0=(c . #0#)))))
    (define-syntax sharedmac
      (syntax-rules ()
        ((_) (quote (#1=(s) #1#)))))))
EOF
cat > "$TMP/proj/emit-libs3.scm" <<EOF
((library (cyclelib) (source "cyclelib.sld")))
EOF
cat > "$TMP/proj/usecycle.scm" <<'EOF'
(import (cyclelib))
(let ((c (cyclemac)) (s (sharedmac)))
  (write (list (eq? c (cdr c)) (eq? (car s) (cadr s)))))
EOF
if (cd "$TMP/proj" && EMIT_VERBOSITY=quiet "$EMITABS" lib cyclelib.sld -o build/lib) \
     >"$TMP/cyclelib.log" 2>&1; then
  T="$TMP/proj/build/lib/cyclelib.exports"
  if grep -q '#0=' "$T" && grep -q '#0#' "$T"; then
    ok "export table records datum labels for cyclic/shared templates"
  else
    bad "export table lost cyclic/shared labels"; sed 's/^/         /' "$T"
  fi
  got="$(cd "$TMP/proj" && "$EMITABS" run usecycle.scm --manifest emit-libs3.scm \
          2>"$TMP/usecycle.err")"
  [ "$got" = "(#t #t)" ] && ok "imported macro constants retain graph identity => $got" \
    || { bad "imported cyclic macro constants => [$got]"; sed 's/^/         /' "$TMP/usecycle.err"; }
else
  bad "emit lib on cyclic macro templates failed"; sed 's/^/         /' "$TMP/cyclelib.log"
fi

echo
echo "diagnostics name the datum they report (issue #52)"

# An interactive import of a library that failed to load must name the LIBRARY, not `?`.
mkdir -p "$TMP/badproj"
cat > "$TMP/badproj/bad.sld" <<'EOF'
(define-library (bad)
  (import (only (scheme base) car))
  (export f)
  (begin (define (f) 1)))
EOF
cat > "$TMP/badproj/emit-libs.scm" <<EOF
((library (bad) (source "bad.sld")))
EOF
printf '(import (bad))\n(+ 1 2)\n' > "$TMP/imp.in"
out="$(cd "$TMP/badproj" && "$EMITABS" repl < "$TMP/imp.in" 2>&1)"
if echo "$out" | grep -q 'imported library not loaded' && echo "$out" | grep -q '(bad)'; then
  ok "interactive import names the library (bad)"
else
  bad "interactive import diagnostic"; printf '%s\n' "$out" | sed 's/^/         /'
fi

# The session must survive it -- a better message that kills the session trades one
# defect for a worse one.
# The REPL echoes results behind its `> ` prompt, so the value line reads "> 3".
echo "$out" | grep -qE '(^|> )3$' && ok "session survives the diagnostic and evaluates (+ 1 2)" \
  || { bad "session did not continue"; printf '%s\n' "$out" | sed 's/^/         /'; }

# No `?` stands in for a datum anywhere in that transcript.
if echo "$out" | grep -q 'not loaded ?'; then
  bad "diagnostic still renders the library as ?"
else
  ok "no ? placeholder in the import diagnostic"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
