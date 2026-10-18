#!/usr/bin/env bash
# Executed from the extracted payload inside the OS network sandbox.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
[ ! -e .git ]
if command -v chez >/dev/null 2>&1; then printf 'archive: Chez must be unavailable\n' >&2; exit 1; fi
# Prove the sandbox actually denies external connectivity before invoking make.
if curl --connect-timeout 3 --max-time 5 -fsS https://github.com >/dev/null 2>&1; then
  printf 'archive: network sandbox did not deny access\n' >&2; exit 1
fi
say "build extracted source -> build/emit  [network denied, no Git, no Chez]"
make -j2
stage=$(mktemp -d)
make install PREFIX=/usr/local DESTDIR="$stage"
tools/ci-installed-smoke.sh "$stage/usr/local"
say "validate extracted source -> staged install  [${SECONDS}s]"
