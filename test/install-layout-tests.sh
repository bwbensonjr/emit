#!/usr/bin/env bash
# install-layout-tests.sh -- guard that an INSTALLED emit is a complete product:
# it resolves its libraries (change: manifest-search-path, GitHub issue #35) AND its
# support files, so every door works from an install (change:
# installed-emit-completeness, issues #36 and #44).
#
# A library that is not baked into the compiler is reachable only through a manifest,
# and the manifest used to be looked up as the bare relative string "emit-libs.scm" --
# i.e. against the CURRENT DIRECTORY.  An installed `emit` therefore lost every
# non-baked library the moment the user left the source tree: `emit run` could not
# (import (scheme inexact)), and `emit repl` lost (scheme base) itself, leaving a
# session with primitives only.
#
# Two doors stayed outside that guarantee, and both are reachable from one ordinary
# PROJECT directory -- a directory with its own emit-libs.scm, which a project must
# have to declare its own program:
#
#   #36  `emit build` found tools/llvm-env.sh and src/runtime/runtime.c by stripping
#        "/emit" and "/build" off its own path, an assumption that it sits in a
#        checkout, so the one door that produces the project's first-class deliverable
#        was the one door that did not work when installed.
#   #44  the manifest lookup stopped at the first candidate that EXISTS, so a project's
#        own ./emit-libs.scm HID the installed one and the project silently lost every
#        shipped library it did not name itself.
#
# This suite installs into a temp prefix and drives the installed binary from an
# UNRELATED working directory, which is the only way to exercise the lookup's
# executable-relative and install-prefix candidates at all.  It also pins the two
# properties that make the lookup safe rather than merely working: a symlinked
# launcher resolves to the real binary's prefix, and an in-repo invocation still
# prefers the repo's own ./emit-libs.scm and its own support files over anything
# installed.
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

# The binary narrates paths it derived from its OWN resolved real path, so on a
# platform where the temp dir is a symlink (/var -> /private/var on macOS) those lines
# carry the resolved prefix, not $PREFIX.  Match against this one.
RPREFIX="$(cd "$PREFIX" && pwd -P)"

echo "installed layout"
# The support files land at their REPO-RELATIVE SUBPATHS under share/emit, the same
# mirroring rule the lib/ sources follow, so one lookup in the binary serves both the
# checkout and the installed layout.  log.sh is here because llvm-env.sh SOURCES it:
# shipping the script alone installs one that fails on its first line.
for f in bin/emit share/emit/emit-libs.scm share/emit/lib/scheme/base.sld \
         share/emit/lib/scheme/inexact.sld \
         share/emit/tools/llvm-env.sh share/emit/tools/log.sh \
         share/emit/src/runtime/runtime.c; do
  [ -f "$PREFIX/$f" ] && ok "installed $f" || bad "missing $f"
done
[ -x "$PREFIX/share/emit/tools/llvm-env.sh" ] \
  && ok "the installed llvm-env.sh is executable" \
  || bad "$PREFIX/share/emit/tools/llvm-env.sh is not executable"

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
    && [ -f "$STAGE/usr/local/share/emit/tools/llvm-env.sh" ] \
    && [ -f "$STAGE/usr/local/share/emit/src/runtime/runtime.c" ] \
    && ok "DESTDIR stages <destdir><prefix>/{bin,share/emit}" \
    || { bad "DESTDIR layout wrong"; find "$STAGE" -type f | sed 's/^/         /'; }
else bad "make install with DESTDIR failed"; fi

# The target narrates what it installs, and says nothing at all when quiet.
grep -q 'install .*-> .*bin/emit' "$TMP/install.log" \
  && ok "install narrates its actions" \
  || { bad "install narration missing"; sed 's/^/         /' "$TMP/install.log"; }
grep -q 'install .* support file(s) ->' "$TMP/install.log" \
  && ok "install narrates the support files it ships" \
  || { bad "support-file narration missing"; sed 's/^/         /' "$TMP/install.log"; }
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

