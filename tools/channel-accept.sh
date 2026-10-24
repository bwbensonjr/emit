#!/usr/bin/env bash
# channel-accept.sh -- installed acceptance for one distribution channel candidate
# (change: low-cost-distribution-channels, design D3).
#
# Drives an INSTALLED emit command from a fresh workspace, never the checkout: version identity,
# doctor, JIT run, a persistent REPL session, shipped SRFIs, shipped libraries outside the baked
# set, a macro-exporting user library compiled with `emit lib` and imported under run and build,
# and AOT executables.  The payload's shared library cache must have been prepared by the installed
# binary, and must serve every portable standard-library entry to an empty private user cache
# (change: prebuilt-shared-stdlib-cache); native counts are not asserted, since a re-tested image
# may run on a CPU other than its build host's.  Every check runs even after a failure, and the
# installed share/emit payload must be byte-identical afterwards.  The JSON report records the identity, platform, toolchain,
# each check's outcome, and the overall result; a check without a recorded pass is a failure.
#
# The script runs where emit runs: on the host for Homebrew, Nix, and source archives, and inside
# the container for the OCI image (mount this repository's tools/ and test/channel-accept/
# read-only, preserving their relative layout).  Network denial and a read-only payload are the
# caller's job (tools/offline-run.sh, chmod, `docker run --network none --read-only`).
#
# Needs only bash and POSIX utilities: the image it accepts carries no Python.
set -u
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/log.sh"

usage() {
  printf '%s\n' \
    'Usage: tools/channel-accept.sh --emit PATH --expect-version V --report FILE' \
    '         [--source-digest SHA256] [--label NAME] [--workspace DIR]'
}
emit="" expect="" report="" digest="" label="" workspace=""
while [ "$#" -gt 0 ]; do
  case "$1" in
    --emit) emit=${2:-}; shift 2 ;;
    --expect-version) expect=${2:-}; shift 2 ;;
    --report) report=${2:-}; shift 2 ;;
    --source-digest) digest=${2:-}; shift 2 ;;
    --label) label=${2:-}; shift 2 ;;
    --workspace) workspace=${2:-}; shift 2 ;;
    --help) usage; exit 0 ;;
    *) usage >&2; exit 2 ;;
  esac
done
[ -n "$emit" ] && [ -n "$expect" ] && [ -n "$report" ] || { usage >&2; exit 2; }
fixtures="$script_dir/../test/channel-accept"
[ -d "$fixtures" ] || { say "channel-accept: fixtures missing: $fixtures" >&2; exit 2; }

