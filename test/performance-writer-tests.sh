#!/usr/bin/env bash
# Deterministic writer resource and output checks; no timing threshold.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
. tools/llvm-env.sh
ROOT="$PWD"
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then
    say "retain writer resource diagnostics -> $TMP"
  else
    rm -rf "$TMP"
  fi
}
trap cleanup EXIT
say "compile test/performance/writer-bench.c -> $TMP/writer [production and instrumented]"
"$CC" -std=gnu11 -O2 -I"$GC_INC" test/performance/writer-bench.c \
  -L"$GC_LIB" -lgc -lm -o "$TMP/writer"
"$CC" -std=gnu11 -O2 -I"$GC_INC" -DEMIT_BENCH_INSTRUMENT -DEMIT_EXPECT_REUSE \
  test/performance/writer-bench.c -L"$GC_LIB" -lgc -lm -o "$TMP/writer-instrumented"
say "verify writer output oracles -> $TMP/oracles.json [all workloads and supported modes]"
python3 - "$TMP" <<'PY'
import json
from pathlib import Path
import subprocess
import sys

root = Path(sys.argv[1])
rows = []
for name in ["writer", "writer-instrumented"]:
    binary = root / name
    workloads = subprocess.check_output([str(binary), "--list"], text=True).splitlines()
    for workload in workloads:
        for mode in ["ordinary", "display", "simple", "shared"]:
            if workload == "cycle" and mode == "simple":
                continue
            for destination in ["file", "string"]:
                command = [str(binary), "--workload", workload, "--mode", mode, "--sink", destination, "--verify"]
                result = subprocess.run(command, capture_output=True, text=True, check=True)
                rows.append(json.loads(result.stdout))
    for arguments in [["--workload", "unknown"], ["--iterations", "0"],
                      ["--mode", "unknown"], ["--sink", "unknown"], ["--unknown"],
                      ["--workload", "cycle", "--mode", "simple"]]:
        result = subprocess.run([str(binary), *arguments], capture_output=True, text=True)
        assert result.returncode != 0, arguments
(root / "oracles.json").write_text(json.dumps(rows, indent=2) + "\n")
production = {(r["workload"], r["mode"], r["sink"]): r for r in rows if not r["instrumented"]}
for row in rows:
    control = production[(row["workload"], row["mode"], row["sink"])]
    assert row["output_digest"] == control["output_digest"]
    assert row["output_bytes"] == control["output_bytes"]
print(f"Verified {len(rows)} independent output oracles and invalid CLI cases")
PY
say "verify writer allocation and lifecycle invariants -> $TMP/resources.json"
"$TMP/writer-instrumented" --resource-check > "$TMP/resources.json" 2> "$TMP/resources.err"
cat "$TMP/resources.json"
say "verify writer resources -> complete [no timing gate]"
