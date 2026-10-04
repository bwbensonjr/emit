# Proposal

## Why

The goal is for Emit to compile the portable R7RS libraries published on snow-fort.org, most
visibly its 60+ SRFI packages, without editing them. Much of the needed surface already ships:
`define-library` with all seven declarations (`include`, `include-ci`,
`include-library-declarations`, and `cond-expand` landed with issue #18). The advertised `emit`
feature identifier also exists. Hybrid resolution already maps `(srfi 1)` to `srfi/1.sld` beneath a
library root. Three gaps remain, and portable library sources hit all three:

- **Import sets are refused.** A portable library routinely writes
  `(import (except (scheme base) member assoc))` or `(import (prefix (srfi 1) s1:))`. Emit rejects
  every `only`/`except`/`prefix`/`rename` by name (`src/core.ss` `check-import-spec`).
- **`(library ⟨name⟩)` feature requirements are refused** (design D8 of
  `library-include-declarations`). Portable packages use the form to pick a native dependency when
  one is installed, for example `(cond-expand ((library (srfi 8)) (import (srfi 8))) (else ...))`.
- **`include` and `cond-expand` work only as library declarations.** R7RS §4.1.7 and §4.2.1 also
  allow them in program and body position, and the `features` procedure is missing. Shared `.scm`
  bodies, and test programs that ship beside a package, use those positions.

Each gap is a compile-time refusal today, so a snow-fort package fails before any of its code is
compiled. Closing them now lets the next step be measured against real packages rather than
guessed.

## What Changes

- **Import sets.** `(import ⟨import set⟩ …)` accepts `only`, `except`, `prefix`, and `rename`,
  nested to any depth, in programs, in `define-library`, and at the REPL. The transform runs in the
  importer over the imported library's existing export table. It applies to runtime exports and
  macro exports alike, and the artifact format does not change. A name an `only`/`except`/`rename`
  mentions that the library does not export is a compile-time error naming the set. The
  "import sets are not supported" diagnostic is removed.
- **A program's explicit `(scheme base)` import set replaces the implicit one.** If a program
  imports `(scheme base)` through an import set, the auto-import does not also bring in the whole
  library, so `(except (scheme base) map)` actually excludes `map`.
- **`(library ⟨name⟩)` is answered.** A requirement is true when the session's library resolver
  can resolve the name, which covers the baked set, manifests, and library roots. The same resolver
  serves `import`, so the answer is the one an `import` of the name would get. Every host asks the
  resolver it already uses. No second copy of the resolution rules is written.
- **A cached library records its `(library …)` answers.** A cached unit is invalid if a library
  it asked about has since become resolvable or unresolvable, as the include-file set already does.
- **Program-level and body-level `include`, `include-ci`, and `cond-expand`.** At a program's top
  level and in any body (lambda, `let`-family, `define` body), these forms splice their forms in
  place, so an included definition is an ordinary definition there. In expression position they
  behave as `begin`. An `import` that arrives at program top level through them is a real import.
  The REPL splices them identically, preserving dev-to-ship fidelity.
- **The `features` procedure** is exported from `(scheme base)` and returns the advertised feature
  list, derived from the single `*advertised-features*` declaration.
- **Feature identifiers.** `srfi-0` is advertised once `cond-expand` is complete in every position.
  Other `srfi-N` identifiers for SRFIs Emit already provides natively are added only where a test
  shows the SRFI's specified behavior. Each addition is recorded in the declaration's comment, as
  the existing absences are.
- **Acceptance against a real package.** A vendored, license-compatible snow-fort SRFI package
  (SRFI 1 is the first candidate) compiles unmodified under a library root and passes a smoke
  program on every compilation path. Any further blockers it exposes are filed as issues rather
  than fixed here.

Not in this change: installing from snow-fort (fetching, unpacking, `package.scm` metadata, a
`snow-chibi --impls=emit` backend), `syntax-case`/procedural macros that some packages need, the
R7RS rule that importing one identifier with two different bindings is an error (precedence stays
as today, see design), and OS/CPU feature identifiers.

## Capabilities

### New Capabilities

None. Every behavior here extends the module surface `module-system` already owns.

### Modified Capabilities

- `module-system`: the whole-module import requirement becomes the import-set surface. `cond-expand`
  gains `(library …)` answering, program and body positions, and `srfi-0`. `include`/`include-ci`
  gain program and body positions. The implicit `(scheme base)` import gives way to an explicit
  import set. `features` is added.
- `artifact-cache`: a disk-compiled library's entry records the `(library …)` answers its
  compilation depended on, and is invalid when any of them changes.

## Impact

- **Compiler core (`make regen` barrier applies):** `src/core.ss` covers import-set resolution
  over export tables, the library-availability side channel, and program-level splicing in
  `collect-imports`. `src/passes/expand.ss` covers body-level and expression-level splicing ahead of
  `add-body-defines`. `src/repl-core.ss` covers the REPL import with a set, top-level splicing, and a
  new host mode for availability answers. `src/prelude.scm` and `src/prelude-surface.scm` cover
  `features`. `src/include-reader.ss` is reused for program-position includes.
- **Hosts:** `src/emit.cpp` answers availability queries from its resolver and records the answers
  in the cache stamp. `src/compile.ss`, the Chez driver, installs a predicate over its own
  resolver. The native and portable cache stamp shape changes, which bumps the stamp version.
- **Emitted IR:** this should be unchanged for every existing program and library, since none uses
  an import set or a program-level splice. `test/module-scaffold-baseline.sha256` must not move.
- **Docs:** the "Scope & limits" section of `docs/MODULES.md` is rewritten. The import-set
  diagnostic in "When you break a rule" is removed.
- **Tests:** new module suites cover import sets, `(library …)`, splicing positions, and the
  vendored SRFI package. The cross-host equivalence suites gain these sources.
