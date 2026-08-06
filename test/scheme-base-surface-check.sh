#!/usr/bin/env bash
# scheme-base-surface-check.sh -- guard that (scheme base)'s public surface is the
# DECLARED one (change: scheme-base-declared-surface, GitHub issue #29).
#
# src/prelude.scm says what (scheme base) CONTAINS; src/prelude-surface.scm says what
# it EXPORTS.  The export list is the prelude's top-level defines in SOURCE ORDER minus
# *scheme-base-private*.  This guard recomputes that list from the two sources with text
# tools only and diffs it against the committed lib/scheme/base.sld -- so adding a
# prelude helper without declaring it private FAILS HERE, forcing a visibility decision
# instead of silently publishing the name.
#
# CHEZ-FREE on purpose: the generator's own guard (test/scheme-base-gen-check.sh) skips
# when chez is absent, so it cannot be the gate.  This one runs in run-all-tests.sh.
#
# Also asserted:
#   - every declared-private name is actually defined by the prelude (no rot)
#   - NO exported name is spelled like an internal (%..., *...*, rd-...) -- the naming
#     convention as a checked consequence of the declaration rather than as the mechanism.
#     There used to be an `unstable` tier exempting two reader helpers from this; the
#     substrate retired it (change: scheme-base-partition, issue #32), so the rule is now
#     absolute and the exemption list is gone.
#
# Run from the repo root: test/scheme-base-surface-check.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

ok   () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad  () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# --- the three name lists, extracted with text tools only -------------------