# The installed command and its payload, resolved through any launcher symlink chain (Homebrew's
# bin/emit links into the Cellar); `readlink -f` is unavailable on older macOS.
command_path=$(command -v "$emit" 2>/dev/null) || { say "channel-accept: no command $emit" >&2; exit 2; }
real=$command_path
while [ -L "$real" ]; do
  link=$(readlink "$real")
  case "$link" in /*) real=$link ;; *) real=$(dirname "$real")/$link ;; esac
done
real="$(CDPATH= cd -- "$(dirname -- "$real")" && pwd -P)/$(basename "$real")"
payload="$(dirname "$(dirname "$real")")/share/emit"

if [ -z "$workspace" ]; then
  workspace=$(mktemp -d)
  trap 'rm -rf "$workspace"' EXIT
fi
mkdir -p "$workspace"
workspace=$(CDPATH= cd -- "$workspace" && pwd -P)
cp -R "$fixtures/." "$workspace/"
cd "$workspace" || exit 2
unset EMIT_MANIFEST EMIT_LIBRARY_PATH EMIT_LIB_PATH EMIT_NO_INSTALLED_ROOT EMIT_NO_MANIFEST_CHAIN
export EMIT_CACHE="$workspace/.emit-cache" EMIT_VERBOSITY=quiet
say "accept ${label:-$command_path} -> $report  [emit $expect, workspace $workspace]"

# One stable digest of every installed payload file, before and after the checks.
sha_tool() { if command -v sha256sum >/dev/null 2>&1; then sha256sum "$@"; else shasum -a 256 "$@"; fi; }
payload_digest() {
  [ -d "$payload" ] || { printf 'missing\n'; return; }
  (cd "$payload" && find . -type f | LC_ALL=C sort | while IFS= read -r f; do sha_tool "$f"; done) \
    | sha_tool | cut -d' ' -f1
}
payload_before=$(payload_digest)

ids=() outcomes=() seconds=() failures=0
check() {
  local id=$1 started=$SECONDS outcome=passed
  shift
  if ! "$@" >"$workspace/$id.out" 2>"$workspace/$id.err"; then
    outcome=failed
    failures=$((failures + 1))
    say "accept check $id failed" >&2
    sed 's/^/  | /' "$workspace/$id.out" "$workspace/$id.err" >&2
  fi
  ids+=("$id") outcomes+=("$outcome") seconds+=($((SECONDS - started)))
}
expect_42() { [ "$("$@")" = 42 ]; }
version_matches() {
  local line
  line=$("$emit" --version) || return 1
  printf '%s\n' "$line"
  case "$line" in "emit $expect (LLVM "*")") ;; *) return 1 ;; esac
}
repl_session() {
  "$emit" repl < repl.in > repl.transcript || return 1
  grep -Eq '(^|[[:space:]])42[[:space:]]*$' repl.transcript
}
build_and_exec() { "$emit" build "$1" -o "$2" && expect_42 "./$2"; }
macro_library() {
  "$emit" lib lib/accept/macros.sld --manifest emit-libs.scm -o artifacts \
    && [ -s artifacts/accept.macros.ll ] && [ -s artifacts/accept.macros.exports ]
}
payload_unchanged() { [ "$(payload_digest)" = "$payload_before" ]; }
shared_cache_matches() {
  "$emit" doctor | grep -E '^shared cache: .* entries, matches this executable\]$'
}
# Before any other check fills the private cache, so every reuse must come from the shared tier.
shared_cache_serves() {
  local line
  line=$(EMIT_VERBOSITY=normal "$emit" build --stdlib 2>&1 >/dev/null) || return 1
  printf '%s\n' "$line"
  printf '%s\n' "$line" | grep -q 'portable \([0-9][0-9]*\) reused/0 generated (\1 shared)'
}

check version version_matches
check doctor "$emit" doctor
check shared-cache-matches shared_cache_matches
check shared-cache-serves shared_cache_serves
check jit-run expect_42 "$emit" run smoke.scm
check repl-persistent-state repl_session
check srfi-1-64 expect_42 "$emit" run srfi.scm
check shipped-libraries expect_42 "$emit" run shipped.scm
check macro-library-lib macro_library
check macro-library-run expect_42 "$emit" run macros.scm
check aot-build build_and_exec smoke.scm smoke.exe
check aot-macro-library build_and_exec macros.scm macros.exe
check payload-unchanged payload_unchanged

# --- report ---------------------------------------------------------------------------------
json_string() {
  local s=$1
  s=${s//\\/\\\\}; s=${s//\"/\\\"}; s=${s//$'\t'/\\t}; s=${s//$'\r'/}
  printf '"%s"' "$s"
}
doctor_field() { sed -n "s/^$1: //p" "$workspace/doctor.out" | head -n1; }
expected_checks=13
result=passed
[ "$failures" -eq 0 ] && [ "${#ids[@]}" -eq "$expected_checks" ] || result=failed
mkdir -p "$(dirname "$report")"
{
  printf '{\n  "schema": 1,\n'
  printf '  "label": %s,\n' "$(json_string "$label")"
  printf '  "expected_version": %s,\n' "$(json_string "$expect")"
  printf '  "source_digest": %s,\n' "$(json_string "$digest")"
  printf '  "command": %s,\n' "$(json_string "$command_path")"
  printf '  "payload": %s,\n' "$(json_string "$payload")"
  printf '  "platform": %s,\n' "$(json_string "$(uname -s) $(uname -m)")"
  printf '  "emit_version": %s,\n' "$(json_string "$(head -n1 "$workspace/version.out")")"
  printf '  "toolchain": {"selection": %s, "pin": %s, "cc": %s, "cc_version": %s, "libgc_version": %s},\n' \
    "$(json_string "$(doctor_field toolchain)")" "$(json_string "$(doctor_field 'toolchain pin')")" \
    "$(json_string "$(doctor_field cc)")" "$(json_string "$(doctor_field 'cc version')")" \
    "$(json_string "$(doctor_field 'libgc version')")"
  printf '  "checks": ['
  for i in "${!ids[@]}"; do
    [ "$i" -gt 0 ] && printf ','
    printf '\n    {"id": %s, "outcome": %s, "seconds": %s}' \
      "$(json_string "${ids[$i]}")" "$(json_string "${outcomes[$i]}")" "${seconds[$i]}"
  done
  printf '\n  ],\n  "result": %s\n}\n' "$(json_string "$result")"
} > "$report"

say "accept ${label:-$command_path} -> $result  [${#ids[@]} checks, $failures failed, ${SECONDS}s]"
[ "$result" = passed ]
