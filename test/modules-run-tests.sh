#!/usr/bin/env bash
# modules-run-tests.sh -- the module RUN door (change: run-door-user-libraries).
# Chez-FREE: drives the shipped `emit run`, which registers the baked-in
# (scheme base), preloads the manifest's user libraries into the JIT (without running
# their __init), then compiles the whole program against them via the mode-dispatched
# embedded compiler and runs it in-process.  This is the third module door, at parity
# with the AOT and REPL doors.
#
# The final section (dev->ship fidelity vs the AOT door) is Chez-GATED: it compares the
# run-door value and program-module bytes to the Chez AOT driver's.
#
# Run from the repo root:  test/modules-run-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

MOD=test/modules
MAN="$MOD/emit-libs.scm"
RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0

check () {  # <name> <src> <expected>
  local name="$1" src="$2" want="$3"
  local got; got="$($RUN --manifest "$MAN" < "$src" 2>"$TMP/$name.err")"
  if [ "$got" = "$want" ]; then echo "  [OK  ] $name => $got"; pass=$((pass+1))
  else echo "  [FAIL] $name => $got  (expected $want)"; sed 's/^/         /' "$TMP/$name.err"; fail=$((fail+1)); fi
}

# assert a run FAILS (non-zero) and its diagnostic matches a regex
check_fail () {  # <name> <src> <manifest> <regex>
  local name="$1" src="$2" man="$3" re="$4"
  if $RUN --manifest "$man" < "$src" >"$TMP/$name.out" 2>"$TMP/$name.err"; then
    echo "  [FAIL] $name  (expected non-zero exit, but it succeeded)"; fail=$((fail+1)); return
  fi
  if grep -qE "$re" "$TMP/$name.err"; then
    echo "  [OK  ] $name  (failed as expected)"; pass=$((pass+1))
  else
    echo "  [FAIL] $name  (failed, but not matching /$re/)"; sed 's/^/         /' "$TMP/$name.err"; fail=$((fail+1))
  fi
}

echo "module run door (emit run, Chez-free)"
check run-import   "$MOD/prog-mylib.scm"   142   # import (mylib); greet -> 142
check run-chain    "$MOD/prog-chain.scm"    15   # (chain-a) -> (chain-b), transitive
check run-diamond  "$MOD/prog-diamond.scm"  35   # (dia-a)+(dia-b) both import (dia-c), once each
check run-rename   "$MOD/prog-rename.scm"   77   # (rename-lib): importer sees fmap

echo "run door: exported macros (change: library-macro-export, issue #48)"
check run-macro        "$MOD/prog-macrolib.scm"      32
check run-macro-helper "$MOD/prog-macro-helper.scm"  18   # template reaches a PRIVATE helper/macro
check run-macro-rename "$MOD/prog-macro-rename.scm"  21
check run-macro-dup    "$MOD/prog-macro-dup.scm"    103   # two libraries, same-spelling privates
check run-macro-unused "$MOD/prog-macro-unused.scm"  22
check run-macro-user   "$MOD/prog-macro-user.scm"     10   # a LIBRARY imports another's macro
check run-macro-rec    "$MOD/prog-macro-rec.scm"      17   # recursive variadic macro

echo "run door: a plain program needs no manifest ((scheme base) is baked in)"
RUNABS="$PWD/build/emit"
plain="$TMP/plain.scm"; printf '(map (lambda (x) (* x x)) (list 1 2 3))\n' > "$plain"
got="$(cd "$TMP" && "$RUNABS" run < plain.scm 2>/dev/null)"    # run from a dir with NO manifest present
if [ "$got" = "(1 4 9)" ]; then echo "  [OK  ] run-no-manifest => $got"; pass=$((pass+1))
else echo "  [FAIL] run-no-manifest => $got  (expected (1 4 9))"; fail=$((fail+1)); fi

