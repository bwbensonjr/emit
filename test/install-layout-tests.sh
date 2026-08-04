#!/usr/bin/env bash
# install-layout-tests.sh -- guard that an INSTALLED emit resolves its libraries
# (change: manifest-search-path, GitHub issue #35).
#
# A library that is not baked into the compiler is reachable only through a manifest,
# and the manifest used to be looked up as the bare relative string "emit-libs.scm" --
# i.e. against the CURRENT DIRECTORY.  An installed `emit` therefore lost every
# non-baked library the moment the user left the source tree: `emit run` could not
# (import (scheme inexact)), and `emit repl` lost (scheme base) itself, leaving a
# session with primitives only.
#
# This suite installs into a temp prefix and drives the installed binary from an
# UNRELATED working directory, which is the only way to exercise the lookup's
# executable-relative and install-prefix candidates at all.  It also pins the two
# properties that make the lookup safe rather than merely working: a symlinked
# launcher resolves to the real binary's prefix, and an in-repo invocation still
# prefers the repo's own ./emit-libs.scm over anything installed.
#
# CHEZ-FREE: builds nothing but the default `make` target.
# Run from the repo root: test/install-layout-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
REPO="$PWD"
PREFIX="$TMP/prefix"
EMIT="$PREFIX/bin/emit"
pass=0; fail=0

