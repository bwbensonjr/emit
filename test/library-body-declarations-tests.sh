#!/usr/bin/env bash
# library-body-declarations-tests.sh -- change: library-body-declarations (issue #16).
#
# `compile-library*` used to narrow a library body to `filter define-form?`, so every
# other body form was discarded.  This suite pins what the body surface now admits and
# the two rules that make it sound:
#
#   * a COMMAND is evaluated as part of the unit's initialization, in SOURCE ORDER
#     relative to the definitions around it -- it used to be dropped with no
#     diagnostic, which is the silent-wrong-answer half of the issue;
#   * `define-record-type` works in a library body: usable by a sibling procedure and
#     exportable.  It used to be impossible -- exported it hit "export of a name the
#     library does not define", internal it hit "unbound variable";
#   * the tree-shake keeps every command AND whatever it references (a command's
#     effects are invisible to reachability, so it cannot be shown dead), while a
#     record's bindings prune INDEPENDENTLY -- reaching one accessor keeps the
#     descriptor it needs, not the whole declaration;
#   * a library TOP-LEVEL `set!` now takes effect (it is a command), and the assigned
#     binding still has its direct-call row withheld -- the library-toplevel-set
#     interaction, whose failure mode is silent misdispatch;
#   * only a DEFINITION may take the stable, name-derived code label.  A top-level
#     `(set! f (lambda ...))` sits in the same IL position as an initializer, and
#     without the `definition?` distinction it claims `L:code:f` twice and clang
#     rejects the unit.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.
# Run from the repo root:  test/library-body-declarations-tests.sh
set -u
cd "$(dirname "$0")/.."

MOD=test/modules
MAN="$MOD/emit-libs-body.scm"          # (scheme base) + cmdlib/reclib/tlsetlib
RUN="build/emit run"
make emit >/dev/null 2>&1 || { echo "failed to build emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

want   () { if grep -Eq "$3" "$2"; then ok "$1"; else bad "$1 (missing: $3)"; fi; }
reject () { if grep -Eq "$3" "$2"; then bad "$1 (present but should not be: $3)"; else ok "$1"; fi; }

check () {  # <name> <program> <expected>
  local got; got="$($RUN --manifest "$MAN" < "$2" 2>"$TMP/e")"
  if [ "$got" = "$3" ]; then ok "$1 => $got"
  else bad "$1 => $got (expected $3)"; sed 's/^/         /' "$TMP/e"; fi
}

echo "library body declarations (issue #16)"

# --- 1. commands run, in source order ----------------------------------------
# 42 = 40 stored by the first command, +2 by a procedure defined BETWEEN the two
# commands and called by the second; 1 = the first command ran before the second.
# Before this change the body's commands were dropped and this was (0 0).
check "run door: a body's commands run, in source order" "$MOD/prog-cmdlib.scm" '(42 1)'

# --- 2. define-record-type works in a library body ---------------------------
# The last element comes from a procedure INSIDE the library that uses the accessors,
# which is the half that failed with "unbound variable pt-x".
check "run door: a library declares, uses and exports a record type" \
      "$MOD/prog-reclib.scm" '(7 8 #t 15)'

# --- 3. a library TOP-LEVEL set! takes effect (library-toplevel-set interaction) --
check "run door: a top-level set! in a library body takes effect" \
      "$MOD/prog-tlsetlib.scm" '(101 1001)'

# --- 4. the AOT door, where the tree-shake runs ------------------------------
BMAN="$TMP/build.scm"
cat > "$BMAN" <<EOF
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (cmdlib)   (source "test/modules/cmdlib.sld"))
 (library (reclib)   (source "test/modules/reclib.sld"))
 (library (tlsetlib) (source "test/modules/tlsetlib.sld"))
 (program cmd-app  (source "test/modules/prog-cmdlib.scm")   (output "$TMP/cmd-app"))
 (program rec-app  (source "test/modules/prog-reclib.scm")   (output "$TMP/rec-app"))
 (program tls-app  (source "test/modules/prog-tlsetlib.scm") (output "$TMP/tls-app")))
