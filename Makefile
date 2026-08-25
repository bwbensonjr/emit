# Makefile -- Chez-free build for Emit (change: self-hosting-completion).
#
# THE MODEL: a developer needs only LLVM 22 + libgc.  The committed compiler IR
# under bootstrap/ (schemec.ll, embed.ll, embed-repl.ll) is the FAVORED,
# AUTHORITATIVE form -- host-agnostic stage-0 artifacts produced by the compiled
# compiler itself (the self-hosting fixed point).  The default build LINKS those
# committed inputs with the C runtime using LLVM only; it never runs Chez and
# never regenerates IR.
#
#   make            -> build/emit (run/repl/build/lib)  (link committed IR, no Chez)
#   make schemec    -> the batch text->IR compiler      (link committed IR, no Chez)
#   make regen      -> rebuild the committed IR from source with the compiled
#                      compiler (Chez-free; see tools/regen.sh), then relink
#
# COMMITTED IR IS A CHECKED-IN INPUT, NOT A BUILD PRODUCT (design D4).  The
# bootstrap/*.ll targets carry NO source prerequisites in the default graph, so
# `make` cannot decide they are "stale" and shell out to a regenerator.  This
# deliberately REVERSES fix-stale-repl-host-rebuild's auto-rebuild-on-source-change:
# the committed IR is authoritative and is regenerated only by the explicit
# `make regen`.  The anti-stale guarantee moves to the Chez-gated trust-check
# (run-dev-tests.sh: `make regen` from a clean tree must leave `git diff
# bootstrap/` empty), so a compiler edit that forgot `make regen` fails loudly in
# CI rather than silently shipping stale binaries.
#
# Chez is NOT required for anything here.  It is used only by run-dev-tests.sh
# (the trust-check + IL-level unit tests + the independent-host fixed-point
# re-derivation), and the historical genesis tooling lives in historical/genesis/.

# Toolchain discovery is single-sourced in tools/llvm-env.sh (change:
# allow-llvm-install-flexibility): --print-make writes the resolved CC/CXX/LLVM_CONFIG/GC_*/
# CXXFLAGS/LDFLAGS as a Make fragment that we -include, so the build finds any LLVM discoverable
# via llvm-config + libgc (apt, Homebrew, Nix, custom) instead of a fixed keg path.  Environment
# and command-line overrides still win (they flow into the fragment, and `make VAR=...` overrides
# the include).  build/llvm.mk is regenerated whenever the discovery script changes.
build/llvm.mk: tools/llvm-env.sh tools/log.sh | build
	tools/llvm-env.sh --print-make > $@
-include build/llvm.mk

# Binaries.  `emit` is the single user-facing entry point (verbs run/repl/build/lib);
# `schemec` is the internal batch text->IR bootstrap seed.
EMIT        := build/emit
SCHEMEC     := build/schemec

# Install location (change: manifest-search-path).  PREFIX is compiled into the
# binary as its last-resort manifest candidate AND is where `make install` writes;
# DESTDIR stages that tree elsewhere without changing what the binary looks for.
PREFIX      ?= /usr/local
DESTDIR     ?=

# Committed, host-agnostic stage-0 compiler IR (checked-in INPUTS; design D3/D4).
SCHEMEC_LL     := bootstrap/schemec.ll
EMBED_LL       := bootstrap/embed.ll
EMBED_REPL_LL  := bootstrap/embed-repl.ll
# The prelude re-homed as a library SET (change: compiler-bootstrap-rehome, partitioned by
# scheme-base-partition): the compiler binaries no longer inline the prelude -- they link
# these committed library modules, which their own re-homed IR references as
# scheme.base:* / emit.internal:* externals, each initialized once via its __init guard.
#
# In DEPENDENCY ORDER, matching *prelude-libraries* in src/prelude-surface.scm: the
# substrate before (scheme base), which imports it.  tools/regen.sh has the same list (it
# splits its --emit stream by it) and fails loudly if the two disagree with the partition.
BAKED_LL := bootstrap/emit.internal.ll bootstrap/scheme.base.ll