echo "run door: import errors are reported and exit non-zero"
check_fail run-cycle   "$MOD/prog-cycle.scm"   "$MOD/emit-libs-cycle.scm" "cyclic|unresolved"
# The run door NAMES the unresolved library now, as `emit lib` always did -- it used to
# report the constant "program imports a library not found in the manifest", naming nothing
# (change: manifest-empty-guards; issue #63).  Asserting the NAME, not just the phrase, is
# the point of the change: module-system requires the failure be reported "naming the
# unresolved library", and a pattern that ignores the name would pass either way.
check_fail run-missing "$MOD/prog-missing.scm" "$MAN"       "not in the manifest.*\(nope\)"
# a name bound both by define and define-syntax (change: library-macro-export, design D3)
check_fail run-macro-dupname "$MOD/prog-macro-dupname.scm" "$MOD/emit-libs-macdup.scm" \
  "both define and define-syntax"
# the INTERNAL keyword of a renamed macro export stays invisible to the importer
check_fail run-macro-hidden  "$MOD/prog-macro-rename-bad.scm" "$MAN" "unbound variable.*%swap"

# --- an import SET is rejected by name, identically on every path -------------
# (change: module-frontend-diagnostics, issue #45.)  These cases live HERE rather than in
# test/modules-tests.sh, which the tasks named: that suite is Chez-GATED and exits 0
# without chez, so the assertions would not run on the Chez-free path these doors take.
#
# The property under test is not just "it fails" -- it is that ONE form gets ONE message.
# Before this change an import set was read as a library NAME, so the program path
# reported a missing manifest entry and the library path reported an unresolved or cyclic
# import: two unrelated stories, neither naming the form.
echo "run door: an import set is rejected by name, on both the program and library paths"

# the message body, with each door's own prefix stripped -- the prefix is per-door by
# design (a door's diagnostics name that door), the message must not be.
is_msg () { sed -n 's/^.*\(import sets are not supported.*\)$/\1/p' "$1" | head -1; }

for spec in 'only (scheme base) car' 'except (scheme base) car' \
            'prefix (scheme base) b:' 'rename (scheme base) (car hd)'; do
  kw="${spec%% *}"
  printf '(import (%s))\n(display 1)\n' "$spec" > "$TMP/is-$kw.scm"
  check_fail "import-set-$kw" "$TMP/is-$kw.scm" "$MAN" \
    "import sets are not supported: \($kw "
done

# the SAME form inside a define-library, through `emit lib`, and the two messages must
# match -- the property today's code does not have.
printf '(define-library (isl)\n  (export f)\n  (import (only (scheme base) car))\n  (begin (define (f x) x)))\n' \
  > "$TMP/isl.sld"
printf '(import (only (scheme base) car))\n(display 1)\n' > "$TMP/isp.scm"
$RUN --manifest "$MAN" < "$TMP/isp.scm" >/dev/null 2>"$TMP/isp.err"
build/emit lib "$TMP/isl.sld" >/dev/null 2>"$TMP/isl.err"
prog_msg="$(is_msg "$TMP/isp.err")"; lib_msg="$(is_msg "$TMP/isl.err")"
if [ -n "$prog_msg" ] && [ "$prog_msg" = "$lib_msg" ]; then
  echo "  [OK  ] import-set-same-message  ($prog_msg)"; pass=$((pass+1))
else
  echo "  [FAIL] import-set-same-message  (program: ${prog_msg:-<none>} / library: ${lib_msg:-<none>})"
  fail=$((fail+1))
fi
# and neither one still tells the old story about the manifest or a cycle.
if grep -Eq 'not found in the manifest|cyclic' "$TMP/isp.err" "$TMP/isl.err"; then
  echo "  [FAIL] import-set-no-stale-story  (still blaming the manifest or a cycle)"; fail=$((fail+1))
else
  echo "  [OK  ] import-set-no-stale-story"; pass=$((pass+1))
fi

# --- a MISPLACED define-library is reported as one ----------------------------
# (change: module-frontend-diagnostics, issue #49 first half.)  Expression parsing knows
# no `define-library`, so it read one as an application over internal defines and
# reported `internal defines with no following body expression ?` -- a message about the
# misparse, with a trailing `?` that is an artifact of it.
echo "run door: a define-library that is not its source's only form is named as one"
printf '(define-library (two)\n  (export f)\n  (begin (define (f x) x)))\n(display 1)\n' \
  > "$TMP/two.scm"
check_fail misplaced-library "$TMP/two.scm" "$MAN" \
  'a define-library must be the only form in its source: \(two\)'
