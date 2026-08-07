#!/usr/bin/env bash
# Self-hosting fixed-point (triple) test + independent-host trust-check, re-homed
# on (scheme base) (change: compiler-bootstrap-rehome).
#
# The compiler is now compiled as a program that AUTO-IMPORTS (scheme base), so the
# module-aware compiler is `emit run` (embed), not the `schemec` filter (which
# cannot resolve imports).  The fixed point spans {the baked library set, embed.ll}: a
# module-aware compiler, compiling its OWN source, must reproduce byte-identical library +
# compiler IR.
#
# The baked set is a PARTITION (change: scheme-base-partition), and a member may import
# another, so it cannot be compiled a member at a time from its .sld -- the
# lone-define-library path resolves no imports.  Both the library modules and the program
# module come out of ONE --emit stream instead, split on the boundary marker.
#
#   stage-1 = chez(embed.scm)           IR from the Chez-hosted compiler (compile.ss)
#   run1    = link(stage-1 + baked set) native module-aware compiler from stage-1
#   stage-2 = run1(embed.scm)           IR from the self-compiled compiler
#   run2    = link(stage-2)             native compiler from stage-2
#   stage-3 = run2(embed.scm)           IR from the twice-self-compiled compiler
#
# FIXED POINT: stage-2 == stage-3 (byte-identical embed.ll AND every baked module) --
# both produced by native, self-compiled binaries on the same runtime.  stage-1
# (Chez) is NOT required to match stage-2 (different host, different constant-pool
# intern order -- the compiler converges after one recompile off Chez).
#
# INDEPENDENT-HOST TRUST-CHECK: the Chez stage-1 is built from the CURRENT flat
# source (Chez-free assembly, ordered `cat`, no prelude prepend).  If the resulting
# Emit-hosted fixed point (stage-2) equals the committed bootstrap/embed.ll and every
# committed baked module, the committed IR is faithfully derived from source by two
# independent hosts.
#
# Requires Chez + an LLVM discoverable via llvm-config + libgc.  Run from the repo root: test/self-host-fixpoint.sh
set -u
cd "$(dirname "$0")/.."

# Discover the toolchain (CC/CXX/LLVM_CONFIG/GC_INC/GC_LIB/LDFLAGS) once, single-sourced.
. tools/llvm-env.sh || exit 1

# KEEP IN SYNC with tools/regen.sh's CORE_FLAT (see the note there on src/dump.ss).
CORE_FLAT="src/match.scm src/util.scm src/parse.ss \
           src/passes/expand.ss src/passes/recognize-let.ss \
           src/passes/convert-assignments.ss src/passes/simplify.ss \
           src/passes/convert-closures.ss \
           src/passes/lower.ss src/emit.ss src/prelude-surface.scm src/core.ss \
           src/dump.ss src/include-reader.ss src/import-substrate.scm"

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

# --- splitting an --emit stream (change: scheme-base-partition) ---------------
# The baked standard library is a PARTITION, so a stream is one module per baked member in
# dependency order and then the program: N+1 parts, not 2.  KEEP IN SYNC with the same
# helpers in tools/regen.sh, and with BAKED_LL there and in the Makefile.
BAKED_LL="bootstrap/emit.internal.ll bootstrap/scheme.base.ll"

prog_module () { awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n = 0; delete L; next } { L[++n] = $0 }
                      END { for (i = 1; i <= n; i++) print L[i] }' "$1"; }
