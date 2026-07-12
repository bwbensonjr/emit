#!/usr/bin/env bash
# Build the persistent ORC/LLJIT REPL host (change: interactive-repl, Group 4).
# The C runtime is linked directly into the host and exported (-rdynamic) so
# JIT'd code resolves rt_* / GC symbols from the running process.
#
# Usage: src/repl/build-host.sh [OUT]   (default OUT=build/repl-host)
set -euo pipefail
cd "$(dirname "$0")/../.."

LLVM=/opt/homebrew/opt/llvm@22
CXX="$LLVM/bin/clang++"
GC_INC=/opt/homebrew/include
GC_LIB=/opt/homebrew/lib
OUT="${1:-build/repl-host}"
OBJ="$(dirname "$OUT")"
mkdir -p "$OBJ"

# Runtime compiled as C, without its standalone main (the host supplies one).
"$LLVM/bin/clang" -std=c11 -O2 -I"$GC_INC" -DRT_NO_MAIN \
  -c src/runtime/runtime.c -o "$OBJ/runtime-host.o"

# Host compiled as C++ against the LLVM headers.
"$CXX" $("$LLVM/bin/llvm-config" --cxxflags) -I"$GC_INC" \
  -c src/repl/host.cpp -o "$OBJ/host.o"

# Link; -rdynamic exports rt_* so JIT'd code resolves them from this process.
"$CXX" "$OBJ/host.o" "$OBJ/runtime-host.o" \
  -rdynamic \
  $("$LLVM/bin/llvm-config" --ldflags --libs orcjit native --system-libs) \
  -L"$GC_LIB" -lgc \
  -o "$OUT"

echo "built $OUT"
