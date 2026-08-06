## Why

A library cannot export a macro. `(export swap!)` where `swap!` is a `define-syntax` is a
compile-time error — since `module-frontend-diagnostics` an honest one, naming the limit
("a library cannot export a macro (exports are procedures in this stage)") instead of the old
misdescription, but still a refusal. Drop the name from the export list and the importer gets
`unbound variable swap!`. Either way a syntactic abstraction cannot cross a library boundary
(#48, second half).

The compiler already does the thing user libraries cannot. `(scheme base)`'s derived forms — `and`,
`or`, `when`, `unless`, `cond`, `case`, `guard`, `parameterize` — reach every program through a
privileged side channel: `prelude-macro-forms` merges the baked macro set straight into each
compile's `macro-env` (`src/core.ss:230`), never through an export table. **Macro export works for
exactly one library: the one the compiler carries.** That is a two-tier module system whose reachable
tier is the smaller one, and it sits against two stated goals — "a module is the shared unit of
compilation," and R7RS-small as the module surface, where `(export <macro>)` is ordinary and a
library exporting `syntax-rules` is one of the main reasons to write a library at all.

Now, because real projects need it. Every non-trivial Scheme library ships syntax: a test harness
with `assert-equal`, a logging library with `log-when`, a DSL, a `define-thing` wrapper over
`define-record-type`. Today each of those must be pasted into every program that uses it, which is
precisely the duplication a module system exists to remove.

Two facts found while scoping make this far cheaper than "phase separation" usually implies, and
both narrow the change to plumbing plus one resolution pass:

- **A transformer is already a plain datum.** `parse-define-syntax` (`src/passes/expand.ss:37-43`)
  produces `(name literals (pattern . template) …)` — pairs, symbols, and literals, nothing else. It
  needs no compiled representation to travel: `write` on the exporting side, the existing datum
  reader on the importing side. There is no closure to serialize and no separate expander phase to
  stand up.
- **A library's private bindings are already externally linkable.** `liba` exports only `a-val`, yet
  `build/lib/liba.ll` emits `@"liba:helper" = global i64 0` at default (external) linkage. A
  template's reference to a private helper can therefore be pre-resolved to the exporter's mangled
  symbol and resolved by the linker in the importer — the same `external global i64` path imported
  names already take (`src/emit.ss:1515,1548`).

## What Changes

- **A library can export a macro.** A name bound by a `define-syntax` in a library body may appear
  in an `export` declaration. An importing program, library, or REPL session may then use that macro
  under its external name. This holds identically on all three doors — the Chez batch driver, the
  REPL, and the Chez-free embedded run door — per dev→ship fidelity.
- **The export artifact grows a compile-time half.** The `.exports` datum becomes four fields:
  `(NAME <runtime-table> <call-rows> <compile-time-half>)`. The fourth carries the exported
  transformers and the mangled symbols their templates reference. A three-field datum is still read
  (as "no macros exported"), so a stale artifact from a previous build is not a crash.
- **An exported macro's template is resolved in the exporting library's environment, not the
  importer's.** At export time each template's free identifiers — everything that is not a pattern
  variable, a core keyword, a primitive, a literal, or an identifier the template itself introduces
  — are rewritten to the exporter's resolved spelling: `unit:name` for one of its own top-level
  bindings, the already-mangled symbol for a name it imports. This is R7RS definition-environment
  hygiene, and it means a template may call a **private** helper with no widening of the library's
  public surface.
- **A private macro an exported template uses travels with it, hidden.** Its keyword is rewritten to
  a unit-qualified spelling and carried in the compile-time half, transitively. A library may
  therefore layer macros on macros, which is how macro-heavy libraries are actually written.
- **An identifier the pass cannot resolve keeps today's treatment.** It is left alone and renamed per
  expansion in the importer, exactly as now — because emit's hygiene is a name-set heuristic with no
  syntax objects, a template-introduced temporary and a typo'd reference are indistinguishable, and
  guessing between them would either reject working macros or require the marks-based rewrite this
  change is not (design D4). A working macro therefore cannot be broken by the pass; a typo inside a
  template still surfaces in the importer, which is a diagnostic gap recorded as an issue rather than
  papered over with a heuristic.
- **The AOT tree-shake keeps what an exported template reaches.** `program-root-internals`
  (`src/compile.ss:596`) folds over the export list, so a private binding reachable only from an
  exported macro's template is not a candidate root and would be pruned into a link-time undefined
  symbol. The compile-time half's referenced-symbol list joins the root set.
- **`(rename <internal> <external>)` becomes legal on a macro export.** Pre-resolution is what makes
  it safe: the template no longer depends on the importer resolving any particular spelling. This
  **relaxes** a current prohibition rather than adding one.
- **Non-goals.** The baked `(scheme base)` macro set keeps its existing merge path unchanged — no IR
  and no diagnostics move for a program that compiles today. `define-syntax` at a library's *inner*
  scope, `let-syntax`/`letrec-syntax`, `syntax-case`, and identifier/`er-macro` transformers all
  remain out of scope; so do the import-set transforms (`only`/`except`/`prefix`), which
  `module-frontend-diagnostics` already rejects by name and which would otherwise have to be defined
  over a macro name set too.

## Capabilities

### New Capabilities
<!-- None. This is the deferred second half of an existing capability's export surface. -->

### Modified Capabilities

- `module-system`: the export surface changes from "exports are procedures, and a macro export SHALL
  be rejected as one" to a macro export being accepted and carried; the export-artifact format gains
  its compile-time half; the whole-module import surface gains the macro merge; the REPL door's
  import gains that merge and its persistence across forms; two requirements are added (an exported
  macro's availability in an importer, and its resolution in the defining library) along with a
  tree-shake requirement for macro-reached bindings; and the requirement "a name an exported macro
  template mentions is exported under that spelling" is removed, its still-applicable half — the
  baked `(scheme base)` set, which really is resolved in the importer — carried by the new
  resolution requirement.
- `macro-system`: the hygiene rule gains the case of an identifier that arrives already resolved
  from an imported transformer — a unit-qualified symbol must count as a known binding and must not
  be renamed away as "introduced".

## Impact

- `src/passes/expand.ss`: the transformer datum accessors and hygiene's `known` test — an
  already-resolved unit-qualified identifier must be left alone; the new export-time resolution pass
  over templates lives beside `collect-renames`, which already walks a template classifying
  identifiers.
- `src/core.ss`: `compile-library*` (`:690`) — the export check stops rejecting macros and starts
  emitting the compile-time half; the export table construction (`:754`); `import-tables->env-alist`
  (`:607`) and a new macro-side sibling; `compute-known` (`:45`); `compile-program-with-imports`
  (`:826`); `render-datum` (`:356`), which must render the fourth field.
- `src/compile.ss`: the `.exports` writer (`:695`+) and the reuse-path reader (`:688`);
  `program-root-internals` (`:596`) for the shake roots.
- `src/repl-core.ss`: the import path (`:240-260`) — merge macros into `*repl-macro-env*` and the
  referenced symbols into `*repl-known*` / `*repl-env*`; `repl-library-exports-text` (mode 11) so
  `emit lib` writes the same four-field datum the driver does.
- `src/emit.cpp`: the mode-11 sidecar writer (`:1538`) is format-agnostic and should stay so; the run
  door's `preload_user_libraries` needs no new mode — a program that uses only a macro from a library
  still imports it, so the existing closure walk (mode 12) already links the unit whose globals the
  expansion references.
- **Artifact format**: a new field in a committed, cache-checked file. `artifacts-fresh?` compares
  mtimes and a compiler stamp, not a format version, so the reader tolerates the three-field shape.
  `test/module-scaffold-baseline.sha256` pins emitted IR, not `.exports`, and no program that
  compiles today changes by a byte — but this must be verified, not assumed.
- Tests: `test/modules-tests.sh`, `test/modules-run-tests.sh`, `test/modules-repl-tests.sh` (one
  fixture library exporting a macro, exercised on all three doors),
  `test/aot-tree-shaking-tests.sh` (a private helper reached only through an exported template
  survives the shake), and `test/expander-tests.ss` for the resolution pass in isolation.
- Docs: `docs/MODULES.md` (the export surface, the artifact format, the diagnostics table at `:530`
  whose macro-export row changes meaning), and `openspec/explorations/modules-v0-design.md:52`, whose
  deferral this closes.
- Closes the second half of #48.
