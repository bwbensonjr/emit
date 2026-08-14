#!/usr/bin/env bash
# unit-pipeline-tests.sh -- the Chez-free doors' library-unit pipeline
# (change: chez-free-unit-pipeline).  Three claims, one seam:
#
#   SEEDING     every door takes its standard library from the baked set and its user
#               libraries from the manifest, and `--no-prelude` means the standard library
#               is not COMPILED, not merely unbound (issue #101).
#   CACHING     a user library is compiled once per (compiler, source content) and reused,
#               with the include closure part of "source" -- and every entry stays a pure
#               accelerator, so a corrupt or unreadable one is a miss and not an error.
#   SHAKING     `emit build` links units pruned to what the program reaches, the pruned
#               unit is cached against the program that produced it, and a pruned unit is
#               never served to an open-world door.
#
# EMIT_CACHE points every case at a scratch directory, so nothing here touches the
# developer's real cache and no case can be polluted by another.
#
# Chez-FREE: drives the shipped `build/emit` only.
set -u
cd "$(dirname "$0")/.."

EMIT=build/emit
make emit >/dev/null 2>&1 || { echo "failed to build $EMIT"; exit 1; }
EMIT_ABS="$PWD/$EMIT"

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# A project with one library that INCLUDES a fragment, one program that uses it, and one
# program that uses nothing but the standard library.
P="$TMP/proj"; mkdir -p "$P"
cat > "$P/util.sld" <<'EOF'
(define-library (demo util)
  (import (scheme base))
  (export double triple)
  (include "util-body.scm"))
EOF
cat > "$P/util-body.scm" <<'EOF'
(define (double x) (* x 2))
(define (triple x) (* x 3))
EOF
cat > "$P/hello.scm" <<'EOF'
(display "hello")
(newline)
EOF
cat > "$P/uses-lib.scm" <<'EOF'
(import (demo util))
(display (double 21))
(newline)
EOF
cat > "$P/emit-libs.scm" <<EOF
((library (demo util) (source "util.sld"))
 (program hello    (source "hello.scm")    (output "hello"))
 (program uses-lib (source "uses-lib.scm") (output "uses-lib")))
EOF

echo "unit pipeline: seeding parity, user-library caching, ship-door tree-shaking"

