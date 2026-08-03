## Why

`(scheme base)`'s export list is **derived**, not declared: `tools/gen-scheme-base.ss:33-36` and its
portable twin `scheme-base-library-form` (`src/core.ss:143-147`) export every top-level `define` in
`src/prelude.scm`. Of today's 213 exports, **81 are internal helpers** (`%…`, `*…*`, `rd-…`, plus
`chr-cmp`, `ns-digits`, `ns-digits-radix`), and because `(scheme base)` is auto-imported into every
program and REPL session, all 81 are in scope in every user program, unasked (GitHub issue #29). The
public surface therefore grows by accident with each prelude helper: `scheme-io-library` published
ten `%port-*`/`%std*-port` names and `numeric-conformance` fourteen more numeric kernels, neither by
anyone's decision.

Now, because this is cheap before a tag and expensive after one. `homebrew-tap-distribution`
establishes SemVer at `0.1.0`; at that point every one of those 81 names is a published surface a
user program may reference, and the reader helpers are exactly the names #25 (radix prefixes) must
change. To be explicit about what this is *not*: it is not a correctness fix (user-wins shadowing
holds and a library's intra-unit calls resolve internally), and it is not a binary-size fix — the
AOT reachability shake already strips 100% of an unused surface, so this is no substitute for
`docs/PERFORMANCE.md` P8. It is namespace hygiene and API commitment.

## What Changes

- **Declare the surface in one place.** A new flat-core source file `src/prelude-surface.scm`
  defines `*scheme-base-private*` (the names that stay in the library **body** but leave the
  `export` list) and `*scheme-base-unstable*` (exported, but explicitly not API, each with a
  recorded reason). Both derivations of the export list read that one file, so they cannot drift.
- **The export list becomes the prelude's top-level defines in source order minus the private
  set** — 213 → **136 exports** (77 private). Order still comes from `src/prelude.scm`, so the
  declaration file's own arrangement can never move emitted IR.
- **Three documented tiers** for what remains: *R7RS* names; *extension* names Emit adds with no
  R7RS home (`filter`, `fold-left`, `fold-right`, `andmap`, `memp`, `iota`, `list-head`, `void`,
  `read-from-string`, `read-all-from-string`, `port-closed?`, the `hash-table-*` family) — which
  answers the issue's "extensions are indistinguishable from standard names" half; and *unstable*.
- **Two renames retire two of the four unstable names**: `%with-handler` →
  `with-exception-handler` (a genuine R7RS §6.11 name with exactly these semantics — the prelude
  already promises it at `src/prelude.scm:566-568`) and `%with-parameters` → `with-parameters`
  (an extension). Only `rd-skip-ws` and `rd-token-end` remain unstable, for the REPL's
  input-completeness probe, which deliberately shares the reader's lexeme helpers.
- **A new Chez-free guard**, `test/scheme-base-surface-check.sh` in `run-all-tests.sh`, plus
  assertions in the generator: a prelude definition that is neither published nor declared private
  fails the default suite, so adding a helper forces a visibility decision instead of defaulting to
  public. `lib/scheme/base.sld`'s export list is reformatted one name per line so any surface change
  is a reviewable `+1`/`-1` diff.
- **BREAKING** (deliberately, pre-tag): a program that referenced a prelude internal such as
  `rd-atom` or `%map1` through the auto-import now gets an unbound variable.

## Capabilities

### New Capabilities

None. This change adds no capability; it constrains an existing one.

### Modified Capabilities

- `module-system`: the requirement that `(scheme base)` "exports all of them" becomes a declared
  surface, with a new requirement that the surface is declared rather than derived and consistent
  across every derivation, and a new requirement that a name mentioned by an exported macro
  template must be exported under exactly that spelling.
- `dynamic-extent`: `with-exception-handler` becomes a specified, exported procedure (the handler
  installer that `guard` is built on), and `parameterize`'s helper is the named export
  `with-parameters`.

## Impact

- **Source**: new `src/prelude-surface.scm`, threaded into the flat-core lists in
  `tools/regen.sh` (`CORE_FLAT`) and `src/compile.ss` (the `include` block **and**
  `compiler-source-files`, which bumps the compiler stamp and invalidates cached artifacts);
  the filter in `src/core.ss:143-147`; the generator `tools/gen-scheme-base.ss`; the two renames in
  `src/prelude.scm` (definition + macro template, each).
- **Generated/committed artifacts**: `lib/scheme/base.sld` regenerated; `make regen` re-commits
  `bootstrap/{embed,embed-repl,schemec}.ll`, each of which loses 77
  `@"scheme.base:…" = external global i64` declarations per program module
  (`src/emit.ss:1599-1601`); `bootstrap/scheme.base.ll` is byte-identical until the renames commit
  (library emission is export-agnostic, `src/emit.ss:1619-1675`).
- **Tests**: full re-record of `test/module-scaffold-baseline.sha256` (80 demos) with the
  before/after evidence its header protocol requires; new
  `test/scheme-base-surface-check.sh`; new cases in `test/prelude-base-run-tests.sh` (the issue's
  repro) and `test/dynamic-extent-tests.sh` (`with-exception-handler`).
- **Docs**: `docs/MODULES.md`'s `(scheme base)` section gains the three tiers; `docs/COMPLEXITY.md`
  refreshed for the new file.
- **Unaffected, and asserted so**: shipped binary sizes and the shaken AOT output (the strip is
  reference-driven, `src/compile.ss:563-568`); `(scheme inexact)`, which imports nothing.
- **Non-goals**: an `(emit extras)` library for the extension tier; the missing-R7RS-names audit
  (numerics are #27) and the nine names Emit ships in `(scheme base)` that R7RS puts in
  `(scheme cxr)`/`(scheme read)`/`(scheme file)`, recorded as debt; hygienically resolving prelude
  macro templates against library-internal bindings, which would retire the unstable tier
  altogether; baking `lib/scheme/base.sld` instead of `src/prelude.scm` (design D6).
