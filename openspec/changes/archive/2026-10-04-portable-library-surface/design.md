# Design

## Context

See proposal.md for the motivation. The machinery this change extends:

- **Declaration splicing.** `library-include-declarations` (archived 2026-08-07, issue #18) expands
  `include`, `include-ci`, `include-library-declarations`, and `cond-expand` away in one recursive
  pre-pass, `expand-library-declarations` in `src/core.ss`, before `parse-define-library` sees three
  declaration kinds (its D1). Files arrive through the host-installed `*include-reader*` side
  channel (its D2). That reader is `src/include-reader.ss` in the binary and `driver-include-reader`
  in `src/compile.ss`. Features are the single `*advertised-features*` list (its D7). Its D8 refused
  `(library …)` because the parser cannot see the resolver.
- **Import shape.** `collect-imports` and `parse-define-library` return import specs that are
  assumed to be library names. `check-import-spec` rejects import sets so they are never misread as
  names (`module-frontend-diagnostics`).
- **Export tables.** An export table is `(NAME runtime-rows call-rows [ct-half])` (`src/core.ss`,
  `import-tables->env-alist` and the functions after it). Runtime rows are `(external . mangled)`.
  Call rows are keyed by external name and looked up in the runtime rows. Macro entries in the ct-half
  are keyed by the external keyword, and private macros carried alongside them use unit-qualified
  keywords.
- **Prior art on import sets.** `openspec/explorations/namespace-model.md` ("Imports are a
  compile-time name-set transform") and `modules-and-embedding.md` (the import-set row of its
  surface table) already decide that import sets are pure transforms over an imported `.exports`.
  This design adopts that decision and works out the details.
- **Implicit `(scheme base)`.** A program and the REPL auto-import `(scheme base)`. A library must
  name it (`src/core.ss` around line 322).
- **Body expansion.** The expander (`src/passes/expand.ss`) collects a body's internal definitions
  with `add-body-defines` *before* expanding any body form. `collect-toplevel` (`src/parse.ss`) does
  not splice a top-level `begin`.

## Goals / Non-Goals

**Goals:**

- No library artifact (`.ll`, `.exports`) changes shape or bytes. Import sets live entirely in the
  importer.
- One answer per question across hosts. That covers import-set bindings, `(library …)`
  availability, feature tests, and splice results, and must hold for the Chez driver, `emit run`,
  `emit build`, `emit lib`, and `emit repl` alike.
- Emitted IR for every existing test program and library stays byte-identical
  (`test/module-scaffold-baseline.sha256` does not move).

**Non-Goals:**

- R7RS's "same identifier imported with two bindings is an error". See D5.
- Splicing a top-level `begin` in a program. It is unchanged, and a `cond-expand` clause splices
  its forms directly rather than through `begin`.
- `include` reached through a macro *template* resolving relative to the template's library. See
  D9.
- Fetching or installing snow-fort packages.

## Decisions

### D1: An import spec is parsed once into (library-name, transform)

A new core function turns an import set into its innermost library name and a transform, a small
list of `only`/`except`/`prefix`/`rename` steps. It also validates the shape, so a malformed set is
an error naming the set and is never misread as a library name. `collect-imports` and
`parse-define-library` keep returning *specs*. Every consumer that needs a name, including the
imports query (mode 12), the closure walk, and the manifest and root resolution, goes through one
accessor. `check-import-spec` becomes this validator. The function is used by every path, so its
diagnostic wording stays path-independent, which was `module-frontend-diagnostics` D5.

*Alternative rejected:* resolving sets in each host before calling the core. That would put three
copies of the R7RS rule in Scheme, the Chez driver, and C++.

### D2: The transform rewrites the table, not the program

Applying a transform produces a *derived* export table, and every downstream function consumes it
exactly as it would consume a real one. Those functions are `import-tables->env-alist`,
`-macro-env`, `-call-alist`, and `-macro-keywords`.

- Runtime rows: filter or rename the external name. The mangled target is untouched, so a call
  still lowers to the same external global, and tree-shaking still keys on mangled names.
- Call rows: rename and filter in lockstep with the runtime rows, because `import-tables->call-alist`
  looks a call row up by external name.
- Macro entries: the **visible** keyword is renamed or hidden. Every entry under a unit-qualified
  keyword is kept whatever the set says. No extra installation is needed for a sibling reference:
  `resolve-exported-macros` already rewrites every macro a template mentions, public or private,
  to a unit-qualified keyword and ships an entry under it. So a kept macro written on top of a
  hidden one still expands. (Implementation found this; the first draft of this design planned a
  re-install that turned out to be redundant.) Own-refs and foreign-refs are mangled names and pass
  through unchanged.
- **Universal names.** The primitives the compiler integrates (`car`, `+`) and the core syntactic
  keywords (`if`, `define`) have no row in `(scheme base)`'s table. They are visible in every unit.
  A set over an R7RS `(scheme …)` library *accepts* them as published names, so
  `(only (scheme base) define car)` compiles, but it cannot hide or rename them. That is the limit
  the spec states, and the missing aliasing is issue #119.

This is the "pure name-set transform" that `namespace-model.md` describes. It emits no aliases or
code. An `only` or `except` that names an absent export is an error raised here, naming the set.

*Alternative rejected:* binding renamed names as importer-side aliases (`(define m:greet greet)`).
That emits code and storage for a compile-time fact, breaks direct cross-unit calls, and turns
macros into a separate problem.

### D3: An explicit `(scheme base)` set replaces the implicit view

If a program's specs include a set whose innermost name is `(scheme base)`, the implicit import
contributes linking and initialization but **no bindings**. Only the explicit set's view is in
scope. A bare `(import (scheme base))` is detected and treated as the implicit import, so existing
programs are untouched. The derived-form macro set follows the same rule, because derived forms are
`(scheme base)` macro exports. `(except (scheme base) when)` therefore really removes `when`.

### D4: The REPL import mode takes a spec, not a name

The REPL's import entry point receives the whole spec. It resolves and initializes the library by
name as it does today (`interactive-repl` registration rules are unchanged), then merges the
*derived* table from D2 into the session scope. Re-importing the same library through a different
set adds the newly visible names, which matches how successive REPL imports already accumulate.

### D5: Overlap precedence stays as it is, written down rather than changed

Two imports that bind one name do not produce an error. The rule in effect today, the order in
which `import-tables->env-alist` and the macro environment are assembled, is identified by a test
and documented in `docs/MODULES.md`. A definition in the importing unit still wins. R7RS makes the
overlap an error, but enforcing that could break existing programs and needs its own audit. That
is issue #118. The rule observed is first-import-wins. Import sets *reduce* overlaps, so this
change makes the deferred error less likely to bite, not more.

### D6: `(library …)` is answered by the host's resolver through a query/answer loop

The core keeps a **library-availability table** of the form `name → #t | #f`, and a second
side channel next to `*include-reader*`:

- **Chez driver:** installs a predicate over its own resolver, which answers directly.
- **Binary (`emit run`, `emit build`, `emit lib`, `emit repl`):** the resolver is C++
  (`src/emit.cpp`), and the core cannot call into it synchronously. When a requirement misses the
  table, the core records the name as *pending* and continues as though the answer were `#f`. The
  imports query (mode 12, which already runs the declaration pre-pass per
  `library-include-declarations` D11) then returns the pending names instead of an import list. The
  host resolves each name with the resolver it uses for `import`, submits the answers through a new
  mode, and asks again. This repeats until nothing is pending, which is guaranteed because each
  round answers at least one new name, and the set of names a source can mention is finite.
  Compilation modes run only after the query settles. A miss during compilation is therefore an
  internal error, never a silent `#f`.

Each positive answer goes through the same memoized resolution `import` uses (hybrid resolution's
"answered once per session"). The provider that satisfied `(library (srfi 8))` is the provider
`(import (srfi 8))` then uses.

*Alternatives rejected:*

- A Scheme-side copy of the resolver in the binary. It would mean two implementations of the root
  mapping and of the admission rule ("sole form is `define-library` with exactly that name"), and a
  divergence between them is the silent wrong-clause failure D8 refused to risk.
- Pre-sending every resolvable name. The root namespace is open-ended.

**Baked libraries** answer `(library …)` against the baked set at bake time, extending
`library-include-declarations` D12. No shipped library asks.

### D7: The cache records answers and the stamp version bumps

A disk-compiled unit's stamp records, beside the include-file set, the `(name . answer)` pairs its
compilation consumed. Validation re-resolves each name without compiling anything and requires
the same answers. `compiler-stamp-version` bumps once, because the stamp's shape changes. This
mirrors `library-include-declarations` D10.

### D8: Program-level splicing is the declaration pre-pass, generalized to forms

A top-level splicer runs over a program's forms (and each REPL input) **before** `collect-imports`.
`include`/`include-ci` become the file's forms. `cond-expand` becomes the selected clause's forms,
spliced directly, and is expanded recursively. The cond-expand evaluator, the include stack and
cycle check, and `read-included` are shared with the declaration pre-pass rather than copied.
Because the splice happens before imports are collected, a spliced `import` is an ordinary import,
and mode 12 sees it. In the REPL, one input that splices to several forms is evaluated as those
forms in order, as if each had been entered. The base for a top-level filename is the host's
existing source home (`set-source-home!`), which already means "the current directory" for stdin.

### D9: Body splicing happens in the expander; nested filenames are anchored by origin

`exp-body` splices `include`, `include-ci`, and `cond-expand` forms into the body list **before**
`add-body-defines` runs, so included definitions are internal definitions. The `exp` dispatch gets
one arm that expands either keyword in expression position into `(begin …)`. Both checks use the
existing shadowing test (`macro-lookup`'s `bound` rule), so a local `include` binding wins.

A nested filename must resolve against the file that contained it, but the expander only sees
forms. When `read-included` reads a file, it records each `include`-headed sub-form it returns in
an `eq?`-keyed origin table mapping the form to that file's token, skipping `quote` and
`quasiquote`. The expander looks the form up there and falls back to the unit's source home. This
needs no rewriting of user data and no wrapper forms that would disturb `body-form-name` or
record-type splicing. A form rebuilt by a macro template misses the table and falls back to the
source home. That limitation is accepted and documented, since R7RS leaves include search to the
implementation.

The unit's *own* forms are anchored the same way, against its source home. That home is read at
**parse** time, through a reader each host installs beside its include reader, not at expansion
time. The Chez driver parses every library in a closure before compiling any of them, so by
expansion time its source home names some other file. For the same reason the table is never
cleared per unit. Entries are keyed by identity, so a stale entry cannot answer for a different
form, and there is one per include-headed subform actually read. In the binary the compiler's
globals are rebuilt on every host call anyway, so there the table lasts for one call.

*Alternative rejected:* rewriting nested filenames to absolute paths at read time. If `include` is
locally rebound, the string is an ordinary argument, and rewriting it would silently change a
program's value.

### D10: `features` is a compile-time constant in `(scheme base)`

`features` is defined in `src/prelude.scm` and declared in `src/prelude-surface.scm`. Its body
copies a list the expander produces from `*advertised-features*`, through one intrinsic form that
lowers to the quoted list. One declaration therefore feeds both `cond-expand` and `features`, and
the baked library captures the list at bake time, consistent with D6's bake-time rule.

### D11: Feature identifiers are added one test at a time

`srfi-0` is added, since `cond-expand` is now complete in every R7RS position. For each other SRFI
Emit already provides natively, a test exercising the SRFI's specified behavior comes first and the
identifier second. The candidates are SRFI 6 (string ports), 9 (records), 16 (`case-lambda`), 23
(`error`), 30 (block comments), 62 (datum comments), 87 (`=>` in `case`), and 39 (parameters, if
present). A candidate that fails its test is recorded as an absence with its reason, as
`exact-closed` and `full-unicode` are now. This matters for portable packages, which use these
identifiers to skip their own fallback implementations.

### D12: Acceptance is a vendored package compiled unmodified

The proposal's acceptance package is vendored under `test/` with its license file and an origin
note giving the URL, version, and date. A test program uses it from a library root on every path.
If the first candidate (SRFI 1) needs something out of scope, such as `syntax-case` or a missing
primitive, the gap is filed as an issue and a smaller package, such as SRFI 8 or SRFI 2, takes its
place. The change does not grow to fit the package.

## Risks / Trade-offs

- **[The imports query changes protocol]** Both hosts and `src/repl-core.ss` must agree on the
  pending reply and the answer mode. → Gate it with a cross-host test whose `cond-expand` needs
  two rounds (an answer that selects a clause containing a second `(library …)`).
- **[A public macro hidden by `except` is still reachable under its unit-qualified name]** That
  name is a spelling no user writes, as for private carried macros today. → Test that `except` of a
  helper macro used by a kept macro still expands, and that the hidden keyword is not visible.
- **[The expander gains work on every body]** → The splice check is one `memq` on the head symbol of
  each body form. Measure one self-compile against the ~57 s figure in `CLAUDE.md` and record the
  delta in the task.
- **[The origin table holds forms alive]** → It holds one entry per include-headed subform of a
  file actually read. In the binary it lives for one host call. Under the Chez driver it lives for
  one build, which is short. Clearing it per unit would be wrong (D9).
- **[Two readers read program-level includes too]** This is the risk `library-include-declarations`
  already took for declarations. → Extend the cross-host equivalence suites to a program-level and
  a body-level include.
- **[IR could move]** → Nothing existing uses the new forms. If the scaffold baseline moves, explain
  the delta before re-recording, per that script's protocol.
- **[`make regen` barrier]** `src/core.ss`, `src/passes/expand.ss`, `src/repl-core.ss`,
  `src/prelude.scm`, and `src/prelude-surface.scm` all change. → Finish every compiler-source edit
  first, then run `make regen`, `./run-all-tests.sh`, and `./run-dev-tests.sh`, and commit before
  `test/trust-check.sh`.

## Migration Plan

No user migration is needed. Every source that compiled before compiles the same way, and sources
that were refused now compile. The cache stamp bump invalidates `build/lib` and the native cache
once. Rollback is a revert. No artifact format moves.
