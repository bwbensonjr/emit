#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
if [ "${1:-}" = --help ]; then printf 'Usage: tools/ci-check.sh LLVM_MAJOR\n'; exit 0; fi
if [ "$#" != 1 ]; then printf 'Usage: tools/ci-check.sh LLVM_MAJOR\n' >&2; exit 2; fi
major=$1
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
./run-all-tests.sh
[ "$before" = "$(shasum -a 256 bootstrap/*.ll)" ]
say "check LLVM $major -> compatibility complete  [${SECONDS}s]"
