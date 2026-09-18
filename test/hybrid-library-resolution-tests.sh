#!/usr/bin/env bash
# hybrid-library-resolution-tests.sh -- conventional and exact library providers.
set -u
cd "$(dirname "$0")/.."

make emit >/dev/null 2>&1 || { echo "failed to build build/emit"; exit 1; }
EMIT="$PWD/build/emit"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0
fail=0

ok () { echo "  [OK  ] $1"; pass=$((pass + 1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail + 1)); }

for verb in run repl build lib; do
  help="$("$EMIT" "$verb" --help)"
  if echo "$help" | grep -q -- '--library-path' \
    && echo "$help" | grep -q 'EMIT_LIBRARY_PATH' \
    && echo "$help" | grep -q '(my stats).*my/stats.sld' \
    && echo "$help" | grep -q -- '--no-library-paths'; then
    ok "$verb help explains conventional library roots"
  else
    bad "$verb help omits hybrid resolver controls"
  fi
done

mkdir -p "$TMP/project/lib/my" "$TMP/project/lib/example/net" \
  "$TMP/project/lib/app" "$TMP/explicit/installed" "$TMP/project/vendor" \
  "$TMP/first/my" "$TMP/second/my"

printf '(+ 20 22)\n' > "$TMP/project/one.scm"
if (cd "$TMP/project" && EMIT_VERBOSITY=quiet "$EMIT" build one.scm) \
  >"$TMP/one-build.log" 2>&1 \
  && [ "$("$TMP/project/build/one" 2>/dev/null)" = "42" ]; then
  ok "one-file application builds without a manifest entry"
else
  bad "one-file direct build"
fi

cat > "$TMP/project/lib/my/stats.sld" <<'EOF'
(define-library (my stats)
  (import (scheme base))
  (export answer)
  (begin (define answer 42)))
EOF

cat > "$TMP/project/lib/example/net/2.sld" <<'EOF'
(define-library (example net 2)
  (import (scheme base))
  (export numbered)
  (begin (define numbered 2)))
EOF

cat > "$TMP/project/basic.scm" <<'EOF'
(import (my stats) (example net 2))
(+ answer numbered)
EOF

got="$(cd "$TMP/project" && "$EMIT" run basic.scm 2>"$TMP/basic.err")"
if [ "$got" = "44" ]; then ok "project lib maps names and integer components"
else bad "project lib maps names and integer components => [$got]"; fi

cat > "$TMP/project/same-manifest.scm" <<'EOF'
((library (my stats) (source "lib/my/stats.sld")))
EOF
(cd "$TMP/project" && EMIT_VERBOSITY=quiet "$EMIT" run --emit basic.scm) \
  >"$TMP/path.ir" 2>"$TMP/path-ir.err"
(cd "$TMP/project" && EMIT_VERBOSITY=quiet "$EMIT" run --emit basic.scm \
  --manifest same-manifest.scm --no-manifest-chain) \
  >"$TMP/manifest.ir" 2>"$TMP/manifest-ir.err"
cmp -s "$TMP/path.ir" "$TMP/manifest.ir" \
  && ok "manifest and path providers produce byte-identical IR" \
  || bad "manifest and path provider IR differs"

# The first explicit root wins, and a repeated physical root is harmless.
sed 's/42/10/' "$TMP/project/lib/my/stats.sld" > "$TMP/first/my/stats.sld"
sed 's/42/20/' "$TMP/project/lib/my/stats.sld" > "$TMP/second/my/stats.sld"
got="$(cd "$TMP/project" && "$EMIT" run -L "$TMP/first" \
  --library-path "$TMP/first/../first" -L "$TMP/second" basic.scm 2>"$TMP/roots.err")"
if [ "$got" = "12" ]; then ok "explicit roots preserve order and deduplicate"
else bad "explicit roots preserve order and deduplicate => [$got]"; fi

# An exact mapping outranks a conventional answer for the same name.
sed 's/42/100/' "$TMP/project/lib/my/stats.sld" > "$TMP/project/vendor/stats.sld"
cat > "$TMP/project/emit-libs.scm" <<'EOF'
((library (my stats) (source "vendor/stats.sld")))
EOF
got="$(cd "$TMP/project" && "$EMIT" run basic.scm 2>"$TMP/override.err")"
if [ "$got" = "102" ]; then ok "exact manifest mapping overrides project lib"
else bad "exact manifest mapping overrides project lib => [$got]"; fi

# Unsafe names remain available through exact mappings and never become paths.
cat > "$TMP/project/vendor/unsafe.sld" <<'EOF'
(define-library (|unsafe/name|)
  (import (scheme base))
  (export safe-value)
  (begin (define safe-value 7)))
