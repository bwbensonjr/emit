#!/usr/bin/env bash
# package-manager-tests.sh -- emit pkg against fixture collections (change: emit-pkg).
# Every case sets its own XDG_DATA_HOME and HOME, so a developer's real user root never
# takes part, and no case touches the network: sources are --from trees or file://
# archives under the testing override.  A refusal must leave the data directory
# byte-for-byte as it was, which `snapshot` compares.
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
REPO="$PWD"
make emit >/dev/null
EMIT="$REPO/build/emit"
TMP="$(mktemp -d)"
TMP="$(cd "$TMP" && pwd -P)"
trap 'chmod -R u+w "$TMP" 2>/dev/null; rm -rf "$TMP"' EXIT
started=$SECONDS
unset EMIT_LIBRARY_PATH EMIT_MANIFEST EMIT_PKG_ARCHIVE EMIT_PKG_COMMIT EMIT_VERBOSITY
export EMIT_CACHE="$TMP/cache"
cases=0
COMMIT_A=1111111111111111111111111111111111111111
COMMIT_B=2222222222222222222222222222222222222222

fail() { printf 'package manager test: %s\n' "$*" >&2; exit 1; }
has() { grep -Fq -- "$2" "$1" || { cat "$1" >&2; fail "$1 lacks: $2"; }; }
lacks() { if grep -Fq -- "$2" "$1"; then cat "$1" >&2; fail "$1 has: $2"; fi; }
pass() { cases=$((cases + 1)); vsay "  case $1"; }

# A fresh data directory per case: DATA is $XDG_DATA_HOME/emit.
fresh() {
  export XDG_DATA_HOME="$TMP/xdg-$1" HOME="$TMP/home-$1"
  mkdir -p "$XDG_DATA_HOME" "$HOME"
  DATA="$XDG_DATA_HOME/emit"
  ROOT="$DATA/lib"
}
pkg() { "$EMIT" pkg "$@"; }
# A checkout binary finds the standard libraries only through the repository manifest;
# the user root still follows it in provider order.
erun() { "$EMIT" run --manifest "$REPO/emit-libs.scm" "$@"; }
snapshot() { (cd "$XDG_DATA_HOME" && find . -print | LC_ALL=C sort | while read -r p; do
  if [ -L "$p" ]; then printf '%s -> %s\n' "$p" "$(readlink "$p")";
  elif [ -f "$p" ]; then printf '%s %s\n' "$p" "$(cksum < "$p")"; else printf '%s/\n' "$p"; fi
done); }
# Run a command that must refuse: exit STATUS, data directory unchanged.
refuses() {
  local status="$1"; shift
  local before after got=0
  before="$(snapshot)"
  "$@" > "$TMP/out" 2> "$TMP/err" || got=$?
  after="$(snapshot)"
  [ "$got" = "$status" ] || { cat "$TMP/err" >&2; fail "expected status $status, got $got: $*"; }
  [ "$before" = "$after" ] || { diff <(echo "$before") <(echo "$after") >&2; fail "refusal changed the data directory: $*"; }
}

# A fixture collection: alpha (two libraries, one with non-ASCII text), beta (one
# library and an extra file), gamma (needs Emit 99), delta (declares a missing file).
collection() {
  local c="$1" alpha_value="${2:-1}"
  mkdir -p "$c/lib/alpha" "$c/lib/beta" "$c/lib/gamma" "$c/packages"/{alpha,beta,gamma,delta}
  printf '(define-library (alpha core) (export alpha-value greeting) (import (scheme base))\n  (begin (define (alpha-value) %s) (define greeting "λ café")))\n' \
    "$alpha_value" > "$c/lib/alpha/core.sld"
  printf '(define-library (alpha util) (export twice) (import (scheme base) (alpha core))\n  (begin (define (twice) (* 2 (alpha-value)))))\n' > "$c/lib/alpha/util.sld"
  printf '(define-library (beta main) (export beta) (import (scheme base))\n  (begin (define (beta) (quote beta))))\n' > "$c/lib/beta/main.sld"
  printf ';; beta data\n' > "$c/lib/beta/data.scm"
  printf '(define-library (gamma g) (export g) (import (scheme base)) (begin (define (g) 0)))\n' > "$c/lib/gamma/g.sld"
  printf '(package (name alpha) (version "1.0.%s") (summary "Alpha fixture") (license "MIT")\n  (emit (minimum "0.9.0")) (libraries (alpha core) (alpha util)))\n' \
    "$alpha_value" > "$c/packages/alpha/package.scm"
  printf '(package (name beta) (version "2.0.0") (summary "Beta fixture") (license "MIT")\n  (libraries (beta main)) (files "beta/data.scm"))\n' > "$c/packages/beta/package.scm"
  printf '(package (name gamma) (version "0.1.0") (summary "Too new") (emit (minimum "99.0.0"))\n  (libraries (gamma g)))\n' > "$c/packages/gamma/package.scm"
  printf '(package (name delta) (version "0.1.0") (summary "Broken") (libraries (delta missing)))\n' > "$c/packages/delta/package.scm"
}
# An archive of a collection with one top-level directory, as codeload serves it.
archive() {
  local c="$1" out="$2"
  tar -czf "$out" -C "$(dirname "$c")" "$(basename "$c")"
}