# ===========================================================================
# Default build: link binaries from the committed IR with LLVM only (no Chez).
# ===========================================================================
# The `build/llvm.mk` makefile-remaking rule above is the first normal target in
# the file.  GNU Make 3.81 (macOS system make) would otherwise treat it as the
# default goal, so bare `make` would only regenerate the toolchain fragment and
# stop.  (GNU Make 4.x excludes makefile-remaking targets from default-goal
# selection, which is why this built on Linux/apt but not on macOS.)  Pin the
# default goal explicitly so `make` builds the binaries on every Make version.
.DEFAULT_GOAL := all

.PHONY: all
all: $(EMIT)

.PHONY: emit schemec
emit:       $(EMIT)
schemec:    $(SCHEMEC)

# Unified `emit` front-end (change: emit-cli-unification): ONE binary dispatching the
# run/repl/build/lib verbs -- the sole user-facing entry point.  A-links the
# MODE-DISPATCHED embedded compiler (embed-repl.ll) and exports rt_* / scheme_entry
# (-rdynamic) so JIT'd code resolves them here.  It links $(BAKED_LL) too: the compiler is
# re-homed on the baked library set (change: compiler-bootstrap-rehome), so its IR
# references scheme.base:* / emit.internal:* externals resolved against those committed
# libraries, each initialized once via its __init guard.  The run/repl doors were formerly
# the separate build/scheme-run and build/repl-host binaries, merged here; build/lib forks
# clang.
$(EMIT): build/emit.o build/runtime-host.o $(EMBED_REPL_LL) $(BAKED_LL) Makefile
	$(CXX) build/emit.o build/runtime-host.o $(EMBED_REPL_LL) $(BAKED_LL) \
	  -Wno-override-module -rdynamic $(LDFLAGS) -L$(GC_LIB) -lgc -lm -o $@
	@. tools/log.sh; say "link $(EMBED_REPL_LL) + $(words $(BAKED_LL)) baked librar$(if $(word 2,$(BAKED_LL)),ies,y) -> $@  [$$(bytes $@) bytes]"

# Batch text->IR filter compiler: links the committed schemec IR + the baked library set
# with the runtime's RT_FILTER_MAIN (so the program's output is exactly the emitted IR).
$(SCHEMEC): $(SCHEMEC_LL) $(BAKED_LL) src/runtime/runtime.c Makefile | build
	$(CC) -O2 -Wno-override-module -DRT_FILTER_MAIN -I$(GC_INC) -L$(GC_LIB) \
	  src/runtime/runtime.c $(SCHEMEC_LL) $(BAKED_LL) -lgc -lm -o $@
	@. tools/log.sh; say "link $(SCHEMEC_LL) + $(words $(BAKED_LL)) baked librar$(if $(word 2,$(BAKED_LL)),ies,y) -> $@  [$$(bytes $@) bytes]"

# --- objects ---------------------------------------------------------------
# Runtime compiled as C without its standalone main (the host supplies one).
# gnu11, not c11: the string ports use open_memstream, a POSIX-2008/GNU function that
# strict ISO mode hides.  The other runtime.c recipes take clang's gnu default already.
build/runtime-host.o: src/runtime/runtime.c Makefile | build
	$(CC) -std=gnu11 -O2 -I$(GC_INC) -DRT_NO_MAIN -c $< -o $@

