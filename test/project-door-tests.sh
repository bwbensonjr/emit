#!/usr/bin/env bash
# project-door-tests.sh -- every door works in a USER PROJECT directory
# (change: baked-set-on-every-door; issue #39 plus the `emit lib` half found with it).
#
# The project this builds is the one docs/PROJECTS.md walks through, so the commands
# and values that document prints are the ones asserted here: two libraries (one
# importing (scheme base), one importing that library plus (scheme inexact)), a
# program, and a manifest naming ONLY the project's own libraries and its program
# entry.  A user's manifest has no business naming (scheme base) or the internal
# substrate -- they are baked into the binary -- and before this change two doors
# required exactly that:
#
#   emit repl : resolved (scheme base) from the manifest (eager preload, mode 5), so
#               in this directory a session had NO standard library at all --
#                 error: library lib/stats.sld: unresolved or cyclic import ...
#                 warning: auto-import (scheme base): (scheme base) not loaded ...
#                 > error: repl: unbound variable map
#   emit lib  : derived the export table (mode 11) against an unseeded session, so any
#               library importing (scheme base) failed --
#                 emit lib: repl: unbound variable map
#
# Chez-FREE (default suite).  Run from the repo root:  test/project-door-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

EMIT=build/emit
make emit >/dev/null 2>&1 || { echo "failed to build $EMIT"; exit 1; }
EMITABS="$PWD/$EMIT"
REPO="$PWD"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# --- the project docs/PROJECTS.md describes -------------------------------------
PROJ="$TMP/myproj"
mkdir -p "$PROJ/lib"

cat > "$PROJ/lib/stats.sld" <<'EOF'
(define-library (stats)
  (import (scheme base))
  (export sum-list mean)
  (begin
    (define (sum-list xs) (fold-left + 0 xs))
    (define (mean xs) (/ (sum-list xs) (length xs)))))
EOF

