#!/usr/bin/env bash
# prelude-base-tests.sh -- Stage 3 (scheme base) auto-import, AOT door (change:
# module-prelude-scheme-base).  Chez-GATED: drives the import-aware AOT build path
# (chez src/compile.ss), which auto-imports (scheme base) into every prelude-enabled
# program -- its procedures come from the linked scheme.base.ll and its derived-form
# macros are merged compile-time.  --no-prelude skips both.
#
# Run from the repo root:  test/prelude-base-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

if ! command -v chez >/dev/null 2>&1; then
  echo "chez not found -- skipping (scheme base) AOT suite."; exit 0
fi

MOD=test/modules
MAN="$MOD/emit-libs.scm"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

build () {  # <name> <src> [extra args...]
  chez --libdirs src --script src/compile.ss "$2" --manifest "$MAN" -o "$TMP/$1" \
    "${@:3}" >"$TMP/$1.build" 2>&1
}
check () {  # <name> <src> <expected>
  local name="$1" src="$2" want="$3"
  if ! build "$name" "$src"; then
    echo "  [FAIL] $name  (build error)"; sed 's/^/         /' "$TMP/$name.build"; fail=$((fail+1)); return
  fi
  local got; got="$(timeout 30 "$TMP/$name" 2>"$TMP/$name.run")"
  if [ "$got" = "$want" ]; then echo "  [OK  ] $name => $got"; pass=$((pass+1))
  else echo "  [FAIL] $name => $got  (expected $want)"; fail=$((fail+1)); fi
}

echo "(scheme base) auto-import (AOT door)"
check base-procs  "$MOD/prog-base-procs.scm"  "(4 16)"      # map/filter via (scheme base), no import
check base-macros "$MOD/prog-base-macros.scm" "(yes 2 7)"   # cond/case/when derived-form macros
check base-shadow "$MOD/prog-base-shadow.scm" mine          # user map shadows the (scheme base) export
check base-both   "$MOD/prog-base-both.scm"   143           # auto-import + explicit (mylib) import

echo "(scheme base) links exactly once (auto-import + explicit import)"
if build both2 "$MOD/prog-base-both.scm"; then
  n="$(grep -c 'call i64 @"scheme.base:__init"' "$TMP/both2.ll")"
  if [ "$n" = "1" ]; then echo "  [OK  ] links-once  (one scheme.base:__init call)"; pass=$((pass+1))
  else echo "  [FAIL] links-once  ($n scheme.base:__init calls, expected 1)"; fail=$((fail+1)); fi
else
  echo "  [FAIL] links-once  (build error)"; fail=$((fail+1))
fi

echo "--no-prelude leaves prelude procedures AND macros unbound"
# a prelude procedure (map) is unbound
if build np-proc "$MOD/prog-base-procs.scm" --no-prelude; then
  echo "  [FAIL] no-prelude-proc  (built, expected unbound map)"; fail=$((fail+1))
elif grep -qE "unbound variable.*map" "$TMP/np-proc.build"; then
  echo "  [OK  ] no-prelude-proc  (map unbound)"; pass=$((pass+1))
else
  echo "  [FAIL] no-prelude-proc  (failed, but not on unbound map)"; sed 's/^/         /' "$TMP/np-proc.build"; fail=$((fail+1))
fi
# a derived-form macro (cond/case) is not available either
if build np-macro "$MOD/prog-base-macros.scm" --no-prelude; then
  echo "  [FAIL] no-prelude-macro  (built, expected unbound)"; fail=$((fail+1))
elif grep -qE "unbound variable" "$TMP/np-macro.build"; then
  echo "  [OK  ] no-prelude-macro  (derived-form macro unavailable)"; pass=$((pass+1))
else
  echo "  [FAIL] no-prelude-macro  (failed, but not on unbound)"; sed 's/^/         /' "$TMP/np-macro.build"; fail=$((fail+1))
fi

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
