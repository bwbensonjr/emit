#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
say "compile test/explicit-artifact-format-tests.cpp -> $TMP/format-tests [C++17]"
${CXX:-c++} -std=c++17 -Wall -Wextra -Werror test/explicit-artifact-format-tests.cpp -o "$TMP/format-tests"
say "run $TMP/format-tests -> artifact wire-format assertions"
"$TMP/format-tests"
