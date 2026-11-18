#!/usr/bin/env bash
# Custom record writer contracts across source, native, artifact, and host paths.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain custom writer diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
export EMIT_CACHE="$TMP/cache"
export EMIT_CUSTOM_WRITER_FILE="$TMP/writer-output.txt"
unset EMIT_SHARED_CACHE
EMIT="$ROOT/build/emit"
SOURCE="$ROOT/test/custom-writers.scm"
COMMON=(--no-manifest-chain --manifest "$ROOT/emit-libs.scm" -L "$ROOT/lib")
EXPECTED='(custom-writers-complete 84)'
check_last() {
  local label="$1" path="$2" expected="$3"
  if [ "$(awk 'NF{last=$0} END{print last}' "$path")" != "$expected" ]; then
    cat "$path" >&2
    say "fail custom writers $label -> expected $expected"
    exit 1
  fi
  say "verify custom writers $label -> $expected"
}
if [ "${1:-}" = --reference ]; then
  command -v chez >/dev/null
  say "compile $SOURCE -> $TMP/source [Chez source driver, 84 assertions]"
  chez --libdirs src --script src/compile.ss "$SOURCE" "${COMMON[@]}" \
    -o "$TMP/source" > "$TMP/source-compile.out" 2> "$TMP/source-compile.err" || {
    cat "$TMP/source-compile.err" >&2; exit 1;
  }
  "$TMP/source" > "$TMP/source.out" 2> "$TMP/source.err" || {
    cat "$TMP/source.err" >&2; exit 1;
  }
  check_last source "$TMP/source.out" "$EXPECTED"
  say "compile custom writer documentation example -> $TMP/example [Chez source driver]"
  chez --libdirs src --script src/compile.ss "$ROOT/test/custom-writers/example.scm" "${COMMON[@]}" \
    -o "$TMP/example" > "$TMP/example-compile.out" 2> "$TMP/example-compile.err" || {
    cat "$TMP/example-compile.err" >&2; exit 1;
  }
  "$TMP/example" > "$TMP/example.out" 2> "$TMP/example.err"
  check_last example "$TMP/example.out" '((point 2 3) #((point 4 5)))'
  say "verify custom writers reference -> complete [84 assertions]"
  exit 0
fi
if [ "$#" != 0 ]; then say "usage: test/custom-writers-tests.sh [--reference]"; exit 2; fi
make emit >/dev/null
for profile in -O0 -O1 -O2; do
  label="${profile#-}"
  say "run $SOURCE -> $TMP/$label.out [native, 84 assertions]"
  "$EMIT" run "$profile" "${COMMON[@]}" "$SOURCE" \
    > "$TMP/$label.out" 2> "$TMP/$label.err" || {
    cat "$TMP/$label.err" >&2; exit 1;
  }
  check_last "$label" "$TMP/$label.out" "$EXPECTED"
done
say "compile $SOURCE -> $TMP/standalone [standalone, 84 assertions]"
"$EMIT" build "${COMMON[@]}" "$SOURCE" -o "$TMP/standalone" \
  > "$TMP/build.out" 2> "$TMP/build.err" || { cat "$TMP/build.err" >&2; exit 1; }
(cd "$TMP" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST PATH=/usr/bin:/bin ./standalone) \
  > "$TMP/standalone.out" 2> "$TMP/standalone.err" || {
  cat "$TMP/standalone.err" >&2; exit 1;
}
check_last standalone "$TMP/standalone.out" "$EXPECTED"
say "evaluate $SOURCE -> $TMP/repl.out [persistent REPL, 84 assertions]"
"$EMIT" repl "${COMMON[@]}" < "$SOURCE" > "$TMP/repl.out" 2> "$TMP/repl.err"
check_last repl "$TMP/repl.out" "$EXPECTED"

# Automatic printing has a borrowed destination; using it after return is invalid.
say "evaluate borrowed writer -> $TMP/borrowed.out [automatic result lifetime]"
"$EMIT" repl "${COMMON[@]}" < "$ROOT/test/custom-writers/borrowed-repl.scm" \
  > "$TMP/borrowed.out" 2> "$TMP/borrowed.err"
grep -Fq 'borrowed-value' "$TMP/borrowed.out"
grep -Fq '(borrowed-port-lifetime #t #t #t)' "$TMP/borrowed.out"
check_last borrowed "$TMP/borrowed.out" '(borrowed-port-reuse #t)'

