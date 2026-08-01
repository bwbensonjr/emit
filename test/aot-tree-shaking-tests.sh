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

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
