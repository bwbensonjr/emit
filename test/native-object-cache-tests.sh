#!/usr/bin/env bash
# native-object-cache-tests.sh -- focused native tier storage and admission checks.
set -u
cd "$(dirname "$0")/.."

make emit >/dev/null 2>&1 || { echo "failed to build build/emit"; exit 1; }
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
pass=0
fail=0
ok() { echo "  [OK  ] $1"; pass=$((pass + 1)); }
bad() { echo "  [FAIL] $1"; fail=$((fail + 1)); }

echo "native key and LLVM adapter probes"
test/native-cache-signature-tests.sh >/dev/null \
  && ok "canonical native signature probe" || bad "canonical native signature probe"
test/orc-native-object-probe.sh >/dev/null \
  && ok "ORC object capture and admission probe" || bad "ORC object capture and admission probe"

run_fixture() {
  local name="$1" cache="$2" level="$3"
  env EMIT_CACHE="$cache" EMIT_VERBOSITY=verbose build/emit run "$level" \
    --manifest test/modules/emit-libs.scm test/modules/prog-mylib.scm \
    >"$tmp/$name.out" 2>"$tmp/$name.err"
}

# Return only the exact stem narrated by this compiler/source/profile execution.
entry_stem() {
  sed -n 's|.*native object generated for library mylib: .* -> \(.*\)\.0\.o|\1|p' "$1" \
    | tail -1
}

echo
echo "native object generation and reuse"
cache="$tmp/cache"
run_fixture cold "$cache" -O1
stem="$(entry_stem "$tmp/cold.err")"
[ "$(cat "$tmp/cold.out")" = 142 ] && [ -n "$stem" ] \
  && [ -f "$stem.0.o" ] && [ -f "$stem.meta" ] && [ -f "$stem.stamp" ] \
  && ok "cold execution atomically creates one exact native unit entry" \
  || bad "cold execution or exact entry inspection"
run_fixture warm "$cache" -O1
[ "$(cat "$tmp/warm.out")" = 142 ] \
  && grep -q 'native object reused for library mylib: -O1' "$tmp/warm.err" \
  && grep -q 'jit -O1 program -> execute  \[1/4 modules' "$tmp/warm.err" \
  && grep -q 'parse 1,' "$tmp/warm.err" \
  && ok "warm execution admits objects with only the program transformed" \
  || bad "warm native admission"
grep -q 'native 2 reused/0 generated, load ' "$tmp/warm.err" \
  && ok "verbose aggregate reports native counts and load timing" \
  || bad "verbose native aggregate"
env EMIT_CACHE="$cache" EMIT_VERBOSITY=quiet build/emit run -O1 \
  --manifest test/modules/emit-libs.scm test/modules/prog-mylib.scm \
  >"$tmp/quiet.out" 2>"$tmp/quiet.err"
[ "$(cat "$tmp/quiet.out")" = 142 ] && [ ! -s "$tmp/quiet.err" ] \
  && ok "quiet mode preserves stdout and suppresses native narration" \
  || bad "quiet native narration"
env EMIT_CACHE="$cache" build/emit run -O1 --manifest test/modules/emit-libs.scm \
  test/modules/prog-mylib.scm >"$tmp/default.out" 2>"$tmp/default.err"
[ "$(cat "$tmp/default.out")" = 142 ] && ! grep -q 'native object' "$tmp/default.err" \
  && ok "default output remains concise" \
  || bad "default native narration"

echo "native corruption falls back before admission"
cp "$stem.0.o" "$tmp/good.o"
cp "$stem.meta" "$tmp/good.meta"
cp "$stem.stamp" "$tmp/good.stamp"
for mutation in missing truncated mutated metadata stale unreadable partial; do
  cp "$tmp/good.o" "$stem.0.o"
  cp "$tmp/good.meta" "$stem.meta"
  cp "$tmp/good.stamp" "$stem.stamp"
  case "$mutation" in
    missing) rm "$stem.0.o" ;;
    truncated) printf 'x' >"$stem.0.o" ;;
    mutated) printf 'x' >>"$stem.0.o" ;;
    metadata) printf 'x' >>"$stem.meta" ;;
    stale) printf 'stale\n' >"$stem.stamp" ;;
    unreadable) chmod 000 "$stem.0.o" ;;
    partial) rm "$stem.stamp" ;;
  esac
  run_fixture "fallback-$mutation" "$cache" -O1
  [ "$(cat "$tmp/fallback-$mutation.out")" = 142 ] \
    && grep -q 'native object miss for library mylib: -O1' "$tmp/fallback-$mutation.err" \
    && ok "$mutation entry falls back to portable IR" \
    || bad "$mutation entry fallback"