# --- seeding: --no-prelude compiles no standard library (issue #101) ----------------
# The observable is WORK, not bindings: the bindings were already right, which is why no
# test caught this.  With a manifest resolving, a session that compiles the baked set
# narrates it; one that does not, does not.
C="$TMP/c-seed"
noprelude_narration=$(cd "$P" && printf '(display 1)\n' \
  | EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" repl --no-prelude 2>&1)
if printf '%s' "$noprelude_narration" | grep -q "baked set"; then
  bad "emit repl --no-prelude touched the baked set: $(printf '%s' "$noprelude_narration" | grep 'baked set' | head -1)"
else
  ok "emit repl --no-prelude with a manifest compiles no baked member (issue #101)"
fi

# And it is fast: the cost of the discarded compile was 20x the whole session.  Compare
# against the same session with no manifest at all, which has always been the floor.
t_manifest=$( { cd "$P" && printf '(display 1)\n' \
  | EMIT_CACHE="$C" "$EMIT_ABS" repl --no-prelude >/dev/null 2>&1 ; } 2>&1; echo $SECONDS)
S0=$SECONDS
( cd "$P" && printf '(display 1)\n' | EMIT_CACHE="$C" "$EMIT_ABS" repl --no-prelude >/dev/null 2>&1 )
with_manifest=$((SECONDS - S0))
S0=$SECONDS
( cd "$TMP" && printf '(display 1)\n' | EMIT_CACHE="$C" "$EMIT_ABS" repl --no-prelude >/dev/null 2>&1 )
without_manifest=$((SECONDS - S0))
if [ "$with_manifest" -le $((without_manifest + 1)) ]; then
  ok "emit repl --no-prelude costs the same with a manifest as without (${with_manifest}s vs ${without_manifest}s)"
else
  bad "emit repl --no-prelude is slower with a manifest (${with_manifest}s vs ${without_manifest}s)"
fi

# The session is still a BARE one, and a standard-library name is still unbound.
out=$(cd "$P" && printf '(display (map car (list (list 1))))\n' \
  | EMIT_CACHE="$C" "$EMIT_ABS" repl --no-prelude 2>&1)
printf '%s' "$out" | grep -q "unbound variable map" \
  && ok "emit repl --no-prelude leaves standard-library names unbound" \
  || bad "emit repl --no-prelude bound map: $out"

# With the prelude, the same session HAS the standard library -- the manifest naming a
# baked member costs nothing either way.
out=$(cd "$P" && printf '(display (map (lambda (x) (* x 2)) (list 1 2)))\n' \
  | EMIT_CACHE="$C" "$EMIT_ABS" repl 2>&1)
printf '%s' "$out" | grep -q "(2 4)" \
  && ok "emit repl (prelude) resolves standard-library names in a project directory" \
  || bad "emit repl (prelude) lost the standard library: $out"

# Door parity: a manifest library that imports (scheme base) is unresolved under
# --no-prelude on BOTH doors, rather than silently satisfied on one of them.
repl_out=$(cd "$P" && printf '(display 1)\n' \
  | EMIT_CACHE="$C" "$EMIT_ABS" repl --no-prelude 2>&1)
run_out=$(cd "$P" && EMIT_CACHE="$C" "$EMIT_ABS" run --no-prelude uses-lib.scm 2>&1)
if printf '%s' "$repl_out" | grep -q "not loaded under --no-prelude" \
   && ! printf '%s' "$run_out" | grep -q "^42$"; then
  ok "--no-prelude: a library importing the standard library loads on neither door"
else
  bad "--no-prelude door parity: repl=[$repl_out] run=[$run_out]"
fi

# --- caching: a user library is compiled once ---------------------------------------
C="$TMP/c-unit"
cold=$(cd "$P" && EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" run uses-lib.scm 2>&1)
warm=$(cd "$P" && EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" run uses-lib.scm 2>&1)
printf '%s' "$cold" | grep -q "no entry for library demo.util" \
  && ok "cold cache: the user library is compiled and stored" \
  || bad "cold cache did not compile the user library: $cold"
printf '%s' "$warm" | grep -q "library demo.util.* reused" \
  && ok "warm cache: the user library is reused, not recompiled" \
  || bad "warm cache recompiled the user library: $warm"
[ "$(printf '%s' "$warm" | tail -1)" = "42" ] \
  && ok "warm cache: the program still produces its value" \
  || bad "warm cache changed the program's value"

# The load-bearing one: emitted IR must not depend on cache state.
C="$TMP/c-ir"
(cd "$P" && EMIT_CACHE="$C" "$EMIT_ABS" run --emit uses-lib.scm > "$TMP/ir-cold.ll" 2>/dev/null)
(cd "$P" && EMIT_CACHE="$C" "$EMIT_ABS" run --emit uses-lib.scm > "$TMP/ir-warm.ll" 2>/dev/null)
cmp -s "$TMP/ir-cold.ll" "$TMP/ir-warm.ll" \
  && ok "emitted IR is byte-identical cold vs warm with a user library" \
  || bad "emitted IR differs cold vs warm with a user library"

# --- caching: the include closure is part of the key --------------------------------
C="$TMP/c-incl"
(cd "$P" && EMIT_CACHE="$C" "$EMIT_ABS" run uses-lib.scm >/dev/null 2>&1)
touch "$P/util-body.scm"
out=$(cd "$P" && EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" run uses-lib.scm 2>&1)
printf '%s' "$out" | grep -q "library demo.util.* reused" \
  && ok "touching an included file without changing it does not invalidate (content, not mtime)" \
  || bad "a touch invalidated the entry: $out"

cat > "$P/util-body.scm" <<'EOF'
(define (double x) (+ x x x))
(define (triple x) (* x 3))
EOF
out=$(cd "$P" && EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" run uses-lib.scm 2>&1)
if printf '%s' "$out" | grep -q "source changed for library demo.util" \
   && [ "$(printf '%s' "$out" | tail -1)" = "63" ]; then
  ok "editing an INCLUDED file invalidates the entry and the program sees the change"
else
  bad "an edited include was not noticed: $out"
fi
# restore
cat > "$P/util-body.scm" <<'EOF'
(define (double x) (* x 2))
(define (triple x) (* x 3))
EOF

# --- degradation: every cache failure still produces the right answer ----------------
out=$(cd "$P" && EMIT_CACHE=/nonexistent/unwritable "$EMIT_ABS" run uses-lib.scm 2>/dev/null)
[ "$out" = "42" ] && ok "an unwritable cache location still runs a program with a user library" \
                  || bad "unwritable cache broke the run: [$out]"

C="$TMP/c-corrupt"
(cd "$P" && EMIT_CACHE="$C" "$EMIT_ABS" run uses-lib.scm >/dev/null 2>&1)
for f in "$C"/unit-*.ll; do printf 'not IR at all' > "$f"; done
out=$(cd "$P" && EMIT_CACHE="$C" "$EMIT_ABS" run uses-lib.scm 2>/dev/null)
[ "$out" = "42" ] && ok "a corrupt unit entry is a miss, not an error" \
                  || bad "a corrupt unit entry broke the run: [$out]"

# --- shaking: emit build links pruned units -----------------------------------------
C="$TMP/c-build"
(cd "$P" && EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" build hello > "$TMP/build1.log" 2>&1)
if [ -x "$P/hello" ]; then
  hello_bytes=$(stat -f%z "$P/hello" 2>/dev/null || stat -c%s "$P/hello")
  [ "$(cd "$P" && ./hello)" = "hello" ] \
    && ok "a shaken executable runs and produces its value ($hello_bytes bytes)" \
    || bad "a shaken executable changed the program's output"
  # The whole standard library is ~590 KB of IR; a hello-world that links it lands near
  # 210 KB, and one pruned to what it reaches near 95 KB.  The bound is deliberately loose
  # -- it is asserting that a shake HAPPENED, not a byte count that will drift.
  if [ "$hello_bytes" -lt 150000 ]; then
    ok "the delivered executable is pruned, not the whole standard library ($hello_bytes bytes)"
  else
    bad "the delivered executable looks unshaken ($hello_bytes bytes)"
  fi
else
  bad "emit build produced no executable"; cat "$TMP/build1.log" | tail -5
fi
grep -q "kept whole (another unit imports it)" "$TMP/build1.log" \
  && ok "a unit another unit imports is kept whole (the prunability rule)" \
  || bad "the substrate was not kept whole: $(tail -3 "$TMP/build1.log")"

# Rebuilding the same program reuses the pruned unit rather than pruning again.
(cd "$P" && EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" build hello > "$TMP/build2.log" 2>&1)
grep -q "pruned scheme.base.* reused" "$TMP/build2.log" \
  && ok "rebuilding the same program reuses its pruned unit" \
  || bad "a rebuild pruned again: $(grep -i shake "$TMP/build2.log" | head -2)"

# A program reaching a different set of bindings gets its own pruned unit, not that one.
(cd "$P" && EMIT_CACHE="$C" EMIT_VERBOSITY=verbose "$EMIT_ABS" build uses-lib > "$TMP/build3.log" 2>&1)
if [ -x "$P/uses-lib" ] && [ "$(cd "$P" && ./uses-lib)" = "42" ]; then
  ok "a program importing a user library builds and runs shaken"
else
  bad "the user-library program failed to build or run"; tail -5 "$TMP/build3.log"
fi
grep -q "pruned demo.util" "$TMP/build3.log" \
  && ok "the user library is pruned to what its importer reaches" \
  || bad "the user library was not pruned: $(grep -i shake "$TMP/build3.log" | head -3)"

# --- shaking: a pruned unit is never served to an open-world door --------------------
# The cache now holds `shake-` entries for this compiler.  A REPL session must still get
# whole units: every binding stays available regardless of what any program referenced.
# The probe must use bindings the BUILT program did not reach -- `hello` reaches display and
# newline and nothing else, so a session served its pruned unit would lose these.
out=$(cd "$P" && printf '(display (list (assq (quote b) (list (cons (quote a) 1) (cons (quote b) 2))) (vector-ref (vector 7 8) 1) (list-tail (list 1 2 3) 2)))\n' \
  | EMIT_CACHE="$C" "$EMIT_ABS" repl 2>&1)
printf '%s' "$out" | grep -q "((b . 2) 8 (3))" \
  && ok "a REPL session after a build still has the whole standard library" \
  || bad "the REPL was served a pruned unit: $out"

out=$(cd "$P" && EMIT_CACHE="$C" "$EMIT_ABS" run uses-lib.scm 2>/dev/null)
[ "$out" = "42" ] && ok "emit run after a build still links whole units" \
                  || bad "emit run was served a pruned unit: [$out]"

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
