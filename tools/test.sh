#!/usr/bin/env bash
# Shared, selectable validation. Python uses only the standard library.
set -eu
exec python3 "$(dirname "$0")/test-runner.py" "$@"
