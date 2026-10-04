#!/usr/bin/env bash
# import-set-tests.sh -- import sets, (library ...) requirements, program- and body-level
# include/cond-expand, and `features` (change: portable-library-surface).
#
# Every case runs on the Chez AOT driver (when chez is installed) and on `emit run`,
# against libraries found beneath test/import-sets/lib by conventional-name resolution,
# and each path must produce the expected value.  `emit run` runs from a temporary
# working directory, so a filename that resolved against the invocation rather than the
# file naming it would fail.
#
# Run from anywhere:  test/import-set-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$(pwd)"
FIX="$ROOT/test/import-sets"
LIBROOT="$FIX/lib"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }
EMIT="$ROOT/build/emit"
HAVE_CHEZ=0; command -v chez >/dev/null 2>&1 && HAVE_CHEZ=1

# Extra library roots for one case, as separate -L arguments (the (library NAME) cases
# make a library available or not by adding its root).
EXTRA=()

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# Compile SRC on the Chez driver (which must run from the repo root: src/compile.ss
# includes the core by relative path), then run it from the temporary directory.
run_chez () {  # <name> <src>
  (cd "$ROOT" && chez --libdirs src --script src/compile.ss "$2" \
     --manifest "$ROOT/emit-libs.scm" -L "$LIBROOT" ${EXTRA[@]+"${EXTRA[@]}"} -o "$TMP/$1" \
     >"$TMP/$1.chez.build" 2>&1) \
    && (cd "$TMP" && timeout 30 "$TMP/$1" 2>"$TMP/$1.chez.err")
}

# Run SRC through `emit run` from the temporary directory; print its output.
run_emit () {  # <name> <src>
  (cd "$TMP" && timeout 60 "$EMIT" run --no-manifest-chain --manifest "$ROOT/emit-libs.scm" \
     -L "$LIBROOT" ${EXTRA[@]+"${EXTRA[@]}"} "$2" 2>"$TMP/$1.emit.err")
}

# check <name> <src> <expected>: both paths produce EXPECTED
check () {
  local name="$1" src="$2" want="$3" got
  if [ "$HAVE_CHEZ" = 1 ]; then
    got="$(run_chez "$name" "$src")"
    if [ "$got" = "$want" ]; then ok "$name [chez] => $got"
    else bad "$name [chez] => $got  (expected $want)"
         sed 's/^/         /' "$TMP/$name.chez.build" | tail -5; fi
  fi
  got="$(run_emit "$name" "$src")"
  if [ "$got" = "$want" ]; then ok "$name [emit run] => $got"
  else bad "$name [emit run] => $got  (expected $want)"
       sed 's/^/         /' "$TMP/$name.emit.err" | tail -5; fi
}

# check_fail <name> <src> <regex>: both paths reject SRC with a diagnostic matching REGEX
check_fail () {
  local name="$1" src="$2" re="$3"
  if [ "$HAVE_CHEZ" = 1 ]; then
    if run_chez "$name" "$src" >/dev/null; then bad "$name [chez] (expected failure)"
    elif grep -qE "$re" "$TMP/$name.chez.build"; then ok "$name [chez] (rejected)"
    else bad "$name [chez] (failed, but not matching /$re/)"
         sed 's/^/         /' "$TMP/$name.chez.build" | tail -5; fi
  fi
  if run_emit "$name" "$src" >/dev/null; then bad "$name [emit run] (expected failure)"
  elif grep -qE "$re" "$TMP/$name.emit.err"; then ok "$name [emit run] (rejected)"
  else bad "$name [emit run] (failed, but not matching /$re/)"
       sed 's/^/         /' "$TMP/$name.emit.err" | tail -5; fi
}

echo "overlapping imports: the first import wins (design D5)"
check overlap "$FIX/prog-overlap.scm" "(1 one)"

UNB="unbound variable( with irritant)?"

echo "import sets: only / except / prefix / rename, nested (design D1, D2)"
check      only            "$FIX/prog-only.scm"            42
check_fail only-hidden     "$FIX/prog-only-hidden.scm"     "$UNB helper"
check      except          "$FIX/prog-except.scm"          42
check_fail except-hidden   "$FIX/prog-except-hidden.scm"   "$UNB helper"
check      prefix          "$FIX/prog-prefix.scm"          42
check_fail prefix-hidden   "$FIX/prog-prefix-hidden.scm"   "$UNB greet"
check      rename          "$FIX/prog-rename.scm"          42
check_fail rename-hidden   "$FIX/prog-rename-hidden.scm"   "$UNB greet"
check      nest            "$FIX/prog-nest.scm"            42
check_fail nest-hidden     "$FIX/prog-nest-hidden.scm"     "$UNB m:helper"

