#!/usr/bin/env bash
# llvm-discovery-tests.sh -- isolated known-prefix LLVM selection regression tests.
#
# CHEZ-FREE: fake llvm-config executables provide controlled versions. The private
# selector accepts fixture paths directly; production enumeration remains in
# _llvm_discover_config.
set -u
cd "$(dirname "$0")/.."

pass=0
fail=0
ok  () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Load only the two discovery functions. Sourcing llvm-env.sh itself would resolve
# the machine's real LLVM and libgc, which is deliberately outside this fixture test.
eval "$(sed -n \
  -e '/^_llvm_select_newest_config()/,/^}/p' \
  -e '/^_llvm_discover_config()/,/^}/p' \
  tools/llvm-env.sh)"

fake_config () {
  local path="$1"
  local version="$2"
  mkdir -p "$(dirname "$path")"
  printf '#!/usr/bin/env bash\n[ "${1:-}" = "--version" ] && printf "%%s\\n" "%s"\n' \
    "$version" > "$path"
  chmod +x "$path"
}

fake_full_config () {
  local path="$1"
  local version="$2"
  local bindir
  bindir="$(dirname "$path")"
  mkdir -p "$bindir"
  printf '#!/usr/bin/env bash\ncase "${1:-}" in\n  --version) printf "%%s\\n" "%s" ;;\n  --bindir) printf "%%s\\n" "%s" ;;\nesac\n' \
    "$version" "$bindir" > "$path"
  chmod +x "$path"
  printf '#!/usr/bin/env bash\nexit 0\n' > "$bindir/clang"
  chmod +x "$bindir/clang"
}

NEW="$TMP/opt/llvm/bin/llvm-config"
OLD="$TMP/opt/llvm@22/bin/llvm-config"
fake_config "$NEW" "23.0.1"
fake_config "$OLD" "22.1.0"

got="$(_llvm_select_newest_config "$NEW" "$OLD")"
if [ "$got" = "$NEW" ]; then
  ok "reported LLVM 23 beats the lexically later llvm@22 path"
else
  bad "reported-version selection chose $got (expected $NEW)"
fi

EMPTY="$TMP/opt/empty/bin/llvm-config"
NONEXEC="$TMP/opt/nonexec/bin/llvm-config"
fake_config "$EMPTY" ""
fake_config "$NONEXEC" "99.0.0"
chmod -x "$NONEXEC"
got="$(_llvm_select_newest_config "$EMPTY" "$NONEXEC" "$OLD")"
if [ "$got" = "$OLD" ]; then
  ok "non-executable and empty-version candidates are ignored"
else
  bad "invalid-candidate filtering chose $got (expected $OLD)"
fi

TIE_A="$TMP/opt/tie-a/bin/llvm-config"
TIE_B="$TMP/opt/tie-b/bin/llvm-config"
fake_config "$TIE_A" "24.0.0"
fake_config "$TIE_B" "24.0.0"
got="$(_llvm_select_newest_config "$TIE_B" "$TIE_A")"
if [ "$got" = "$TIE_B" ]; then
  ok "equal reported versions use the lexically greatest path deterministically"
else
  bad "equal-version tie chose $got (expected $TIE_B)"
fi

PATH_BIN="$TMP/path-bin"
PATH_CONFIG="$PATH_BIN/llvm-config"
fake_config "$PATH_CONFIG" "21.0.0"
got="$(PATH="$PATH_BIN:/usr/bin:/bin" _llvm_discover_config "$NEW" "$OLD")"
if [ "$got" = "$PATH_CONFIG" ]; then
  ok "an llvm-config on PATH bypasses newer known-prefix candidates"
else
  bad "known-prefix ranking displaced PATH candidate: $got"
fi

SUFFIX_CONFIG="$PATH_BIN/llvm-config-22"
rm "$PATH_CONFIG"
fake_config "$SUFFIX_CONFIG" "22.0.0"
got="$(PATH="$PATH_BIN:/usr/bin:/bin" _llvm_discover_config "$NEW")"
if [ "$got" = "$SUFFIX_CONFIG" ]; then
  ok "a version-suffixed PATH candidate bypasses known-prefix candidates"
else
  bad "known-prefix ranking displaced suffixed PATH candidate: $got"
fi

