#!/usr/bin/env bash
# Focused runtime and macro composition regressions for #120 and #121.
#
# Run with EMIT_COMPOSITION_HOST=chez to exercise the current shared source core
# before regen. The default runs the shipped compiler and also the Chez driver
# when Chez is installed.
set -uo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh

HOST="${EMIT_COMPOSITION_HOST:-both}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
NATIVE_ARTIFACTS="$TMP/native-artifacts"
CHEZ_ARTIFACTS="$TMP/chez-artifacts"
NATIVE_MAN="$TMP/native-libs.scm"
CHEZ_MAN="$TMP/chez-libs.scm"
mkdir -p "$NATIVE_ARTIFACTS" "$CHEZ_ARTIFACTS"
write_manifest () { # <manifest-path> <artifact-directory>
  local manifest="$1" artifacts="$2"
  cat > "$manifest" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld") (artifacts "$artifacts"))
 (library (scheme base) (source "$PWD/lib/scheme/base.sld") (artifacts "$artifacts"))
 (library (scheme cxr) (source "$PWD/lib/scheme/cxr.sld") (artifacts "$artifacts"))
 (library (scheme case-lambda) (source "$PWD/lib/scheme/case-lambda.sld") (artifacts "$artifacts"))
 (library (composition internal definitions) (source "$PWD/test/library-composition/internal-definitions.sld") (artifacts "$artifacts"))
 (library (composition escaped) (source "$PWD/test/library-composition/escaped.sld") (artifacts "$artifacts"))
 (library (composition repro facade) (source "$PWD/test/library-composition/repro-121-facade.sld") (artifacts "$artifacts"))
 (library (composition repro macro source) (source "$PWD/test/library-composition/repro-120-source.sld") (artifacts "$artifacts"))
 (library (composition runtime owner) (source "$PWD/test/library-composition/runtime-owner.sld") (artifacts "$artifacts"))
 (library (composition runtime facade) (source "$PWD/test/library-composition/runtime-facade.sld") (artifacts "$artifacts"))
 (library (composition runtime facade two) (source "$PWD/test/library-composition/runtime-facade-two.sld") (artifacts "$artifacts"))
 (library (composition runtime facade left) (source "$PWD/test/library-composition/runtime-facade-left.sld") (artifacts "$artifacts"))
 (library (composition runtime facade right) (source "$PWD/test/library-composition/runtime-facade-right.sld") (artifacts "$artifacts"))
 (library (composition runtime shadow) (source "$PWD/test/library-composition/runtime-shadow.sld") (artifacts "$artifacts"))
 (library (composition runtime empty) (source "$PWD/test/library-composition/runtime-empty.sld") (artifacts "$artifacts"))
 (library (composition macro owner) (source "$PWD/test/library-composition/macro-owner.sld") (artifacts "$artifacts"))
 (library (composition macro middle) (source "$PWD/test/library-composition/macro-middle.sld") (artifacts "$artifacts"))
 (library (composition macro facade) (source "$PWD/test/library-composition/macro-facade.sld") (artifacts "$artifacts")))
EOF
}
write_manifest "$NATIVE_MAN" "$NATIVE_ARTIFACTS"
write_manifest "$CHEZ_MAN" "$CHEZ_ARTIFACTS"
MAN="$NATIVE_MAN"
TABLE_DIR="$NATIVE_ARTIFACTS"
pass=0
fail=0

ok () { echo "  [OK  ] $1"; pass=$((pass + 1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail + 1)); }

run_one () { # <host> <program-file> <expected>
  local host="$1" program="$2" expected="$3" got="" name
  name="$(basename "$program" .scm)"
  if [ "$host" = chez ]; then
    if ! chez --libdirs src --script src/compile.ss "$program" --manifest "$MAN" \
        -o "$TMP/$name" >"$TMP/$name.compile.out" 2>"$TMP/$name.compile.err"; then
      bad "$host $name (compile failed)"
      sed 's/^/         /' "$TMP/$name.compile.err"
      return
    fi
    if ! got="$("$TMP/$name" 2>"$TMP/$name.run.err")"; then
      bad "$host $name (execution failed)"
      sed 's/^/         /' "$TMP/$name.run.err"
      return
    fi
  else
    if ! got="$(build/emit run "$program" --manifest "$MAN" 2>"$TMP/$name.native.err")"; then
      bad "$host $name (execution failed)"
      sed 's/^/         /' "$TMP/$name.native.err"
      return
    fi
  fi
  if [ "$got" = "$expected" ]; then
    ok "$host $name => $got"
  else
    bad "$host $name => $got (expected $expected)"
    sed 's/^/         /' "$TMP/$name.native.err" 2>/dev/null || true
  fi
}

