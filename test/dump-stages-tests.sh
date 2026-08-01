#!/usr/bin/env bash
# dump-stages-tests.sh -- `--dump` on the SHIPPED binary, Chez-free (change:
# emit-dump-stages).  Per-pass IL inspection used to live only in the Chez driver, so
# this suite is the regression guard for the capability that replaced it: every door
# dumps, every path's stages are covered, and turning dumping on changes nothing a
# door writes to stdout or to an artifact.
#
# The dump-vs-Chez-driver PARITY check is the Chez-gated other half, in
# test/dump-parity-tests.sh (run by run-dev-tests.sh).
#
# Run from the repo root: test/dump-stages-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

make emit >/dev/null 2>&1 || { echo "fatal: could not build build/emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

ok   () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad  () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# A program with macros, a closure, a captured mutable, and an import -- so the dump
# exercises expand, convert-closures, convert-assignments, and the modular path.
cat > "$TMP/prog.scm" <<'EOF'
(define (counter)
  (let ([n 0])
    (lambda () (set! n (+ n 1)) n)))
(define c (counter))
(c)
(cond [(< 1 2) (map (lambda (x) (* x x)) (list (c) (c)))]
      [else (quote no)])
EOF

# headers seen in a dump stream (the REPL writes its prompt to stderr with no
# newline, so the marker is not always at line start).
headers () { grep -o ';; ==== after [^=]*====' "$1" | sed 's/;; ==== after //; s/ *====$//'; }

echo "stage coverage"

# 1. The modular path (every door takes it once (scheme base) is auto-imported) must
#    show all eight stages, in ladder order -- three of them were run but never
#    dumped before this change, and `simplify` joined the ladder with change
#    simplify-known-calls.
build/emit run --dump "$TMP/prog.scm" >"$TMP/run.out" 2>"$TMP/run.err"
got="$(headers "$TMP/run.err" | tr '\n' ' ')"
want="collect-toplevel expand parse+rename+imports recognize-let convert-assignments simplify convert-closures lower "
if [ "$got" = "$want" ]; then ok "emit run --dump: eight stages in ladder order"
else bad "emit run --dump stages: got [$got] want [$want]"; fi

# 2. The program's value still lands on stdout, unpolluted by narration.
if [ "$(cat "$TMP/run.out")" = "(4 9)" ]; then ok "emit run --dump: value on stdout is (4 9)"
else bad "emit run --dump: stdout was [$(cat "$TMP/run.out")], expected (4 9)"; fi

# 3. Library units are NOT dumped by default (design D7): plain --dump must not bury
#    the program under (scheme base)'s stages.
if ! grep -q 'unit (scheme base)' "$TMP/run.err"; then ok "--dump: no (scheme base) stages (D7 default)"
else bad "--dump leaked (scheme base) stages"; fi

# 4. --dump-all opts them in, each tagged with its unit AND its define (design D8).
build/emit run --dump-all "$TMP/prog.scm" >/dev/null 2>"$TMP/all.err"
n_base="$(grep -c 'unit (scheme base)' "$TMP/all.err" || true)"
if [ "$n_base" -gt 100 ] && grep -q 'after lower \[define map\] \[unit (scheme base)\]' "$TMP/all.err"; then
  ok "--dump-all: $n_base tagged (scheme base) headers"
else bad "--dump-all: expected many per-define (scheme base) headers, got $n_base"; fi

# 5. emit lib: per-define stages for the library under inspection (compile-library
#    took a dump parameter and ignored it before this change).
build/emit lib test/modules/mylib.sld -o "$TMP/lib" --dump >/dev/null 2>"$TMP/lib.err"
if headers "$TMP/lib.err" | grep -q '^parse+rename \[define helper\]$' &&
   headers "$TMP/lib.err" | grep -q '^lower \[define make-adder\]$'; then
  ok "emit lib --dump: per-define stages, tagged"
else bad "emit lib --dump: missing per-define tagged stages"; fi

# 6. The REPL dumps each entered form, tagged by define name / session index.
printf '(define (sq n) (* n n))\n(sq 9)\n' | build/emit repl --dump --no-prelude \
  >"$TMP/repl.out" 2>"$TMP/repl.err"
if headers "$TMP/repl.err" | grep -q '^parse+rename \[define sq\]$' &&
   headers "$TMP/repl.err" | grep -q '^lower \[form 2\]$' &&
   grep -q '81' "$TMP/repl.out"; then
  ok "emit repl --dump: per-form stages, session unaffected"
else bad "emit repl --dump: missing per-form stages or wrong session output"; fi

# 7. Level 1 (EMIT_VERBOSITY=verbose, no --dump) is the concise trace, no IL.
EMIT_VERBOSITY=verbose build/emit run "$TMP/prog.scm" >/dev/null 2>"$TMP/v.err"
if grep -q '^  stage lower$' "$TMP/v.err" && ! grep -q '==== after' "$TMP/v.err"; then
  ok "EMIT_VERBOSITY=verbose: stage names only"
else bad "EMIT_VERBOSITY=verbose: expected stage names and no IL dump"; fi

echo "dumping changes no output byte (design D6)"

# 8. `emit run --emit`: the bootstrap-critical one.  regen drives the compiler
#    through this, and the trust-check compares its bytes.
build/emit run --emit  <"$TMP/prog.scm" >"$TMP/plain.ll" 2>/dev/null
build/emit run --emit --dump <"$TMP/prog.scm" >"$TMP/dumped.ll" 2>/dev/null
if cmp -s "$TMP/plain.ll" "$TMP/dumped.ll" && [ -s "$TMP/plain.ll" ]; then
  ok "emit run --emit: stdout byte-identical with --dump ($(wc -c <"$TMP/plain.ll" | tr -d ' ') bytes)"
else bad "emit run --emit: --dump perturbed the emitted IR"; fi

# 9. --dump-all too (it compiles the same units, just narrates more of them).
build/emit run --emit --dump-all <"$TMP/prog.scm" >"$TMP/dumped-all.ll" 2>/dev/null
if cmp -s "$TMP/plain.ll" "$TMP/dumped-all.ll"; then ok "emit run --emit: byte-identical with --dump-all"
else bad "emit run --emit: --dump-all perturbed the emitted IR"; fi

# 10. emit lib artifacts: both the unit IR and the .exports sidecar.
build/emit lib test/modules/mylib.sld -o "$TMP/lib2" >/dev/null 2>/dev/null
if cmp -s "$TMP/lib/mylib.ll" "$TMP/lib2/mylib.ll" &&
   cmp -s "$TMP/lib/mylib.exports" "$TMP/lib2/mylib.exports"; then
  ok "emit lib: .ll + .exports byte-identical with --dump"
else bad "emit lib: --dump perturbed an artifact"; fi

# 11. emit build: compare the emitted IR and the delivered exe's BEHAVIOR, not the
#     exe bytes -- two identical `emit build` runs already differ (Mach-O LC_UUID,
#     and even in size), so exe byte-identity is not a property the linker provides.
printf '((library (scheme base) (source "lib/scheme/base.sld"))\n (program dumpprog (source "%s")))\n' \
  "$TMP/prog.scm" > "$TMP/man.scm"
EMIT_VERBOSITY=quiet build/emit build dumpprog --manifest "$TMP/man.scm" -o "$TMP/exe" \
  >/dev/null 2>&1
EMIT_VERBOSITY=quiet build/emit build dumpprog --manifest "$TMP/man.scm" -o "$TMP/exe-dump" \
  --dump >/dev/null 2>"$TMP/build.err"
a="$("$TMP/exe" 2>/dev/null)"; b="$("$TMP/exe-dump" 2>/dev/null)"
if [ "$a" = "$b" ] && [ "$a" = "(4 9)" ] && grep -q '==== after lower' "$TMP/build.err"; then
  ok "emit build --dump: dumps, and the delivered exe still prints $a"
else bad "emit build --dump: exe output [$b] vs [$a], or no stages dumped"; fi

# 12. Quiet must silence BOTH sides -- the C++ host and the embedded compiler.
EMIT_VERBOSITY=quiet build/emit run "$TMP/prog.scm" >/dev/null 2>"$TMP/q.err"
if [ ! -s "$TMP/q.err" ]; then ok "EMIT_VERBOSITY=quiet: no narration at all"
else bad "EMIT_VERBOSITY=quiet: stderr not empty ($(wc -l <"$TMP/q.err" | tr -d ' ') lines)"; fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
