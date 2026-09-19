#!/usr/bin/env bash
# orc-native-object-probe.sh -- compile and run the native object capture seam.
set -eu
cd "$(dirname "$0")/.."

. tools/llvm-env.sh

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "compile ORC native-object probe with LLVM $($LLVM_CONFIG --version)" >&2
"$CXX" $CXXFLAGS -rdynamic test/orc-native-object-probe.cpp $LDFLAGS \
  -o "$tmp/orc-native-object-probe"

echo "run ORC native-object capture and admission probe" >&2
"$tmp/orc-native-object-probe"
