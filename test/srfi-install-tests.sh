#!/usr/bin/env bash
# Verify the optional SRFI source closure and every installed native command.
set -uo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
TMP="$(mktemp -d)"
cleanup () {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain SRFI install diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
PREFIX="$TMP/prefix"
EMIT="$PREFIX/bin/emit"
export EMIT_CACHE="$TMP/cache"
unset EMIT_MANIFEST EMIT_LIBRARY_PATH
pass=0; fail=0
ok () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }
say "install Emit and SRFI sources -> $PREFIX [isolated prefix]"
if ! make install PREFIX="$PREFIX" >"$TMP/install.out" 2>"$TMP/install.err"; then
  cat "$TMP/install.out" "$TMP/install.err"; exit 1
fi
files=(1.sld 1.scm 2.sld 2.scm 8.sld 8.scm 227.sld 227.scm 64.sld 64.scm 64/simple-runner.scm 64/source-info.scm README.md upstream.sha256)
for file in "${files[@]}"; do
  if cmp -s "$ROOT/lib/srfi/$file" "$PREFIX/share/emit/lib/srfi/$file"; then
    ok "installed exact SRFI source/notice $file"
  else bad "installed SRFI payload $file"; fi
done
if [ "$(find "$PREFIX/share/emit/lib/srfi" -type f | wc -l | tr -d ' ')" = "${#files[@]}" ] && \
   [ -z "$(find "$PREFIX/share/emit/lib/srfi" -type l)" ]; then
  ok "SRFI payload contains only the explicit source/include/notice inventory"
else bad "unexpected SRFI files or symlinks"; fi
find "$PREFIX/share/emit/lib/srfi" -type f -exec shasum -a 256 {} + | sort > "$TMP/before"
if make install PREFIX="$PREFIX" >"$TMP/repeat.out" 2>"$TMP/repeat.err"; then
  find "$PREFIX/share/emit/lib/srfi" -type f -exec shasum -a 256 {} + | sort > "$TMP/after"
  if cmp -s "$TMP/before" "$TMP/after"; then ok "repeated SRFI installation is byte-identical"
  else bad "repeat install changed source bytes"; fi
else bad "repeat installation"; fi
if make install PREFIX="$PREFIX" DESTDIR="$TMP/stage" >"$TMP/stage.out" 2>"$TMP/stage.err"; then
  mismatch=0
  for file in "${files[@]}"; do
    cmp -s "$ROOT/lib/srfi/$file" "$TMP/stage$PREFIX/share/emit/lib/srfi/$file" || mismatch=1
  done
  if [ "$mismatch" = 0 ]; then ok "DESTDIR preserves every nested include and notice"
  else bad "staged source closure"; fi
else bad "staged installation"; fi

mkdir -p "$TMP/work" "$TMP/delivered"
cp test/snow/srfi-1-smoke.scm "$TMP/work/one.scm"
cp test/snow/srfi-64-smoke.scm "$TMP/work/runner.scm"
cd "$TMP/work"
WANT='(6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))'
for command in run repl build; do
  status=0
  case "$command" in
    run) "$EMIT" run one.scm >"$TMP/$command.out" 2>"$TMP/$command.err" || status=$? ;;
    repl) "$EMIT" repl < one.scm >"$TMP/$command.out" 2>"$TMP/$command.err" || status=$? ;;
    build)
      "$EMIT" build one.scm -o "$TMP/delivered/one" >"$TMP/build.compile.out" 2>"$TMP/build.err" || status=$?
      if [ "$status" = 0 ]; then
        (cd "$TMP/delivered" && env PATH=/usr/bin:/bin ./one) >"$TMP/build.out" 2>"$TMP/build.runtime.err" || status=$?
      fi ;;
  esac
  if [ "$status" = 0 ] && [ "$(awk 'NF{last=$0} END{print last}' "$TMP/$command.out")" = "$WANT" ]; then
    ok "installed $command uses SRFI 1/227 without checkout configuration"
  else bad "installed $command"; cat "$TMP/$command.err"; fi
done
if got="$("$EMIT" run runner.scm 2>"$TMP/runner.err")" && [ "$got" = '(8 0)' ]; then
  ok "installed SRFI 64 resolves both nested includes and the full dependency closure"
else bad "installed SRFI 64"; cat "$TMP/runner.err"; fi
printf '%s\n' '(define-library (installed-check) (import (scheme base) (srfi 2) (srfi 8)) (export answer) (begin (define answer (and-let* ((x 3)) (receive (a b) (values x 4) (+ a b))))))' > installed-check.sld
if "$EMIT" lib installed-check.sld -o artifacts >"$TMP/lib.out" 2>"$TMP/lib.err" && \
   [ -s artifacts/installed-check.ll ] && [ -s artifacts/installed-check.exports ] && \
   [ -s artifacts/installed-check.artifact ]; then
  ok "installed emit lib publishes a complete SRFI-dependent unit"
else bad "installed emit lib"; cat "$TMP/lib.err"; fi
printf '%s\n' '(import (scheme base)) (cond-expand ((library (srfi 64)) (define available #t)) (else (define available #f))) (list available (and (memq (quote srfi-64) (features)) #t) (and (memq (quote srfi-1) (features)) #t))' > features.scm
if got="$("$EMIT" run features.scm 2>"$TMP/features.err")" && [ "$got" = '(#t #f #f)' ]; then
  ok "resolver availability does not add global SRFI feature identifiers"
else bad "availability/features => $got"; cat "$TMP/features.err"; fi
EMIT_VERBOSITY=verbose EMIT_CACHE="$TMP/unused-cache" "$EMIT" run <<< '(list 1 2)' \
  >"$TMP/unused.out" 2>"$TMP/unused.err"
if [ "$?" = 0 ] && [ "$(<"$TMP/unused.out")" = '(1 2)' ] && \
   ! grep -Fq 'resolve library (srfi' "$TMP/unused.err" && \
   [ -z "$(find "$TMP/unused-cache" -name 'unit-srfi*')" ]; then
  ok "unused installed SRFIs are not compiled or registered"
else bad "unused SRFI loading"; cat "$TMP/unused.err"; fi
printf '()\n' > emit-libs.scm
mkdir -p lib/srfi
printf '%s\n' '(define-library (srfi 2) (export and-let*) (begin (define-syntax and-let* (syntax-rules () ((_ any ...) (quote project))))))' > lib/srfi/2.sld
if got="$(printf '(import (srfi 2)) (and-let* ())\n' | "$EMIT" run 2>"$TMP/override.err")" && \
   [ "$got" = project ]; then
  ok "project SRFI source overrides the installed provider"
else bad "project override => $got"; cat "$TMP/override.err"; fi
echo "SRFI install: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
