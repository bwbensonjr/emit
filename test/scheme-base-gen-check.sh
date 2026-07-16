#!/usr/bin/env bash
# scheme-base-gen-check.sh -- guard that lib/scheme/base.sld is not stale
# (change: module-prelude-scheme-base, Stage 3).
#
# src/prelude.scm is the single source of truth for the standard library.
# lib/scheme/base.sld is GENERATED from it by tools/gen-scheme-base.ss and checked
# in.  This guard regenerates to a temp file and diffs against the checked-in copy,
# failing if someone edited src/prelude.scm without regenerating (or hand-edited
# base.sld).  Chez-GATED (the generator runs under Chez).
#
# Run from the repo root:  test/scheme-base-gen-check.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

if ! command -v chez >/dev/null 2>&1; then
  echo "chez not found -- skipping (scheme base) generation guard."; exit 0
fi

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
gen="$TMP/base.sld"
chez --script tools/gen-scheme-base.ss "$gen" >/dev/null 2>&1 || {
  echo "  [FAIL] generator errored"; exit 1; }

if diff -q "$gen" lib/scheme/base.sld >/dev/null 2>&1; then
  echo "  [OK  ] lib/scheme/base.sld is in sync with src/prelude.scm"
  exit 0
else
  echo "  [FAIL] lib/scheme/base.sld is STALE vs src/prelude.scm"
  echo "         regenerate with: chez --script tools/gen-scheme-base.ss"
  diff lib/scheme/base.sld "$gen" | sed 's/^/           /' | head -20
  exit 1
fi