echo "import sets over macro exports"
check      macro-prefix        "$FIX/prog-macro-prefix.scm"        "(3 1)"
check_fail macro-prefix-hidden "$FIX/prog-macro-prefix-hidden.scm" "$UNB swap!"
check      macro-except        "$FIX/prog-macro-except.scm"        "(2 3)"

echo "malformed and impossible import sets are named"
check_fail absent           "$FIX/prog-absent.scm"           "no-such-name is not exported by \\(iset a\\)"
check_fail malformed-prefix "$FIX/prog-malformed-prefix.scm" "malformed import set: \\(prefix \\(iset a\\)\\)"
check_fail malformed-rename "$FIX/prog-malformed-rename.scm" "malformed import set: \\(rename \\(iset a\\) greet\\)"

echo "import sets in a library, and over shipped libraries"
check lib-sets     "$FIX/prog-lib-sets.scm"     "(42 4.0)"
check inexact-only "$FIX/prog-inexact-only.scm" "4.0"

echo "an explicit (scheme base) set replaces the implicit import (design D3)"
check_fail base-except        "$FIX/prog-base-except.scm"        "$UNB map"
check      base-prefix        "$FIX/prog-base-prefix.scm"        "((2 3) 1)"
check_fail base-prefix-hidden "$FIX/prog-base-prefix-hidden.scm" "$UNB map"
check      base-bare          "$FIX/prog-base-bare.scm"          "(2 3)"
# a set over (scheme base) may name core keywords and integrated primitives
check      base-only-prims    "$FIX/prog-base-only-prims.scm"    "(1 2)"

echo "the REPL imports through a set (design D4)"
# repl_check <name> <input> <expected last stdout line>
repl_check () {
  local got
  got="$(cd "$TMP" && printf '%s' "$2" | "$EMIT" repl --no-manifest-chain \
           --manifest "$ROOT/emit-libs.scm" -L "$LIBROOT" ${EXTRA[@]+"${EXTRA[@]}"} \
           2>"$TMP/$1.repl.err" \
         | awk 'NF{v=$0} END{print v}')"
  if [ "$got" = "$3" ]; then ok "$1 [emit repl] => $got"
  else bad "$1 [emit repl] => $got  (expected $3)"
       sed 's/^/         /' "$TMP/$1.repl.err" | tail -5; fi
}
# repl_err <name> <input> <regex expected on stderr>
repl_err () {
  (cd "$TMP" && printf '%s' "$2" | "$EMIT" repl --no-manifest-chain \
     --manifest "$ROOT/emit-libs.scm" -L "$LIBROOT" >/dev/null 2>"$TMP/$1.repl.err")
  if grep -qE "$3" "$TMP/$1.repl.err"; then ok "$1 [emit repl] (reported)"
  else bad "$1 [emit repl] (stderr not matching /$3/)"
       sed 's/^/         /' "$TMP/$1.repl.err" | tail -5; fi
}
repl_check repl-only        $'(import (only (iset a) greet))\n(greet)\n'  42
repl_err   repl-only-hidden $'(import (only (iset a) greet))\n(helper)\n' "$UNB helper"
repl_check repl-two-sets \
  $'(import (only (iset a) greet))\n(import (prefix (iset a) a:))\n(list (greet) (a:helper))\n' \
  "(42 5)"
repl_check repl-macro-prefix \
  $'(import (prefix (iset a) k:))\n(define x 1)\n(define y 2)\n(k:swap! x y)\n(list x y)\n' \
  "(3 1)"
repl_err   repl-absent      $'(import (only (iset a) nope))\n' "nope is not exported by \\(iset a\\)"
# ...and the session continues after the rejected import
repl_check repl-absent-continues $'(import (only (iset a) nope))\n(+ 1 2)\n' 3

