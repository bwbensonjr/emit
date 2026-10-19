#!/usr/bin/env bash
# Only this prerequisite may build a missing tuple; consumers restore its bundle.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
if [ "${1:-}" = --help ]; then printf 'Usage: tools/ci-prepare.sh LLVM_MAJOR PREFIX OUTPUT_DIRECTORY\n'; exit 0; fi
if [ "$#" != 3 ]; then printf 'Usage: tools/ci-prepare.sh LLVM_MAJOR PREFIX OUTPUT_DIRECTORY\n' >&2; exit 2; fi
major=$1
prefix=$2
output=$3
if [ ! -f "$prefix/complete" ]; then
  # Resolution cannot update the trusted channel. PRs only create same-run candidates.
  if ! python3 tools/ci-resolve.py "$major" "$prefix"; then
    say "prepare LLVM $major -> exact pinned source recipe  [trusted bundle unavailable]"
  fi
fi
tools/ci-provision.sh "$major" "$prefix"
python3 tools/ci-bundle.py pack "$major" "$prefix" "$output"
