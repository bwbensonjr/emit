## Why

A library's source is one file, and R7RS says it need not be. `define-library` recognizes exactly
three declarations — `export`, `import`, `begin` — so the four §5.6.1 declarations that let a
library be *assembled* rather than *typed in one place* are unavailable: `include`, `include-ci`,
`include-library-declarations`, and `cond-expand`. Since `module-frontend-diagnostics` each is
rejected by name ("an R7RS library declaration this stage does not support"), which made deferring
them honest but did not make them work. This change implements all four and closes issue #18.

Two reasons it is now, and not later:

- **The blocker is gone.** `scheme-io-library` landed `%read-file` (`rt_read_file`), so a file can
  be read from compiled Scheme. What kept `include` out was never the reading — it was that
  `src/core.ss` performs no I/O by design and the Chez driver cannot *evaluate* `%`-ops. Both are
  satisfiable at once by the shape `dump` already uses: the **door installs a reader**, the core
  splices what it is handed. `src/dump.ss` is the precedent — a `%`-op-using file that rides the
  Chez-free assembly only, while the Chez driver supplies its own independent implementation.
- **It is the last thing standing between the two derivations of `(scheme base)`.** Exploration
  `library-sources-and-artifacts.md` Finding 4: once a library can `include`, "the source" is no
  longer one file, so what gets baked must be the post-splice form. Baking `lib/scheme/base.sld`
  (#31) before the splicer exists forces that question open a second time.

`cond-expand` rides along rather than landing first (the sequence in that exploration had it as its
own step ②) because the two halves share one mechanism: `include-library-declarations` and
`cond-expand` both splice at the *declaration* level, so the recursive declaration walker is written
once instead of twice, and the second change would have rewritten the first one's loop.

## What Changes

- **`(include "f" …)` and `(include-ci "f" …)` splice a file's forms into the library body**, in
  order, as if written in a `begin` declaration at that point. Multiple filenames per declaration
  are read left to right. `include-ci` case-folds the forms it reads.
- **`(include-library-declarations "f" …)` splices a file's contents as library *declarations***, so
  a shared `export` list or import block can live in its own file. Included declarations may
  themselves be any declaration, including a further `include`.
- **`(cond-expand ⟨clause⟩ …)` selects library declarations by feature requirement**, supporting
  feature identifiers, `and`, `or`, `not`, and `else`, and splicing the selected clause's
  declarations. The advertised feature list is a **declaration in one file**, the way the
  `(scheme base)` surface is (`src/prelude-surface.scm`), not something derived per door.
- **A `(library ⟨name⟩)` feature requirement is rejected by name.** Answering it means asking
  whether a library is *available*, which is manifest resolution the parser does not have; it takes
  over the "recognized R7RS form this stage does not support" wording the four declarations are
  vacating. Everything else `cond-expand` accepts.
- **Filenames resolve relative to the directory of the file that named them**, matching the rule the
  manifest already uses for a library's `(source …)`. A source with no path — stdin — resolves
  against the current directory.
- **A door installs the reader; the core still performs no I/O.** `src/core.ss` calls an installed
  `path → forms` procedure. The Chez driver installs one over Chez ports; the Chez-free doors
  install one over `%read-file` from a new `src/include-reader.ss` that rides `CORE_FLAT` and is
  excluded from the driver's `(include …)` block — exactly as `src/dump.ss` is.
- **The artifact cache learns about included files.** A unit's `.stamp` sidecar records the files it
  included, and `artifacts-fresh?` requires the artifact to be newer than every one of them, so
  editing an included file rebuilds the library that included it.
- **The "recognized but unsupported declaration" arm retires.** With all seven R7RS declarations
  implemented, `*unsupported-library-declarations*` has no members; an unrecognized declaration is
  reported, as now, as not being a library declaration at all.
- Errors are named and recoverable, in the style the front end now holds itself to: a file that
  cannot be read names the path and the declaration that named it; a cyclic include names the cycle;
  a malformed `cond-expand` clause names the clause.

**Not in this change**: `include` and `cond-expand` as *program* / body forms (R7RS §4.1.7, §4.2.1) —
same splicer, different position, and no issue asks for it yet; `cond-expand` at the REPL prompt;
target-derived feature identifiers (`darwin`, `x86-64`, `lp64`, …), which would be a lie the moment
cross-compilation exists and are better derived from the target header when it does.

## Capabilities

### New Capabilities

None. This completes a capability that already exists rather than introducing one.

### Modified Capabilities

- `module-system`: `define-library` accepts all seven R7RS library declarations. The requirement
  that four of them be "rejected by name as unsupported" is replaced by requirements describing what
  they now do — file inclusion at body and declaration level, and feature-based declaration
  selection — plus the resolution rule for a filename and the errors for a missing file and a cycle.
- `compiler-embedding`: a door-installed source reader joins the dump side-channel as a named
  property of the embedding contract — the core reads no files, so a door that installs no reader
  gets a diagnostic naming the declaration rather than a silent failure.

## Impact

- `src/core.ss` — `parse-define-library` gains a declaration-expansion pre-pass; the reader
  side-channel and the case-folding walk live here; `reject-library-declaration` loses one arm.
- `src/include-reader.ss` (**new**) — the `%read-file`-based reader for the Chez-free doors; rides
  `CORE_FLAT` in `tools/regen.sh`, excluded from `src/compile.ss`'s `(include …)` block.
- `src/repl-core.ss`, `src/emit.cpp` — one new mode that tells the compiler which directory the
  source it is about to compile came from, set by the run, build, lib, and REPL doors before modes
  4, 7, 11, and 12. Mode 12 (a source's imports) must splice too: an included declarations file can
  contribute an `import`, and the run door's lazy closure walk reads its answer.
- `src/compile.ss` — the Chez-side reader, and `artifacts-fresh?` / `rebuild-reason` / the `.stamp`
  writer for the include list.
- `tools/regen.sh` — `CORE_FLAT` gains the new file. **`make regen` is required**: `src/core.ss` and
  `src/repl-core.ss` both change.
- `test/library-body-declarations-tests.sh` — its negative cases currently *assert* the
  unsupported-declaration message for all four declarations and will fail until they are replaced.
- `test/library-include-tests.sh` (**new**) — the four declarations across every door, plus the
  negative cases; wired into `run-all-tests.sh`.
- `docs/MODULES.md`, `docs/PROJECTS.md` — the scope-and-limits list and the "When you break a rule"
  table both name these four declarations as unsupported.
- Byte-identity guards (`test/self-emit-equiv.sh`, `test/prelude-base-run-tests.sh`,
  `test/module-scaffold-baseline.sha256`): no library the repo ships uses these declarations yet, so
  emitted IR should not move. The baseline is re-recorded only if it does, with the delta explained.