collection "$TMP/coll-a/emit-packages-aaaa" 1
collection "$TMP/coll-b/emit-packages-bbbb" 2
FROM="$TMP/coll-a/emit-packages-aaaa"
archive "$FROM" "$TMP/a.tar.gz"
archive "$TMP/coll-b/emit-packages-bbbb" "$TMP/b.tar.gz"
mkdir -p "$TMP/work"
cd "$TMP/work"
printf '(import (scheme base) (scheme write) (alpha util) (alpha core))\n(display (twice))\n(display greeting)\n' > use-alpha.scm

# Usage errors exit 2 and change nothing.
fresh usage
refuses 2 pkg
refuses 2 pkg frobnicate
has "$TMP/err" "frobnicate"
has "$TMP/err" "install NAME..."
refuses 2 pkg install
refuses 2 pkg remove
refuses 2 pkg install --bogus alpha
refuses 2 pkg list extra
EMIT_PKG_COMMIT=$COMMIT_A refuses 2 pkg install alpha
has "$TMP/err" "EMIT_PKG_ARCHIVE and EMIT_PKG_COMMIT"
pkg --help > "$TMP/help"
has "$TMP/help" "install NAME..."
"$EMIT" help pkg > "$TMP/help2"
cmp -s "$TMP/help" "$TMP/help2" || fail "emit help pkg differs from emit pkg --help"
if "$EMIT" frobnicate 2> "$TMP/err"; then fail "unknown verb accepted"; fi
has "$TMP/err" "doctor, pkg"
pass "usage errors exit 2; help is on stdout; pkg is a known verb"

# No user root: writers refuse, list is empty.
if env -u HOME -u XDG_DATA_HOME "$EMIT" pkg install --from "$FROM" alpha 2> "$TMP/err"; then
  fail "installed with no user root"
fi
has "$TMP/err" "no user library root"
[ -z "$(env -u HOME -u XDG_DATA_HOME "$EMIT" pkg list)" ] || fail "list printed without a user root"
pass "no user root: writers refuse naming HOME and XDG_DATA_HOME"

# Install from a local tree; resolution from an unrelated directory; list; the
# non-ASCII source round-trips byte for byte.
fresh from
pkg install --from "$FROM" alpha 2> "$TMP/err"
has "$TMP/err" "install alpha 1.0.1 -> $ROOT"
[ -f "$ROOT/alpha/core.sld" ] && [ -f "$ROOT/alpha/util.sld" ] || fail "alpha files not placed"
cmp -s "$FROM/lib/alpha/core.sld" "$ROOT/alpha/core.sld" || fail "non-ASCII source did not round-trip"
[ "$(erun use-alpha.scm)" = "2λ café" ] || fail "installed alpha did not resolve"
[ "$(pkg list)" = "alpha 1.0.1 $FROM" ] || fail "list: $(pkg list)"
[ ! -e "$DATA/.pkg-lock" ] && [ ! -e "$DATA/.pkg-tmp" ] || fail "lock or staging left behind"
has "$DATA/packages/alpha.scm" '"alpha/core.sld"'
pass "install --from places files, resolves, round-trips text, and lists the directory"

# --from needs neither curl nor tar.
fresh notools
mkdir -p "$TMP/bin-empty"
PATH="$TMP/bin-empty" "$EMIT" pkg install --from "$FROM" beta 2> "$TMP/err" || { cat "$TMP/err" >&2; fail "--from needed tools"; }
[ -f "$ROOT/beta/main.sld" ] && [ -f "$ROOT/beta/data.scm" ] || fail "beta files (with extra file) not placed"
pass "--from works with no curl or tar on PATH; (files ...) extras are placed"

