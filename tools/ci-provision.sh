#!/usr/bin/env bash
# One commit-pinned recipe on both platforms; cache the resulting installation.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
usage() { printf 'Usage: tools/ci-provision.sh LLVM_MAJOR INSTALL_DIRECTORY\n       tools/ci-provision.sh --identity LLVM_MAJOR\n'; }
if [ "${1:-}" = --help ]; then usage; exit 0; fi
if [ "$#" != 2 ]; then usage >&2; exit 2; fi
identity_only=0
if [ "$1" = --identity ]; then
  identity_only=1
  major=$2
else
  major=$1
  prefix=$2
fi
case "$major" in
  19) version=19.1.7; revision=cd708029e0b2869e80abe31ddb175f7c35361f90 ;;
  20) version=20.1.8; revision=87f0227cb60147a26a1eeb4fb06e3b505e9c7261 ;;
  21) version=21.1.0; revision=3623fe661ae35c6c80ac221f14d85be76aa870f1 ;;
  22) version=22.1.0; revision=4434dabb69916856b824f68a64b029c67175e532 ;;
  23) version=23.1.0; revision=ea7d852a70e8bdfaf601d6626a760f9771b2c4b4 ;;
  *) printf 'ci: unsupported matrix major: %s\n' "$major" >&2; exit 2 ;;
esac
gc_revision=ee59af3722e56de8404de6cd0c21c2493cc4d855
identity="$version $revision $gc_revision recipe-3"
if [ "$identity_only" = 1 ]; then
  printf '%s\n' "${identity// /-}"
  exit 0
fi
projects=clang
components="clang;clang-resource-headers;llvm-config;LLVM;llvm-headers"
default_linker=""
case "$(uname -s)" in
  Linux)
    projects="clang;lld"
    components="$components;lld"
    default_linker=lld
    ;;
  Darwin)
    # Clang passes its adjacent libLTO.dylib to the SDK linker for -flto.
    components="$components;LTO"
    ;;