OVERRIDE="$TMP/override/bin/llvm-config"
fake_full_config "$OVERRIDE" "20.0.0"
mkdir -p "$TMP/gc/include" "$TMP/gc/lib"
got="$(env -u EMIT_LLVM_BIN \
  LLVM_CONFIG="$OVERRIDE" \
  GC_INC="$TMP/gc/include" \
  GC_LIB="$TMP/gc/lib" \
  CC=/usr/bin/true \
  CXX=/usr/bin/true \
  EMIT_VERBOSITY=quiet \
  tools/llvm-env.sh --print-env \
  | sed -n 's/^EMIT_LLVM_BIN=//p')"
if [ "$got" = "$(dirname "$OVERRIDE")" ]; then
  ok "an explicit LLVM_CONFIG override remains authoritative"
else
  bad "LLVM_CONFIG override resolved $got (expected $(dirname "$OVERRIDE"))"
fi

for version in 19.1.7 20.1.8 21.1.0 22.1.0 23.1.0 30.0.0; do
  fake_full_config "$OVERRIDE" "$version"
  env -u EMIT_LLVM_BIN -u EMIT_LLVM_MIN LLVM_CONFIG="$OVERRIDE" \
    GC_INC="$TMP/gc/include" GC_LIB="$TMP/gc/lib" CC=/usr/bin/true CXX=/usr/bin/true \
    EMIT_VERBOSITY=default tools/llvm-env.sh --print-env > "$TMP/floor.out" 2> "$TMP/floor.err"
  if [ "${version%%.*}" -lt 22 ]; then
    if [ "$(grep -c 'below the tested floor 22' "$TMP/floor.err")" = 1 ]; then
      ok "LLVM $version warns once below floor 22"
    else bad "LLVM $version failed floor warning"; fi
  elif grep -q 'below the tested floor' "$TMP/floor.err"; then
    bad "LLVM $version unexpectedly warned"
  else ok "LLVM $version accepted without floor warning"; fi
done
fake_full_config "$OVERRIDE" 21.1.0
env -u EMIT_LLVM_BIN LLVM_CONFIG="$OVERRIDE" EMIT_LLVM_MIN=21 \
  GC_INC="$TMP/gc/include" GC_LIB="$TMP/gc/lib" CC=/usr/bin/true CXX=/usr/bin/true \
  tools/llvm-env.sh --print-env > "$TMP/floor.out" 2> "$TMP/floor.err"
if grep -q 'below the tested floor' "$TMP/floor.err"; then bad "floor override ignored"; else ok "floor override remains effective"; fi

# --- package toolchain pin (change: low-cost-distribution-channels, design D1) ---------------
# A fake installed layout: llvm-env.sh reads ../package/toolchain.env beside its own tools/.
fake_clang () {
  mkdir -p "$(dirname "$1")"
  printf '#!/usr/bin/env bash\n[ "${1:-}" = "--version" ] && printf "%%s\\n" "%s"\nexit 0\n' \
    "$2" > "$1"
  chmod +x "$1"
}
PKG="$TMP/pkg/share/emit"
mkdir -p "$PKG/tools" "$PKG/package" "$TMP/pin-gc/include" "$TMP/pin-gc/lib"
cp tools/llvm-env.sh tools/log.sh "$PKG/tools/"
fake_clang "$TMP/llvm22/bin/clang" "Homebrew clang version 22.1.8"
write_pin () {
  printf '%s\n' "EMIT_LLVM_MAJOR=${1:-22}" "EMIT_LLVM_BIN=$TMP/llvm22/bin" \
    "CC=${2:-$TMP/llvm22/bin/clang}" "GC_INC=$TMP/pin-gc/include" "GC_LIB=$TMP/pin-gc/lib" \
    "GC_DYLIB=$TMP/pin-gc/lib/libgc.so" > "$PKG/package/toolchain.env"
}
write_pin
# A distractor PATH: a different-major clang and llvm-config that discovery would pick.
DISTRACT="$TMP/distract/bin"
fake_full_config "$DISTRACT/llvm-config" "23.1.0"
fake_clang "$DISTRACT/clang" "clang version 23.1.0"
pin_env () {
  env -u EMIT_LLVM_BIN -u LLVM_CONFIG -u CC -u CXX -u GC_INC -u GC_LIB -u GC_DYLIB \
    -u EMIT_GC_INC -u EMIT_GC_LIB -u EMIT_GC_DYLIB -u CXXFLAGS -u LDFLAGS \
    PATH="$DISTRACT:/usr/bin:/bin" EMIT_VERBOSITY=quiet "$@"
}
field () { sed -n "s/^$1=//p" "$2"; }

