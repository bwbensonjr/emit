#!/usr/bin/env bash
# emit-cli-tests.sh -- the CLI front door (change: emit-cli-front-door; issues #42, #43).
#
# Two properties, both about what a user meets in their first five minutes:
#
#   1. Asking a tool what it does SUCCEEDS.  `--help` / `-h` is accepted at the top
#      level and by every verb, prints usage, and exits 0 -- and because the text was
#      REQUESTED it goes to stdout, so `emit --help | head` works without redirection.
#      Usage printed as part of an error stays on stderr with a non-zero exit (design
#      D1).  Every door also REJECTS an unknown option; `emit repl` used to ignore one
#      silently and exit 0 (design D3).
#
#   2. A program's final value is suppressed when it is THE unspecified value -- no
#      written form, no newline -- so a program ending in output delivers exactly its
#      own bytes (design D4).  It is a reporting policy, not a property of the value:
#      an explicit (write (if #f #f)) still renders, and #f and () still print.  The
#      in-process door and a delivered executable carry the same guard, so their
#      stdout is byte-identical (design D5) -- asserted directly below.
#
# Chez-FREE: everything here drives the compiled `build/emit` binary.
# Run from the repo root:  test/emit-cli-tests.sh
set -u
cd "$(dirname "$0")/.."