ok  () { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# --- install into a staging prefix --------------------------------------------
# PREFIX is what gets compiled into the binary as its last-resort candidate; passing
# it here also rebuilds emit.o, so the installed binary's baked prefix IS $PREFIX.
if ! make install PREFIX="$PREFIX" >"$TMP/install.log" 2>&1; then
  echo "  [FAIL] make install"; sed 's/^/         /' "$TMP/install.log"; exit 1
fi

echo "installed layout"
for f in bin/emit share/emit/emit-libs.scm share/emit/lib/scheme/base.sld \
         share/emit/lib/scheme/inexact.sld; do
  [ -f "$PREFIX/$f" ] && ok "installed $f" || bad "missing $f"
done

# A second install over the same prefix must succeed and leave the same tree.
before="$(find "$PREFIX" -type f | sort)"
if make install PREFIX="$PREFIX" >"$TMP/install2.log" 2>&1; then
  [ "$before" = "$(find "$PREFIX" -type f | sort)" ] \
    && ok "install is idempotent" || bad "second install changed the tree"
else bad "second install failed"; fi

# The installed tree must not point back into the source tree it was built from --
# otherwise the install stops working the moment the checkout is removed.
if grep -q "$REPO" "$PREFIX/share/emit/emit-libs.scm"; then
  bad "the installed manifest names a path inside the source tree"
else ok "the installed manifest does not depend on the build tree"; fi

# DESTDIR stages the whole tree elsewhere WITHOUT changing the prefix the binary was
# built to look in (a packager's split).
STAGE="$TMP/stage"
if make install PREFIX=/usr/local DESTDIR="$STAGE" >"$TMP/install3.log" 2>&1; then
  [ -f "$STAGE/usr/local/bin/emit" ] && [ -f "$STAGE/usr/local/share/emit/emit-libs.scm" ] \
    && [ -f "$STAGE/usr/local/share/emit/lib/scheme/base.sld" ] \
    && ok "DESTDIR stages <destdir><prefix>/{bin,share/emit}" \
    || { bad "DESTDIR layout wrong"; find "$STAGE" -type f | sed 's/^/         /'; }
else bad "make install with DESTDIR failed"; fi

# The target narrates what it installs, and says nothing at all when quiet.
grep -q 'install .*-> .*bin/emit' "$TMP/install.log" \
  && ok "install narrates its actions" \
  || { bad "install narration missing"; sed 's/^/         /' "$TMP/install.log"; }
qout="$(EMIT_VERBOSITY=quiet make install PREFIX="$PREFIX" 2>&1)"
[ -z "$qout" ] && ok "install is silent at EMIT_VERBOSITY=quiet" \
               || { bad "install printed at quiet"; printf '%s\n' "$qout" | sed 's/^/         /'; }

# --- the defect itself: a non-baked library from an unrelated directory --------
echo
echo "installed emit, run from an unrelated directory"
cd "$TMP"                                  # nothing here: no emit-libs.scm, no lib/

got="$(echo '(import (scheme inexact)) (display (sqrt 2.0))' \
        | EMIT_VERBOSITY=quiet "$EMIT" run 2>"$TMP/e1")"
want="$(cd "$REPO" && echo '(import (scheme inexact)) (display (sqrt 2.0))' \
        | EMIT_VERBOSITY=quiet build/emit run 2>/dev/null)"
[ -n "$want" ] && [ "$got" = "$want" ] \
  && ok "(scheme inexact) resolves; value matches the in-repo run => $got" \
  || { bad "(scheme inexact) from an unrelated cwd => [$got] (in-repo: [$want])"
       sed 's/^/         /' "$TMP/e1"; }

# The REPL door lost (scheme base) entirely before this change (it resolves the
# auto-import through the manifest rather than from the baked prelude).
rval="$(printf '(map (lambda (x) (* x x)) (list 1 2 3))\n' \
         | EMIT_VERBOSITY=quiet "$EMIT" repl 2>/dev/null | awk 'NF{v=$0}END{print v}')"
[ "$rval" = "(1 4 9)" ] \
  && ok "REPL auto-imports (scheme base) when installed => $rval" \
  || bad "REPL (scheme base) when installed => [$rval] (expected (1 4 9))"

# A baked-only program needs no manifest at all -- unchanged by this work.  (The run
# door prints the program's final value, so this is the value itself, not a display.)
bval="$(echo '(+ 1 2)' | EMIT_VERBOSITY=quiet "$EMIT" run 2>/dev/null)"
[ "$bval" = "3" ] && ok "a baked-only program still needs no manifest => $bval" \
                  || bad "baked-only program => [$bval]"

# The three RELOCATED standard libraries (change: scheme-base-partition, issue #33) are on
# disk, so they are reachable from an installed `emit` only if the install ships them and
# the manifest lookup finds them.  Before that change these names were baked into the
# binary, so this is new install surface, not a restatement of the (scheme inexact) case:
# a bad install would now cost part of R7RS-small rather than one optional library.
for probe in \
  "(scheme cxr)|(import (scheme cxr)) (caddr (quote (1 2 3)))|3" \
  "(scheme read)|(import (scheme read)) (read (open-input-string \"(a b)\"))|(a b)" \
  "(scheme file)|(import (scheme file)) (port? (open-input-file \"$TMP/probe.txt\"))|#t"
do
  # pwant/pgot, not want/got: the (scheme inexact) `want` above is reused by the
  # symlinked-launcher check further down, and shadowing it here made that check compare
  # against this loop's last value instead.
  lib="${probe%%|*}"; rest="${probe#*|}"; prog="${rest%%|*}"; pwant="${rest##*|}"
  printf 'probe\n' > "$TMP/probe.txt"
  pgot="$(printf '%s\n' "$prog" | EMIT_VERBOSITY=quiet "$EMIT" run 2>"$TMP/eprobe")"
  [ "$pgot" = "$pwant" ] \
    && ok "$lib resolves from an unrelated cwd => $pgot" \
    || { bad "$lib from an unrelated cwd => [$pgot] (expected [$pwant])"
         sed 's/^/         /' "$TMP/eprobe"; }
done

# The substrate installs too -- not for a user to import, but because base.sld imports it
# and the REPL door resolves (scheme base) through the manifest (see issue #39).  The REPL
# check above already proves it resolves; this asserts the file is actually shipped, since
# a missing one fails only on the REPL door and only at startup.
[ -f "$PREFIX/share/emit/lib/emit/internal.sld" ] \
  && ok "the internal substrate is installed beside the standard libraries" \
  || bad "$PREFIX/share/emit/lib/emit/internal.sld is missing from the install"

# --- candidate 4: the executable's REAL path, not the symlink's ----------------
# Homebrew reaches the keg through a symlink in <prefix>/bin, so what sits beside the
# REAL binary is what was installed with it.  A link in a bin/ with no ../share/emit
# beside it must still find the installed manifest.
echo
echo "symlinked launcher"
mkdir -p "$TMP/otherbin"
ln -sf "$EMIT" "$TMP/otherbin/emit"
sgot="$(echo '(import (scheme inexact)) (display (sqrt 2.0))' \
         | EMIT_VERBOSITY=quiet "$TMP/otherbin/emit" run 2>"$TMP/e2")"
[ "$sgot" = "$want" ] \
  && ok "a symlinked emit resolves through its real path => $sgot" \
  || { bad "symlinked emit => [$sgot]"; sed 's/^/         /' "$TMP/e2"; }

# --- the repo still wins over an installed prefix ------------------------------
# Candidate 3 (./emit-libs.scm) is searched BEFORE the executable-relative and
# prefix candidates, so installation stays additive: a developer in the source tree
# gets the source tree's libraries.
echo
echo "the repo manifest outranks an installed one"
cd "$REPO"
line="$(echo '(display 1)' | "$EMIT" run 2>&1 >/dev/null | grep 'resolve manifest' | head -1)"
case "$line" in
  *"resolve manifest -> emit-libs.scm") ok "in-repo invocation prefers ./emit-libs.scm" ;;
  *) bad "in-repo invocation resolved [$line] (expected ./emit-libs.scm)" ;;
