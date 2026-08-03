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
#   - every declared-unstable name is exported (it is the escape hatch, not a wish)
#   - no EXPORTED name is spelled like an internal (%..., *...*, rd-...) unless it is
#     declared unstable -- the naming convention as a checked consequence of the
#     declaration rather than as the mechanism
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

# every top-level (define NAME ...) / (define (NAME . _) ...), in source order.
# `(define-syntax` does not match: after `(define` comes `-`, not a space or `(`.
awk '/^\(define[ (]/ {
       s = $0
       sub(/^\(define[ \t]+/, "", s)
       sub(/^\(/, "", s)
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
decl_names '*scheme-base-private*'  > "$TMP/private"
decl_names '*scheme-base-unstable*' > "$TMP/unstable"

# the committed export list, in file order
awk 'f && /^    \)$/ { f = 0 } f { print $1 } /^  \(export$/ { f = 1 }' \
  lib/scheme/base.sld > "$TMP/exports"

# --- 1. the export list is exactly defines-minus-private, in order ----------

if [ -s "$TMP/private" ]; then
  grep -v -x -F -f "$TMP/private" "$TMP/defines" > "$TMP/expected" || true
else
  cp "$TMP/defines" "$TMP/expected"
fi

if diff -q "$TMP/expected" "$TMP/exports" >/dev/null 2>&1; then
  ok "lib/scheme/base.sld exports the declared surface ($(wc -l < "$TMP/exports" | tr -d ' ') of $(wc -l < "$TMP/defines" | tr -d ' ') defines)"
else
  bad "lib/scheme/base.sld does NOT match the declared surface"
  echo "         a prelude definition is neither declared private (src/prelude-surface.scm)"
  echo "         nor published; declare it, or regenerate to publish it deliberately:"
  echo "           chez --script tools/gen-scheme-base.ss"
  diff "$TMP/exports" "$TMP/expected" \
    | sed -e 's/^</           committed only: /' -e 's/^>/           expected  only: /' \
    | grep -e 'only:' | head -20
fi

# --- 2. the declaration has not rotted -------------------------------------

rot="$(grep -v -x -F -f "$TMP/defines" "$TMP/private" || true)"
if [ -z "$rot" ]; then
  ok "every declared-private name is defined by the prelude"
else
  bad "declared private but not defined by the prelude: $(echo $rot)"
fi

miss="$(grep -v -x -F -f "$TMP/exports" "$TMP/unstable" || true)"
if [ -z "$miss" ]; then
  ok "every declared-unstable name is exported"
else
  bad "declared unstable but not exported: $(echo $miss)"
fi

# --- 3. no exported name LOOKS internal unless it is declared unstable ------
# The naming convention as a CHECKED CONSEQUENCE of the declaration, not as the
# mechanism: spelling does not decide visibility, but a published name that reads
# like an internal is either a leak or an undeclared escape hatch.

grep -E '^(%|rd-)|^\*.*\*$' "$TMP/exports" > "$TMP/internal-looking" || true
if [ -s "$TMP/unstable" ]; then
  leak="$(grep -v -x -F -f "$TMP/unstable" "$TMP/internal-looking" || true)"
else
  leak="$(cat "$TMP/internal-looking")"
fi
if [ -z "$leak" ]; then
  ok "no exported name is spelled like an internal except the $(wc -l < "$TMP/unstable" | tr -d ' ') declared unstable"
else
  bad "internal-looking names are exported without being declared unstable: $(echo $leak)"
  echo "         either declare them private, or record them in *scheme-base-unstable*"
  echo "         with the reason something outside the library must resolve them."
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
