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
mkdir "$work/empty"
say "extract $assets/$archive -> $work  [fresh source tree]"
tar -xzf "$assets/$archive" -C "$work"
source_tree="$work/${archive%.tar.gz}"
script="$source_tree/tools/ci-archive-build.sh"
case "$(uname -s)" in
  Linux)
    # Mount hiding prevents fallback to any source in the Actions checkout.
    sudo --preserve-env=LLVM_CONFIG,CC,CXX,GC_INC,GC_LIB,GC_DYLIB,LD_LIBRARY_PATH,EMIT_VERBOSITY \
      unshare --mount --net -- /bin/bash -c \
      'mount --make-rprivate /; mount --bind "$1" "$2"; exec /bin/bash "$3"' \
      archive "$work/empty" "$checkout" "$script"
    ;;
  Darwin)
    # sandbox-exec applies to the complete subprocess tree, including clang/make.
    sandbox-exec -p "(version 1) (allow default) (deny network*) (deny file-read* (subpath \"$checkout\"))" /bin/bash "$script"
    ;;
  *) printf 'archive: no network isolation recipe for this platform\n' >&2; exit 1 ;;
esac
say "validate $assets/$archive -> offline source build  [${SECONDS}s; workspace $work]"
