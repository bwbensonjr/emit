#!/usr/bin/env bash
# regen.sh -- Chez-free regeneration of the committed compiler IR (change:
# compiler-bootstrap-rehome).  The compiler is re-homed on (scheme base): its
# sources are compiled as ordinary programs that AUTO-IMPORT (scheme base) via the
# module-aware embedded compiler, and each binary links the committed
# bootstrap/scheme.base.ll -- there is no more `prelude ++ compiler` prepend and no
# more schemec-filter bootstrap seed (the filter cannot resolve imports).
#
# The fixed-point loop below is driven by build/emit-boot, a MINIMAL batch runner
# (src/run-boot.cpp) linked against the batch compiler bootstrap/embed.ll -- NOT the
# shipped `emit` binary (which links the mode-dispatched embed-repl.ll).  The batch
# runner is relinked from the freshly emitted embed.ll each iteration, which is why
# the bootstrap seed stays a separate, minimal host (change: run-door-user-libraries,
# decision X).  The shipped `emit` binary is relinked afterward by `make all`.
#
# Three Chez-free steps:
#   1. ASSEMBLE the flat sources by ordered `cat` -- NO prelude prepend.  The baked
#      `*prelude-source*` constant (embed / embed-repl need it to synthesize
#      (scheme base) at runtime for the USER programs they compile) is produced by a
#      shell escaper (\ -> \\, " -> \", newlines literal).  schemec bakes none (it is
#      a prelude-free filter).
#   2. FIXED POINT over {the baked set, embed.ll}: seed the batch runner from the
#      committed IR, emit the baked library modules AND embed.ll (the re-homed program
#      module) from ONE --emit of the flat source, relink, and iterate until every one is
#      byte-stable.  As with the old schemec loop, a compiler-source change converges
#      after one recompile off the changed compiler.
#      The baked set is a PARTITION (change: scheme-base-partition), and a member may
#      import another, so it cannot be compiled a member at a time from its .sld -- the
#      lone-define-library path resolves no imports.  All of it comes from the compiler's
#      own stream instead, which also makes the set internally consistent by construction.
#   3. EMIT schemec.ll and embed-repl.ll with the fixed-point emit-boot.
#
# Output: rewrites bootstrap/{schemec,embed,embed-repl}.ll and every member of the baked
# set (BAKED_LL below: emit.internal.ll, scheme.base.ll).  Relinking the shipped binaries
# from that IR is the Makefile's job (`make regen` runs this then `make all schemec`).
set -eu
cd "$(dirname "$0")/.."
# Discover the toolchain (CC/CXX/LLVM_CONFIG/GC_INC/GC_LIB/LDFLAGS) once, single-sourced; also
# brings in say/vsay/bytes + EMIT_VERBOSITY (see docs/OUTPUT.md and tools/llvm-env.sh).
. tools/llvm-env.sh || exit 1

# Flat core, in concatenation order (this list == the Chez driver's include order,
# PLUS src/dump.ss and src/include-reader.ss: the stage dumper calls the %-ops
# `%dump-level`/`%stderr-write` and the include reader calls `%read-file`, which are
# primcall heads when COMPILED here but unbound identifiers when Chez EVALUATES its
# include block -- so both ride the Chez-free assembly only, and the driver keeps its own
# independent implementation of each (emit-dump-stages D5/D10;
# library-include-declarations D2).
CORE_FLAT="src/match.scm src/util.scm src/parse.ss \
           src/passes/expand.ss src/passes/recognize-let.ss \
           src/passes/convert-assignments.ss src/passes/simplify.ss \
           src/passes/convert-closures.ss \
           src/passes/lower.ss src/emit.ss src/prelude-surface.scm src/core.ss \
           src/dump.ss src/include-reader.ss src/import-substrate.scm"

mkdir -p build bootstrap

