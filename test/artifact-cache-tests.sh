#!/usr/bin/env bash
# artifact-cache-tests.sh -- the baked-set artifact cache (change: baked-set-artifact-cache).
#
# The cache is a PURE ACCELERATOR, so the tests split along that claim rather than along the
# implementation:
#
#   TRANSPARENCY  a door's output must not depend on cache state.  The load-bearing check is
#                 byte-identity of emitted IR cold vs warm -- not "it still works", which a
#                 cache that silently served a stale library would also pass.
#   INVALIDATION  an entry keyed on this binary must not be served to a different one.
#   DEGRADATION   every failure path -- unwritable location, corrupt entry, absent
#                 directory -- must still produce the right answer.  These are the tests
#                 that keep "no door gains a failure mode" true.
#   NARRATION     reuse and recompile must be distinguishable, and must stay on stderr.
#
# EMIT_CACHE points every case at a scratch directory, so nothing here touches the
# developer's real cache and no case can be polluted by a previous one.
#
# Chez-FREE: drives the shipped `build/emit` only.
set -u
cd "$(dirname "$0")/.."

RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

echo "artifact cache: transparency, invalidation, degradation, narration"

printf '(display (map (lambda (x) (* x 2)) (list 1 2 3)))\n' > "$TMP/p.scm"
WANT='(2 4 6)'

# --- transparency ------------------------------------------------------------------
# Cold, then warm, then warm again: the value must never move.
C1="$TMP/c1"
got_cold=$(EMIT_CACHE="$C1" $RUN "$TMP/p.scm" 2>/dev/null)
got_warm=$(EMIT_CACHE="$C1" $RUN "$TMP/p.scm" 2>/dev/null)
[ "$got_cold" = "$WANT" ] && ok "cold cache: correct value" \
  || bad "cold cache => [$got_cold] (expected [$WANT])"
[ "$got_warm" = "$WANT" ] && ok "warm cache: correct value" \
  || bad "warm cache => [$got_warm] (expected [$WANT])"

# The load-bearing one: emitted IR must be byte-identical cold vs warm.  A cache that
# served a subtly different standard library would pass every value check above and fail
# only here.
C2="$TMP/c2"
EMIT_CACHE="$C2" $RUN --emit "$TMP/p.scm" > "$TMP/ir-cold.ll" 2>/dev/null
EMIT_CACHE="$C2" $RUN --emit "$TMP/p.scm" > "$TMP/ir-warm.ll" 2>/dev/null
if cmp -s "$TMP/ir-cold.ll" "$TMP/ir-warm.ll"; then
  ok "emitted IR is byte-identical cold vs warm ($(wc -c < "$TMP/ir-cold.ll" | tr -d ' ') bytes)"
else
  bad "emitted IR differs cold vs warm"; diff "$TMP/ir-cold.ll" "$TMP/ir-warm.ll" | head -20
fi

# And against no cache at all, which is the pre-change behaviour: three states, one answer.
EMIT_CACHE=/nonexistent/unwritable $RUN --emit "$TMP/p.scm" > "$TMP/ir-none.ll" 2>/dev/null
cmp -s "$TMP/ir-cold.ll" "$TMP/ir-none.ll" \
  && ok "emitted IR matches the uncached path byte-for-byte" \
  || bad "emitted IR differs between cached and uncached paths"

# A diagnostic must not move either -- the cache must not change what an error says.
printf '(display (this-name-is-not-bound))\n' > "$TMP/bad.scm"
C3="$TMP/c3"
e_cold=$(EMIT_CACHE="$C3" $RUN "$TMP/bad.scm" 2>&1 >/dev/null)
e_warm=$(EMIT_CACHE="$C3" $RUN "$TMP/bad.scm" 2>&1 >/dev/null)
[ "$e_cold" = "$e_warm" ] && ok "a compile diagnostic is identical cold vs warm" \
  || bad "diagnostic moved: cold [$e_cold] warm [$e_warm]"

