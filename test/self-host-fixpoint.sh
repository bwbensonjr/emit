#!/usr/bin/env bash
# Self-hosting fixed-point (triple) test.
#
# Proves scheme-llvm is self-hosting: the compiler, compiled by itself, compiles
# its own source into a BYTE-IDENTICAL compiler.  Let T = the assembled compiler
# source (prelude ++ core ++ filter main).  We build three stages:
#
#   stage-1 = chez(T)        IR emitted by the Chez-hosted compiler   (build/schemec.ll)
#   schemec1 = link(stage-1) native compiler built from stage-1
#   stage-2 = schemec1(T)    IR emitted by the self-compiled compiler
#   schemec2 = link(stage-2) native compiler built from stage-2
#   stage-3 = schemec2(T)    IR emitted by the twice-self-compiled compiler
#
# The FIXED POINT is  stage-2 == stage-3  (byte-identical).  Both are produced by
# native, self-compiled binaries running the SAME scheme-llvm runtime, so once
# emission is deterministic they must converge.
#
# stage-1 (Chez-hosted) is NOT required to match: Chez and scheme-llvm are
# different host runtimes and intern the constant pool in different orders, so
# stage-1 vs stage-2 differs by design.  Requiring stage-1 == stage-2 would be
# the wrong test -- the compiler reaches its fixed point after one recompile off
# Chez, not zero.
#
# Requires a working `make build/schemec` toolchain.  Run from the repo root:
#   test/self-host-fixpoint.sh
set -u
cd "$(dirname "$0")/.."

# Toolchain -- default to the Makefile's settings; override via the environment.
CC="${CC:-/opt/homebrew/opt/llvm@22/bin/clang}"
GC_INC="${GC_INC:-/opt/homebrew/include}"
GC_LIB="${GC_LIB:-/opt/homebrew/lib}"

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

link_schemec () {  # <in.ll> <out-binary>
  "$CC" -O2 -DRT_FILTER_MAIN -I"$GC_INC" -L"$GC_LIB" \
        src/runtime/runtime.c "$1" -lgc -o "$2" 2>/dev/null
}

echo "self-hosting fixed-point (triple) test"

echo "  [1/5] build stage-1 schemec (chez-hosted)"
if ! make build/schemec >/dev/null 2>&1; then
  echo "  [FAIL] make build/schemec failed"; exit 1
fi

# T = the exact source the native schemec compiles: prelude ++ assembled core+main.
# (build/schemec.scm already carries the filter main; the prelude is prepended
# because the native filter, unlike the Chez driver, does not inject it.)
cat src/prelude.scm build/schemec.scm > "$work/T.scm"

echo "  [2/5] stage-2 = schemec1(T)"
if ! build/schemec < "$work/T.scm" > "$work/s2.ll" 2>/dev/null; then
  echo "  [FAIL] stage-1 schemec failed to compile T"; exit 1
fi

echo "  [3/5] build schemec2 from stage-2 IR"
if ! link_schemec "$work/s2.ll" "$work/schemec2"; then
  echo "  [FAIL] could not link schemec2 from stage-2 IR"; exit 1
fi

echo "  [4/5] stage-3 = schemec2(T)"
if ! "$work/schemec2" < "$work/T.scm" > "$work/s3.ll" 2>/dev/null; then
  echo "  [FAIL] schemec2 failed to compile T"; exit 1
fi

echo "  [5/5] compare stage-2 vs stage-3"
s2b="$(wc -c < "$work/s2.ll" | tr -d ' ')"
s3b="$(wc -c < "$work/s3.ll" | tr -d ' ')"
if diff -q "$work/s2.ll" "$work/s3.ll" >/dev/null; then
  echo "  [OK  ] stage-2 == stage-3 (byte-identical, ${s2b} bytes) -- FIXED POINT"
  echo
  echo "  1 passed, 0 failed"
  exit 0
else
  n="$(diff "$work/s2.ll" "$work/s3.ll" | grep -c '^[<>]')"
  echo "  [FAIL] stage-2 (${s2b}b) != stage-3 (${s3b}b): ${n} diff lines"
  echo "         a self-application divergence remains in the emitter"
  echo
  echo "  0 passed, 1 failed"
  exit 1
fi