cat > "$PROJ/lib/report.sld" <<'EOF'
(define-library (report)
  (import (scheme base) (stats) (scheme inexact))
  (export describe)
  (begin
    (define (square x) (* x x))
    (define (describe xs)
      (list 'n (length xs)
            'mean (mean xs)
            'rms (sqrt (mean (map square xs)))))))
EOF

cat > "$PROJ/main.scm" <<'EOF'
(import (report))
(describe (list 1.0 2.0 3.0))
EOF

# The manifest a project SHOULD be able to write: its own libraries and its program.
# (scheme inexact) is not baked, so it IS named -- from the checkout, absolutely, since
# a manifest's relative paths resolve against the manifest's own directory.
cat > "$PROJ/emit-libs.scm" <<EOF
((library (scheme inexact) (source "$REPO/lib/scheme/inexact.sld"))
 (library (stats)  (source "lib/stats.sld"))
 (library (report) (source "lib/report.sld"))
 (program myproj (source "main.scm") (output "build/myproj")))
EOF

VALUE='(n 3 mean 2.0 rms 2.160246899469287)'

echo "emit run / emit build in a project directory (worked before this change)"

# 1. emit run resolves the project's libraries through its own manifest.
got="$(cd "$PROJ" && "$EMITABS" run main.scm 2>/dev/null)"
[ "$got" = "$VALUE" ] && ok "emit run => $got" || bad "emit run => [$got] want [$VALUE]"

# 2. emit build delivers a standalone executable that runs to the same value.
if (cd "$PROJ" && EMIT_VERBOSITY=quiet "$EMITABS" build myproj) >"$TMP/b.log" 2>&1; then
  got="$("$PROJ/build/myproj" 2>/dev/null)"
  [ "$got" = "$VALUE" ] && ok "emit build + run => $got" || bad "delivered exe => [$got]"
else bad "emit build failed"; sed 's/^/         /' "$TMP/b.log"; fi

echo
echo "emit repl in a project directory (issue #39)"

# 3. A session has the standard library with no manifest entry for it.
printf '(map (lambda (x) (* x x)) (list 1 2 3))\n' > "$TMP/r1.in"
out="$(cd "$PROJ" && "$EMITABS" repl < "$TMP/r1.in" 2>"$TMP/r1.err")"
if echo "$out" | grep -q '(1 4 9)'; then ok "repl resolves a (scheme base) name"
else bad "repl (scheme base) name => [$out]"; sed 's/^/         /' "$TMP/r1.err"; fi

# 4. No "not loaded (missing from manifest?)" warning, and no unresolved-import error.
if grep -q 'missing from manifest' "$TMP/r1.err"; then
  bad "repl warns the standard library is missing from the manifest"
  sed 's/^/         /' "$TMP/r1.err"
else ok "repl does not warn about (scheme base)"; fi

# 5. A derived-form macro expands (the compile-time half is merged).
printf '(cond ((null? (list)) (quote empty)) (else (quote full)))\n' > "$TMP/r2.in"
out="$(cd "$PROJ" && "$EMITABS" repl < "$TMP/r2.in" 2>/dev/null)"
echo "$out" | grep -q 'empty' && ok "repl expands cond" || bad "repl cond => [$out]"

# 6. The project's own library loads interactively -- it imports (scheme base), which
#    is what made this fail with "unresolved or cyclic import" before.
printf '(import (report))\n(describe (list 1.0 2.0 3.0))\n' > "$TMP/r3.in"
out="$(cd "$PROJ" && "$EMITABS" repl < "$TMP/r3.in" 2>"$TMP/r3.err")"
if echo "$out" | grep -qF "$VALUE"; then ok "repl imports the project library"
else bad "repl import => [$out]"; sed 's/^/         /' "$TMP/r3.err"; fi

# 7. A session with NO manifest at all still has the standard library.
mkdir -p "$TMP/bare"
out="$(cd "$TMP/bare" && "$EMITABS" repl < "$TMP/r1.in" 2>/dev/null)"
echo "$out" | grep -q '(1 4 9)' && ok "repl with no manifest has (scheme base)" \
  || bad "repl no-manifest => [$out]"

# 8. A substrate name is still NOT in scope (registering != auto-importing).
printf '(rd-atom)\n' > "$TMP/r4.in"
out="$(cd "$PROJ" && "$EMITABS" repl < "$TMP/r4.in" 2>&1)"
echo "$out" | grep -q 'unbound variable rd-atom' && ok "substrate name stays unbound" \
  || bad "substrate leak => [$out]"

# 9. --no-prelude still yields a bare session.
out="$(cd "$PROJ" && "$EMITABS" repl --no-prelude < "$TMP/r1.in" 2>&1)"
echo "$out" | grep -q 'unbound variable map' && ok "--no-prelude has no standard library" \
  || bad "--no-prelude => [$out]"

echo
echo "emit lib in a project directory (the half issue #39 did not know about)"

# 10. A library importing (scheme base) compiles to BOTH artifacts.
if (cd "$PROJ" && EMIT_VERBOSITY=quiet "$EMITABS" lib lib/stats.sld -o build/lib) \
     >"$TMP/l1.log" 2>&1; then
  if [ -s "$PROJ/build/lib/stats.ll" ] && [ -s "$PROJ/build/lib/stats.exports" ]; then
    ok "emit lib (imports (scheme base)) wrote .ll + .exports"
  else bad "emit lib artifacts missing"; fi
else bad "emit lib (imports (scheme base)) failed"; sed 's/^/         /' "$TMP/l1.log"; fi

# 11. The export table names the library's exports.
if grep -q 'sum-list' "$PROJ/build/lib/stats.exports" 2>/dev/null \
   && grep -q 'mean' "$PROJ/build/lib/stats.exports" 2>/dev/null; then
  ok "emit lib .exports lists sum-list and mean"
else bad "emit lib .exports content"; fi

# 12. A library importing ANOTHER library (plus a manifest library) compiles too.
if (cd "$PROJ" && EMIT_VERBOSITY=quiet "$EMITABS" lib lib/report.sld -o build/lib) \
     >"$TMP/l2.log" 2>&1; then
  grep -q 'stats:mean' "$PROJ/build/lib/report.ll" \
    && ok "emit lib (imports (stats) + (scheme inexact)) references stats:mean" \
    || bad "emit lib report.ll missing the external global"
else bad "emit lib (transitive imports) failed"; sed 's/^/         /' "$TMP/l2.log"; fi

# 13. One compile-unit core: emit lib's unit IR == the unit `emit run --emit` emits.
(cd "$PROJ" && "$EMITABS" run --emit < lib/stats.sld) >"$TMP/via-run.ll" 2>/dev/null
if cmp -s "$TMP/via-run.ll" "$PROJ/build/lib/stats.ll"; then
  ok "emit lib .ll byte-identical to the run door's unit"
else bad "emit lib .ll differs from the run door's unit"; fi

# 14. An unresolvable import is reported and writes nothing.
cat > "$PROJ/lib/broken.sld" <<'EOF'
(define-library (broken)
  (import (scheme base) (nope))
  (export f)
  (begin (define (f) 1)))
EOF
rm -f "$PROJ/build/lib/broken.ll" "$PROJ/build/lib/broken.exports"
if (cd "$PROJ" && "$EMITABS" lib lib/broken.sld -o build/lib) >"$TMP/l3.log" 2>&1; then
  bad "emit lib on an unresolvable import should fail"
else
  if [ ! -e "$PROJ/build/lib/broken.ll" ] && [ ! -e "$PROJ/build/lib/broken.exports" ]; then
    ok "emit lib reports the unresolved import and writes nothing"
  else bad "emit lib wrote an artifact despite failing"; fi
fi

# 15. Diagnostics name the door, not the compiler's internal REPL orchestration.
cat > "$PROJ/lib/unbound.sld" <<'EOF'
(define-library (unbound)
  (import (scheme base))
  (export f)
  (begin (define (f) (no-such-procedure 1))))
EOF
(cd "$PROJ" && "$EMITABS" lib lib/unbound.sld -o build/lib) >"$TMP/l4.log" 2>&1
if grep -q 'repl:' "$TMP/l4.log"; then
  bad "emit lib diagnostic carries the repl: prefix"; sed 's/^/         /' "$TMP/l4.log"
else ok "emit lib diagnostic has no repl: prefix"; fi

echo
echo "a manifest that DOES name the baked members still works (no double load)"

# The repository's own emit-libs.scm names (scheme base) and (emit internal) -- the Chez
# driver resolves them from there -- so every in-repo door start exercises the
# already-loaded guard.  A second copy would collide in the JIT rather than fail quietly.
cat > "$PROJ/baked.scm" <<EOF
((library (emit internal)  (source "$REPO/lib/emit/internal.sld"))
 (library (scheme base)    (source "$REPO/lib/scheme/base.sld"))
 (library (scheme inexact) (source "$REPO/lib/scheme/inexact.sld"))
 (library (stats)  (source "$PROJ/lib/stats.sld"))
 (library (report) (source "$PROJ/lib/report.sld"))
 (program myproj (source "$PROJ/main.scm") (output "$TMP/baked-app")))
EOF

# 16. A REPL against that manifest works and reports no error.
out="$(cd "$PROJ" && "$EMITABS" repl --manifest baked.scm < "$TMP/r3.in" 2>"$TMP/r5.err")"
if echo "$out" | grep -qF "$VALUE" && ! grep -q '^error:' "$TMP/r5.err"; then
  ok "repl with a manifest naming the baked members"
else bad "repl baked-manifest => [$out]"; sed 's/^/         /' "$TMP/r5.err"; fi

# 17. Each baked member is registered exactly ONCE (verbose narration names them).
out="$(cd "$PROJ" && EMIT_VERBOSITY=verbose "$EMITABS" repl --manifest baked.scm \
        < "$TMP/r1.in" 2>&1 >/dev/null)"
n_base="$(echo "$out" | grep -c 'register baked library scheme\.base' || true)"
[ "$n_base" = "1" ] && ok "(scheme base) registered exactly once" \
  || bad "(scheme base) registered $n_base times"

# 18. emit run against that manifest still emits ONE module per baked member.
(cd "$PROJ" && "$EMITABS" run --emit --manifest baked.scm < main.scm) \
  >"$TMP/prog.ll" 2>/dev/null
n_units="$(grep -c '^; ==EMIT-UNIT-BOUNDARY==$' "$TMP/prog.ll" || true)"
# (emit internal), (scheme base), (scheme inexact), (stats), (report), program = 5 markers
[ "$n_units" = "5" ] && ok "emit run emits 5 unit boundaries (no duplicate base)" \
  || bad "emit run emitted $n_units unit boundaries, want 5"

# 19. emit build against that manifest delivers a working executable.
if (cd "$PROJ" && EMIT_VERBOSITY=quiet "$EMITABS" build myproj --manifest baked.scm) \
     >"$TMP/b2.log" 2>&1; then
  got="$("$TMP/baked-app" 2>/dev/null)"
  [ "$got" = "$VALUE" ] && ok "emit build with a baked-naming manifest => $got" \
    || bad "baked-manifest exe => [$got]"
else bad "emit build baked-manifest failed"; sed 's/^/         /' "$TMP/b2.log"; fi

echo
echo "a manifest naming a source that does not exist (a typo'd path)"

# 20. The REPL survives it, names the file, and still has the standard library.  It used to
#     SEGFAULT at startup: the host read the missing file as "", mode 4 took (car '()) on the
#     empty form list, and a primitive trap is not catchable by the in-language `guard` that
#     wraps that mode.  Eager preload means an entry the session never imports reaches this.
cat > "$PROJ/typo.scm" <<EOF
((library (stats) (source "$PROJ/lib/stats.sld"))
 (library (ghost) (source "nowhere.sld")))
EOF
out="$(cd "$PROJ" && "$EMITABS" repl --manifest typo.scm < "$TMP/r1.in" 2>"$TMP/r6.err")"
rc=$?
if [ "$rc" -lt 128 ] && echo "$out" | grep -q '(1 4 9)' \
   && grep -q 'cannot read library source nowhere.sld' "$TMP/r6.err"; then
  ok "repl names the unreadable source and keeps the session"
else
  bad "repl on a typo'd manifest path (exit $rc) => [$out]"
  sed 's/^/         /' "$TMP/r6.err"
fi

# 21. The run door reports it when the program imports the missing library, and exits non-zero.
printf '(import (ghost))\n(quote x)\n' > "$PROJ/ghost.scm"
if (cd "$PROJ" && "$EMITABS" run ghost.scm --manifest typo.scm) >"$TMP/g.log" 2>&1; then
  bad "emit run should fail on an unreadable library source"
else
  grep -q 'cannot read library source nowhere.sld' "$TMP/g.log" \
    && ok "emit run names the unreadable source" \
    || { bad "emit run diagnostic"; sed 's/^/         /' "$TMP/g.log"; }
fi

echo
echo "a manifest that declares nothing (issue #63)"

# A manifest with no ENTRIES is not the same as a manifest with no BYTES: whitespace and
# comments are the reader's grammar, so "empty" is decided by whether the text holds a
# DATUM.  All four shapes below used to SEGFAULT (exit 139, no diagnostic) -- the manifest
# parsers opened with (car (read-all-from-string text)) and read-all-from-string returns
# () for datum-free text, so `car` faulted on a non-pair (unchecked by design, see
# core-language).  A byte-length guard in the host would have caught only the first two.
BARE="$TMP/bare-proj"
mkdir -p "$BARE"
printf '(display (+ 1 2))\n(newline)\n' > "$BARE/hello.scm"

# 22. `emit build` with NO manifest at all names the file it looked for and exits cleanly.
(cd "$BARE" && rm -f emit-libs.scm && "$EMITABS" build) >"$TMP/e0.log" 2>&1
rc=$?
if [ "$rc" -ne 0 ] && [ "$rc" -lt 128 ] && grep -q 'no manifest found' "$TMP/e0.log" \
   && grep -q 'emit-libs.scm' "$TMP/e0.log"; then
  ok "emit build with no manifest reports and exits $rc"
else
  bad "emit build no-manifest (exit $rc)"; sed 's/^/         /' "$TMP/e0.log"
fi

# 23-25. A manifest that EXISTS but declares no entries, in all three datum-free shapes.
n=23
for shape in empty whitespace comment; do
  case "$shape" in
    empty)      : > "$BARE/emit-libs.scm" ;;
    whitespace) printf '   \n\n\t\n' > "$BARE/emit-libs.scm" ;;
    comment)    printf '; nothing here yet\n#| nor here |#\n' > "$BARE/emit-libs.scm" ;;
  esac
  (cd "$BARE" && "$EMITABS" build) >"$TMP/e$n.log" 2>&1
  rc=$?
  if [ "$rc" -ne 0 ] && [ "$rc" -lt 128 ] \
     && grep -q 'no entries' "$TMP/e$n.log" && grep -q 'emit-libs.scm' "$TMP/e$n.log"; then
    ok "emit build on a $shape manifest reports no entries (exit $rc)"
  else
    bad "emit build $shape manifest (exit $rc)"; sed 's/^/         /' "$TMP/e$n.log"
  fi
  n=$((n+1))
done

# 26. A source path given where an ENTRY NAME belongs is the easy way to hit this by
#     mistake -- `emit build` takes a manifest entry name, not a path.
: > "$BARE/emit-libs.scm"
(cd "$BARE" && "$EMITABS" build hello.scm) >"$TMP/e26.log" 2>&1
rc=$?
if [ "$rc" -ne 0 ] && [ "$rc" -lt 128 ]; then
  ok "emit build NAME against an entryless manifest exits $rc, not a signal"
else
  bad "emit build hello.scm (exit $rc)"; sed 's/^/         /' "$TMP/e26.log"
fi

# 27. A manifest declaring LIBRARIES but no program keeps its existing message -- this is
#     a different cause from 23-25 and must stay distinguishable from it.
echo '((library (nope) (source "nope.sld")))' > "$BARE/emit-libs.scm"
(cd "$BARE" && "$EMITABS" build) >"$TMP/e27.log" 2>&1
rc=$?
if [ "$rc" -ne 0 ] && grep -q 'no program entry in manifest' "$TMP/e27.log" \
   && ! grep -q 'no entries' "$TMP/e27.log"; then
  ok "emit build on a library-only manifest still reports no program entry"
else
  bad "emit build library-only manifest (exit $rc)"; sed 's/^/         /' "$TMP/e27.log"
fi

# 28-30. The run door: an entryless manifest resolves like NO manifest, which module-system
#        requires to stay non-fatal for a program importing only baked-in libraries.
n=28
for shape in empty whitespace comment; do
  case "$shape" in
    empty)      : > "$BARE/emit-libs.scm" ;;
    whitespace) printf '  \n\n' > "$BARE/emit-libs.scm" ;;
    comment)    printf '; still nothing\n' > "$BARE/emit-libs.scm" ;;
  esac
  got="$(cd "$BARE" && "$EMITABS" run hello.scm 2>"$TMP/r$n.err")"
  rc=$?
  if [ "$rc" -eq 0 ] && [ "$got" = "3" ]; then
    ok "emit run under a $shape manifest => $got"
  else
    bad "emit run $shape manifest (exit $rc) => [$got]"; sed 's/^/         /' "$TMP/r$n.err"
  fi
  n=$((n+1))
