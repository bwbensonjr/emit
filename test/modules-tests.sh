#!/usr/bin/env bash
# modules-tests.sh -- Stage 1 module vertical-slice suite (change:
# module-artifacts-vertical-slice).  Chez-GATED: it drives the import-aware AOT
# build path (chez src/compile.ss), which resolves (import (L)) through the
# manifest, compiles each library to a unit .ll + .exports, compiles the program
# against the imports, and links runtime + units + program into one exe.
#
# Covers: AOT import (mylib), own-define shadowing, the two-unit no-collision
# blocker, and the library __init one-shot guard (structural).  The REPL door and
# cross-door byte-identity are exercised by the REPL suites once wired.
#
# Run from the repo root:  test/modules-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

if ! command -v chez >/dev/null 2>&1; then
  echo "chez not found -- skipping module vertical-slice suite."; exit 0
fi

MOD=test/modules
MAN="$MOD/emit-libs.scm"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

build () {  # <name> <src>
  chez --libdirs src --script src/compile.ss "$2" --manifest "$MAN" -o "$TMP/$1" \
    >"$TMP/$1.build" 2>&1
}

check () {  # <name> <src> <expected>
  local name="$1" src="$2" want="$3"
  if ! build "$name" "$src"; then
    echo "  [FAIL] $name  (build error)"; sed 's/^/         /' "$TMP/$name.build"; fail=$((fail+1)); return
  fi
  local got; got="$(timeout 30 "$TMP/$name" 2>"$TMP/$name.run")"
  if [ "$got" = "$want" ]; then
    echo "  [OK  ] $name => $got"; pass=$((pass+1))
  else
    echo "  [FAIL] $name => $got  (expected $want)"; fail=$((fail+1))
  fi
}

echo "module vertical-slice (AOT door)"
check aot-import   "$MOD/prog-mylib.scm"  142   # import (mylib); greet -> 142
check aot-shadow   "$MOD/prog-shadow.scm" 7     # own greet shadows the import
check aot-nocollide "$MOD/prog-both.scm"  43    # (liba)+(libb) same-named internals link

echo "library artifact shape"
# a fresh build populates build/lib; inspect the emitted unit module.
LIB=build/lib/mylib.ll
if [ -f "$LIB" ]; then
  # __init one-shot guard present, and NO scheme_entry in the unit.
  if grep -q 'load i64, ptr @"mylib:__inited"' "$LIB" \
     && grep -q 'define i64 @"mylib:__init"()' "$LIB" \
     && ! grep -q 'scheme_entry' "$LIB"; then
    echo "  [OK  ] init-guard  (guarded @\"mylib:__init\", no @scheme_entry)"; pass=$((pass+1))
  else
    echo "  [FAIL] init-guard  (missing guard / stray scheme_entry in $LIB)"; fail=$((fail+1))
  fi
  # export table maps external name -> mangled symbol.
  if grep -q '(greet . "mylib:greet")' build/lib/mylib.exports; then
    echo "  [OK  ] exports  (greet -> mylib:greet)"; pass=$((pass+1))
  else
    echo "  [FAIL] exports  (bad build/lib/mylib.exports)"; fail=$((fail+1))
  fi
else
  echo "  [FAIL] library artifact  (build/lib/mylib.ll missing)"; fail=$((fail+1))
fi

echo "dev->ship fidelity (cross-door byte-identity)"
# The library unit emitted for the AOT door (chez compile.ss, above) must be
# byte-identical to the one the embedded compiler emits for the REPL door.
# build/scheme-run --emit compiles a lone define-library through the SAME core the
# REPL host uses; compare it to the AOT unit (host target header stripped).
if make scheme-run >/dev/null 2>&1; then
  for L in mylib; do
    aot="$TMP/$L.aot.ll"; repl="$TMP/$L.repl.ll"
    grep -v '^target ' "build/lib/$L.ll" > "$aot"
    build/scheme-run --emit < "$MOD/$L.sld" > "$repl" 2>/dev/null
    if diff -q "$aot" "$repl" >/dev/null; then
      echo "  [OK  ] $L unit identical (AOT door == REPL door)"; pass=$((pass+1))
    else
      echo "  [FAIL] $L unit differs across doors"; fail=$((fail+1))
    fi
  done
else
  echo "  [SKIP] cross-door (could not build scheme-run)"
fi

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
