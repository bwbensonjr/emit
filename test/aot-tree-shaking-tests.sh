#!/usr/bin/env bash
# AOT release-profile tree-shaking tests (change: aot-release-profile).
# The AOT ship path prunes unreachable library bindings under the closed-world
# assumption: only bindings transitively reachable from the program's references
# are emitted/linked.  Verified via the Chez driver (compile.ss), which owns the
# modular AOT build + link.  Value-equivalence across all library usage is covered
# by the "demo values (AOT/chez)" suite (now shaking every demo); this pins the
# size/root-driven behavior and that shaking preserves results.
# Needs Chez + an LLVM/libgc toolchain.  Run from the repo root.
set -u
cd "$(dirname "$0")/.."

command -v chez >/dev/null 2>&1 || { echo "chez not found -- skipping"; exit 0; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# build <name> <src-text> -> compiles to $TMP/<name>, echoes "<value>|<size>"
build () {
  local name="$1" text="$2"
  printf '%s\n' "$text" > "$TMP/$name.scm"
  if ! chez --libdirs src --script src/compile.ss "$TMP/$name.scm" -o "$TMP/$name" \
        >"$TMP/$name.log" 2>&1; then
    echo "COMPILE-FAIL"; return
  fi
  echo "$("$TMP/$name" 2>/dev/null)|$(stat -f%z "$TMP/$name" 2>/dev/null || stat -c%s "$TMP/$name")"
}

echo "AOT tree-shaking tests"

# A program using no (scheme base) binding (car is a primitive) shakes the whole
# library away; one using map keeps map + its transitive deps.  Both < a full link.
caronly="$(build caronly '(car (quote (1 2)))')"
usemap="$(build usemap  '(map (lambda (x) (+ x 1)) (quote (1 2 3)))')"
heavy="$(build heavy    '(list (map car (quote ((1)(2)))) (filter (lambda (x) (< x 3)) (quote (1 2 3))) (assoc 2 (quote ((1 . a)(2 . b)))) (fold-left (lambda (a b) (+ a b)) 0 (quote (1 2 3))))')"

car_val="${caronly%%|*}";  car_sz="${caronly##*|}"
map_val="${usemap%%|*}";   map_sz="${usemap##*|}"
hvy_val="${heavy%%|*}";     hvy_sz="${heavy##*|}"

# correctness (shaking preserves results)
[ "$car_val" = "1" ]       && ok "car-only value" || bad "car-only value ($car_val)"
[ "$map_val" = "(2 3 4)" ] && ok "map value"      || bad "map value ($map_val)"
[ "$hvy_val" = "((1 2) (1 2) (2 . b) 6)" ] && ok "heavy value" || bad "heavy value ($hvy_val)"

# root-driven size: fewer reachable bindings => smaller binary
if [ "$car_sz" -lt "$map_sz" ] && [ "$map_sz" -lt "$hvy_sz" ]; then
  ok "size scales with reachable set ($car_sz < $map_sz < $hvy_sz)"
else
  bad "size does not scale with reachable set ($car_sz / $map_sz / $hvy_sz)"
fi

# the narration reports the shake, and car-only reaches 0 exports
grep -q "shake (scheme base)" "$TMP/caronly.log" && ok "shake narrated" || bad "no shake narration"
grep -q "0 exports reached"   "$TMP/caronly.log" && ok "car-only: 0 exports reached" || bad "car-only reached exports"

# --- label stability across pruning (change: cross-unit-direct-calls) ---------
# A program names its imported callees by code label, and the label it can name is
# the one in the FULL unit -- while the unit it links against is a tree-shaken
# recompile driven by that same program.  So a library procedure's label must not
# depend on which siblings survived.  This is the check that would have caught the
# counter-derived labels (`zero?` was code_168 whole and code_216 pruned): compare
# the label of a procedure present in both.  A mismatch would surface as an
# undefined symbol at link time, so this is a sharper, earlier signal.
full=build/lib/scheme.base.ll
pruned="$TMP/heavy.scheme.base.pruned.ll"
if [ -f "$full" ] && [ -f "$pruned" ]; then
  # every code label the PRUNED unit defines must be spelled identically in the full
  # one (the pruned unit is a subset, so this is containment, not equality)
  drift=0
  while read -r lbl; do
    grep -q "define fastcc i64 $lbl(" "$full" || { drift=$((drift+1)); echo "         drifted: $lbl"; }
  done < <(grep -o 'define fastcc i64 @"scheme\.base:code:[^"]*"' "$pruned" | sed 's/^define fastcc i64 //')
  n=$(grep -c 'define fastcc i64 @"scheme\.base:code:' "$pruned")
  if [ "$drift" -eq 0 ] && [ "$n" -gt 0 ]; then
    ok "procedure labels identical whole vs pruned ($n kept)"
  else
    bad "procedure labels drift between whole and pruned ($drift of $n)"
  fi
  # and the program actually names one of them
  grep -q 'call fastcc i64 @"scheme\.base:code:' "$TMP/heavy.ll" \
    && ok "program direct-calls an imported procedure" \
    || bad "program emitted no cross-unit direct call"
else
  bad "label-stability check: missing $full or $pruned"
fi

# --- door parity: both ship doors shake the same program the same way --------
# (change: chez-free-unit-pipeline; docs/PERFORMANCE.md P8).  The size of a standalone
# executable must not depend on WHICH door built it.  Before this, the Chez driver shaved
# a hello-world to ~94 KB while `emit build` linked the whole standard library for ~212 KB,
# and the gap grew with every addition to `(scheme base)`.
#
# Chez-gated because only this suite has Chez; the Chez-free half (that `emit build` shakes
# at all) is asserted in test/unit-pipeline-tests.sh.
printf '(display "hello")\n(newline)\n' > "$TMP/hello.scm"
cat > "$TMP/emit-libs.scm" <<EOF
((program hello (source "$TMP/hello.scm") (output "$TMP/hello-emit")))
EOF
EMIT_ABS="$PWD/build/emit"
make emit >/dev/null 2>&1
chez --libdirs src --script src/compile.ss "$TMP/hello.scm" -o "$TMP/hello-chez" >/dev/null 2>&1
( cd "$TMP" && EMIT_CACHE="$TMP/cache" "$EMIT_ABS" build hello >/dev/null 2>&1 )
if [ -x "$TMP/hello-chez" ] && [ -x "$TMP/hello-emit" ]; then
  cz=$(stat -f%z "$TMP/hello-chez" 2>/dev/null || stat -c%s "$TMP/hello-chez")
  em=$(stat -f%z "$TMP/hello-emit" 2>/dev/null || stat -c%s "$TMP/hello-emit")
  [ "$("$TMP/hello-chez")" = "$("$TMP/hello-emit")" ] \
    && ok "both ship doors deliver the same behaviour" \
    || bad "the two ship doors disagree on output"
  # Same program, same compiler, same shake: within 10% is "the same order", which is the
  # spec's claim; they were 2.3x apart.
  if [ "$em" -le $(( cz * 110 / 100 )) ] && [ "$cz" -le $(( em * 110 / 100 )) ]; then
    ok "both ship doors deliver the same size (chez $cz B, emit build $em B)"
  else
    bad "ship-door size gap: chez $cz B vs emit build $em B"
  fi
else
  bad "door-parity: one of the two doors produced no executable"
fi

# --- backward root propagation through the import DAG ------------------------
# (change: import-dag-tree-shaking; docs/PERFORMANCE.md P10).  A unit another unit imports
# used to be exempt from shaking, so `(scheme base)` importing `(emit internal)` pinned the
# whole substrate into every binary: 348,536 B and 161 `emit.internal:*` symbols in a
# `car`-only executable, to support ONE standard-library binding.
#
# Every assertion here has a direction.  A test that only checks the substrate SHRANK passes
# when the shake is too aggressive, and a test that only checks a program still RUNS passes
# when it is not aggressive at all -- so the pair below is written to fail on either side.
echo "backward propagation through the import DAG"

sub_full=build/lib/emit.internal.ll
sub_pruned="$TMP/caronly.emit.internal.pruned.ll"
if [ -f "$sub_full" ] && [ -f "$sub_pruned" ]; then
  fz=$(stat -f%z "$sub_full" 2>/dev/null || stat -c%s "$sub_full")
  pz=$(stat -f%z "$sub_pruned" 2>/dev/null || stat -c%s "$sub_pruned")
  # The substrate is imported by (scheme base), never by the program.  A car-only program
  # reaches none of it, so this is the maximal case: well under a tenth of the full unit.
  if [ "$pz" -lt $(( fz / 10 )) ]; then
    ok "substrate shaken via its importer ($fz -> $pz B)"
  else
    bad "substrate not shaken through the import DAG ($fz -> $pz B)"
  fi
  # ...and it is shaken because an IMPORTER's roots reached it, which the narration says.
  grep -q "shake (emit internal).*via importers" "$TMP/caronly.log" \
    && ok "shake narrates the importer-driven case" \
    || bad "no 'via importers' narration for the substrate"
else
  bad "propagation check: missing $sub_full or $sub_pruned"
fi

# The reader is the payload this change removes: 55 rd-* bindings that a car-only program
# cannot reach through any importer.  Assert on the delivered BINARY, not just the IR --
# the claim is about what ships.
if command -v nm >/dev/null 2>&1; then
  rd_min=$(nm "$TMP/caronly" 2>/dev/null | grep -c 'emit\.internal:rd-' || true)
  [ "$rd_min" -eq 0 ] \
    && ok "car-only binary carries no reader bindings" \
    || bad "car-only binary still carries $rd_min reader symbols"

  # The over-pruning counterpart: a program that DOES read must keep them.  Without this,
  # every assertion above is satisfied by a shake that drops everything.
  # read-all-from-string returns a LIST OF DATA, so car is the datum (7 8), not 7.
  reads="$(build reads '(display (car (read-all-from-string "(7 8)")))')"
  rd_val="${reads%%|*}"
  [ "$rd_val" = "(7 8)" ] && ok "reading program value" || bad "reading program value ($rd_val)"
  rd_keep=$(nm "$TMP/reads" 2>/dev/null | grep -c 'emit\.internal:rd-' || true)
  [ "$rd_keep" -gt 0 ] \
    && ok "reading program keeps the reader through the DAG ($rd_keep symbols)" \
    || bad "reading program lost the reader bindings it needs"
else
  echo "  [SKIP] nm unavailable: binary symbol assertions"
fi

# --- the ptr / code: pairing the root rule depends on (design D3) -------------
# `program-root-internals` finds a cross-unit reference by searching for the closure load
# `ptr @"U:n"`.  A direct reference may call either `@"U:code:n"` or the encoded variadic
# exact-minimum entry; both must remain paired with the ordinary closure
# global.  A codegen change that emitted either direct call without loading the closure would
# make the root rule miss a live reference and prune a needed binding into a link-time
# undefined symbol.  Assert the pairing here, so that change fails by name instead.
decode_minimum_label () {
  local encoded="${1#min-entry:\$}" out=""
  while [ -n "$encoded" ]; do
    case "$encoded" in
      '$c'*) out="${out}:"; encoded="${encoded:2}" ;;
      '$d'*) out="${out}\$"; encoded="${encoded:2}" ;;
      *) out="${out}${encoded:0:1}"; encoded="${encoded:1}" ;;
    esac
  done
  printf '%s' "$out"
}
unpaired=0; checked=0
for u in build/lib/*.ll; do
  own="$(basename "$u" .ll)"                       # e.g. scheme.base
  while read -r ref; do
    case "$ref" in min-entry:\$*) ref="$(decode_minimum_label "$ref")" ;; esac
    case "$ref" in *:code:*) ;; *) continue ;; esac  # unit-local code_N is not imported
    # ref looks like  emit.internal:code:rd-datum  -- split off the unit prefix
    pfx="${ref%%:code:*}"; nm_="${ref#*:code:}"
    [ "$pfx" = "$own" ] && continue                # own labels: defined here, not imported
    checked=$((checked+1))
    grep -q "ptr @\"$pfx:$nm_\"" "$u" || { unpaired=$((unpaired+1)); echo "         unpaired: $ref in $own"; }
  done < <({ grep -o '@"[a-z.]*:code:[^"]*"' "$u"
             grep -o '@"min-entry:\$[^"]*"' "$u"; } | tr -d '@"' | sort -u)
done
if [ "$unpaired" -eq 0 ] && [ "$checked" -gt 0 ]; then
  ok "every cross-unit direct call is paired with a closure load ($checked checked)"
elif [ "$checked" -eq 0 ]; then
  echo "  [SKIP] no cross-unit direct calls found to check"
else
  bad "$unpaired of $checked cross-unit direct calls have no ptr load (breaks the root rule)"
fi

# --- a transitively imported library is shaken to what its importer retains ---
# The program never names lib B; only lib A does, and A is itself shaken first.  Before this
# change B was exempt for being imported, and also for not being a direct import.
mkdir -p "$TMP/chain"
cat > "$TMP/chain/b.sld" <<'EOF'
(define-library (chain b)
  (export b-used b-unused)
  (import (scheme base))
  (begin
    (define (b-used x) (* x 3))
    (define (b-unused x) (* x 5))))
EOF
cat > "$TMP/chain/a.sld" <<'EOF'
(define-library (chain a)
  (export a-used)
  (import (scheme base) (chain b))
  (begin
    (define (a-used x) (b-used x))))
EOF
cat > "$TMP/chain/prog.scm" <<'EOF'
(import (chain a))
(display (a-used 4))
EOF
# The manifest must also name the baked libraries the chain imports: a manifest replaces the
# repo's, it does not extend it.  Absolute paths, since this file lives in $TMP.
cat > "$TMP/chain/emit-libs.scm" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld"))
 (library (scheme base)   (source "$PWD/lib/scheme/base.sld"))
 (library (chain b) (source "$TMP/chain/b.sld") (artifacts "$TMP/chain/art"))
 (library (chain a) (source "$TMP/chain/a.sld") (artifacts "$TMP/chain/art")))
EOF
if chez --libdirs src --script src/compile.ss "$TMP/chain/prog.scm" -o "$TMP/chain/prog" \
      --manifest "$TMP/chain/emit-libs.scm" >"$TMP/chain/build.log" 2>&1; then
  [ "$("$TMP/chain/prog" 2>/dev/null)" = "12" ] \
    && ok "transitive chain value" \
    || bad "transitive chain value ($("$TMP/chain/prog" 2>/dev/null))"
  bp="$TMP/chain/prog.chain.b.pruned.ll"
  if [ -f "$bp" ]; then
    grep -q 'chain.b:code:b-used'   "$bp" && ok "chain: B keeps what A reaches" \
                                          || bad "chain: B dropped a binding A reaches"
    grep -q 'chain.b:code:b-unused' "$bp" && bad "chain: B kept a binding nothing reaches" \
                                          || ok "chain: B drops what nothing reaches"
  else
    bad "chain: B was never shaken (no $bp)"
  fi
else
  bad "transitive chain build failed"; sed 's/^/         /' "$TMP/chain/build.log" | tail -5
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
