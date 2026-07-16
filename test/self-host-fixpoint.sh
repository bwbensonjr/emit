#!/usr/bin/env bash
# Self-hosting fixed-point (triple) test + independent-host trust-check, re-homed
# on (scheme base) (change: compiler-bootstrap-rehome).
#
# The compiler is now compiled as a program that AUTO-IMPORTS (scheme base), so the
# module-aware compiler is `scheme-run` (embed), not the `schemec` filter (which
# cannot resolve imports).  The fixed point spans {scheme.base.ll, embed.ll}: a
# module-aware compiler, compiling the library source and its OWN source, must
# reproduce byte-identical library + compiler IR.
#
#   stage-1 = chez(embed.scm, base.sld)   IR from the Chez-hosted compiler (compile.ss)
#   run1    = link(stage-1 embed + base)  native module-aware compiler from stage-1
#   stage-2 = run1(embed.scm, base.sld)   IR from the self-compiled compiler
#   run2    = link(stage-2)               native compiler from stage-2
#   stage-3 = run2(embed.scm, base.sld)   IR from the twice-self-compiled compiler
#
# FIXED POINT: stage-2 == stage-3 (byte-identical embed.ll AND scheme.base.ll) --
# both produced by native, self-compiled binaries on the same runtime.  stage-1
# (Chez) is NOT required to match stage-2 (different host, different constant-pool
# intern order -- the compiler converges after one recompile off Chez).
#
# INDEPENDENT-HOST TRUST-CHECK: the Chez stage-1 is built from the CURRENT flat
# source (Chez-free assembly, ordered `cat`, no prelude prepend).  If the resulting
# Emit-hosted fixed point (stage-2) equals the committed bootstrap/{embed,scheme.base}.ll,
# the committed IR is faithfully derived from source by two independent hosts.
#
# Requires Chez + LLVM 22 + libgc.  Run from the repo root: test/self-host-fixpoint.sh
set -u
cd "$(dirname "$0")/.."

CC="${CC:-/opt/homebrew/opt/llvm@22/bin/clang}"
CXX="${CXX:-/opt/homebrew/opt/llvm@22/bin/clang++}"
LLVM_CONFIG="${LLVM_CONFIG:-/opt/homebrew/opt/llvm@22/bin/llvm-config}"
GC_INC="${GC_INC:-/opt/homebrew/include}"
GC_LIB="${GC_LIB:-/opt/homebrew/lib}"
LDFLAGS="$("$LLVM_CONFIG" --ldflags --libs orcjit native --system-libs)"

CORE_FLAT="src/match.scm src/util.scm src/parse.ss \
           src/passes/expand.ss src/passes/recognize-let.ss \
           src/passes/convert-assignments.ss src/passes/convert-closures.ss \
           src/passes/lower.ss src/emit.ss src/core.ss"

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

prog_module () { awk 'f{print} /^; ==EMIT-UNIT-BOUNDARY==$/{f=1}' "$1"; }
link_run () {  # <embed.ll> <base.ll> <out>
  "$CXX" build/run.o build/runtime-host.o "$1" "$2" \
    -Wno-override-module -rdynamic $LDFLAGS -L"$GC_LIB" -lgc -o "$3" 2>/dev/null
}

echo "self-hosting fixed-point (triple) test + independent-host trust-check (re-homed)"

echo "  [1/7] assemble the flat embed program (ordered cat; no prelude prepend)"
{ printf '(define *prelude-source* "'; sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' src/prelude.scm; printf '")\n'; } > "$work/prelude-source.scm"
cat $CORE_FLAT "$work/prelude-source.scm" src/entry-embed.scm > "$work/embed.scm"
make build/run.o build/runtime-host.o >/dev/null 2>&1 || { echo "  [FAIL] could not build host objects"; exit 1; }

echo "  [2/7] stage-1 = chez(embed.scm, base.sld) via compile.ss (auto-imports (scheme base))"
# The program module the Chez driver emits (auto-importing (scheme base)); strip its host header.
if ! chez --libdirs src --script src/compile.ss "$work/embed.scm" -o "$work/run1bin" -q >/dev/null 2>&1; then
  echo "  [FAIL] Chez-hosted stage-1 embed emission failed"; exit 1
fi
grep -v '^target ' "$work/run1bin.ll" > "$work/s1.embed.ll"
# The (scheme base) unit IR, emitted host-agnostic by the current committed scheme-run.
build/scheme-run --emit < lib/scheme/base.sld > "$work/s1.base.ll"
if ! link_run "$work/s1.embed.ll" "$work/s1.base.ll" "$work/run1"; then
  echo "  [FAIL] could not link the stage-1 module-aware compiler"; exit 1
fi

echo "  [3/7] stage-2 = run1(embed.scm, base.sld)"
"$work/run1" --emit < lib/scheme/base.sld > "$work/s2.base.ll" 2>/dev/null
"$work/run1" --emit < "$work/embed.scm" 2>/dev/null > "$work/s2.emit"
prog_module "$work/s2.emit" > "$work/s2.embed.ll"
[ -s "$work/s2.embed.ll" ] || { echo "  [FAIL] stage-1 compiler failed to compile embed.scm"; exit 1; }

echo "  [4/7] build run2 from stage-2 IR"
if ! link_run "$work/s2.embed.ll" "$work/s2.base.ll" "$work/run2"; then
  echo "  [FAIL] could not link run2 from stage-2 IR"; exit 1
fi

echo "  [5/7] stage-3 = run2(embed.scm, base.sld)"
"$work/run2" --emit < lib/scheme/base.sld > "$work/s3.base.ll" 2>/dev/null
"$work/run2" --emit < "$work/embed.scm" 2>/dev/null > "$work/s3.emit"
prog_module "$work/s3.emit" > "$work/s3.embed.ll"

echo "  [6/7] compare stage-2 vs stage-3 (fixed point)"
fail=0
if cmp -s "$work/s2.embed.ll" "$work/s3.embed.ll" && cmp -s "$work/s2.base.ll" "$work/s3.base.ll"; then
  echo "  [OK  ] stage-2 == stage-3 (embed.ll $(wc -c <"$work/s2.embed.ll" | tr -d ' ')b, scheme.base.ll $(wc -c <"$work/s2.base.ll" | tr -d ' ')b) -- FIXED POINT"
else
  echo "  [FAIL] stage-2 != stage-3 (embed diff $(diff "$work/s2.embed.ll" "$work/s3.embed.ll" | grep -c '^[<>]'), base diff $(diff "$work/s2.base.ll" "$work/s3.base.ll" | grep -c '^[<>]'))"
  fail=1
fi

echo "  [7/7] compare stage-2 vs committed IR (independent-host re-derivation)"
for pair in "s2.embed.ll:bootstrap/embed.ll" "s2.base.ll:bootstrap/scheme.base.ll"; do
  s="${pair%%:*}"; c="${pair##*:}"
  if [ ! -f "$c" ]; then echo "  [WARN] $c absent -- skipping"; continue; fi
  if cmp -s "$work/$s" "$c"; then
    echo "  [OK  ] stage-2 == committed $c -- INDEPENDENT-HOST re-derivation"
  else
    echo "  [FAIL] Chez-seeded fixed point != committed $c ($(diff "$work/$s" "$c" | grep -c '^[<>]') diff lines)"
    fail=1
  fi
done

echo
if [ "$fail" -eq 0 ]; then echo "  passed"; else echo "  failed"; fi
[ "$fail" -eq 0 ]
