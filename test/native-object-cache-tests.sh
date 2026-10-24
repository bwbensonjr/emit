#!/usr/bin/env bash
# native-object-cache-tests.sh -- focused native tier storage and admission checks.
set -u
cd "$(dirname "$0")/.."

make emit >/dev/null 2>&1 || { echo "failed to build build/emit"; exit 1; }
# A checkout has no shared tier unless this names one; the shared section below sets it.
unset EMIT_SHARED_CACHE
tmp="$(mktemp -d)"
trap 'chmod -R u+rwx "$tmp" 2>/dev/null; rm -rf "$tmp"' EXIT
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

# #131: an empty cache stem must not alias a two-module baked capture group
# with a later one-module library. Every process must succeed, not just one retry.
printf 'not a directory\n' > "$tmp/blocked-cache"
blocked_ok=1
for iteration in {1..10}; do
  if ! run_fixture "blocked-$iteration" "$tmp/blocked-cache/child" -O1 || \
     [ "$(cat "$tmp/blocked-$iteration.out")" != 142 ]; then
    blocked_ok=0
    cat "$tmp/blocked-$iteration.err"
  fi
done
if [ "$blocked_ok" = 1 ]; then
  ok "disabled capture preserves modular execution in all ten fresh processes"
else bad "disabled cache capture group isolation"; fi

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

# Explicit preparation must force ORC materialization without an import or initializer call.
if EMIT_CACHE="$tmp/stdlib" EMIT_VERBOSITY=verbose build/emit build --stdlib \
    >"$tmp/stdlib.out" 2>"$tmp/stdlib.err" \
   && [ ! -s "$tmp/stdlib.out" ] \
   && grep -q 'native object generated for library scheme.char: -O1' "$tmp/stdlib.err"; then
  ok "stdlib preparation materializes lazy full units without program output"
else bad "stdlib preparation"; cat "$tmp/stdlib.err"; fi
if EMIT_CACHE="$tmp/stdlib" EMIT_VERBOSITY=verbose build/emit build --stdlib \
    >"$tmp/stdlib2.out" 2>"$tmp/stdlib2.err" \
   && grep -q 'portable 11 reused/0 generated, native 11 reused/0 generated' "$tmp/stdlib2.err"; then
  ok "a second preparation reuses every portable and native group"
else bad "stdlib repeated preparation"; cat "$tmp/stdlib2.err"; fi
printf '(import (scheme char)) (display (char-upcase #\\a))\n' >"$tmp/stdlib.scm"
if EMIT_CACHE="$tmp/stdlib" EMIT_VERBOSITY=verbose build/emit run "$tmp/stdlib.scm" \
    >"$tmp/stdlib-run.out" 2>"$tmp/stdlib-run.err" \
   && [ "$(cat "$tmp/stdlib-run.out")" = A ] \
   && grep -q 'native object reused for library scheme.char: -O1' "$tmp/stdlib-run.err"; then
  ok "first execution after preparation reuses native standard libraries"
else bad "prepared stdlib execution"; cat "$tmp/stdlib-run.err"; fi

# --- the shared tier (change: prebuilt-shared-stdlib-cache) ----------------------------
# One --shared preparation serves every case; each case copies it when it must damage it.
echo
echo "shared library cache"
! grep -q 'shared' "$tmp/cold.err" "$tmp/stdlib.err" "$tmp/stdlib-run.err" \
  && build/emit doctor 2>/dev/null | grep -q '^shared cache: .*/library-cache \[installation; absent\]$' \
  && ok "a checkout has no shared tier by default and narrates none" \
  || bad "checkout shared tier default"

shared="$tmp/share/library-cache"
mkdir -p "$tmp/share"
if (umask 077; EMIT_SHARED_CACHE="$shared" build/emit build --stdlib --shared \
      >"$tmp/shared-prep.out" 2>"$tmp/shared-prep.err") \
   && [ ! -s "$tmp/shared-prep.out" ] \
   && grep -q "portable 0 reused/11 generated, native 0 reused/11 generated" "$tmp/shared-prep.err" \
   && grep -q "replace shared library cache -> $shared" "$tmp/shared-prep.err" \
   && [ -z "$(find "$shared" -type f ! -perm 644)" ] \
   && [ -n "$(find "$shared" -maxdepth 0 -perm 755)" ] \
   && [ -z "$(ls "$tmp/share" | grep -v '^library-cache$')" ]; then
  ok "shared preparation builds a world-readable cache under umask 077 and swaps it in"
else bad "shared preparation"; cat "$tmp/shared-prep.err"; fi
digest="$(ls "$shared" | sed -n 's/^baked-v[0-9]*-\([0-9a-f]*\)\.stamp$/\1/p')"