# Unified emit front-end, compiled as C++ against the LLVM headers.  EMIT_PREFIX is
# the LAST manifest candidate (change: manifest-search-path): the prefix this binary
# was built for, consulted only when neither ./emit-libs.scm nor a manifest beside the
# executable exists.  A plain in-repo `make` bakes /usr/local and never uses it.
#
# EMIT_DEFAULT_CC/_GC_INC/_GC_LIB record the toolchain THIS build resolved -- the same
# llvm-env.sh values every other recipe here uses -- as the LOWEST-precedence source
# for `emit build`'s link (change: installed-emit-completeness, issue #36).  They are
# reached only when neither an explicit CC/GC_* nor a run-time llvm-env.sh discovery
# produced an answer, which is the keg-only-LLVM case: nothing on PATH to find.  They
# describe the BUILD MACHINE's toolchain, so they follow $(CC)/$(GC_*) and not
# PREFIX/DESTDIR -- staging into a temporary root must not change them.
build/emit.o: src/emit.cpp Makefile | build
	$(CXX) $(CXXFLAGS) -DEMIT_PREFIX='"$(PREFIX)"' \
	  -DEMIT_DEFAULT_CC='"$(CC)"' \
	  -DEMIT_DEFAULT_GC_INC='"$(GC_INC)"' \
	  -DEMIT_DEFAULT_GC_LIB='"$(GC_LIB)"' \
	  -c $< -o $@

# Batch bootstrap runner object (change: run-door-user-libraries, decision X):
# tools/regen.sh links this with the batch embed.ll into build/emit-boot to
# drive the self-hosting fixed point.  Not linked into any shipped binary.
build/run-boot.o: src/run-boot.cpp Makefile | build
	$(CXX) $(CXXFLAGS) -c $< -o $@

# ===========================================================================
# Regeneration: rebuild the committed IR from source, Chez-free (explicit only).
# ===========================================================================
# tools/regen.sh assembles the flat source by ordered `cat` (no prelude prepend) and
# compiles it with the module-aware embedded compiler (via build/emit-boot, the minimal
# batch runner), which auto-imports (scheme base) and iterates {scheme.base.ll, embed.ll}
# to the byte-identical fixed point; then it emits schemec.ll / embed-repl.ll.  It seeds
# the batch runner from the committed IR (building its own host objects), so no prebuilt
# binary prerequisite is needed here; after it, relink every binary from the regenerated IR.
.PHONY: regen
regen:
	@. tools/log.sh; say "regen bootstrap/*.ll + binaries (Chez-free)"
	@start=$$(date +%s); \
	  CC="$(CC)" CXX="$(CXX)" LLVM_CONFIG="$(LLVM_CONFIG)" GC_INC="$(GC_INC)" GC_LIB="$(GC_LIB)" tools/regen.sh && \
	  $(MAKE) all schemec && \
	  { . tools/log.sh; say "regen complete -- committed IR + binaries rebuilt, no Chez  [$$(($$(date +%s) - start))s]"; }

# ===========================================================================
# Complexity catalogue: regenerate docs/COMPLEXITY.md from the tracked tree.
# ===========================================================================
# tools/complexity.sh classifies every git-tracked file by role/component/language
# and splices the generated tables into docs/COMPLEXITY.md between its BEGIN/END
# markers (idempotent; hand-authored prose outside the markers is preserved).  No
# Chez, no compiler build -- just git + wc.
.PHONY: catalogue
catalogue:
	tools/complexity.sh --write

