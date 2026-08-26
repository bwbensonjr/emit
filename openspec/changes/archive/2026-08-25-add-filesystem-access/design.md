## Context

See `proposal.md` for motivation and `specs/filesystem-access/spec.md` for the observable contract.

Emit currently implements file ports, `file-exists?`, and `delete-file` with small C runtime entry points declared in the compiler's primitive table and wrapped by Scheme procedures. The same `src/runtime/runtime.c` is linked into the unified development host and every AOT executable, which is the existing seam for dev-to-ship fidelity. Ordinary libraries are explicit entries in `emit-libs.scm`, compiled only when imported, installed from `lib/`, and resolved through the default-manifest inheritance path.

Directory enumeration and final-component symbolic-link inspection require host APIs outside ISO C and R7RS-small. Emit's supported build and execution paths are already POSIX-oriented, and the C++ host already uses filesystem metadata and atomic rename internally; the missing piece is a narrow Scheme-visible runtime surface.

Adding compiler primitive declarations changes `src/emit.ss` and therefore crosses the project's regeneration barrier. Runtime and library work can be exercised through the source-driven Chez compiler before regenerating once at the end.

## Goals / Non-Goals

**Goals:**

- Keep all filesystem policy—sorting, recursion, hidden-directory rules, temporary-name selection, and when replacement is allowed—in the importing application.
- Deliver catchable, kinded file errors instead of partial results, silent failures, or uncatchable host faults.
- Keep the library ordinary and non-baked so Scheme code and metadata are included only when explicitly imported.
- Preserve the exact distinction Pitch needs between following a linked directory and detecting that the final component is a link.
- Keep unused AOT binaries small by allowing LTO to discard unreferenced runtime entry points.

**Non-Goals:**

- A general FFI, path datatype, recursive walker, globbing API, directory mutation API, permission API, or filesystem abstraction framework.
- Expanding or changing the standard `(scheme file)` library.
- Defining directory enumeration order; deterministic consumers sort the names themselves.
- Cross-filesystem copying, transaction semantics beyond one host rename, durability across power loss, or advisory locking.
- Supporting host filenames that cannot be represented by Emit strings or changing the existing string-to-host-path encoding policy.

## Decisions

### D1. Ship a handwritten ordinary `(emit filesystem)` library

Add `lib/emit/filesystem.sld`, importing `(scheme base)` and exporting only the four public procedures. Register it explicitly in `emit-libs.scm`; the existing `lib/emit/*.sld` install rule then ships it without a special install path. It is not added to `*prelude-libraries*`, the baked modules, or `(scheme file)`.

The Scheme layer validates runtime status results, returns the specified Scheme values, and constructs failures with the existing private kinded-error primitive so `file-error?` recognizes them. Messages name the public operation and retain the supplied path or paths as irritants. Keeping this translation in Scheme matches the existing file-operation pattern and keeps OS entry points concerned only with tags, host calls, and value construction.

Alternatives considered:

- Adding the procedures to `(scheme file)` would claim a non-standard R7RS surface and make accidental reliance harder to see.
- Generating another prelude partition from `src/prelude.scm` would enlarge the bootstrap-facing source and partition machinery for a library the compiler never needs.
- Making the C runtime invoke Scheme exception handlers directly would duplicate the existing return-status-to-kinded-error boundary.

### D2. Expose four private raw primitives with unambiguous status values

Extend the compiler primitive table and runtime declarations with raw operations corresponding one-to-one with the public API:

- directory enumeration returns a proper list of entry strings on success and `#f` on failure;
- each classification operation returns an internal three-way status: true, false, or host error;
- replacement returns success or failure.

The public predicates translate only their two ordinary states to booleans; the third state becomes a file error. This distinction prevents a permission or I/O failure from silently looking like “not a directory” while still making missing paths ordinary negative predicate results. The raw operations remain compiler-known private names rather than exports of any public library.

Alternative considered: returning only booleans from `stat`/`lstat` would be smaller, but would make genuine filesystem failures observationally identical to a missing or differently typed path, contrary to the error contract.

### D3. Implement the host edge with POSIX directory and metadata operations

Use `opendir`/`readdir`/`closedir` for immediate enumeration, `stat` for directory classification, and `lstat` for final-component symbolic-link classification. Enumeration filters only the synthetic `.` and `..` records and returns each remaining `d_name` as an Emit string; it neither prefixes nor sorts names. `errno` is cleared and checked around `readdir`, so a mid-enumeration error discards the partial list and reports failure after closing the directory stream.

