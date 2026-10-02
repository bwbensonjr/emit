# Design

## Context

See `proposal.md` for motivation. `_llvm_discover_config` currently handles three precedence tiers: unversioned `llvm-config` on `PATH`, version-suffixed commands on `PATH` in descending major order, and a final set of known-prefix paths. Only the final tier is defective: `sort -V | tail -n1` compares complete paths, so Homebrew's `llvm@22` spelling outranks the unversioned `llvm` symlink regardless of the versions behind them.

The shared script feeds the Makefile, shell drivers, and Chez driver. The selection must therefore be fixed there without adding a second discovery implementation. The script is portable Bash and already relies on version sorting.

## Goals / Non-Goals

**Goals:**

- Rank known-prefix fallback candidates by the value returned from `llvm-config --version`.
- Keep candidate enumeration and selection deterministic and testable with temporary fake toolchains.
- Preserve all precedence and override behavior outside the known-prefix fallback tier.

**Non-Goals:**

- Changing the LLVM minimum version or turning its warning into an error.
- Preferring fallback candidates over explicit overrides or commands found on `PATH`.
- Changing libgc discovery, compiler flags, or the Makefile cache lifecycle.

## Decisions

### Rank candidates by reported version

For each executable `llvm-config` found in a known prefix, discovery will query `--version`, associate that value with the candidate path, and choose the greatest version using version-aware comparison. Path ordering will be used only as a deterministic tie-breaker when reported versions are equal.

This uses the toolchain's own version authority and works for unversioned symlinks, versioned formula names, distribution directories, and custom prefix layouts. Merely preferring Homebrew's unversioned formula was rejected because it would fix the observed layout without fixing the general ordering defect.

Candidates that are not executable or do not return a nonempty version will be ignored. If no valid candidate remains, discovery will retain its existing no-toolchain failure.

### Preserve the existing precedence tiers

The candidate ranking helper will be called only after explicit overrides, unversioned `llvm-config` on `PATH`, and version-suffixed commands on `PATH` have had their existing opportunity to win. This prevents the bug fix from becoming a broader policy change.

### Exercise selection with fixture toolchains

Regression coverage will use temporary fake `llvm-config` executables that report controlled versions, allowing the test to model an unversioned LLVM 23 candidate beside an `llvm@22` candidate without depending on the developer machine's installed kegs. Candidate enumeration and ranking will be separated enough for the test to provide those paths while production still supplies the current known-prefix patterns.

The test will also cover invalid candidates and confirm that an already-resolved higher-precedence candidate bypasses fallback ranking. It will be added to the Chez-free default suite because toolchain discovery itself does not require Chez.

## Risks / Trade-offs

- **[A candidate process is executed to learn its version]** → The known-prefix set is small, and this happens only after faster override and `PATH` checks fail.
- **[Vendor or development version suffixes compare unexpectedly]** → Use the existing version-aware sort behavior and include patch releases in fixtures; the supported LLVM releases report conventional numeric versions.
- **[A test hook becomes an accidental user interface]** → Keep fixture injection private to the selection helper rather than adding a documented environment override.

## Migration Plan

No data or artifact migration is required. Rebuilding after the change regenerates `build/llvm.mk` through its existing dependency on `tools/llvm-env.sh`; rollback consists of reverting the script and tests. The change does not touch compiler sources or committed bootstrap IR, so `make regen` is not required.
