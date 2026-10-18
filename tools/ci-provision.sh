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
  22) version=22.1.0; revision=4434dabb69916856b824f68a64b029c67175e532 ;;
  23) version=23.1.0; revision=ea7d852a70e8bdfaf601d6626a760f9771b2c4b4 ;;
  *) printf 'ci: unsupported matrix major: %s\n' "$major" >&2; exit 2 ;;
esac
gc_revision=ee59af3722e56de8404de6cd0c21c2493cc4d855
identity="$version $revision $gc_revision recipe-5"
if [ "$identity_only" = 1 ]; then
  printf '%s\n' "${identity// /-}"
  exit 0
fi
projects=clang
components="clang;clang-cpp;clang-resource-headers;llvm-config;LLVM;llvm-headers"
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
validate_cached_identity() {
  if [ "$1" != "$identity" ]; then
    printf 'ci: cached dependency identity differs\n' >&2
    return 1
  fi
}
select_llvm_shared_library() {
  llvm_shared_name=$("$prefix/llvm/bin/llvm-config" --libnames --link-shared) || return
  case "$llvm_shared_name" in
    ""|*[!0-9A-Za-z._-]*) printf 'ci: unsafe LLVM shared library name: %s\n' "$llvm_shared_name" >&2; return 1 ;;
  esac
  case "$llvm_shared_name" in
    libLLVM*.dylib|libLLVM*.so*) ;;
    *) printf 'ci: unexpected LLVM shared library name: %s\n' "$llvm_shared_name" >&2; return 1 ;;
  esac
  [ -f "$prefix/llvm/lib/$llvm_shared_name" ]
}
dylib_id() {
  local report
  report=$(otool -D "$1") || return
  case "$report" in
    *$'\n'*) printf '%s\n' "${report#*$'\n'}" ;;
    *) printf 'ci: no dylib ID: %s\n' "$1" >&2; return 1 ;;
  esac
}
canonical_private_library() {
  local candidate=$1 directory target canonical_prefix count=0
  canonical_prefix=$(cd "$prefix" && pwd -P) || return
  [ "$canonical_prefix" != / ] || return 1
  while :; do
    directory=$(cd "$(dirname "$candidate")" && pwd -P) || return
    candidate="$directory/$(basename "$candidate")"
    [ -L "$candidate" ] || break
    count=$((count + 1))
    [ "$count" -le 40 ] || { printf 'ci: excessive dylib symlinks: %s\n' "$1" >&2; return 1; }
    target=$(readlink "$candidate") || return
    case "$target" in
      /*) candidate=$target ;;
      *) candidate="$directory/$target" ;;
    esac
  done
  case "$candidate" in
    "$canonical_prefix/"*) ;;
    *) printf 'ci: dylib target escapes private prefix: %s\n' "$candidate" >&2; return 1 ;;
  esac
  [ -f "$candidate" ] || { printf 'ci: dylib target is not a regular file: %s\n' "$candidate" >&2; return 1; }
  private_library_target=$candidate
}
normalize_dylib_id() {
  local library=$1 expected=$2 current target
  canonical_private_library "$library" || return
  target=$private_library_target
  canonical_private_library "$expected" || return
  [ "$private_library_target" = "$target" ] || return 1
  current=$(dylib_id "$target") || return
  if [ "$current" != "$expected" ]; then
    install_name_tool -id "$expected" "$target" || return
  fi
  if [ "$current" != "$expected" ] || ! codesign --verify --strict "$target"; then
    codesign --force --sign - "$target" || return
  fi
  [ "$(dylib_id "$target")" = "$expected" ] || return 1
  codesign --verify --strict "$target"
}
normalize_darwin_libraries() {
  local gc_id gc_name
  normalize_dylib_id "$prefix/llvm/lib/$llvm_shared_name" "$prefix/llvm/lib/$llvm_shared_name" || return
  gc_id=$(dylib_id "$prefix/gc/lib/libgc.dylib") || return
  gc_name=${gc_id##*/}
  case "$gc_name" in
    ""|*[!0-9A-Za-z._-]*) printf 'ci: unsafe libgc dylib ID: %s\n' "$gc_id" >&2; return 1 ;;
  esac
  case "$gc_name" in
    libgc.*.dylib) ;;
    *) printf 'ci: unexpected libgc dylib ID: %s\n' "$gc_id" >&2; return 1 ;;
  esac
  case "$gc_id" in
    "@rpath/$gc_name"|"$prefix/gc/lib/$gc_name") ;;
    *) printf 'ci: unexpected libgc dylib location: %s\n' "$gc_id" >&2; return 1 ;;
  esac
  normalize_dylib_id "$prefix/gc/lib/libgc.dylib" "$prefix/gc/lib/$gc_name"
}
run_native_probe() {
  if [ "$(uname -s)" = Darwin ]; then
    /bin/bash -c 'unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH DYLD_FALLBACK_LIBRARY_PATH DYLD_FRAMEWORK_PATH DYLD_FALLBACK_FRAMEWORK_PATH; exec "$1"' probe "$1"
  else
    env "LD_LIBRARY_PATH=$prefix/gc/lib:$prefix/llvm/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
      /bin/bash -c 'unset DYLD_LIBRARY_PATH DYLD_FALLBACK_LIBRARY_PATH; exec "$1"' probe "$1"
  fi
}
if [ -f "$prefix/complete" ]; then
  validate_cached_identity "$(< "$prefix/complete")"
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
    -DCLANG_LINK_CLANG_DYLIB=ON \
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
fi
if [ "$(uname -s)" = Darwin ]; then
  run_logged "select macOS SDK -> compiler environment" select_darwin_sdk
  say "select macOS SDK -> $SDKROOT  [headers and libraries available]"
