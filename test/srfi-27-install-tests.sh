#!/usr/bin/env bash
# Installed SRFI 27 source closure: complete and repeatable installation, replay
# through every execution path from an unrelated directory, no PRNG payload in
# programs that do not import it, and project-provider precedence. Also checks that
# (malt learner) is absent from the payload and resolves only through a supplied root.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
ROOT="$PWD"
TMP="$(mktemp -d)"
cleanup() {
  if [ "${EMIT_TEST_KEEP:-0}" = 1 ]; then say "retain installed SRFI 27 diagnostics -> $TMP"
  else rm -rf "$TMP"; fi
}
trap cleanup EXIT
PREFIX="$TMP/prefix"
export EMIT_CACHE="$TMP/cache"
unset EMIT_LIBRARY_PATH EMIT_MANIFEST
say "install random source closure -> $PREFIX [isolated prefix]"
make install PREFIX="$PREFIX" WARM_STDLIB=0 > "$TMP/install.out" 2> "$TMP/install.err" || {
  cat "$TMP/install.out" "$TMP/install.err" >&2; exit 1;
}
CLOSURE="lib/srfi/27.sld lib/srfi/27-LICENSE.txt lib/emit/write.sld"
for path in $CLOSURE; do
  cmp "$path" "$PREFIX/share/emit/$path"
done

# The same payload staged twice, and through DESTDIR, is byte-identical.
checksum_closure() {
  (cd "$1/share/emit" && shasum -a 256 $CLOSURE)
}
checksum_closure "$PREFIX" > "$TMP/before"
make install PREFIX="$PREFIX" WARM_STDLIB=0 > "$TMP/repeat.out" 2> "$TMP/repeat.err"
checksum_closure "$PREFIX" > "$TMP/after"
cmp "$TMP/before" "$TMP/after"
make install PREFIX="$PREFIX" DESTDIR="$TMP/staged" WARM_STDLIB=0 \
  > "$TMP/staged.out" 2> "$TMP/staged.err"
checksum_closure "$TMP/staged$PREFIX" > "$TMP/staged.sums"
cmp "$TMP/before" "$TMP/staged.sums"
if find "$PREFIX/share/emit/lib/srfi" \( -name '*.ll' -o -name '*.exports' -o -name '*test*' \) | grep .; then
  printf 'unexpected test or compiled artifact in installed SRFI closure\n' >&2; exit 1
fi

mkdir -p "$TMP/work" "$TMP/delivered"
cat > "$TMP/work/probe.scm" <<'SCM'
(import (scheme base) (srfi 27))
(define source (make-random-source))
(random-source-pseudo-randomize! source 17 3)
(define snapshot (random-source-state-ref source))
(define draw ((random-source-make-integers source) 100000))
(random-source-state-set! source snapshot)
(list (= draw ((random-source-make-integers source) 100000)) (< -1 draw 100000))
SCM
cd "$TMP/work"
EMIT="$PREFIX/bin/emit"
WANT='(#t #t)'
for mode in run repl build; do
  say "test installed SRFI 27 -> $mode [unrelated directory, isolated cache]"
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
  grep -Fq "$PREFIX/share/emit/lib/srfi/27.sld" "$TMP/$mode.err"
done

printf '(list 1 2)\n' > plain.scm
say "build plain.scm -> delivered plain executable [optional library symbols absent]"
export EMIT_CACHE="$TMP/cache-plain"
"$EMIT" build plain.scm -o "$TMP/plain" > "$TMP/plain.out" 2> "$TMP/plain.err"
if nm "$TMP/plain" | grep -E 'srfi[.]27|rt_random_entropy'; then
  printf 'unused random payload retained\n' >&2; exit 1
fi

# A project's own provider overrides the installed source.
printf '()\n' > emit-libs.scm
mkdir -p lib/srfi
printf '%s\n' '(define-library (srfi 27) (import (scheme base)) (export marker) (begin (define marker 79)))' > lib/srfi/27.sld
printf '%s\n' '(import (prefix (srfi 27) r:)) r:marker' > override.scm
[ "$("$EMIT" run override.scm 2> "$TMP/override.err")" = '79' ]
say "test installed SRFI 27 closure -> complete [sources, staging, replay, providers, standalone]"