done

# 31. An UNRESOLVED import is reported by import resolution and NAMES the library, in all
#     three manifest states.  The program path used to report the constant "program imports a
#     library not found in the manifest" -- naming nothing -- while `emit lib` named the
#     library correctly, so the same failure read differently depending on the door.
#     module-system requires the name ("reported by import resolution, naming the unresolved
#     library"); only the library half implemented it.
printf '(import (absent))\n(display 1)\n' > "$BARE/needs.scm"
n=31
for state in none entryless lacking; do
  case "$state" in
    none)      rm -f "$BARE/emit-libs.scm" ;;
    entryless) : > "$BARE/emit-libs.scm" ;;
    lacking)   echo '((library (other) (source "other.sld")))' > "$BARE/emit-libs.scm" ;;
  esac
  (cd "$BARE" && "$EMITABS" run needs.scm) >"$TMP/u$n.log" 2>&1
  rc=$?
  if [ "$rc" -ne 0 ] && [ "$rc" -lt 128 ] && grep -q '(absent)' "$TMP/u$n.log"; then
    ok "emit run names the unresolved import (manifest: $state)"
  else
    bad "emit run unresolved import, manifest $state (exit $rc)"
    sed 's/^/         /' "$TMP/u$n.log"
  fi
  n=$((n+1))