For `stat` and `lstat`, `ENOENT` and `ENOTDIR` map to the ordinary false state. Other failures map to the host-error state. `stat` follows the final link by definition; `lstat` does not. A dangling final symlink is therefore true for `file-symbolic-link?` and false for `file-directory?`.

Runtime code checks that every path argument is an Emit string before calling the host. It constructs result lists with the existing garbage-collected pair and string representation, so there is no new heap type or ownership protocol.

Alternatives considered:

- Deriving classification from directory enumeration cannot distinguish non-directories, dangling links, permission failures, or a link to a directory reliably.
- Shelling out to `find`, `ls`, `test`, or `mv` introduces quoting, locale, subprocess, and executable-discovery behavior and violates standalone self-containment.

### D4. Implement replacement as a direct host `rename`

The replacement primitive calls the host `rename(source, destination)` exactly once and never deletes, truncates, or opens the destination first. On supported same-filesystem paths, this supplies the atomic name transition Pitch's same-directory temporary-file protocol requires. A zero return maps to success; any failure maps to a Scheme file error through D1.

This design deliberately does not retry by copying or by unlinking the destination. Such fallbacks would either lose atomicity or create a destination-absent interval, turning a visible failure into possible source corruption.

Alternative considered: `delete-file` followed by rename is portable-looking but destroys both atomic replacement and the failure-preserves-destination guarantee.

### D5. Verify the real host rather than mocking this layer

Add a focused shell-driven suite that creates an isolated temporary tree containing ordinary files, a directory, a symlink to that directory, a dangling symlink, and replacement paths. Run imported-library probes through `emit run` and `emit build`, compare normalized Scheme results, inspect the resulting paths and bytes, and exercise catchable failures. The suite also checks the exact export surface and confirms that the names remain unbound without an explicit import.

Extend installed-layout coverage to import the library outside the checkout and execute a small run/AOT probe. Record stripped standalone binary sizes with and without the import; LTO should remove the new runtime entry points from a program that does not reference them, while the importing binary pays only the required code cost.

Atomicity is established structurally by the single-`rename` implementation and functionally by replacement/failure tests. A timing-based attempt to catch a transient missing destination would be nondeterministic and is not used as proof.

## Risks / Trade-offs

- **[POSIX directory and symlink APIs narrow host portability]** → Keep them isolated in `runtime.c`, use APIs already consistent with Emit's supported hosts, and fail at compile time on an unsupported host rather than silently weakening semantics.
- **[A `readdir` failure could leak a partial result]** → Check `errno`, close on every path, and return only after complete enumeration; add a focused failure-path test where the host permits one to be induced reliably.
- **[Error mapping accidentally treats a real failure as `#f`]** → Use the explicit three-state classification protocol and test missing, ordinary, linked, dangling, and inaccessible paths where portable.
- **[Replacement behavior differs for unusual path kinds or filesystems]** → Specify and test the same-filesystem regular-file case Pitch uses; propagate all unsupported cases as file errors without fallback.
- **[New runtime symbols increase executables that never import the library]** → Keep the Scheme unit non-baked, rely on the existing AOT LTO link, and record stripped with/without-import measurements before completion.
- **[Compiler-source edits leave mixed bootstrap IR]** → Finish all `src/emit.ss` edits and source-driven checks before one uninterrupted `make regen`, then make no compiler-source edits until both full suites complete.

## Migration Plan

1. Add focused failing filesystem probes and the ordinary library wrapper, then implement and iterate on the runtime/compiler seam with `chez --libdirs src --script src/compile.ss` and targeted suites.
2. Register and document the library, extend install and size coverage, and finish every compiler-source edit.
3. Run `make regen` once to convergence, then run `./run-all-tests.sh` and the independent `./run-dev-tests.sh` suites without further compiler-source edits.
4. After commit, run the trust check against committed bootstrap IR as required by the project workflow.

Rollback is a normal revert of the library, primitive declarations, runtime functions, tests, manifest entry, documentation, and regenerated bootstrap artifacts. There is no persisted data or artifact-format migration; cached artifacts for the removed library may be discarded.

## Implementation Evidence

The source-driven AOT tree-shaking gate measured equivalent probes at 51,464 bytes stripped without `(emit filesystem)` and 51,688 bytes with `file-directory?`, a 224-byte pay-for-use cost. The non-importing executable contains neither an `emit.filesystem:*` symbol nor any `rt_filesystem_*` symbol; the importing closure contains the pruned filesystem unit and its required classification edge. Unstripped sizes were 51,936 and 53,696 bytes respectively.