reject_compile () { # <host> <name> <source-text> <diagnostic-regex>
  local host="$1" name="$2" source="$3" pattern="$4"
  printf '%s\n' "$source" > "$TMP/$name.scm"
  if [ "$host" = chez ]; then
    if chez --libdirs src --script src/compile.ss "$TMP/$name.scm" --manifest "$MAN" \
        -o "$TMP/$name" >"$TMP/$name.out" 2>"$TMP/$name.err"; then
      bad "$host $name (unexpectedly compiled)"
    elif grep -Eq "$pattern" "$TMP/$name.err"; then
      ok "$host $name (rejected by expected diagnostic)"
    else
      bad "$host $name (wrong diagnostic)"
      sed 's/^/         /' "$TMP/$name.err"
    fi
  else
    if build/emit run "$TMP/$name.scm" --manifest "$MAN" >"$TMP/$name.out" 2>"$TMP/$name.err"; then
      bad "$host $name (unexpectedly compiled)"
    elif grep -Eq "$pattern" "$TMP/$name.err"; then
      ok "$host $name (rejected by expected diagnostic)"
    else
      bad "$host $name (wrong diagnostic)"
      sed 's/^/         /' "$TMP/$name.err"
    fi
  fi
}

hosts=()
case "$HOST" in
  chez) hosts=(chez) ;;
  native) hosts=(native) ;;
  both)
    hosts=(native)
    if command -v chez >/dev/null 2>&1; then hosts+=(chez); fi
    ;;
  *) echo "EMIT_COMPOSITION_HOST must be chez, native, or both" >&2; exit 2 ;;
esac

if [[ " ${hosts[*]} " == *" native "* ]]; then
  make emit >/dev/null 2>&1 || { echo "failed to build build/emit" >&2; exit 1; }
fi

echo "library composition regressions (#120, #121): hosts=${hosts[*]}"

# Runtime values and procedures pass through two facades. The import and export
# renames compose, the local definition shadows its imported name, and owner state
# is updated before the facade reads it.
for host in "${hosts[@]}"; do
  if [ "$host" = chez ]; then
    MAN="$CHEZ_MAN"
    TABLE_DIR="$CHEZ_ARTIFACTS"
  else
    MAN="$NATIVE_MAN"
    TABLE_DIR="$NATIVE_ARTIFACTS"
  fi
  run_one "$host" test/library-composition/repro-121.scm 3
  run_one "$host" test/library-composition/escaped-program.scm '(34 92 10 9 13 0 1 127)'
  run_one "$host" test/library-composition/escaped-program.scm '(34 92 10 9 13 0 1 127)'
  if [ "$host" = chez ]; then
    if grep -Fq 'reuse (composition escaped)' "$TMP/escaped-program.compile.err"; then
      ok "Chez escaped macro interface reused on warm compilation"
    else
      bad "Chez escaped macro interface was not reused"
      cat "$TMP/escaped-program.compile.err"
    fi
  fi
  run_one "$host" test/library-composition/internal-definitions-program.scm \
    '((#f #f (1 2 3) 6 41) (4 5))'
  run_one "$host" test/library-composition/lower-order-program.scm '(#t #t #t #t #t #t)'
  if [ "$host" = native ]; then
    if build/emit build test/library-composition/internal-definitions-program.scm \
        --manifest "$MAN" -o "$TMP/internal-definitions" \
        >"$TMP/internal-definitions.build.out" 2>"$TMP/internal-definitions.build.err" && \
       got="$("$TMP/internal-definitions" 2>"$TMP/internal-definitions.exe.err")" && \
       [ "$got" = '((#f #f (1 2 3) 6 41) (4 5))' ]; then
      ok "native internal definitions [delivered executable]"
    else
      bad "native internal definitions [delivered executable]"
      cat "$TMP/internal-definitions.build.err" "$TMP/internal-definitions.exe.err" 2>/dev/null
    fi
    if got="$(build/emit repl --manifest "$MAN" \
        < test/library-composition/internal-definitions-program.scm \
        2>"$TMP/internal-definitions.repl.err" | awk 'NF{last=$0} END{print last}')" && \
       [ "$got" = '((#f #f (1 2 3) 6 41) (4 5))' ]; then
      ok "native internal definitions [REPL]"
    else
      bad "native internal definitions [REPL]"
      cat "$TMP/internal-definitions.repl.err"
    fi
  fi
  run_one "$host" test/library-composition/runtime-program.scm '(4 5 101 21 (1 2) (1 2 3 4) (1 2 3))'
  if [ "$host" = chez ]; then
    runtime_ir="$TMP/runtime-program.ll"
  else
    runtime_ir="$TMP/runtime-program.native.ll"
    if ! build/emit run test/library-composition/runtime-program.scm --manifest "$MAN" \
        --emit >"$runtime_ir" 2>"$TMP/runtime-program.native.err"; then
      bad "$host runtime-program IR (emit failed)"
      sed 's/^/         /' "$TMP/runtime-program.native.err"
      runtime_ir=""
    fi
  fi
  if [ -n "$runtime_ir" ] && \
     grep -Fq 'call fastcc i64 @"composition.runtime.owner:code:fixed"' "$runtime_ir" && \
     grep -Fq 'call fastcc i64 @"min-entry:$composition.runtime.owner$ccode$ccollect"' "$runtime_ir" && \
     grep -Fq 'call fastcc i64 @"composition.runtime.owner:code:collect"' "$runtime_ir" && \
     ! grep -Fq 'call fastcc i64 @"composition.runtime.owner:code:dynamic"' "$runtime_ir"; then
    ok "$host direct-call IR preserves owner labels and dynamic fallback"
  else
    bad "$host direct-call IR lost forwarded labels or made mutable procedure direct"
  fi
  run_one "$host" test/library-composition/empty-program.scm '(1 2)'
  run_one "$host" test/library-composition/diamond-program.scm '(1 1)'
  run_one "$host" test/library-composition/except-program.scm 1
  run_one "$host" test/library-composition/macro-program.scm 12
  run_one "$host" test/library-composition/repro-120.scm '(1 5)'
  reject_compile "$host" "${host}-imported-set" \
    '(import (composition runtime facade)) (set! value 9)' \
    'imported|cannot assign|set!.*value'
  reject_compile "$host" "${host}-hidden-macro" \
    '(import (composition macro facade)) (seeded 7)' \
    'unbound variable( with irritant)? seeded'
