#!/usr/bin/env bash
# Process-I/O primitives (self-host-io-strategy G3): `display` writes a string's
# bytes to stdout verbatim -- no quotes, no trailing newline -- and
# `read-all-stdin` returns all of stdin as a string.  Run from the repo root:
# test/io-primitives-tests.sh
#
# Every standalone program's `main` prints the program's final value after the program
# runs -- EXCEPT when that value is the unspecified value, which prints nothing at all,
# not even a newline (change: emit-cli-front-door, design D4).  `(display X)` returns
# the unspecified value, so a `(display "hi")` program's stdout is exactly the raw
# display bytes: these expectations are the display output alone, with no trailing
# token.  That makes them a direct test of what `display` writes.  The rule is the
# interactive REPL's echo suppression (src/emit.cpp run_thunk) stated for programs, and
# `emit run` carries the identical guard, so this door and the in-process one agree.
# It remains a REPORTING policy: an explicit `(write (if #f #f))` still renders
# `#<unspecified>`.  RT_FILTER_MAIN is the separate, stronger mode that suppresses
# EVERY final value; the self-hosted `schemec` is built with it (Makefile:99).
set -u
cd "$(dirname "$0")/.."

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

pass=0; fail=0

# name  source-text  stdin-text  expected-stdout
check () {
  local name="$1" src="$2" input="$3" want="$4"
  printf '%s' "$src" > "$TMP/$name.scm"
  if ! chez --libdirs src --script src/compile.ss "$TMP/$name.scm" --no-prelude \
         -o "$TMP/$name" >/dev/null 2>"$TMP/$name.err"; then
    echo "  [FAIL] $name  (compile error)"; sed 's/^/         /' "$TMP/$name.err"
    fail=$((fail+1)); return
  fi
  local got; got="$(printf '%s' "$input" | timeout 60 "$TMP/$name")"
  if [ "$got" = "$want" ]; then
    echo "  [OK  ] $name => $(printf '%q' "$got")"; pass=$((pass+1))
  else
    echo "  [FAIL] $name => $(printf '%q' "$got")  (expected $(printf '%q' "$want"))"
    fail=$((fail+1))
  fi
}

echo "process-I/O primitives (display / read-all-stdin)"

# display writes raw bytes: no surrounding quotes and no added newline.  If it
# quoted, stdout would be "hi" ; if it added a newline, hi<LF>.
check display-raw     '(display "hi")'                ''            'hi'

# read-all-stdin captures every byte, incl. the embedded newline and parens.
check roundtrip       '(display (read-all-stdin))'    "$(printf 'abc\n(x y)')" "$(printf 'abc\n(x y)')"

# empty stdin -> empty string -> display writes nothing, and the unspecified final
# value is suppressed, so the program's stdout is empty.
check roundtrip-empty '(display (read-all-stdin))'    ''            ''

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