done

unwritable="$tmp/unwritable"
mkdir "$unwritable"
chmod 500 "$unwritable"
run_fixture unwritable "$unwritable" -O1
chmod 700 "$unwritable"
[ "$(cat "$tmp/unwritable.out")" = 142 ] \
  && ok "an unwritable native cache leaves execution unchanged" \
  || bad "unwritable native cache fallback"

echo "profiles, dump bypass, and lazy materialization"
o0_cache="$tmp/o0-cache"
run_fixture o0-cold "$o0_cache" -O0
run_fixture o0-warm "$o0_cache" -O0
grep -q 'native object reused for library mylib: -O0' "$tmp/o0-warm.err" \
  && ok "O0 creates and reuses its own native entry" \
  || bad "O0 native reuse"
run_fixture profile "$cache" -O2
grep -q 'native object miss for library mylib: -O2' "$tmp/profile.err" \
  && ok "a different optimization profile has a distinct native key" \
  || bad "optimization profile invalidation"
env EMIT_CACHE="$cache" EMIT_VERBOSITY=verbose build/emit run --dump-all \
  --manifest test/modules/emit-libs.scm test/modules/prog-mylib.scm \
  >"$tmp/dump.out" 2>"$tmp/dump.err"
! grep -q 'native object reused' "$tmp/dump.err" \
  && ! grep -q 'native object miss' "$tmp/dump.err" \
  && grep -q 'after parse+rename.*\[unit (mylib)\]' "$tmp/dump.err" \
  && ok "dump-all bypasses native reuse and preserves library stages" \
  || bad "dump-all native bypass"

lazy_cache="$tmp/lazy-cache"
printf '(+ 1 2)\n' | env EMIT_CACHE="$lazy_cache" EMIT_VERBOSITY=verbose build/emit repl \
  --manifest test/modules/emit-libs.scm >"$tmp/lazy.out" 2>"$tmp/lazy.err"
if find "$lazy_cache" -maxdepth 1 -type f -name 'native-unit-mylib:*' | grep -q .; then
  bad "unimported manifest library created a native object"
else
  ok "an unimported manifest library remains unmaterialized"
fi

printf '(import (mylib))\n(greet)\n(import (mylib))\n(greet)\n' \
  | env EMIT_CACHE="$cache" EMIT_VERBOSITY=verbose build/emit repl -O1 \
      --manifest test/modules/emit-libs.scm >"$tmp/repl-warm.out" 2>"$tmp/repl-warm.err"
[ "$(cat "$tmp/repl-warm.out")" = "$(printf '142\n142')" ] \
  && grep -q 'native object reused for library mylib: -O1' "$tmp/repl-warm.err" \
  && [ "$(grep -c 'initialize library mylib' "$tmp/repl-warm.err")" -eq 1 ] \
  && ok "REPL native object initializes once and serves later forms" \
  || bad "REPL native reuse and initialization"

echo "mixed conventional-path native and IR registration"
mixed_cache="$tmp/mixed-cache"
printf '(import (native dep))\n(dep-value)\n' \
  | env EMIT_CACHE="$mixed_cache" EMIT_VERBOSITY=quiet build/emit run -O1 \
      -L test/native-cache-lib - >"$tmp/dep.out" 2>"$tmp/dep.err"
printf '(import (native top))\n(top-value)\n' \
  | env EMIT_CACHE="$mixed_cache" EMIT_VERBOSITY=verbose build/emit repl -O1 \
      -L test/native-cache-lib >"$tmp/mixed.out" 2>"$tmp/mixed.err"
[ "$(cat "$tmp/mixed.out")" = 42 ] \
  && grep -q 'native object reused for library native.dep:' "$tmp/mixed.err" \
  && grep -q 'native object miss for library native.top:' "$tmp/mixed.err" \
  && ok "conventional dependency closure mixes a native hit with an IR miss" \
  || bad "mixed conventional native closure"
printf '(import (native bad))\n(bad-value)\n(+ 1 2)\n' \
  | env EMIT_CACHE="$mixed_cache" EMIT_VERBOSITY=verbose build/emit repl -O1 \
      -L test/native-cache-lib >"$tmp/transaction.out" 2>"$tmp/transaction.err"
grep -q '^3$' "$tmp/transaction.out" \
  && grep -q 'unbound variable bad-value' "$tmp/transaction.err" \
  && ok "failed mixed registration publishes no import and the REPL recovers" \
  || bad "mixed registration transaction recovery"

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
