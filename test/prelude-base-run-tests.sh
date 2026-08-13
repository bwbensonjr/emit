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
# `case` with the R7RS 4.2.1 `=>` RECEIVER clause (change: r7rs-lexical-conformance,
# issue #81): the selected clause's expression is applied to THE KEY.  `cond` has had
# this; `case` reported `unbound variable =>`, because no rule matched the shape and the
# `=>` fell through as an ordinary expression.
run_val case-else-receiver \
  '(case (car (quote (c d))) ((a e i o u) (quote vowel)) ((w y) (quote semivowel)) (else => (lambda (x) x)))' \
  'c'
run_val case-clause-receiver \
  '(case 2 ((1) (quote a)) ((2 3) => (lambda (x) (* x 10))) (else (quote c)))' '20'
# The receiver must not re-evaluate the key expression: it receives the temp the
# compound-KEY rule already bound.  The counter says so.
run_val case-key-evaluated-once \
  '(define n 0) (define (bump) (set! n (+ n 1)) 2) (define r (case (bump) ((2) => (lambda (x) x)) (else (quote no)))) (list r n)' \
  '(2 1)'
# ... and the non-receiver clause forms still behave, since the new rules sit in front
# of the ones they would otherwise be shadowed by.
run_val case-non-receiver-unchanged \
  '(list (case 9 ((1) (quote a)) (else (quote c))) (case 2 ((1) (quote a)) ((2 3) (quote b)) (else (quote c))))' \
  '(c b)'
run_val user-shadow    '(define (map f xs) (quote mine)) (map car (list (list 1)))' 'mine'
run_unbound no-prelude '(map (lambda (x) x) (list 1 2 3))' --no-prelude
# a primitive still works under --no-prelude (proves only the prelude was dropped).
run_val no-prelude-prim '(+ 2 3)' '5' --no-prelude

# The DECLARED surface (change: scheme-base-declared-surface, GitHub issue #29): the
# prelude's internal helpers are in the library BODY but NOT in the export list, so the
# auto-import no longer puts them in every program's scope.  This is the issue's own
# repro -- it printed four procedures before the surface was curated.
echo "declared surface: prelude internals are not auto-imported"
run_unbound private-reader '(display rd-atom)'
run_unbound private-list   '(display %map1)'
run_unbound private-port   '(display %port-buf)'
run_unbound private-state  '(display *winds*)'
# the public names beside them still resolve, and the exported procedures that CALL the
# private helpers still work -- only the export list shrank, not the library body.  With
# the substrate in place (change: scheme-base-partition) `read-from-string` also proves
# something new: its reader now lives in ANOTHER unit, so this exercises (scheme base)
# calling across a baked-library boundary.
run_val surface-public  '(list (map car (list (list 1))) (read-from-string "(1 2)"))' \
        '((1) (1 2))'
# rd-skip-ws and rd-token-end used to be exported on purpose -- the `unstable` tier, for
# the REPL's input-completeness probe.  The tier is retired (issue #32): the probe imports
# (emit internal) directly, so these are ordinary internals again and must be unbound in a
# program, like every other reader helper above.
run_unbound private-lexeme   '(display rd-skip-ws)'
run_unbound private-tokenend '(display rd-token-end)'
# The substrate is not auto-imported, which is the whole reason it can hold these names
# without publishing them: naming it is the only way in, and a program that does not name
# it sees nothing new.
run_unbound private-makeport '(display %make-port)'

echo "emit build AOT (in-process IR emit, clang links all units)"
compile_val () {  # name  source  expected  [extra emit build args...]
  local name="$1" src="$2" want="$3"; shift 3
  printf '%s\n' "$src" > "$TMP/$name.scm"
  # a minimal manifest with a program entry for this source (emit build is
  # manifest-entry-driven).  The manifest lives in $TMP and a manifest's relative paths
  # resolve against its own directory (change: manifest-search-path), so name the
  # repo's library absolutely.
  printf '((library (emit internal) (source "%s/lib/emit/internal.sld"))\n (library (scheme base) (source "%s/lib/scheme/base.sld"))\n (program %s (source "%s")))\n' \
    "$PWD" "$PWD" "$name" "$TMP/$name.scm" > "$TMP/$name.man.scm"
  if ! EMIT_VERBOSITY=quiet build/emit build "$name" --manifest "$TMP/$name.man.scm" -o "$TMP/$name" "$@" >"$TMP/$name.build" 2>&1; then
    echo "  [FAIL] $name  (build error)"; sed 's/^/         /' "$TMP/$name.build"; fail=$((fail+1)); return
  fi
  local got; got="$(timeout 60 "$TMP/$name" 2>/dev/null)"
  if [ "$got" = "$want" ]; then echo "  [OK  ] $name => $got"; pass=$((pass+1))
  else echo "  [FAIL] $name => ${got:-<none>}  (expected $want)"; fail=$((fail+1)); fi
}
compile_val aot-prelude    '(map (lambda (x) (+ x 1)) (list 4 5 6))' '(5 6 7)'
compile_val aot-no-prelude '(+ 40 2)' '42' --no-prelude

# The baked set is a PARTITION (change: scheme-base-partition), so the stream is one module
# per baked member and then the program: N markers for N members, not 1 for 1.  Each member
# is emitted, and initialized, exactly ONCE -- which is what this always checked.
#
# The member list is read out of the EMITTED IR (a unit's initializer is
# `@"<unit>:__init"`; a program emits @scheme_entry and has none), rather than by parsing
# *prelude-libraries* here.  That keeps the assertion on the artifact instead of on a second
# transcription of the declaration, and it extends to a new member with no edit.
# the LAST part of an --emit stream: the program module (one marker per baked member).
prog_last () { awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n = 0; delete L; next } { L[++n] = $0 }
                    END { for (i = 1; i <= n; i++) print L[i] }' "$1"; }