# --- splitting an --emit stream (change: scheme-base-partition) ---------------
# The stream is one module per BAKED LIBRARY in dependency order, then the program,
# joined by the boundary marker.  It used to be exactly two parts, so "everything after
# the first marker" was the program; with a partitioned standard library it is N+1, so
# the parts are counted from the END instead.
#
# BAKED_LL is the committed IR of the baked set, in the SAME dependency order the
# declaration gives -- which is the order the linker and the __init chain want.
BAKED_LL="bootstrap/emit.internal.ll bootstrap/scheme.base.ll"

# the LAST part: the program module
prog_module () { awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n = 0; delete L; next } { L[++n] = $0 }
                      END { for (i = 1; i <= n; i++) print L[i] }' "$1"; }

# unit_module <stream> <i>: the i-th (1-based) part, i.e. the i-th baked member
unit_module () { awk -v want="$2" 'BEGIN { p = 1 }
                   /^; ==EMIT-UNIT-BOUNDARY==$/ { p++; next }
                   p == want { print }' "$1"; }

# How many parts a stream has, minus the program: the number of baked members it emitted.
unit_count () { awk '/^; ==EMIT-UNIT-BOUNDARY==$/ { n++ } END { print n + 0 }' "$1"; }

# Split <stream>'s baked members to <prefix>1.ll .. <prefix>N.ll and echo N.
#
# The COUNT is read from the stream, not from BAKED_LL, because the two legitimately
# disagree for one iteration when the partition changes: the seed compiler was built with
# the OLD declaration, so it emits the old set even while compiling a source that declares
# the new one.  The next iteration -- driven by the compiler just built from that source --
# emits the new set, and the loop converges on it.  BAKED_LL is checked against the
# CONVERGED count instead, which is the invariant that matters for what gets committed.
split_units () { # <stream> <prefix>
  local n i
  n=$(unit_count "$1")
  i=0
  while [ "$i" -lt "$n" ]; do
    i=$((i + 1))
    unit_module "$1" "$i" > "$2$i.ll"
  done
  echo "$n"
}

# link the BATCH bootstrap runner (build/emit-boot) from an embed IR + the baked library
# IRs.  This uses run-boot.o (the batch host, src/run-boot.cpp), NOT the shipped
# dispatched emit.o: the fixed point below must be driven by the minimal batch compiler
# (change: run-door-user-libraries, decision X).  The shipped module-aware build/emit
# is linked afterward by the Makefile (`make all`) from emit.o + embed-repl.ll.
link_emit_boot () { # <embed.ll> <out> <baked.ll>...
  local embed="$1" out="$2"; shift 2
  "$CXX" build/run-boot.o build/runtime-host.o "$embed" "$@" \
    -Wno-override-module -rdynamic $LDFLAGS -L"$GC_LIB" -lgc -lm -o "$out" 2>/dev/null
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
# host objects for linking the bootstrap runner during the fixed-point loop
make build/run-boot.o build/runtime-host.o >/dev/null
say "regen [1/3] done  [$(($(date +%s) - t0))s]"

t0=$(date +%s)
say "regen [2/3] fixed point over {baked set, embed.ll} (module-aware; no Chez)"
if [ ! -f bootstrap/embed.ll ]; then
  echo "regen: bootstrap/embed.ll is missing -- cannot seed the module-aware bootstrap." >&2
  echo "       re-derive it from the genesis path (see historical/genesis/)."             >&2
  exit 1
fi
# Seed from whichever committed baked members exist.  A partition that GAINS a member has
# none committed for it yet, and does not need one: the seed compiler still carries the old
# declaration, so it links and runs against the old set while emitting the new one.
seed_ll=""
for ll in $BAKED_LL; do
  if [ -f "$ll" ]; then seed_ll="$seed_ll $ll"; fi     # `[ ] &&` would trip `set -e`
done
if [ -z "$seed_ll" ]; then
  echo "regen: no committed baked library IR -- cannot seed the module-aware bootstrap." >&2
  echo "       re-derive it from the genesis path (see historical/genesis/)."             >&2
  exit 1
fi
# seed the runner from the committed IR (module-aware even if its own code is not
# yet re-homed -- the emitter is the same, so it converges in one recompile).
link_emit_boot bootstrap/embed.ll build/emit-boot $seed_ll
converged=0
# ONE --emit per iteration now yields the whole baked set AND the program: a baked member
# may import another, so the set cannot be compiled a member at a time from its .sld the
# way the lone `emit-boot --emit < base.sld` used to (the lone-library path resolves no
# imports).  Taking every module from one stream also makes the set's IR self-consistent by
# construction (change: scheme-base-partition).
for i in 1 2 3 4 5; do
  build/emit-boot --emit < build/embed.scm > build/embed.emit
  n=$(split_units build/embed.emit build/unit-)
  prog_module build/embed.emit > build/embed.ll
  units=""; j=0
  while [ "$j" -lt "$n" ]; do j=$((j + 1)); units="$units build/unit-$j.ll"; done
  link_emit_boot build/embed.ll build/emit-boot-next $units
  # re-emit with the freshly linked runner; the fixed point is reached when neither the
  # baked set nor the runner's own IR changes across a recompile.
  build/emit-boot-next --emit < build/embed.scm > build/embed.chk.emit
  m=$(split_units build/embed.chk.emit build/chk-)
  prog_module build/embed.chk.emit > build/embed.chk
  vsay "   fixed-point iteration $i  [$n baked module(s)]"
  stable=1
  cmp -s build/embed.ll build/embed.chk || stable=0
  [ "$n" = "$m" ] || stable=0
  j=0
  while [ "$j" -lt "$n" ] && [ "$stable" = 1 ]; do
    j=$((j + 1))
    cmp -s "build/unit-$j.ll" "build/chk-$j.ll" || stable=0
  done
  if [ "$stable" = 1 ]; then
    mv build/emit-boot-next build/emit-boot
    converged=1
    say "   fixed point reached  [iter $i, $n baked module(s)]"
    break
  fi
  mv build/emit-boot-next build/emit-boot
done
[ "$converged" = 1 ] || { echo "regen: bootstrap did not converge in 5 iterations" >&2; exit 1; }
# The converged count IS the partition's size, so this is where BAKED_LL is checked: a
# member added to *prelude-libraries* without being named here (and in the Makefile) would
# otherwise leave a module uncommitted and unlinked.
if [ "$n" != "$(set -- $BAKED_LL; echo $#)" ]; then
  echo "regen: the compiler emits $n baked module(s) but BAKED_LL names" \
       "$(set -- $BAKED_LL; echo $#) --"                                              >&2
  echo "       tools/regen.sh's BAKED_LL is out of sync with *prelude-libraries*"      >&2
  echo "       (src/prelude-surface.scm).  Update it and the Makefile's together, in"   >&2
  echo "       the same dependency order."                                             >&2
  exit 1
fi
j=0
for ll in $BAKED_LL; do j=$((j + 1)); cp "build/unit-$j.ll" "$ll"; done
cp build/embed.ll bootstrap/embed.ll
say "regen [2/3] done  [$(($(date +%s) - t0))s]"

t0=$(date +%s)
say "regen [3/3] emit schemec / embed-repl with the fixed-point emit-boot"
build/emit-boot --emit < build/schemec.scm    > build/schemec.emit
prog_module build/schemec.emit    > bootstrap/schemec.ll
build/emit-boot --emit < build/embed-repl.scm > build/embed-repl.emit
prog_module build/embed-repl.emit > bootstrap/embed-repl.ll
say "regen [3/3] done  [$(($(date +%s) - t0))s]"

say "regen: committed IR rebuilt Chez-free (re-homed on the baked set):"
for ll in $BAKED_LL; do
  say "   $ll -> $(bytes "$ll") bytes"
done
say "   bootstrap/schemec.ll     -> $(bytes bootstrap/schemec.ll) bytes"
say "   bootstrap/embed.ll       -> $(bytes bootstrap/embed.ll) bytes"
say "   bootstrap/embed-repl.ll  -> $(bytes bootstrap/embed-repl.ll) bytes"
