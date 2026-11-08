#!/usr/bin/env bash
# Diagnostic, serialization, host-parity, and freshness controls for generation.
set -eu
cd "$(dirname "$0")/.."
exec python3 test/scheme-base-generator-tests.py "$@"