# An installed session does not depend on the INSTALLED MANIFEST naming the standard
# library either: point EMIT_MANIFEST at a manifest that names no baked member (what a
# user's own project manifest looks like) and the session must still have (scheme base),
# because every door registers the baked set before it reads the manifest
# (change: baked-set-on-every-door).
echo '((library (irrelevant) (source "nowhere.sld")))' > "$TMP/user-libs.scm"
uval="$(printf '(map (lambda (x) (* x x)) (list 1 2 3))\n' \
         | EMIT_VERBOSITY=quiet EMIT_MANIFEST="$TMP/user-libs.scm" "$EMIT" repl 2>/dev/null \
         | awk 'NF{v=$0}END{print v}')"
[ "$uval" = "(1 4 9)" ] \
  && ok "installed REPL has (scheme base) with a manifest that omits it => $uval" \
  || bad "installed REPL with a baked-free manifest => [$uval] (expected (1 4 9))"

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

# --- a PROJECT directory: the shape both #36 and #44 are reachable from ---------
# Everything above runs from a directory with no emit-libs.scm at all.  A real project
# has one -- it must, to declare its own program -- and that is exactly what used to
# hide the installed manifest (#44) and what makes `emit build` the door a project
# reaches for (#36).  So: one directory, one program, one manifest naming only that
# program, and NOTHING in the environment.
echo
echo "a project directory with its own manifest"
PROJ="$TMP/proj"
mkdir -p "$PROJ"
cd "$PROJ"
cat > emit-libs.scm <<'EOF'
((program hello (source "hello.scm") (output "hello")))
EOF
cat > hello.scm <<'EOF'
(import (scheme inexact))
(display (sqrt 2.0))
EOF

# #36: `emit build` needs tools/llvm-env.sh + src/runtime/runtime.c, neither of which
# is a library.  `env -u` strips the toolchain so discovery has to work on its own --
# through the INSTALLED llvm-env.sh, or failing that this binary's build-time defaults.
if env -u CC -u GC_INC -u GC_LIB -u EMIT_GC_INC -u EMIT_GC_LIB \
     "$EMIT" build hello >"$TMP/build.log" 2>&1; then
  if [ -x "$PROJ/hello" ]; then
    bgot="$("$PROJ/hello" 2>/dev/null)"
    case "$bgot" in
      1.4142135623730951*) ok "emit build from an install delivers a runnable exe => $bgot" ;;
      *)                   bad "the delivered exe printed [$bgot]" ;;
    esac
  else bad "emit build reported success but wrote no executable"; fi
else
  bad "emit build from an install failed"; sed 's/^/         /' "$TMP/build.log"
fi

# #44: the same program's (import (scheme inexact)) must resolve THROUGH THE CHAIN --
# the project manifest names no library at all, so this only works if the searched
# candidates extend rather than replace one another.
cgot="$(EMIT_VERBOSITY=quiet "$EMIT" run hello.scm 2>"$TMP/e4")"
[ "$cgot" = "$want" ] \
  && ok "a project manifest keeps the shipped libraries => $cgot" \
  || { bad "chained (scheme inexact) => [$cgot] (expected [$want])"
       sed 's/^/         /' "$TMP/e4"; }

# The project's manifest names no path into the prefix -- that is the whole point:
# a Cellar directory moves on every upgrade.
grep -q "$PREFIX" emit-libs.scm \
  && bad "the project manifest names the install prefix" \
  || ok "the project manifest needs no path into the install prefix"

# The chain is NARRATED: both manifests in order, and the one that supplied the
# library.  A door that silently consults two manifests is worse than one that
# consults the wrong one.
"$EMIT" run hello.scm >/dev/null 2>"$TMP/e5"
if grep -q 'resolve manifest -> emit-libs.scm' "$TMP/e5" \
   && grep -q "resolve manifest -> $RPREFIX/share/emit/emit-libs.scm  \[chained\]" "$TMP/e5" \
   && grep -q "^chain $RPREFIX/share/emit/emit-libs.scm -> scheme.inexact" "$TMP/e5"; then
  ok "the chain and the supplying manifest are narrated"
else
  bad "chain narration"; sed 's/^/         /' "$TMP/e5"
fi
qout="$(EMIT_VERBOSITY=quiet "$EMIT" run hello.scm 2>&1 >/dev/null)"
[ -z "$qout" ] && ok "chain narration is absent at EMIT_VERBOSITY=quiet" \
               || { bad "chain narration at quiet"; printf '%s\n' "$qout" | sed 's/^/         /'; }

