#!/usr/bin/env bash
# Self-contained native Malt training acceptance; optional source-driven check.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
case "${1:-}" in
  "") ;;
  --source) export MALT_SOURCE_DRIVEN=1 ;;
  --reference)
    : "${MALT_SOURCE:?--reference requires MALT_SOURCE pointing at the pinned checkout}"
    python3 test/malt-reference/check.py --upstream "$MALT_SOURCE"
    exit 0
    ;;
  --help) printf 'usage: test/malt-training-tests.sh [--source|--reference]\n'; exit 0 ;;
  *) echo "unknown option: $1" >&2; exit 2 ;;
esac
if [ "$#" -gt 1 ]; then echo 'only one option is accepted' >&2; exit 2; fi
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain Malt training diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
EMIT="${EMIT:-$ROOT/build/emit}"
export EMIT_CACHE="$TMP/cache"
python3 test/malt-reference/xor-reference-tests.py
python3 test/malt-reference/check.py
check_output() {
  if ! tail -n 1 "$1" | grep -Fxq '(malt-training 77)'; then
    cat "$1" >&2
    echo "Malt training assertion count/completion mismatch" >&2
    exit 1
  fi
}
start=$SECONDS
if [ "${MALT_SOURCE_DRIVEN:-0}" != 1 ]; then
say "run test/malt-training.scm -> run, REPL, standalone [77 checks each]"
"$EMIT" run -L "$ROOT/lib" -L "$ROOT/test" "$ROOT/test/malt-training.scm" > "$TMP/run.out" 2> "$TMP/run.err" || { cat "$TMP/run.err" >&2; exit 1; }
check_output "$TMP/run.out"
"$EMIT" repl -L "$ROOT/lib" -L "$ROOT/test" < "$ROOT/test/malt-training.scm" > "$TMP/repl.out" 2> "$TMP/repl.err" || { cat "$TMP/repl.err" >&2; exit 1; }
check_output "$TMP/repl.out"
"$EMIT" build -L "$ROOT/lib" -L "$ROOT/test" "$ROOT/test/malt-training.scm" -o "$TMP/training" > "$TMP/build.out" 2> "$TMP/build.err" || { cat "$TMP/build.err" >&2; exit 1; }
(cd "$TMP" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST ./training) > "$TMP/aot.out"
check_output "$TMP/aot.out"
else
  command -v chez >/dev/null || { echo 'MALT_SOURCE_DRIVEN=1 requires Chez' >&2; exit 1; }
  chez --libdirs src --script src/compile.ss -q -L "$ROOT/lib" -L "$ROOT/test" "$ROOT/test/malt-training.scm" -o "$TMP/source" > "$TMP/source.compile.out" 2> "$TMP/source.err" || { cat "$TMP/source.err" >&2; exit 1; }
  "$TMP/source" > "$TMP/source.out"
  check_output "$TMP/source.out"
fi
say "verify explicit-exclusion import -> unprefixed learner fixture"
if [ "${MALT_SOURCE_DRIVEN:-0}" != 1 ]; then
  "$EMIT" run -L "$ROOT/lib" "$ROOT/test/malt-reference/unprefixed.scm" > "$TMP/unprefixed.run.out" 2> "$TMP/unprefixed.run.err" || { cat "$TMP/unprefixed.run.err" >&2; exit 1; }
  "$EMIT" repl -L "$ROOT/lib" < "$ROOT/test/malt-reference/unprefixed.scm" > "$TMP/unprefixed.repl.out" 2> "$TMP/unprefixed.repl.err" || { cat "$TMP/unprefixed.repl.err" >&2; exit 1; }
  "$EMIT" build -L "$ROOT/lib" "$ROOT/test/malt-reference/unprefixed.scm" -o "$TMP/unprefixed" > "$TMP/unprefixed.build.out" 2> "$TMP/unprefixed.build.err" || { cat "$TMP/unprefixed.build.err" >&2; exit 1; }
  "$TMP/unprefixed" > "$TMP/unprefixed.aot.out"
  for path in run repl aot; do
    tail -n 1 "$TMP/unprefixed.$path.out" | grep -Fxq '(malt-unprefixed 6.0)'
  done
else
  chez --libdirs src --script src/compile.ss -q -L "$ROOT/lib" "$ROOT/test/malt-reference/unprefixed.scm" -o "$TMP/unprefixed" > "$TMP/unprefixed.build.out" 2> "$TMP/unprefixed.build.err" || { cat "$TMP/unprefixed.build.err" >&2; exit 1; }
  "$TMP/unprefixed" > "$TMP/unprefixed.aot.out"
  tail -n 1 "$TMP/unprefixed.aot.out" | grep -Fxq '(malt-unprefixed 6.0)'
fi
say "verify direct learner import -> run, REPL, standalone"
if [ "${MALT_SOURCE_DRIVEN:-0}" != 1 ]; then
  "$EMIT" run -L "$ROOT/lib" "$ROOT/test/malt-reference/direct.scm" > "$TMP/direct.run.out" 2> "$TMP/direct.run.err" || { cat "$TMP/direct.run.err" >&2; exit 1; }
  "$EMIT" repl -L "$ROOT/lib" < "$ROOT/test/malt-reference/direct.scm" > "$TMP/direct.repl.out" 2> "$TMP/direct.repl.err" || { cat "$TMP/direct.repl.err" >&2; exit 1; }
  "$EMIT" build -L "$ROOT/lib" "$ROOT/test/malt-reference/direct.scm" -o "$TMP/direct" > "$TMP/direct.build.out" 2> "$TMP/direct.build.err" || { cat "$TMP/direct.build.err" >&2; exit 1; }
  "$TMP/direct" > "$TMP/direct.aot.out"
  for path in run repl aot; do
    tail -n 1 "$TMP/direct.$path.out" | grep -Fxq '(malt-direct 6.0)'
  done
else
  chez --libdirs src --script src/compile.ss -q -L "$ROOT/lib" "$ROOT/test/malt-reference/direct.scm" -o "$TMP/direct" > "$TMP/direct.build.out" 2> "$TMP/direct.build.err" || { cat "$TMP/direct.build.err" >&2; exit 1; }
  "$TMP/direct" > "$TMP/direct.aot.out"
  tail -n 1 "$TMP/direct.aot.out" | grep -Fxq '(malt-direct 6.0)'
fi
say "verify explicit base and learner imports conflict"
cat > "$TMP/conflict.scm" <<'EOF'
(import (scheme base))
(import (malt learner))
(gradient (lambda (x) (* x x)) 3.0)
EOF
if [ "${MALT_SOURCE_DRIVEN:-0}" != 1 ]; then
  if "$EMIT" run -L "$ROOT/lib" "$TMP/conflict.scm" > "$TMP/conflict.out" 2> "$TMP/conflict.err"; then
    echo "explicit base and learner imports unexpectedly succeeded" >&2; exit 1
  fi
else
  if chez --libdirs src --script src/compile.ss -q -L "$ROOT/lib" "$TMP/conflict.scm" -o "$TMP/conflict" > "$TMP/conflict.out" 2> "$TMP/conflict.err"; then
    echo "explicit base and learner imports unexpectedly succeeded" >&2; exit 1
  fi
fi
if ! grep -qi 'conflict' "$TMP/conflict.err"; then cat "$TMP/conflict.err" >&2; exit 1; fi
say "verify Malt training -> completion [$((SECONDS-start))s, 77 checks per path]"
printf 'Malt training acceptance passed\n'
