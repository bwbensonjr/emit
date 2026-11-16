#!/usr/bin/env bash
# Tensor, rank-extension, reverse-mode, and numerical learner acceptance.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
TMP="$(mktemp -d)"
cleanup () {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain Malt core diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
export EMIT_CACHE="$TMP/cache"
EMIT="$ROOT/build/emit"
EXPECTED='(malt-core-complete 95)'
SOURCE="$ROOT/test/malt-core.scm"
COMMON=(--no-manifest-chain --manifest "$ROOT/emit-libs.scm" -L "$ROOT/lib")
python3 "$ROOT/test/malt-core-exports.py"
check_output () {
  local label="$1" path="$2"
  if [ "$(awk 'NF{last=$0} END{print last}' "$path")" != "$EXPECTED" ]; then
    cat "$path" >&2
    say "fail Malt core $label -> expected $EXPECTED"
    return 1
  fi
  say "verify Malt core $label -> $EXPECTED [95 assertions]"
}
if [ "${1:-}" = --reference ]; then
  command -v chez >/dev/null
  say "compile $SOURCE -> $TMP/source-core [Chez source driver]"
  chez --libdirs src --script src/compile.ss "$SOURCE" "${COMMON[@]}" \
    -o "$TMP/source-core" > "$TMP/source-compile.out" 2> "$TMP/source-compile.err" || {
      cat "$TMP/source-compile.err" >&2; exit 1;
    }
  "$TMP/source-core" > "$TMP/source.out" 2> "$TMP/source.err" || {
    cat "$TMP/source.err" >&2; exit 1;
  }
  check_output source "$TMP/source.out"
  echo "Malt core reference: 95 assertions passed"
  exit 0
fi
if [ "$#" != 0 ]; then say "usage: test/malt-core-tests.sh [--reference]"; exit 2; fi
make emit >/dev/null
say "run $SOURCE -> $TMP/run.out [native]"
"$EMIT" run "${COMMON[@]}" "$SOURCE" > "$TMP/run.out" 2> "$TMP/run.err" || {
  cat "$TMP/run.err" >&2; exit 1;
}
check_output run "$TMP/run.out"
say "compile $SOURCE -> $TMP/core [standalone]"
"$EMIT" build "${COMMON[@]}" "$SOURCE" -o "$TMP/core" \
  > "$TMP/build.out" 2> "$TMP/build.err" || { cat "$TMP/build.err" >&2; exit 1; }
(cd "$TMP" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST PATH=/usr/bin:/bin ./core) \
  > "$TMP/exe.out" 2> "$TMP/exe.err" || { cat "$TMP/exe.err" >&2; exit 1; }
check_output executable "$TMP/exe.out"
say "evaluate $SOURCE -> $TMP/repl.out [persistent REPL]"
"$EMIT" repl "${COMMON[@]}" < "$SOURCE" > "$TMP/repl.out" 2> "$TMP/repl.err" || {
  cat "$TMP/repl.err" >&2; exit 1;
}
check_output repl "$TMP/repl.out"

# Publish each whole unit and then demand actual full-artifact consumption.
mkdir -p "$TMP/artifacts"
MAN="$TMP/artifacts.scm"
printf '(\n' > "$MAN"
for unit in tensors autodiff operations diagnostics; do
  printf ' (library (malt learner %s) (source "%s/lib/malt/learner/%s.sld") (artifacts "%s/artifacts"))\n' \
    "$unit" "$ROOT" "$unit" "$TMP" >> "$MAN"
done
printf ')\n' >> "$MAN"
ARTIFACT_COMMON=(--manifest "$MAN" --no-manifest-chain -L "$ROOT/lib")
for unit in tensors autodiff operations diagnostics; do
  say "publish $ROOT/lib/malt/learner/$unit.sld -> $TMP/artifacts [full unit]"
  "$EMIT" lib "$ROOT/lib/malt/learner/$unit.sld" "${ARTIFACT_COMMON[@]}" \
    -o "$TMP/artifacts" > "$TMP/lib-$unit.out" 2> "$TMP/lib-$unit.err" || {
      cat "$TMP/lib-$unit.err" >&2; exit 1;
    }
done
EMIT_VERBOSITY=verbose "$EMIT" run "${ARTIFACT_COMMON[@]}" "$SOURCE" \
  > "$TMP/artifact-run.out" 2> "$TMP/artifact-run.err" || {
    cat "$TMP/artifact-run.err" >&2; exit 1;
  }
check_output artifact-run "$TMP/artifact-run.out"
for unit in tensors autodiff operations diagnostics; do
  grep -Fq "artifact: library malt.learner.$unit: reused from $TMP/artifacts/malt.learner.$unit.ll [explicit full unit]" \
    "$TMP/artifact-run.err" || { cat "$TMP/artifact-run.err" >&2; exit 1; }
done
echo "Malt core native: 4 paths, 95 assertions each passed"
