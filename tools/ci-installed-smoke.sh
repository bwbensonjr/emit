#!/usr/bin/env bash
# ci-installed-smoke.sh -- installed command checks for a staged source-release prefix.
#
# A thin caller of tools/channel-accept.sh (change: low-cost-distribution-channels, design D3),
# so source-release validation and channel validation run the same checks.  The prefix is made
# read-only for the duration: an installed Emit must compile and run without writing beside its
# payload.  EMIT_ACCEPT_REPORT names a report path to keep; otherwise it is discarded.
set -euo pipefail
source_root=$(cd "$(dirname "$0")/.." && pwd -P)
. "$source_root/tools/log.sh"
if [ "${1:-}" = --help ]; then printf 'Usage: tools/ci-installed-smoke.sh INSTALLED_PREFIX\n'; exit 0; fi
if [ "$#" != 1 ]; then printf 'Usage: tools/ci-installed-smoke.sh INSTALLED_PREFIX\n' >&2; exit 2; fi
prefix=$(cd "$1" && pwd -P)
work=$(mktemp -d)
restore() { chmod -R u+w "$prefix"; rm -rf "$work"; }
trap restore EXIT
version=$(< "$source_root/VERSION")
say "stage $prefix -> read-only installed command checks"
chmod -R a-w "$prefix"
"$source_root/tools/channel-accept.sh" --emit "$prefix/bin/emit" --expect-version "$version" \
  --report "${EMIT_ACCEPT_REPORT:-$work/report.json}" --label "staged $prefix" --workspace "$work/accept"
say "test $prefix/bin/emit -> installed commands  [${SECONDS}s]"
