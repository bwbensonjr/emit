#!/usr/bin/env bash
# offline-run.sh -- run one command with network access denied and chosen directories hidden
# (change: low-cost-distribution-channels, design D3).  Shared by the source-archive validation
# (tools/ci-archive.sh) and the channel acceptance jobs, so there is one isolation recipe.
#
#   Linux   sudo + unshare --mount --net: no network interfaces but loopback, and each --hide
#           directory is covered by an empty bind mount.  Needs passwordless sudo.  sudo drops
#           the environment, so the toolchain variables below are carried across explicitly
#           (PATH and HOME are not: root keeps sudo's secure_path and its own home, so it can
#           never leave root-owned caches in the invoking user's home).
#           The command runs as root inside the namespace, as the archive build always has.
#   macOS   sandbox-exec: network denied and each --hide subtree unreadable, for the complete
#           subprocess tree (make, clang, emit).
#
# Before the command runs, a connectivity probe must FAIL inside the same isolation; a sandbox
# that still reaches the network is an error, never a silent pass.
set -euo pipefail
. "$(dirname "$0")/log.sh"
usage() { printf 'Usage: tools/offline-run.sh [--hide DIR]... -- COMMAND [ARG]...\n'; }
hides=()
while [ "$#" -gt 0 ]; do
  case "$1" in
    --hide) hides+=("$(cd "${2:?}" && pwd -P)"); shift 2 ;;
    --help) usage; exit 0 ;;
    --) shift; break ;;
    *) usage >&2; exit 2 ;;
  esac
done
[ "$#" -gt 0 ] || { usage >&2; exit 2; }

# Runs inside the isolation: prove the network is gone, then become the command.
probe='if command -v curl >/dev/null 2>&1 && curl --connect-timeout 3 --max-time 5 -fsS https://github.com >/dev/null 2>&1; then
  printf "offline-run: network isolation did not deny access\n" >&2; exit 1
fi'

# ${hides[@]+...}: an empty array is unbound under `set -u` in macOS's bash 3.2.
hidden=${hides[@]+${#hides[@]}}
hidden=${hidden:-0}
say "isolate ${*} -> offline  [$hidden hidden director$( [ "$hidden" = 1 ] && echo y || echo ies)]"
case "$(uname -s)" in
  Linux)
    empty=$(mktemp -d)
    carried=()
    for name in LLVM_CONFIG EMIT_LLVM_BIN CC CXX GC_INC GC_LIB GC_DYLIB LD_LIBRARY_PATH EMIT_VERBOSITY \
                EMIT_CACHE EMIT_ACCEPT_REPORT; do
      [ -n "${!name+set}" ] && carried+=("$name=${!name}")
    done
    exec sudo /usr/bin/env ${carried[@]+"${carried[@]}"} unshare --mount --net -- /bin/bash -c '
      set -e
      mount --make-rprivate /
      empty=$1; shift
      count=$1; shift
      for _ in $(seq 1 "$count"); do mount --bind "$empty" "$1"; shift; done
      eval "$1"; shift
      exec "$@"' offline "$empty" "$hidden" ${hides[@]+"${hides[@]}"} "$probe" "$@"
    ;;
  Darwin)
    profile='(version 1) (allow default) (deny network*)'
    for dir in ${hides[@]+"${hides[@]}"}; do profile+=" (deny file-read* (subpath \"$dir\"))"; done
    exec sandbox-exec -p "$profile" /bin/bash -c "$probe"'
exec "$@"' offline "$@"
    ;;
  *) printf 'offline-run: no network isolation recipe for this platform\n' >&2; exit 1 ;;
esac