# --- chaining: precedence, non-extension, and what does NOT chain ---------------
echo
echo "manifest chaining"

# A project entry of the same name as a shipped library WINS -- the one part of the old
# first-match-wins behaviour worth keeping, and the way a project overrides a library.
# Its relative (source ...) resolves against the PROJECT's manifest directory, which is
# what makes "each entry against its own manifest" observable.
mkdir -p "$PROJ/mylib"
cat > "$PROJ/mylib/cxr.sld" <<'EOF'
(define-library (scheme cxr)
  (import (scheme base))
  (export caddr)
  (begin (define (caddr x) (quote overridden))))
EOF
cat > "$PROJ/cxr.scm" <<'EOF'
(import (scheme cxr))
(display (caddr (list 1 2 3)))
EOF
cat > "$PROJ/emit-libs.scm" <<'EOF'
((library (scheme cxr) (source "mylib/cxr.sld"))
 (program hello (source "hello.scm") (output "hello")))
EOF
ogot="$(EMIT_VERBOSITY=quiet "$EMIT" run cxr.scm 2>"$TMP/e6")"
case "$ogot" in
  overridden*) ok "a project entry overrides a shipped library of the same name => $ogot" ;;
  *) bad "override => [$ogot] (expected overridden...)"; sed 's/^/         /' "$TMP/e6" ;;
esac
cat > "$PROJ/emit-libs.scm" <<'EOF'
((program hello (source "hello.scm") (output "hello")))
EOF

# An EXPLICIT request names exactly one manifest and is NOT extended: that is what
# keeps a hermetic build expressible.  The same program that resolves through the
# chain must fail when the chain is replaced by one file that does not name it.
if EMIT_VERBOSITY=quiet "$EMIT" run --manifest "$PROJ/emit-libs.scm" hello.scm \
     >/dev/null 2>"$TMP/e7"; then
  bad "--manifest chained: (scheme inexact) resolved from the installed manifest"
else
  ok "--manifest names exactly one manifest and does not chain"
fi

# Program lookup does NOT chain either: a name the project's manifest does not define
# is reported against the PROJECT'S file -- the one the user can fix -- and is not
# searched for in the installed manifest.
"$EMIT" build nosuchprog >/dev/null 2>"$TMP/e8" && bad "emit build nosuchprog succeeded"
if grep -q 'no program entry named nosuchprog in emit-libs.scm' "$TMP/e8"; then
  ok "an unknown program names the project's own manifest"
else
  bad "unknown program diagnostic"; sed 's/^/         /' "$TMP/e8"
fi

