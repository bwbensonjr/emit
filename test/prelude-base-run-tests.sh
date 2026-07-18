#!/usr/bin/env bash
# prelude-base-run-tests.sh -- Stage 3 (scheme base) re-home on the CHEZ-FREE
# embedded-runner door (change: embedded-runner-rehome).  Exercises `emit run`
# and `emit build`, which now auto-import (scheme base) instead of prepending
# the prelude: the program references scheme.base:* externals and the (scheme base)
# module is JIT'd / clang-linked alongside it.  The Chez-free behavior checks always
# run; a byte-identity-vs-Chez-driver check runs only when chez is present.
#
# (Value/exit-code parity of `emit run` vs the AOT driver across ALL demos lives in
# demos/run-embedded.sh; this suite covers the re-home-specific behaviors.)
#
# Run from the repo root: test/prelude-base-run-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

make emit >/dev/null 2>&1 || { echo "fatal: could not build build/emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

# run a program string through `emit run`; compare stdout to expected.
run_val () {  # name  source  expected  [extra emit run args...]
  local name="$1" src="$2" want="$3"; shift 3
  local got; got="$(printf '%s' "$src" | timeout 60 build/emit run "$@" 2>"$TMP/$name.err")"
  if [ "$got" = "$want" ]; then echo "  [OK  ] $name => $got"; pass=$((pass+1))
  else echo "  [FAIL] $name => ${got:-<none>}  (expected $want)"; sed 's/^/         /' "$TMP/$name.err"; fail=$((fail+1)); fi
}

# expect a non-zero exit and an "unbound" diagnostic (prelude name gone).
run_unbound () {  # name  source  [extra args...]
  local name="$1" src="$2"; shift 2
  local out rc
  out="$(printf '%s' "$src" | timeout 60 build/emit run "$@" 2>&1)"; rc=$?
  if [ "$rc" -ne 0 ] && printf '%s' "$out" | grep -qi "unbound"; then
    echo "  [OK  ] $name  (unbound, exit $rc)"; pass=$((pass+1))
  else echo "  [FAIL] $name  (rc=$rc, out=$out)"; fail=$((fail+1)); fi
}

echo "(scheme base) re-home on the embedded runner (emit run)"
run_val prelude-procs  '(map (lambda (x) (* x x)) (list 1 2 3 4))' '(1 4 9 16)'
run_val derived-macros '(when (< 1 2) (case 2 ((1) (quote a)) ((2) (quote b)) (else (quote c))))' 'b'
run_val user-shadow    '(define (map f xs) (quote mine)) (map car (list (list 1)))' 'mine'
run_unbound no-prelude '(map (lambda (x) x) (list 1 2 3))' --no-prelude
# a primitive still works under --no-prelude (proves only the prelude was dropped).
run_val no-prelude-prim '(+ 2 3)' '5' --no-prelude

echo "emit build AOT (in-process IR emit, clang links all units)"
compile_val () {  # name  source  expected  [extra emit build args...]
  local name="$1" src="$2" want="$3"; shift 3
  printf '%s\n' "$src" > "$TMP/$name.scm"
  # a minimal manifest with a program entry for this source (emit build is
  # manifest-entry-driven; the source path is repo-root-relative under $TMP).
  printf '((library (scheme base) (source "lib/scheme/base.sld"))\n (program %s (source "%s")))\n' \
    "$name" "$TMP/$name.scm" > "$TMP/$name.man.scm"
  if ! EMIT_VERBOSITY=quiet build/emit build "$name" --manifest "$TMP/$name.man.scm" -o "$TMP/$name" "$@" >"$TMP/$name.build" 2>&1; then
    echo "  [FAIL] $name  (build error)"; sed 's/^/         /' "$TMP/$name.build"; fail=$((fail+1)); return
  fi
  local got; got="$(timeout 60 "$TMP/$name" 2>/dev/null)"
  if [ "$got" = "$want" ]; then echo "  [OK  ] $name => $got"; pass=$((pass+1))
  else echo "  [FAIL] $name => ${got:-<none>}  (expected $want)"; fail=$((fail+1)); fi
}
compile_val aot-prelude    '(map (lambda (x) (+ x 1)) (list 4 5 6))' '(5 6 7)'
compile_val aot-no-prelude '(+ 40 2)' '42' --no-prelude

echo "(scheme base) is emitted exactly once"
emit="$TMP/emit.ll"
printf '%s' '(map (lambda (x) (+ x 1)) (list 1 2 3))' | build/emit run --emit > "$emit"
nmark="$(grep -c '^; ==EMIT-UNIT-BOUNDARY==$' "$emit")"
ninit="$(grep -c 'define i64 @"scheme.base:__init"' "$emit")"
if [ "$nmark" = "1" ] && [ "$ninit" = "1" ]; then
  echo "  [OK  ] one boundary marker, one scheme.base __init"; pass=$((pass+1))
else
  echo "  [FAIL] markers=$nmark scheme.base __inits=$ninit (want 1 and 1)"; fail=$((fail+1))
fi

# --no-prelude emits a single self-contained module (no marker, no scheme.base).
printf '%s' '(+ 1 2)' | build/emit run --emit --no-prelude > "$TMP/emit-np.ll"
if ! grep -q 'EMIT-UNIT-BOUNDARY' "$TMP/emit-np.ll" && ! grep -q 'scheme.base:' "$TMP/emit-np.ll"; then
  echo "  [OK  ] --no-prelude: one module, no (scheme base)"; pass=$((pass+1))
else
  echo "  [FAIL] --no-prelude emitted a marker or scheme.base reference"; fail=$((fail+1))
fi

# The committed bootstrap/scheme.base.ll (linked into every binary, incl. the
# compiler itself since compiler-bootstrap-rehome) must equal the (scheme base)
# module `emit run` emits AHEAD of a program -- same library, same core, no drift.
if [ -f bootstrap/scheme.base.ll ]; then
  awk '/^; ==EMIT-UNIT-BOUNDARY==$/{exit} {print}' "$emit" > "$TMP/base-inline.ll"
  build/emit run --emit < lib/scheme/base.sld > "$TMP/base-standalone.ll"
  if cmp -s "$TMP/base-inline.ll" "$TMP/base-standalone.ll" && cmp -s "$TMP/base-standalone.ll" bootstrap/scheme.base.ll; then
    echo "  [OK  ] scheme.base module: inline == standalone == committed bootstrap/scheme.base.ll"; pass=$((pass+1))
  else
    echo "  [FAIL] scheme.base.ll drift (inline vs standalone vs committed)"; fail=$((fail+1))
  fi
fi

# byte-identity of the re-homed PROGRAM module vs the Chez driver's prog.ll.
if command -v chez >/dev/null 2>&1; then
  echo "embedded-runner program IR == Chez driver prog.ll (byte-identical)"
  prog='(display (map (lambda (x) (* x x)) (list 1 2 3 4)))'
  printf '%s\n' "$prog" > "$TMP/p.scm"
  # embedded: program module is everything after the boundary marker.
  build/emit run --emit < "$TMP/p.scm" | awk 'f{print} /^; ==EMIT-UNIT-BOUNDARY==$/{f=1}' > "$TMP/p.emit.ll"
  # driver: build-modular-program writes <out>.ll (program module) beside the exe.
  chez --libdirs src --script src/compile.ss "$TMP/p.scm" -o "$TMP/p.drv" -q >/dev/null 2>&1
  grep -v '^target ' "$TMP/p.drv.ll" > "$TMP/p.drv.core.ll"   # strip the driver's host header
  if diff -q "$TMP/p.emit.ll" "$TMP/p.drv.core.ll" >/dev/null; then
    echo "  [OK  ] byte-identical program IR"; pass=$((pass+1))
  else
    echo "  [FAIL] program IR differs from the Chez driver"; diff "$TMP/p.emit.ll" "$TMP/p.drv.core.ll" | head; fail=$((fail+1))
  fi
else
  echo "  (chez absent -- skipping byte-identity-vs-driver check)"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