# ===========================================================================
# install: the binary PLUS everything the doors need beside it -- the libraries
# (change: manifest-search-path, issue #35) and the support files (change:
# installed-emit-completeness, issue #36).
# ===========================================================================
# A library that is not baked into the compiler is reachable only through a manifest,
# so installing the binary alone ships an `emit` whose standard library disappears the
# moment the user leaves this directory.  The layout below is exactly what the
# binary's own manifest lookup searches for: <prefix>/bin/emit finds
# <prefix>/share/emit/emit-libs.scm via its executable-relative candidate (symlinks
# resolved), and that manifest's relative (source ...) paths resolve beside it.
#
# LIBRARY SOURCE is what ships -- an installed door compiles a needed library on
# demand exactly as an in-repo door does.  Compiled artifacts (.ll/.exports) are
# deliberately NOT part of the install contract; that would put artifact staleness on
# the install surface.
#
# Depends only on $(EMIT): no regen, no Chez, so a release tarball installs with just
# LLVM + libgc + make.  Idempotent -- install over the same prefix twice and the tree
# is the same.
# The manifest's (source ...) paths are manifest-relative, so the installed tree has to
# mirror the repo's lib/ layout rather than flatten it -- and that layout now has two
# directories: lib/scheme for the standard libraries and lib/emit for the internal
# substrate (change: scheme-base-partition).  A glob per directory, and the directories are
# created from the same lists, so adding a library to either needs no edit here.
#
# THE SUPPORT FILES ship too (change: installed-emit-completeness, issue #36).  The
# build door needs two files that are neither the binary nor a library --
# tools/llvm-env.sh, which discovers the C toolchain, and src/runtime/runtime.c, which
# is compiled into every delivered executable -- and without them `emit build` was the
# one door that did not work from an install.  tools/log.sh is here because
# llvm-env.sh SOURCES it for its narration: shipping the script alone would install
# one that fails on its first line.
#
# Each lands at its REPO-RELATIVE SUBPATH under $(SHAREDIR), the same mirroring rule
# the lib/ sources follow, so the binary's support-file lookup is one function with no
# per-file path rewriting and a support file added later needs no edit to it.
# Executable bit for the script, 644 for the sources it does not run.
BINDIR   := $(DESTDIR)$(PREFIX)/bin
SHAREDIR := $(DESTDIR)$(PREFIX)/share/emit
LIBDIRS  := lib/scheme lib/emit
SLDS     := $(foreach d,$(LIBDIRS),$(wildcard $(d)/*.sld))
LIBDATA  := lib/scheme/char-data.scm
SUPPORT_EXEC := tools/llvm-env.sh tools/log.sh
SUPPORT_DATA := src/runtime/runtime.c
SUPPORT      := $(SUPPORT_EXEC) $(SUPPORT_DATA)
SUPPORTDIRS  := $(sort $(foreach f,$(SUPPORT),$(dir $(f))))

.PHONY: install
install: $(EMIT)
	@. tools/log.sh; say "install emit -> $(DESTDIR)$(PREFIX)  [prefix $(PREFIX)]"
	@install -d "$(BINDIR)" $(foreach d,$(LIBDIRS),"$(SHAREDIR)/$(d)") \
	  $(foreach d,$(SUPPORTDIRS),"$(SHAREDIR)/$(d)")
	@install -m 755 $(EMIT) "$(BINDIR)/emit"
	@install -m 644 emit-libs.scm "$(SHAREDIR)/emit-libs.scm"
	@$(foreach d,$(LIBDIRS),install -m 644 $(wildcard $(d)/*.sld) "$(SHAREDIR)/$(d)/";)
	@install -m 644 $(LIBDATA) "$(SHAREDIR)/lib/scheme/"
	@$(foreach f,$(SUPPORT_EXEC),install -m 755 $(f) "$(SHAREDIR)/$(f)";)
	@$(foreach f,$(SUPPORT_DATA),install -m 644 $(f) "$(SHAREDIR)/$(f)";)
	@. tools/log.sh; \
	  say "install $(EMIT) -> $(BINDIR)/emit  [$$(bytes $(BINDIR)/emit) bytes]"; \
	  say "install emit-libs.scm + $(words $(SLDS)) library source(s) + $(words $(LIBDATA)) include(s) -> $(SHAREDIR)"; \
	  say "install $(words $(SUPPORT)) support file(s) -> $(SHAREDIR)  [$(SUPPORT)]"

# build/ is a real directory (order-only prerequisite), not a phony target.
build:
	mkdir -p build

# clean removes the binaries and every build/ intermediate, but LEAVES the
# committed bootstrap/*.ll (checked-in inputs; rebuild them with 'make regen').
.PHONY: clean
clean:
	rm -f $(EMIT) $(SCHEMEC) \
	      build/emit.o build/run-boot.o build/runtime-host.o \
	      build/emit-boot build/emit-boot-next \
	      build/schemec build/schemec-next \
	      build/schemec.scm build/embed.scm build/embed-repl.scm \
	      build/prelude-source.scm build/T-*.scm \
	      build/schemec.ll build/schemec.ll.check build/llvm.mk
	@echo "note: committed bootstrap/*.ll are checked-in inputs, left in place"
	@echo "      (rebuild from source with 'make regen')"