# (malt learner) left the installed payload for the emit-packages collection: an
# installed Emit resolves it only through a root the user supplies.
if [ -e "$PREFIX/share/emit/lib/malt" ]; then
  printf 'installed payload still carries a malt library directory\n' >&2; exit 1
fi
mkdir -p "$TMP/bare"
cd "$TMP/bare"
printf '(import (malt learner))\n(display (gradient (lambda (x) (* x x)) 3.0))\n' > malt.scm
export EMIT_CACHE="$TMP/cache-malt"
# An empty user library root supplies nothing (change: user-library-root).
mkdir -p "$TMP/xdg-empty/emit/lib"
export XDG_DATA_HOME="$TMP/xdg-empty"
if "$EMIT" run malt.scm > "$TMP/malt-bare.out" 2> "$TMP/malt-bare.err"; then
  printf 'installed Emit resolved (malt learner) with no supplied root\n' >&2; exit 1
fi
grep -Fq 'unresolved import' "$TMP/malt-bare.err" && grep -Fq '(malt learner)' "$TMP/malt-bare.err" || {
  cat "$TMP/malt-bare.err" >&2; exit 1;
}
say "reject malt.scm -> unresolved (malt learner) [installed payload, no supplied root]"
COLLECTION="$(cd "$ROOT" && python3 -c '
import importlib.util
spec = importlib.util.spec_from_file_location("ep", "tools/emit-packages.py")
m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
print(m.obtain_collection(*m.read_pin())[0])')"
got="$(EMIT_LIBRARY_PATH="$COLLECTION/lib" "$EMIT" run malt.scm 2> "$TMP/malt-root.err")" || {
  cat "$TMP/malt-root.err" >&2; exit 1;
}
[ "$got" = '6.0' ] || { printf 'expected 6.0 from the collection root, got %s\n' "$got" >&2; exit 1; }
say "run malt.scm -> 6.0 [installed payload, EMIT_LIBRARY_PATH=$COLLECTION/lib]"
# The collection linked as the user library root resolves with no environment root.
mkdir -p "$TMP/xdg-linked/emit"
ln -s "$COLLECTION/lib" "$TMP/xdg-linked/emit/lib"
got="$(XDG_DATA_HOME="$TMP/xdg-linked" "$EMIT" run malt.scm 2> "$TMP/malt-user.err")" || {
  cat "$TMP/malt-user.err" >&2; exit 1;
}
[ "$got" = '6.0' ] || { printf 'expected 6.0 from the user root, got %s\n' "$got" >&2; exit 1; }
say "run malt.scm -> 6.0 [installed payload, user root linked to $COLLECTION/lib]"
# emit pkg from the installed payload (change: emit-pkg): an empty user root lists
# nothing, and installing Malt from the collection checkout makes it resolve.
mkdir -p "$TMP/xdg-pkg"
listed="$(XDG_DATA_HOME="$TMP/xdg-pkg" "$EMIT" pkg list 2> "$TMP/pkg-list.err")" || {
  cat "$TMP/pkg-list.err" >&2; exit 1;
}
[ -z "$listed" ] || { printf 'emit pkg list on an empty root printed %s\n' "$listed" >&2; exit 1; }
XDG_DATA_HOME="$TMP/xdg-pkg" "$EMIT" pkg install --from "$COLLECTION" malt 2> "$TMP/pkg-install.err" || {
  cat "$TMP/pkg-install.err" >&2; exit 1;
}
got="$(XDG_DATA_HOME="$TMP/xdg-pkg" "$EMIT" run malt.scm 2> "$TMP/malt-pkg.err")" || {
  cat "$TMP/malt-pkg.err" >&2; exit 1;
}
[ "$got" = '6.0' ] || { printf 'expected 6.0 after emit pkg install, got %s\n' "$got" >&2; exit 1; }
say "run malt.scm -> 6.0 [installed payload, emit pkg install --from $COLLECTION malt]"
