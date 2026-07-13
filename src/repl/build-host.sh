#!/usr/bin/env bash
# Build the persistent ORC/LLJIT REPL host (change: interactive-repl, Group 4;
# build made dependency-driven by change: fix-stale-repl-host-rebuild).
#
# The real recipe now lives in the top-level Makefile so the host is rebuilt
# whenever src/runtime/runtime.c, src/repl/host.cpp, or the recipe changes -- not
# merely when the binary is missing.  This script is a thin wrapper that invokes
# the `build/repl-host` target (a no-op when already up to date).
#
# Usage: src/repl/build-host.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
exec make build/repl-host
