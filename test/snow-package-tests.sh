#!/usr/bin/env bash
# Compile pinned, unmodified snow-fort packages across interactive and AOT paths.
# EMIT_SNOW_HOST=chez exercises source edits before the regen barrier.
set -uo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$(pwd)"
SNOW="$ROOT/test/snow"
EMIT="$ROOT/build/emit"
HOST="${EMIT_SNOW_HOST:-both}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
# Every native invocation in this suite shares only its own disposable cache.
export EMIT_CACHE="$TMP/cache"
pass=0; fail=0
ok () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }
case "$HOST" in
  chez) command -v chez >/dev/null || exit 1 ;;
  native|both) make emit >/dev/null 2>&1 || exit 1 ;;
  *) echo "EMIT_SNOW_HOST must be native, chez, or both" >&2; exit 2 ;;
esac
COMMON=(--no-manifest-chain --manifest "$ROOT/emit-libs.scm" -L "$SNOW/lib")
HAVE_CHEZ=0; command -v chez >/dev/null && HAVE_CHEZ=1
if [ "$HOST" = native ]; then HAVE_CHEZ=0; fi

expect () { # <label> <actual> <expected> <errors>
  if [ "$2" = "$3" ]; then ok "$1 => $2"
  else bad "$1 => $2 (expected $3)"; tail -5 "$4"; fi
}

check_program () { # <name> <source> <expected>
  local name="$1" src="$2" want="$3" got
  say "test $src -> $TMP/$name [hosts=$HOST]"
  if [ "$HOST" = both ] || [ "$HOST" = native ]; then
    if got="$(cd "$TMP" && "$EMIT" run "${COMMON[@]}" "$src" 2>"$TMP/$name.run.err")"; then
      expect "$name [emit run]" "$got" "$want" "$TMP/$name.run.err"
    else bad "$name [emit run]"; tail -5 "$TMP/$name.run.err"; fi
    if (cd "$TMP" && "$EMIT" build "$src" "${COMMON[@]}" -o "$TMP/$name" >"$TMP/$name.build.out" 2>"$TMP/$name.build.err"); then
      # The executable needs no source, compiler, or library configuration at runtime.
      mkdir -p "$TMP/delivered"
      mv "$TMP/$name" "$TMP/delivered/$name"
      if got="$(cd "$TMP/delivered" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST PATH=/usr/bin:/bin "./$name" 2>"$TMP/$name.exe.err")"; then
        expect "$name [delivered executable]" "$got" "$want" "$TMP/$name.exe.err"
      else bad "$name [executable]"; tail -5 "$TMP/$name.exe.err"; fi
    else bad "$name [emit build]"; tail -5 "$TMP/$name.build.err"; fi
    if got="$(cd "$TMP" && "$EMIT" repl "${COMMON[@]}" < "$src" 2>"$TMP/$name.repl.err" | awk 'NF{v=$0} END{print v}')"; then
      expect "$name [emit repl]" "$got" "$want" "$TMP/$name.repl.err"
    else bad "$name [emit repl]"; tail -5 "$TMP/$name.repl.err"; fi
  fi
  if [ "$HOST" != native ] && [ "$HAVE_CHEZ" = 1 ]; then
    if chez --libdirs src --script src/compile.ss "$src" --manifest "$ROOT/emit-libs.scm" -L "$SNOW/lib" -o "$TMP/$name-chez" >"$TMP/$name.chez.build" 2>&1; then
      if got="$("$TMP/$name-chez" 2>"$TMP/$name.chez.err")"; then
        expect "$name [Chez driver]" "$got" "$want" "$TMP/$name.chez.err"
      else bad "$name [Chez executable]"; tail -5 "$TMP/$name.chez.err"; fi
    else bad "$name [Chez build]"; tail -5 "$TMP/$name.chez.build"; fi
  fi
}

echo "snow-fort packages: SRFI 2, 8, 1, and 227"
bash test/snow-provenance-tests.sh || exit 1
say "verify $SNOW/sources.sha256 -> vendored sources [$(wc -l < "$SNOW/sources.sha256" | tr -d ' ') files]"
if (cd "$SNOW" && shasum -a 256 -c sources.sha256 >"$TMP/digests.out" 2>&1); then
  ok "pinned upstream source digests"
