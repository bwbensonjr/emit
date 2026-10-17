#!/usr/bin/env bash
# Compile the shipped SRFI closure once, then prove explicit full-unit reuse.
set -uo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
EMIT="$ROOT/build/emit"
TMP="$(mktemp -d)"
cleanup () {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain SRFI artifact diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
make emit >/dev/null || exit 1
mkdir -p "$TMP/artifacts"
MAN="$TMP/emit-libs.scm"
units=(scheme.case-lambda scheme.cxr scheme.read scheme.file scheme.process-context scheme.write srfi.8 srfi.227 srfi.1 srfi.2 srfi.64)
printf '(\n' > "$MAN"
for unit in "${units[@]}"; do
  family="${unit%%.*}"; component="${unit#*.}"
  printf ' (library (%s %s) (source "%s/lib/%s/%s.sld") (artifacts "%s/artifacts"))\n' \
    "$family" "$component" "$ROOT" "$family" "$component" "$TMP" >> "$MAN"
done
printf ')\n' >> "$MAN"
COMMON=(--manifest "$MAN" --no-manifest-chain)
export EMIT_CACHE="$TMP/publish-cache"
for unit in "${units[@]}"; do
  family="${unit%%.*}"; component="${unit#*.}"
  say "publish $ROOT/lib/$family/$component.sld -> $TMP/artifacts/$unit [full unit]"
  if ! "$EMIT" lib "$ROOT/lib/$family/$component.sld" "${COMMON[@]}" -o "$TMP/artifacts" \
       >"$TMP/$unit.out" 2>"$TMP/$unit.err"; then
    cat "$TMP/$unit.err"; exit 1
  fi
done
pass=0; fail=0
for input in srfi-1-smoke srfi-64-smoke; do
  case "$input" in
    srfi-1-smoke)
      expected='(6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))'
      required=(srfi.1 srfi.8 srfi.227 scheme.cxr scheme.case-lambda) ;;
    srfi-64-smoke)
      expected='(8 0)'
      required=(srfi.64 srfi.1 srfi.8 srfi.227 scheme.file scheme.read scheme.process-context scheme.write) ;;
  esac
  for command in run build repl; do
    stem="$TMP/$input-$command"
    export EMIT_CACHE="$stem-cache"
    status=0
    case "$command" in
      run) EMIT_VERBOSITY=verbose "$EMIT" run "$ROOT/test/snow/$input.scm" "${COMMON[@]}" \
             >"$stem.out" 2>"$stem.err" || status=$? ;;
      repl) EMIT_VERBOSITY=verbose "$EMIT" repl "${COMMON[@]}" < "$ROOT/test/snow/$input.scm" \
             >"$stem.out" 2>"$stem.err" || status=$? ;;
      build)
        EMIT_VERBOSITY=verbose "$EMIT" build "$ROOT/test/snow/$input.scm" "${COMMON[@]}" \
          -o "$stem.exe" >"$stem.compile.out" 2>"$stem.err" || status=$?
        if [ "$status" = 0 ]; then
          mkdir -p "$TMP/delivered"
          mv "$stem.exe" "$TMP/delivered/$input.exe"
          (cd "$TMP/delivered" && env -u EMIT_MANIFEST -u EMIT_LIBRARY_PATH \
            PATH=/usr/bin:/bin "./$input.exe") >"$stem.out" 2>"$stem.runtime.err" || status=$?
        fi ;;
    esac
    if [ "$status" = 0 ] && [ "$(awk 'NF{last=$0} END{print last}' "$stem.out")" = "$expected" ]; then
      for unit in "${required[@]}"; do
        grep -Fq "artifact: library $unit: reused from $TMP/artifacts/$unit.ll [explicit full unit]" \
          "$stem.err" || status=1
      done
    else status=1; fi
    if [ "$status" = 0 ]; then
      echo "  [OK  ] $input [$command] values and ${#required[@]} explicit full-unit hits"
      pass=$((pass+1))
    else
      echo "  [FAIL] $input [$command] values or explicit consumption"
      cat "$stem.out" "$stem.err"
      fail=$((fail+1))
    fi
  done
done
echo "SRFI artifacts: $pass passed, $fail failed"
[ "$fail" = 0 ]
