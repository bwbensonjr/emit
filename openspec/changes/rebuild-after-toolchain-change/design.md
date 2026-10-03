# Design

## Context

See `proposal.md` for the reproduced failure. The Make graph currently materializes discovery in
`build/llvm.mk`, but that included file is refreshed only when its scripts change. Native targets
therefore track source timestamps while omitting external toolchain state. `build/emit.o` also bakes
`PREFIX`, `CC`, `GC_INC`, and `GC_LIB`, yet none of those effective values is represented by a file
prerequisite. The bootstrap `.ll` files are committed inputs and must remain outside this mechanism.

The build has two distinct configuration moments:

1. discovery chooses defaults and writes Make variables;
2. environment and command-line variables may override those defaults for the actual recipe.

Both moments must be represented or a stamp can claim that a target is current while its recipe
would now use different values.

## Goals / Non-Goals

**Goals:**

- Detect external discovery changes on the next ordinary `make` or `make install` invocation.
- Track the effective values that alter native compilation, linking, or compiled-in defaults.
- Preserve incremental no-op builds when discovery and overrides resolve identically.
- Keep regeneration separate: this change rebuilds native host artifacts, never bootstrap IR.

**Non-Goals:**

- Keeping an already-installed binary working after its dynamic LLVM dependency is replaced; the
  user must rerun `make install`, and a package manager must rebuild its dependent package.
- Removing obsolete files from an installation prefix.
- Designing Homebrew or another distribution channel.
- Changing toolchain precedence, supported LLVM versions, or cache invalidation.

## Decisions

### Refresh discovery by content, not by script timestamp alone

The build will run the existing discovery layer when Make evaluates the generated toolchain include.
It will write a candidate file and replace the included file only when the content differs. A real
change therefore restarts Make with the new variables, while an identical result preserves the
file's timestamp and reaches a stable no-op build.

This keeps discovery single-sourced in `tools/llvm-env.sh`. Always overwriting `build/llvm.mk` was
rejected because an included makefile whose timestamp changes on every invocation can cause restarts
and makes every downstream build appear dirty. Depending only on the discovery scripts is the
current defect: it cannot observe a package-manager upgrade at an unchanged path.

### Record the effective native recipe configuration in a content-sensitive prerequisite

After Make applies command-line and environment precedence, a generated configuration signature
will record the values that can change native recipes or baked defaults. At minimum these are
`CC`, `CXX`, `LLVM_CONFIG`, `GC_INC`, `GC_LIB`, `CXXFLAGS`, `LDFLAGS`, and `PREFIX`; the final list
must be derived from every native recipe rather than maintained from memory. The file is replaced
only when its serialized content changes.

Configuration-sensitive objects and binaries will depend on that signature. A changed signature
therefore invalidates the normal graph before an install copies anything. A single signature is
preferred initially over several narrowly scoped stamps: these objects are small relative to a
self-compile, and one auditable dependency is less likely to omit a value. If unnecessary native
rebuild cost becomes measurable, the signature can later be split without changing the contract.

Using only `llvm-config --version` was rejected because two installations can report the same
version while resolving different paths or flags. Hashing the existing binary was rejected because
it detects the mismatch only after the build has already made the wrong up-to-date decision.

### Keep install declarative

`install` will continue to depend on `build/emit`; it will not run `make clean`, use a forced rebuild,
or contain a second toolchain check. Once configuration is a real prerequisite, the ordinary graph
is sufficient for both `make` and `make install` and retains incremental behavior.

`PREFIX` belongs in the signature because it is compiled into `emit.o`. `DESTDIR` does not: it is a
copy-time staging root and deliberately must not alter the binary. This also turns the existing
installed-layout test's stated PREFIX-rebuild assumption into an enforced property.

### Test invalidation separately from LLVM compatibility

Focused tests will use controlled discovery/configuration inputs to prove four graph transitions:
unchanged configuration is a no-op; a discovered toolchain identity change rebuilds; a command-line
override or `PREFIX` change rebuilds; and `DESTDIR` alone does not change compiled configuration.
The installed-layout suite will assert the installed binary's effective prefix rather than relying
only on executable-relative lookup, then run the installed REPL from outside the checkout.

Tests should not require two real LLVM majors. The defect is failure to represent configuration in
the graph; compatibility between any particular pair of LLVM releases remains covered by the real
build and compiler tests.

## Risks / Trade-offs

- **[Discovery now runs during every Make invocation]** -> Keep it concise and update generated
  files only on content change; measure if it becomes visible beside normal Make startup.
- **[A recipe-affecting variable is omitted from the signature]** -> Derive and review the list
  against every native recipe, and include an override-driven regression test.
- **[Generated-include refresh loops or behaves differently across Make versions]** -> Exercise the
  no-change case with macOS Make 3.81 and current GNU Make, and require one invocation to converge.
- **[A broad signature rebuilds more native files than strictly necessary]** -> Accept the small,
  bounded cost for correctness; bootstrap self-compilation remains untouched.
- **[The fix is mistaken for automatic repair of existing installs]** -> Document that one repaired
  `make install` invocation is still required after upgrading the toolchain.

## Migration Plan

Land the build-graph change and focused tests, then run the normal non-regeneration suites. No
`make regen` barrier is required unless implementation unexpectedly touches a compiler-source file.
Users with an installation made before this change repair it by rebuilding the checkout once and
rerunning `make install PREFIX=<their-prefix>`. Rollback is a normal revert of the Make/test changes;
no installed or cached data format changes.