EOF
aot () {  # <name> <program-entry> <exe> <expected>
  if EMIT_VERBOSITY=quiet build/emit build "$2" --manifest "$BMAN" >"$TMP/b.log" 2>&1; then
    local got; got="$("$3" 2>/dev/null)"
    if [ "$got" = "$4" ]; then ok "$1 => $got"; else bad "$1 => $got (expected $4)"; fi
  else bad "$1 (build failed)"; sed 's/^/         /' "$TMP/b.log"; fi
}
aot "AOT door: commands survive build + link"      cmd-app "$TMP/cmd-app" '(42 1)'
aot "AOT door: record type survives build + link"  rec-app "$TMP/rec-app" '(7 8 #t 15)'
aot "AOT door: top-level set! survives build + link" tls-app "$TMP/tls-app" '(101 1001)'

# --- 5. the REPL door --------------------------------------------------------
out="$(printf '(import (cmdlib))\n(get)\n(import (reclib))\n(sum-fields (make-pt 7 8))\n(import (tlsetlib))\n(f 1)\n' \
        | build/emit repl --manifest "$MAN" 2>/dev/null | tr -d ' >' | grep -v '^$' | grep -v 'Emit')"
if [ "$out" = "$(printf '42\n15\n101')" ]; then
  ok "REPL door: all three libraries behave as on the other doors"
else
  bad "REPL door (got: $(printf '%s' "$out" | tr '\n' '/'))"
fi

# --- 6. emitted shape: one __init_N per body form, called in source order ----
build/emit lib "$MOD/cmdlib.sld" >/dev/null 2>&1
LL=build/lib/cmdlib.ll
n_def="$(grep -c 'define i64 @"cmdlib:__init_[0-9]*"' "$LL" || true)"
n_call="$(sed -n '/define i64 @"cmdlib:__init"/,/^}/p' "$LL" | grep -c 'call i64 @"cmdlib:__init_' || true)"
# cmdlib's body is 9 forms: 2 defines, 2 commands, a define, 2 commands, 2 defines.
if [ "$n_def" = "9" ] && [ "$n_call" = "9" ]; then
  ok "unit: one __init_N thunk per body form (9), all called from __init"
else
  bad "unit: $n_def thunks defined, $n_call called (expected 9 and 9)"
fi

# --- 7. only a DEFINITION takes the stable label -----------------------------
build/emit lib "$MOD/tlsetlib.sld" >/dev/null 2>&1
n="$(grep -c 'define fastcc i64 @"tlsetlib:code:f"' build/lib/tlsetlib.ll || true)"
if [ "$n" = "1" ]; then
  ok "unit: tlsetlib:code:f defined exactly once (the top-level set! took a counter label)"
else
  bad "unit: tlsetlib:code:f defined $n time(s) -- a command claimed the stable label"
fi

# --- 8. the assigned binding's call row is still withheld --------------------
EXP=build/lib/tlsetlib.exports
want   "table: the assigned binding is still exported" "$EXP" '\(f \. "tlsetlib:f"\)'
reject "table: no call row for f, assigned by a top-level command" "$EXP" '\(f "tlsetlib:code:f"'
want   "table: the unassigned sibling g keeps its call row" "$EXP" '\(g "tlsetlib:code:g" 1\)'

# --- 9. tree-shaking rules ---------------------------------------------------
# `bump` is referenced ONLY by a command and is not exported, so it survives only if a
# command's references become reachability roots.
$RUN --manifest "$MAN" --emit < "$MOD/prog-cmdlib.scm" >/dev/null 2>&1
if EMIT_VERBOSITY=quiet build/emit build cmd-app --manifest "$BMAN" >/dev/null 2>&1; then
  ok "shake: the command-root rule links (a procedure only a command calls survives)"
else
  bad "shake: link failed -- a binding a surviving command calls was pruned"
fi

# A record's bindings prune independently: this program reaches make-pt and pt-x only.
cat > "$TMP/narrow.scm" <<'EOF'
(import (reclib))
(pt-x (make-pt 1 2))
EOF
cat > "$TMP/nman.scm" <<EOF
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (reclib) (source "test/modules/reclib.sld"))
 (program narrow-app (source "$TMP/narrow.scm") (output "$TMP/narrow-app")))
EOF
if EMIT_VERBOSITY=quiet build/emit build narrow-app --manifest "$TMP/nman.scm" >"$TMP/n.log" 2>&1; then
  got="$("$TMP/narrow-app" 2>/dev/null)"
  [ "$got" = "1" ] && ok "shake: a narrowly-reached record type still works => $got" \
                   || bad "shake: narrow record program => $got (expected 1)"
else
  bad "shake: narrow record program failed to build"; sed 's/^/         /' "$TMP/n.log"
fi

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
