#!/usr/bin/env bash
# Exercise the actual provisioning helper without fetching or building LLVM.
set -euo pipefail
cd "$(dirname "$0")/.."
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
mkdir "$work/forbidden"
for tool in mkdir mktemp git cmake ninja; do ln -s /usr/bin/false "$work/forbidden/$tool"; done
for pair in 22:22.1.0 23:23.1.0; do
  major=${pair%%:*}
  version=${pair#*:}
  identity=$(PATH="$work/forbidden:$PATH" TMPDIR="$work/no-such-directory" \
    tools/ci-provision.sh --identity "$major" 2> "$work/identity.err")
  [ ! -s "$work/identity.err" ]
  printf '%s\n' "$identity" | grep -Eq "^${version//./\\.}-[0-9a-f]{40}-[0-9a-f]{40}-recipe-6$"
done
[ ! -e "$work/no-such-directory" ]
for unsupported in 19 20 21 24; do
  if tools/ci-provision.sh --identity "$unsupported" > "$work/invalid.out" 2> "$work/invalid.err"; then
    printf 'test: unsupported provisioning identity accepted: %s\n' "$unsupported" >&2; exit 1
  fi
  [ ! -s "$work/invalid.out" ]
done
grep -Eq '^components="([^"]*;)?clang-cpp(;[^"]*)?"$' tools/ci-provision.sh
grep -F -- '-DCLANG_LINK_CLANG_DYLIB=ON' tools/ci-provision.sh >/dev/null
for backend in lli llvm-as llvm-link; do
  grep -Eq "^components=\"([^\"]*;)?$backend(;[^\"]*)?\"$" tools/ci-provision.sh
done
eval "$(awk '/^log_count=0$/ { capture=1 } capture && /^if \[ -f/ { exit } capture { print }' tools/ci-provision.sh)"
fixture_compiler() { printf 'clang version %s (fixture)\n' "$fixture_version"; }
fixture_version=23.1.0
probe_version fixture_compiler 'version 23\.1\.0([[:space:]]|$)' > "$work/version.out"
fixture_version=23.1.1
if probe_version fixture_compiler 'version 23\.1\.0([[:space:]]|$)' > "$work/version.out"; then
  printf 'test: wrong clang patch version accepted\n' >&2; exit 1
fi
fixture_llvm() { printf 'LLVM (fixture):\n  LLVM version %s\n  Optimized build.\n' "$fixture_version"; }
fixture_version=23.1.0
version=23.1.0
probe_llvm_version fixture_llvm > "$work/version.out"
fixture_version=23.1.1
if probe_llvm_version fixture_llvm > "$work/version.out"; then
  printf 'test: wrong LLVM utility patch version accepted\n' >&2; exit 1
fi
identity='23.1.0 ea7d852a70e8bdfaf601d6626a760f9771b2c4b4 ee59af3722e56de8404de6cd0c21c2493cc4d855 recipe-6'
previous_identity=${identity%recipe-6}recipe-5
validate_cached_identity "$identity"
if validate_cached_identity "$previous_identity" > "$work/cache.out" 2> "$work/cache.err"; then
  printf 'test: previous recipe identity accepted\n' >&2; exit 1
fi
if validate_cached_identity "${identity%recipe-6}recipe-3" > "$work/cache.out" 2> "$work/cache.err"; then
  printf 'test: unsupported cache recipe accepted\n' >&2; exit 1
fi
if validate_cached_identity "${previous_identity/23.1.0/22.1.0}" > "$work/cache.out" 2> "$work/cache.err"; then
  printf 'test: different pinned cache accepted\n' >&2; exit 1
fi
prefix="$work/private"
mkdir "$prefix"
touch "$prefix/library.dylib" "$work/external.dylib"
mock_id='@rpath/library.dylib'
mock_signed=1
mock_changes=0
otool() { printf '%s:\n%s\n' "$2" "$mock_id"; }
install_name_tool() { [ "$1" = -id ]; mock_id=$2; mock_signed=0; mock_changes=$((mock_changes + 1)); }
codesign() {
  case "$1" in
    --force) mock_signed=1 ;;
    --verify) [ "$mock_signed" = 1 ] ;;
    *) return 2 ;;
  esac
}
normalize_dylib_id "$prefix/library.dylib" "$prefix/library.dylib"
[ "$mock_id" = "$prefix/library.dylib" ] && [ "$mock_signed" = 1 ] && [ "$mock_changes" = 1 ]
normalize_dylib_id "$prefix/library.dylib" "$prefix/library.dylib"
[ "$mock_changes" = 1 ]
mock_signed=0
normalize_dylib_id "$prefix/library.dylib" "$prefix/library.dylib"
[ "$mock_signed" = 1 ] && [ "$mock_changes" = 1 ]
ln -s "$work/external.dylib" "$prefix/escape.dylib"
if normalize_dylib_id "$prefix/escape.dylib" "$prefix/escape.dylib" > "$work/escape.out" 2> "$work/escape.err"; then
  printf 'test: external dylib symlink accepted\n' >&2; exit 1
