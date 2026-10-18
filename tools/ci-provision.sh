#!/usr/bin/env bash
# One commit-pinned recipe on both platforms; cache the resulting installation.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
if [ "${1:-}" = --help ]; then printf 'Usage: tools/ci-provision.sh LLVM_MAJOR INSTALL_DIRECTORY\n'; exit 0; fi
if [ "$#" != 2 ]; then printf 'Usage: tools/ci-provision.sh LLVM_MAJOR INSTALL_DIRECTORY\n' >&2; exit 2; fi
major=$1
prefix=$2
case "$major" in
  19) version=19.1.7; revision=cd708029e0b2869e80abe31ddb175f7c35361f90 ;;
  20) version=20.1.8; revision=87f0227cb60147a26a1eeb4fb06e3b505e9c7261 ;;
  21) version=21.1.0; revision=3623fe661ae35c6c80ac221f14d85be76aa870f1 ;;
  22) version=22.1.0; revision=4434dabb69916856b824f68a64b029c67175e532 ;;
  23) version=23.1.0; revision=ea7d852a70e8bdfaf601d6626a760f9771b2c4b4 ;;
  *) printf 'ci: unsupported matrix major: %s\n' "$major" >&2; exit 2 ;;
esac
gc_revision=ee59af3722e56de8404de6cd0c21c2493cc4d855
projects=clang
components="clang;clang-resource-headers;llvm-config;LLVM;llvm-headers"
linker_options=()
case "$(uname -s)" in
  Linux)
    projects="clang;lld"
    components="$components;lld"
    linker_options=(-DCLANG_DEFAULT_LINKER=lld)
    ;;
  Darwin)
    # Clang passes its adjacent libLTO.dylib to the SDK linker for -flto.
    components="$components;LTO"
    ;;
esac
identity="$version $revision $gc_revision recipe-3"
mkdir -p "$prefix"
prefix=$(cd "$prefix" && pwd -P)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
if [ -f "$prefix/complete" ]; then
  [ "$(< "$prefix/complete")" = "$identity" ] || { printf 'ci: cached dependency identity differs\n' >&2; exit 1; }
  say "reuse LLVM $version + libgc 8.2.8 -> $prefix"
else
  fetch() {
    local repository=$1 revision=$2 destination=$3
    say "fetch $repository@$revision -> $destination"
    git init -q "$destination"
    git -C "$destination" fetch --depth=1 "https://github.com/$repository.git" "$revision"
    git -C "$destination" checkout -q --detach FETCH_HEAD
    [ "$(git -C "$destination" rev-parse HEAD)" = "$revision" ]
  }
  fetch llvm/llvm-project "$revision" "$work/llvm"
  say "configure LLVM $version -> $work/llvm-build"
  cmake -S "$work/llvm/llvm" -B "$work/llvm-build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$prefix/llvm" \
    -DCMAKE_INSTALL_LIBDIR=lib -DLLVM_LIBDIR_SUFFIX= \
    -DLLVM_ENABLE_PROJECTS="$projects" -DLLVM_TARGETS_TO_BUILD=Native \
    -DLLVM_DISTRIBUTION_COMPONENTS="$components" "${linker_options[@]}" \
    -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_BENCHMARKS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_ENABLE_ASSERTIONS=OFF \
    -DCLANG_ENABLE_STATIC_ANALYZER=OFF -DCLANG_ENABLE_ARCMT=OFF \
    -DLLVM_ENABLE_TERMINFO=OFF -DLLVM_ENABLE_ZLIB=OFF -DLLVM_ENABLE_ZSTD=OFF \
    -DLLVM_PARALLEL_LINK_JOBS=1 >&2
  say "build LLVM $version -> $prefix/llvm"
  cmake --build "$work/llvm-build" --target distribution --parallel "${EMIT_CI_JOBS:-2}" >&2
  cmake --build "$work/llvm-build" --target install-distribution >&2
  fetch bdwgc/bdwgc "$gc_revision" "$work/gc"
  say "build libgc 8.2.8 -> $prefix/gc"
  cmake -S "$work/gc" -B "$work/gc-build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$prefix/gc" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON -Denable_docs=OFF -Denable_tests=OFF >&2
  cmake --build "$work/gc-build" --parallel "${EMIT_CI_JOBS:-2}" >&2
  cmake --install "$work/gc-build" >&2
  printf '%s\n' "$identity" > "$prefix/complete"
fi
[ "$("$prefix/llvm/bin/llvm-config" --version)" = "$version" ]
for compiler in clang clang++; do
  "$prefix/llvm/bin/$compiler" --version >&2
  "$prefix/llvm/bin/$compiler" --version | head -n 1 | grep -Eq "version $major[.]"
done
case "$(uname -s)" in
  Linux)
    [ -x "$prefix/llvm/bin/ld.lld" ]
    "$prefix/llvm/bin/ld.lld" --version >&2
    "$prefix/llvm/bin/ld.lld" --version | grep -Eq "LLD $major[.]"
    ;;
  Darwin) [ -f "$prefix/llvm/lib/libLTO.dylib" ] ;;
esac
# Exercise the same implicit linker selection used by Emit's -flto AOT path.
say "link clang -flto -> $work/lto-check  [default platform linker]"
printf 'int main(void) { return 0; }\n' | "$prefix/llvm/bin/clang" -flto -x c - -o "$work/lto-check" >&2
"$work/lto-check"
say "verify $prefix -> LLVM $version + libgc 8.2.8  [$(du -sk "$prefix" | awk '{ print $1 }') KiB, ${SECONDS}s]"
# Workflow environment is the machine-consumable output.
printf 'LLVM_CONFIG=%s/llvm/bin/llvm-config\nCC=%s/llvm/bin/clang\nCXX=%s/llvm/bin/clang++\nGC_INC=%s/gc/include\nGC_LIB=%s/gc/lib\n' "$prefix" "$prefix" "$prefix" "$prefix" "$prefix"
case "$(uname -s)" in
  Darwin) printf 'GC_DYLIB=%s/gc/lib/libgc.dylib\nDYLD_LIBRARY_PATH=%s/gc/lib:%s/llvm/lib\n' "$prefix" "$prefix" "$prefix" ;;
  Linux) printf 'GC_DYLIB=%s/gc/lib/libgc.so\nLD_LIBRARY_PATH=%s/gc/lib:%s/llvm/lib\n' "$prefix" "$prefix" "$prefix" ;;
esac