esac

# --- narration is suppressible -------------------------------------------------
# The resolved manifest is named at default verbosity and absent at quiet, and stdout
# is identical either way (narration is stderr, so no door's data output shifts).
echo
echo "manifest narration"
out_d="$(echo '(+ 1 2)' | "$EMIT" run 2>"$TMP/n1")"
out_q="$(echo '(+ 1 2)' | EMIT_VERBOSITY=quiet "$EMIT" run 2>"$TMP/n2")"
if grep -q 'resolve manifest ->' "$TMP/n1" && ! grep -q 'resolve manifest' "$TMP/n2" \
   && [ "$out_d" = "$out_q" ]; then
  ok "manifest narration: present by default, absent at quiet, stdout unchanged"
else
  bad "manifest narration/quiet"; sed 's/^/         default: /' "$TMP/n1"
  sed 's/^/         quiet:   /' "$TMP/n2"
fi

# --- --manifest outranks the environment variable ------------------------------
# Both are explicit requests; the flag is the more local one and wins.
echo
echo "--manifest outranks \$EMIT_MANIFEST"
cp "$PREFIX/share/emit/emit-libs.scm" "$TMP/flag-man.scm"
mkdir -p "$TMP/lib/scheme"
cp "$PREFIX/share/emit/lib/scheme/"*.sld "$TMP/lib/scheme/"
line="$(EMIT_MANIFEST="$PREFIX/share/emit/emit-libs.scm" \
        "$EMIT" run --manifest "$TMP/flag-man.scm" <<< '(+ 1 2)' 2>&1 >/dev/null \
        | grep 'resolve manifest' | head -1)"
case "$line" in
  *"$TMP/flag-man.scm") ok "--manifest wins over EMIT_MANIFEST" ;;
  *) bad "precedence: resolved [$line] (expected $TMP/flag-man.scm)" ;;
esac

# --- explicit requests fail loudly rather than falling through ----------------
# --manifest/EMIT_MANIFEST name a SPECIFIC file; falling through to an installed one
# would silently run against different libraries than were asked for.
echo
echo "an explicitly named missing manifest is an error"
if echo '(display 1)' | "$EMIT" run --manifest "$TMP/nope.scm" >/dev/null 2>"$TMP/e3"; then
  bad "--manifest with a missing file should fail"
else
  grep -q "manifest not found" "$TMP/e3" \
    && ok "--manifest NOPE errors instead of falling back" \
    || { bad "--manifest NOPE: wrong diagnostic"; sed 's/^/         /' "$TMP/e3"; }
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
