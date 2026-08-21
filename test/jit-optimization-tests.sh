#!/usr/bin/env bash
# jit-optimization-tests.sh -- JIT development profiles (change:
# jit-dev-optimization-profile).
#
# This is deliberately one Chez-free host suite.  Its capture helpers keep status,
# stdout data, and stderr narration in separate files; the harness self-check proves
# that a mismatch in each channel is named independently before the behavior tests use
# those helpers for run and REPL sessions.
set -u
cd "$(dirname "$0")/.."

EMIT=build/emit
make emit >/dev/null 2>&1 || { echo "failed to build $EMIT"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# capture STEM COMMAND...; CAP_RC is the command's status and the two channels are
# $TMP/STEM.out and $TMP/STEM.err.  capture_file additionally feeds a named stdin file.
capture () {
  local stem="$1"; shift
  "$@" >"$TMP/$stem.out" 2>"$TMP/$stem.err"
  CAP_RC=$?
}
capture_file () {
  local stem="$1" input="$2"; shift 2
  "$@" <"$input" >"$TMP/$stem.out" 2>"$TMP/$stem.err"
  CAP_RC=$?
}

# Print one stable word per mismatching channel.  Tests normally require an empty
# result; the first three probes intentionally ask for one wrong expectation apiece.
capture_mismatches () {
  local stem="$1" want_rc="$2" want_out="$3" stderr_policy="$4"
  local got_out
  got_out="$(cat "$TMP/$stem.out")"
  [ "$CAP_RC" -eq "$want_rc" ] || echo status
  [ "$got_out" = "$want_out" ] || echo stdout
  case "$stderr_policy" in
    empty) [ ! -s "$TMP/$stem.err" ] || echo stderr ;;
    repl)  grep -q 'Emit (embedded compiler, ORC/LLJIT)' "$TMP/$stem.err" || echo stderr
           grep -Eq '(^|[[:space:]])(error:|!trap:)' "$TMP/$stem.err" && echo stderr ;;
    any)   : ;;
  esac
}
capture_ok () {
  local name="$1" stem="$2" want_rc="$3" want_out="$4" stderr_policy="$5"
  local mismatches
  mismatches="$(capture_mismatches "$stem" "$want_rc" "$want_out" "$stderr_policy")"
  [ -z "$mismatches" ] && ok "$name" \
    || bad "$name ($(printf '%s' "$mismatches" | tr '\n' ',' | sed 's/,$//'))"
}
module_counts_match () {
  local err="$1" pair transformed added
  pair="$(sed -n 's/.*\[\([0-9][0-9]*\)\/\([0-9][0-9]*\) modules.*/\1 \2/p' "$err" | tail -1)"
  transformed="${pair%% *}"; added="${pair#* }"
  [ -n "$pair" ] && [ "$transformed" = "$added" ]
}

echo "JIT profile capture helpers"
printf '(%%display 42)\n' >"$TMP/no-prelude.scm"
capture helper env EMIT_VERBOSITY=quiet "$EMIT" run -O0 --no-prelude "$TMP/no-prelude.scm"
helper_rc=$CAP_RC
m="$(capture_mismatches helper 9 42 empty)"; CAP_RC=$helper_rc
[ "$m" = status ] && ok "helper reports an option/status failure independently" \
  || bad "status self-probe reported [$m]"
m="$(capture_mismatches helper 0 41 empty)"; CAP_RC=$helper_rc
[ "$m" = stdout ] && ok "helper reports an output mismatch independently" \
  || bad "stdout self-probe reported [$m]"
capture noisy env EMIT_VERBOSITY=verbose "$EMIT" run -O0 --no-prelude "$TMP/no-prelude.scm"
m="$(capture_mismatches noisy 0 42 empty)"
[ "$m" = stderr ] && ok "helper reports stderr contamination independently" \
  || bad "stderr self-probe reported [$m]"

echo
echo "run and REPL profiles preserve values and open-world state"
printf '(map (lambda (x) (* x x)) (quote (1 2 3 4)))\n' >"$TMP/baked.scm"
cat >"$TMP/session.scm" <<'EOF'
(define (square n) (* n n))
(square 9)
(define old square)
(define square (lambda (n) (+ n 10)))
(square 1)
(old 3)
(define p (cons 1 2))
(define v (vector 3 4))
(define s (quote marker))
(list (car p) (vector-ref v 1) (eq? s (quote marker)))
EOF

