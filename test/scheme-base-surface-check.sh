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
