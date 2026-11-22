#!/usr/bin/env bash
# user-library-root-tests.sh -- the default user library root (change: user-library-root).
# Location rules, precedence against project, environment, and installed roots, the
# --no-library-paths opt-out, doctor rows, and help.  Every case sets its own HOME and
# XDG_DATA_HOME, so a developer's real ~/.local/share/emit/lib never takes part.
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
REPO="$PWD"
make emit >/dev/null
TMP="$(mktemp -d)"
TMP="$(cd "$TMP" && pwd -P)"
trap 'rm -rf "$TMP"' EXIT
started=$SECONDS
unset EMIT_LIBRARY_PATH EMIT_MANIFEST
export EMIT_CACHE="$TMP/cache"
cases=0

fail() { printf 'user library root test: %s\n' "$*" >&2; exit 1; }
has() { grep -Fq -- "$2" "$1" || { cat "$1" >&2; fail "$1 lacks: $2"; }; }
pass() { cases=$((cases + 1)); vsay "  case $1"; }

# A library whose value says which copy answered.
library() {
  mkdir -p "$1/acme"
  printf '(define-library (acme util) (export which) (import (scheme base)) (begin (define (which) %s)))\n' \
    "$2" > "$1/acme/util.sld"
}

# A relocatable installation: the binary under PREFIX/bin, so its installed providers are
# PREFIX/share/emit/emit-libs.scm and PREFIX/share/emit/lib.
PREFIX="$TMP/prefix"
mkdir -p "$PREFIX/bin" "$PREFIX/share/emit"
cp build/emit "$PREFIX/bin/emit"
printf '()\n' > "$PREFIX/share/emit/emit-libs.scm"
EMIT="$PREFIX/bin/emit"
STD="$REPO/lib"

mkdir -p "$TMP/work"
cd "$TMP/work"
printf '(import (scheme base) (scheme write) (acme util))\n(display (which))\n' > p.scm
run() { "$EMIT" run -L "$STD" p.scm 2> "$TMP/err"; }

# Location: an absolute XDG_DATA_HOME selects $XDG_DATA_HOME/emit/lib, from any directory.
library "$TMP/xdg/emit/lib" '"user-xdg"'
got="$(HOME="$TMP/home" XDG_DATA_HOME="$TMP/xdg" EMIT_VERBOSITY=verbose run)" \
  || { cat "$TMP/err" >&2; fail "xdg run"; }
[ "$got" = user-xdg ] || fail "XDG_DATA_HOME root: got $got"
has "$TMP/err" "resolve library (acme util) -> $TMP/xdg/emit/lib/acme/util.sld  [directory $TMP/xdg/emit/lib]"
pass "XDG_DATA_HOME selects the root and narration names it"

# Location: HOME/.local/share/emit/lib when XDG_DATA_HOME is unset, empty, or relative.
library "$TMP/home/.local/share/emit/lib" '"user-home"'
got="$(env -u XDG_DATA_HOME HOME="$TMP/home" "$EMIT" run -L "$STD" p.scm 2>"$TMP/err")" || fail "home run"
[ "$got" = user-home ] || fail "HOME fallback (unset): got $got"
for xdg in "" relative/data; do
  got="$(HOME="$TMP/home" XDG_DATA_HOME="$xdg" run)" || fail "home run with XDG_DATA_HOME=[$xdg]"
  [ "$got" = user-home ] || fail "HOME fallback (XDG_DATA_HOME=[$xdg]): got $got"
done
pass "HOME fallback for an unset, empty, or relative XDG_DATA_HOME"

export HOME="$TMP/home" XDG_DATA_HOME="$TMP/xdg"

# Precedence: project lib/ over the user root.
library "$TMP/work/lib" '"project"'
[ "$(run)" = project ] || fail "project lib/ did not override the user root"
rm -rf "$TMP/work/lib"
pass "project lib/ overrides the user root"

# Precedence: EMIT_LIBRARY_PATH over the user root.
library "$TMP/environment" '"environment"'
[ "$(EMIT_LIBRARY_PATH="$TMP/environment" run)" = environment ] \
  || fail "EMIT_LIBRARY_PATH did not override the user root"