EMIT=build/emit
make emit >/dev/null 2>&1 || { echo "failed to build $EMIT"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# ---------------------------------------------------------------------------
# 1. help is a request: stdout, exit 0, nothing on stderr.
# ---------------------------------------------------------------------------
echo "help is answered, on stdout, with a success exit"

# NAME  then the argv to pass.  Asserts exit 0, a "usage:" first line on stdout, and
# an EMPTY stderr -- the last is what distinguishes a request from a diagnostic.
help_ok () {
  local name="$1"; shift
  local out err rc
  out="$("$EMIT" "$@" 2>"$TMP/err" </dev/null)"; rc=$?
  err="$(cat "$TMP/err")"
  if   [ "$rc" -ne 0 ];              then bad "$name (exit $rc, want 0)"
  elif [ -n "$err" ];                then bad "$name (stderr not empty: [$err])"
  elif [ "${out#usage: emit}" = "$out" ]; then bad "$name (stdout not usage: [${out%%$'\n'*}])"
  else ok "$name"
  fi
}

help_ok "emit --help"        --help
help_ok "emit -h"            -h
help_ok "emit help"          help
help_ok "emit run --help"    run --help
help_ok "emit run -h"        run -h
help_ok "emit repl --help"   repl --help
help_ok "emit repl -h"       repl -h
help_ok "emit build --help"  build --help
help_ok "emit build -h"      build -h
help_ok "emit lib --help"    lib --help
help_ok "emit lib -h"        lib -h
help_ok "emit help run"      help run
help_ok "emit help repl"     help repl
help_ok "emit help build"    help build
help_ok "emit help lib"      help lib

# Each verb's help must be the VERB's own text, not the top-level summary (design D2).
for v in run repl build lib; do
  first="$("$EMIT" "$v" --help 2>/dev/null </dev/null | head -1)"
  [ "${first#usage: emit $v}" != "$first" ] \
    && ok "emit $v --help names the verb" \
    || bad "emit $v --help => [$first]"
done

# The two JIT doors document the exact profile set and its default.  Check both help
# spellings because `emit help VERB` is routed separately from `emit VERB --help`.
for v in run repl; do
  for spelling in direct routed; do
    if [ "$spelling" = direct ]; then
      profile_help="$("$EMIT" "$v" --help 2>/dev/null)"
    else
      profile_help="$("$EMIT" help "$v" 2>/dev/null)"
    fi
    if printf '%s' "$profile_help" | grep -q -- '-O0' \
       && printf '%s' "$profile_help" | grep -q -- '-O1.*default' \
       && printf '%s' "$profile_help" | grep -q -- '-O2' \
       && printf '%s' "$profile_help" | grep -q -- 'JIT profile'; then
      ok "emit $v $spelling help documents -O0/-O1/-O2 and the O1 default"
    else
      bad "emit $v $spelling help omits the JIT profile contract"
    fi
  done
done

# The point of D1: pipeable without redirection.  `head` closes the pipe, so this also
# checks we do not die on SIGPIPE before writing anything.
[ "$("$EMIT" --help 2>/dev/null | head -1)" = "usage: emit <verb> [args]" ] \
  && ok "emit --help | head works without redirection" \
  || bad "emit --help | head"

# ---------------------------------------------------------------------------
# 2. errors: stderr, non-zero, usage alongside the diagnostic.
# ---------------------------------------------------------------------------
echo
echo "usage after an error stays on stderr with a non-zero exit"

# NAME  WANT-EXIT  then argv.  Asserts the exit code, an EMPTY stdout, and a stderr
# whose first line is the diagnostic (not "usage:").
err_case () {
  local name="$1" want="$2"; shift 2
  local out err rc
  out="$("$EMIT" "$@" 2>"$TMP/err" </dev/null)"; rc=$?
  err="$(cat "$TMP/err")"
  if [ "$rc" -ne "$want" ];               then bad "$name (exit $rc, want $want)"
  elif [ -n "$out" ];                     then bad "$name (stdout not empty: [$out])"
  elif [ -z "$err" ];                     then bad "$name (nothing on stderr)"
  else ok "$name (exit $want, stderr)"
  fi
}

err_case "no verb"                1
err_case "unknown verb"           2 bogus
err_case "emit help <unknown>"    2 help bogus

# Every door rejects an unknown option -- `repl` included, which is the one that
# regressed silently: `emit repl --bogus-flag` used to start a session and exit 0.
for v in run repl build lib; do
  err_case "emit $v --bogus-flag rejected" 2 "$v" --bogus-flag
  "$EMIT" "$v" --bogus-flag 2>&1 >/dev/null </dev/null | grep -q "^emit $v: unknown option --bogus-flag" \
    && ok "emit $v names the door and the option" \
    || bad "emit $v diagnostic wording"
done

# JIT profile parsing is shared by run/repl and stops before either door compiles input.
# Unsupported, repeated, and conflicting levels name the door/options on stderr only.
for v in run repl; do
  err_case "emit $v rejects -O3" 2 "$v" -O3
  "$EMIT" "$v" -O3 </dev/null >"$TMP/o" 2>"$TMP/e"
  grep -q "^emit $v:.*-O3" "$TMP/e" \
    && ok "emit $v unsupported-level diagnostic names the door and -O3" \
    || bad "emit $v unsupported-level diagnostic wording"

  for pair in '-O0 -O0' '-O0 -O1' '-O1 -O2'; do
    # Intentional word splitting: PAIR is exactly two fixed test arguments.
    err_case "emit $v rejects profile pair $pair" 2 "$v" $pair
    "$EMIT" "$v" $pair </dev/null >"$TMP/o" 2>"$TMP/e"
    first="${pair% *}"; second="${pair#* }"
    if grep -q "^emit $v: conflicting JIT optimization options" "$TMP/e" \
       && grep -q -- "$first" "$TMP/e" && grep -q -- "$second" "$TMP/e"; then
      ok "emit $v conflict names $first and $second"
    else
      bad "emit $v conflict diagnostic for $pair"
    fi
  done
done

# These doors retain their existing backend policy: a JIT-only flag is unknown here.
for v in build lib; do
  for level in -O0 -O1 -O2; do
    err_case "emit $v rejects JIT profile $level" 2 "$v" "$level"
    "$EMIT" "$v" "$level" </dev/null >"$TMP/o" 2>"$TMP/e"
    grep -q "^emit $v: unknown option $level" "$TMP/e" \
      && ok "emit $v names unknown JIT profile $level" \
      || bad "emit $v diagnostic for $level"
  done
done

# A profile cannot be silently ignored by either non-executing run mode.  The parser
# rejects the combination before manifest resolution/source compilation and emits no data.
for mode in --emit --resolve-program; do
  for level in -O0 -O1 -O2; do
    err_case "emit run $mode conflicts with $level" 2 run "$mode" "$level"
    "$EMIT" run "$mode" "$level" </dev/null >"$TMP/o" 2>"$TMP/e"
    if grep -q '^emit run:' "$TMP/e" && grep -q -- "$mode" "$TMP/e" \
       && grep -q -- "$level" "$TMP/e"; then
      ok "emit run conflict names $mode and $level"
    else
      bad "emit run conflict diagnostic for $mode $level"
    fi
  done
done

# Every supported spelling reaches a working run and REPL session.  Quiet mode makes an
# unexpected narration byte independently visible rather than folding it into stdout.
printf '(%%display 42)\n' > "$TMP/profile.scm"
printf '(define x 41)\n(+ x 1)\n' > "$TMP/profile-repl.scm"
for level in -O0 -O1 -O2; do
  EMIT_VERBOSITY=quiet "$EMIT" run "$level" --no-prelude "$TMP/profile.scm" \
    >"$TMP/o" 2>"$TMP/e"; rc=$?
  [ "$rc" -eq 0 ] && [ "$(cat "$TMP/o")" = 42 ] && [ ! -s "$TMP/e" ] \
    && ok "emit run $level selects a working quiet profile" \
    || bad "emit run $level (exit $rc, stdout [$(cat "$TMP/o")], stderr [$(cat "$TMP/e")])"

  EMIT_VERBOSITY=quiet "$EMIT" repl "$level" --no-prelude <"$TMP/profile-repl.scm" \
    >"$TMP/o" 2>"$TMP/e"; rc=$?
  [ "$rc" -eq 0 ] && [ "$(cat "$TMP/o")" = 42 ] \
    && grep -q 'Emit (embedded compiler, ORC/LLJIT)' "$TMP/e" \
    && ok "emit repl $level selects a working profile" \
    || bad "emit repl $level (exit $rc, stdout [$(cat "$TMP/o")])"
done

# `emit lib` with no SRC: an arity error, so usage goes to stderr and the exit is 1.
err_case "emit lib (missing SRC)" 1 lib

# ---------------------------------------------------------------------------
# 3. the unspecified final value is suppressed, narrowly.
# ---------------------------------------------------------------------------
echo
echo "a program's unspecified final value is suppressed (emit run)"

# NAME  SOURCE  WANT-STDOUT
run_is () {
  local name="$1" src="$2" want="$3" got
  printf '%s' "$src" > "$TMP/$name.scm"
  got="$("$EMIT" run "$TMP/$name.scm" 2>/dev/null </dev/null)"
  [ "$got" = "$want" ] \
    && ok "$name => $(printf '%q' "$got")" \
    || bad "$name => $(printf '%q' "$got")  (want $(printf '%q' "$want"))"
}

run_is ends-in-output    '(display "hi")(newline)'  "$(printf 'hi')"
run_is ends-in-newline   '(newline)'                ''
run_is bare-unspec       '(if #f #f)'               ''

# Negative cases (design D4): suppression is narrow.  #f and () are legitimate final
# values -- they are exactly the two the unspecified value was carved out from -- and an
# explicit write goes through the printer, which has no guard in it.
run_is final-false       '#f'                       '#f'
run_is final-empty-list  "'()"                      '()'
run_is final-list        "'(1 2 3)"                 '(1 2 3)'
run_is explicit-write    '(write (if #f #f))'       '#<unspecified>'
run_is explicit-display  '(display (if #f #f))'     '#<unspecified>'

# ---------------------------------------------------------------------------
# 4. the two doors agree, byte for byte.
# ---------------------------------------------------------------------------
echo
echo "emit run and a delivered executable agree on stdout"

# A program ending in output: the case the trailing token used to corrupt.  Absolute
# paths in the manifest, since it lives in $TMP while $PWD is the repo root.
SRC="$TMP/agree.scm"
printf '(display "alpha")\n(newline)\n(display "beta")\n(newline)\n' > "$SRC"
MAN="$TMP/agree-manifest.scm"
cat > "$MAN" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld"))
 (library (scheme base) (source "$PWD/lib/scheme/base.sld"))
 (program agree (source "$SRC") (output "$TMP/agree")))
