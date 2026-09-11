#!/usr/bin/env bash
# modules-repl-tests.sh -- Stage 1 module REPL door (change:
# module-artifacts-vertical-slice).  Chez-FREE: drives the shipped `emit repl`,
# which preloads the manifest's libraries into the shared JITDylib and honors
# interactive (import (L)) by merging the unit's exports into the session scope.
#
# Run from the repo root:  test/modules-repl-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

export EMIT_MANIFEST=test/modules/emit-libs.scm
# This is an exact eager-preload fixture, not a project asking for installed fallback.
HOST="build/emit repl --no-manifest-chain"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

pass=0; fail=0
# feed <input> and grab the last non-empty stdout line (the final form's value)
run_last () { printf '%s' "$1" | $HOST 2>/dev/null | awk 'NF{v=$0} END{print v}'; }

check () {  # <name> <input> <expected-last-value>
  local got; got="$(run_last "$2")"
  if [ "$got" = "$3" ]; then echo "  [OK  ] $1 => $got"; pass=$((pass+1))
  else echo "  [FAIL] $1 => $got  (expected $3)"; fail=$((fail+1)); fi
}

echo "module vertical-slice (REPL door)"
check repl-import   $'(import (mylib))\n(greet)\n'                       142
check repl-both     $'(import (liba))\n(import (libb))\n(+ (a-val) (b-val))\n' 43
check repl-shadow   $'(import (mylib))\n(define (greet) 99)\n(greet)\n'  99

echo "generalize: transitive imports, rename, diamond (REPL door)"
# (chain-a) transitively imports (chain-b); the fixpoint preload loads chain-b first
# even though the manifest lists chain-a earlier (topological, not manifest, order).
check repl-chain    $'(import (chain-a))\n(a-plus)\n'                    15
check repl-rename   $'(import (rename-lib))\n(fmap)\n'                   77
# diamond: (dia-a) and (dia-b) both import (dia-c); loaded/initialized once each.
check repl-diamond  $'(import (dia-a))\n(import (dia-b))\n(+ (a-val) (b-val))\n' 35

# a renamed export exposes only its EXTERNAL name; the internal name stays unbound.
echo "rename hides the internal name (REPL door)"
rerr="$(printf '(import (rename-lib))\n(%%fast-map)\n' | $HOST 2>&1 >/dev/null)"
rval="$(printf '(import (rename-lib))\n(fmap)\n' | $HOST 2>/dev/null | awk 'NF{v=$0}END{print v}')"
if echo "$rerr" | grep -q "unbound variable %fast-map" && [ "$rval" = "77" ]; then
  echo "  [OK  ] rename-hides-internal  (fmap => 77, %fast-map unbound)"; pass=$((pass+1))
else
  echo "  [FAIL] rename-hides-internal  (fmap=$rval; internal name should be unbound)"; fail=$((fail+1))
fi

echo "exported macros (REPL door; change: library-macro-export, issue #48)"
# The macro must be usable in a LATER form -- the whole point of merging it into session
# state rather than into one form's compile.
check repl-macro        $'(import (macrolib))\n(define a 1)\n(define b 2)\n(swap! a b)\n(+ (* a 10) b (mval))\n' 32
check repl-macro-helper $'(import (macro-helper-lib))\n(twice 5)\n'   18
check repl-macro-rename $'(import (macro-rename-lib))\n(define a 1)\n(define b 2)\n(swap! a b)\n(+ (* a 10) b)\n' 21
check repl-macro-dup    $'(import (macro-dup-a))\n(import (macro-dup-b))\n(+ (ma 1) (mb 1))\n' 103
# a LIBRARY importing another library's macro: the merge in compile-library*, not the
# program path.  The session only calls a procedure.
check repl-macro-user   $'(import (macro-user-lib))\n(dbl 4)\n' 10
# recursive variadic macro, with the session shadowing the helper its template calls
check repl-macro-rec    $'(import (macro-rec-lib))\n(define (pick a b) 3)\n(my-max 3 17 8 12)\n' 17
# a session's own define-syntax shadows an imported keyword of the same spelling
check repl-macro-shadow $'(import (macrolib))\n(define-syntax swap! (syntax-rules () ((_ a b) 99)))\n(swap! 1 2)\n' 99

# A form that fails to compile rolls the session back; an imported macro must survive that
# rollback, as an imported procedure does (spec scenario).
echo "an imported macro survives a failed form (REPL door)"
mout="$(printf '(import (macro-helper-lib))\n(twice 5)\n(nope 1)\n(twice 10)\n' | $HOST 2>/dev/null)"
merr="$(printf '(import (macro-helper-lib))\n(twice 5)\n(nope 1)\n(twice 10)\n' | $HOST 2>&1 >/dev/null)"
if echo "$merr" | grep -q "unbound variable nope" \
   && echo "$mout" | grep -qx "18" && echo "$mout" | grep -qx "33"; then
  echo "  [OK  ] macro-survives-failed-form  (18, error, 33)"; pass=$((pass+1))
else
  echo "  [FAIL] macro-survives-failed-form  (got: $(echo $mout))"; fail=$((fail+1))