# --- the entry is actually used ------------------------------------------------------
C4="$TMP/c4"
EMIT_CACHE="$C4" $RUN "$TMP/p.scm" >/dev/null 2>&1
n=$(ls "$C4" 2>/dev/null | grep -c '^baked-' || true)
[ "$n" -ge 3 ] && ok "cold run populates the cache ($n files)" \
  || bad "cold run left $n cache files (expected the .ll/.meta/.stamp triple)"
if EMIT_VERBOSITY=verbose EMIT_CACHE="$C4" $RUN "$TMP/p.scm" 2>&1 >/dev/null | grep -q "cache: baked set reused"; then
  ok "a warm run narrates reuse"
else
  bad "a warm run did not narrate reuse"
fi

# --- invalidation --------------------------------------------------------------------
# The key is a digest of the running binary, so a byte-altered copy must not be served the
# original's entry.  Copying the binary is the honest test of that: same source, different
# bytes, and nothing else about the environment changes.
C5="$TMP/c5"
EMIT_CACHE="$C5" $RUN "$TMP/p.scm" >/dev/null 2>&1
stamp_before=$(cat "$C5"/baked-*.stamp 2>/dev/null | head -1)
cp build/emit "$TMP/emit-copy"
printf '\n' >> "$TMP/emit-copy"          # a different binary by one byte
chmod +x "$TMP/emit-copy"
got=$(EMIT_CACHE="$C5" "$TMP/emit-copy" run "$TMP/p.scm" 2>/dev/null)
[ "$got" = "$WANT" ] && ok "a differing binary still produces the right value" \
  || bad "differing binary => [$got] (expected [$WANT])"
n5=$(ls "$C5" 2>/dev/null | grep -c '\.stamp$' || true)
[ "$n5" -ge 2 ] && ok "a differing binary writes its own entry rather than reusing ($n5 stamps)" \
  || bad "expected a second entry for the differing binary, found $n5 stamp(s)"

# --- degradation ---------------------------------------------------------------------
# Each of these must produce the right answer with no error, because the cache is never
# consulted for correctness.
got=$(EMIT_CACHE=/nonexistent/cannot/create $RUN "$TMP/p.scm" 2>/dev/null)
[ "$got" = "$WANT" ] && ok "an uncreatable cache location still works" \
  || bad "uncreatable location => [$got]"

RO="$TMP/readonly"; mkdir -p "$RO"; chmod 500 "$RO"
got=$(EMIT_CACHE="$RO" $RUN "$TMP/p.scm" 2>/dev/null)
[ "$got" = "$WANT" ] && ok "an unwritable cache location still works" \
  || bad "unwritable location => [$got]"
chmod 700 "$RO"

C6="$TMP/c6"
EMIT_CACHE="$C6" $RUN "$TMP/p.scm" >/dev/null 2>&1
for f in "$C6"/baked-*.meta; do printf 'this is not a datum ((((\n' > "$f"; done
got=$(EMIT_CACHE="$C6" $RUN "$TMP/p.scm" 2>/dev/null)
[ "$got" = "$WANT" ] && ok "a corrupt metadata entry is refused and recompiled" \
  || bad "corrupt metadata => [$got]"

C7="$TMP/c7"
EMIT_CACHE="$C7" $RUN "$TMP/p.scm" >/dev/null 2>&1
for f in "$C7"/baked-*.ll; do : > "$f"; done          # truncate the modules
got=$(EMIT_CACHE="$C7" $RUN "$TMP/p.scm" 2>/dev/null)
[ "$got" = "$WANT" ] && ok "a truncated module entry is refused and recompiled" \
  || bad "truncated modules => [$got]"