# The download path through the testing override: a file:// archive and fixed commit.
fresh archive
EMIT_PKG_ARCHIVE="file://$TMP/a.tar.gz" EMIT_PKG_COMMIT=$COMMIT_A pkg install alpha beta 2> "$TMP/err"
has "$TMP/err" "resolve bwbensonjr/emit-packages main -> ${COMMIT_A:0:12}"
[ "$(pkg list)" = "alpha 1.0.1 $COMMIT_A
beta 2.0.0 $COMMIT_A" ] || fail "list after archive install: $(pkg list)"
pass "file:// archive install records the commit"

# available lists the collection and marks a too-new package.
EMIT_PKG_ARCHIVE="file://$TMP/a.tar.gz" EMIT_PKG_COMMIT=$COMMIT_A pkg available > "$TMP/avail" 2>/dev/null
has "$TMP/avail" "alpha 1.0.1 emit>=0.9.0 Alpha fixture"
has "$TMP/avail" "gamma 0.1.0 emit>=99.0.0 Too new  [needs a newer Emit]"
pkg available --from "$FROM" > "$TMP/avail2" 2>/dev/null
cmp -s "$TMP/avail" "$TMP/avail2" || fail "available differs between archive and --from"
pass "available lists name, version, minimum, summary, and marks incompatibility"

# Refusals: unknown package, missing declared file, too-new minimum.
EMIT_PKG_ARCHIVE="file://$TMP/a.tar.gz" EMIT_PKG_COMMIT=$COMMIT_A refuses 1 pkg install no-such
has "$TMP/err" "not in the collection at ${COMMIT_A:0:12}"
refuses 1 pkg install --from "$FROM" delta
has "$TMP/err" "delta/missing.sld"
refuses 1 pkg install --from "$FROM" gamma
has "$TMP/err" "needs Emit 99.0.0"
pass "unknown package, missing declared file, and too-new minimum refuse"

# All-or-nothing: one bad name refuses the whole command.
fresh atomic
refuses 1 pkg install --from "$FROM" alpha no-such
[ ! -e "$ROOT/alpha" ] || fail "alpha installed despite a bad name"
pass "one bad name refuses every package in the command"

# Symbolic links: a linked root and a linked subdirectory refuse.
fresh links
mkdir -p "$DATA" "$TMP/elsewhere"
ln -s "$TMP/elsewhere" "$ROOT"
refuses 1 pkg install --from "$FROM" alpha
has "$TMP/err" "symbolic link"
has "$TMP/err" "managed by hand"
[ -z "$(ls -A "$TMP/elsewhere")" ] || fail "wrote through the linked root"
rm "$ROOT"
mkdir -p "$ROOT" "$TMP/elsewhere2"
ln -s "$TMP/elsewhere2" "$ROOT/alpha"
refuses 1 pkg install --from "$FROM" alpha
[ -z "$(ls -A "$TMP/elsewhere2")" ] || fail "wrote through a linked subdirectory"
pass "a linked root or subdirectory is refused before any write"

# Collisions: an unowned file refuses; the user's other files coexist; another
# package's file refuses.
fresh collide
mkdir -p "$ROOT/alpha" "$ROOT/acme"
printf 'mine\n' > "$ROOT/alpha/core.sld"
printf 'mine\n' > "$ROOT/acme/util.sld"
refuses 1 pkg install --from "$FROM" alpha
has "$TMP/err" "$ROOT/alpha/core.sld is not owned by any package"
rm "$ROOT/alpha/core.sld"
pkg install --from "$FROM" alpha 2>/dev/null
[ "$(cat "$ROOT/acme/util.sld")" = mine ] || fail "user file disturbed"
collection "$TMP/coll-c/emit-packages-cccc" 1
mkdir -p "$TMP/coll-c/emit-packages-cccc/packages/thief"
printf '(package (name thief) (version "0.1.0") (libraries (alpha core)))\n' \
  > "$TMP/coll-c/emit-packages-cccc/packages/thief/package.scm"
refuses 1 pkg install --from "$TMP/coll-c/emit-packages-cccc" thief
has "$TMP/err" "belongs to package alpha"
pass "collision-only ownership: unowned and other-package files refuse, user files coexist"

# Update: replaces an edited owned file, deletes a dropped file, records the new
# commit, and the next run recompiles the changed library.
fresh update
EMIT_PKG_ARCHIVE="file://$TMP/a.tar.gz" EMIT_PKG_COMMIT=$COMMIT_A pkg install alpha 2>/dev/null
[ "$(erun use-alpha.scm)" = "2λ café" ] || fail "alpha before update"
printf ';; edited\n' >> "$ROOT/alpha/util.sld"
# Collection B drops (alpha util) from alpha: rewrite its metadata and program.
printf '(package (name alpha) (version "1.0.2") (summary "Alpha fixture") (license "MIT")\n  (libraries (alpha core)))\n' \
  > "$TMP/coll-b/emit-packages-bbbb/packages/alpha/package.scm"
archive "$TMP/coll-b/emit-packages-bbbb" "$TMP/b.tar.gz"
EMIT_PKG_ARCHIVE="file://$TMP/b.tar.gz" EMIT_PKG_COMMIT=$COMMIT_B pkg update 2> "$TMP/err"
has "$TMP/err" "update alpha 1.0.2"
has "$TMP/err" "1 file dropped"
[ ! -e "$ROOT/alpha/util.sld" ] || fail "dropped file kept"
[ "$(pkg list)" = "alpha 1.0.2 $COMMIT_B" ] || fail "list after update: $(pkg list)"
printf '(import (scheme base) (alpha core))\n(display (alpha-value))\n' > use-core.scm
[ "$(erun use-core.scm)" = 2 ] || fail "updated library was not recompiled"
# Restore B's alpha for the edited-file case.
collection "$TMP/coll-b/emit-packages-bbbb" 2
pkg update --from "$TMP/coll-b/emit-packages-bbbb" alpha 2>/dev/null
printf ';; edited\n' >> "$ROOT/alpha/util.sld"
pkg update --from "$TMP/coll-b/emit-packages-bbbb" alpha 2>/dev/null
cmp -s "$TMP/coll-b/emit-packages-bbbb/lib/alpha/util.sld" "$ROOT/alpha/util.sld" || fail "edited owned file not replaced"
refuses 1 pkg update beta
has "$TMP/err" "beta is not installed"
pass "update replaces edited files, drops removed ones, records the commit, recompiles"

# An update whose package left the collection reports it and exits 1.
mkdir -p "$TMP/coll-d/emit-packages-dddd/packages"
got=0; pkg update --from "$TMP/coll-d/emit-packages-dddd" 2> "$TMP/err" || got=$?
[ "$got" = 1 ] || fail "missing-from-collection update exited $got"
has "$TMP/err" "no longer in the collection"
[ -f "$ROOT/alpha/core.sld" ] || fail "package left the collection and was removed"
pass "a package gone from the collection is reported and left installed"

# Remove deletes exactly the owned files and leaves the user's own.
fresh remove
pkg install --from "$FROM" alpha beta 2>/dev/null
printf 'mine\n' > "$ROOT/alpha/extra.sld"
pkg remove alpha 2> "$TMP/err"
has "$TMP/err" "remove alpha 1.0.1"
[ ! -e "$ROOT/alpha/core.sld" ] && [ -f "$ROOT/alpha/extra.sld" ] || fail "remove touched the wrong files"
[ "$(pkg list)" = "beta 2.0.0 $FROM" ] || fail "list after remove: $(pkg list)"
pkg remove beta 2>/dev/null
[ ! -e "$ROOT/beta" ] || fail "empty package directory not pruned"
refuses 1 pkg remove alpha
has "$TMP/err" "alpha is not installed"
pass "remove deletes owned files, prunes empty directories, keeps user files"

# Interrupted operation: list reports it without changing anything; the next writer
# recovers by removing the half-placed package.
fresh recover
pkg install --from "$FROM" alpha beta 2>/dev/null
cp "$DATA/packages/alpha.scm" "$DATA/packages/alpha.pending"
refuses 0 pkg list
[ "$(cat "$TMP/out")" = "beta 2.0.0 $FROM" ] || fail "list reported an interrupted package"
has "$TMP/err" "alpha has an interrupted operation"
pkg remove beta 2> "$TMP/err"
has "$TMP/err" "recover alpha -> removed"
[ ! -e "$ROOT/alpha" ] && [ ! -e "$DATA/packages/alpha.pending" ] && [ ! -e "$DATA/packages/alpha.scm" ] \
  || fail "recovery left alpha behind"
pass "an interrupted operation is reported by list and undone by the next writer"

# A held lock refuses a second writer and names the lock.
fresh lock
mkdir -p "$DATA/.pkg-lock"
refuses 1 pkg install --from "$FROM" alpha
has "$TMP/err" "$DATA/.pkg-lock"
pass "a held lock refuses and names its path"

# Missing tools and a failed download refuse before writing.
fresh tools
refuses 1 env PATH="$TMP/bin-empty" "$EMIT" pkg install alpha
has "$TMP/err" "needs curl and tar on PATH"
EMIT_PKG_ARCHIVE="file://$TMP/no-such.tar.gz" EMIT_PKG_COMMIT=$COMMIT_A refuses 1 pkg install alpha
has "$TMP/err" "curl exited with status"
pass "missing curl or tar, or a failed download, refuses with nothing written"

# Quiet installs print nothing; verbose installs name each placed file.
fresh quiet
EMIT_VERBOSITY=quiet pkg install --from "$FROM" alpha > "$TMP/out" 2> "$TMP/err"
[ ! -s "$TMP/out" ] && [ ! -s "$TMP/err" ] || fail "quiet install printed something"
EMIT_VERBOSITY=verbose pkg update --from "$FROM" alpha 2> "$TMP/err"
has "$TMP/err" "place $ROOT/alpha/core.sld"
pass "quiet is silent; verbose names each placed file"

say "test package manager -> usage, sources, safety, recovery, update, remove  [$cases cases, $((SECONDS - started))s]"