shared_run() {   # NAME USER-CACHE SHARED [emit run options...]
  local name="$1" user="$2" share="$3"; shift 3
  env EMIT_CACHE="$user" EMIT_SHARED_CACHE="$share" EMIT_VERBOSITY=verbose \
    build/emit run "$@" "$tmp/stdlib.scm" >"$tmp/$name.out" 2>"$tmp/$name.err"
}
tree_digest() { (cd "$1" && find . -type f | LC_ALL=C sort | xargs cksum) | cksum; }

before="$(tree_digest "$shared")"
shared_run shared-hit "$tmp/user-hit" "$shared"
[ "$(cat "$tmp/shared-hit.out")" = A ] \
  && grep -q "cache: library scheme.char: reused from $shared/.* \[shared\]" "$tmp/shared-hit.err" \
  && grep -q 'native object reused for library scheme.char: -O1 \[.*, shared\]' "$tmp/shared-hit.err" \
  && ! grep -q 'native object generated' "$tmp/shared-hit.err" \
  && [ -z "$(find "$tmp/user-hit" -name 'baked-*' -o -name 'unit-*' -o -name 'native-*')" ] \
  && ok "a first run with an empty user cache is served from the shared tier" \
  || { bad "shared tier first run"; cat "$tmp/shared-hit.err"; }

env EMIT_CACHE="$tmp/user-warm" EMIT_SHARED_CACHE="$shared" build/emit build --stdlib \
  >"$tmp/shared-warm.out" 2>"$tmp/shared-warm.err"
grep -q 'portable 11 reused/0 generated (11 shared), native 11 reused/0 generated (11 shared)' \
    "$tmp/shared-warm.err" \
  && [ -z "$(find "$tmp/user-warm" -name 'baked-*' -o -name 'unit-*' -o -name 'native-*')" ] \
  && ok "plain --stdlib counts shared entries as reused and duplicates none" \
  || { bad "plain --stdlib over a shared cache"; cat "$tmp/shared-warm.err"; }

shared_run shared-off "$tmp/user-off" ""
cmp -s "$tmp/shared-hit.out" "$tmp/shared-off.out" && ! grep -q 'shared' "$tmp/shared-off.err" \
  && ok "EMIT_SHARED_CACHE= disables the tier without changing stdout" \
  || bad "disabled shared tier"
env EMIT_CACHE="$tmp/user-quiet" EMIT_SHARED_CACHE="$shared" EMIT_VERBOSITY=quiet \
  build/emit run "$tmp/stdlib.scm" >"$tmp/shared-quiet.out" 2>"$tmp/shared-quiet.err"
[ "$(cat "$tmp/shared-quiet.out")" = A ] && [ ! -s "$tmp/shared-quiet.err" ] \
  && ok "quiet mode prints no shared-tier narration" || bad "quiet shared narration"

shared_run shared-o2 "$tmp/user-o2" "$shared" -O2
shared_run shared-o2-again "$tmp/user-o2" "$shared" -O2
grep -q 'native object miss for library scheme.char: -O2 \[shared\], trying the user cache' \
    "$tmp/shared-o2.err" \
  && grep -q "native object generated for library scheme.char: -O2 .* -> $tmp/user-o2/" \
    "$tmp/shared-o2.err" \
  && grep -q 'native object reused for library scheme.char: -O2 \[.*, user\]' "$tmp/shared-o2-again.err" \
  && ok "a profile the shared tier lacks is generated into and reused from the user cache" \
  || { bad "shared miss filled in the user cache"; cat "$tmp/shared-o2.err"; }

shared_run shared-dump "$tmp/user-dump" "$shared" --dump-all
grep -q 'after parse+rename.*\[unit (scheme char)\]' "$tmp/shared-dump.err" \
  && ! grep -q '\[shared\]\|shared entry\|, shared\]' "$tmp/shared-dump.err" \
  && ok "dump-all bypasses the shared tier and shows library stages" \
  || bad "dump-all shared bypass"
[ "$(tree_digest "$shared")" = "$before" ] \
  && ok "ordinary commands leave the shared cache byte-identical" \
  || bad "an ordinary command wrote into the shared cache"