done

# Compile and execute a wrong-arity imported call. Variadic metadata preserves a
# minimum arity of two, while apply remains an indirect value call tested above.
printf '%s\n' '(import (composition runtime facade))' '(collect 1)' > "$TMP/wrong-arity.scm"
for host in "${hosts[@]}"; do
  if [ "$host" = chez ]; then MAN="$CHEZ_MAN"; else MAN="$NATIVE_MAN"; fi
  if [ "$host" = chez ]; then
    if ! chez --libdirs src --script src/compile.ss "$TMP/wrong-arity.scm" \
        --manifest "$MAN" -o "$TMP/wrong-arity" >"$TMP/wrong-arity.compile.out" \
        2>"$TMP/wrong-arity.compile.err"; then
      bad "$host wrong-arity (compile failed before call)"
    elif "$TMP/wrong-arity" >"$TMP/wrong-arity.out" 2>"$TMP/wrong-arity.err"; then
      bad "$host wrong-arity (unexpectedly succeeded)"
    elif grep -Fq 'arity error: expected 2 argument(s), got 1' "$TMP/wrong-arity.err"; then
      ok "$host wrong-arity traps"
    else
      bad "$host wrong-arity (wrong diagnostic)"
      cat "$TMP/wrong-arity.err"
    fi
  elif build/emit run "$TMP/wrong-arity.scm" --manifest "$MAN" \
      >"$TMP/wrong-arity.out" 2>"$TMP/wrong-arity.err"; then
    bad "$host wrong-arity (unexpectedly succeeded)"
  elif grep -Fq 'arity error: expected 2 argument(s), got 1' "$TMP/wrong-arity.err"; then
    ok "$host wrong-arity traps"
  else
    bad "$host wrong-arity (wrong diagnostic)"
    cat "$TMP/wrong-arity.err"
  fi
done

