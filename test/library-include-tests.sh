#!/usr/bin/env bash
# library-include-tests.sh -- the four splicing R7RS library declarations
# (change: library-include-declarations, issue #18).
#
# `include`, `include-ci`, `include-library-declarations`, and `cond-expand` were the
# declarations `parse-define-library` did not implement.  Since module-frontend-diagnostics
# each was rejected by name; now each is EXPANDED, before the parse loop runs, so that what
# it contributes is indistinguishable from having been written in place.
#
# What this suite pins, and why each case is here rather than assumed:
#
#   * a library assembled from included files compiles and runs on EVERY door -- the
#     compiler core performs no I/O, so each door installs its own reader and the doors
#     are the thing most likely to disagree;
#   * the project lives OUTSIDE the repo, because an include that resolves against the
#     working directory instead of the including file works from the repo root and
#     nowhere else -- the failure `manifest-search-path` and `baked-set-on-every-door`
#     each had to fix once;
#   * a NESTED include resolves beside its own file, not beside the .sld;
#   * an `import` arriving through an included declarations file reaches the run door's
#     dependency walk (design D11) -- when it does not, the door blames the manifest for
#     a dependency the source named;
#   * `include-ci` folds case, `cond-expand` selects by feature, and both are refused
#     precisely where they cannot be answered honestly (a `(library ...)` requirement);
#   * an included file exercises the reader corners (brackets, block comments,
#     quasiquote, characters) that Chez's `read` and Emit's reader could disagree about,
#     since with `include` the two hosts read the SAME file with different readers.
#
# Chez-FREE except the last section, which is skipped when `chez` is absent.
# Run from the repo root:  test/library-include-tests.sh
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

# --- a project whose library is assembled from other files ----------------------
PROJ="$TMP/proj"
mkdir -p "$PROJ/lib/sub"