EOF

if ! "$EMIT" build agree --manifest "$MAN" >/dev/null 2>"$TMP/build.err" </dev/null; then
  bad "emit build agree"; sed 's/^/         /' "$TMP/build.err"
else
  a="$("$EMIT" run "$SRC" --manifest "$MAN" 2>/dev/null </dev/null)"
  b="$("$TMP/agree" 2>/dev/null </dev/null)"
  [ "$a" = "$b" ] && [ "$a" = "$(printf 'alpha\nbeta')" ] \
    && ok "byte-identical stdout, no trailing value ($(printf '%q' "$a"))" \
    || bad "doors disagree: run=$(printf '%q' "$a")  exe=$(printf '%q' "$b")"
fi

# The same agreement for a program whose final value DOES print -- so the check above
# is testing agreement, not just that both are empty.
SRC2="$TMP/agree-value.scm"
printf "(display \"x\")(newline)\n'(1 2 3)\n" > "$SRC2"
cat > "$TMP/agree2-manifest.scm" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld"))
 (library (scheme base) (source "$PWD/lib/scheme/base.sld"))
 (program agree2 (source "$SRC2") (output "$TMP/agree2")))
EOF
if ! "$EMIT" build agree2 --manifest "$TMP/agree2-manifest.scm" >/dev/null 2>"$TMP/build2.err" </dev/null; then
  bad "emit build agree2"; sed 's/^/         /' "$TMP/build2.err"