C8="$TMP/c8"
EMIT_CACHE="$C8" $RUN "$TMP/p.scm" >/dev/null 2>&1
for f in "$C8"/baked-*.stamp; do printf '(emit-artifact-stamp 1 deadbeefdeadbeef)\n' > "$f"; done
if EMIT_VERBOSITY=verbose EMIT_CACHE="$C8" $RUN "$TMP/p.scm" 2>&1 >/dev/null | grep -q "is stale"; then
  ok "a stale stamp is detected and narrated as stale"
else
  bad "a stale stamp was not narrated"
fi

# --- narration stays off stdout ------------------------------------------------------
# `emit run --emit` writes IR to stdout; cache narration must not contaminate it.
C9="$TMP/c9"
EMIT_VERBOSITY=verbose EMIT_CACHE="$C9" $RUN --emit "$TMP/p.scm" > "$TMP/v1.ll" 2>/dev/null
EMIT_VERBOSITY=verbose EMIT_CACHE="$C9" $RUN --emit "$TMP/p.scm" > "$TMP/v2.ll" 2>/dev/null
if grep -q "^cache:" "$TMP/v1.ll" "$TMP/v2.ll"; then
  bad "cache narration leaked onto stdout"
else
  ok "cache narration stays on stderr"
fi
cmp -s "$TMP/v1.ll" "$TMP/v2.ll" && ok "verbose narration does not change emitted IR" \
  || bad "emitted IR differs under verbose narration"

# --- --no-prelude consults no entry --------------------------------------------------
# There is no standard library to cache when it is not being registered at all.
C10="$TMP/c10"
printf '(%%display "x")\n' > "$TMP/np.scm"
EMIT_CACHE="$C10" $RUN --no-prelude "$TMP/np.scm" >/dev/null 2>&1
n10=$(ls "$C10" 2>/dev/null | grep -c '^baked-' || true)
[ "$n10" = 0 ] && ok "--no-prelude writes no cache entry" \
  || bad "--no-prelude wrote $n10 cache file(s)"

# --- the other doors reach the same cache --------------------------------------------
C11="$TMP/c11"
printf '(display 1)\n' > "$TMP/one.scm"
EMIT_CACHE="$C11" $RUN "$TMP/one.scm" >/dev/null 2>&1
before=$(ls "$C11" 2>/dev/null | grep -c '^baked-' || true)
out=$(printf '(display (+ 1 2))\n' | EMIT_CACHE="$C11" build/emit repl 2>/dev/null | tail -1)
case "$out" in *3*) ok "emit repl works against the same cache" ;;
                 *) bad "emit repl against a warm cache => [$out]" ;; esac
after=$(ls "$C11" 2>/dev/null | grep -c '^baked-' || true)
[ "$before" = "$after" ] && ok "emit repl reused the entry rather than writing another" \
  || bad "emit repl changed the entry count $before -> $after"

# --- --dump-all must still see the compile it asked to observe -------------------------
# The first real regression this change caused: a warm cache means the baked set is never
# compiled, so `--dump-all` printed NONE of (scheme base)'s per-define stages.  The flag
# exists to watch that work happen, so a request to observe it bypasses the cache.
# test/dump-stages-tests.sh asserts the header count; this pins the CACHE side of it, so a
# future cache change cannot quietly re-break the dump.
C13="$TMP/c13"
EMIT_CACHE="$C13" $RUN "$TMP/p.scm" >/dev/null 2>&1          # warm it first
n_base=$(EMIT_CACHE="$C13" $RUN --dump-all "$TMP/p.scm" 2>&1 >/dev/null \
           | grep -c 'unit (scheme base)' || true)
[ "$n_base" -gt 100 ] && ok "--dump-all still shows the (scheme base) stages ($n_base headers)" \
  || bad "--dump-all against a warm cache showed $n_base (scheme base) headers"
if EMIT_VERBOSITY=verbose EMIT_CACHE="$C13" $RUN --dump-all "$TMP/p.scm" 2>&1 >/dev/null \
     | grep -q "cache: bypassed"; then
  ok "the bypass is narrated"