# A malformed manifest IN A CHAIN has to name WHICH file (issue #66, design D5).  Two
# manifests are narrated here, so a report that says only "unterminated list" leaves the
# user choosing between the file they wrote and one inside the install prefix.  The
# project's own manifest is the truncated one; the installed manifest is well-formed and
# must not be blamed for it.
cat > "$PROJ/emit-libs.scm" <<'EOF'
((program hello (source "hello.scm") (output "hello")
EOF
"$EMIT" run hello.scm >/dev/null 2>"$TMP/e8b"
rc=$?
# The attribution line must be asserted SPECIFICALLY.  `grep emit-libs.scm` would pass on
# the narration alone -- "resolve manifest -> emit-libs.scm" is printed for every candidate
# before any parsing -- so this greps the diagnostic's own line, and checks the CHAINED
# manifest is not the one blamed.
if [ "$rc" -ne 0 ] && [ "$rc" -lt 128 ] && grep -q 'unterminated list' "$TMP/e8b" \
   && grep -q '^emit: in manifest emit-libs.scm$' "$TMP/e8b" \
   && ! grep -q "^emit: in manifest $RPREFIX/share/emit/emit-libs.scm\$" "$TMP/e8b"; then
  ok "a truncated manifest in a chain is reported against its own file (exit $rc)"
else
  bad "chained truncated manifest (exit $rc)"; sed 's/^/         /' "$TMP/e8b"
fi
# ...and the chain still works once it is well-formed again.
cat > "$PROJ/emit-libs.scm" <<'EOF'
((program hello (source "hello.scm") (output "hello")))
EOF

# --- candidate 4: the executable's REAL path, not the symlink's ----------------
# Homebrew reaches the keg through a symlink in <prefix>/bin, so what sits beside the
# REAL binary is what was installed with it.  A link in a bin/ with no ../share/emit
# beside it must still find the installed manifest.
echo
echo "symlinked launcher"
cd "$TMP"                                  # back out of the project directory
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

# Chaining must not weaken that.  The repository's own manifest names EVERY library it
# ships, so nothing may be supplied by the installed one -- a `chain ... ->` line from
# an in-repo door would mean a resolution silently reached outside the checkout.
"$REPO/build/emit" run demos/fact.scm >/dev/null 2>"$TMP/e9" || true
grep -q '^chain ' "$TMP/e9" \
  && { bad "an in-repo door resolved a library from outside the checkout"
       sed 's/^/         /' "$TMP/e9"; } \
  || ok "an in-repo door supplies every library from the repository's own manifest"

# Support files follow the same rule: the checkout's llvm-env.sh and runtime.c are the
# ones an in-repo `emit build` uses, even with a different emit installed.  The proof
# is that the delivered exe still builds and runs from the repo (the installed prefix
# here carries its own copies, so a lookup that preferred them would still work -- what
# would break is a from-source developer editing runtime.c and not seeing the edit).
cat > "$TMP/inrepo-libs.scm" <<EOF
((program fact (source "$REPO/demos/fact.scm") (output "$TMP/fact-inrepo")))
EOF
if "$REPO/build/emit" build --manifest "$TMP/inrepo-libs.scm" fact >"$TMP/e10" 2>&1 \
   && [ -x "$TMP/fact-inrepo" ] && [ "$("$TMP/fact-inrepo")" = "120" ]; then
  ok "an in-repo emit build finds the checkout's own support files"
else
  bad "in-repo emit build"; sed 's/^/         /' "$TMP/e10"
fi

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

# --- the artifact cache works from an install (change: baked-set-artifact-cache) ------
# The cache must not be a checkout-only feature: an installed emit has no writable install
# tree and no build/lib, so it needs a user-writable location, and the install must still
# ship no compiled artifact of its own.  EMIT_CACHE points at a scratch directory so this
# neither reads nor writes the developer's real cache.
echo
echo "installed emit, artifact cache"
ICACHE="$TMP/icache"
printf '(display (+ 40 2))\n' > "$TMP/one.scm"

ione="$(EMIT_VERBOSITY=quiet EMIT_CACHE="$ICACHE" "$EMIT" run "$TMP/one.scm" 2>"$TMP/ec1")"
[ "$ione" = "42" ] && ok "installed emit runs with a cold cache => $ione" \
  || { bad "installed emit, cold cache => [$ione]"; sed 's/^/         /' "$TMP/ec1"; }
n=$(ls "$ICACHE" 2>/dev/null | grep -c '^baked-' || true)
[ "$n" -ge 3 ] && ok "installed emit populates a user-writable cache ($n files)" \
  || bad "installed emit left $n cache file(s)"
itwo="$(EMIT_VERBOSITY=quiet EMIT_CACHE="$ICACHE" "$EMIT" run "$TMP/one.scm" 2>/dev/null)"
[ "$itwo" = "42" ] && ok "installed emit reuses its cache => $itwo" \
  || bad "installed emit, warm cache => [$itwo]"

# The install contract is unchanged: a cache entry exists only because a door ran, never
# because something was installed.
if find "$PREFIX" -type f \( -name '*.ll' -o -name '*.bc' -o -name '*.o' -o -name 'baked-*' \) \
     | grep -q .; then
  bad "the installed tree ships a compiled artifact"
  find "$PREFIX" -type f \( -name '*.ll' -o -name '*.bc' -o -name '*.o' -o -name 'baked-*' \) \
    | sed 's/^/         /'
else
  ok "the installed tree ships no compiled library unit"
fi

# And with no writable cache location at all, an installed emit still works.
iro="$(EMIT_VERBOSITY=quiet EMIT_CACHE=/nonexistent/cannot/create "$EMIT" run "$TMP/one.scm" \
        2>/dev/null)"
[ "$iro" = "42" ] && ok "installed emit works with no usable cache location => $iro" \
  || bad "installed emit, unusable cache location => [$iro]"

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