echo "each baked library is emitted exactly once"
emit="$TMP/emit.ll"
printf '%s' '(map (lambda (x) (+ x 1)) (list 1 2 3))' | build/emit run --emit > "$emit"
nmark="$(grep -c '^; ==EMIT-UNIT-BOUNDARY==$' "$emit")"
inits="$(grep -o 'define i64 @"[^"]*:__init"' "$emit" | sed 's/.*@"//; s/:__init"$//' | sort)"
ninit="$(printf '%s\n' "$inits" | grep -c .)"
nuniq="$(printf '%s\n' "$inits" | sort -u | grep -c .)"
if [ "$ninit" = "$nuniq" ] && [ "$nmark" = "$nuniq" ] && [ "$nuniq" -ge 1 ]; then
  echo "  [OK  ] $nmark boundary marker(s), $nuniq baked librar$([ "$nuniq" = 1 ] && echo y || echo ies), one __init each ($(echo $inits))"
  pass=$((pass+1))
else
  echo "  [FAIL] markers=$nmark, __inits=$ninit over $nuniq librar$([ "$nuniq" = 1 ] && echo y || echo ies) ($(echo $inits)) -- want markers == libraries and one __init each"
  fail=$((fail+1))
fi

# The baked set initializes in DEPENDENCY order: a member's __init runs after everything it
# imports.  The program's @scheme_entry drives the calls, so their order in the program
# module IS the init order -- and (emit internal) must be called before (scheme base),
# which imports it.  Asserted directly because getting it backwards would leave
# (scheme base)'s body calling into an uninitialized unit, which fails at run time and
# nowhere earlier (change: scheme-base-partition).
order="$(prog_last "$emit" | grep -o 'call i64 @"[a-z.]*:__init"' \
          | sed 's/.*@"//; s/:__init"//' | tr '\n' ' ')"
if [ "$order" = "emit.internal scheme.base " ]; then
  echo "  [OK  ] baked __init calls are in dependency order: $order"; pass=$((pass+1))
else
  echo "  [FAIL] baked __init order is [$order] (want 'emit.internal scheme.base ')"; fail=$((fail+1))
fi

# --no-prelude emits a single self-contained module (no marker, no scheme.base).
printf '%s' '(+ 1 2)' | build/emit run --emit --no-prelude > "$TMP/emit-np.ll"
if ! grep -q 'EMIT-UNIT-BOUNDARY' "$TMP/emit-np.ll" && ! grep -q 'scheme.base:' "$TMP/emit-np.ll"; then
  echo "  [OK  ] --no-prelude: one module, no (scheme base)"; pass=$((pass+1))
else
  echo "  [FAIL] --no-prelude emitted a marker or scheme.base reference"; fail=$((fail+1))
fi

# The committed baked IR (linked into every binary, incl. the compiler itself since
# compiler-bootstrap-rehome) must equal the modules `emit run` emits AHEAD of a program --
# same libraries, same core, no drift.
#
# The comparison used to include a THIRD derivation, `emit run --emit < base.sld`, which is
# gone: a baked member may import another, and the lone-define-library path resolves no
# imports, so the set only comes out of a whole-program compile (change:
# scheme-base-partition).  BAKED_LL below is the committed IR in dependency order --
# KEEP IN SYNC with tools/regen.sh and the Makefile.
BAKED_LL="bootstrap/emit.internal.ll bootstrap/scheme.base.ll"
have_all=1
for ll in $BAKED_LL; do [ -f "$ll" ] || have_all=0; done
if [ "$have_all" = 1 ]; then
  ok=1; i=0
  for ll in $BAKED_LL; do
    i=$((i + 1))
    awk -v want="$i" 'BEGIN { p = 1 }
      /^; ==EMIT-UNIT-BOUNDARY==$/ { p++; next }
      p == want { print }' "$emit" > "$TMP/inline-$i.ll"
    cmp -s "$TMP/inline-$i.ll" "$ll" || { ok=0; echo "         drift: $ll"; }
  done
  [ "$i" = "$nmark" ] || { ok=0; echo "         $nmark module(s) emitted, $i committed"; }
  if [ "$ok" = 1 ]; then
    echo "  [OK  ] baked modules inline == committed ($i librar$([ "$i" = 1 ] && echo y || echo ies))"
    pass=$((pass+1))
  else
    echo "  [FAIL] baked IR drift (inline vs committed)"; fail=$((fail+1))
  fi
fi

# byte-identity of the re-homed PROGRAM module vs the Chez driver's prog.ll.
if command -v chez >/dev/null 2>&1; then
  echo "embedded-runner program IR == Chez driver prog.ll (byte-identical)"
  prog='(display (map (lambda (x) (* x x)) (list 1 2 3 4)))'
  printf '%s\n' "$prog" > "$TMP/p.scm"
  # embedded: the program module is the LAST part -- everything after the last boundary
  # marker.  With a partitioned baked set there is one marker per member, so "after the
  # first" would hand back a library (change: scheme-base-partition).
  build/emit run --emit < "$TMP/p.scm" \
    | awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n = 0; delete L; next } { L[++n] = $0 }
           END { for (i = 1; i <= n; i++) print L[i] }' > "$TMP/p.emit.ll"
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