fi
run_logged "select shared LLVM -> installed library" select_llvm_shared_library
if [ "$(uname -s)" = Darwin ]; then
  run_logged "normalize private LLVM + libgc -> absolute dylib IDs and ad-hoc signatures" normalize_darwin_libraries
fi
run_logged "verify $prefix/llvm/bin/llvm-config -> LLVM $version" probe_version "$prefix/llvm/bin/llvm-config" "^${version//./\\.}$"
for compiler in clang clang++; do
  run_logged "verify $prefix/llvm/bin/$compiler -> LLVM $version" probe_version "$prefix/llvm/bin/$compiler" "version ${version//./\\.}([[:space:]]|$)"
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
run_logged "link clang++ -> $work/cxx-check  [native standard library]" "$prefix/llvm/bin/clang++" -std=c++17 -x c++ - -o "$work/cxx-check" <<< '#include <iostream>
#include <string>
int main() { std::cout << "" << std::flush; return std::string("emit").size() == 4 ? 0 : 1; }'
run_logged "run $work/cxx-check -> C++ verification" "$work/cxx-check"
run_logged "link LLVM C API -> $work/llvm-check" "$prefix/llvm/bin/clang" -I"$prefix/llvm/include" -x c - -x none "$prefix/llvm/lib/$llvm_shared_name" -o "$work/llvm-check" <<< '#include <llvm-c/Core.h>
int main(void) { LLVMContextRef context = LLVMContextCreate(); LLVMContextDispose(context); return 0; }'
run_logged "run $work/llvm-check -> LLVM verification through system Bash without DYLD overrides" run_native_probe "$work/llvm-check"
# Retain the complete native runtime object at link time, so unused functions
# cannot hide missing compiler builtins or native-library dependencies.
run_logged "compile src/runtime/runtime.c -> $work/runtime-check.o" "$prefix/llvm/bin/clang" -std=gnu11 -O2 -DRT_NO_MAIN -I"$prefix/gc/include" -c src/runtime/runtime.c -o "$work/runtime-check.o"
run_logged "link runtime object -> $work/runtime-check  [libgc and LTO]" "$prefix/llvm/bin/clang" -flto "$work/runtime-check.o" -x c - -L"$prefix/gc/lib" -lgc -lm -o "$work/runtime-check" <<< 'int main(void) { return 0; }'
run_logged "run $work/runtime-check -> native runtime verification through system Bash without DYLD overrides" run_native_probe "$work/runtime-check"
run_logged "link libgc headers + shared library -> $work/gc-version-check  [8.2.8]" "$prefix/llvm/bin/clang" -std=c11 -I"$prefix/gc/include" -x c - -L"$prefix/gc/lib" -lgc -o "$work/gc-version-check" <<< '#include <gc/gc.h>
_Static_assert(GC_VERSION_MAJOR == 8 && GC_VERSION_MINOR == 2 && GC_VERSION_MICRO == 8, "libgc headers differ from 8.2.8");
int main(void) { return GC_get_version() == ((8u << 16) | (2u << 8) | 8u) ? 0 : 1; }'
run_logged "run $work/gc-version-check -> exact libgc shared-library version verification" run_native_probe "$work/gc-version-check"
printf '%s\n' "$identity" > "$prefix/complete"
say "verify $prefix -> LLVM $version + libgc 8.2.8  [$(du -sk "$prefix" | awk '{ print $1 }') KiB, ${SECONDS}s]"
# Workflow environment is the machine-consumable output.
printf 'LLVM_CONFIG=%s/llvm/bin/llvm-config\nCC=%s/llvm/bin/clang\nCXX=%s/llvm/bin/clang++\nGC_INC=%s/gc/include\nGC_LIB=%s/gc/lib\n' "$prefix" "$prefix" "$prefix" "$prefix" "$prefix"
case "$(uname -s)" in
  Darwin) printf 'GC_DYLIB=%s/gc/lib/libgc.dylib\nDYLD_LIBRARY_PATH=%s/gc/lib:%s/llvm/lib\nSDKROOT=%s\n' "$prefix" "$prefix" "$prefix" "$SDKROOT" ;;
  Linux) printf 'GC_DYLIB=%s/gc/lib/libgc.so\nLD_LIBRARY_PATH=%s/gc/lib:%s/llvm/lib\n' "$prefix" "$prefix" "$prefix" ;;
esac
