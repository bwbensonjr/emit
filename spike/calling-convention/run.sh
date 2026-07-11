#!/usr/bin/env bash
# Build and run the calling-convention spike experiments.
# Uses the pinned LLVM 22 clang (Homebrew keg, off PATH).
set -eu
cd "$(dirname "$0")"

CLANG=/opt/homebrew/opt/llvm@22/bin/clang
OPT=/opt/homebrew/opt/llvm@22/bin/opt

echo "== verify IR =="
"$OPT" -passes=verify experiments.ll -o /dev/null && echo "  experiments.ll verifies OK"

echo "== build (loop bodies optnone/noinline; rest -O2) =="
"$CLANG" -O2 experiments.ll driver.c -o spike

echo "== run =="
./spike