EOF
cat > "$TMP/project/unsafe.scm" <<'EOF'
(import (|unsafe/name|))
safe-value
EOF
cat > "$TMP/project/unsafe-manifest.scm" <<'EOF'
((library (|unsafe/name|) (source "vendor/unsafe.sld")))
EOF
got="$(cd "$TMP/project" && "$EMIT" run --manifest unsafe-manifest.scm \
  --no-manifest-chain unsafe.scm 2>"$TMP/unsafe.err")"
if [ "$got" = "7" ]; then ok "unsafe component resolves only through an exact mapping"
else bad "unsafe component exact mapping => [$got]"; fi

mkdir -p "$TMP/project/lib/unsafe"
cp "$TMP/project/vendor/unsafe.sld" "$TMP/project/lib/unsafe/name.sld"
printf '()\n' > "$TMP/project/empty-manifest.scm"
if (cd "$TMP/project" && "$EMIT" run --manifest empty-manifest.scm \
  --no-manifest-chain unsafe.scm) >"$TMP/unsafe-path.out" 2>"$TMP/unsafe-path.err"; then
  bad "unsafe component does not probe a derived path"
else
  ok "unsafe component without an exact mapping is unresolved"
fi

if (cd "$TMP/project" && "$EMIT" run --manifest empty-manifest.scm \
  --no-manifest-chain --no-library-paths basic.scm) \
  >"$TMP/no-paths.out" 2>"$TMP/no-paths.err"; then
  bad "--no-library-paths disables conventional lookup"
else
  ok "--no-library-paths preserves manifest-only operation"
fi

got="$(cd "$TMP/project" && EMIT_LIBRARY_PATH="$TMP/second" \
  "$EMIT" run --manifest empty-manifest.scm --no-manifest-chain basic.scm \
  2>"$TMP/environment.err")"
if [ "$got" = "22" ]; then ok "EMIT_LIBRARY_PATH precedes the project root"
else bad "EMIT_LIBRARY_PATH precedence => [$got]"; fi

if (cd "$TMP/project" && EMIT_LIBRARY_PATH="$TMP/first::$TMP/second" \
  "$EMIT" run basic.scm) >"$TMP/empty-env.out" 2>"$TMP/empty-env.err"; then
  bad "empty EMIT_LIBRARY_PATH element is rejected"
elif grep -q 'empty element' "$TMP/empty-env.err"; then
  ok "empty EMIT_LIBRARY_PATH element is diagnosed"
else
  bad "empty EMIT_LIBRARY_PATH diagnostic"
fi

(cd "$TMP/project" && "$EMIT" run --manifest empty-manifest.scm \
  --no-manifest-chain basic.scm) >"$TMP/narration.out" 2>"$TMP/narration.err"
if grep -q 'resolve library (my stats).*\[directory ' "$TMP/narration.err" \
  && [ "$(cat "$TMP/narration.out")" = "44" ]; then
  ok "default resolver narration names library, source, and provider"
else
  bad "default resolver narration"
fi
(cd "$TMP/project" && EMIT_VERBOSITY=verbose "$EMIT" run \
  --manifest empty-manifest.scm --no-manifest-chain basic.scm) \
  >"$TMP/verbose.out" 2>"$TMP/verbose.err"
grep -q 'library root .*\[project\]' "$TMP/verbose.err" \
  && ok "verbose resolver narration names configured roots" \
  || bad "verbose resolver root narration"
(cd "$TMP/project" && EMIT_VERBOSITY=quiet "$EMIT" run \
  --manifest empty-manifest.scm --no-manifest-chain basic.scm) \
  >"$TMP/quiet.out" 2>"$TMP/quiet.err"
if [ ! -s "$TMP/quiet.err" ] && cmp -s "$TMP/quiet.out" "$TMP/narration.out"; then
  ok "quiet omits resolver narration without changing stdout"
else
  bad "quiet resolver narration or stdout"
fi

# The selected path must declare the requested name.
cat > "$TMP/project/lib/my/mismatch.sld" <<'EOF'
(define-library (other mismatch)
  (import (scheme base))
  (export wrong)
  (begin (define wrong 1)))
EOF
printf '(import (my mismatch))\nwrong\n' > "$TMP/project/mismatch.scm"
if (cd "$TMP/project" && "$EMIT" run mismatch.scm) >"$TMP/mismatch.out" 2>"$TMP/mismatch.err"; then
  bad "declaration mismatch is rejected"
elif grep -q '(my mismatch)' "$TMP/mismatch.err" \
  && grep -q '(other mismatch)' "$TMP/mismatch.err" \
  && grep -q 'my/mismatch.sld' "$TMP/mismatch.err"; then
  ok "declaration mismatch names request, declaration, and source"