for level in -O0 -O1 -O2; do
  capture "np-$level" env EMIT_VERBOSITY=quiet "$EMIT" run "$level" --no-prelude \
    "$TMP/no-prelude.scm"
  capture_ok "run $level no-prelude" "np-$level" 0 42 empty

  capture "baked-$level" env EMIT_VERBOSITY=quiet "$EMIT" run "$level" "$TMP/baked.scm"
  capture_ok "run $level baked-library call" "baked-$level" 0 '(1 4 9 16)' empty
done

for level in -O1 -O2; do
  capture_file "repl-$level" "$TMP/session.scm" env EMIT_VERBOSITY=quiet \
    "$EMIT" repl "$level"
  capture_ok "repl $level lookup/redefinition/heap identity" "repl-$level" 0 \
    "$(printf '81\n11\n9\n(1 4 #t)')" repl
done

echo
echo "manifest libraries use every profile and both artifact-cache paths"
mkdir -p "$TMP/project"
cat >"$TMP/project/jit-fixture.sld" <<'EOF'
(define-library (jit fixture)
  (export twice)
  (import (scheme base))
  (begin
    (define initialized (begin (display "I") 0))
    (define (twice x) (+ x x))))
EOF
cat >"$TMP/project/emit-libs.scm" <<EOF
((library (jit fixture) (source "$TMP/project/jit-fixture.sld")))
EOF
printf '(import (jit fixture))\n(twice 21)\n' >"$TMP/project/program.scm"
printf '(import (jit fixture))\n(twice 21)\n' >"$TMP/project/library-session.scm"

for level in -O0 -O1 -O2; do
  cache="$TMP/cache-$level"
  capture "manifest-cold-$level" env EMIT_VERBOSITY=verbose EMIT_CACHE="$cache" \
    "$EMIT" run "$level" --manifest "$TMP/project/emit-libs.scm" "$TMP/project/program.scm"
  capture_ok "run $level manifest source fallback initializes once" \
    "manifest-cold-$level" 0 I42 any
  grep -Eq 'jit .*program -> execute  \[[0-9]+/[0-9]+ modules,.*transform .*materialize .*execute ' \
    "$TMP/manifest-cold-$level.err" \
    && module_counts_match "$TMP/manifest-cold-$level.err" \
    && ok "run $level narrates module and timing aggregates" \
    || bad "run $level missing verbose JIT aggregate"

  capture "manifest-warm-$level" env EMIT_VERBOSITY=verbose EMIT_CACHE="$cache" \
    "$EMIT" run "$level" --manifest "$TMP/project/emit-libs.scm" "$TMP/project/program.scm"
  capture_ok "run $level warm manifest cache initializes once" "manifest-warm-$level" 0 I42 any
  grep -q 'cache:.*reused' "$TMP/manifest-warm-$level.err" \
    && ok "run $level manifest library takes a warm cache hit" \
    || bad "run $level did not narrate a warm cache hit"
done

for level in -O1 -O2; do
  cache="$TMP/repl-cache-$level"
  capture_file "manifest-repl-cold-$level" "$TMP/project/library-session.scm" \
    env EMIT_VERBOSITY=verbose EMIT_CACHE="$cache" "$EMIT" repl "$level" \
    --manifest "$TMP/project/emit-libs.scm"
  [ "$CAP_RC" -eq 0 ] && [ "$(cat "$TMP/manifest-repl-cold-$level.out")" = I42 ] \
    && grep -Eq 'jit .*repl -> session  \[[0-9]+/[0-9]+ modules, transform .*materialize .*execute ' \
      "$TMP/manifest-repl-cold-$level.err" \
    && module_counts_match "$TMP/manifest-repl-cold-$level.err" \
    && ok "repl $level manifest source fallback uses the session profile" \
    || bad "repl $level manifest source fallback"

  capture_file "manifest-repl-warm-$level" "$TMP/project/library-session.scm" \
    env EMIT_VERBOSITY=verbose EMIT_CACHE="$cache" "$EMIT" repl "$level" \
    --manifest "$TMP/project/emit-libs.scm"
  [ "$CAP_RC" -eq 0 ] && [ "$(cat "$TMP/manifest-repl-warm-$level.out")" = I42 ] \
    && grep -q 'cache:.*reused' "$TMP/manifest-repl-warm-$level.err" \
    && ok "repl $level manifest warm cache uses the session profile" \
    || bad "repl $level manifest warm cache"