else bad "vendored source digests"; cat "$TMP/digests.out"; fi
for f in 8.sld 8.scm 2.sld 2.scm 1.sld 1.scm 227.sld 227.scm; do
  [ -s "$SNOW/lib/srfi/$f" ] || bad "missing vendored $f"
done
check_program srfi-2-8 "$SNOW/smoke.scm" '(1 (2 3) 10 #f 2 1 #t "(a \"b\")")'
check_program srfi-1-227 "$SNOW/srfi-1-smoke.scm" '(6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))'
check_program srfi-64 "$SNOW/srfi-64-smoke.scm" '(8 0)'

if [ "$HOST" = both ]; then
  for command in run repl; do
    if [ "$command" = run ]; then
      got="$(cd "$TMP" && EMIT_VERBOSITY=verbose "$EMIT" run "${COMMON[@]}" \
        "$SNOW/srfi-1-smoke.scm" 2>"$TMP/warm-$command.err")"
      status=$?
    else
      got="$(cd "$TMP" && EMIT_VERBOSITY=verbose "$EMIT" repl "${COMMON[@]}" \
        < "$SNOW/srfi-1-smoke.scm" 2>"$TMP/warm-$command.err" | awk 'NF{v=$0} END{print v}')"
      status=$?
    fi
    if [ "$status" = 0 ]; then
      expect "warm SRFI 1/227 [emit $command]" "$got" \
        '(6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))' "$TMP/warm-$command.err"
    else bad "warm [emit $command]"; tail -5 "$TMP/warm-$command.err"; fi
    if grep -Fq 'cache: library srfi.1: reused from ' "$TMP/warm-$command.err" && \
       grep -Fq 'cache: library srfi.227: reused from ' "$TMP/warm-$command.err"; then
      ok "SRFI 1/227 unit-cache reuse [emit $command]"
    else bad "SRFI 1/227 cache entries not reused [emit $command]"; tail -10 "$TMP/warm-$command.err"; fi
  done
fi

# Compare emit lib's saved artifacts with independently Chez-compiled full units.
# This checks serialization and host equivalence; artifact loading is separate.
if [ "$HOST" = both ] && [ "$HAVE_CHEZ" = 1 ]; then
  for unit in scheme.case-lambda scheme.cxr scheme.read scheme.file scheme.process-context scheme.write srfi.8 srfi.227 srfi.1 srfi.2 srfi.64; do
    case "$unit" in
      srfi.64) source="$ROOT/lib/srfi/64.sld" ;;
      srfi.*) source="$SNOW/lib/srfi/${unit#srfi.}.sld" ;;
      scheme.*) source="$ROOT/lib/scheme/${unit#scheme.}.sld" ;;
    esac
    if "$EMIT" lib "$source" "${COMMON[@]}" -o "$TMP/lib" >"$TMP/lib-$unit.out" 2>"$TMP/lib-$unit.err"; then
      for suffix in ll exports; do
        native="$TMP/lib/$unit.$suffix"
        chez="$ROOT/build/lib/$unit.$suffix"
        if [ "$suffix" = ll ]; then
          # The Chez host prepends its target header; emit lib leaves that to
          # the linker. Compare every core-emitted byte, as modules-tests does.
          sed '/^target datalayout = /d; /^target triple = /d' "$native" > "$TMP/native-core.ll"
          sed '/^target datalayout = /d; /^target triple = /d' "$chez" > "$TMP/chez-core.ll"
          native="$TMP/native-core.ll"
          chez="$TMP/chez-core.ll"
        fi
        if cmp -s "$native" "$chez"; then
          ok "$unit full $suffix identical [Chez / emit lib]"
        else bad "$unit full $suffix differs [Chez / emit lib]"; fi
      done
    else bad "$unit [emit lib]"; tail -5 "$TMP/lib-$unit.err"; fi
  done
fi
echo "snow packages: $pass passed, $fail failed"
[ "$fail" = 0 ]