pin_env "$PKG/tools/llvm-env.sh" --print-env > "$TMP/pin.out" 2> "$TMP/pin.err"
if [ "$(field CC "$TMP/pin.out")" = "$TMP/llvm22/bin/clang" ] \
   && [ "$(field EMIT_TOOLCHAIN_ORIGIN "$TMP/pin.out")" = package ] \
   && [ "$(field EMIT_GC_INC "$TMP/pin.out")" = "$TMP/pin-gc/include" ] \
   && [ -n "$(field EMIT_TOOLCHAIN_PIN "$TMP/pin.out")" ]; then
  ok "the package pin beats a different-major clang and llvm-config on PATH"
else bad "pin lost to discovery"; sed 's/^/         /' "$TMP/pin.out" "$TMP/pin.err"; fi

pin_env EMIT_LLVM_BIN="$DISTRACT" "$PKG/tools/llvm-env.sh" --print-env > "$TMP/pin.out" 2> "$TMP/pin.err"
if [ "$(field CC "$TMP/pin.out")" = "$DISTRACT/clang" ] \
   && [ "$(field EMIT_TOOLCHAIN_ORIGIN "$TMP/pin.out")" = override ]; then
  ok "an explicit EMIT_LLVM_BIN beats the pin and derives its own clang"
else bad "EMIT_LLVM_BIN override lost to the pin"; sed 's/^/         /' "$TMP/pin.out" "$TMP/pin.err"; fi

pin_env CC=/usr/bin/true "$PKG/tools/llvm-env.sh" --print-env > "$TMP/pin.out" 2> "$TMP/pin.err"
if [ "$(field CC "$TMP/pin.out")" = /usr/bin/true ] \
   && [ "$(field EMIT_TOOLCHAIN_ORIGIN "$TMP/pin.out")" = package ]; then
  ok "an explicit CC beats the pinned CC"
else bad "CC override lost to the pin"; sed 's/^/         /' "$TMP/pin.out" "$TMP/pin.err"; fi

mkdir -p "$TMP/own-gc/include"
pin_env GC_INC="$TMP/own-gc/include" "$PKG/tools/llvm-env.sh" --print-env > "$TMP/pin.out" 2> "$TMP/pin.err"
if [ "$(field EMIT_GC_INC "$TMP/pin.out")" = "$TMP/own-gc/include" ] \
   && [ "$(field EMIT_GC_LIB "$TMP/pin.out")" = "$TMP/pin-gc/lib" ]; then
  ok "a GC_INC override mixes with the pinned GC_LIB per value"
else bad "libgc pin precedence wrong"; sed 's/^/         /' "$TMP/pin.out" "$TMP/pin.err"; fi

write_pin 21
if pin_env "$PKG/tools/llvm-env.sh" --print-env > "$TMP/pin.out" 2> "$TMP/pin.err"; then
  bad "a pin whose clang reports another major was accepted"
elif grep -Fq "package/toolchain.env expects LLVM 21" "$TMP/pin.err"; then
  ok "a pin whose clang reports another major fails, naming the pin file"
else bad "major-mismatch failure did not name the pin"; sed 's/^/         /' "$TMP/pin.err"; fi

write_pin 22 "$TMP/llvm22/bin/missing-clang"
if pin_env "$PKG/tools/llvm-env.sh" --print-env > "$TMP/pin.out" 2> "$TMP/pin.err"; then
  bad "a pin naming a missing clang was accepted"
elif grep -Fq "is not executable" "$TMP/pin.err"; then
  ok "a pin naming a missing clang fails instead of falling back to discovery"
else bad "missing-clang failure unclear"; sed 's/^/         /' "$TMP/pin.err"; fi

pin_env GC_INC="$TMP/gc/include" GC_LIB="$TMP/gc/lib" tools/llvm-env.sh --print-env \
  > "$TMP/pin.out" 2> "$TMP/pin.err"
if [ "$(field EMIT_TOOLCHAIN_ORIGIN "$TMP/pin.out")" = discovery ] \
   && [ -z "$(field EMIT_TOOLCHAIN_PIN "$TMP/pin.out")" ] \
   && [ "$(field EMIT_LLVM_BIN "$TMP/pin.out")" = "$DISTRACT" ]; then
  ok "a checkout without a pin keeps discovery unchanged"
else bad "checkout discovery changed"; sed 's/^/         /' "$TMP/pin.out" "$TMP/pin.err"; fi
echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
