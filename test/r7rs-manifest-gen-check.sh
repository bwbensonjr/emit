#!/usr/bin/env bash
# r7rs-manifest-gen-check.sh -- guard that test/r7rs/forms.tsv is not stale
# (change: r7rs-conformance-suite, design D2).
#
# forms.tsv is GENERATED from the vendored suite by tools/r7rs-manifest.ss, and the
# runner trusts its line ranges absolutely: a stale manifest makes the runner assemble
# the wrong text and report confidently on it.  Two ways it can go stale, both checked
# here:
#
#   * the suite was refreshed without regenerating (the checksum moves)
#   * forms.tsv was hand-edited (it says DO NOT EDIT BY HAND at the top; this is what
#     makes that more than a request)
#
# Chez-GATED, like test/scheme-base-gen-check.sh: the generator runs under Chez, so this
# skips when Chez is absent.  The Chez-free half of the same protection lives in the
# runner, which verifies the suite's checksum against the one recorded in forms.tsv on
# every run -- so a refreshed-but-not-regenerated suite fails even where Chez is not
# installed.
#
# Run from the repo root:  test/r7rs-manifest-gen-check.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

SUITE=test/r7rs/r7rs-tests.scm
SUMS=test/r7rs/r7rs-tests.sha256
FORMS=test/r7rs/forms.tsv

pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

for f in "$SUITE" "$SUMS" "$FORMS"; do
  [ -f "$f" ] || { bad "$f is missing"; echo; echo "  $pass passed, $fail failed"; exit 1; }
done

# 1. The vendored suite still matches its committed checksum. This is the verbatim rule
#    with teeth: an accidental edit to the suite shows up here rather than as a mystery
#    conformance change.
if (cd test/r7rs && shasum -a 256 -c r7rs-tests.sha256 >/dev/null 2>&1); then
  ok "$SUITE matches $SUMS"
else
  bad "$SUITE does not match its committed checksum"
  echo "         the suite is vendored VERBATIM -- do not edit it (see test/r7rs/README.md)"
  echo "         if this was an intentional refresh: regenerate the manifest and update the checksum"
fi

# 2. The manifest was generated alongside THIS suite.
recorded="$(awk '/^# sha256:/ {print $3; exit}' "$FORMS")"
actual="$(awk '{print $1; exit}' "$SUMS")"
if [ "$recorded" = "$actual" ]; then
  ok "$FORMS records the committed suite checksum"
else
  bad "$FORMS was generated against a different suite"
  echo "         forms.tsv records: $recorded"
  echo "         committed suite is: $actual"
  echo "         regenerate with: chez --script tools/r7rs-manifest.ss"
fi

# 3. Regenerating reproduces the committed manifest byte-for-byte.
if ! command -v chez >/dev/null 2>&1; then
  echo "  [SKIP] chez not found -- cannot verify forms.tsv by regeneration"
  echo
  echo "  $pass passed, $fail failed"
  [ "$fail" -eq 0 ]; exit $?
fi

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
if ! chez --script tools/r7rs-manifest.ss "$SUITE" "$TMP/forms.tsv" >/dev/null 2>"$TMP/err"; then
  bad "the generator errored"
  sed 's/^/           /' "$TMP/err" | head -20
else
  if diff -q "$TMP/forms.tsv" "$FORMS" >/dev/null 2>&1; then
    ok "$FORMS is in sync with $SUITE"
  else
    bad "$FORMS is STALE (or was hand-edited)"
    echo "         regenerate with: chez --script tools/r7rs-manifest.ss"
    diff "$FORMS" "$TMP/forms.tsv" | sed 's/^/           /' | head -20
  fi
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
