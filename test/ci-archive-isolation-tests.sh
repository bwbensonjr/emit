#!/usr/bin/env bash
# Simulate sudo's loader filtering and verify the real Linux wrapper's arguments.
set -euo pipefail
case "${0##*/}" in
  sudo)
    unset LD_LIBRARY_PATH LLVM_CONFIG CC CXX GC_INC GC_LIB GC_DYLIB EMIT_VERBOSITY
    exec "$@"
    ;;
  unshare)
    [ "$1" = --mount ] && [ "$2" = --net ] && [ "$3" = -- ]
    shift 3
    [ "$LD_LIBRARY_PATH" = "$ARCHIVE_TEST_PREFIX/gc lib:$ARCHIVE_TEST_PREFIX/llvm lib" ]
    [ "$LLVM_CONFIG" = "$ARCHIVE_TEST_PREFIX/llvm bin/llvm-config" ]
    [ "$CC" = "$ARCHIVE_TEST_PREFIX/llvm bin/clang" ]
    [ "$CXX" = "$ARCHIVE_TEST_PREFIX/llvm bin/clang++" ]
    [ "$GC_INC" = "$ARCHIVE_TEST_PREFIX/gc include" ]
    [ "$GC_LIB" = "$ARCHIVE_TEST_PREFIX/gc lib" ]
    [ "$GC_DYLIB" = "$ARCHIVE_TEST_PREFIX/gc lib/libgc.so" ]
    [ "$EMIT_VERBOSITY" = quiet ]
    exec "$@"
    ;;
  mount)
    printf '%s\n' "$@" >> "$ARCHIVE_TEST_PREFIX/mount-arguments"
    exit 0
    ;;
  "build child.sh")
    [ "$LD_LIBRARY_PATH" = "$ARCHIVE_TEST_PREFIX/gc lib:$ARCHIVE_TEST_PREFIX/llvm lib" ]
    printf 'child reached\n' > "$ARCHIVE_TEST_PREFIX/result"
    exit 0
    ;;
esac
cd "$(dirname "$0")/.."
repo=$PWD
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
export ARCHIVE_TEST_PREFIX="$work/path with spaces"
mkdir -p "$ARCHIVE_TEST_PREFIX/bin" "$work/empty" "$work/checkout with spaces"
for command in sudo unshare mount; do
  ln -s "$repo/test/ci-archive-isolation-tests.sh" "$ARCHIVE_TEST_PREFIX/bin/$command"
done
ln -s "$repo/test/ci-archive-isolation-tests.sh" "$ARCHIVE_TEST_PREFIX/build child.sh"
export PATH="$ARCHIVE_TEST_PREFIX/bin:$PATH"
export LD_LIBRARY_PATH="$ARCHIVE_TEST_PREFIX/gc lib:$ARCHIVE_TEST_PREFIX/llvm lib"
export LLVM_CONFIG="$ARCHIVE_TEST_PREFIX/llvm bin/llvm-config"
export CC="$ARCHIVE_TEST_PREFIX/llvm bin/clang" CXX="$ARCHIVE_TEST_PREFIX/llvm bin/clang++"
export GC_INC="$ARCHIVE_TEST_PREFIX/gc include" GC_LIB="$ARCHIVE_TEST_PREFIX/gc lib"
export GC_DYLIB="$ARCHIVE_TEST_PREFIX/gc lib/libgc.so" EMIT_VERBOSITY=quiet
checkout="$work/checkout with spaces"
script="$ARCHIVE_TEST_PREFIX/build child.sh"
eval "$(awk '/^run_linux_archive\(\)/ { capture=1 } capture { print } capture && /^}/ { exit }' tools/ci-archive.sh)"
run_linux_archive > "$work/stdout" 2> "$work/stderr"
[ ! -s "$work/stdout" ] && [ ! -s "$work/stderr" ]
[ "$(< "$ARCHIVE_TEST_PREFIX/result")" = 'child reached' ]
grep -Fx "$checkout" "$ARCHIVE_TEST_PREFIX/mount-arguments" >/dev/null
grep -Fx "$work/empty" "$ARCHIVE_TEST_PREFIX/mount-arguments" >/dev/null
printf 'test Linux archive isolation -> quoted paths and loader environment  [3 checks]\n' >&2