# Printing runs after evaluation, so failures must be inside the host boundary too.
for failure in failing trapping; do
  source="$ROOT/test/custom-writers/$failure.scm"
  say "check $source -> automatic-print diagnostics [run, REPL, standalone]"
  if "$EMIT" run "${COMMON[@]}" "$source" > "$TMP/$failure-run.out" 2> "$TMP/$failure-run.err"; then
    say "fail custom writers $failure -> emit run accepted failed result printing"; exit 1
  fi
  test -s "$TMP/$failure-run.err"
  cat "$source" > "$TMP/$failure-repl.scm"
  printf "(list 'print-recovered 42)\n" >> "$TMP/$failure-repl.scm"
  "$EMIT" repl "${COMMON[@]}" < "$TMP/$failure-repl.scm" \
    > "$TMP/$failure-repl.out" 2> "$TMP/$failure-repl.err"
  check_last "$failure-recovery" "$TMP/$failure-repl.out" '(print-recovered 42)'
  grep -Eq '!trap:|!error:|error:|trap:' "$TMP/$failure-repl.out" "$TMP/$failure-repl.err"
  "$EMIT" build "${COMMON[@]}" "$source" -o "$TMP/$failure" \
    > "$TMP/$failure-build.out" 2> "$TMP/$failure-build.err"
  if "$TMP/$failure" > "$TMP/$failure-exe.out" 2> "$TMP/$failure-exe.err"; then
    say "fail custom writers $failure -> executable accepted failed result printing"; exit 1
  fi
  test -s "$TMP/$failure-exe.err"
done

# A library owns both the closure and its ABI bridge; a later unit only returns values.
MAN="$TMP/fixture-manifest.scm"
mkdir -p "$TMP/artifacts"
printf '((library (custom-writers fixture) (source "%s/test/custom-writers/writer.sld") (artifacts "%s/artifacts")))\n' \
  "$ROOT" "$TMP" > "$MAN"
FIXTURE_COMMON=(--no-manifest-chain --manifest "$MAN" -L "$ROOT/lib")
USE="$ROOT/test/custom-writers/use.scm"
WANT='([token:7] #([token:8]))'
say "publish $ROOT/test/custom-writers/writer.sld -> $TMP/artifacts [full library]"
"$EMIT" lib "$ROOT/test/custom-writers/writer.sld" "${FIXTURE_COMMON[@]}" -o "$TMP/artifacts" \
  > "$TMP/lib.out" 2> "$TMP/lib.err" || { cat "$TMP/lib.err" >&2; exit 1; }
for profile in -O0 -O1 -O2; do
  for temperature in cold warm; do
    label="${profile#-}-$temperature"
    say "run $USE -> $TMP/artifact-$label.out [full artifact, $temperature cache]"
    EMIT_VERBOSITY=verbose "$EMIT" run "$profile" "${FIXTURE_COMMON[@]}" "$USE" \
      > "$TMP/artifact-$label.out" 2> "$TMP/artifact-$label.err" || {
      cat "$TMP/artifact-$label.err" >&2; exit 1;
    }
    check_last "artifact-$label" "$TMP/artifact-$label.out" "$WANT"
    grep -Fq 'custom-writers.fixture: reused from' "$TMP/artifact-$label.err"
  done
  grep -Fq "native object reused for library custom-writers.fixture: $profile" \
    "$TMP/artifact-${profile#-}-warm.err"
done
say "evaluate $USE -> $TMP/artifact-repl.out [later JIT form, warmed native library]"
"$EMIT" repl -O1 "${FIXTURE_COMMON[@]}" < "$USE" \
  > "$TMP/artifact-repl.out" 2> "$TMP/artifact-repl.err"
check_last artifact-repl "$TMP/artifact-repl.out" "$WANT"
say "compile $USE -> $TMP/artifact-exe [full artifact, source-free delivery]"
"$EMIT" build "${FIXTURE_COMMON[@]}" "$USE" -o "$TMP/artifact-exe" \
  > "$TMP/artifact-build.out" 2> "$TMP/artifact-build.err"
(cd "$TMP" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST PATH=/usr/bin:/bin ./artifact-exe) \
  > "$TMP/artifact-exe.out" 2> "$TMP/artifact-exe.err"
check_last artifact-exe "$TMP/artifact-exe.out" "$WANT"
say "verify custom writers native -> complete [84 assertions across 5 paths, automatic failure/lifetime, 3 artifact profiles]"