echo "include and cond-expand at a program's top level (design D8)"
check      top-include     "$FIX/app/main.scm"          42
check      top-nested      "$FIX/app/nested.scm"        7
check      top-include-ci  "$FIX/app/include-ci.scm"    9
check      top-cond-import "$FIX/prog-cond-import.scm"  42
check_fail top-cycle       "$FIX/app/cycle.scm"         "include cycle"
# standard input has no file, so its includes resolve against the working directory
got="$(cd "$FIX/app" && "$EMIT" run --no-manifest-chain --manifest "$ROOT/emit-libs.scm" \
         < main.scm 2>"$TMP/stdin.err")"
if [ "$got" = 42 ]; then ok "top-include-stdin [emit run] => 42"
else bad "top-include-stdin [emit run] => $got  (expected 42)"; tail -3 "$TMP/stdin.err"; fi

echo "include and cond-expand in a body and in expression position (design D9)"
check      body-include    "$FIX/app/body-include.scm"       10
check      expr-cond       "$FIX/prog-expr-cond.scm"         emit
check      expr-cond-none  "$FIX/prog-expr-cond-none.scm"    1
check      body-cond       "$FIX/prog-body-cond.scm"         1
check      shadow-include  "$FIX/prog-shadow-include.scm"    1
check_fail body-unreadable "$FIX/app/unreadable.scm"         'cannot read "nope.scm"'

echo "include and cond-expand inside library bodies"
check lib-include  "$FIX/prog-lib-include.scm"  "(42 5)"
check lib-condbody "$FIX/prog-lib-condbody.scm" emit

echo "both hosts read included files into the same program (design risk: two readers)"
# ir_parity <name> <src>: the Chez driver's program module and `emit run --emit`'s are
# byte-identical (modulo the driver's target header).  The included files are read by two
# INDEPENDENT readers -- Chez's `read` and Emit's own -- so this is where a grammar
# divergence in an included file would show.  helpers.scm and defs.scm are plain; the
# reader-parity suite owns exotic syntax.
ir_parity () {
  local name="$1" src="$2"
  [ "$HAVE_CHEZ" = 1 ] || return 0
  if ! run_chez "$name" "$src" >/dev/null; then bad "$name [parity] (chez build failed)"; return; fi
  (cd "$TMP" && "$EMIT" run --no-manifest-chain --manifest "$ROOT/emit-libs.scm" \
     -L "$LIBROOT" --emit "$src" > "$TMP/$name.emit" 2>/dev/null)
  awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n = 0; delete L; next } { L[++n] = $0 }
       END { for (i = 1; i <= n; i++) print L[i] }' "$TMP/$name.emit" > "$TMP/$name.run.ll"
  grep -v '^target datalayout\|^target triple' "$TMP/$name.ll" > "$TMP/$name.aot.ll"
  if cmp -s "$TMP/$name.run.ll" "$TMP/$name.aot.ll"; then ok "$name [parity] program IR identical"
  else bad "$name [parity] program IR differs between the Chez driver and emit run"; fi
}
ir_parity parity-top-include  "$FIX/app/main.scm"
ir_parity parity-body-include "$FIX/app/body-include.scm"
ir_parity parity-nested       "$FIX/app/nested.scm"

echo "the REPL splices a prompt include or cond-expand (design D8)"
repl_check repl-include "$(printf '(include "%s")\n(f 1)\n' "$FIX/app/defs.scm")" 42
repl_check repl-cond-import $'(cond-expand (emit (import (iset a))) (else))\n(greet)\n' 42
repl_check repl-cond-expr  $'(cond-expand (emit (quote emit)) (else (quote other)))\n' emit
repl_err   repl-include-missing $'(include "nope.scm")\n' 'cannot read "nope.scm"'
repl_check repl-include-missing-continues $'(include "nope.scm")\n(+ 1 2)\n' 3