fi

# an imported name is unbound until imported; the session must survive the error.
echo "unbound-before-import (session survives)"
errout="$(printf '(greet)\n(+ 2 3)\n' | $HOST 2>&1 >/dev/null)"   # stderr only
valout="$(printf '(greet)\n(+ 2 3)\n' | $HOST 2>/dev/null)"        # stdout only
if echo "$errout" | grep -q "unbound variable greet" && echo "$valout" | grep -qx "5"; then
  echo "  [OK  ] unbound-then-continue"; pass=$((pass+1))
else
  echo "  [FAIL] unbound-then-continue"; fail=$((fail+1))
fi


# ---------------------------------------------------------------------------
# Deferred library initialization (change: defer-manifest-library-init).
# A manifest library's __init runs at the first import that needs it, not at
# session startup, so a library the session never imports costs it no codegen.
# ---------------------------------------------------------------------------
IHOST="build/emit repl --no-manifest-chain --manifest test/modules/emit-libs-init.scm"
irun_last () { printf '%s' "$1" | $IHOST 2>/dev/null | awk 'NF{v=$0} END{print v}'; }
icheck () {  # <name> <input> <expected-last-value>
  local got; got="$(irun_last "$2")"
  if [ "$got" = "$3" ]; then echo "  [OK  ] $1 => $got"; pass=$((pass+1))
  else echo "  [FAIL] $1 => $got  (expected $3)"; fail=$((fail+1)); fi
}

echo "deferred initialization (REPL door)"

# A library the session never imports is registered but NOT initialized.  The absence
# of its narration IS the observable: the spec's "has not run", checked without
# importing it (which would be the thing that makes it run).
nover="$(printf '(+ 1 2)\n' | EMIT_VERBOSITY=verbose $IHOST 2>&1 >/dev/null)"
if echo "$nover" | grep -q "init-count" \
   && ! echo "$nover" | grep -q "initialize library init-count"; then
  echo "  [OK  ] unimported-not-initialized  (registered, never initialized)"; pass=$((pass+1))
else
  echo "  [FAIL] unimported-not-initialized"; fail=$((fail+1))
fi

# Registration stays eager, so a manifest entry whose SOURCE cannot be read is still
# reported before the first prompt -- not deferred to the import that would have used it.
# This is what the narrow deferral buys and the fuller one would give up (spec scenario).
UTMP="$(mktemp -d)"
cat > "$UTMP/m.scm" <<EOF
((library (ghost) (source "$PWD/test/modules/no-such-library.sld")))
EOF
uout="$(printf '(+ 1 2)\n' | build/emit repl --no-manifest-chain --manifest "$UTMP/m.scm" 2>&1 >/dev/null)"
if echo "$uout" | grep -q "cannot read library source"; then
  echo "  [OK  ] unreadable-library-reported-at-startup"; pass=$((pass+1))
else
  echo "  [FAIL] unreadable-library-reported-at-startup  (got: $(echo $uout | head -c 100))"; fail=$((fail+1))
fi
rm -rf "$UTMP"      # inline, not a trap: the startup-cost case below installs its own

# Importing it runs the body exactly once, and the names work afterwards.
icheck init-on-import      $'(import (init-count))\n(ticks)\n'                      1
icheck init-once-two-forms $'(import (init-count))\n(import (init-count))\n(ticks)\n' 1

# The closure, in dependency order: (init-outer) imports (init-count) and reads its
# counter AT ITS OWN INIT TIME, so 1 here means init-count was initialized first.
icheck init-closure-order  $'(import (init-outer))\n(outer-ticks)\n'                 1

# ...and the narration reports the same order.
oord="$(printf '(import (init-outer))\n' | EMIT_VERBOSITY=verbose $IHOST 2>&1 >/dev/null \
        | grep -o 'initialize library init-[a-z]*' | head -2 | tr '\n' ',')"
if [ "$oord" = "initialize library init-count,initialize library init-outer," ]; then
  echo "  [OK  ] init-order-narrated  (init-count before init-outer)"; pass=$((pass+1))
else
  echo "  [FAIL] init-order-narrated  (got: $oord)"; fail=$((fail+1))
fi

# A library whose body raises: the error names it, and its export stays UNBOUND,
# because the host runs the __init before asking the core to merge.
rerr2="$(printf '(import (init-raise))\n(boom)\n(+ 40 2)\n' | $IHOST 2>&1 >/dev/null)"
rval2="$(printf '(import (init-raise))\n(boom)\n(+ 40 2)\n' | $IHOST 2>/dev/null | awk 'NF{v=$0}END{print v}')"
if echo "$rerr2" | grep -q "init-raise" \
   && echo "$rerr2" | grep -q "unbound variable boom" \
   && [ "$rval2" = "42" ]; then
  echo "  [OK  ] failed-init-binds-nothing  (named, boom unbound, session continues)"; pass=$((pass+1))
else
  echo "  [FAIL] failed-init-binds-nothing  (err: $(echo $rerr2 | head -c 120); val: $rval2)"; fail=$((fail+1))
