#!/usr/bin/env bash
# user-library-root-chez-tests.sh -- the Chez source driver and the native host find the
# same user library root and the same source in it (change: user-library-root, design D5).
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
make emit >/dev/null
TMP="$(mktemp -d)"
TMP="$(cd "$TMP" && pwd -P)"
trap 'rm -rf "$TMP"' EXIT
started=$SECONDS
unset EMIT_LIBRARY_PATH EMIT_MANIFEST
export EMIT_CACHE="$TMP/cache" HOME="$TMP/home"

fail() { printf 'user library root (Chez): %s\n' "$*" >&2; exit 1; }

mkdir -p "$TMP/xdg/emit/lib/acme" "$TMP/home/.local/share/emit/lib/acme" "$TMP/project"
printf '(define-library (acme util) (export which) (import (scheme base)) (begin (define (which) "%s")))\n' \
  xdg > "$TMP/xdg/emit/lib/acme/util.sld"
printf '(define-library (acme util) (export which) (import (scheme base)) (begin (define (which) "%s")))\n' \
  home > "$TMP/home/.local/share/emit/lib/acme/util.sld"
printf '()\n' > "$TMP/project/emit-libs.scm"
printf '(import (scheme base) (scheme write) (acme util))\n(display (which))\n' > "$TMP/project/p.scm"

# Each driver resolves (acme util) under the same environment; the manifest keeps the
# project root at $TMP/project/lib, which does not exist.
for xdg in "$TMP/xdg" relative; do
  want=xdg; [ "$xdg" = relative ] && want=home
  XDG_DATA_HOME="$xdg" chez --libdirs src --script src/compile.ss "$TMP/project/p.scm" \
    -o "$TMP/chez-app" --manifest "$TMP/project/emit-libs.scm" -L "$PWD/lib" \
    > "$TMP/chez.log" 2> "$TMP/chez.err" || { cat "$TMP/chez.err" >&2; fail "Chez build"; }
  chez_got="$("$TMP/chez-app")"
  native_got="$(XDG_DATA_HOME="$xdg" build/emit run --manifest "$TMP/project/emit-libs.scm" \
    -L "$PWD/lib" "$TMP/project/p.scm" 2> "$TMP/native.err")" || { cat "$TMP/native.err" >&2; fail "native run"; }
  [ "$chez_got" = "$want" ] && [ "$native_got" = "$want" ] \
    || fail "XDG_DATA_HOME=$xdg: Chez $chez_got, native $native_got, want $want"
  vsay "  case XDG_DATA_HOME=$xdg -> $want root in both drivers"
done

# The opt-out applies to the Chez driver too: (acme util) is the only non-baked import.
printf '(import (scheme base) (acme util))\n(which)\n' > "$TMP/project/q.scm"
# The Chez driver resolves the standard libraries from a root too, so the checkout's
# manifest supplies them exactly while every conventional root is off.
if XDG_DATA_HOME="$TMP/xdg" chez --libdirs src --script src/compile.ss "$TMP/project/q.scm" \
     -o "$TMP/chez-off" --manifest "$PWD/emit-libs.scm" --no-library-paths \
     > "$TMP/chez.log" 2> "$TMP/chez.err"; then
  fail "Chez --no-library-paths resolved from the user root"
fi
grep -Fq "(acme util)" "$TMP/chez.err" || { cat "$TMP/chez.err" >&2; fail "opt-out failed for another reason"; }
say "test user library root -> Chez and native agree  [3 cases, $((SECONDS - started))s]"
