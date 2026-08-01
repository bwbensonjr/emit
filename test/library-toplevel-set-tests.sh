#!/usr/bin/env bash
# library-toplevel-set-tests.sh -- change: library-toplevel-set (issue #14).
#
# A compilation unit may `set!` a name it defines at its own top level (R7RS 5.3.1:
# a definition introduces a mutable location).  The reason that was previously a
# compile error is that a cross-unit direct call assumes the callee's slot never
# moves after `__init` (design D4 of cross-unit-direct-calls), so this suite pins
# BOTH halves of the fix -- the permission and the soundness rule that replaces the
# prohibition:
#
#   * the assignment is permitted, and every reader observes it: an importing
#     program, the assigning unit's own procedures, and a REPL session;
#   * the export table WITHHOLDS the direct-call row for an assigned binding, while
#     an unassigned sibling of the same fixed-arity shape keeps its row -- the
#     withholding is per binding, not per unit, and does not depend on whether the
#     assignment was lowered before or after the binding it assigns;
#   * the importer therefore does NOT emit `call fastcc @"mutlib:code:f"`.  This is
#     the assertion that matters: its failure mode is silent misdispatch, where the
#     program keeps running the closure the slot held at link time;
#   * the stable, name-derived label is claimed exactly once per unit -- a `set!` of
#     a top-level name from inside a procedure body gets an ordinary counter label
#     (design D2).  Without that, the unit emits `mutlib:code:f` twice and clang
#     rejects it as an invalid redefinition;
#   * assignment to an IMPORTED binding and to a PRIMITIVE are still errors.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/library-toplevel-set-tests.sh
set -u
cd "$(dirname "$0")/.."

MOD=test/modules
MAN="$MOD/emit-libs-mut.scm"          # (scheme base) + (mutlib); see its header
RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

# The AOT door builds a manifest PROGRAM ENTRY, so it needs its own manifest with the
# (output ...) pointed at the temp dir -- the suite writes nothing under build/.
BMAN="$TMP/emit-libs-build.scm"
cat > "$BMAN" <<EOF
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (mutlib)      (source "test/modules/mutlib.sld"))
 (program mutlib-app    (source "test/modules/prog-mutlib.scm") (output "$TMP/mutlib-app")))
EOF
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

want   () { if grep -Eq "$3" "$2"; then ok "$1"; else bad "$1 (missing: $3)"; fi; }
reject () { if grep -Eq "$3" "$2"; then bad "$1 (present but should not be: $3)"; else ok "$1"; fi; }

# The expected value of prog-mutlib.scm, spelled out once:
#   f before bump        2  (f x) = x+1
#   f after  bump      101  reassigned to x+100     <- observable only if indirect
#   call-f after bump  101  the unit's own call to its own assigned binding
#   h before bump-h      8  (h x) = x+7
#   h after  bump-h    701  reassigned to x+700     <- the other lowering order
#   g                 1001  never assigned; keeps its direct-call row
WANT='(2 101 101 8 701 1001)'

echo "library top-level set! (issue #14)"

# --- 1. the assignment is permitted at all -----------------------------------
if build/emit lib "$MOD/mutlib.sld" >/dev/null 2>"$TMP/lib.err"; then
  ok "a unit compiles with a set! of its own top-level binding"
else
  bad "emit lib rejected mutlib.sld: $(cat "$TMP/lib.err")"
fi

# --- 2. every reader observes the assignment, on all three doors --------------
got="$($RUN --manifest "$MAN" < "$MOD/prog-mutlib.scm" 2>"$TMP/run.err")"
if [ "$got" = "$WANT" ]; then ok "run door: importer observes the assignment => $got"
else bad "run door => $got (expected $WANT)"; sed 's/^/         /' "$TMP/run.err"; fi

# The AOT door, which is where a direct call would have been emitted and where the
# tree-shake recompiles the unit against the program's roots.
if EMIT_VERBOSITY=quiet build/emit build mutlib-app --manifest "$BMAN" \
     >"$TMP/build.log" 2>&1; then
  got="$("$TMP/mutlib-app" 2>/dev/null)"
  if [ "$got" = "$WANT" ]; then ok "AOT door: same value through build + link => $got"
  else bad "AOT door => $got (expected $WANT)"; fi
else
  bad "AOT door: emit build failed"; sed 's/^/         /' "$TMP/build.log"
fi

