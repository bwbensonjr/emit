#!/usr/bin/env bash
# native-build-config-tests.sh -- content-sensitive Make discovery/configuration regressions.
#
# Uses two proxy paths for the same real llvm-config.  Their different identities exercise the
# real Make dependency graph without requiring two LLVM installations or changing compatibility.
# Run from the repo root: test/native-build-config-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

TMP="$(mktemp -d)"
restore () {
  make all >/dev/null 2>&1 || true
  rm -rf "$TMP"
}
trap restore EXIT HUP INT TERM

pass=0; fail=0
ok  () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }
mtime () { stat -f %m "$1" 2>/dev/null || stat -c %Y "$1"; }

if ! . tools/llvm-env.sh >/dev/null 2>&1; then
  echo "  [FAIL] could not discover the real toolchain"
  exit 1
fi
REAL_LLVM_CONFIG="$LLVM_CONFIG"
PREFIX="$TMP/prefix"
WRAP_A="$TMP/toolchain-a/llvm-config"
WRAP_B="$TMP/toolchain-b/llvm-config"

make_proxy () {
  local path="$1"
  mkdir -p "$(dirname "$path")"
  printf '%s\n' '#!/usr/bin/env bash' \
    'exec "${EMIT_TEST_REAL_LLVM_CONFIG:?}" "$@"' > "$path"
  chmod +x "$path"
}
make_proxy "$WRAP_A"
make_proxy "$WRAP_B"

run_make () {
  EMIT_TEST_REAL_LLVM_CONFIG="$REAL_LLVM_CONFIG" \
    make LLVM_CONFIG="$1" PREFIX="$PREFIX" "${@:2}"
}

if ! run_make "$WRAP_A" build/native-config >"$TMP/config-a.log" 2>&1; then
  bad "initial controlled configuration failed"
  sed 's/^/         /' "$TMP/config-a.log"
  echo
  echo "  $pass passed, $fail failed"
  exit 1
fi

expected='CC CXX LLVM_CONFIG GC_INC GC_LIB CXXFLAGS LDFLAGS PREFIX'
missing=""
for key in $expected; do
  grep -q "^$key=" build/native-config || missing="$missing $key"
done
if [ -z "$missing" ] && ! grep -q '^DESTDIR=' build/native-config; then
  ok "native signature covers compilers, LLVM, libgc, flags, and PREFIX but not DESTDIR"
else
  bad "native signature keys are incomplete or include DESTDIR:$missing"
fi

llvm_before="$(mtime build/llvm.mk)"
config_before="$(mtime build/native-config)"
if run_make "$WRAP_A" build/native-config >"$TMP/config-same.log" 2>&1 \
   && [ "$llvm_before" = "$(mtime build/llvm.mk)" ] \
   && [ "$config_before" = "$(mtime build/native-config)" ]; then
  ok "identical discovery and configuration preserve both timestamps"
else
  bad "identical discovery or configuration rewrote a generated input"
fi

sleep 1
if run_make "$WRAP_B" build/native-config >"$TMP/config-b.log" 2>&1 \
   && [ "$llvm_before" -lt "$(mtime build/llvm.mk)" ] \
   && [ "$config_before" -lt "$(mtime build/native-config)" ]; then
  ok "a changed discovered LLVM identity refreshes the include and signature once"
else
  bad "changed discovery did not refresh both generated inputs"
  sed 's/^/         /' "$TMP/config-b.log"
fi

# Establish an installed binary under proxy A, then change only the controlled LLVM identity.
if ! run_make "$WRAP_A" install >"$TMP/install-a.log" 2>&1; then
  bad "controlled baseline install failed"
  sed 's/^/         /' "$TMP/install-a.log"
elif ! run_make "$WRAP_B" install >"$TMP/install-b.log" 2>&1; then
  bad "install after the toolchain identity transition failed"
  sed 's/^/         /' "$TMP/install-b.log"
else
  compile_line="$(grep -n -- '-c src/emit.cpp -o build/emit.o' "$TMP/install-b.log" | head -1 | cut -d: -f1)"
  link_line="$(grep -n -- 'build/emit.o build/runtime-host.o' "$TMP/install-b.log" | head -1 | cut -d: -f1)"
  copy_line="$(grep -n -- 'install build/emit -> .*bin/emit' "$TMP/install-b.log" | tail -1 | cut -d: -f1)"
  if [ -n "$compile_line" ] && [ -n "$link_line" ] && [ -n "$copy_line" ] \
     && [ "$compile_line" -lt "$link_line" ] && [ "$link_line" -lt "$copy_line" ]; then
    ok "a toolchain identity change recompiles and relinks before installation"
  else
    bad "the transitioned install did not compile, link, and copy in order"
    sed 's/^/         /' "$TMP/install-b.log"
  fi
fi

if got="$(printf '(+ 19 23)\n' | EMIT_VERBOSITY=quiet "$PREFIX/bin/emit" repl 2>/dev/null)" \
   && [ "$got" = "42" ]; then
  ok "the binary installed after the transition runs the REPL => $got"
else
  bad "the binary installed after the transition did not evaluate a trivial form"
fi

if run_make "$WRAP_B" all >"$TMP/no-change.log" 2>&1 \
   && ! grep -Eq -- '-c src/|build/emit\.o build/runtime-host\.o' "$TMP/no-change.log"; then
  ok "unchanged native configuration emits no compile or link commands"
else
  bad "unchanged native configuration rebuilt a native output"
  sed 's/^/         /' "$TMP/no-change.log"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
