#!/usr/bin/env bash
# Verify immutable package inputs and reconstruct the documented SRFI 64 port.
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
say "verify test/snow/sources.sha256 and lib/srfi/upstream.sha256 -> pinned package bytes"
(cd test/snow && shasum -a 256 -c sources.sha256)
shasum -a 256 -c lib/srfi/upstream.sha256
for name in 1 2 8 227; do
  for suffix in sld scm; do
    cmp "test/snow/lib/srfi/$name.$suffix" "lib/srfi/$name.$suffix"
  done
done
say "apply test/snow/srfi-64-emit.patch -> $TMP/srfi [2 adapted files, 2 unchanged includes]"
cp -R test/snow/packages/srfi-64-0.1.7/srfi "$TMP/srfi"
patch --batch -p1 -d "$TMP" < test/snow/srfi-64-emit.patch
for path in 64.sld 64.scm 64/simple-runner.scm 64/source-info.scm; do
  cmp "$TMP/srfi/$path" "lib/srfi/$path"
done
say "verified pinned package inputs and reproducible SRFI 64 port"