if grep -Eq 'internal defines with no following body' "$TMP/misplaced-library.err"; then
  echo "  [FAIL] misplaced-library-not-misparsed  (still the malformed-body message)"; fail=$((fail+1))
else
  echo "  [OK  ] misplaced-library-not-misparsed"; pass=$((pass+1))
fi

# At the PROMPT: named as unsupported there, and -- design D6 -- the session survives it,
# which the following form's value proves.  A mistyped declaration taking down a session
# would trade one defect for a worse one.
echo "REPL door: a define-library at the prompt is named, and the session survives"
repl_in=$'(define-library (r) (export f) (begin (define (f x) x)))\n(+ 1 2)\n'
printf '%s' "$repl_in" | build/emit repl --manifest "$MAN" >"$TMP/repl.out" 2>"$TMP/repl.err"
if grep -Eq 'libraries are not defined at the prompt: \(r\)' "$TMP/repl.out" "$TMP/repl.err"; then
  echo "  [OK  ] repl-library-named"; pass=$((pass+1))
else
  echo "  [FAIL] repl-library-named"; sed 's/^/         /' "$TMP/repl.out" "$TMP/repl.err"; fail=$((fail+1))
fi
if [ "$(awk 'NF{v=$NF} END{print v}' "$TMP/repl.out")" = "3" ]; then
  echo "  [OK  ] repl-session-survives  (the next form still evaluates)"; pass=$((pass+1))
else
  echo "  [FAIL] repl-session-survives"; sed 's/^/         /' "$TMP/repl.out"; fail=$((fail+1))
fi

# --- dev->ship fidelity vs the AOT door (Chez-gated) -----------------------
if command -v chez >/dev/null 2>&1; then
  echo "dev->ship fidelity: run door matches the AOT door"
  # a minimal manifest so both doors build exactly the program's closure (base + mylib)
  min="$TMP/min-libs.scm"
  # absolute paths: the manifest lives in $TMP, and a manifest's relative paths resolve
  # against its own directory (change: manifest-search-path)
  printf '((library (emit internal) (source "%s/lib/emit/internal.sld"))\n (library (scheme base) (source "%s/lib/scheme/base.sld"))\n (library (mylib) (source "%s/%s/mylib.sld")))\n' \
    "$PWD" "$PWD" "$PWD" "$MOD" > "$min"

  # value parity
  chez --libdirs src --script src/compile.ss "$MOD/prog-mylib.scm" --manifest "$min" -o "$TMP/aot" >/dev/null 2>&1
  aot_val="$("$TMP/aot" 2>/dev/null)"
  run_val="$($RUN --manifest "$min" < "$MOD/prog-mylib.scm" 2>/dev/null)"
  if [ "$run_val" = "$aot_val" ] && [ "$run_val" = "142" ]; then
    echo "  [OK  ] value-parity  (run=$run_val aot=$aot_val)"; pass=$((pass+1))
  else
    echo "  [FAIL] value-parity  (run=$run_val aot=$aot_val)"; fail=$((fail+1))
  fi

  # program-module byte-identity (modulo the driver's target header, which the
  # embedded --emit omits by convention -- clang supplies the triple).
  $RUN --manifest "$min" --emit < "$MOD/prog-mylib.scm" > "$TMP/run.emit"
  awk -v d="$TMP" 'BEGIN{n=0;f=sprintf("%s/ru.%02d.ll",d,0)}
     /^; ==EMIT-UNIT-BOUNDARY==$/{n++;f=sprintf("%s/ru.%02d.ll",d,n);next}{print > f}' "$TMP/run.emit"
  run_prog="$(ls "$TMP"/ru.*.ll | tail -1)"
  grep -v '^target datalayout\|^target triple' "$TMP/aot.ll" > "$TMP/aot.noheader.ll"
  if cmp -s "$run_prog" "$TMP/aot.noheader.ll"; then
    echo "  [OK  ] program-module byte-identical to AOT (modulo target header)"; pass=$((pass+1))
  else
    echo "  [FAIL] program-module differs from AOT"; fail=$((fail+1))
  fi
else
  echo "chez not found -- skipping AOT-fidelity comparison."
fi

echo "-------------------------------------------"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
