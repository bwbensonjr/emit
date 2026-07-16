#!/usr/bin/env bash
# regen.sh -- Chez-free regeneration of the committed compiler IR (change:
# compiler-bootstrap-rehome).  The compiler is re-homed on (scheme base): its
# sources are compiled as ordinary programs that AUTO-IMPORT (scheme base) via the
# module-aware embedded compiler (scheme-run --emit), and each binary links the
# committed bootstrap/scheme.base.ll -- there is no more `prelude ++ compiler`
# prepend and no more schemec-filter bootstrap seed (the filter cannot resolve
# imports).
#
# Three Chez-free steps:
#   1. ASSEMBLE the flat sources by ordered `cat` -- NO prelude prepend.  The baked
#      `*prelude-source*` constant (embed / embed-repl need it to synthesize
#      (scheme base) at runtime for the USER programs they compile) is produced by a
#      shell escaper (\ -> \\, " -> \", newlines literal).  schemec bakes none (it is
#      a prelude-free filter).
#   2. FIXED POINT over {scheme.base.ll, embed.ll}: seed `scheme-run` from the
#      committed IR, emit scheme.base.ll (from lib/scheme/base.sld) and embed.ll
#      (re-homed program module), relink, and iterate until both are byte-stable.
#      As with the old schemec loop, a compiler-source change converges after one
#      recompile off the changed compiler.
#   3. EMIT schemec.ll and embed-repl.ll with the fixed-point `scheme-run`.
#
# Output: rewrites bootstrap/{scheme.base,schemec,embed,embed-repl}.ll.  Relinking
# the shipped binaries from that IR is the Makefile's job (`make regen` runs this
# then `make all schemec`).
set -eu
cd "$(dirname "$0")/.."
# Discover the toolchain (CC/CXX/LLVM_CONFIG/GC_INC/GC_LIB/LDFLAGS) once, single-sourced; also
# brings in say/vsay/bytes + EMIT_VERBOSITY (see docs/OUTPUT.md and tools/llvm-env.sh).
. tools/llvm-env.sh || exit 1

# Flat core, in concatenation order (this list == the Chez driver's include order).
CORE_FLAT="src/match.scm src/util.scm src/parse.ss \
           src/passes/expand.ss src/passes/recognize-let.ss \
           src/passes/convert-assignments.ss src/passes/convert-closures.ss \
           src/passes/lower.ss src/emit.ss src/core.ss"

mkdir -p build bootstrap

# take the program module (after the boundary marker) from a scheme-run --emit stream
prog_module () { awk 'f{print} /^; ==EMIT-UNIT-BOUNDARY==$/{f=1}' "$1"; }

# link the module-aware runner (scheme-run) from an embed IR + the (scheme base) IR
link_scheme_run () { # <embed.ll> <base.ll> <out>
  "$CXX" build/run.o build/runtime-host.o "$1" "$2" \
    -Wno-override-module -rdynamic $LDFLAGS -L"$GC_LIB" -lgc -o "$3" 2>/dev/null
}

t0=$(date +%s)
say "regen [1/3] assemble flat source (ordered cat; no prelude prepend)"
# the baked *prelude-source* constant (embed/embed-repl synthesize (scheme base)
# from it at runtime for the user programs they compile); schemec bakes none.
{ printf '(define *prelude-source* "'
  sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' src/prelude.scm
  printf '")\n'; } > build/prelude-source.scm
cat $CORE_FLAT src/entry-schemec.scm                                        > build/schemec.scm
cat $CORE_FLAT build/prelude-source.scm src/entry-embed.scm                 > build/embed.scm
cat $CORE_FLAT src/repl-core.ss build/prelude-source.scm src/entry-repl.scm > build/embed-repl.scm
# host objects for linking the runner during the fixed-point loop
make build/run.o build/runtime-host.o >/dev/null
say "regen [1/3] done  [$(($(date +%s) - t0))s]"

t0=$(date +%s)
say "regen [2/3] fixed point over {scheme.base.ll, embed.ll} (module-aware; no Chez)"
if [ ! -f bootstrap/embed.ll ]; then
  echo "regen: bootstrap/embed.ll is missing -- cannot seed the module-aware bootstrap." >&2
  echo "       re-derive it from the genesis path (see historical/genesis/)."             >&2
  exit 1
fi
if [ ! -f bootstrap/scheme.base.ll ]; then
  echo "regen: bootstrap/scheme.base.ll is missing -- generate it once from the library" >&2
  echo "       source: build/scheme-run --emit < lib/scheme/base.sld > bootstrap/scheme.base.ll" >&2
  exit 1
fi
# seed the runner from the committed IR (module-aware even if its own code is not
# yet re-homed -- the emitter is the same, so it converges in one recompile).
link_scheme_run bootstrap/embed.ll bootstrap/scheme.base.ll build/scheme-run
converged=0
for i in 1 2 3 4 5; do
  build/scheme-run --emit < lib/scheme/base.sld > build/scheme.base.ll
  build/scheme-run --emit < build/embed.scm     > build/embed.emit
  prog_module build/embed.emit > build/embed.ll
  link_scheme_run build/embed.ll build/scheme.base.ll build/scheme-run-next
  # re-emit with the freshly linked runner; the fixed point is reached when neither
  # the library nor the runner's own IR changes across a recompile.
  build/scheme-run-next --emit < lib/scheme/base.sld > build/scheme.base.chk
  build/scheme-run-next --emit < build/embed.scm     > build/embed.chk.emit
  prog_module build/embed.chk.emit > build/embed.chk
  vsay "   fixed-point iteration $i"
  if cmp -s build/scheme.base.ll build/scheme.base.chk && cmp -s build/embed.ll build/embed.chk; then
    mv build/scheme-run-next build/scheme-run
    converged=1
    say "   fixed point reached  [iter $i]"
    break
  fi
  mv build/scheme-run-next build/scheme-run
done
[ "$converged" = 1 ] || { echo "regen: bootstrap did not converge in 5 iterations" >&2; exit 1; }
cp build/scheme.base.ll bootstrap/scheme.base.ll
cp build/embed.ll        bootstrap/embed.ll
say "regen [2/3] done  [$(($(date +%s) - t0))s]"

t0=$(date +%s)
say "regen [3/3] emit schemec / embed-repl with the fixed-point scheme-run"
build/scheme-run --emit < build/schemec.scm    > build/schemec.emit
prog_module build/schemec.emit    > bootstrap/schemec.ll
build/scheme-run --emit < build/embed-repl.scm > build/embed-repl.emit
prog_module build/embed-repl.emit > bootstrap/embed-repl.ll
say "regen [3/3] done  [$(($(date +%s) - t0))s]"

say "regen: committed IR rebuilt Chez-free (re-homed on (scheme base)):"
say "   bootstrap/scheme.base.ll -> $(bytes bootstrap/scheme.base.ll) bytes"
say "   bootstrap/schemec.ll     -> $(bytes bootstrap/schemec.ll) bytes"
say "   bootstrap/embed.ll       -> $(bytes bootstrap/embed.ll) bytes"
say "   bootstrap/embed-repl.ll  -> $(bytes bootstrap/embed-repl.ll) bytes"
