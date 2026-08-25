#!/usr/bin/env bash
# Verify pinned UCD bytes and deterministic generated Scheme tables.
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

if ! command -v chez >/dev/null 2>&1; then
  echo "chez not found -- skipping Unicode generation guard."
  exit 0
fi

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
if ! (cd vendor/unicode/17.0.0 && shasum -a 256 -c CHECKSUMS.sha256) >"$TMP/sums" 2>&1; then
  echo "  [FAIL] Unicode 17.0.0 input checksum mismatch"
  sed 's/^/           /' "$TMP/sums" | head -10
  exit 1
fi
echo "  [OK  ] all pinned Unicode 17.0.0 inputs match CHECKSUMS.sha256"

if ! chez --script tools/gen-unicode-tables.ss "$TMP/char-data.scm" \
     >/dev/null 2>"$TMP/generate.err"; then
  echo "  [FAIL] Unicode table generator errored"
  sed 's/^/           /' "$TMP/generate.err" | head -10
  exit 1
fi
sed 's/^/  [INFO] /' "$TMP/generate.err"

if diff -q lib/scheme/char-data.scm "$TMP/char-data.scm" >/dev/null; then
  echo "  [OK  ] lib/scheme/char-data.scm is deterministic and current"
else
  echo "  [FAIL] lib/scheme/char-data.scm is stale"
  echo "         regenerate with: chez --script tools/gen-unicode-tables.ss"
  diff lib/scheme/char-data.scm "$TMP/char-data.scm" | sed 's/^/           /' | head -20
  exit 1
fi

if EMIT_VERBOSITY=quiet chez --script tools/gen-unicode-tables.ss \
     "$TMP/quiet-char-data.scm" >/dev/null 2>"$TMP/quiet.err" \
   && [ ! -s "$TMP/quiet.err" ] \
   && diff -q lib/scheme/char-data.scm "$TMP/quiet-char-data.scm" >/dev/null; then
  echo "  [OK  ] Unicode generation is silent at EMIT_VERBOSITY=quiet"
else
  echo "  [FAIL] Unicode generation quiet mode changed output or wrote narration"
  sed 's/^/           /' "$TMP/quiet.err" | head -10
  exit 1
fi

# Exercise the failure branch against a temporary copy, never the committed data.
cp "$TMP/char-data.scm" "$TMP/drifted.scm"
printf '; deliberate drift probe\n' >> "$TMP/drifted.scm"
if diff -q lib/scheme/char-data.scm "$TMP/drifted.scm" >/dev/null; then
  echo "  [FAIL] deliberate temporary drift was not detected"
  exit 1
else
  echo "  [OK  ] deliberate temporary drift is diagnosed"
fi
