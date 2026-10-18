#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
if [ "${1:-}" = --help ]; then printf 'Usage: tools/ci-check.sh LLVM_MAJOR [full|compat]\n'; exit 0; fi
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then printf 'Usage: tools/ci-check.sh LLVM_MAJOR [full|compat]\n' >&2; exit 2; fi
major=$1
profile=${2:-full}
case "$profile" in full|compat) ;; *) printf 'ci: unknown native profile: %s\n' "$profile" >&2; exit 2 ;; esac
if command -v chez >/dev/null 2>&1; then printf 'ci: Chez must be unavailable\n' >&2; exit 1; fi
[ "$("$LLVM_CONFIG" --version | cut -d. -f1)" = "$major" ]
for compiler in "$CC" "$CXX"; do
  "$compiler" --version >&2
  "$compiler" --version | head -n1 | grep -Eq "version $major[.]"
done
before=$(shasum -a 256 bootstrap/*.ll)
say "build committed bootstrap IR -> build/emit  [LLVM $major]"
make -j2
say "test build/emit -> native compatibility suites"
tools/test.sh "$profile" --jobs "${EMIT_TEST_JOBS:-2}" --report "${RUNNER_TEMP:-/tmp}/emit-native-$major.json"
[ "$before" = "$(shasum -a 256 bootstrap/*.ll)" ]
say "check LLVM $major -> compatibility complete  [${SECONDS}s]"
