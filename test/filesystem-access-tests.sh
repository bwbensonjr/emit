#!/usr/bin/env bash
# filesystem-access-tests.sh -- real-host coverage for (emit filesystem).
set -u
cd "$(dirname "$0")/.."

make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

setup_tree () {
  local root="$1"
  mkdir -p "$root/empty" "$root/real"
  printf 'ordinary\n' > "$root/ordinary.scm"
  printf 'replacement\n' > "$root/replacement.tmp"
  printf 'original\n' > "$root/target.scm"
  ln -s real "$root/linked"
  ln -s missing "$root/dangling"
}

echo "filesystem access: listing, links, errors, atomic replacement"

RUN_TREE="$TMP/run-tree"
setup_tree "$RUN_TREE"
run_got="$(EMIT_VERBOSITY=quiet build/emit run test/filesystem-access-check.scm \
             -- "$RUN_TREE" 2>"$TMP/run.err")"
if [ "$run_got" = "filesystem access: ok" ] \
   && [ ! -e "$RUN_TREE/replacement.tmp" ] \
   && [ "$(sed -n '1p' "$RUN_TREE/target.scm")" = replacement ]; then
  ok "emit run: listing, classification, errors, and replacement"
else
  bad "emit run filesystem probe => [$run_got]"
  sed 's/^/         /' "$TMP/run.err"
fi

# Permission behavior is host/user dependent.  Exercise the three-state error arm
# only when removing search permission actually makes the child unstatable (root
# commonly bypasses this and therefore has no portable inaccessible-path fixture).
mkdir -p "$TMP/blocked"
printf 'blocked\n' > "$TMP/blocked/child"
chmod 000 "$TMP/blocked"
if [ ! -e "$TMP/blocked/child" ]; then
  blocked_got="$(EMIT_VERBOSITY=quiet build/emit run \
                   test/filesystem-classification-error-check.scm \
                   -- "$TMP/blocked/child" 2>"$TMP/blocked.err")"
  [ "$blocked_got" = '#t' ] \
    && ok "an inaccessible classification raises a catchable file error" \
    || { bad "inaccessible classification => [$blocked_got]"; sed 's/^/         /' "$TMP/blocked.err"; }
else
  echo "  [SKIP] host user can stat a mode-000 child; no portable EACCES fixture"
fi
chmod 700 "$TMP/blocked"

# A project manifest supplies only the program; the repository manifest supplies
# the ordinary filesystem library through the normal manifest chain.
AOT_TREE="$TMP/aot-tree"
setup_tree "$AOT_TREE"
cat > "$TMP/manifest.scm" <<EOF
((library (scheme file) (source "$PWD/lib/scheme/file.sld"))
 (library (scheme process-context) (source "$PWD/lib/scheme/process-context.sld"))
 (library (emit filesystem) (source "$PWD/lib/emit/filesystem.sld"))
 (program filesystemcheck
  (source "$PWD/test/filesystem-access-check.scm")
  (output "$TMP/filesystemcheck")))
EOF
if EMIT_VERBOSITY=quiet build/emit build filesystemcheck \
     --manifest "$TMP/manifest.scm" >"$TMP/build.out" 2>"$TMP/build.err"; then
  aot_got="$("$TMP/filesystemcheck" "$AOT_TREE" 2>"$TMP/aot.err")"
  if [ "$aot_got" = "$run_got" ] \
     && [ ! -e "$AOT_TREE/replacement.tmp" ] \
     && [ "$(sed -n '1p' "$AOT_TREE/target.scm")" = replacement ]; then
    ok "AOT: results and filesystem effects match emit run"
  else
    bad "AOT filesystem probe => [$aot_got] (run: [$run_got])"
    sed 's/^/         /' "$TMP/aot.err"
  fi
else
  bad "building the filesystem AOT probe"
  sed 's/^/         /' "$TMP/build.err"
fi

# The extension remains explicit: auto-imported base and standard (scheme file)
# must not make a non-standard name visible.
cat > "$TMP/unimported.scm" <<'EOF'
(import (scheme base) (scheme file))
(directory-list ".")
EOF
if EMIT_VERBOSITY=quiet build/emit run "$TMP/unimported.scm" \
     >"$TMP/unimported.out" 2>"$TMP/unimported.err"; then
  bad "directory-list was visible without (emit filesystem)"
elif grep -q 'unbound variable.*directory-list' "$TMP/unimported.err"; then
  ok "filesystem names remain unbound without an explicit import"
else
  bad "unimported directory-list failed for the wrong reason"
  sed 's/^/         /' "$TMP/unimported.err"
fi

# A user library imports the extension and re-exports behavior; its importer does
# not need to import (emit filesystem) itself.
cat > "$TMP/fs-user.sld" <<'EOF'
(define-library (filesystem user)
  (import (scheme base) (emit filesystem))
  (export empty-directory?)
  (begin
    (define (empty-directory? path) (null? (directory-list path)))))
EOF
cat > "$TMP/use-fs-user.scm" <<EOF
(import (scheme base) (filesystem user))
(empty-directory? "$RUN_TREE/empty")
EOF
cat > "$TMP/user-manifest.scm" <<EOF
((library (emit filesystem) (source "$PWD/lib/emit/filesystem.sld"))
 (library (filesystem user) (source "$TMP/fs-user.sld")))
EOF
user_got="$(EMIT_VERBOSITY=quiet build/emit run "$TMP/use-fs-user.scm" \
              --manifest "$TMP/user-manifest.scm" 2>"$TMP/user.err")"
[ "$user_got" = '#t' ] \
  && ok "a user library imports and re-exports filesystem behavior" \
  || { bad "user-library filesystem probe => [$user_got]"; sed 's/^/         /' "$TMP/user.err"; }

repl_got="$(printf '%s\n' \
              '(import (scheme base) (emit filesystem))' \
              "(list (null? (directory-list \"$RUN_TREE/empty\")) (file-directory? \"$RUN_TREE/linked\") (file-symbolic-link? \"$RUN_TREE/linked\"))" \
            | EMIT_VERBOSITY=quiet build/emit repl 2>"$TMP/repl.err" \
            | awk 'NF{last=$0} END{print last}')"
[ "$repl_got" = '(#t #t #t)' ] \
  && ok "the filesystem library works in the REPL" \
  || { bad "REPL filesystem probe => [$repl_got]"; sed 's/^/         /' "$TMP/repl.err"; }

# Compile the unit directly so its interface, not just successful calls through
# it, proves the public surface has exactly four names.
if EMIT_VERBOSITY=quiet build/emit lib lib/emit/filesystem.sld -o "$TMP/exports" \
     >"$TMP/lib.out" 2>"$TMP/lib.err"; then
  export_file="$TMP/exports/emit.filesystem.exports"
  export_count="$(grep -o '([a-z?-]* \. "emit.filesystem:' "$export_file" | wc -l | tr -d ' ')"
  if [ "$export_count" -eq 4 ] \
     && grep -q '(directory-list \. "emit.filesystem:directory-list")' "$export_file" \
     && grep -q '(file-directory? \. "emit.filesystem:file-directory?")' "$export_file" \
     && grep -q '(file-symbolic-link? \. "emit.filesystem:file-symbolic-link?")' "$export_file" \
     && grep -q '(replace-file \. "emit.filesystem:replace-file")' "$export_file"; then
    ok "the library export interface contains exactly the four public procedures"
  else
    bad "filesystem export interface"
    sed 's/^/         /' "$export_file"
  fi
else
  bad "compiling the filesystem library interface"
  sed 's/^/         /' "$TMP/lib.err"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