else
  bad "declaration mismatch diagnostic"
fi

printf '(import (my mismatch))\n(+ 1 2)\n' > "$TMP/mismatch-repl.in"
repl_after_error="$(cd "$TMP/project" && "$EMIT" repl \
  < "$TMP/mismatch-repl.in" 2>"$TMP/mismatch-repl.err")"
if echo "$repl_after_error" | grep -q '3' \
  && grep -q '(my mismatch)' "$TMP/mismatch-repl.err"; then
  ok "failed on-demand validation leaves the REPL usable"
else
  bad "REPL after failed on-demand validation"
fi

mkdir -p "$TMP/project/lib/failing"
cat > "$TMP/project/lib/failing/init.sld" <<'EOF'
(define-library (failing init)
  (import (scheme base))
  (export value)
  (begin
    (define value (error "initializer failed"))))
EOF
printf '(import (failing init))\nvalue\n(+ 1 2)\n' > "$TMP/init-fail.in"
init_out="$(cd "$TMP/project" && "$EMIT" repl \
  < "$TMP/init-fail.in" 2>"$TMP/init-fail.err")"
if echo "$init_out" | grep -q '3' \
  && grep -q 'unbound variable value' "$TMP/init-fail.err"; then
  ok "failed initialization merges no names and leaves the REPL usable"
else
  bad "REPL after failed library initialization"
fi

mkdir -p "$TMP/project/lib/unused"
printf '(define-library (unused bad) (this is malformed)\n' \
  > "$TMP/project/lib/unused/bad.sld"
printf '(+ 2 3)\n' > "$TMP/unused-repl.in"
unused_out="$(cd "$TMP/project" && "$EMIT" repl \
  < "$TMP/unused-repl.in" 2>"$TMP/unused-repl.err")"
if echo "$unused_out" | grep -q '5' \
  && ! grep -q 'unused/bad.sld' "$TMP/unused-repl.err"; then
  ok "REPL startup does not read an unused conventional library"
else
  bad "REPL touched an unused conventional library"
fi

# One graph deliberately crosses all three non-baked provider kinds.
cat > "$TMP/explicit/installed/helper.sld" <<'EOF'
(define-library (installed helper)
  (import (scheme base))
  (export installed-value)
  (begin (define installed-value 30)))
EOF
cat > "$TMP/project/vendor/exception.sld" <<'EOF'
(define-library (odd exception)
  (import (scheme base))
  (export exception-value)
  (begin (define exception-value 5)))
EOF
cat > "$TMP/project/lib/app/report.sld" <<'EOF'
(define-library (app report)
  (import (scheme base) (installed helper) (odd exception))
  (export report-value)
  (begin (define report-value (+ installed-value exception-value))))
EOF
cat > "$TMP/project/main.scm" <<'EOF'
(import (app report))
report-value
EOF
cat > "$TMP/project/emit-libs.scm" <<'EOF'
((library (odd exception) (source "vendor/exception.sld")))
EOF

got="$(cd "$TMP/project" && "$EMIT" run -L "$TMP/explicit" main.scm 2>"$TMP/mixed-run.err")"
[ "$got" = "35" ] && ok "mixed provider graph runs dependency-first" \
  || bad "mixed provider graph run => [$got]"

printf '(import (app report))\nreport-value\n' > "$TMP/mixed-repl.in"
got="$(cd "$TMP/project" && "$EMIT" repl -L "$TMP/explicit" \
  < "$TMP/mixed-repl.in" 2>"$TMP/mixed-repl.err")"
echo "$got" | grep -q '35' && ok "mixed provider graph imports in the REPL" \
  || bad "mixed provider graph REPL"

if (cd "$TMP/project" && EMIT_VERBOSITY=quiet "$EMIT" build main.scm \
  -L "$TMP/explicit" -o build/mixed) >"$TMP/mixed-build.log" 2>&1 \
  && [ "$("$TMP/project/build/mixed" 2>/dev/null)" = "35" ]; then
  ok "mixed provider graph builds directly"
else
  bad "mixed provider graph direct build"
fi

if (cd "$TMP/project" && EMIT_VERBOSITY=quiet "$EMIT" lib lib/app/report.sld \
  -L "$TMP/explicit" -o build/lib) >"$TMP/mixed-lib.log" 2>&1 \
  && grep -q 'installed.helper:installed-value' "$TMP/project/build/lib/app.report.ll" \
  && grep -q 'odd.exception:exception-value' "$TMP/project/build/lib/app.report.ll"; then
  ok "mixed provider graph compiles through emit lib"
else
  bad "mixed provider graph emit lib"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