else
  a="$("$EMIT" run "$SRC2" --manifest "$TMP/agree2-manifest.scm" 2>/dev/null </dev/null)"
  b="$("$TMP/agree2" 2>/dev/null </dev/null)"
  [ "$a" = "$b" ] && [ "$a" = "$(printf 'x\n(1 2 3)')" ] \
    && ok "byte-identical stdout, final value printed ($(printf '%q' "$a"))" \
    || bad "doors disagree: run=$(printf '%q' "$a")  exe=$(printf '%q' "$b")"
fi

# ---------------------------------------------------------------------------
# 3. A TRUNCATED source does not run (change: reader-input-termination; issue #66).
# ---------------------------------------------------------------------------
# A partial write, an interrupted editor save, a bad sed, or a paste that drops the last
# line all produce exactly these files.  The reader used to close the open construct at
# end of input, so each one ran as though complete -- printing a value the author never
# wrote, and exiting 0.  What makes the report useful is that it names where the
# construct OPENED: the closing delimiter is missing, so end of input is not the mistake.
echo
echo "a truncated source is reported, not run"

# NAME | source text | the substring the diagnostic must contain
trunc_reports () {
  local name="$1" text="$2" want="$3"
  local f="$TMP/trunc.scm" out rc
  printf '%s' "$text" > "$f"
  out="$("$EMIT" run "$f" 2>&1 </dev/null)"; rc=$?
  if [ "$rc" -ne 0 ] && [ "$rc" -lt 128 ] && printf '%s' "$out" | grep -q "$want"; then
    ok "$name (exit $rc)"
  else
    bad "$name (exit $rc) => $(printf '%s' "$out" | tr '\n' '|')"
  fi
}

trunc_reports "an unterminated list is reported"       '(display (list 1 2 3)' 'unterminated list'
trunc_reports "an unterminated string is reported"     '(display "abc'         'unterminated string'
trunc_reports "an unterminated vector is reported"     "(display '#(1 2"       'unterminated vector'
trunc_reports "an unterminated bytevector is reported" "(display '#u8(1 2"     'unterminated bytevector'
trunc_reports "a dangling escape is reported"          '(display "abc\'        'unterminated string'
# The forms BEFORE the truncation are not run instead: this file's first form would
# print 1, and it must not, because the file as a whole is not a program.
trunc_reports "a truncated later form does not run the earlier ones" \
  "$(printf '(display 1)\n(display (list 2')" 'unterminated list'

# ...and the well-formed counterparts of the same shapes still run, so the guard above is
# not simply rejecting everything.
WELL="$TMP/well.scm"
printf "(display (list 1 2 3))(newline)(display \"abc\")(newline)(display '#(1 2))\n" > "$WELL"
got="$("$EMIT" run "$WELL" 2>/dev/null </dev/null)"; rc=$?
[ "$rc" -eq 0 ] && [ "$got" = "$(printf '(1 2 3)\nabc\n#(1 2)')" ] \
  && ok "the well-formed counterparts still run" \
  || bad "well-formed source (exit $rc) => $(printf '%s' "$got" | tr '\n' '|')"

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