esac
mkdir -p "$prefix"
prefix=$(cd "$prefix" && pwd -P)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
log_count=0
run_logged() {
  local action=$1 started=$SECONDS status=0 log
  shift
  log_count=$((log_count + 1))
  log="$work/stage-$log_count.log"
  say "$action"
  "$@" > "$log" 2>&1 || status=$?
  if [ "$status" -ne 0 ]; then
    printf 'ci: %s failed  [exit %s, %ss]\n' "$action" "$status" "$((SECONDS - started))" >&2
    cat "$log" >&2
    return "$status"
  fi
  if [ "${EMIT_LEVEL:-1}" -ge 2 ]; then cat "$log" >&2; fi
  say "$action  [$((SECONDS - started))s, $(wc -l < "$log" | tr -d ' ') log lines]"
}
probe_version() {
  local tool=$1 pattern=$2 reported
  reported=$("$tool" --version) || return
  printf '%s\n' "$reported"
  printf '%s\n' "$reported" | head -n 1 | grep -Eq "$pattern"
}
select_darwin_sdk() {
  if [ -z "${SDKROOT:-}" ]; then
    SDKROOT=$(xcrun --sdk macosx --show-sdk-path) || return
  fi
  case "$SDKROOT" in
    /*) ;;
    *) printf 'ci: SDKROOT must be an absolute SDK path: %s\n' "$SDKROOT" >&2; return 1 ;;
  esac
  if [ ! -d "$SDKROOT/usr/include" ] || [ ! -d "$SDKROOT/usr/lib" ]; then
    printf 'ci: SDKROOT lacks native headers or libraries: %s\n' "$SDKROOT" >&2
    return 1
  fi
  export SDKROOT
}
if [ -f "$prefix/complete" ]; then
  [ "$(< "$prefix/complete")" = "$identity" ] || { printf 'ci: cached dependency identity differs\n' >&2; exit 1; }
  say "reuse LLVM $version + libgc 8.2.8 -> $prefix"
else
  fetch() {
    local repository=$1 revision=$2 destination=$3
    git init -q "$destination" || return
    git -C "$destination" fetch --depth=1 "https://github.com/$repository.git" "$revision" || return
    git -C "$destination" checkout -q --detach FETCH_HEAD || return
    [ "$(git -C "$destination" rev-parse HEAD)" = "$revision" ]
  }
  run_logged "fetch llvm/llvm-project@$revision -> $work/llvm" fetch llvm/llvm-project "$revision" "$work/llvm"
  run_logged "configure LLVM $version -> $work/llvm-build" cmake -S "$work/llvm/llvm" -B "$work/llvm-build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$prefix/llvm" \
    -DCMAKE_INSTALL_LIBDIR=lib -DLLVM_LIBDIR_SUFFIX= \
    -DLLVM_ENABLE_PROJECTS="$projects" -DLLVM_TARGETS_TO_BUILD=Native \
    -DLLVM_DISTRIBUTION_COMPONENTS="$components" -DCLANG_DEFAULT_LINKER="$default_linker" \
    -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_BENCHMARKS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_ENABLE_ASSERTIONS=OFF \
    -DCLANG_ENABLE_STATIC_ANALYZER=OFF -DCLANG_ENABLE_ARCMT=OFF \
    -DLLVM_ENABLE_TERMINFO=OFF -DLLVM_ENABLE_ZLIB=OFF -DLLVM_ENABLE_ZSTD=OFF \
    -DLLVM_PARALLEL_LINK_JOBS=1
  run_logged "build LLVM $version -> $work/llvm-build" cmake --build "$work/llvm-build" --target distribution --parallel "${EMIT_CI_JOBS:-2}"
  run_logged "install LLVM $version -> $prefix/llvm" cmake --build "$work/llvm-build" --target install-distribution
  run_logged "fetch bdwgc/bdwgc@$gc_revision -> $work/gc" fetch bdwgc/bdwgc "$gc_revision" "$work/gc"
  run_logged "configure libgc 8.2.8 -> $work/gc-build" cmake -S "$work/gc" -B "$work/gc-build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$prefix/gc" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON -Denable_docs=OFF -Denable_tests=OFF
  run_logged "build libgc 8.2.8 -> $work/gc-build" cmake --build "$work/gc-build" --parallel "${EMIT_CI_JOBS:-2}"
  run_logged "install libgc 8.2.8 -> $prefix/gc" cmake --install "$work/gc-build"
  printf '%s\n' "$identity" > "$prefix/complete"
fi
if [ "$(uname -s)" = Darwin ]; then
  run_logged "select macOS SDK -> compiler environment" select_darwin_sdk
  say "select macOS SDK -> $SDKROOT  [headers and libraries available]"
fi
run_logged "verify $prefix/llvm/bin/llvm-config -> LLVM $version" probe_version "$prefix/llvm/bin/llvm-config" "^${version//./\\.}$"
for compiler in clang clang++; do
  run_logged "verify $prefix/llvm/bin/$compiler -> LLVM $major" probe_version "$prefix/llvm/bin/$compiler" "version $major[.]"
done
case "$(uname -s)" in
  Linux)
    [ -x "$prefix/llvm/bin/ld.lld" ]
    run_logged "verify $prefix/llvm/bin/ld.lld -> LLD $major" probe_version "$prefix/llvm/bin/ld.lld" "LLD $major[.]"
    ;;
  Darwin) [ -f "$prefix/llvm/lib/libLTO.dylib" ] ;;
esac
# Exercise the same implicit linker selection used by Emit's -flto AOT path.
run_logged "link clang -flto -> $work/lto-check  [default platform linker]" "$prefix/llvm/bin/clang" -flto -x c - -o "$work/lto-check" <<< 'int main(void) { return 0; }'
run_logged "run $work/lto-check -> LTO verification" "$work/lto-check"
say "verify $prefix -> LLVM $version + libgc 8.2.8  [$(du -sk "$prefix" | awk '{ print $1 }') KiB, ${SECONDS}s]"
# Workflow environment is the machine-consumable output.
printf 'LLVM_CONFIG=%s/llvm/bin/llvm-config\nCC=%s/llvm/bin/clang\nCXX=%s/llvm/bin/clang++\nGC_INC=%s/gc/include\nGC_LIB=%s/gc/lib\n' "$prefix" "$prefix" "$prefix" "$prefix" "$prefix"
case "$(uname -s)" in
  Darwin) printf 'GC_DYLIB=%s/gc/lib/libgc.dylib\nDYLD_LIBRARY_PATH=%s/gc/lib:%s/llvm/lib\nSDKROOT=%s\n' "$prefix" "$prefix" "$prefix" "$SDKROOT" ;;
  Linux) printf 'GC_DYLIB=%s/gc/lib/libgc.so\nLD_LIBRARY_PATH=%s/gc/lib:%s/llvm/lib\n' "$prefix" "$prefix" "$prefix" ;;
esac
