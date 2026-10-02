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

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