# The saved source-driven interfaces pin original ownership and the complete
# variadic call descriptor, including its exact-minimum entry. Facades must not
# invent facade-owned storage or labels.
if [[ " ${hosts[*]} " == *" native "* ]]; then
  MAN="$NATIVE_MAN"
  say "compile focused fixture closure -> $NATIVE_ARTIFACTS [native emit lib]"
  native_sources=(
    lib/emit/internal.sld lib/scheme/base.sld lib/scheme/cxr.sld lib/scheme/case-lambda.sld
    test/library-composition/runtime-owner.sld
    test/library-composition/escaped.sld
    test/library-composition/runtime-facade.sld
    test/library-composition/runtime-facade-two.sld
    test/library-composition/runtime-facade-left.sld
    test/library-composition/runtime-facade-right.sld
    test/library-composition/runtime-shadow.sld
    test/library-composition/runtime-empty.sld
    test/library-composition/macro-owner.sld
    test/library-composition/macro-middle.sld
    test/library-composition/macro-facade.sld
    test/library-composition/repro-120-source.sld
    test/library-composition/repro-121-facade.sld
  )
  for source in "${native_sources[@]}"; do
    if ! build/emit lib "$source" --manifest "$NATIVE_MAN" -o "$NATIVE_ARTIFACTS" \
        >"$TMP/lib-$(basename "$source").out" 2>"$TMP/lib-$(basename "$source").err"; then
      bad "native saved artifact $source (compile failed)"
      sed 's/^/         /' "$TMP/lib-$(basename "$source").err"
    fi
  done
fi
if [[ " ${hosts[*]} " == *" chez "* ]]; then TABLE_DIR="$CHEZ_ARTIFACTS"; else TABLE_DIR="$NATIVE_ARTIFACTS"; fi

# The two hosts must produce their own artifacts from source before comparison.
# Chez has populated only its private artifact directory through the importer
# programs above; native emit lib independently compiles the complete closure.
if [[ " ${hosts[*]} " == *" native "* ]] && [[ " ${hosts[*]} " == *" chez "* ]]; then
  units=(
    emit.internal scheme.base scheme.cxr scheme.case-lambda
    composition.escaped
    composition.repro.facade composition.repro.macro.source
    composition.runtime.owner composition.runtime.facade composition.runtime.facade.two
    composition.runtime.facade.left composition.runtime.facade.right
    composition.runtime.shadow composition.runtime.empty
    composition.macro.owner composition.macro.middle composition.macro.facade
  )
  say "compare focused fixture artifacts -> cross-host parity [${#units[@]} libraries]"
  for unit in "${units[@]}"; do
    native_exports="$NATIVE_ARTIFACTS/$unit.exports"
    chez_exports="$CHEZ_ARTIFACTS/$unit.exports"
    native_ll="$NATIVE_ARTIFACTS/$unit.ll"
    chez_ll="$CHEZ_ARTIFACTS/$unit.ll"
    if [ ! -s "$native_exports" ] || [ ! -s "$chez_exports" ] || \
       [ ! -s "$native_ll" ] || [ ! -s "$chez_ll" ]; then
      bad "$unit cross-host artifacts missing"
      continue
    fi
    if cmp -s "$native_exports" "$chez_exports"; then
      ok "$unit full exports identical [Chez / emit lib]"
    else
      bad "$unit full exports differ [Chez / emit lib]"
    fi
    sed '/^target datalayout = /d; /^target triple = /d' "$native_ll" \
      > "$TMP/$unit.native-core.ll"
    sed '/^target datalayout = /d; /^target triple = /d' "$chez_ll" \
      > "$TMP/$unit.chez-core.ll"
    if cmp -s "$TMP/$unit.native-core.ll" "$TMP/$unit.chez-core.ll"; then
      bytes="$(wc -c < "$TMP/$unit.native-core.ll" | tr -d ' ')"
      ok "$unit full IR identical [${bytes} bytes, headers normalized]"
    else
      bad "$unit full IR differs [Chez / emit lib]"
    fi
  done
fi

if [ -s "$TABLE_DIR/composition.runtime.facade.exports" ] && \
   grep -Fq '(value . "composition.runtime.owner:value")' "$TABLE_DIR/composition.runtime.facade.exports" && \
   grep -Fq '(renamed-fixed "composition.runtime.owner:code:fixed" 1)' "$TABLE_DIR/composition.runtime.facade.exports" && \
   grep -Fq '(collect "composition.runtime.owner:code:collect" 2 rest "min-entry:$composition.runtime.owner$ccode$ccollect")' "$TABLE_DIR/composition.runtime.facade.exports" && \
   ! grep -Fq 'composition.runtime.facade:value' "$TABLE_DIR/composition.runtime.facade.exports"; then
  ok "saved interface forwards owner locations and fixed/variadic descriptors"
else
  bad "saved interface does not preserve original owner targets and descriptors"
fi
if grep -Fq '(dynamic . "composition.runtime.owner:dynamic")' \
    "$TABLE_DIR/composition.runtime.facade.exports" && \
   ! grep -Eq '\(dynamic "' "$TABLE_DIR/composition.runtime.facade.exports"; then
  ok "mutable imported procedure keeps its owner location without a stable call row"
