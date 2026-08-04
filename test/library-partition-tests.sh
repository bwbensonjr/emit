#!/usr/bin/env bash
# library-partition-tests.sh -- the R7RS-small library partition (change:
# scheme-base-partition, GitHub issue #33).
#
# Sixteen names that `(scheme base)` used to export live in the libraries R7RS-small
# assigns them to.  The relocation is only correct if BOTH directions hold, on EVERY
# door -- a name that is merely still reachable proves nothing, and a name that is
# unbound everywhere is a regression, not a conformance gain.  So each one is checked
# twice:
#
#   * UNBOUND in a bare program -- the breaking half.  This is the assertion that would
#     silently rot if a future change re-published a name from `(scheme base)`.
#   * BOUND AND CORRECT after importing its library, on the run door, the AOT door
#     (`emit build`, which links units with clang) and the REPL door (which resolves
#     through the manifest rather than from the baked prelude).  Three doors because they
#     resolve libraries by three different mechanisms; a partition that worked on one and
#     not another is exactly the dev->ship fidelity break the module design exists to
#     prevent.
#
# Also asserted, because each is a way the partition could be WRONG rather than merely
# incomplete:
#
#   * the depth-2 accessors caar/cadr/cdar/cddr still need no import -- R7RS-small puts
#     them in `(scheme base)`, so relocating them would be over-applying the change;
#   * `(scheme cxr)` is COMPLETE -- all twenty-four compositions, including the fifteen
#     depth-4 forms added with it (design D9), each equal to its car/cdr composition;
#   * the substrate's names are NOT in scope in an ordinary program (#29's guarantee,
#     preserved through the move) and NOT reachable by importing a standard library --
#     `(emit internal)` is not auto-imported, which is the whole mechanism;
#   * a port from `(scheme file)` is a port `(scheme base)` accepts -- the port type
#     descriptor is single-homed in the substrate, so there is exactly one port type;
#   * an error raised by relocated machinery is still catchable by `guard` -- the handler
#     chain is one binding, not one copy per library (design D10);
#   * a program importing nothing still runs with NO MANIFEST PRESENT -- the guarantee the
#     baked set exists to protect, and the reason the substrate had to be baked too.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/library-partition-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