pass "EMIT_LIBRARY_PATH overrides the user root"

# Precedence: the user root over an installed non-baked library.
library "$PREFIX/share/emit/lib" '"installed"'
[ "$(run)" = user-xdg ] || fail "installed root overrode the user root"
mv "$TMP/xdg/emit/lib" "$TMP/xdg/emit/hidden"
[ "$(run)" = installed ] || fail "missing user root did not fall through to installed"
mv "$TMP/xdg/emit/hidden" "$TMP/xdg/emit/lib"
rm -rf "$PREFIX/share/emit/lib"
pass "the user root overrides installed; a missing user root falls through"

# A baked library is never replaced by a user-root file of the same name.
mkdir -p "$TMP/xdg/emit/lib/scheme"
printf '(define-library (scheme base) (export) (begin (error "user copy loaded")))\n' \
  > "$TMP/xdg/emit/lib/scheme/base.sld"
[ "$(run)" = user-xdg ] || fail "baked (scheme base) was displaced"
rm -rf "$TMP/xdg/emit/lib/scheme"
pass "baked libraries still win"

# Opt-out: --no-library-paths does not probe the user root.
if "$EMIT" run --no-library-paths p.scm > "$TMP/out" 2> "$TMP/err"; then
  fail "--no-library-paths still resolved from the user root"
fi
has "$TMP/err" "(acme util)"
pass "--no-library-paths disables the user root"

# Doctor: available, missing, and unavailable rows; none fails the check.  The checkout
# binary is used here because the copied one lacks the support files doctor requires.
DOCTOR="$REPO/build/emit"
"$DOCTOR" doctor -q > "$TMP/doctor" 2>&1 || { cat "$TMP/doctor" >&2; fail "doctor with an available user root"; }
has "$TMP/doctor" "directory $TMP/xdg/emit/lib [user, XDG_DATA_HOME; available]"
grep -n '^provider' "$TMP/doctor" > "$TMP/order"
project_line="$(grep -n '\[project;' "$TMP/order" | cut -d: -f1)"
user_line="$(grep -n '\[user, ' "$TMP/order" | cut -d: -f1)"
installed_line="$(grep -n '\[installed' "$TMP/order" | head -1 | cut -d: -f1)"
[ "$project_line" -lt "$user_line" ] && [ "$user_line" -lt "$installed_line" ] \
  || { cat "$TMP/order" >&2; fail "doctor order is not project, user, installed"; }
XDG_DATA_HOME="$TMP/nowhere" "$DOCTOR" doctor -q > "$TMP/doctor" 2>&1 \
  || { cat "$TMP/doctor" >&2; fail "doctor failed on a missing user root"; }
has "$TMP/doctor" "directory $TMP/nowhere/emit/lib [user, XDG_DATA_HOME; missing]"
env -u XDG_DATA_HOME HOME="$TMP/home" "$DOCTOR" doctor -q > "$TMP/doctor" 2>&1 || fail "doctor (HOME)"
has "$TMP/doctor" "[user, HOME; available]"
env -u HOME -u XDG_DATA_HOME "$DOCTOR" doctor -q > "$TMP/doctor" 2>&1 \
  || { cat "$TMP/doctor" >&2; fail "doctor failed with no user root"; }
has "$TMP/doctor" "user library root: unavailable"
"$DOCTOR" doctor -q --no-library-paths > "$TMP/doctor" 2>&1 || fail "doctor --no-library-paths"
if grep -Fq '[user, ' "$TMP/doctor"; then fail "disabled user root reported as a provider"; fi
pass "doctor reports the user root in order and as informational"

# Help names the user root and its place in lookup.
for verb in run repl build lib doctor; do
  "$EMIT" help "$verb" > "$TMP/help"
  has "$TMP/help" "user root"
  has "$TMP/help" ".local/share/emit/lib"
done
pass "every verb's help names the user root"

say "test user library root -> location, precedence, opt-out, doctor, help  [$cases cases, $((SECONDS - started))s]"