done

# 31d. `emit lib`'s message, which was already correct, must not have changed.
printf '(define-library (x)\n  (import (absent))\n  (export f)\n  (begin (define (f) 1)))\n' \
  > "$BARE/x.sld"
: > "$BARE/emit-libs.scm"
(cd "$BARE" && "$EMITABS" lib x.sld -o build/lib) >"$TMP/e31d.log" 2>&1
if grep -q 'unresolved import (not baked, not in the manifest): (absent)' "$TMP/e31d.log"; then
  ok "emit lib's unresolved-import message is unchanged"
else
  bad "emit lib unresolved-import message"; sed 's/^/         /' "$TMP/e31d.log"
fi

# 32. A library SOURCE that holds no datum is a different case from an entryless manifest:
#     the caller needs a define-library and there is none, so it is an ERROR naming the
#     source.  Found while auditing the manifest parsers; the byte-empty case is masked
#     because the host folds an empty read into "cannot read library source", but a
#     comment-only source reaches mode 4 and used to segfault (exit 139).
printf '; a library source with no define-library\n' > "$BARE/hollow.sld"
echo '((library (hollow) (source "hollow.sld")))' > "$BARE/emit-libs.scm"
printf '(import (hollow))\n(display 1)\n' > "$BARE/uses-hollow.scm"
(cd "$BARE" && "$EMITABS" run uses-hollow.scm) >"$TMP/e32.log" 2>&1
rc=$?
if [ "$rc" -ne 0 ] && [ "$rc" -lt 128 ] && grep -q 'hollow' "$TMP/e32.log"; then
  ok "emit run names a library source holding no define-library (exit $rc)"