REPO="$PWD"
make emit >/dev/null 2>&1 || { echo "fatal: could not build build/emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok  () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# ---------------------------------------------------------------------------
# the three doors, each given a program's TEXT and compared on stdout
# ---------------------------------------------------------------------------

run_door () {  # <program-text> -> stdout
  printf '%s\n' "$1" > "$TMP/p.scm"
  timeout 60 build/emit run < "$TMP/p.scm" 2>"$TMP/run.err"
}

# The AOT door is manifest-ENTRY driven, so each program needs a `program` entry.  The
# manifest lives in $TMP and a manifest's relative paths resolve against its own
# directory (change: manifest-search-path), so the repo's libraries are named absolutely.
aot_door () {  # <program-text> -> stdout
  printf '%s\n' "$1" > "$TMP/a.scm"
  { printf '((library (emit internal)  (source "%s/lib/emit/internal.sld"))\n' "$REPO"
    printf ' (library (scheme base)    (source "%s/lib/scheme/base.sld"))\n'   "$REPO"
    printf ' (library (scheme cxr)     (source "%s/lib/scheme/cxr.sld"))\n'    "$REPO"
    printf ' (library (scheme read)    (source "%s/lib/scheme/read.sld"))\n'   "$REPO"
    printf ' (library (scheme file)    (source "%s/lib/scheme/file.sld"))\n'   "$REPO"
    printf ' (program aotprog (source "%s/a.scm") (output "%s/aotprog")))\n' "$TMP" "$TMP"
  } > "$TMP/a.man.scm"
  if EMIT_VERBOSITY=quiet build/emit build aotprog --manifest "$TMP/a.man.scm" \
       >"$TMP/aot.err" 2>&1; then
    timeout 60 "$TMP/aotprog" 2>>"$TMP/aot.err"
  else
    echo "<build failed>"
  fi
}

# The REPL door echoes each form's value; take the LAST non-empty line of STDOUT.  The
# prompts and the banner go to stderr, so nothing has to be stripped -- and nothing may be:
# the sibling suites' `tr -d ' >'` would delete the spaces inside a value like (1 2 3).
repl_door () {  # <program-text> -> the final value
  printf '%s\n' "$1" | timeout 60 build/emit repl 2>"$TMP/repl.err" | grep -v '^$' | tail -1
}

# ---------------------------------------------------------------------------
# 1. each relocated name: unbound bare, correct with its library, on all three doors
# ---------------------------------------------------------------------------
# The expression is written to read the same on every door: a single value-producing
# form, so the run door's final-value print, the AOT exe's stdout and the REPL's echo all
# yield the same text.  `display` is avoided for exactly that reason.

echo "the relocated sixteen: unbound bare, then correct via their library"

# <name> <library> <expression> <expected>
relocated_case () {
  local name="$1" lib="$2" expr="$3" want="$4"

  # (a) the breaking half: unbound with no import
  local out rc
  out="$(printf '%s\n' "$expr" | timeout 60 build/emit run 2>&1)"; rc=$?
  if [ "$rc" -ne 0 ] && printf '%s' "$out" | grep -qi "unbound"; then
    ok "$name: unbound without $lib"
  else
    bad "$name: expected an unbound-variable error without $lib (rc=$rc, out=$out)"
  fi

  # (b) bound and correct on each door, with the import
  local prog="(import $lib)
$expr"
  local g
  g="$(run_door "$prog")"
  [ "$g" = "$want" ] && ok "$name: run door => $g" \
    || { bad "$name: run door => [$g] (expected [$want])"; sed 's/^/         /' "$TMP/run.err"; }
  g="$(aot_door "$prog")"
  [ "$g" = "$want" ] && ok "$name: AOT door => $g" \
    || { bad "$name: AOT door => [$g] (expected [$want])"; sed 's/^/         /' "$TMP/aot.err"; }
  g="$(repl_door "$prog")"
  [ "$g" = "$want" ] && ok "$name: REPL door => $g" \
    || { bad "$name: REPL door => [$g] (expected [$want])"; sed 's/^/         /' "$TMP/repl.err"; }
}

# --- (scheme cxr): the nine that moved ------------------------------------------
# One list deep enough for every depth-3 accessor, so each case differs only in the name.
D='(quote (((1 2) (3 4)) ((5 6) (7 8))))'
relocated_case caaar  '(scheme cxr)' "(caaar $D)" '1'
relocated_case caadr  '(scheme cxr)' "(caadr $D)" '(5 6)'
relocated_case cadar  '(scheme cxr)' "(cadar $D)" '(3 4)'
relocated_case caddr  '(scheme cxr)' "(caddr (quote (1 2 3)))" '3'
relocated_case cdaar  '(scheme cxr)' "(cdaar $D)" '(2)'
relocated_case cdadr  '(scheme cxr)' "(cdadr $D)" '((7 8))'
relocated_case cddar  '(scheme cxr)' "(cddar $D)" '()'
relocated_case cdddr  '(scheme cxr)' "(cdddr (quote (1 2 3 4)))" '(4)'
relocated_case cadddr '(scheme cxr)' "(cadddr (quote (1 2 3 4)))" '4'

# --- (scheme read) --------------------------------------------------------------
relocated_case read '(scheme read)' \
  '(read (open-input-string "(alpha 2 #t)"))' '(alpha 2 #t)'

# --- (scheme file) --------------------------------------------------------------
# Each case writes and reads under $TMP so the doors do not share state.
printf '(gamma delta)\n' > "$TMP/in.txt"
relocated_case open-input-file '(scheme file)' \
  "(read-line (open-input-file \"$TMP/in.txt\"))" '"(gamma delta)"'
relocated_case open-output-file '(scheme file)' \
  "(let ((p (open-output-file \"$TMP/o1.txt\"))) (write-string \"x\" p) (close-port p) (port-closed? p))" '#t'
relocated_case with-output-to-file '(scheme file)' \
  "(begin (with-output-to-file \"$TMP/o2.txt\" (lambda () (write-string \"y\"))) (call-with-port (open-input-string \"ok\") read-line))" '"ok"'
relocated_case with-input-from-file '(scheme file)' \
  "(with-input-from-file \"$TMP/in.txt\" (lambda () (read-line (current-input-port))))" '"(gamma delta)"'
relocated_case call-with-output-file '(scheme file)' \
  "(call-with-output-file \"$TMP/o3.txt\" (lambda (p) (write-string \"z\" p) 42))" '42'
relocated_case call-with-input-file '(scheme file)' \
  "(call-with-input-file \"$TMP/in.txt\" read-line)" '"(gamma delta)"'

# ---------------------------------------------------------------------------
# 2. the partition is not OVER-applied: the depth-2 four stay in (scheme base)
# ---------------------------------------------------------------------------
echo
echo "the depth-2 accessors stay in (scheme base)"
g="$(run_door '(list (caar (quote ((1 2)))) (cadr (quote (1 2))) (cdar (quote ((1 2)))) (cddr (quote (1 2 3))))')"
[ "$g" = "(1 2 (2) (3))" ] \
  && ok "caar/cadr/cdar/cddr need no import => $g" \
  || bad "depth-2 accessors with no import => [$g] (expected (1 2 (2) (3)))"

# ---------------------------------------------------------------------------
# 3. (scheme cxr) is COMPLETE: all 24, each equal to its car/cdr composition
# ---------------------------------------------------------------------------
# Checked by VALUE against the composition spelled out by hand, not just for boundness:
# a depth-4 accessor wired to the wrong composition would otherwise pass unnoticed.
echo
echo "(scheme cxr) ships complete (design D9)"
# A FULLY NESTED pair tree of depth 4, so every one of the 24 paths lands on a pair (at
# depth 3) or a leaf (at depth 4).  A proper list will not do: (caddar T) on a list-shaped
# tree walks off the end and traps, which is how this check first failed.
g="$(run_door '(import (scheme cxr))
(define d (quote ((((1 . 2) . (3 . 4)) . ((5 . 6) . (7 . 8))) . (((9 . 10) . (11 . 12)) . ((13 . 14) . (15 . 16))))))
(define (same? a b) (if (equal? a b) 1 0))
(apply + (list
  (same? (caaar d) (car (caar d)))   (same? (caadr d) (car (cadr d)))
  (same? (cadar d) (car (cdar d)))   (same? (caddr d) (car (cddr d)))
  (same? (cdaar d) (cdr (caar d)))   (same? (cdadr d) (cdr (cadr d)))
  (same? (cddar d) (cdr (cdar d)))   (same? (cdddr d) (cdr (cddr d)))
  (same? (caaaar d) (car (caaar d))) (same? (caaadr d) (car (caadr d)))
  (same? (caadar d) (car (cadar d))) (same? (caaddr d) (car (caddr d)))
  (same? (cadaar d) (car (cdaar d))) (same? (cadadr d) (car (cdadr d)))
  (same? (caddar d) (car (cddar d))) (same? (cadddr d) (car (cdddr d)))
  (same? (cdaaar d) (cdr (caaar d))) (same? (cdaadr d) (cdr (caadr d)))
  (same? (cdadar d) (cdr (cadar d))) (same? (cdaddr d) (cdr (caddr d)))
  (same? (cddaar d) (cdr (cdaar d))) (same? (cddadr d) (cdr (cdadr d)))
  (same? (cdddar d) (cdr (cddar d))) (same? (cddddr d) (cdr (cdddr d)))))')"
[ "$g" = "24" ] \
  && ok "all 24 compositions present and each equals its car/cdr composition => $g/24" \
  || bad "(scheme cxr) completeness => [$g] (expected 24)"

# ---------------------------------------------------------------------------
# 4. the substrate stays private (#29, preserved through the move)
# ---------------------------------------------------------------------------
echo
echo "the substrate is not in scope in an ordinary program"
substrate_unbound () {  # <name> [import-form]
  local name="$1" imp="${2:-}"
  local prog out rc
  if [ -n "$imp" ]; then prog="$imp
$name"; else prog="$name"; fi
  out="$(printf '%s\n' "$prog" | timeout 60 build/emit run 2>&1)"; rc=$?
  if [ "$rc" -ne 0 ] && printf '%s' "$out" | grep -qi "unbound"; then
    ok "$name unbound${imp:+ even with $imp}"
  else
    bad "$name is reachable${imp:+ via $imp} (rc=$rc, out=$out)"
  fi
}
substrate_unbound rd-atom
substrate_unbound rd-skip-ws
substrate_unbound rd-token-end
substrate_unbound '%make-port'
substrate_unbound '%port-rtd'
# Importing a standard library must not leak the substrate it stands on: imports are not
# transitive, which is what lets (scheme read) use the reader without republishing it.
substrate_unbound rd-datum   '(import (scheme read))'
substrate_unbound '%make-port' '(import (scheme file))'

# ---------------------------------------------------------------------------
# 5. one port type, one handler chain (design D10)
# ---------------------------------------------------------------------------
echo
echo "the substrate's single-homed state (design D10)"
# A port made by (scheme file) crosses into (scheme base) procedures.  If the port type
# descriptor were duplicated per library these would all be #f: record types compare by
# object identity.
g="$(run_door "(import (scheme file))
(define p (open-input-file \"$TMP/in.txt\"))
(define r (list (port? p) (input-port? p) (textual-port? p) (port-closed? p)))
(close-port p)
(append r (list (port-closed? p)))")"
[ "$g" = "(#t #t #t #f #t)" ] \
  && ok "a (scheme file) port is a port (scheme base) accepts => $g" \
  || bad "port identity across libraries => [$g] (expected (#t #t #t #f #t))"

# The exception handler chain is ONE binding: (scheme read)'s own copy of the port guard
# raises through the same chain a program's `guard` installs.  With *handlers* duplicated
# into a library this would abort instead of returning 'caught.
g="$(run_door '(import (scheme read))
(guard (e (#t (list (quote caught) (error-object? e)))) (read 5))')"
[ "$g" = "(caught #t)" ] \
  && ok "an error from relocated machinery is catchable by guard => $g" \
  || bad "guard across the library boundary => [$g] (expected (caught #t))"

g="$(run_door '(import (scheme file))
(guard (e (#t (quote caught))) (open-input-file "/nonexistent/emit/partition/test"))')"
[ "$g" = "caught" ] \
  && ok "(scheme file) reports a missing file as a catchable error => $g" \
  || bad "open-input-file error path => [$g] (expected caught)"

# ---------------------------------------------------------------------------
# 6. no manifest at all -- what the baked set exists to protect
# ---------------------------------------------------------------------------
echo
echo "a program importing nothing needs no manifest"
NOMAN="$TMP/no-manifest"
mkdir -p "$NOMAN"
# Nothing here: no emit-libs.scm, no lib/.  The binary's other manifest candidates
# (EMIT_MANIFEST, the exe-relative and build-time PREFIX paths) are cleared or absent, so
# a resolution that reached for a file would fail rather than quietly succeed.
g="$(cd "$NOMAN" && printf '%s\n' '(list (cadr (quote (1 2))) (read-from-string "(a b)") (map car (list (list 7))))' \
      | EMIT_MANIFEST= EMIT_VERBOSITY=quiet "$REPO/build/emit" run 2>"$TMP/nm.err")"
[ "$g" = "(2 (a b) (7))" ] \
  && ok "baked (scheme base) + substrate resolve with no manifest present => $g" \
  || { bad "no-manifest program => [$g] (expected (2 (a b) (7)))"; sed 's/^/         /' "$TMP/nm.err"; }

# ...and the relocated ones are NOT reachable there, which is the other half of the same
# guarantee: they are on disk, so they need a manifest, and saying so is not a defect.
out="$(cd "$NOMAN" && printf '(import (scheme cxr))\n(caddr (quote (1 2 3)))\n' \
        | EMIT_MANIFEST= EMIT_VERBOSITY=quiet "$REPO/build/emit" run 2>&1)"; rc=$?
if [ "$rc" -ne 0 ]; then
  ok "(scheme cxr) is correctly unavailable with no manifest (exit $rc)"
else
  bad "(scheme cxr) resolved with no manifest present => [$out]"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
