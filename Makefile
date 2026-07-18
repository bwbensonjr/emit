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

# Committed, host-agnostic stage-0 compiler IR (checked-in INPUTS; design D3/D4).
SCHEMEC_LL     := bootstrap/schemec.ll
EMBED_LL       := bootstrap/embed.ll
EMBED_REPL_LL  := bootstrap/embed-repl.ll
# The prelude re-homed as (scheme base) (change: compiler-bootstrap-rehome): the
# compiler binaries no longer inline the prelude -- they link this one committed
# library IR, which their own re-homed IR references as scheme.base:* externals.
SCHEME_BASE_LL := bootstrap/scheme.base.ll

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
# (-rdynamic) so JIT'd code resolves them here.  It links $(SCHEME_BASE_LL) too: the
# compiler is re-homed on (scheme base) (change: compiler-bootstrap-rehome), so its IR
# references scheme.base:* externals resolved against this one committed library,
# initialized once via its __init guard.  The run/repl doors were formerly the separate
# build/scheme-run and build/repl-host binaries, merged here; build/lib forks clang.
$(EMIT): build/emit.o build/runtime-host.o $(EMBED_REPL_LL) $(SCHEME_BASE_LL) Makefile
	$(CXX) build/emit.o build/runtime-host.o $(EMBED_REPL_LL) $(SCHEME_BASE_LL) \
	  -rdynamic $(LDFLAGS) -L$(GC_LIB) -lgc -o $@
	@. tools/log.sh; say "link $(EMBED_REPL_LL) + $(SCHEME_BASE_LL) -> $@  [$$(bytes $@) bytes]"

# Batch text->IR filter compiler: links the committed schemec IR + (scheme base)
# with the runtime's RT_FILTER_MAIN (so the program's output is exactly the emitted IR).
$(SCHEMEC): $(SCHEMEC_LL) $(SCHEME_BASE_LL) src/runtime/runtime.c Makefile | build
	$(CC) -O2 -Wno-override-module -DRT_FILTER_MAIN -I$(GC_INC) -L$(GC_LIB) \
	  src/runtime/runtime.c $(SCHEMEC_LL) $(SCHEME_BASE_LL) -lgc -o $@
	@. tools/log.sh; say "link $(SCHEMEC_LL) + $(SCHEME_BASE_LL) -> $@  [$$(bytes $@) bytes]"

# --- objects ---------------------------------------------------------------
# Runtime compiled as C without its standalone main (the host supplies one).
build/runtime-host.o: src/runtime/runtime.c Makefile | build
	$(CC) -std=c11 -O2 -I$(GC_INC) -DRT_NO_MAIN -c $< -o $@

# Unified emit front-end, compiled as C++ against the LLVM headers.
build/emit.o: src/emit.cpp Makefile | build
	$(CXX) $(CXXFLAGS) -c $< -o $@

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
