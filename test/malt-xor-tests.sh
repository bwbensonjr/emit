#!/usr/bin/env bash
# Seeded XOR acceptance on all native execution paths.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
case "${1:-}" in
  "") ;;
  --source) export MALT_SOURCE_DRIVEN=1 ;;
  --help) printf 'usage: test/malt-xor-tests.sh [--source]\n'; exit 0 ;;
  *) echo "unknown option: $1" >&2; exit 2 ;;
esac
if [ "$#" -gt 1 ]; then echo 'only one option is accepted' >&2; exit 2; fi
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain XOR diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
EMIT="${EMIT:-$ROOT/build/emit}"
export EMIT_CACHE="$TMP/cache"
start=$SECONDS
if [ "${MALT_SOURCE_DRIVEN:-0}" != 1 ]; then
say "run demos/malt-xor.scm -> run, REPL, standalone [stream 17/0, 4000 updates]"
"$EMIT" run -L "$ROOT/lib" "$ROOT/demos/malt-xor.scm" > "$TMP/run.out" 2> "$TMP/run.err" || { cat "$TMP/run.err" >&2; exit 1; }
"$EMIT" repl -L "$ROOT/lib" < "$ROOT/demos/malt-xor.scm" > "$TMP/repl.out" 2> "$TMP/repl.err" || { cat "$TMP/repl.err" >&2; exit 1; }
"$EMIT" build -L "$ROOT/lib" "$ROOT/demos/malt-xor.scm" -o "$TMP/xor" > "$TMP/build.out" 2> "$TMP/build.err" || { cat "$TMP/build.err" >&2; exit 1; }
(cd "$TMP" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST ./xor) > "$TMP/aot.out"
else
  command -v chez >/dev/null || { echo 'source XOR check requires Chez' >&2; exit 1; }
  chez --libdirs src --script src/compile.ss -q -L "$ROOT/lib" "$ROOT/demos/malt-xor.scm" -o "$TMP/source" > "$TMP/source.compile.out" 2> "$TMP/source.err" || { cat "$TMP/source.err" >&2; exit 1; }
  "$TMP/source" > "$TMP/source.out"
fi
python3 - "$TMP" <<'PY'
from pathlib import Path
import os
import re
import sys
root = Path(sys.argv[1])
answers = []
names = ["source"] if (root / "source.out").exists() else ["run", "repl", "aot"]
for name in names:
    text = (root / f"{name}.out").read_text().splitlines()[-1]
    assert text.startswith("(xor ("), text
    values = [float(x) for x in re.findall(r"[-+]?(?:\d+\.\d*|\.\d+|\d+)(?:[eE][-+]?\d+)?", text)]
    assert len(values) == 5, text
    assert all(abs(x-y) < 0.1 for x, y in zip(values[:4], [0, 1, 1, 0])), text
    assert values[4] < 0.04, text
    answers.append(values)
assert all(all(abs(a-b) < 1e-9 for a,b in zip(answers[0], row)) for row in answers[1:])
if os.environ.get("EMIT_VERBOSITY", "").lower() not in {"quiet", "q", "0"}:
    print(f"verify XOR predictions -> {len(names)} paths [loss {answers[0][4]}]", file=sys.stderr)
PY
say "verify XOR -> completion [$((SECONDS-start))s]"
printf 'Malt XOR acceptance passed\n'
