#!/usr/bin/env bash
# Pinned emit-packages collection: run every package's declared checks against
# this Emit. Native: emit run, emit repl, emit build, and published artifacts.
# --source: the Chez source driver. See tools/emit-packages.py.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
case "${1:-}" in
  "") make emit >/dev/null; exec python3 tools/emit-packages.py ;;
  --source) exec python3 tools/emit-packages.py --source ;;
  *) echo "usage: test/emit-packages-tests.sh [--source]" >&2; exit 2 ;;
esac