fi
grep -q 'escapes private prefix' "$work/escape.err"
[ "$mock_changes" = 1 ]
ln -s library.dylib "$prefix/internal.dylib"
canonical_private_library "$prefix/internal.dylib"
[ "$private_library_target" = "$(cd "$prefix" && pwd -P)/library.dylib" ]
unset -f otool install_name_tool codesign
mkdir -p "$work/sdk/usr/include" "$work/sdk/usr/lib"
xcrun() {
  [ "$*" = '--sdk macosx --show-sdk-path' ] || return 2
  printf '%s\n' "$work/sdk"
}
unset SDKROOT
select_darwin_sdk
[ "$SDKROOT" = "$work/sdk" ]
[ "$(bash -c 'printf "%s" "$SDKROOT"')" = "$work/sdk" ]
SDKROOT="$work/sdk"
xcrun() { return 9; }
select_darwin_sdk
SDKROOT="$work/missing-sdk"
if select_darwin_sdk > "$work/sdk.out" 2> "$work/sdk.err"; then
  printf 'test: missing SDK accepted\n' >&2; exit 1
fi
grep -q 'lacks native headers or libraries' "$work/sdk.err"
unset SDKROOT
status=0
select_darwin_sdk > "$work/sdk.out" 2> "$work/sdk.err" || status=$?
[ "$status" = 9 ]
for level in quiet default verbose; do
  EMIT_VERBOSITY=$level
  . tools/log.sh
  run_logged "test fixture -> captured subprocess" bash -c \
    'printf "subprocess stdout\n"; printf "subprocess stderr\n" >&2' \
    > "$work/$level.out" 2> "$work/$level.err"
  [ ! -s "$work/$level.out" ]
  case "$level" in
    quiet) [ ! -s "$work/$level.err" ] ;;
    default)
      grep -q '2 log lines' "$work/$level.err"
      ! grep -q 'subprocess stdout\|subprocess stderr' "$work/$level.err"
      ;;
    verbose)
      grep -q 'subprocess stdout' "$work/$level.err"
      grep -q 'subprocess stderr' "$work/$level.err"
      ;;
  esac
done
EMIT_VERBOSITY=quiet
. tools/log.sh
status=0
run_logged "test fixture -> expected failure" bash -c \
  'printf "failure detail\n"; exit 7' > "$work/failure.out" 2> "$work/failure.err" || status=$?
[ "$status" = 7 ]
[ ! -s "$work/failure.out" ]
grep -q 'failure detail' "$work/failure.err"
grep -q 'exit 7' "$work/failure.err"
printf 'test provisioning -> metadata, backend inventory, exact identity/version, dylib, SDK, and logging checks  [32 checks]\n' >&2
