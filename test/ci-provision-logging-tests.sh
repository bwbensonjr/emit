#!/usr/bin/env bash
# Exercise the actual provisioning helper without fetching or building LLVM.
set -euo pipefail
cd "$(dirname "$0")/.."
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
mkdir "$work/forbidden"
for tool in mkdir mktemp git cmake ninja; do ln -s /usr/bin/false "$work/forbidden/$tool"; done
for pair in 19:19.1.7 20:20.1.8 21:21.1.0 22:22.1.0 23:23.1.0; do
  major=${pair%%:*}
  version=${pair#*:}
  identity=$(PATH="$work/forbidden:$PATH" TMPDIR="$work/no-such-directory" \
    tools/ci-provision.sh --identity "$major" 2> "$work/identity.err")
  [ ! -s "$work/identity.err" ]
  printf '%s\n' "$identity" | grep -Eq "^${version//./\\.}-[0-9a-f]{40}-[0-9a-f]{40}-recipe-4$"
done
[ ! -e "$work/no-such-directory" ]
if tools/ci-provision.sh --identity 24 > "$work/invalid.out" 2> "$work/invalid.err"; then
  printf 'test: unsupported provisioning identity accepted\n' >&2; exit 1
fi
[ ! -s "$work/invalid.out" ]
grep -Eq '^components="([^"]*;)?clang-cpp(;[^"]*)?"$' tools/ci-provision.sh
grep -F -- '-DCLANG_LINK_CLANG_DYLIB=ON' tools/ci-provision.sh >/dev/null
eval "$(awk '/^log_count=0$/ { capture=1 } capture && /^if \[ -f/ { exit } capture { print }' tools/ci-provision.sh)"
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
printf 'test provisioning -> metadata, closure, SDK, and logging checks  [16 checks]\n' >&2
