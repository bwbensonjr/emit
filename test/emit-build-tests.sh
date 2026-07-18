#!/usr/bin/env bash
# emit-build-tests.sh -- the `emit build` door + Chez-free program-entry resolver
# (change: emit-build-bin-entry; unified under one binary by emit-cli-unification).
# Chez-FREE: drives `emit run --resolve-program` (mode 10) to resolve a manifest
# `(program NAME (source S) [(output O)])` entry, and `emit build` to deliver a
# standalone native executable through the Chez-free AOT door -- now entirely within
# the compiled `build/emit` binary (it emits the IR in-process and forks clang).
# Parity is against emitting the resolved source's IR and linking it directly -- one
# compile-unit core, no second compilation path.
#
# Run from the repo root:  test/emit-build-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

MOD=test/modules
EMIT=build/emit
RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build $EMIT"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# A manifest with TWO program entries (one with an (output ...), one without) plus the
# libraries prog-mylib.scm imports.  Sources are repo-relative (emit build resolves
# them relative to the repo root).
MAN="$TMP/emit-libs.scm"
cat > "$MAN" <<'EOF'
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (mylib)      (source "test/modules/mylib.sld"))
 (program mylib-app    (source "test/modules/prog-mylib.scm") (output "OUTDIR/mylib-app"))
 (program greet-app    (source "test/modules/prog-mylib.scm")))
EOF
# Point the (output ...) at the temp dir so the suite writes nothing under build/.
sed -i.bak "s#OUTDIR#$TMP#" "$MAN" && rm -f "$MAN.bak"

# A single-program manifest (for the omitted-name case).
ONE="$TMP/one.scm"
cat > "$ONE" <<'EOF'
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (mylib) (source "test/modules/mylib.sld"))
 (program only-app (source "test/modules/prog-mylib.scm")))
EOF

echo "resolver (emit run --resolve-program, Chez-free)"

# 1. resolve a named entry WITH an (output ...): prints source then output.
got="$($RUN --resolve-program mylib-app --manifest "$MAN" < /dev/null 2>/dev/null)"
[ "$got" = "$(printf 'test/modules/prog-mylib.scm\n%s/mylib-app' "$TMP")" ] \
  && ok "resolve mylib-app (source + output)" || bad "resolve mylib-app => [$got]"

# 2. resolve a named entry WITHOUT an (output ...): source then an empty line.
got="$($RUN --resolve-program greet-app --manifest "$MAN" < /dev/null 2>/dev/null)"
[ "$got" = "test/modules/prog-mylib.scm" ] \
  && ok "resolve greet-app (source, empty output)" || bad "resolve greet-app => [$got]"

# 3. omitted name with a SOLE program entry selects it.
got="$($RUN --resolve-program --manifest "$ONE" < /dev/null 2>/dev/null)"
[ "$got" = "test/modules/prog-mylib.scm" ] \
  && ok "resolve sole program (omitted name)" || bad "resolve sole => [$got]"

# 4. unknown program name errors, non-zero exit.
if $RUN --resolve-program nope --manifest "$MAN" < /dev/null >/dev/null 2>"$TMP/e1"; then
  bad "unknown program should fail"
else grep -q "no program entry named nope" "$TMP/e1" && ok "unknown program errors" || bad "unknown program msg"; fi

# 5. omitted name with MULTIPLE program entries is ambiguous, non-zero exit.
if $RUN --resolve-program --manifest "$MAN" < /dev/null >/dev/null 2>"$TMP/e2"; then
  bad "ambiguous omission should fail"
else grep -q "multiple program entries" "$TMP/e2" && ok "ambiguous omission errors" || bad "ambiguous msg"; fi

echo
echo "emit build (Chez-free delivery within build/emit)"

# 6. emit build NAME with an (output ...) delivers a working standalone exe.
if EMIT_VERBOSITY=quiet $EMIT build mylib-app --manifest "$MAN" >"$TMP/b1.log" 2>&1; then
  val="$("$TMP/mylib-app" 2>/dev/null)"
  [ "$val" = "142" ] && ok "emit build mylib-app => $val" || bad "emit build mylib-app => $val"
else bad "emit build mylib-app (build failed)"; sed 's/^/         /' "$TMP/b1.log"; fi

# 7. default output: greet-app has no (output ...) -> build/greet-app (NAME-derived).
if EMIT_VERBOSITY=quiet $EMIT build greet-app --manifest "$MAN" >"$TMP/b2.log" 2>&1; then
  val="$(build/greet-app 2>/dev/null)"
  [ "$val" = "142" ] && ok "emit build greet-app (default output) => $val" || bad "default output => $val"
  rm -f build/greet-app
else bad "emit build greet-app (build failed)"; sed 's/^/         /' "$TMP/b2.log"; fi

# 8. omitted name with a sole program entry builds it.
if EMIT_VERBOSITY=quiet $EMIT build --manifest "$ONE" -o "$TMP/only-app" >"$TMP/b3.log" 2>&1; then
  val="$("$TMP/only-app" 2>/dev/null)"
  [ "$val" = "142" ] && ok "emit build (omitted name, sole program) => $val" || bad "sole build => $val"
else bad "emit build sole (build failed)"; sed 's/^/         /' "$TMP/b3.log"; fi

# 9. unknown verb errors, non-zero exit.
if $EMIT frobnicate >/dev/null 2>"$TMP/e3"; then bad "unknown verb should fail"
else grep -q "unknown verb" "$TMP/e3" && ok "unknown verb errors" || bad "unknown verb msg"; fi

echo
echo "parity: emit build == direct IR emit + clang link on the resolved source"

# 10. emit build NAME and a DIRECT build (emit the resolved source's IR, split on the
#     boundary marker, clang-link every unit with the runtime) produce executables that
#     run to the identical value -- the same compile-unit core, no second path.
if . tools/llvm-env.sh >/dev/null 2>&1; then
  EMIT_VERBOSITY=quiet $EMIT build mylib-app --manifest "$MAN" -o "$TMP/via-emit" >/dev/null 2>&1
  src="$($RUN --resolve-program mylib-app --manifest "$MAN" < /dev/null 2>/dev/null | sed -n 1p)"
  EMIT_MANIFEST="$MAN" $RUN --emit < "$src" > "$TMP/direct.combined.ll" 2>/dev/null
  awk -v dir="$TMP" '
    BEGIN { n = 0; f = dir "/d.0.ll" }
    /^; ==EMIT-UNIT-BOUNDARY==$/ { n++; f = dir "/d." n ".ll"; next }
    { print > f }' "$TMP/direct.combined.ll"
  # shellcheck disable=SC2086
  "$CC" -Wno-override-module -O2 -I"$GC_INC" -L"$GC_LIB" src/runtime/runtime.c "$TMP"/d.*.ll -lgc -o "$TMP/via-direct" 2>/dev/null
  ve="$("$TMP/via-emit" 2>/dev/null)"; vd="$("$TMP/via-direct" 2>/dev/null)"
  [ -n "$ve" ] && [ "$ve" = "$vd" ] && ok "value-parity (emit=$ve direct=$vd)" || bad "value-parity (emit=$ve direct=$vd)"
else
  echo "  [SKIP] value-parity (toolchain discovery failed)"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
