#!/usr/bin/env bash
# Anti-stale trust-check (change: self-hosting-completion, design D6).
#
# The default build LINKS the committed IR and never auto-regenerates on a source
# change (design D4 deliberately reversed fix-stale-repl-host-rebuild's mtime
# auto-rebuild).  This check restores that guarantee for CI: regenerate the
# committed compiler IR from the CURRENT source (Chez-free, via tools/regen.sh)
# and assert it is byte-identical to what is committed.  A compiler-source change
# that forgot `make regen` -> the committed IR no longer matches source -> FAIL.
#
# Since the compiler is re-homed on the baked library set (change:
# compiler-bootstrap-rehome, partitioned by scheme-base-partition), `make regen`
# re-derives every baked library module AND the three compiler IRs (which auto-import
# (scheme base)) from ONE --emit of the flat source, and this check diffs ALL of
# bootstrap/ -- so the libraries are re-derived and compared too, not trusted blindly.
#
# Note a partition CHANGE needs two `make regen` passes, because the first is driven by a
# seed compiler carrying the old declaration (see tools/regen.sh).  This check runs a
# single pass, which is right: it asserts the committed IR is already the fixed point.
#
# Requires a clean working tree for bootstrap/ (as in a CI checkout).  Run from
# the repo root: test/trust-check.sh
set -u
cd "$(dirname "$0")/.."

echo "trust-check: 'make regen' must reproduce the committed bootstrap/*.ll"

if ! git diff --quiet -- bootstrap/; then
  echo "  [SKIP] bootstrap/ has uncommitted changes; commit them first, then re-run"
  echo "         (this check compares regenerated IR against the committed IR)"
  exit 0
fi

if ! make regen >/tmp/trust-check-regen.log 2>&1; then
  echo "  [FAIL] make regen failed:"; tail -5 /tmp/trust-check-regen.log
  exit 1
fi

if git diff --quiet --exit-code -- bootstrap/; then
  echo "  [OK  ] committed IR is exactly what the current source regenerates"
  echo
  echo "  1 passed, 0 failed"
  exit 0
else
  echo "  [FAIL] committed IR is STALE -- 'make regen' changed bootstrap/:"
  git --no-pager diff --stat -- bootstrap/
  echo "         run 'make regen' and commit the updated bootstrap/*.ll"
  echo
  echo "  0 passed, 1 failed"
  # leave the regenerated tree so the developer can inspect/commit it
  exit 1
fi
