#!/usr/bin/env bash
# Binding identity, local syntax, hygiene, and named frontend diagnostics.
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$(pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
FIX="$ROOT/test/binding-context"
HOST="${EMIT_BINDING_HOST:-both}"
EMIT="$ROOT/build/emit"
pass=0

check_value () {
  local name="$1" want="$2" got
  if [ "$HOST" != native ]; then
    say "compile $FIX/$name.scm -> $TMP/$name [Chez binding acceptance]"
    chez --libdirs src --script src/compile.ss "$FIX/$name.scm" \
      -L "$FIX/lib" -o "$TMP/$name" >"$TMP/$name.build.out" 2>"$TMP/$name.build.err" || {
        cat "$TMP/$name.build.err" >&2; return 1;
      }
    got="$("$TMP/$name")"
    [ "$got" = "$want" ] || { echo "$name: expected $want, got $got" >&2; return 1; }
    pass=$((pass + 1))
  fi
  if [ "$HOST" != chez ]; then
    say "run $FIX/$name.scm -> binding acceptance [native]"
    got="$(EMIT_CACHE="$TMP/cache" "$EMIT" run -L "$FIX/lib" "$FIX/$name.scm")"
    [ "$got" = "$want" ] || { echo "$name: expected $want, got $got" >&2; return 1; }
    got="$(EMIT_CACHE="$TMP/cache" "$EMIT" run -L "$FIX/lib" "$FIX/$name.scm")"
    [ "$got" = "$want" ] || return 1
    "$EMIT" build -L "$FIX/lib" "$FIX/$name.scm" -o "$TMP/$name.native"
    got="$(cd "$TMP" && "./$name.native")"
    [ "$got" = "$want" ] || return 1
    pass=$((pass + 3))
  fi
}

check_error () {
  local name="$1" pattern="$2" host
  for host in chez native; do
    [ "$HOST" != both ] && [ "$HOST" != "$host" ] && continue
    if [ "$host" = chez ]; then
      if chez --libdirs src --script src/compile.ss "$FIX/$name.scm" \
           -L "$FIX/lib" -o "$TMP/error" >"$TMP/error.out" 2>"$TMP/error.err"; then
        echo "$name: expected rejection [Chez]" >&2; return 1
      fi
    else
      if "$EMIT" run -L "$FIX/lib" "$FIX/$name.scm" >"$TMP/error.out" 2>"$TMP/error.err"; then
        echo "$name: expected rejection [native]" >&2; return 1
      fi
    fi
    if ! grep -qE "$pattern" "$TMP/error.err"; then
      cat "$TMP/error.err" >&2; return 1
    fi
    if grep -qE '(car|cdr): not a pair' "$TMP/error.err"; then
      cat "$TMP/error.err" >&2; return 1
    fi
    pass=$((pass + 1))
    if [ "$host" = native ]; then
      if "$EMIT" build -L "$FIX/lib" "$FIX/$name.scm" -o "$TMP/rejected" \
           >"$TMP/error.out" 2>"$TMP/error.err"; then
        echo "$name: expected rejection [native build]" >&2; return 1
      fi
      grep -qE "$pattern" "$TMP/error.err" || { cat "$TMP/error.err" >&2; return 1; }
      pass=$((pass + 1))
    fi
  done
}

check_library_error () {
  local name="$1" pattern="$2"
  say "compile $FIX/lib/scope/$name.sld -> named library diagnostic [$HOST]"
  if [ "$HOST" != native ]; then
    if chez --libdirs src --script src/compile.ss "$FIX/library-$name.scm" \
         -L "$FIX/lib" -o "$TMP/rejected-library" >"$TMP/error.out" 2>"$TMP/error.err"; then
      echo "$name: expected library rejection [Chez]" >&2; return 1
    fi
    grep -qE "$pattern" "$TMP/error.err" || { cat "$TMP/error.err" >&2; return 1; }
    pass=$((pass + 1))
  fi
  if [ "$HOST" != chez ]; then
    if "$EMIT" lib "$FIX/lib/scope/$name.sld" -o "$TMP/artifacts" \
         >"$TMP/error.out" 2>"$TMP/error.err"; then
      echo "$name: expected library rejection [native lib]" >&2; return 1
    fi
    grep -qE "$pattern" "$TMP/error.err" || { cat "$TMP/error.err" >&2; return 1; }
    pass=$((pass + 1))
  fi
}

check_value program '(15 7 3 4 (2 1 0) 7 44 19 caught)'
check_value imported '(42 43 2 same 6 40 6 43)'
check_value write-bindings '"text(1 2)"'
check_value alias-scopes '(3 7 12 #t () 11)'
check_value global-core-shadow '(6 2 3 4 5 6 7 8 9)'
check_value self-shadow-define '5'
check_value self-shadow-begin '5'
check_value self-shadow-record '7'
check_value qualified-source-name '(1 99)'
check_value qualified-library-name '((1 99) 99 99)'
check_value primitive-source-shadow '(42 99 66 7 (8) 6)'
check_value primitive-library-shadow '((42 88) 88)'
check_error unsupported-values 'define-values:.*(unsupported|not supported)'
check_error malformed-syntax 'letrec-syntax|syntax-rules'
check_error malformed-case-lambda 'case-lambda'
check_error hidden-primitive 'unbound variable.*car'
check_error hidden-core 'unbound variable.*if'
check_error imported-assignment '(assign|set!).*import|import.*(assign|set!)'
check_error hidden-imported-macro 'unbound variable.*scope.owner:private'
check_library_error malformed-syntax 'letrec-syntax|syntax-rules'
check_library_error unsupported-values 'define-values:.*(unsupported|not supported)'
check_library_error malformed-case-lambda 'case-lambda'
check_library_error hidden-primitive 'unbound variable.*car'

if [ "$HOST" != chez ]; then
  say "publish $FIX/lib/scope/{owner,facade}.sld -> $TMP/artifacts [context interfaces]"
  mkdir -p "$TMP/artifacts"
  printf '((library (scope owner) (source "%s/lib/scope/owner.sld") (artifacts "%s/artifacts"))\n (library (scope facade) (source "%s/lib/scope/facade.sld") (artifacts "%s/artifacts")))\n' \
    "$FIX" "$TMP" "$FIX" "$TMP" >"$TMP/manifest.scm"
  for unit in owner facade; do
    EMIT_CACHE="$TMP/publish-cache" "$EMIT" lib "$FIX/lib/scope/$unit.sld" \
      --manifest "$TMP/manifest.scm" --no-manifest-chain -o "$TMP/artifacts"
    if grep -qE 'contextual-transformer-v2|syntax-identifier-v2|binding-context-v2' \
         "$TMP/artifacts/scope.$unit.ll"; then
      echo "$unit: compile-time context leaked into runtime IR" >&2; exit 1
    fi
    if [ "$HOST" = both ]; then
      cmp "$TMP/artifacts/scope.$unit.exports" "$ROOT/build/lib/scope.$unit.exports"
      for provider in native chez; do
        if [ "$provider" = native ]; then source="$TMP/artifacts"; else source="$ROOT/build/lib"; fi
        sed '/^target datalayout = /d; /^target triple = /d' "$source/scope.$unit.ll" \
          >"$TMP/$unit.$provider.ll"
      done
      cmp "$TMP/$unit.native.ll" "$TMP/$unit.chez.ll"
      pass=$((pass + 2))
    fi
  done
  say "consume saved context interfaces -> fresh emit run process"
  got="$(EMIT_VERBOSITY=verbose EMIT_CACHE="$TMP/artifact-cache" "$EMIT" run \
    --manifest "$TMP/manifest.scm" --no-manifest-chain "$FIX/imported.scm" 2>"$TMP/artifact.err")"
  [ "$got" = '(42 43 2 same 6 40 6 43)' ]
  for unit in owner facade; do
    grep -Fq "artifact: library scope.$unit: reused from" "$TMP/artifact.err"
  done
  pass=$((pass + 1))
  say "run $FIX/global-core-shadow.scm -> emit repl [runtime core-name bindings]"
  "$EMIT" repl <"$FIX/global-core-shadow.scm" >"$TMP/repl-shadow.out" 2>"$TMP/repl-shadow.err"
  [ "$(awk 'NF {last=$0} END {print last}' "$TMP/repl-shadow.out")" = '(6 2 3 4 5 6 7 8 9)' ]
  pass=$((pass + 1))
  for sample in qualified-source-name qualified-library-name primitive-source-shadow primitive-library-shadow; do
    case "$sample" in
      qualified-source-name) want='(1 99)' ;;
      qualified-library-name) want='((1 99) 99 99)' ;;
      primitive-source-shadow) want='(42 99 66 7 (8) 6)' ;;
      primitive-library-shadow) want='((42 88) 88)' ;;
    esac
    say "run $FIX/$sample.scm -> emit repl [source aliases]"
    "$EMIT" repl -L "$FIX/lib" <"$FIX/$sample.scm" >"$TMP/repl-alias.out" 2>"$TMP/repl-alias.err"
    [ "$(awk 'NF {last=$0} END {print last}' "$TMP/repl-alias.out")" = "$want" ]
    pass=$((pass + 1))
  done
  say "run emit repl -> frontend recovery [malformed syntax then valid input]"
  printf '%s\n' '(define retained 7)' '(letrec-syntax ((m)) (m))' \
    '(define-values (x y . z) (values 1 2 3 4))' \
    '(begin (define leaked 9) (define-syntax escaped (syntax-rules () ((_) 9))) (letrec-syntax ((m)) (m)))' \
    '(+ leaked 1)' '(escaped)' '(+ retained 1)' '(+ 1 2)' \
    | "$EMIT" repl >"$TMP/repl.out" 2>"$TMP/repl.err"
  [ "$(awk 'NF {last=$0} END {print last}' "$TMP/repl.out")" = 3 ]
  grep -qE 'letrec-syntax|syntax-rules' "$TMP/repl.err"
  grep -q 'define-values' "$TMP/repl.err"
  grep -q 'unbound variable.*leaked' "$TMP/repl.err"
  grep -q 'unbound variable.*escaped' "$TMP/repl.err"
  grep -qx 8 "$TMP/repl.out"
  pass=$((pass + 1))
fi
say "test binding contexts -> acceptance [$pass passed, host $HOST]"
