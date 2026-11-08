#!/usr/bin/env bash
# Compare every declared generated library with an isolated Emit generation.
# --tree selects an isolated source fixture; it never changes the checked tree.
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
TREE="$PWD"
HOST=emit
while [ "$#" -gt 0 ]; do
  case "$1" in
    --tree) TREE="$2"; shift 2 ;;
    --host) HOST="$2"; shift 2 ;;
    *) echo "scheme-base-gen-check: unknown option $1" >&2; exit 2 ;;
  esac
done
TMP="$(mktemp -d)"
cleanup() {
  status=$?
  if [ "$status" -eq 0 ]; then rm -rf "$TMP"
  else echo "scheme-base-gen-check: failure reports -> $TMP" >&2; fi
}
trap cleanup EXIT
say "check generated libraries $TREE/lib -> $TMP/generated"
if ! bash tools/gen-scheme-base.sh --host "$HOST" --prelude "$TREE/src/prelude.scm" \
    --declaration "$TREE/src/prelude-surface.scm" --output-root "$TMP/generated" \
    >"$TMP/generator.stdout" 2>"$TMP/generator.stderr"; then
  echo "scheme-base-gen-check: generator failed" >&2
  cat "$TMP/generator.stderr" >&2
  exit 1
fi
# The generated tree is itself the member inventory. This does not duplicate the
# declaration parser, and it detects body changes as well as surface changes.
python3 - "$TREE" "$TMP/generated" <<'PY'
from pathlib import Path
import sys

source, generated = map(Path, sys.argv[1:])
expected = {p.relative_to(generated) for p in generated.rglob("*.sld")}
failures = []
if not expected:
    failures.append("generator produced no library members")
for rel in sorted(expected):
    actual = source / rel
    if not actual.is_file():
        failures.append(f"missing generated member: {rel}")
    elif actual.read_bytes() != (generated / rel).read_bytes():
        failures.append(f"stale generated member: {rel}")
for actual in sorted((source / "lib").rglob("*.sld")):
    rel = actual.relative_to(source)
    marker = b"GENERATED from src/prelude.scm"
    if rel not in expected and marker in b"\n".join(actual.read_bytes().splitlines()[:2]):
        failures.append(f"orphan generated member: {rel}")
for failure in failures:
    print(f"scheme-base-gen-check: {failure}", file=sys.stderr)
if failures:
    sys.exit(1)
print(f"generated libraries: {len(expected)} members match", file=sys.stderr)
PY
say "check generated libraries -> matched [$(find "$TMP/generated" -name '*.sld' | wc -l | tr -d ' ') members]"
