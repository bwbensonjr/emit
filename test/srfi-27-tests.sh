#!/usr/bin/env bash
# Deterministic SRFI 27 state, numeric bounds, and command/artifact acceptance.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
SOURCE=0
case "${1:-}" in
  "") ;;
  --source) SOURCE=1 ;;
  *) echo "usage: test/srfi-27-tests.sh [--source]" >&2; exit 2 ;;
esac
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain SRFI 27 diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
export EMIT_CACHE="$TMP/cache"
PROGRAM="$TMP/checks.scm"
cat test/random-sources/checks-prefix.scm test/random-sources/known-answers.scm \
    test/random-sources/checks-suffix.scm > "$PROGRAM"
EXPECTED='(srfi-27-complete 1712)'
say "verify SRFI 27 provenance and independent fixtures -> test/random-sources"
python3 test/random-sources/verify-reference.py
check_output() {
  local name="$1" file="$2"
  local last
  last="$(awk 'NF {last=$0} END {print last}' "$file")"
  if [ "$last" != "$EXPECTED" ]; then
    echo "SRFI 27 $name failed: expected $EXPECTED, got $last" >&2
    cat "$file" >&2
    exit 1
  fi
  say "verify SRFI 27 $name -> $file [1712 assertions, complete]"
}
if [ "$SOURCE" = 1 ]; then
  command -v chez >/dev/null || { echo "SRFI 27 --source requires Chez" >&2; exit 1; }
  python3 test/random-sources/verify-reference.py --upstream
  say "compile SRFI 27 source fixtures -> $TMP/source [Chez]"
  chez --libdirs src --script src/compile.ss "$PROGRAM" -L "$ROOT/lib" -o "$TMP/source" \
    > "$TMP/source.compile.out" 2> "$TMP/source.compile.err" || { cat "$TMP/source.compile.err" >&2; exit 1; }
  "$TMP/source" > "$TMP/source.out"
  check_output source "$TMP/source.out"
  say "compile controlled entropy failure -> $TMP/entropy-failure [Scheme state preservation]"
  chez --libdirs src --script src/compile.ss test/random-sources/entropy-failure.scm -L "$ROOT/lib" -o "$TMP/failure" \
    > "$TMP/failure.compile.out" 2> "$TMP/failure.compile.err" || { cat "$TMP/failure.compile.err" >&2; exit 1; }
  . tools/llvm-env.sh
  "$CC" -O1 -Wno-override-module -I"$GC_INC" -L"$GC_LIB" \
    test/random-sources/entropy-failure-runtime.c "$TMP/failure.ll" "$TMP"/failure.*.pruned.ll \
    -lgc -lm -o "$TMP/entropy-failure"
  "$TMP/entropy-failure" > "$TMP/entropy-failure.out"
  grep -Fxq '(srfi-27-entropy-failure-complete)' "$TMP/entropy-failure.out"
  say "verify entropy failure -> unchanged source [catchable Scheme error]"
else
  EMIT="$ROOT/build/emit"
  # REPL errors preserve the session. A failed assertion must therefore leave
  # the success count short even when later forms print a completion marker.
  cat test/random-sources/checks-prefix.scm > "$TMP/assertion-negative.scm"
  cat >> "$TMP/assertion-negative.scm" <<'SCM'
(check 'intentional-failure 1 2)
(write (list 'srfi-27-negative checks))
(newline)
SCM
  say "verify SRFI 27 failed assertion -> incomplete success count [REPL negative control]"
  "$EMIT" repl -L "$ROOT/lib" < "$TMP/assertion-negative.scm" \
    > "$TMP/negative.out" 2> "$TMP/negative.err"
  grep -Fxq '(srfi-27-negative 0)' "$TMP/negative.out"
  grep -Fq 'SRFI 27 assertion mismatch' "$TMP/negative.err"
  say "run SRFI 27 fixtures -> $TMP/run.out"
  "$EMIT" run -L "$ROOT/lib" "$PROGRAM" > "$TMP/run.out" 2> "$TMP/run.err" || { cat "$TMP/run.err" >&2; exit 1; }
  check_output run "$TMP/run.out"
  say "run SRFI 27 fixtures -> $TMP/repl.out [REPL]"
  "$EMIT" repl -L "$ROOT/lib" < "$PROGRAM" > "$TMP/repl.out" 2> "$TMP/repl.err" || { cat "$TMP/repl.err" >&2; exit 1; }
  check_output repl "$TMP/repl.out"
  say "build SRFI 27 fixtures -> $TMP/standalone"
  "$EMIT" build "$PROGRAM" -L "$ROOT/lib" -o "$TMP/standalone" > "$TMP/build.out" 2> "$TMP/build.err" || { cat "$TMP/build.err" >&2; exit 1; }
  (cd "$TMP" && env -u EMIT_MANIFEST -u EMIT_LIBRARY_PATH PATH=/usr/bin:/bin ./standalone) > "$TMP/standalone.out"
  check_output standalone "$TMP/standalone.out"
  mkdir -p "$TMP/artifacts"
  MANIFEST="$TMP/emit-libs.scm"
  cat > "$MANIFEST" <<EOF
((library (srfi 27) (source "$ROOT/lib/srfi/27.sld") (artifacts "$TMP/artifacts"))
 (library (scheme base) (source "$ROOT/lib/scheme/base.sld"))
 (library (emit internal) (source "$ROOT/lib/emit/internal.sld"))
 (library (scheme read) (source "$ROOT/lib/scheme/read.sld"))
 (library (scheme write) (source "$ROOT/lib/scheme/write.sld")))
EOF
  say "publish SRFI 27 -> $TMP/artifacts [explicit full unit]"
  "$EMIT" lib "$ROOT/lib/srfi/27.sld" --manifest "$MANIFEST" --no-manifest-chain -o "$TMP/artifacts" \
    > "$TMP/lib.out" 2> "$TMP/lib.err" || { cat "$TMP/lib.err" >&2; exit 1; }
  for command in run repl build; do
    stem="$TMP/artifact-$command"
    export EMIT_CACHE="$stem-cache"
    case "$command" in
      run) EMIT_VERBOSITY=verbose "$EMIT" run --manifest "$MANIFEST" --no-manifest-chain "$PROGRAM" > "$stem.out" 2> "$stem.err" ;;
      repl) EMIT_VERBOSITY=verbose "$EMIT" repl --manifest "$MANIFEST" --no-manifest-chain < "$PROGRAM" > "$stem.out" 2> "$stem.err" ;;
      build)
        EMIT_VERBOSITY=verbose "$EMIT" build "$PROGRAM" --manifest "$MANIFEST" --no-manifest-chain -o "$stem.exe" > "$stem.compile.out" 2> "$stem.err"
        "$stem.exe" > "$stem.out" ;;
    esac
    check_output "artifact-$command" "$stem.out"
    if ! grep -Fq "srfi.27: reused from $TMP/artifacts/srfi.27.ll [explicit full unit]" "$stem.err"; then
      cat "$stem.err" >&2
      echo "SRFI 27 $command did not consume its published artifact" >&2
      exit 1
    fi
  done
fi
printf '%s\n' 'SRFI 27: all selected paths passed (1712 assertions each)'
