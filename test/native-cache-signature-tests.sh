#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")/.."

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "compile native JIT signature tests" >&2
${CXX:-c++} -std=c++17 test/native-cache-signature-tests.cpp \
  -o "$tmp/native-cache-signature-tests"
echo "run native JIT signature tests" >&2
"$tmp/native-cache-signature-tests"