# Every top-level binding the prelude introduces, in source order: both
# (define NAME ...) / (define (NAME . _) ...) and (define-syntax NAME ...).
#
# The transformers used to be excluded here on purpose -- they could not be exported, so
# a macro name appearing in an export list was a bug.  Since `library-body-macro-scope`
# (issue #55) a transformer is a homed, exportable binding like any other, and
# (scheme base) publishes ten of them, so leaving them out would make this guard demand
# that the committed surface DROP the derived forms.
awk '/^\(define[ (]/ {
       s = $0
       sub(/^\(define[ \t]+/, "", s)
       sub(/^\(/, "", s)
       if (match(s, /^[^ \t)]+/)) print substr(s, RSTART, RLENGTH)
     }
     /^\(define-syntax[ \t]/ {
       s = $0
       sub(/^\(define-syntax[ \t]+/, "", s)
       if (match(s, /^[^ \t)]+/)) print substr(s, RSTART, RLENGTH)
     }' src/prelude.scm > "$TMP/defines"

# a quoted name list from the declaration, e.g. (define *scheme-base-private* '(a b c))
decl_names () {  # $1 = declaration variable name
  awk -v var="$1" '
    { sub(/;.*/, "") }                                  # comments carry no names
    !grab && index($0, "(define " var) { grab = 1 }
    grab {
      buf = buf " " $0
      opens = gsub(/\(/, "("); closes = gsub(/\)/, ")")  # gsub returns the count
      depth += opens - closes
      if (depth <= 0) grab = 0
    }
    END {
      sub(/^[^(]*\(define[ \t]+[^ \t]+[ \t]*/, "", buf)  # drop "(define VAR"
      gsub(/[()'\'']/, " ", buf)                         # parens and the quote mark
      n = split(buf, a, /[ \t\n]+/)
      for (i = 1; i <= n; i++) if (a[i] != "") print a[i]
    }' src/prelude-surface.scm
}
decl_names '*scheme-base-private*'   > "$TMP/private"
# Names another partition member exports, so (scheme base) does not (change:
# scheme-base-partition) -- distinct from *scheme-base-private*, which is "exported by
# nothing".  A derived list, recomputed and cross-checked against the authoritative
# assignments by tools/gen-scheme-base.ss, so this guard can stay a text diff rather than
# parse home specs.
decl_names '*scheme-base-elsewhere*' > "$TMP/elsewhere"

# the committed export list, in file order
awk 'f && /^    \)$/ { f = 0 } f { print $1 } /^  \(export$/ { f = 1 }' \
  lib/scheme/base.sld > "$TMP/exports"

# --- 1. the export list is exactly defines-minus-private-minus-elsewhere, in order ---

cat "$TMP/private" "$TMP/elsewhere" | sort -u > "$TMP/not-in-base"
if [ -s "$TMP/not-in-base" ]; then
  grep -v -x -F -f "$TMP/not-in-base" "$TMP/defines" > "$TMP/expected" || true
else
  cp "$TMP/defines" "$TMP/expected"
fi

if diff -q "$TMP/expected" "$TMP/exports" >/dev/null 2>&1; then
  ok "lib/scheme/base.sld exports the declared surface ($(wc -l < "$TMP/exports" | tr -d ' ') of $(wc -l < "$TMP/defines" | tr -d ' ') defines; $(wc -l < "$TMP/private" | tr -d ' ') private, $(wc -l < "$TMP/elsewhere" | tr -d ' ') in another library)"
else
  bad "lib/scheme/base.sld does NOT match the declared surface"
  echo "         a prelude definition is neither declared private nor assigned to another"
  echo "         partition member (src/prelude-surface.scm) nor published; declare it, or"
  echo "         regenerate to publish it deliberately:"
  echo "           chez --script tools/gen-scheme-base.ss"
  diff "$TMP/exports" "$TMP/expected" \
    | sed -e 's/^</           committed only: /' -e 's/^>/           expected  only: /' \
    | grep -e 'only:' | head -20
fi

# --- 2. the declaration has not rotted -------------------------------------

rot="$(grep -v -x -F -f "$TMP/defines" "$TMP/not-in-base" || true)"
if [ -z "$rot" ]; then
  ok "every name declared private or elsewhere is defined by the prelude"
else
  bad "declared private/elsewhere but not defined by the prelude: $(echo $rot)"
fi

# The sixteen relocated names must be gone from (scheme base) and present in the library
# R7RS assigns them to -- the change's whole point, asserted directly rather than inferred
# from the subtraction above (change: scheme-base-partition, issue #33).
check_moved () {  # <library-file> <name>...
  local f="$1"; shift
  local miss="" still=""
  for n in "$@"; do
    # $TMP/exports holds BARE names (extracted with awk); a .sld holds them indented.
    grep -qx "$n"     "$TMP/exports" && still="$still $n"
    grep -qx "    $n" "$f"           || miss="$miss $n"
  done
  if [ -z "$still" ] && [ -z "$miss" ]; then
    ok "$(basename "$f") exports $# relocated name(s), and (scheme base) does not"
  else
    [ -n "$still" ] && bad "(scheme base) still exports:$still"
    [ -n "$miss" ]  && bad "$(basename "$f") does not export:$miss"
  fi
}
check_moved lib/scheme/cxr.sld  caaar caadr cadar caddr cdaar cdadr cddar cdddr cadddr
check_moved lib/scheme/read.sld read
check_moved lib/scheme/file.sld open-input-file open-output-file with-input-from-file \
            with-output-to-file call-with-input-file call-with-output-file

# (scheme cxr) ships COMPLETE: all twenty-four compositions of three to four car/cdr
# operations (design D9), not just the nine the compiler happened to need.
ncxr="$(awk 'f && /^    \)$/ { f = 0 } f { print $1 } /^  \(export$/ { f = 1 }' \
          lib/scheme/cxr.sld | wc -l | tr -d ' ')"
if [ "$ncxr" = "24" ]; then
  ok "(scheme cxr) exports all 24 R7RS compositions"
else
  bad "(scheme cxr) exports $ncxr names, expected 24 (R7RS-small 6.4 / docs/r7rs)"
fi

# The depth-2 four stay in (scheme base) -- the partition must not be over-applied.
d2miss=""
for n in caar cadr cdar cddr; do grep -qx "$n" "$TMP/exports" || d2miss="$d2miss $n"; done
if [ -z "$d2miss" ]; then
  ok "(scheme base) still exports the depth-2 accessors caar/cadr/cdar/cddr"
else
  bad "(scheme base) lost depth-2 accessors R7RS places there:$d2miss"
fi

# --- 2b. the substrate does not depend on the library that imports it -------
# (scheme base) imports (emit internal), so the substrate cannot import it back -- a cycle
# no door could resolve.  Its .sld must therefore have NO import clause at all (change:
# scheme-base-partition, design D10).
if grep -q '^  (import ' lib/emit/internal.sld; then
  bad "lib/emit/internal.sld has an import clause: $(grep '^  (import ' lib/emit/internal.sld | tr '\n' ' ')"
  echo "         the substrate is the LOWER layer -- (scheme base) imports IT, so anything"
  echo "         its body reaches must be defined in it (design D10)."
else
  ok "the substrate imports nothing (it cannot import the library that imports it)"
fi

# --- 2c. a definition assigned to two libraries is emitted into both --------
# The nine depth-3 accessors are homed in BOTH the substrate (for the compiler's 48 call
# sites, design D6) and (scheme cxr) (for users).  Each library defines its own; neither
# re-exports the other's binding, because a unit's export table maps a name to a symbol
# mangled to THAT unit.
dual_missing=""
for n in caaar caadr cadar caddr cdaar cdadr cddar cdddr cadddr; do
  grep -qx "    $n" lib/emit/internal.sld || dual_missing="$dual_missing internal:$n"
  grep -qx "    $n" lib/scheme/cxr.sld    || dual_missing="$dual_missing cxr:$n"
  grep -q  "^    (define ($n " lib/emit/internal.sld || dual_missing="$dual_missing internal-body:$n"
  grep -q  "^    (define ($n " lib/scheme/cxr.sld    || dual_missing="$dual_missing cxr-body:$n"
done
if [ -z "$dual_missing" ]; then
  ok "the 9 dual-assigned accessors are DEFINED and exported by both the substrate and (scheme cxr)"
else
  bad "dual assignment incomplete:$dual_missing"
fi

# --- 3. no exported name LOOKS internal ------------------------------------
# The naming convention as a CHECKED CONSEQUENCE of the declaration, not as the
# mechanism: spelling does not decide visibility, but a published name that reads
# like an internal is a leak.  No exemptions -- the `unstable` tier that used to hold
# two of them is retired, its members re-homed in the substrate the compiler imports
# (change: scheme-base-partition, issue #32).

leak="$(grep -E '^(%|rd-)|^\*.*\*$' "$TMP/exports" || true)"
if [ -z "$leak" ]; then
  ok "no exported name is spelled like an internal"
else
  bad "internal-looking names are exported: $(echo $leak)"
  echo "         declare them private in src/prelude-surface.scm, or -- if something"
  echo "         outside (scheme base) must resolve them -- assign them to the substrate"
  echo "         and have that consumer import (emit internal)."
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