# Fallthrough: every damaged shared tier still yields the right answer and no error.
# Another executable is simulated by renaming both of its identities: the digest portable
# entries carry, and the native signature key (a hash covering the digest) native ones end in.
cp -R "$shared" "$tmp/stale"
signature="$(ls "$shared" | sed -n 's/^native-baked-v[0-9]*-[0-9a-f]*-\([0-9a-f]*\)\.stamp$/\1/p')"
for f in "$tmp/stale"/*; do
  g="${f//$digest/0123456789abcdef}"
  mv "$f" "${g//$signature/fedcba9876543210}"
done
shared_run shared-stale "$tmp/user-stale" "$tmp/stale"
[ -n "$digest" ] && [ -n "$signature" ] && [ "$(cat "$tmp/shared-stale.out")" = A ] \
  && grep -q 'no shared entry for library scheme.char:, trying the user cache' "$tmp/shared-stale.err" \
  && ! grep -q '\[shared\]$\|, shared\]' "$tmp/shared-stale.err" \
  && ok "a shared cache from another executable is never reused" \
  || bad "stale shared cache"
cp -R "$shared" "$tmp/trunc"
for f in "$tmp/trunc"/unit-scheme.char*.ll; do head -c 200 "$f" >"$f.cut" && mv "$f.cut" "$f"; done
shared_run shared-trunc "$tmp/user-trunc" "$tmp/trunc"
[ "$(cat "$tmp/shared-trunc.out")" = A ] \
  && grep -q "library scheme.char: rejected $tmp/trunc/.*\[payload integrity\]" "$tmp/shared-trunc.err" \
  && ok "a truncated shared entry is refused and the library recompiled" \
  || bad "truncated shared entry"
cp -R "$shared" "$tmp/locked" && chmod 000 "$tmp/locked"
shared_run shared-locked "$tmp/user-locked" "$tmp/locked"; rc=$?
chmod 755 "$tmp/locked"
[ "$rc" -eq 0 ] && [ "$(cat "$tmp/shared-locked.out")" = A ] \
  && ok "an unreadable shared cache is transparent" || bad "unreadable shared cache (exit $rc)"

# Re-preparation keeps one executable's entries; failure leaves the old cache in place.
touch "$shared/baked-v5-0123456789abcdef.stamp"
EMIT_SHARED_CACHE="$shared" build/emit build --stdlib --shared -q 2>"$tmp/shared-again.err"; rc=$?
[ "$rc" -eq 0 ] && [ ! -e "$shared/baked-v5-0123456789abcdef.stamp" ] \
  && [ "$(ls "$shared" | grep -c '\.stamp$')" = 22 ] \
  && [ -z "$(ls "$tmp/share" | grep -v '^library-cache$')" ] \
  && ok "re-preparation discards entries it did not produce" \
  || { bad "shared re-preparation (exit $rc)"; cat "$tmp/shared-again.err"; }
mkdir -p "$tmp/ro/library-cache" && touch "$tmp/ro/library-cache/marker" && chmod 555 "$tmp/ro"
EMIT_SHARED_CACHE="$tmp/ro/library-cache" build/emit build --stdlib --shared -q \
  >/dev/null 2>"$tmp/shared-ro.err"; rc=$?
chmod 755 "$tmp/ro"
[ "$rc" -ne 0 ] && grep -q "cannot prepare shared library cache -> $tmp/ro/library-cache" \
    "$tmp/shared-ro.err" \
  && [ -e "$tmp/ro/library-cache/marker" ] \
  && ok "an unwritable destination fails, names it, and keeps the previous cache" \
  || { bad "unwritable shared destination (exit $rc)"; cat "$tmp/shared-ro.err"; }

# Doctor: every state is reported and none changes doctor's status or the cache.
doctor_shared() { env EMIT_SHARED_CACHE="$1" build/emit doctor >"$tmp/doctor.out" 2>/dev/null; echo $?; }
baseline="$(doctor_shared "")"
grep -q '^shared cache: none \[disabled by EMIT_SHARED_CACHE\]$' "$tmp/doctor.out" \
  && grep -q '^user cache: ' "$tmp/doctor.out" \
  && ok "doctor labels a disabled shared cache" || bad "doctor disabled shared cache"
before="$(tree_digest "$shared")"
[ "$(doctor_shared "$shared")" = "$baseline" ] \
  && grep -q "^shared cache: $shared \[EMIT_SHARED_CACHE; 22 entries, matches this executable\]$" \
    "$tmp/doctor.out" \
  && [ "$(tree_digest "$shared")" = "$before" ] \
  && ok "doctor reports a matching shared cache without touching it" \
  || { bad "doctor matching shared cache"; grep cache "$tmp/doctor.out"; }
[ "$(doctor_shared "$tmp/stale")" = "$baseline" ] \
  && grep -q 'entries, built by another executable\]$' "$tmp/doctor.out" \
  && ok "doctor reports a stale shared cache without failing" || bad "doctor stale shared cache"
[ "$(doctor_shared "$tmp/missing")" = "$baseline" ] \
  && grep -q "^shared cache: $tmp/missing \[EMIT_SHARED_CACHE; absent\]$" "$tmp/doctor.out" \
  && ok "doctor reports an absent shared cache without failing" || bad "doctor absent shared cache"

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