else
  bad "emit run datum-free library source (exit $rc)"; sed 's/^/         /' "$TMP/e32.log"
fi

# 33. A MALFORMED manifest is not an empty one, and must not be MISreported as one.  What it
#     IS reported as is out of scope here: the reader closes an unterminated list silently at
#     end of input, in any source and not only a manifest, so this truncated manifest is
#     currently accepted as though complete.  That reader gap is tracked separately; what
#     this pins is that the empty-manifest path does not swallow it.
printf '((library (x) (source "y.sld")\n' > "$BARE/emit-libs.scm"   # unclosed
(cd "$BARE" && "$EMITABS" run hello.scm) >"$TMP/e33.log" 2>&1
rc=$?
if [ "$rc" -lt 128 ] && ! grep -q 'no entries' "$TMP/e33.log"; then
  ok "emit run does not misreport a malformed manifest as entryless (exit $rc)"
else
  bad "emit run malformed manifest (exit $rc)"; sed 's/^/         /' "$TMP/e33.log"
fi

# 34. A manifest that is not a LIST OF ENTRIES at all.  These crashed for a second reason:
#     the entry walks stopped at (), which a bare atom and an improper list never reach, so
#     the loop took (car NON-PAIR) one step in.  The walks test `pair?` instead, which is
#     total over every shape rather than over an enumeration of them.
for m in 'hello' '42' '"str"' '(a . b)'; do
  printf '%s\n' "$m" > "$BARE/emit-libs.scm"
  got="$(cd "$BARE" && "$EMITABS" run hello.scm 2>/dev/null)"
  rc=$?
  if [ "$rc" -lt 128 ]; then
    ok "emit run survives a non-list manifest [$m] (exit $rc)"
  else
    bad "emit run on a non-list manifest [$m] died on a signal (exit $rc)"
  fi
done

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
