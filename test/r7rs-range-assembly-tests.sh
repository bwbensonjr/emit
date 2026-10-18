#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")/.."
exec bash test/r7rs-suite-tests.sh --check-assembly