echo "(library NAME) requirements are answered by the import resolver (design D6)"
check      lib-req-absent    "$FIX/prog-needs8.scm"        fallback
EXTRA=(-L "$FIX/lib8")
check      lib-req-present   "$FIX/prog-needs8.scm"        8
check      lib-req-viadecl   "$FIX/prog-viadecl.scm"       has-eight
check      lib-req-program   "$FIX/prog-lib-req.scm"       8
check      two-rounds-eight  "$FIX/prog-tworound.scm"      eight-only
EXTRA=(-L "$FIX/lib8" -L "$FIX/lib9")
check      two-rounds-both   "$FIX/prog-tworound.scm"      both
EXTRA=()
check      two-rounds-none   "$FIX/prog-tworound.scm"      none
check      lib-req-viadecl-absent "$FIX/prog-viadecl.scm"  no-eight
check      lib-req-program-absent "$FIX/prog-lib-req.scm"  fallback
check      lib-req-baked     "$FIX/prog-lib-base.scm"      yes
check_fail lib-req-malformed "$FIX/prog-lib-malformed.scm" 'takes exactly one library name: \(library srfi-8\)'
EXTRA=(-L "$FIX/lib8")
repl_check repl-lib-req \
  $'(cond-expand ((library (iset eight)) (import (iset eight))) (else))\n(eight-val)\n' 8
EXTRA=()

echo "a cached unit is invalid once a (library NAME) answer changes (design D7)"
# The same library, the same file, run three times while (iset eight) comes and goes: an
# entry keyed on files alone would serve the first answer forever.
CACHE="$TMP/cache"
cached () { EMIT_CACHE="$CACHE" run_emit "$@"; }
a="$(cached cache-1 "$FIX/prog-needs8.scm")"
EXTRA=(-L "$FIX/lib8")
b="$(cached cache-2 "$FIX/prog-needs8.scm")"
EXTRA=()
c="$(cached cache-3 "$FIX/prog-needs8.scm")"
d="$(cached cache-4 "$FIX/prog-needs8.scm")"
if [ "$a/$b/$c/$d" = "fallback/8/fallback/fallback" ]; then
  ok "cache follows the answer (fallback/8/fallback/fallback)"
else
  bad "cache follows the answer (got $a/$b/$c/$d)"
fi

# The Chez driver keys its build/lib units on a .stamp sidecar, which records the answers
# too: the same three runs must not reuse the first answer's unit.
if [ "$HAVE_CHEZ" = 1 ]; then
  a="$(run_chez stamp-1 "$FIX/prog-needs8.scm")"
  EXTRA=(-L "$FIX/lib8")
  b="$(run_chez stamp-2 "$FIX/prog-needs8.scm")"
  EXTRA=()
  c="$(run_chez stamp-3 "$FIX/prog-needs8.scm")"
  if [ "$a/$b/$c" = "fallback/8/fallback" ]; then
    ok "Chez driver stamp follows the answer (fallback/8/fallback)"
  else
    bad "Chez driver stamp follows the answer (got $a/$b/$c)"
  fi
fi

echo "features, and the SRFI identifiers it advertises (design D10, D11)"
check features "$FIX/prog-features.scm" "(#t #t #t)"
# each advertised SRFI is justified by its specified behavior
check srfi-6  "$FIX/srfi/srfi-6.scm"  '("abc x" #\y #t)'
check srfi-9  "$FIX/srfi/srfi-9.scm"  "(#t #f 3 2)"
check srfi-16 "$FIX/srfi/srfi-16.scm" "(0 1 3 10)"
check srfi-23 "$FIX/srfi/srfi-23.scm" '("bad thing:" (1 2))'
check srfi-30 "$FIX/srfi/srfi-30.scm" 3
check srfi-39 "$FIX/srfi/srfi-39.scm" "(20 6 20)"
check srfi-62 "$FIX/srfi/srfi-62.scm" "(1 2 4)"
check srfi-87 "$FIX/srfi/srfi-87.scm" "(10 10)"
# `features` and cond-expand cannot disagree: every listed identifier selects its clause,
# and an absent one does not.
printf '(features)\n' > "$TMP/features.scm"
feats="$(run_emit features-list "$TMP/features.scm" | tr -d '()')"
agree=1
for id in $feats srfi-2; do
  printf "(cond-expand (%s (quote yes)) (else (quote no)))\n" "$id" > "$TMP/fe.scm"
  want=yes; [ "$id" = srfi-2 ] && want=no
  got="$(run_emit "fe-$id" "$TMP/fe.scm")"
  [ "$got" = "$want" ] || { agree=0; echo "         $id: cond-expand says $got, features says $want"; }
done
if [ "$agree" = 1 ] && [ -n "$feats" ]; then ok "features agrees with cond-expand [emit run] ($feats)"
else bad "features agrees with cond-expand [emit run]"; fi

echo
echo "import-set tests: $pass passed, $fail failed"
[ "$fail" = 0 ]
