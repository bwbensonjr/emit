#!/usr/bin/env bash
set -euo pipefail
source_root=$(cd "$(dirname "$0")/.." && pwd -P)
. "$source_root/tools/log.sh"
if [ "${1:-}" = --help ]; then printf 'Usage: tools/ci-installed-smoke.sh INSTALLED_PREFIX\n'; exit 0; fi
if [ "$#" != 1 ]; then printf 'Usage: tools/ci-installed-smoke.sh INSTALLED_PREFIX\n' >&2; exit 2; fi
prefix=$(cd "$1" && pwd -P)
emit="$prefix/bin/emit"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
say "stage $prefix -> $work installed command checks"
cp "$source_root/test/release-smoke.scm" "$work/smoke.scm"
cp "$source_root/test/release-smoke.sld" "$work/smoke.sld"
version=$(< "$source_root/VERSION")
cd "$work"
unset EMIT_MANIFEST EMIT_LIBRARY_PATH EMIT_LIB_PATH EMIT_NO_INSTALLED_ROOT EMIT_NO_MANIFEST_CHAIN
version_pattern=$(printf '%s\n' "$version" | sed 's/[.+]/\\&/g')
"$emit" --version | grep -Eq "^emit $version_pattern [(]LLVM [^)]+[)]$"
"$emit" doctor
[ "$("$emit" run smoke.scm)" = 42 ]
printf '(import (scheme inexact))\n(+ 19 23)\n' | "$emit" repl > repl.out
grep -Eq '(^|[[:space:]])42[[:space:]]*$' repl.out
"$emit" lib smoke.sld -o artifacts
[ -s artifacts/release-smoke.ll ]
"$emit" build smoke.scm -o smoke
[ "$(./smoke)" = 42 ]
say "test $emit -> installed commands  [5 commands, ${SECONDS}s]"
