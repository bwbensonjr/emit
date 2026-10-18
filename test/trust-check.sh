#!/usr/bin/env bash
# Compatibility entry point: current-source proof, independent of Chez and of
# whether the working-tree bootstrap is dirty. Never regenerate this checkout.
set -eu
cd "$(dirname "$0")/.."
exec bash tools/test-source.sh "$@"
