#!/usr/bin/env bash
# Bounded entropy acquisition, controlled host failures, and native fidelity.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/llvm-env.sh
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
say "compile test/random-entropy-host.c -> $TMP/host [controlled entropy provider]"
"$CC" -O1 -I"$GC_INC" test/random-entropy-host.c -L"$GC_LIB" -lgc -lm -o "$TMP/host"
"$TMP/host"
make emit >/dev/null
say "run test/random-entropy-check.scm -> emit run [real host entropy]"
build/emit run test/random-entropy-check.scm > "$TMP/run.out"
grep -Fxq "entropy runtime: 3 checks passed" "$TMP/run.out"
say "build test/random-entropy-check.scm -> $TMP/standalone [real host entropy]"
build/emit build test/random-entropy-check.scm -o "$TMP/standalone" > "$TMP/build.out"
"$TMP/standalone" > "$TMP/aot.out"
cmp "$TMP/run.out" "$TMP/aot.out"
say "run test/random-entropy-check.scm -> emit repl [real host entropy]"
build/emit repl < test/random-entropy-check.scm > "$TMP/repl.out"
grep -Fxq "entropy runtime: 3 checks passed" "$TMP/repl.out"
say "test entropy -> complete [host controls and run/build/repl passed]"