cat > "$PROJ/lib/geom.sld" <<'EOF'
(define-library (geom)
  (include-library-declarations "geom-decls.scm")  ; export + import + a nested splice
  (include "geom-body.scm" "geom-corners.scm")     ; two files, spliced in order
  (include-ci "GEOM-OLD.scm")                      ; case-folded source
  (cond-expand
    (nosuchfeature (begin (define (impl) 'wrong)))
    ((and r7rs emit) (begin (define (impl) 'emit)))
    (else (begin (define (impl) 'other))))
  (begin
    (define (describe w h) (list (area w h) (perim w h) (impl) (legacy) (corners)))))
EOF

cat > "$PROJ/lib/geom-decls.scm" <<'EOF'
(export describe area perim impl legacy corners)
(import (scheme base))
(include-library-declarations "sub/geom-more.scm")
EOF

# Reached from lib/geom-decls.scm, so its own relative filename is lib/sub/... --
# beside THIS file, not beside the .sld (design D5).
cat > "$PROJ/lib/sub/geom-more.scm" <<'EOF'
(include "geom-deep.scm")
EOF

cat > "$PROJ/lib/sub/geom-deep.scm" <<'EOF'
(define (perim w h) (* 2 (+ w h)))
EOF

cat > "$PROJ/lib/geom-body.scm" <<'EOF'
(define (area w h) (* w h))
EOF

# Reader corners, read by Chez under the driver and by Emit's own reader in the binary.
# This fixture is what FOUND issue #59: an included file is read by two different readers,
# so any grammar Emit lacked was a source file that compiled one way and failed the other.
# The block comment and the datum comment were removed with a pointer to the issue and are
# back now that reader-lexical-conformance has landed -- they are the sharpest cross-host
# cases this file can carry.
cat > "$PROJ/lib/geom-corners.scm" <<'EOF'
#| a block comment, which #| nests |# and spans
   more than one line |#
(define (corners)
  (let ([n 2])                       ; brackets, and a line comment
    `(q ,(+ n 1) #;(discarded) #\z)))  ; quasiquote, a datum comment, a character
EOF

cat > "$PROJ/lib/GEOM-OLD.scm" <<'EOF'
(DEFINE (LEGACY) (QUOTE OLD))
EOF

cat > "$PROJ/main.scm" <<'EOF'
(import (geom))
(display (describe 3 4))
(newline)
EOF

cat > "$PROJ/emit-libs.scm" <<'EOF'
((library (geom) (source "lib/geom.sld"))
 (program geom-app (source "main.scm") (output "build/geom-app")))
EOF

VALUE='(12 14 emit old (q 3 z))'

echo "a library assembled from included files, on every door"

# 1. emit run: the library resolves through the project manifest and every splice lands.
got="$(cd "$PROJ" && "$EMITABS" run main.scm 2>"$TMP/run.err")"
[ "$got" = "$VALUE" ] && ok "emit run => $got" \
  || { bad "emit run => [$got] want [$VALUE]"; sed 's/^/         /' "$TMP/run.err"; }

# 2. emit run from a DIFFERENT working directory: the includes resolve beside the .sld,
#    which is the whole point of the resolution rule.
got="$(cd "$TMP" && "$EMITABS" run --manifest "$PROJ/emit-libs.scm" "$PROJ/main.scm" 2>/dev/null)"
[ "$got" = "$VALUE" ] && ok "emit run from another directory => $got" \
  || bad "emit run elsewhere => [$got] want [$VALUE]"

# 3. emit build delivers a standalone executable with the same value.
if (cd "$PROJ" && EMIT_VERBOSITY=quiet "$EMITABS" build geom-app) >"$TMP/b.log" 2>&1; then
  got="$("$PROJ/build/geom-app" 2>/dev/null)"
  [ "$got" = "$VALUE" ] && ok "emit build + run => $got" || bad "delivered exe => [$got]"
else bad "emit build failed"; sed 's/^/         /' "$TMP/b.log"; fi

# 4. emit lib writes both artifacts for a library it had to assemble first.
if (cd "$PROJ" && EMIT_VERBOSITY=quiet "$EMITABS" lib lib/geom.sld -o build/lib) \
     >"$TMP/l.log" 2>&1; then
  if [ -s "$PROJ/build/lib/geom.ll" ] && [ -s "$PROJ/build/lib/geom.exports" ]; then
    ok "emit lib wrote .ll + .exports"
  else bad "emit lib artifacts missing"; fi
else bad "emit lib failed"; sed 's/^/         /' "$TMP/l.log"; fi

# 5. The export table carries names that arrived through an INCLUDED declarations file.
if grep -q 'perim' "$PROJ/build/lib/geom.exports" 2>/dev/null \
   && grep -q 'legacy' "$PROJ/build/lib/geom.exports" 2>/dev/null; then
  ok ".exports lists an included export and a case-folded one"
else bad ".exports content"; sed 's/^/         /' "$PROJ/build/lib/geom.exports" 2>/dev/null; fi

# 6. One compile-unit core: emit lib's unit == the unit the run door emits for the source.
#    PIPED, so the source has no path and its includes resolve against the working
#    directory -- the documented fallback, and the reason this runs from lib/ rather than
#    from the project root.  The two units must still be byte-identical: where a file was
#    found does not enter the IR.
(cd "$PROJ/lib" && "$EMITABS" run --emit < geom.sld) >"$TMP/via-run.ll" 2>/dev/null
cmp -s "$TMP/via-run.ll" "$PROJ/build/lib/geom.ll" \
  && ok "a piped library resolves includes against the CWD, same unit" \
  || bad "piped unit differs from emit lib's"

# 7. The REPL's library loader takes the same source.  A session WRITES its values, so the
#    character prints as #\z where the program's `display` printed z -- same value.
WVALUE='(12 14 emit old (q 3 #\z))'
printf '(import (geom))\n(describe 3 4)\n' > "$TMP/r.in"
out="$(cd "$PROJ" && "$EMITABS" repl < "$TMP/r.in" 2>"$TMP/r.err")"
echo "$out" | grep -qF "$WVALUE" && ok "emit repl imports the assembled library" \
  || { bad "repl => [$out]"; sed 's/^/         /' "$TMP/r.err"; }

echo
echo "an import behind an inclusion reaches the dependency walk (design D11)"

# 8. The library's ONLY import arrives through an included declarations file, and the
#    dependency is a manifest library rather than a baked one -- so the run door's lazy
#    closure walk has to see it, or the compile fails with a missing (scheme inexact).
P2="$TMP/proj2"; mkdir -p "$P2/lib"
cat > "$P2/lib/rms.sld" <<'EOF'
(define-library (rms)
  (include-library-declarations "rms-decls.scm")
  (begin
    (define (rms2 a b) (sqrt (/ (+ (* a a) (* b b)) 2)))))
EOF
cat > "$P2/lib/rms-decls.scm" <<'EOF'
(export rms2)
(import (scheme base) (scheme inexact))
EOF
cat > "$P2/main.scm" <<'EOF'
(import (rms))
(display (rms2 3.0 4.0))
(newline)
EOF
cat > "$P2/emit-libs.scm" <<EOF
((library (scheme inexact) (source "$REPO/lib/scheme/inexact.sld"))
 (library (rms) (source "lib/rms.sld")))
EOF
got="$(cd "$P2" && "$EMITABS" run main.scm 2>"$TMP/rms.err")"
[ "$got" = "3.5355339059327378" ] && ok "an included import is preloaded => $got" \
  || { bad "included import => [$got]"; sed 's/^/         /' "$TMP/rms.err"; }

echo
echo "what the front end still refuses, by name"

reject_lib () {  # <name> <sld-path> <regex>
  local name="$1" src="$2" re="$3"
  if (cd "$PROJ" && "$EMITABS" lib "$src") >"$TMP/$name.out" 2>"$TMP/$name.err"; then
    bad "$name (expected emit lib to fail, but it succeeded)"; return
  fi
  if grep -Eq "$re" "$TMP/$name.err"; then ok "$name"
  else bad "$name (diagnostic does not match /$re/)"; sed 's/^/         /' "$TMP/$name.err"; fi
}

# 9. A file that cannot be read names the declaration, the filename as written, and the
#    path it resolved to -- not an empty body or an unbound variable.
cat > "$PROJ/lib/missing.sld" <<'EOF'
(define-library (missing) (export g) (include "nope.scm"))
EOF
reject_lib "missing-include" "lib/missing.sld" \
  'include: cannot read "nope.scm" \(resolved to .*lib/nope.scm\)'

# 10. A cycle is named rather than followed.
cat > "$PROJ/lib/cyc.sld" <<'EOF'
(define-library (cyc) (include-library-declarations "cyc-a.scm"))
EOF
echo '(include-library-declarations "cyc-b.scm")' > "$PROJ/lib/cyc-a.scm"
echo '(include-library-declarations "cyc-a.scm")' > "$PROJ/lib/cyc-b.scm"
reject_lib "include-cycle" "lib/cyc.sld" 'include cycle'

# 11. A (library ...) feature requirement is the one recognized R7RS form left that this
#     stage refuses -- answering it is library availability, which the parser cannot
#     resolve, and a wrong answer would silently select the other clause.
cat > "$PROJ/lib/featlib.sld" <<'EOF'
(define-library (featlib)
  (export g)
  (cond-expand ((library (scheme base)) (begin (define (g) 1)))
               (else (begin (define (g) 2)))))
EOF
reject_lib "cond-expand-library-requirement" "lib/featlib.sld" \
  'is an R7RS feature requirement this stage does not support'

# 12. A malformed clause names the clause.
cat > "$PROJ/lib/badclause.sld" <<'EOF'
(define-library (badclause) (export g) (cond-expand "nope"))
EOF
reject_lib "cond-expand-bad-clause" "lib/badclause.sld" 'not a clause'

# 13. An import set arriving through an included file gets the ORDINARY import-set
#     diagnostic: the splice runs before the parse loop, so one validator sees both.
cat > "$PROJ/lib/isl.sld" <<'EOF'
(define-library (isl) (export g) (include-library-declarations "isl-decls.scm")
  (begin (define (g) 1)))
EOF
cat > "$PROJ/lib/isl-decls.scm" <<'EOF'
(import (only (scheme base) car))
EOF
reject_lib "included-import-set" "lib/isl.sld" \
  'import sets are not supported: \(only \(scheme base\) car\)'

# 14. A filename that is not a string.
cat > "$PROJ/lib/badname.sld" <<'EOF'
(define-library (badname) (export g) (include foo))
EOF
reject_lib "include-non-string" "lib/badname.sld" 'a filename must be a string'

echo
echo "the Chez driver agrees, and its artifact cache sees the included files"

if ! command -v chez >/dev/null 2>&1; then
  echo "  [SKIP] chez not on PATH (the driver half of this suite)"
else
  # The driver has no baked set -- it resolves (scheme base) and the substrate through the
  # manifest -- so its manifest is the project's plus those two entries.  That difference
  # is pre-existing (docs/MODULES.md) and has nothing to do with includes.
  cat > "$TMP/chez-libs.scm" <<EOF
((library (emit internal) (source "$REPO/lib/emit/internal.sld"))
 (library (scheme base)   (source "$REPO/lib/scheme/base.sld"))
 (library (geom)          (source "$PROJ/lib/geom.sld")))
EOF
  # 15. The two HOSTS read the same included files with different readers (Chez's `read`
  #     and Emit's own).  Comparing the units they emit is what makes that measurable --
  #     the driver prepends the host target header, so strip it from both sides.
  (cd "$REPO" && chez --libdirs src --script src/compile.ss "$PROJ/main.scm" \
       --manifest "$TMP/chez-libs.scm" -o "$TMP/chez-app" -q) >"$TMP/chez.log" 2>&1
  if [ -s build/lib/geom.ll ]; then
    grep -v '^target ' build/lib/geom.ll > "$TMP/chez-geom.ll"
    grep -v '^target ' "$PROJ/build/lib/geom.ll" > "$TMP/emit-geom.ll"
    cmp -s "$TMP/chez-geom.ll" "$TMP/emit-geom.ll" \
      && ok "driver and binary emit the same unit for an assembled library" \
      || bad "driver/binary unit differs (the two readers disagree?)"
  else bad "the driver did not build the unit"; sed 's/^/         /' "$TMP/chez.log"; fi

  # 16. The delivered executable runs to the same value.
  got="$("$TMP/chez-app" 2>/dev/null)"
  [ "$got" = "$VALUE" ] && ok "driver-built executable => $got" || bad "driver exe => [$got]"

  # 17. The artifact cache: reuse when nothing changed, rebuild when an INCLUDED file
  #     changed.  Without the include list in the .stamp this reports `reuse [fresh]`
  #     and ships a stale unit (design D10).
  (cd "$REPO" && chez --libdirs src --script src/compile.ss "$PROJ/main.scm" \
       --manifest "$TMP/chez-libs.scm" -o "$TMP/chez-app") >"$TMP/reuse.log" 2>&1
  grep -q 'reuse (geom)' "$TMP/reuse.log" && ok "an untouched assembled library is reused" \
    || { bad "expected a reuse line"; sed 's/^/         /' "$TMP/reuse.log"; }

  sleep 1; touch "$PROJ/lib/sub/geom-deep.scm"
  (cd "$REPO" && chez --libdirs src --script src/compile.ss "$PROJ/main.scm" \
       --manifest "$TMP/chez-libs.scm" -o "$TMP/chez-app") >"$TMP/stale.log" 2>&1
  grep -q 'recompile: included source changed' "$TMP/stale.log" \
    && ok "touching an included file rebuilds the unit" \
    || { bad "expected an included-source rebuild"; sed 's/^/         /' "$TMP/stale.log"; }
fi

echo
echo "library include declarations: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
