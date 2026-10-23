#!/usr/bin/env bash
# Simulate sudo's loader filtering and verify the real Linux isolation's arguments: the Linux branch
# of tools/offline-run.sh, which tools/ci-archive.sh uses (change: low-cost-distribution-channels).
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
  uname)
    printf 'Linux\n'
    exit 0
    ;;
  curl)
    # The connectivity probe: denied unless a test opens the fake network.
    [ "${ARCHIVE_TEST_NETWORK:-denied}" = open ] && exit 0
    exit 7
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
for command in sudo unshare mount uname curl; do
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
tools/offline-run.sh --hide "$checkout" -- "$script" > "$work/stdout" 2> "$work/stderr"
[ ! -s "$work/stdout" ] && [ ! -s "$work/stderr" ]
[ "$(< "$ARCHIVE_TEST_PREFIX/result")" = 'child reached' ]
grep -Fx -- --make-rprivate "$ARCHIVE_TEST_PREFIX/mount-arguments" >/dev/null
# The hidden checkout (by its physical path) is covered by a bind mount of an empty directory.
grep -Fx "$(cd "$checkout" && pwd -P)" "$ARCHIVE_TEST_PREFIX/mount-arguments" >/dev/null
empty=$(grep -Fx -A1 -- --bind "$ARCHIVE_TEST_PREFIX/mount-arguments" | sed -n 2p)
[ -d "$empty" ] && [ -z "$(ls -A "$empty")" ]
# An isolation that still reaches the network fails before the command runs.
rm -f "$ARCHIVE_TEST_PREFIX/result"
if ARCHIVE_TEST_NETWORK=open tools/offline-run.sh --hide "$checkout" -- "$script" > "$work/open.out" 2> "$work/open.err"; then
  printf 'test: an open network was accepted\n' >&2; exit 1
fi
grep -q 'did not deny access' "$work/open.err"
[ ! -e "$ARCHIVE_TEST_PREFIX/result" ]
# ci-archive.sh hides its checkout through the shared isolation.
grep -q 'tools/offline-run.sh" --hide "$checkout"' tools/ci-archive.sh
printf 'test Linux archive isolation -> quoted paths, loader environment, network probe  [5 checks]\n' >&2