# A REPL session: same library, entered form by form.
out="$(printf '(import (mutlib))\n(f 1)\n(bump)\n(f 1)\n(call-f 1)\n(g 1)\n' \
        | build/emit repl --manifest "$MAN" 2>/dev/null | tr -d ' >' | grep -v '^$')"
if [ "$out" = "$(printf '2\n101\n101\n1001')" ]; then
  ok "REPL door: the session observes the assignment"
else
  bad "REPL door (got: $(printf '%s' "$out" | tr '\n' '/'))"
fi

# --- 3. the export table withholds exactly the assigned bindings -------------
EXP=build/lib/mutlib.exports
if [ -f "$EXP" ]; then
  # symbol rows: every export is still exported, assigned or not
  want   "table: the assigned binding is still exported" "$EXP" '\(f \. "mutlib:f"\)'
  # call rows: f and h assigned -> no row; the rest keep theirs
  reject "table: no call row for f (assigned before its define was lowered)" "$EXP" \
         '\(f "mutlib:code:f"'
  reject "table: no call row for h (assigned after its define was lowered)" "$EXP" \
         '\(h "mutlib:code:h"'
  want   "table: the unassigned sibling g keeps its call row" "$EXP" \
         '\(g "mutlib:code:g" 1\)'
  want   "table: the assigning procedure itself keeps its call row" "$EXP" \
         '\(bump "mutlib:code:bump" 0\)'
else
  bad "table: $EXP not written"
fi

# --- 4. the importer emits NO direct call to the withheld label ---------------
# This is the silent-misdispatch assertion.  `emit run --emit` writes the units, a
# boundary marker, then the program; only the importing side matters here.
$RUN --manifest "$MAN" --emit < "$MOD/prog-mutlib.scm" > "$TMP/all.ll" 2>/dev/null
sed -n '/==EMIT-UNIT-BOUNDARY==/,$p' "$TMP/all.ll" > "$TMP/prog.ll"
reject "program: no direct call to the withheld label f" "$TMP/prog.ll" \
       'call fastcc i64 @"mutlib:code:f"'
reject "program: no direct call to the withheld label h" "$TMP/prog.ll" \
       'call fastcc i64 @"mutlib:code:h"'
want   "program: still reads f's slot on each call" "$TMP/prog.ll" \
       'load i64, ptr @"mutlib:f"'
# the control: g was not assigned, so the direct call is still emitted -- otherwise
# the two rejections above would pass for the wrong reason (nothing direct-called).
want   "program: the unassigned sibling g IS direct-called" "$TMP/prog.ll" \
       'call fastcc i64 @"mutlib:code:g"'

# --- 5. the stable label is claimed once per unit (design D2) -----------------
LL=build/lib/mutlib.ll
n="$(grep -c 'define fastcc i64 @"mutlib:code:f"' "$LL" 2>/dev/null || true)"
if [ "$n" = "1" ]; then
  ok "unit: mutlib:code:f is defined exactly once"
else
  bad "unit: mutlib:code:f defined $n time(s) (a nested global-set! took the stable label)"
fi
want   "unit: the assigned lambda got an ordinary counter label" "$LL" \
       '^define fastcc i64 @"mutlib:code_[0-9]+"'

# --- 6. the arms that must NOT have moved ------------------------------------
# Each failure fixture gets its own throwaway manifest: a door preloads every library
# in the manifest it is handed, so a library that cannot compile must not share one
# with a library that must.
fails_with () {  # <name> <lib-name> <lib-source> <program> <regex>
  local man="$TMP/man-$2.scm"
  cat > "$man" <<EOF
((library (scheme base) (source "lib/scheme/base.sld"))
 (library ($2) (source "$3")))
EOF
  if $RUN --manifest "$man" < "$4" >/dev/null 2>"$TMP/f.err"; then
    bad "$1 (expected non-zero exit, but it succeeded)"; return
  fi
  if grep -qE "$5" "$TMP/f.err"; then ok "$1"
  else bad "$1 (failed, but not matching /$5/)"; sed 's/^/         /' "$TMP/f.err"; fi
}
fails_with "assigning an IMPORTED binding is still rejected" \
           mutbad "$MOD/mutbad.sld" "$MOD/prog-mutbad.scm" \
           'cannot assign to an imported binding list-tail'
fails_with "assigning a PRIMITIVE is still rejected" \
           mutprim "$MOD/mutprim.sld" "$MOD/prog-mutprim.scm" \
           'cannot assign to a primitive car'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