done

echo
echo "optimized sessions recover from compile failures, traps, and guard exits"
cat >"$TMP/recovery.scm" <<'EOF'
(define (sq n) (* n n))
(sq 5)
(not-bound 1)
(+ 1 (quote bad))
(guard (e (#t (quote caught))) (vector-ref (vector 1) 9))
(call/cc (lambda (escape) (+ 1 (escape 8))))
(sq 6)
EOF
for level in -O1 -O2; do
  capture_file "recover-$level" "$TMP/recovery.scm" env EMIT_VERBOSITY=quiet \
    "$EMIT" repl "$level"
  got="$(cat "$TMP/recover-$level.out")"
  if [ "$CAP_RC" -eq 0 ] \
     && printf '%s' "$got" | grep -qx '25' \
     && printf '%s' "$got" | grep -q '^!trap: +: not a number' \
     && printf '%s' "$got" | grep -qx 'caught' \
     && printf '%s' "$got" | grep -qx '8' \
     && printf '%s' "$got" | grep -qx '36' \
     && grep -q 'unbound variable not-bound' "$TMP/recover-$level.err"; then
    ok "repl $level compile/trap/guard recovery reaches the later form"
  else
    bad "repl $level recovery (exit $CAP_RC, stdout [$(printf '%s' "$got" | tr '\n' '|')])"
  fi
done

echo
echo "the standard pipeline is per-module and the compiler IR boundary is unchanged"
for level in -O0 -O1 -O2; do
  capture "trace-$level" env EMIT_VERBOSITY=quiet EMIT_JIT_TEST_TRACE=1 \
    "$EMIT" run "$level" demos/fact.scm
  [ "$CAP_RC" -eq 0 ] && [ "$(cat "$TMP/trace-$level.out")" = 120 ] \
    || bad "trace workload $level failed"
done
awk '/jit-test: <unit> -O0 same-module calls/ && $6 == $8 { found=1 } END { exit !found }' \
  "$TMP/trace--O0.err" \
  && ok "O0 identity leaves a same-module library helper call count unchanged" \
  || bad "O0 trace did not preserve same-module calls"
awk '/jit-test: <unit> -O1 same-module calls/ && $6 > $8 { found=1 } END { exit !found }' \
  "$TMP/trace--O1.err" \
  && ok "O1 simplifies/inlines calls within an independently added module" \
  || bad "O1 trace did not simplify same-module calls"
awk '/jit-test: <unit> -O2 same-module calls/ && $6 > $8 { found=1 } END { exit !found }' \
  "$TMP/trace--O2.err" \
  && ok "O2 simplifies/inlines calls within an independently added module" \
  || bad "O2 trace did not simplify same-module calls"

EMIT_VERBOSITY=quiet "$EMIT" run --emit "$TMP/baked.scm" >"$TMP/plain.ll" 2>"$TMP/plain.err"
EMIT_VERBOSITY=quiet "$EMIT" run --emit --dump "$TMP/baked.scm" >"$TMP/dump.ll" 2>"$TMP/dump.err"
cmp -s "$TMP/plain.ll" "$TMP/dump.ll" && [ ! -s "$TMP/plain.err" ] \
  && grep -q ';; ==== after collect-toplevel' "$TMP/dump.err" \
  && ok "--dump leaves compiler-produced --emit IR byte-identical" \
  || bad "--dump changed --emit IR or its channels"

printf '(+ 20 22)\n' >"$TMP/dump-session.scm"
capture_file repl-plain "$TMP/dump-session.scm" env EMIT_VERBOSITY=quiet "$EMIT" repl -O2
capture_file repl-dump "$TMP/dump-session.scm" env EMIT_VERBOSITY=quiet "$EMIT" repl -O2 --dump
cmp -s "$TMP/repl-plain.out" "$TMP/repl-dump.out" \
  && grep -q ';; ==== after lower \[form 1\]' "$TMP/repl-dump.err" \
  && ok "REPL --dump stays upstream of O2 and preserves the form result" \
  || bad "REPL --dump changed the O2 result or omitted stages"

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
