#!/usr/bin/env bash
# DEFAULT test runner -- Chez-FREE (change: self-hosting-completion, design D5).
#
# This suite answers "do the SHIPPED binaries work?".  Every suite here exercises
# a binary linked from the committed IR with LLVM only (no Chez): the demos run
# through `emit run` (compile+run in one process), the interactive REPL runs
# through `emit repl`.  Both are verbs of the single build/emit binary; no Chez
# process is invoked.
#
# The Chez-bound suites -- "does the source still build correctly and reproduce
# the committed binaries?" (backend equivalence, self-emission/fixed-point,
# IL-level unit tests, the anti-stale trust-check) -- live in ./run-dev-tests.sh,
# which auto-skips when `chez` is absent.
#
# Needs an LLVM discoverable via llvm-config (see tools/llvm-env.sh) and libgc.
# Run from anywhere: ./run-all-tests.sh
set -u
cd "$(dirname "$0")"
. tools/log.sh   # EMIT_LEVEL for quiet-aware banners (see docs/OUTPUT.md)

# The per-suite banner is part of this runner's report (stdout), suppressed at quiet.
banner () {
  [ "${EMIT_LEVEL:-1}" -ge 1 ] || return 0
  echo
  echo "================================================================"
  echo "== $1"
  echo "================================================================"
}

run_suite () {
  local name="$1"; shift
  local start=$SECONDS
  banner "$name"
  if "$@"; then
    SUMMARY+=("  [PASS] $name ($((SECONDS - start))s)")
  else
    SUMMARY+=("  [FAIL] $name ($((SECONDS - start))s)")
    failed=$((failed+1))
  fi
}

SUMMARY=()
failed=0
total_start=$SECONDS

# Build the shipped binaries from committed IR (LLVM only; no Chez).
if ! make all >/dev/null 2>&1; then
  echo "fatal: 'make all' failed (could not link the shipped binaries)"; exit 1
fi

run_suite "demo values (emit run)"    env RUNNER=emit-run demos/run-tests.sh
run_suite "module-scaffold byte-identity" test/module-scaffold-baseline.sh check
run_suite "artifact cache (baked set)"  test/artifact-cache-tests.sh
run_suite "REPL persistent host"      test/repl-host-tests.sh
run_suite "define-record-type syntax" test/record-type-syntax-tests.sh
run_suite "inline arith + self-call IR" test/inline-arith-self-call-tests.sh
run_suite "fixnum overflow traps"     test/fixnum-overflow-tests.sh
run_suite "indexed access bounds"     test/indexed-access-tests.sh
run_suite "R7RS numeric conformance" test/numeric-conformance-tests.sh
# The vendored R7RS suite has two halves with different jobs, and only one of them
# belongs on every system change:
#
#   sections          runs the ~790 forms that already work -- a REGRESSION gate, and
#                     cheap, so it stays in the default run
#   stale exclusions  re-runs all 389 excluded forms to see whether any now passes --
#                     CONFORMANCE BOOKKEEPING, one `emit run` per form, and only
#                     meaningful while someone is deliberately closing a gap
#
# The second is opt-in: `EMIT_R7RS=1 ./run-all-tests.sh`, or run
# `test/r7rs-suite-tests.sh` directly. The trade-off is stated rather than hidden: with
# it gated, closing a conformance gap no longer announces itself here, so a compliance
# pass has to be run deliberately (which is the point).
if [ "${EMIT_R7RS:-0}" = 1 ]; then
  run_suite "R7RS-small suite (vendored, + stale exclusions)" test/r7rs-suite-tests.sh
else
  run_suite "R7RS-small suite (vendored, sections only)" \
            test/r7rs-suite-tests.sh --sections-only
fi
run_suite "cross-unit direct calls"   test/cross-unit-direct-call-tests.sh
run_suite "library top-level set!"    test/library-toplevel-set-tests.sh
run_suite "library body declarations" test/library-body-declarations-tests.sh
run_suite "library include declarations" test/library-include-tests.sh
run_suite "dynamic extent (call/cc)"  test/dynamic-extent-tests.sh
run_suite "Pitch-facing R7RS prerequisites" test/pitch-prerequisites-tests.sh
run_suite "catchable errors + kinds"  test/catchable-errors-tests.sh
run_suite "io ports + eof object"     test/io-ports-tests.sh
run_suite "module vertical-slice (REPL)" test/modules-repl-tests.sh
run_suite "module run door (emit run)" test/modules-run-tests.sh
run_suite "emit build + program resolver" test/emit-build-tests.sh
run_suite "unit pipeline (seeding, caching, shaking)" test/unit-pipeline-tests.sh
run_suite "CLI front door (help + final value)" test/emit-cli-tests.sh
run_suite "JIT optimization profiles" test/jit-optimization-tests.sh
run_suite "(scheme base) declared surface" test/scheme-base-surface-check.sh
run_suite "Unicode data checksums + generated tables" test/unicode-data-gen-check.sh
run_suite "flat top-level name hazards" test/flat-name-check.sh
run_suite "binding shadows a keyword"   test/binding-shadowing-tests.sh
run_suite "(scheme base) auto-import (REPL)" test/prelude-base-repl-tests.sh
run_suite "(scheme base) re-home (emit run/build)" test/prelude-base-run-tests.sh
run_suite "R7RS library partition"      test/library-partition-tests.sh
run_suite "--dump stages (all doors)"   test/dump-stages-tests.sh
run_suite "installed layout (libraries + support files)" test/install-layout-tests.sh
run_suite "reader datum parity (vector consts + rendering)" test/reader-datum-parity-tests.sh
run_suite "cyclic datum read/compare/write round trip" test/cyclic-datum-tests.sh
run_suite "printer cycles + char names + trap delivery" test/printer-cycles-tests.sh
run_suite "every door in a user project"      test/project-door-tests.sh

echo
echo "================================================================"
echo "== summary (Chez-free default suite)"
echo "================================================================"
printf '%s\n' "${SUMMARY[@]}"
echo
echo "${#SUMMARY[@]} suite(s), $failed failed, $((SECONDS - total_start))s total"
if [ "$failed" -eq 0 ]; then
  echo "all suites passed"
  echo "(run ./run-dev-tests.sh for the Chez-gated backend/self-host/trust-check suites)"
else
  echo "$failed suite(s) failed"
fi
[ "$failed" -eq 0 ]
