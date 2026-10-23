#!/usr/bin/env bash
# Provision native dependencies first; this command denies network for all build work.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
if [ "${1:-}" = --help ]; then printf 'Usage: tools/ci-archive.sh ASSET_DIRECTORY\n'; exit 0; fi
if [ "$#" != 1 ]; then printf 'Usage: tools/ci-archive.sh ASSET_DIRECTORY\n' >&2; exit 2; fi
assets=$(cd "$1" && pwd -P)
checkout=$PWD
tools/release-check.sh "$assets"
archive=$(sed 's/^[^ ]*  //' "$assets/SHA256SUMS")
work=$(mktemp -d)
say "extract $assets/$archive -> $work  [fresh source tree]"
tar -xzf "$assets/$archive" -C "$work"
source_tree="$work/${archive%.tar.gz}"
script="$source_tree/tools/ci-archive-build.sh"
cd "$source_tree"
# tools/offline-run.sh denies the network to the complete build process tree, proves it with a
# connectivity probe, and hides the checkout so nothing can fall back to its sources.  On Linux it
# carries the toolchain variables across sudo, so require them here as the archive build always has.
if [ "$(uname -s)" = Linux ]; then
  : "${LLVM_CONFIG:?}" "${CC:?}" "${CXX:?}" "${GC_INC:?}" "${GC_LIB:?}" "${GC_DYLIB:?}"
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-}" EMIT_VERBOSITY="${EMIT_VERBOSITY:-default}"
fi
"$checkout/tools/offline-run.sh" --hide "$checkout" -- /bin/bash "$script"
say "validate $assets/$archive -> offline source build  [${SECONDS}s; workspace $work]"
