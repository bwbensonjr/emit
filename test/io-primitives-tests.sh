#!/usr/bin/env bash
# Process-I/O primitives (self-host-io-strategy G3): `display` writes a string's
# bytes to stdout verbatim -- no quotes, no trailing newline -- and
# `read-all-stdin` returns all of stdin as a string.  Run from the repo root:
# test/io-primitives-tests.sh
#
# Every standalone program's `main` prints the program's final value after the
# program runs; `(display X)` returns the unspecified value, which prints as
# `()`.  So a `(display "hi")` program's stdout is the raw display bytes followed
# by `()` -- the trailing `()` is the final-value print, not part of `display`'s
# output, and each expectation below accounts for it.  (The standalone `schemec`
# will need a filter-style main that suppresses this value print -- a
# self-hosting-bootstrap task 2.1 concern, tracked in that change's handoff.)
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
# quoted, stdout would be "hi"() ; if it added a newline, it would be hi<LF>().
check display-raw     '(display "hi")'                ''            'hi()'

# read-all-stdin captures every byte, incl. the embedded newline and parens.
check roundtrip       '(display (read-all-stdin))'    "$(printf 'abc\n(x y)')" "$(printf 'abc\n(x y)()')"

# empty stdin -> empty string -> display writes nothing; only the value prints.
check roundtrip-empty '(display (read-all-stdin))'    ''            '()'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