fi

# The deferred-init narration is verbose-only and never on stdout (docs/OUTPUT.md).
dq="$(printf '(import (init-count))\n(ticks)\n' | EMIT_VERBOSITY=quiet   $IHOST 2>&1 >/dev/null)"
dd="$(printf '(import (init-count))\n(ticks)\n' | $IHOST 2>&1 >/dev/null)"
dso="$(printf '(import (init-count))\n(ticks)\n' | EMIT_VERBOSITY=verbose $IHOST 2>/dev/null)"
if ! echo "$dq" | grep -q "initialize library" \
   && ! echo "$dd" | grep -q "initialize library" \
   && ! echo "$dso" | grep -q "initialize library"; then
  echo "  [OK  ] init-narration-verbose-only"; pass=$((pass+1))
else
  echo "  [FAIL] init-narration-verbose-only  (leaked to default/quiet/stdout)"; fail=$((fail+1))
fi

# DOOR AGREEMENT (design D4): the run door and the REPL door initialize one closure in
# the same order.  Both print 1 only if (init-count) ran before (init-outer); the
# observable is a value, not narration, so it holds for a delivered program too.
echo "the two doors initialize a closure alike"
progout="$(build/emit run --no-manifest-chain --manifest test/modules/emit-libs-init.scm \
             test/modules/prog-init-outer.scm 2>/dev/null)"
replout="$(irun_last $'(import (init-outer))\n(outer-ticks)\n')"
if [ "$progout" = "1" ] && [ "$replout" = "1" ]; then
  echo "  [OK  ] door-agreement-init-order  (run => $progout, repl => $replout)"; pass=$((pass+1))
else
  echo "  [FAIL] door-agreement-init-order  (run => $progout, repl => $replout)"; fail=$((fail+1))
fi

# STARTUP COST (spec scenario): the same manifest, plus one outsized library the session
# never imports, starts in the same ORDER of time.
echo "startup does not scale with an unimported library"
# The two manifests are generated side by side with ABSOLUTE source paths.  A manifest's
# (source ...) entries resolve relative to the manifest, so a copy placed elsewhere with
# relative paths loads nothing and then times a session that is not the one under test --
# which reads as a spectacular win.  Absolute paths, plus the load-error check below,
# rule that out.
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
ROOT="$PWD"
cat > "$TMP/small.scm" <<EOF
((library (emit internal) (source "$ROOT/lib/emit/internal.sld"))
 (library (scheme base)   (source "$ROOT/lib/scheme/base.sld"))
 (library (init-count)    (source "$ROOT/test/modules/init-count.sld"))
 (library (init-outer)    (source "$ROOT/test/modules/init-outer.sld")))
EOF
sed 's|^ (library (init-outer).*)))$| (library (init-outer)    (source "INIT_OUTER"))\n (library (scheme char)   (source "SCHEME_CHAR")))|' \
    "$TMP/small.scm" \
  | sed "s|INIT_OUTER|$ROOT/test/modules/init-outer.sld|; s|SCHEME_CHAR|$ROOT/lib/scheme/char.sld|" \
  > "$TMP/big.scm"

manifest_loads_cleanly () {   # <manifest> -- no "error:" on stderr at session start
  ! printf '(+ 1 2)\n' \
    | build/emit repl --no-manifest-chain --manifest "$1" 2>&1 >/dev/null \
    | grep -q "^error:"
}

tmin () {   # <command> -- best-of-three wall clock, in whole milliseconds
  local b=999999 s i
  for i in 1 2 3; do
    s=$( { /usr/bin/time -p sh -c "printf '(+ 1 2)\n' | $1 >/dev/null 2>&1"; } 2>&1 \
         | awk '/^real/{printf "%d", $2*1000}' )
    [ "$s" -lt "$b" ] && b="$s"
  done
  echo "$b"
}

if ! manifest_loads_cleanly "$TMP/small.scm" || ! manifest_loads_cleanly "$TMP/big.scm"; then
  echo "  [FAIL] startup-independent-of-unimported  (a generated manifest does not load)"
  fail=$((fail+1))
else
  t_small=$(tmin "build/emit repl --no-manifest-chain --manifest $TMP/small.scm")
  t_big=$(tmin "build/emit repl --no-manifest-chain --manifest $TMP/big.scm")
  # An ORDER-OF-MAGNITUDE assertion, not a threshold.  Initialized eagerly, (scheme char)
  # alone put ~1.8 s on a ~0.4 s start -- several times over, on any machine.  Deferred, it
  # costs a read and an IR parse.  The slack term keeps a fast small-manifest start from
  # making the ratio brittle; the point is to catch a return to eager init, not to police
  # milliseconds.
  if [ "$t_big" -lt $((t_small * 3 + 300)) ]; then
    echo "  [OK  ] startup-independent-of-unimported  (${t_small}ms vs ${t_big}ms)"
    pass=$((pass+1))
  else
    echo "  [FAIL] startup-independent-of-unimported  (${t_small}ms vs ${t_big}ms: still scaling)"
    fail=$((fail+1))
  fi
fi

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
