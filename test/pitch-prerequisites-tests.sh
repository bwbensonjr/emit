#!/usr/bin/env bash
# Focused regression suite for the standard features needed by the Pitch port.
set -u
cd "$(dirname "$0")/.."

make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

echo "Pitch-facing R7RS prerequisites"

got="$(EMIT_VERBOSITY=quiet EMIT_PITCH_TEST=present build/emit run \
        test/pitch-prerequisites-check.scm -- --check '' -x 2>"$TMP/run.err")"
[ "$got" = "pitch prerequisites: ok" ] \
  && ok "combined fixture passes through emit run" \
  || { bad "combined fixture through emit run => [$got]"; sed 's/^/         /' "$TMP/run.err"; }

# An imported macro may construct an exported procedure without making its importer
# import the macro library.  This pins the compile-time interface independently of the
# direct fixture above.
cat > "$TMP/dispatch.sld" <<'EOF'
(define-library (pitch prerequisite dispatch)
  (import (scheme base) (scheme case-lambda) (scheme char)
          (scheme process-context) (scheme write))
  (export choose folded render library-command-line
          library-environment library-environments library-exit library-emergency-exit)
  (begin
    (define choose (case-lambda (() 'zero) ((x) x) (xs xs)))
    (define (folded s) (string-foldcase s))
    (define (render x)
      (let ((p (open-output-string))) (write-shared x p) (get-output-string p)))
    (define (library-command-line) (command-line))
    (define (library-environment n) (get-environment-variable n))
    (define (library-environments) (get-environment-variables))
    (define (library-exit status) (exit status))
    (define (library-emergency-exit status) (emergency-exit status))))
EOF
cat > "$TMP/use-dispatch.scm" <<'EOF'
(import (scheme base) (pitch prerequisite dispatch))
(list (choose 1 2 3) (folded "Straße") (render (list 1 2))
      (cdr (library-command-line))
      (library-environment "EMIT_PITCH_TEST")
      (pair? (library-environments)))
EOF
cat > "$TMP/user-manifest.scm" <<EOF
((library (scheme case-lambda) (source "$PWD/lib/scheme/case-lambda.sld"))
 (library (scheme char) (source "$PWD/lib/scheme/char.sld"))
 (library (scheme process-context) (source "$PWD/lib/scheme/process-context.sld"))
 (library (scheme write) (source "$PWD/lib/scheme/write.sld"))
 (library (pitch prerequisite dispatch) (source "$TMP/dispatch.sld")))
EOF
ugot="$(EMIT_VERBOSITY=quiet EMIT_PITCH_TEST=present build/emit run "$TMP/use-dispatch.scm" \
          --manifest "$TMP/user-manifest.scm" 2>"$TMP/user.err")"
[ "$ugot" = '((1 2 3) "strasse" "(1 2)" () "present" #t)' ] \
  && ok "a user library re-exports the prerequisite behavior" \
  || { bad "user-library prerequisites => [$ugot]"; sed 's/^/         /' "$TMP/user.err"; }

rgot="$(printf '%s\n' '(import (scheme base) (scheme char) (scheme write))' \
          '(list (string-foldcase "Straße") (let ((p (open-output-string))) (write-shared (list 1 2) p) (get-output-string p)))' \
          | EMIT_VERBOSITY=quiet build/emit repl 2>"$TMP/repl.err" \
          | awk 'NF{last=$0} END{print last}')"
[ "$rgot" = '("strasse" "(1 2)")' ] && ok "character and writer libraries work in the REPL" \
  || { bad "REPL prerequisite libraries => [$rgot]"; sed 's/^/         /' "$TMP/repl.err"; }

# Build and run the combined fixture as the shipping path.  The project manifest
# supplies only its program; the repository manifest supplies ordinary libraries.
cat > "$TMP/build-manifest.scm" <<EOF
((library (scheme case-lambda) (source "$PWD/lib/scheme/case-lambda.sld"))
 (library (scheme char) (source "$PWD/lib/scheme/char.sld"))
 (library (scheme process-context) (source "$PWD/lib/scheme/process-context.sld"))
 (library (scheme write) (source "$PWD/lib/scheme/write.sld"))
 (program pitchcheck (source "$PWD/test/pitch-prerequisites-check.scm")
                     (output "$TMP/pitchcheck")))
EOF
if EMIT_VERBOSITY=quiet build/emit build pitchcheck --manifest "$TMP/build-manifest.scm" \
     >"$TMP/build.out" 2>"$TMP/build.err"; then
  bgot="$(EMIT_PITCH_TEST=present "$TMP/pitchcheck" --check '' -x 2>"$TMP/aot.err")"
  [ "$bgot" = "pitch prerequisites: ok" ] \
    && ok "combined fixture passes through a standalone executable" \
    || { bad "combined fixture AOT => [$bgot]"; sed 's/^/         /' "$TMP/aot.err"; }
else
  bad "building the combined fixture"; sed 's/^/         /' "$TMP/build.err"
fi

# stdin is the logical command name '-', while tokens after -- are untouched.
printf '%s\n' '(import (scheme process-context)) (command-line)' > "$TMP/argv.scm"
agot="$(EMIT_VERBOSITY=quiet build/emit run - -- --check '' \
          < "$TMP/argv.scm" 2>"$TMP/argv.err")"
[ "$agot" = '("-" "--check" "")' ] && ok "run forwards option-like and empty arguments" \
  || { bad "stdin command line => [$agot]"; sed 's/^/         /' "$TMP/argv.err"; }

if build/emit run --bogus test/pitch-prerequisites.scm >"$TMP/o" 2>"$TMP/e"; then
  bad "unknown pre-separator option was accepted"
elif grep -q -- '--bogus' "$TMP/e"; then ok "unknown pre-separator option is rejected"
else bad "unknown-option error did not name the option"; fi

if build/emit run test/pitch-prerequisites.scm test/pitch-prerequisites-check.scm \
     >"$TMP/o" 2>"$TMP/e"; then
  bad "multiple source files were accepted"
elif grep -q 'multiple source files' "$TMP/e"; then ok "multiple source files are rejected"
else bad "multiple-source error was unclear"; fi

if build/emit run --emit test/pitch-prerequisites.scm -- value >"$TMP/o" 2>"$TMP/e"; then
  bad "program arguments were accepted with --emit"
elif [ ! -s "$TMP/o" ] && grep -q 'require execution' "$TMP/e"; then
  ok "non-executing modes reject program arguments without emitting IR"
else bad "--emit/program-argument conflict output was wrong"; fi

if build/emit run --help >"$TMP/help" 2>"$TMP/help.err" \
   && grep -q '\[-- ARG \.\.\.\]' "$TMP/help" && [ ! -s "$TMP/help.err" ]; then
  ok "run help documents the separator grammar on stdout"
else bad "run help stream or grammar"; fi

# Child processes pin status mapping and the cleanup distinction.
cat > "$TMP/normal-exit.scm" <<'EOF'
(import (scheme base) (scheme process-context))
(dynamic-wind (lambda () #t)
  (lambda ()
    (dynamic-wind (lambda () #t) (lambda () (exit 7))
                  (lambda () (display "inner "))))
  (lambda () (display "outer")))
EOF
normal="$(EMIT_VERBOSITY=quiet build/emit run "$TMP/normal-exit.scm" 2>"$TMP/normal.err")"
normal_status=$?
[ "$normal_status" -eq 7 ] && [ "$normal" = "inner outer" ] \
  && ok "normal exit unwinds winds and communicates status 7" \
  || bad "normal exit => status $normal_status, output [$normal]"

cat > "$TMP/emergency-exit.scm" <<'EOF'
(import (scheme base) (scheme process-context))
(dynamic-wind (lambda () #t) (lambda () (emergency-exit 8))
              (lambda () (display "after")))
EOF
emergency="$(EMIT_VERBOSITY=quiet build/emit run "$TMP/emergency-exit.scm" 2>/dev/null)"
emergency_status=$?
[ "$emergency_status" -eq 8 ] && [ -z "$emergency" ] \
  && ok "emergency-exit bypasses cleanup and communicates status 8" \
  || bad "emergency exit => status $emergency_status, output [$emergency]"

for case in '|0' '#t|0' '#f|1' '2|2'; do
  arg="${case%%|*}"; want="${case##*|}"
  if [ -z "$arg" ]; then
    printf '%s\n' '(import (scheme process-context)) (exit)' > "$TMP/status.scm"
  else
    printf '(import (scheme process-context)) (exit %s)\n' "$arg" > "$TMP/status.scm"
  fi
  EMIT_VERBOSITY=quiet build/emit run "$TMP/status.scm" >/dev/null 2>/dev/null
  status=$?
  [ "$status" -eq "$want" ] && ok "exit ${arg:-<omitted>} maps to status $want" \
    || bad "exit ${arg:-<omitted>} => status $status (expected $want)"
done

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
