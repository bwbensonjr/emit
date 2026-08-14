#!/usr/bin/env bash
# flat-name-check.sh -- two name hazards of a CONCATENATED top level, both silent, both
# caught with text tools before the ~22-minute regen fixed point rather than after it.
#
# 1. A NAME DEFINED AS BOTH A VARIABLE AND A MACRO KEYWORD (change:
#    binding-aware-expander, issue #103).  Since #103 a top-level (define NAME ...)
#    DISPLACES a (define-syntax NAME ...) of the same spelling: the expander prunes the
#    keyword so the variable wins, which is what makes `(define (when x) ...)` behave the
#    way R7RS says.  Right for a user program, silent disaster in our own sources -- a
#    collision there does not error, it removes a macro, and every use of it becomes a
#    procedure call that evaluates its arguments eagerly.  `(when p (launch))` turning into
#    a call is the shape of the failure.
#
# 2. A DUPLICATE TOP-LEVEL DEFINE (issue #38).  Emit supports redefinition, so a name
#    defined twice cannot keep its direct-call optimization: every call site goes indirect
#    through the mutable global.  Measured cost of ONE accidental duplicate:
#    +186 LLVM function definitions and +18% IR across all three compiler binaries, with no
#    warning and every suite green.  In the flat source a duplicate is never intentional --
#    it is a merge artifact, or someone re-adding a helper that already exists in a file
#    they did not read.  (This check was written after the change above nearly shipped one:
#    an edit re-added `*macro-depth-limit*` beside the original.)
#
# Both are checked PER SCOPE, because the scopes are real: the prelude's procedures compile
# as the baked (scheme base) unit and only its transformers are prepended to a program's
# forms, so a name that is a variable in one scope and a keyword in the other is fine.
#
# CHEZ-FREE and text-level on purpose -- it costs milliseconds, and the whole point is to
# fail before the fixed point, not 25 minutes into a suite run.
#
# Run from the repo root: test/flat-name-check.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

pass=0; fail=0
ok  () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

# The compiler's own flat source, in the order tools/regen.sh concatenates it, plus
# src/repl-core.ss (assembled into the REPL programs from the same top level).  Kept as a
# literal list rather than parsed out of regen.sh: a check that derives its inputs from the
# script it is checking fails open when that script changes shape.
CORE_FLAT="src/match.scm src/util.scm src/parse.ss \
           src/passes/expand.ss src/passes/recognize-let.ss \
           src/passes/convert-assignments.ss src/passes/simplify.ss \
           src/passes/convert-closures.ss \
           src/passes/lower.ss src/emit.ss src/prelude-surface.scm src/core.ss \
           src/dump.ss src/include-reader.ss src/import-substrate.scm \
           src/repl-core.ss"

# Top-level definition names of a file set, one per line, tagged with the file they came
# from so a report can name both sites.  Only column 0 counts: an indented `define` is
# internal to a body and binds nothing at the top level.
names () {           # names KIND FILE...  ->  "NAME<TAB>FILE"
  kind="$1"; shift
  for f in "$@"; do
    awk -v file="$f" -v kind="$kind" '
      kind == "var"   && /^\(define[ \t(]/ {
        s = $0
        sub(/^\(define[ \t]+/, "", s)
        sub(/^\(/, "", s)
        if (match(s, /^[^ \t)]+/)) print substr(s, RSTART, RLENGTH) "\t" file
      }
      kind == "macro" && /^\(define-syntax[ \t]/ {
        s = $0
        sub(/^\(define-syntax[ \t]+/, "", s)
        if (match(s, /^[^ \t)]+/)) print substr(s, RSTART, RLENGTH) "\t" file
      }' "$f"
  done
}

check_scope () {     # check_scope LABEL FILE...
  label="$1"; shift
  names var   "$@" > "$TMP/vars"
  names macro "$@" > "$TMP/macros"
  sort -u "$TMP/vars"   | cut -f1 | sort -u > "$TMP/vnames"
  sort -u "$TMP/macros" | cut -f1 | sort -u > "$TMP/mnames"
  nvar="$(wc -l < "$TMP/vnames" | tr -d ' ')"
  nmac="$(wc -l < "$TMP/mnames" | tr -d ' ')"
  vsay "  $label: $nvar top-level defines, $nmac macro keywords"

  # 1. variable/keyword collision
  collisions="$(comm -12 "$TMP/vnames" "$TMP/mnames")"
  if [ -z "$collisions" ]; then
    ok "$label: no name is both a define and a macro keyword ($nvar defines, $nmac keywords)"
  else
    bad "$label: a name is defined as BOTH a variable and a macro keyword"
    for n in $collisions; do
      vfile="$(awk -F'\t' -v n="$n" '$1==n {print $2}' "$TMP/vars"   | sort -u | tr '\n' ' ')"
      mfile="$(awk -F'\t' -v n="$n" '$1==n {print $2}' "$TMP/macros" | sort -u | tr '\n' ' ')"
      echo "         $n -- define in: $vfile/ define-syntax in: $mfile"
    done
    echo "         The define WINS and the macro is silently gone (change:"
    echo "         binding-aware-expander, design D3).  Rename one of the two."
  fi

  # 2. duplicate top-level define (issue #38).  Reported with every file the name appears
  # in, since the usual case is two files and the second author never saw the first.
  dups="$(cut -f1 "$TMP/vars" | sort | uniq -d)"
  if [ -z "$dups" ]; then
    ok "$label: no top-level define is duplicated"
  else
    bad "$label: a top-level name is defined more than once"
    for n in $dups; do
      echo "         $n -- in:$(awk -F'\t' -v n="$n" '$1==n {print " " $2}' "$TMP/vars" | tr -d '\n')"
    done
    echo "         Redefinition is legal but costs every call site its direct call:"
    echo "         one accidental duplicate measured +18% compiler IR (issue #38)."
  fi
}

say "flat top-level name hazards -> per-scope check (text-level, no chez)"

check_scope "prelude"   src/prelude.scm
# shellcheck disable=SC2086  # word splitting is the point: CORE_FLAT is a file list
check_scope "core-flat" $CORE_FLAT

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