unit_module () { awk -v want="$2" 'BEGIN { p = 1 }
                   /^; ==EMIT-UNIT-BOUNDARY==$/ { p++; next }
                   p == want { print }' "$1"; }
unit_count  () { awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n++ } END { print n + 0 }' "$1"; }
split_units () {  # <stream> <prefix>  -> writes <prefix>1.ll.., echoes N
  local n=0 i=0
  n=$(unit_count "$1")
  while [ "$i" -lt "$n" ]; do i=$((i + 1)); unit_module "$1" "$i" > "$2$i.ll"; done
  echo "$n"
}
# Link a stage compiler from a BATCH embed.ll + the baked library modules.  Uses
# run-boot.o (the batch host), not the shipped dispatched emit.o: this fixed point is over
# the batch embed.ll, so its stage runners must drive the batch entry (change:
# run-door-user-libraries, D7).
link_run () {  # <embed.ll> <out> <baked.ll>...
  local embed="$1" out="$2"; shift 2
  "$CXX" build/run-boot.o build/runtime-host.o "$embed" "$@" \
    -Wno-override-module -rdynamic $LDFLAGS -L"$GC_LIB" -lgc -lm -o "$out" 2>/dev/null
}
# The baked set's modules, as the shipped `emit` emits them: the units in front of ANY
# program's stream.  A baked member may import another, so it cannot be compiled on its own
# from its .sld (the lone-define-library path resolves no imports) -- the set only comes
# out of a whole-program compile.
emit_baked_set () {  # <prefix>  -> writes <prefix>1.ll.., echoes N
  # `emit run --emit` on a trivial program: the units come out ahead of it.  Note the verb --
  # `emit` is the unified CLI (change: emit-cli-unification) and has no default door.
  printf '(quote ())\n' | build/emit run --emit > "$work/baked.emit" 2>/dev/null
  split_units "$work/baked.emit" "$1"
}
units_of () {  # <prefix> <n>  -> the module paths, in dependency order
  local i=0 out=""
  while [ "$i" -lt "$2" ]; do i=$((i + 1)); out="$out $1$i.ll"; done
  echo "$out"
}

echo "self-hosting fixed-point (triple) test + independent-host trust-check (re-homed)"

echo "  [1/7] assemble the flat embed program (ordered cat; no prelude prepend)"
{ printf '(define *prelude-source* "'; sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' src/prelude.scm; printf '")\n'; } > "$work/prelude-source.scm"
cat $CORE_FLAT "$work/prelude-source.scm" src/entry-embed.scm > "$work/embed.scm"
make build/run-boot.o build/runtime-host.o >/dev/null 2>&1 || { echo "  [FAIL] could not build host objects"; exit 1; }

echo "  [2/7] stage-1 = chez(embed.scm) via compile.ss (auto-imports (scheme base))"
# The program module the Chez driver emits (auto-importing (scheme base)); strip its host header.
if ! chez --libdirs src --script src/compile.ss "$work/embed.scm" -o "$work/run1bin" -q >/dev/null 2>&1; then
  echo "  [FAIL] Chez-hosted stage-1 embed emission failed"; exit 1
fi
grep -v '^target ' "$work/run1bin.ll" > "$work/s1.embed.ll"
# The baked set's unit IR, emitted host-agnostic by the current committed `emit`.
make emit >/dev/null 2>&1
n1=$(emit_baked_set "$work/s1.unit-")
if ! link_run "$work/s1.embed.ll" "$work/run1" $(units_of "$work/s1.unit-" "$n1"); then
  echo "  [FAIL] could not link the stage-1 module-aware compiler"; exit 1
fi

echo "  [3/7] stage-2 = run1(embed.scm) -- the baked set and the program from one stream"
"$work/run1" --emit < "$work/embed.scm" 2>/dev/null > "$work/s2.emit"
n2=$(split_units "$work/s2.emit" "$work/s2.unit-")
prog_module "$work/s2.emit" > "$work/s2.embed.ll"
[ -s "$work/s2.embed.ll" ] || { echo "  [FAIL] stage-1 compiler failed to compile embed.scm"; exit 1; }

echo "  [4/7] build run2 from stage-2 IR"
if ! link_run "$work/s2.embed.ll" "$work/run2" $(units_of "$work/s2.unit-" "$n2"); then
  echo "  [FAIL] could not link run2 from stage-2 IR"; exit 1
fi

echo "  [5/7] stage-3 = run2(embed.scm)"
"$work/run2" --emit < "$work/embed.scm" 2>/dev/null > "$work/s3.emit"
n3=$(split_units "$work/s3.emit" "$work/s3.unit-")
prog_module "$work/s3.emit" > "$work/s3.embed.ll"

echo "  [6/7] compare stage-2 vs stage-3 (fixed point)"
fail=0
same=1
cmp -s "$work/s2.embed.ll" "$work/s3.embed.ll" || same=0
[ "$n2" = "$n3" ] || same=0
i=0
while [ "$i" -lt "$n2" ] && [ "$same" = 1 ]; do
  i=$((i + 1))
  cmp -s "$work/s2.unit-$i.ll" "$work/s3.unit-$i.ll" || same=0
done
if [ "$same" = 1 ]; then
  echo "  [OK  ] stage-2 == stage-3 (embed.ll $(wc -c <"$work/s2.embed.ll" | tr -d ' ')b, $n2 baked module(s)) -- FIXED POINT"
else
  echo "  [FAIL] stage-2 != stage-3 (embed diff $(diff "$work/s2.embed.ll" "$work/s3.embed.ll" | grep -c '^[<>]') lines; $n2 vs $n3 baked module(s))"
  fail=1
fi

echo "  [7/7] compare stage-2 vs committed IR (independent-host re-derivation)"
# The program module, then each baked member against its committed file -- BAKED_LL is in
# the same dependency order the stream emits, so the i-th unit pairs with the i-th entry.
pairs="s2.embed.ll:bootstrap/embed.ll"
i=0
for c in $BAKED_LL; do
  i=$((i + 1))
  pairs="$pairs s2.unit-$i.ll:$c"
done
if [ "$n2" != "$i" ]; then
  echo "  [FAIL] the compiler emits $n2 baked module(s) but BAKED_LL names $i --"
  echo "         this script's BAKED_LL is out of sync with *prelude-libraries*"
  echo "         (src/prelude-surface.scm); tools/regen.sh and the Makefile carry it too."
  fail=1
fi
for pair in $pairs; do
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
