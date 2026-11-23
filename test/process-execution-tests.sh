#!/usr/bin/env bash
# process-execution-tests.sh -- real-host coverage for (emit process) (change: emit-pkg).
# One probe runs under emit run and as a standalone executable; both must print exactly
# the expected lines.  Then the export surface and the explicit-import rule.
set -u
cd "$(dirname "$0")/.."

make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

echo "process execution: arguments, status, signals, capture, errors, fidelity"

cat > "$TMP/expected" <<'EOF'
a b|$HOME|*|verbatim 0
beforeafterordering 0
exit-code 3
signal -15
captured (0 "one\ntwo\n")
captured-failure (4 "partial\n")
large-capture (0 100000)
missing-program (file-error #t)
bad-argument error
EOF

EMIT_VERBOSITY=quiet build/emit run test/process-execution-check.scm \
  > "$TMP/run.out" 2> "$TMP/run.err"
if cmp -s "$TMP/expected" "$TMP/run.out"; then
  ok "emit run: verbatim arguments, ordering, status, signal, capture, errors"
else
  bad "emit run process probe"
  diff "$TMP/expected" "$TMP/run.out" | sed 's/^/         /'
  sed 's/^/         /' "$TMP/run.err"
fi

cat > "$TMP/manifest.scm" <<EOF
((library (emit process) (source "$PWD/lib/emit/process.sld"))
 (library (scheme write) (source "$PWD/lib/scheme/write.sld"))
 (program processcheck
  (source "$PWD/test/process-execution-check.scm")
  (output "$TMP/processcheck")))
EOF
if EMIT_VERBOSITY=quiet build/emit build processcheck \
     --manifest "$TMP/manifest.scm" >"$TMP/build.out" 2>"$TMP/build.err"; then
  "$TMP/processcheck" > "$TMP/aot.out" 2> "$TMP/aot.err"
  if cmp -s "$TMP/run.out" "$TMP/aot.out" && cmp -s "$TMP/expected" "$TMP/aot.out"; then
    ok "standalone executable: output identical to emit run"
  else
    bad "standalone process probe differs"
    diff "$TMP/run.out" "$TMP/aot.out" | sed 's/^/         /'
  fi
else
  bad "building the process probe"
  sed 's/^/         /' "$TMP/build.err"
fi

# The child inherits the environment and the working directory.
mkdir -p "$TMP/cwd"
cat > "$TMP/inherit.scm" <<'EOF'
(import (scheme base) (scheme write) (emit process))
(call-with-values
  (lambda () (program-output "sh" '("-c" "printf '%s %s' \"$PROBE_VALUE\" \"$(basename \"$PWD\")\"")))
  (lambda (status text) (write (list status text))))
EOF
inherit_got="$(cd "$TMP/cwd" && PROBE_VALUE=inherited EMIT_VERBOSITY=quiet \
                 "$OLDPWD/build/emit" run --manifest "$OLDPWD/emit-libs.scm" "$TMP/inherit.scm" 2>"$TMP/inherit.err")"
[ "$inherit_got" = '(0 "inherited cwd")' ] \
  && ok "the child inherits the environment and working directory" \
  || { bad "inheritance probe => [$inherit_got]"; sed 's/^/         /' "$TMP/inherit.err"; }

cat > "$TMP/unimported.scm" <<'EOF'
(import (scheme base) (scheme process-context))
(run-program "true" '())
EOF
if EMIT_VERBOSITY=quiet build/emit run "$TMP/unimported.scm" \
     >"$TMP/unimported.out" 2>"$TMP/unimported.err"; then
  bad "run-program was visible without (emit process)"
elif grep -q 'unbound variable.*run-program' "$TMP/unimported.err"; then
  ok "process names remain unbound without an explicit import"
else
  bad "unimported run-program failed for the wrong reason"
  sed 's/^/         /' "$TMP/unimported.err"
fi

if EMIT_VERBOSITY=quiet build/emit lib lib/emit/process.sld -o "$TMP/exports" \
     >"$TMP/lib.out" 2>"$TMP/lib.err"; then
  export_file="$TMP/exports/emit.process.exports"
  export_count="$(grep -o '([a-z?-]* \. "emit.process:' "$export_file" | wc -l | tr -d ' ')"
  if [ "$export_count" -eq 2 ] \
     && grep -q '(run-program \. "emit.process:run-program")' "$export_file" \
     && grep -q '(program-output \. "emit.process:program-output")' "$export_file"; then
    ok "the library export interface contains exactly run-program and program-output"
  else
    bad "process export interface"
    sed 's/^/         /' "$export_file"
  fi
else
  bad "compiling the process library interface"
  sed 's/^/         /' "$TMP/lib.err"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
