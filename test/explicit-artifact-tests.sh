#!/usr/bin/env bash
# Native-only explicit artifacts, independent of Chez and private cache warmth.
set -uo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
EMIT="$ROOT/build/emit"
TMP="$(mktemp -d)"
TMP="$(cd "$TMP" && pwd -P)"
cleanup () {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain explicit artifact diagnostics -> $TMP"
  else chmod -R u+w "$TMP"; rm -rf "$TMP"; fi
}
trap cleanup EXIT
pass=0; fail=0
ok () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }
make emit >/dev/null || exit 1
say "compile test/explicit-artifact-tool.cpp -> $TMP/tool [C++17]"
${CXX:-c++} -std=c++17 test/explicit-artifact-tool.cpp -o "$TMP/tool" || exit 1
mkdir -p "$TMP/sources" "$TMP/artifacts"
cp test/explicit-artifacts/* "$TMP/sources/"
cp test/library-composition/escaped.sld "$TMP/sources/escaped.sld"
MAN="$TMP/emit-libs.scm"
printf '((library (artifact dep) (source "%s/dep.sld") (artifacts "%s/artifacts"))\n (library (artifact facade) (source "%s/facade.sld") (artifacts "%s/artifacts"))\n (library (composition escaped) (source "%s/escaped.sld") (artifacts "%s/artifacts")))\n' \
  "$TMP/sources" "$TMP" "$TMP/sources" "$TMP" "$TMP/sources" "$TMP" > "$MAN"
COMMON=(--manifest "$MAN" --no-manifest-chain)
WANT='(10 11 (1 2) 1 0 (34 92 10 9 13 0 1 127))'
export EMIT_CACHE="$TMP/publish-cache"
for unit in dep facade escaped; do
  say "publish $TMP/sources/$unit.sld -> $TMP/artifacts [native full unit]"
  if "$EMIT" lib "$TMP/sources/$unit.sld" "${COMMON[@]}" -o "$TMP/artifacts" \
       >"$TMP/$unit.publish.out" 2>"$TMP/$unit.publish.err"; then
    ok "publish $unit"
  else bad "publish $unit"; cat "$TMP/$unit.publish.err"; fi
done
for mapping in 'artifact.dep:dep' 'artifact.facade:facade' 'composition.escaped:escaped'; do
  base="${mapping%:*}"; source="${mapping#*:}"
  if "$TMP/tool" verify "$TMP/artifacts/$base" "$EMIT" "$TMP/sources/$source.sld"; then
    ok "metadata authenticates $base payloads, executable and source"
  else bad "metadata $base"; fi
done
cp -R "$TMP/artifacts" "$TMP/saved"

run_program () { # label command cache expected
  local label="$1" command="$2" cache="$3" expected="$4" status
  export EMIT_CACHE="$cache"
  case "$command" in
    run) EMIT_VERBOSITY=verbose "$EMIT" run "$TMP/sources/program.scm" "${COMMON[@]}" \
           >"$TMP/$label.out" 2>"$TMP/$label.err"; status=$? ;;
    repl) EMIT_VERBOSITY=verbose "$EMIT" repl "${COMMON[@]}" < "$TMP/sources/program.scm" \
           >"$TMP/$label.out" 2>"$TMP/$label.err"; status=$? ;;
    build)
      EMIT_VERBOSITY=verbose "$EMIT" build "$TMP/sources/program.scm" "${COMMON[@]}" \
        -o "$TMP/$label.exe" >"$TMP/$label.compile.out" 2>"$TMP/$label.err"; status=$?
      if [ "$status" = 0 ]; then
        mkdir -p "$TMP/delivered"
        mv "$TMP/$label.exe" "$TMP/delivered/$label.exe"
        (cd "$TMP/delivered" && env -u EMIT_MANIFEST -u EMIT_LIBRARY_PATH \
          PATH=/usr/bin:/bin "./$label.exe") >"$TMP/$label.out" 2>"$TMP/$label.runtime.err"
        status=$?
      fi ;;
  esac
  printf '%s\n' "$status" > "$TMP/$label.status"
  if [ "$status" = 0 ] && [ "$(<"$TMP/$label.out")" = "$expected" ]; then ok "$label"
  else
    bad "$label [status=$status]"
    for suffix in out err runtime.err; do [ ! -f "$TMP/$label.$suffix" ] || cat "$TMP/$label.$suffix"; done
  fi
}
explicit_hit () {
  if grep -Fq "artifact: library $2: reused from $TMP/artifacts/$2.ll [explicit full unit]" "$TMP/$1.err"; then
    ok "$1 explicit hit $2"
  else bad "$1 missing explicit hit $2"; tail -15 "$TMP/$1.err"; fi
}
for command in run build repl; do
  run_program "fresh-$command" "$command" "$TMP/cache-$command" "$WANT"
  for unit in artifact.dep artifact.facade composition.escaped; do explicit_hit "fresh-$command" "$unit"; done
done
# Publishing a facade does not republish its dependency closure.
mkdir -p "$TMP/facade-only"
if EMIT_VERBOSITY=verbose "$EMIT" lib "$TMP/sources/facade.sld" "${COMMON[@]}" -o "$TMP/facade-only" \
     >"$TMP/facade-only.out" 2>"$TMP/facade-only.err" && \
   [ "$(find "$TMP/facade-only" -type f | wc -l | tr -d ' ')" = 3 ]; then
  ok "emit lib publishes only the requested unit"
else bad "facade-only publication"; cat "$TMP/facade-only.err"; fi
explicit_hit facade-only artifact.dep

# Rejection is non-mutating and does not let a stale private unit undo it.
for field in kind executable abi target source dependencies registration; do
  cp "$TMP/saved/artifact.facade.artifact" "$TMP/artifacts/artifact.facade.artifact"
  "$TMP/tool" set "$TMP/artifacts/artifact.facade" "$field" invalid || exit 1
  run_program "invalid-$field" run "$TMP/invalid-$field-cache" "$WANT"
  if grep -Fq 'artifact: library artifact.facade: rejected' "$TMP/invalid-$field.err"; then
    ok "reject incompatible $field metadata"
  else bad "accepted incompatible $field"; fi
done
cp "$TMP/saved/artifact.facade.artifact" "$TMP/artifacts/artifact.facade.artifact"
for damage in missing-metadata mixed-ir malformed-exports malformed-ir; do
  cp "$TMP/saved/artifact.facade."* "$TMP/artifacts/"
  case "$damage" in
    missing-metadata) mv "$TMP/artifacts/artifact.facade.artifact" "$TMP/absent.artifact" ;;
    mixed-ir) printf 'truncated\n' > "$TMP/artifacts/artifact.facade.ll" ;;
    malformed-exports)
      printf '(broken\n' > "$TMP/artifacts/artifact.facade.exports"
      "$TMP/tool" rehash "$TMP/artifacts/artifact.facade" ;;
    malformed-ir)
      printf 'not LLVM IR\n' > "$TMP/artifacts/artifact.facade.ll"
      "$TMP/tool" rehash "$TMP/artifacts/artifact.facade" ;;
  esac
  run_program "$damage" run "$TMP/$damage-cache" "$WANT"
  if [ "$damage" = malformed-exports ]; then
    run_program recovered-repl repl "$TMP/recovery-cache" "$WANT"
  fi
  if grep -Fq 'artifact: library artifact.facade: rejected' "$TMP/$damage.err"; then
    ok "reject $damage before registration"
  else bad "accepted $damage"; fi
done
cp "$TMP/saved/artifact.facade."* "$TMP/artifacts/"
# Source/include content changes are detected even if their mtimes are restored.
sed 's/ (artifacts "[^"]*")//g' "$MAN" > "$TMP/source-only.scm"
COMMON=(--manifest "$TMP/source-only.scm" --no-manifest-chain)
run_program prime-private run "$TMP/cache-run" "$WANT"
COMMON=(--manifest "$MAN" --no-manifest-chain)
cp -p "$TMP/sources/dep-body.scm" "$TMP/dep-body.saved"
sed 's/(define value 10)/(define value 20)/' "$TMP/dep-body.saved" > "$TMP/sources/dep-body.scm"
touch -r "$TMP/dep-body.saved" "$TMP/sources/dep-body.scm"
run_program changed-include run "$TMP/cache-run" '(20 21 (1 2) 1 0 (34 92 10 9 13 0 1 127))'
if grep -Fq 'dependency generation changed' "$TMP/changed-include.err" && \
   ! grep -Fq 'cache: library artifact.facade: reused' "$TMP/changed-include.err"; then
  ok "changed dependency invalidates importer and stale private fallback"
else bad "dependency invalidation bypassed"; cat "$TMP/changed-include.err"; fi
cp -p "$TMP/dep-body.saved" "$TMP/sources/dep-body.scm"
for change in macro call-row runtime-target; do
  case "$change" in
    macro)
      sed 's/(+ x value)/(+ x value 1)/' "$TMP/dep-body.saved" > "$TMP/sources/dep-body.scm"
      expected='(10 12 (1 2) 1 0 (34 92 10 9 13 0 1 127))' ;;
    call-row)
      sed 's/(define (collect . args) args)/(define (collect a . args) (cons a args))/' \
        "$TMP/dep-body.saved" > "$TMP/sources/dep-body.scm"
      expected="$WANT" ;;
    runtime-target)
      sed 's/(define (collect . args) args)/(define collect list)/' \
        "$TMP/dep-body.saved" > "$TMP/sources/dep-body.scm"
      expected="$WANT" ;;
  esac
  touch -r "$TMP/dep-body.saved" "$TMP/sources/dep-body.scm"
  run_program "changed-$change" run "$TMP/cache-run" "$expected"
  if grep -Fq 'dependency generation changed' "$TMP/changed-$change.err"; then
    ok "changed $change invalidates unchanged importer"
  else bad "changed $change did not invalidate importer"; fi
done
cp -p "$TMP/dep-body.saved" "$TMP/sources/dep-body.scm"
cp -p "$TMP/sources/dep.sld" "$TMP/dep-source.saved"
printf '\n;; source content changed without changing semantics\n' >> "$TMP/sources/dep.sld"
touch -r "$TMP/dep-source.saved" "$TMP/sources/dep.sld"
run_program changed-source run "$TMP/cache-run" "$WANT"
if grep -Fq 'source, include, or feature answer changed' "$TMP/changed-source.err"; then
  ok "source-byte change detected with restored mtime"
else bad "source-byte change missed"; fi
cp -p "$TMP/dep-source.saved" "$TMP/sources/dep.sld"

mkdir -p "$TMP/lib/feature"
printf '(define-library (feature optional) (export))\n' > "$TMP/lib/feature/optional.sld"
run_program changed-feature run "$TMP/cache-run" '(10 11 (1 2) 1 1 (34 92 10 9 13 0 1 127))'
if grep -Fq 'source, include, or feature answer changed' "$TMP/changed-feature.err"; then
  ok "changed library availability invalidates the selected branch"
else bad "changed feature answer missed"; fi
mv "$TMP/lib/feature/optional.sld" "$TMP/feature.saved"

cp "$TMP/sources/dep.sld" "$TMP/sources/replacement.sld"
sed 's|/dep.sld|/replacement.sld|g' "$MAN" > "$TMP/replacement-manifest.scm"
COMMON=(--manifest "$TMP/replacement-manifest.scm" --no-manifest-chain)
run_program changed-provider run "$TMP/cache-run" "$WANT"
if grep -Fq 'selected provider changed' "$TMP/changed-provider.err"; then
  ok "provider path replacement invalidates artifacts"
else bad "provider replacement missed"; fi
COMMON=(--manifest "$MAN" --no-manifest-chain)
touch "$TMP/sources/dep.sld" "$TMP/sources/dep-body.scm"
run_program timestamp-only run "$TMP/touch-cache" "$WANT"
explicit_hit timestamp-only artifact.dep

# Read-only explicit directories and unavailable private caches are nonfatal.
chmod -R a-w "$TMP/artifacts"
run_program read-only run "$TMP/not-a-cache/child" "$WANT"
explicit_hit read-only artifact.facade
chmod -R u+w "$TMP/artifacts"
printf 'not a directory\n' > "$TMP/no-cache"
run_program no-cache run "$TMP/no-cache/child" "$WANT"
explicit_hit no-cache artifact.facade
if "$EMIT" lib "$TMP/sources/dep.sld" "${COMMON[@]}" -o "$TMP/no-cache/child" \
     >"$TMP/unwritable.out" 2>"$TMP/unwritable.err"; then bad "unwritable output reported success"
else ok "unwritable requested output fails"; fi

# Independent producers can race; the resulting complete generation must validate.
for n in 1 2; do
  "$EMIT" lib "$TMP/sources/dep.sld" "${COMMON[@]}" -o "$TMP/artifacts" \
    >"$TMP/race-$n.out" 2>"$TMP/race-$n.err" &
  if [ "$n" = 1 ]; then first=$!; else second=$!; fi
done
if wait "$first" && wait "$second" && \
   "$TMP/tool" verify "$TMP/artifacts/artifact.dep" "$EMIT" "$TMP/sources/dep.sld"; then
  ok "concurrent publication leaves a complete verifiable generation"
else bad "concurrent publication"; fi
run_program after-race run "$TMP/race-cache" "$WANT"
explicit_hit after-race artifact.dep

# Chez is a separate test oracle, never an artifact interchange producer.
if command -v chez >/dev/null; then
  sed "s|$TMP/artifacts|$TMP/chez-artifacts|g" "$MAN" > "$TMP/chez-manifest.scm"
  if chez --libdirs src --script src/compile.ss "$TMP/sources/program.scm" \
       --manifest "$TMP/chez-manifest.scm" -L "$ROOT/lib" -o "$TMP/chez-program" \
       >"$TMP/chez.out" 2>"$TMP/chez.err" && \
     [ "$("$TMP/chez-program")" = "$WANT" ] && \
     [ ! -f "$TMP/chez-artifacts/artifact.dep.artifact" ]; then
    ok "Chez independently compiles into isolated legacy artifacts"
    COMMON=(--manifest "$TMP/chez-manifest.scm" --no-manifest-chain)
    run_program legacy-chez run "$TMP/legacy-cache" "$WANT"
    COMMON=(--manifest "$MAN" --no-manifest-chain)
    if grep -Fq 'missing, legacy, or malformed metadata' "$TMP/legacy-chez.err"; then
      ok "Chez-only pairs do not authorize native reuse"
    else bad "legacy Chez pair accepted as native"; fi
    for unit in artifact.dep artifact.facade composition.escaped; do
      sed '/^target datalayout = /d; /^target triple = /d' "$TMP/artifacts/$unit.ll" > "$TMP/native.ll"
      sed '/^target datalayout = /d; /^target triple = /d' "$TMP/chez-artifacts/$unit.ll" > "$TMP/chez.ll"
      if cmp -s "$TMP/native.ll" "$TMP/chez.ll" && \
         cmp -s "$TMP/artifacts/$unit.exports" "$TMP/chez-artifacts/$unit.exports"; then
        ok "$unit independent full IR/export parity"
      else bad "$unit cross-host parity"; fi
    done
  else bad "independent Chez build"; cat "$TMP/chez.err"; fi
else say "skip independent Chez parity [Chez unavailable; native artifact coverage retained]"; fi

EMIT_CACHE="$TMP/quiet-cache" EMIT_VERBOSITY=quiet "$EMIT" run \
  "$TMP/sources/program.scm" "${COMMON[@]}" > "$TMP/quiet.out" 2> "$TMP/quiet.err"
if [ "$?" = 0 ] && [ "$(<"$TMP/quiet.out")" = "$WANT" ] && [ ! -s "$TMP/quiet.err" ]; then
  ok "quiet artifact consumption preserves stdout without narration"
else bad "quiet/stdout contract"; cat "$TMP/quiet.err"; fi
EMIT_CACHE="$TMP/dump-cache" "$EMIT" run --dump-all "$TMP/sources/program.scm" "${COMMON[@]}" \
  >"$TMP/dump.out" 2>"$TMP/dump.err"
if [ "$?" = 0 ] && [ "$(<"$TMP/dump.out")" = "$WANT" ] && \
   ! grep -Fq 'artifact: library artifact.dep: reused' "$TMP/dump.err" && \
   grep -Fq '(artifact dep)' "$TMP/dump.err"; then
  ok "dump-all bypasses explicit reuse and observes library compilation"
else bad "dump-all artifact bypass"; fi

echo "explicit artifacts: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