else
  bad "mutable imported procedure acquired a copied location or stable call row"
fi
if [ -s "$TABLE_DIR/composition.macro.facade.exports" ] && \
   grep -Fq 'composition.macro.owner:%private-step' "$TABLE_DIR/composition.macro.facade.exports" && \
   grep -Fq 'composition.macro.owner:%private-loop' "$TABLE_DIR/composition.macro.facade.exports" && \
   grep -Fq '"composition.macro.owner:private-runtime"' "$TABLE_DIR/composition.macro.facade.exports" && \
   grep -Fq 'scheme.case-lambda:case-lambda-dispatch' "$TABLE_DIR/composition.repro.macro.source.exports"; then
  ok "saved macro interfaces carry private transformer and runtime dependencies"
else
  bad "saved macro interfaces omit private dependencies"
fi

if [ "${hosts[0]}" = chez ]; then
  repeat_manifest="$CHEZ_MAN"
  repeat_artifacts="$CHEZ_ARTIFACTS"
else
  repeat_manifest="$NATIVE_MAN"
  repeat_artifacts="$NATIVE_ARTIFACTS"
fi
cp "$repeat_artifacts/composition.macro.facade.exports" "$TMP/macro-facade.first.exports"
if [ "${hosts[0]}" = chez ]; then
  if chez --libdirs src --script src/compile.ss test/library-composition/macro-program.scm \
      --manifest "$repeat_manifest" -o "$TMP/macro-repeat" >"$TMP/macro-repeat.out" \
      2>"$TMP/macro-repeat.err" && \
     cmp -s "$TMP/macro-facade.first.exports" \
       "$repeat_artifacts/composition.macro.facade.exports"; then
    ok "repeated source build preserves the serialized macro interface byte-for-byte"
  else
    bad "repeated source build changed or failed to reproduce the macro interface"
  fi
else
  if build/emit lib test/library-composition/macro-facade.sld --manifest "$repeat_manifest" \
      -o "$repeat_artifacts" >"$TMP/macro-repeat.out" 2>"$TMP/macro-repeat.err" && \
     cmp -s "$TMP/macro-facade.first.exports" \
       "$repeat_artifacts/composition.macro.facade.exports"; then
    ok "repeated native build preserves the serialized macro interface byte-for-byte"
  else
    bad "repeated native build changed or failed to reproduce the macro interface"
    sed 's/^/         /' "$TMP/macro-repeat.err"
  fi
fi

# Invalid export cases are library compilation errors; an import-set-hidden name
# cannot be re-exported, and a spelling with no binding remains undefined.
cat > "$TMP/invalid-hidden.sld" <<'EOF'
(define-library (composition invalid hidden)
  (import (only (composition runtime owner) value))
  (export fixed))
EOF
cat > "$TMP/invalid-undefined.sld" <<'EOF'
(define-library (composition invalid undefined)
  (export missing))
EOF
for host in "${hosts[@]}"; do
  if [ "$host" = chez ]; then
    MAN="$CHEZ_MAN"
    TABLE_DIR="$CHEZ_ARTIFACTS"
  else
    MAN="$NATIVE_MAN"
    TABLE_DIR="$NATIVE_ARTIFACTS"
  fi
  for invalid in hidden undefined; do
    if [ "$host" = chez ]; then
      if chez --libdirs src --script src/compile.ss "$TMP/invalid-$invalid.sld" \
          --manifest "$MAN" -o "$TMP/invalid-$invalid" >"$TMP/invalid-$invalid.out" \
          2>"$TMP/invalid-$invalid.err"; then
        bad "$host export-$invalid (unexpectedly compiled)"
      elif grep -Eq 'does not define|unbound|export' "$TMP/invalid-$invalid.err"; then
        ok "$host export-$invalid rejected"
      else
        bad "$host export-$invalid (wrong diagnostic)"
        sed 's/^/         /' "$TMP/invalid-$invalid.err"
      fi
    else
      if build/emit lib "$TMP/invalid-$invalid.sld" --manifest "$MAN" -o "$TABLE_DIR" \
          >"$TMP/invalid-$invalid.out" 2>"$TMP/invalid-$invalid.err"; then
        bad "$host export-$invalid (unexpectedly compiled)"
      elif grep -Eq 'does not define|unbound|export' "$TMP/invalid-$invalid.err"; then
        ok "$host export-$invalid rejected"
      else
        bad "$host export-$invalid (wrong diagnostic)"
        sed 's/^/         /' "$TMP/invalid-$invalid.err"
      fi
    fi
  done
done

echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
