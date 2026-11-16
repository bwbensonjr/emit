#!/usr/bin/env bash
# Installed learner/random closure, explicit artifacts, and standalone delivery.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain installed learner diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
PREFIX="$TMP/prefix"
export EMIT_CACHE="$TMP/cache"
unset EMIT_LIBRARY_PATH EMIT_MANIFEST
say "install learner and random source closure -> $PREFIX [isolated prefix]"
make install PREFIX="$PREFIX" WARM_STDLIB=0 > "$TMP/install.out" 2> "$TMP/install.err" || {
  cat "$TMP/install.out" "$TMP/install.err" >&2; exit 1;
}
for path in lib/malt/learner.sld lib/malt/LICENSE lib/malt/PROVENANCE.md \
            lib/malt/learner/*.sld lib/srfi/27.sld lib/srfi/27-LICENSE.txt; do
  cmp "$path" "$PREFIX/share/emit/$path"
done
find "$PREFIX/share/emit/lib/malt" -type f -exec shasum -a 256 {} + | sort > "$TMP/before"
make install PREFIX="$PREFIX" WARM_STDLIB=0 > "$TMP/repeat.out" 2> "$TMP/repeat.err"
find "$PREFIX/share/emit/lib/malt" -type f -exec shasum -a 256 {} + | sort > "$TMP/after"
cmp "$TMP/before" "$TMP/after"
make install PREFIX="$PREFIX" DESTDIR="$TMP/staged" WARM_STDLIB=0 \
  > "$TMP/staged.out" 2> "$TMP/staged.err"
diff -r "$PREFIX/share/emit/lib/malt" "$TMP/staged$PREFIX/share/emit/lib/malt"
for file in 27.sld 27-LICENSE.txt; do
  cmp "$PREFIX/share/emit/lib/srfi/$file" "$TMP/staged$PREFIX/share/emit/lib/srfi/$file"
done
if find "$PREFIX/share/emit/lib/malt" \( -name '*.ll' -o -name '*.exports' -o -name '*test*' \) | grep .; then
  printf 'unexpected test or compiled artifact in installed learner closure\n' >&2; exit 1
fi
mkdir -p "$TMP/work" "$TMP/delivered"
cat > "$TMP/work/probe.scm" <<'SCM'
(import (scheme base) (prefix (malt learner) m:) (srfi 27))
(define source (make-random-source))
(random-source-pseudo-randomize! source 17 3)
(define snapshot (random-source-state-ref source))
(define draw ((random-source-make-integers source) 100000))
(random-source-state-set! source snapshot)
(m:with-hypers ((m:alpha 0.1) (m:revs 4))
  (list (m:gradient (lambda (x) (m:* x x)) 3.0)
        (= draw ((random-source-make-integers source) 100000))
        (m:alpha) (m:revs)))
SCM
cd "$TMP/work"
EMIT="$PREFIX/bin/emit"
WANT='(6.0 #t 0.1 4)'
for mode in run repl build; do
  say "test installed learner -> $mode [unrelated directory, isolated cache]"
  export EMIT_CACHE="$TMP/cache-$mode"
  case "$mode" in
    run) EMIT_VERBOSITY=verbose "$EMIT" run probe.scm > "$TMP/$mode.out" 2> "$TMP/$mode.err" ;;
    repl) EMIT_VERBOSITY=verbose "$EMIT" repl < probe.scm > "$TMP/$mode.out" 2> "$TMP/$mode.err" ;;
    build)
      EMIT_VERBOSITY=verbose "$EMIT" build probe.scm -o "$TMP/delivered/probe" > "$TMP/build.compile" 2> "$TMP/build.err"
      mv "$PREFIX/share/emit" "$TMP/hidden-share"
      (cd "$TMP/delivered" && env -u EMIT_LIBRARY_PATH -u EMIT_MANIFEST \
        PATH=/usr/bin:/bin ./probe) > "$TMP/build.out"
      mv "$TMP/hidden-share" "$PREFIX/share/emit" ;;
  esac
  got="$(awk 'NF {last=$0} END {print last}' "$TMP/$mode.out")"
  [ "$got" = "$WANT" ] || {
    cat "$TMP/$mode.out" "$TMP/$mode.err" >&2; exit 1;
  }
  grep -Fq "$PREFIX/share/emit/lib/malt/learner.sld" "$TMP/$mode.err"
done
cat > installed.sld <<'SCM'
(define-library (learner installed)
  (import (scheme base) (prefix (malt learner) m:))
  (export answer custom)
  (begin
    (m:declare-hyper custom)
    (define (answer)
      (m:with-hypers ((m:alpha 0.125))
        (list (m:gradient (lambda (x) (m:* (m:alpha) (m:sqr x))) 4.0)
              (custom))))))
SCM
say "publish installed learner-dependent library -> explicit artifact [macro dependency]"
"$EMIT" lib installed.sld -o artifacts > "$TMP/lib.out" 2> "$TMP/lib.err"
test -s artifacts/learner.installed.exports
test -s artifacts/learner.installed.artifact
cat > emit-libs.scm <<EOF
((library (learner installed) (source "$TMP/work/installed.sld") (artifacts "$TMP/work/artifacts")))
EOF
printf '%s\n' '(import (learner installed) (prefix (malt learner) m:)) (m:with-hypers ((custom 3)) (answer))' > use.scm
export EMIT_CACHE="$TMP/fresh-artifact-cache"
got="$(EMIT_VERBOSITY=verbose "$EMIT" run use.scm 2> "$TMP/artifact.err")"
[ "$got" = '(1.0 3)' ]
grep -Fq 'learner.installed: reused from' "$TMP/artifact.err"
rm emit-libs.scm
printf '(list 1 2)\n' > plain.scm
say "build plain.scm -> delivered plain executable [optional library symbols absent]"
"$EMIT" build plain.scm -o "$TMP/plain" > "$TMP/plain.out" 2> "$TMP/plain.err"
if nm "$TMP/plain" | grep -E 'malt[.]learner|srfi[.]27|rt_random_entropy'; then
  printf 'unused learner/random payload retained\n' >&2; exit 1
fi
printf '()\n' > emit-libs.scm
mkdir -p lib/malt lib/srfi
printf '%s\n' '(define-library (malt learner) (import (scheme base)) (export marker) (begin (define marker 73)))' > lib/malt/learner.sld
printf '%s\n' '(define-library (srfi 27) (import (scheme base)) (export marker) (begin (define marker 79)))' > lib/srfi/27.sld
printf '%s\n' '(import (prefix (malt learner) m:) (prefix (srfi 27) r:)) (list m:marker r:marker)' > override.scm
[ "$("$EMIT" run override.scm 2> "$TMP/override.err")" = '(73 79)' ]
say "test installed learner/random closure -> complete [sources, staging, replay, artifacts, providers, standalone]"