else
  bad "the --dump-all bypass was not narrated"
fi
# Plain --dump does NOT dump library units, so it may use the cache and must still be warm.
if EMIT_VERBOSITY=verbose EMIT_CACHE="$C13" $RUN --dump "$TMP/p.scm" 2>&1 >/dev/null \
     | grep -q "cache: baked set reused"; then
  ok "--dump (level 2) still uses the cache"
else
  bad "--dump unnecessarily bypassed the cache"
fi

# --- user libraries are cached too (change: chez-free-unit-pipeline) -------------------
# This was the DEFERRED half, and these three cases used to assert the deferral -- that a
# user library still worked and still wrote no entry -- so that the follow-up would have a
# baseline.  The follow-up landed; the first two cases stand unchanged, and the third is
# inverted.  Everything about a user library's own keying (its include closure, content
# rather than mtime) is exercised in test/unit-pipeline-tests.sh; what belongs HERE is only
# that the two kinds of entry share one cache and one set of degradation rules.
C14="$TMP/c14"
mkdir -p "$TMP/proj"
printf '(define-library (ulib) (export u) (import (scheme base)) (begin (define (u) 7)))\n' \
  > "$TMP/proj/ulib.sld"
printf '((library (ulib) (source "%s/proj/ulib.sld")))\n' "$TMP" > "$TMP/proj/emit-libs.scm"
printf '(import (ulib)) (display (u))\n' > "$TMP/proj/up.scm"
got=$(EMIT_CACHE="$C14" $RUN --manifest "$TMP/proj/emit-libs.scm" "$TMP/proj/up.scm" 2>/dev/null)
[ "$got" = "7" ] && ok "a program importing a user library still works => $got" \
  || bad "user-library import => [$got] (expected 7)"
got2=$(EMIT_CACHE="$C14" $RUN --manifest "$TMP/proj/emit-libs.scm" "$TMP/proj/up.scm" 2>/dev/null)
[ "$got2" = "7" ] && ok "and again against a warm baked-set cache => $got2" \
  || bad "second user-library import => [$got2]"
u=$(ls "$C14" 2>/dev/null | grep -c 'ulib' || true)
[ "$u" -gt 0 ] && ok "a user library gets its own cache entry ($u files) beside the baked set" \
  || bad "no cache entry was written for a user library"

# --- concurrent population (design D8) -----------------------------------------------
# The default suite runs many `emit` processes at once under EMIT_JOBS, so the very first
# run after a rebuild has several of them racing to write the same cold entry.  Writes are
# a temp file plus an atomic rename with the stamp last, so every racer must succeed and the
# entry must be valid afterwards -- this is the case a non-atomic write would corrupt.
C12="$TMP/c12"
mkdir -p "$C12"
for i in 1 2 3 4 5 6 7 8; do
  ( EMIT_CACHE="$C12" $RUN "$TMP/p.scm" > "$TMP/par-$i.out" 2>/dev/null ) &
done
wait
racers_ok=1
for i in 1 2 3 4 5 6 7 8; do
  [ "$(cat "$TMP/par-$i.out" 2>/dev/null)" = "$WANT" ] || racers_ok=0
done
[ "$racers_ok" = 1 ] && ok "8 concurrent cold-cache runs all produced the right value" \
  || bad "a concurrent cold-cache run produced the wrong value"
# And the entry they raced to write must be usable, not a torn mixture.
got=$(EMIT_CACHE="$C12" $RUN "$TMP/p.scm" 2>/dev/null)
[ "$got" = "$WANT" ] && ok "the raced entry is valid afterwards" \
  || bad "after the race the entry yields [$got]"
ls "$C12"/*.tmp* >/dev/null 2>&1 \
  && bad "temporary files were left behind by the race" \
  || ok "the race left no temporary files"

echo
echo "artifact cache: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
