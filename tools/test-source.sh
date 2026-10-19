#!/usr/bin/env bash
# Chez-free current-working-tree proof; all regeneration writes stay isolated.
set -eu
cd "$(dirname "$0")/.."
exec python3 tools/test-source.py "$@"
