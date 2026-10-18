# Design

## Context

See `proposal.md` for motivation and the three delta specs for acceptance behavior.

`src/core.ss` currently transforms runtime rows and public macro entries, but synthesizes a list of universal names for every `(scheme ...)` library without materializing primitive or core-syntax bindings. Runtime and macro environments are then assembled independently. `src/passes/expand.ss` tracks names bound at a use site and exempts known names from template renaming; it does not retain full definition-site lexical context. `src/parse.ss` and the earlier body/definition collectors also recognize syntax by spelling. A spelling rewrite added only to macro dispatch would leave renamed `define`, hidden syntax, literal comparison, and first-class primitives inconsistent.

The archived `portable-library-surface` design deliberately deferred #118 and #119. Existing main specs also explicitly accept first-import-wins, exclude local syntax forms, and describe #106 as a residual hygiene limitation. This change replaces those contracts, while retaining ordinary programs' implicit base import and local-definition precedence over valid imports.

Issue #91 predates the current `(scheme case-lambda)` implementation. Current fixed, dotted, rest-only, and source-order clause behavior must remain valid. The remaining dotted `define-values` case is a diagnostic requirement, not a request to implement that feature.

## Goals / Non-Goals

Goals are one shared binding model across import validation, expansion, literal matching, serialization, and incremental compilation; deterministic library interfaces; and a small lowering boundary that leaves later compiler passes operating on their existing core IL.

Non-goals are procedural macros (`syntax-case`, `syntax-rules` alternatives, arbitrary transformer evaluation), a runtime evaluator, a general phase-tower/module redesign, source-location infrastructure beyond information the frontend already carries, dotted `define-values`, and changes to tree-shaking reachability or optimization policy. The documentation correction for #133 remains prose work backed by the existing implementation and tests.

## Decisions

### D1. Resolve identifiers to bindings before spelling-based lowering

Use a common binding record with an origin identity, kind, payload, and diagnostic provenance. Runtime origins use their original owner/location; syntax and primitive origins use stable builtin identifiers; transformers use their defining unit and deterministic declaration identity. Re-exporting changes visible names and provenance, never origin identity. Equal transformer text is not evidence of equal bindings.

Represent syntax as ordinary Scheme data carrying identifier name/context information where needed, with explicit lexical environments and deterministic scope identities. Use the same representation under Chez and the self-hosted compiler; no host syntax objects, opaque object identity, or new runtime dependency. Precise record layout is an implementation detail, but identifiers need source spelling for quoted data/diagnostics and lexical context for resolution.

After lexical expansion, lower resolved core syntax to canonical core forms and primitive references to protected internal identities recognized by the existing primitive inliner. User identifiers with those spellings must have distinct identities before this boundary. Keep direct-call descriptors, imported assignment restrictions, primitive eta expansion, optional-arity behavior, and arithmetic rewriting attached to the resolved binding. No runtime wrapper global is needed merely to import an integrated primitive under an alias.

Alternative considered: a global alias table or datum substitution. It is simpler locally but cannot distinguish quoted symbols, binders, pattern variables, free template references, or two same-spelled lexical bindings. Extending the current name-set exemptions would preserve the cause of #106.

### D2. Publish actual builtin surfaces and apply import transforms uniformly

Extend compile-time interfaces to enumerate primitive, core, and auxiliary syntax bindings in addition to runtime exports and transformers. Put library ownership in the declared surface machinery (`src/prelude-surface.scm` and its generators/guards), so committed `.sld` sources and baked interfaces agree. Remove the blanket `universal-library-names` fiction. Preserve documented Emit extensions explicitly rather than accidentally exporting every builtin through every standard library.

An ordinary program starts with an implicit base binding view. Any explicit base views collectively replace that view; multiple explicit sets contribute their union. Libraries receive only their imports and own definitions, plus implementation-only raw operators needed by compiler-generated code. `--no-prelude` retains the established explicit compiler environment of core syntax, integrated primitives, and raw internal operators, with no injected runtime prelude or derived macro environment. This keeps bootstrap inputs and prelude-free tests supported without bypassing restrictions in normal import-aware source.

All syntax recognition must follow resolved identity: core expression heads, `quote`/quasiquote, definition and record discovery, body splicing, local syntax bindings, and auxiliary identifiers. A renamed `define` must be recognized before collecting top-level names. Resolve import declarations and library declarations through their existing structural grammar before constructing the unit's binding view; these declaration positions are not ordinary identifier references.

Source-written lexical variables or macros can shadow core syntax. Definition-site keywords introduced by a transformer remain bound to their original syntax. Tests must cover both cases. This explicitly supersedes the earlier core-keyword exemption in `macro-system`.

Alternative considered: materialize only base aliases while leaving hidden bare names universal. That would fix positive prefix examples but continue violating `only`, `except`, lexical shadowing, and negative tests.

### D3. Validate the transformed import namespace as a transaction

Publication audit found that `(scheme write)` defined wrappers for the integrated `display`
and `write` bindings that Emit already exposes as base extensions. Make the write library
re-export those same primitive identities, preserving the base extensions and allowing the
usual base-plus-write import. Their value-position lowering retains the write library's
optional-port behavior. Independent user-library wrappers remain distinct bindings and conflict
normally; equal procedure implementation text is never used to deduplicate them.

Collect every visible name after nested import transforms, including collisions introduced by a single `rename`. Deduplicate only equal origins; reject distinct origins across all binding kinds. Retain contributing library/import-set provenance for diagnostics. Validate even if a local definition later shadows the name: local precedence does not legalize an inconsistent import namespace. Audit fixtures and shipped surfaces that relied on first-import-wins, and select or rename deliberately distinct bindings where necessary.

In the REPL, stage the prospective complete explicit import view, replace the implicit base view when first explicitly specified, and validate before initialization or session mutation. Commit runtime bindings, macros, syntax, primitive aliases, and call metadata together. On conflict, retain the prior view and initialization state. Previously compiled forms retain their binding identities when later imports change visibility. Existing failure rollback remains required for compilation and initialization errors; this change does not promise reversal of arbitrary user I/O performed by a failing initializer.

Alternative considered: validate runtime and macro environments separately or compare immediate export rows. That misses cross-kind collisions and misclassifies renamed or forwarded copies of the same original transformer.

### D4. Capture lexical transformer contexts and normalize body prefixes during expansion

`let-syntax` compiles each transformer specification in the outer environment, then extends only the body environment. `letrec-syntax` first allocates all keyword identities, compiles specifications against the extended environment, then expands the body. Internal `define-syntax` uses a recursive definition group alongside internal variables. Entering any local syntax body establishes a scope even when its binding list is empty.

Replace the current collect-then-map assumption with coordinated body-prefix expansion and definition discovery. Expand prefix macros and splice `begin` before classifying definitions; allocate group bindings before resolving their bodies and transformer free references. Keep variable initializer ordering and existing mutually visible definition semantics. Reject duplicate binders, malformed transformer rules, and definitions in invalid positions. Expansion depth guards apply to discovery as well as expression rewriting.

On template instantiation, preserve the context of captured use-site syntax; give introduced binders fresh identities and connect their template references to them; retain the definition context of free references. Nested transformer generation and ellipsis escape must preserve which context owns each identifier. Literal comparison uses equal origin identities, or equal spelling when both identifiers are unbound. It must not reject every locally bound literal indiscriminately.

This fixes `%do-step` and corresponding `guard` helper capture through the general model. A targeted prelude normalization workaround is insufficient acceptance: user-defined local and imported macros need the same guarantees. Prelude restructuring is optional only if it simplifies the final implementation without hiding missing hygiene.

### D5. Serialize context deterministically and invalidate insufficient artifacts

Publish a tagged compile-time interface revision containing origin identities and the finite reachable definition-context/dependency closure. Allocate stable identities by unit and structural declaration/scope position, independent of host evaluation order, import aliases, and process counters. Recursive transformer graphs must serialize finitely. Keep compile-time context out of `.ll` runtime payloads and standalone binaries. Existing runtime-only rows and call descriptors remain readable where they carry sufficient information.

Public transformer keys must be recorded explicitly alongside builtin binding metadata. A colon
in a name is not evidence of privacy: a prefix import or an explicit export may publish such a
name. Hidden dependency entries remain in the transformer registry but do not create source
bindings. The frontend also reports which top-level targets were introduced rather than
source-provided, so REPL persistence can retain their globals and contexts without publishing
their implementation-generated names. Source names and existing context keys are reserved by
the deterministic fresh-name allocator before expansion.

Keep emitted local targets disjoint from qualified imported globals: generated lexical and
introduced runtime targets use reserved, colon-free identities. Source-written top-level names
containing the global separator receive such a target too, with an explicit source-to-target
map for export translation and REPL publication. This prevents early contextual lowering from
turning a foreign global reference into a same-spelled source or alpha-renamed local binding.
Source definitions shadowing canonical primitive spellings also receive distinct actual targets,
preserving definition-site primitive calls and values in imported transformers.

Older macro interfaces cannot establish lexical identity that they never recorded. Compiler identity/cache invalidation must rebuild these from source; explicitly supplied incompatible macro artifacts without source must produce a diagnostic requesting rebuild. Do not infer macro identity from textual equality or silently reinterpret a legacy macro interface in the importer. Preserve the existing ability to read older runtime-only tables. Update the module export-table compatibility scenario specifically for this distinction.

Check both interface readers/writers and the host transport used by `src/emit.cpp`, the Chez driver, and REPL registration. Repeated full compilation of the same library must produce byte-identical readable interfaces and normalized IR across Chez/native hosts. Full-unit reusable artifacts remain separate from source-based root-specific AOT recompilation. New identifier numbering must not accidentally change public runtime labels or direct-call targets across pruning.

### D6. Diagnose frontend shapes and reconcile existing documentation

Guard source-driven destructuring at local syntax, transformer, formal/binding, and definition parsing boundaries before accessing pairs. An invalid recognized form reports its syntax and reason using existing recoverable frontend errors. Preserve the working imported `case-lambda` examples, add malformed-clause diagnostics, and report unsupported dotted `define-values` explicitly. Audit remaining unchecked expression-frontend destructuring within this scope so #91 is not treated as only a `letrec-syntax` fix.

For #133, replace `docs/MODULES.md`'s scope-and-limits claim that imported-by-another-unit libraries and the substrate always ship whole. Describe backward AOT root propagation in reverse dependency order: a dependency's roots include the program and already finalized importer IR. Update the delivery explanation that describes roots as program IR alone. Keep open-world full-unit loading (`emit run`/REPL) and explicit full-unit artifact reuse distinct from source-based AOT pruning. Cross-check `docs/PERFORMANCE.md` P10, the shaking code in `src/core.ss`/`src/emit.cpp`, `test/aot-tree-shaking-tests.sh`, and `test/unit-pipeline-tests.sh`. Do not rewrite P10's historical measurements as new results.

Also replace documentation of first-import-wins, universal unrenamable primitives/core syntax, local macro exclusions, and residual helper capture. Update the R7RS exclusion ledger only after the corresponding upstream cases actually pass; dotted `define-values` remains an explicit unsupported case with a better diagnostic.

## Risks / Trade-offs

- Binding-aware expansion affects every self-compile. Mitigation: iterate through the Chez source driver, pin focused regressions before broad edits, and complete all compiler-source edits before the regeneration barrier.
- Existing code may rely on ambient primitives in libraries or overlapping exports. Mitigation: audit shipped units, package fixtures, and tests; add imports/selection deliberately and document the breaking corrections.
- Captured syntax context can grow interfaces or create cycles. Mitigation: serialize a finite reachable binding graph with stable references, compare interface sizes on representative libraries, and avoid embedding context in runtime objects.
- Freshness allocation could depend on host evaluation order or pruning. Mitigation: stable structural identities, explicit traversal order, cross-host byte comparisons, and existing stable-label pruning checks.
- Definition-prefix expansion can change initialization order. Mitigation: keep declaration discovery separate from runtime initializer execution and test recursive groups, macro-generated definitions, and library effects.
- A superficial helper rename could mask remaining capture bugs. Mitigation: test the original #106 spelling plus generated local macros, guard helpers, known-global temporary collisions, and literal identities through artifact round trips.

## Migration Plan

### Approved migration: base extensions and pinned SRFI suites

Source validation confirms that `(scheme base)` and pinned `(srfi 1)` publish three
different bindings under the same names: `filter`, `fold-right`, and `iota`.
The original symbols are respectively `scheme.base:NAME` and `srfi.1:NAME`, so the new
conflict rejection correctly refuses their joint import. This affects the SRFI 64 port
and the unchanged upstream SRFI test programs.

The user approved relocating these three non-R7RS exports to `(emit list)`. Their definitions
live in `(emit internal)` for compiler use, and `(emit list)` re-exports those same bindings.
The new library is not baked; the existing two-unit baked partition remains unchanged.
`(scheme base)` may use its substrate imports internally but no longer publishes these names.
Repository consumers that need Emit's versions import `(emit list)` explicitly. Pinned SRFI
sources and upstream test programs remain unchanged and use their own SRFI 1 bindings.
Do not deduplicate these independent definitions by textual similarity or weaken #118's
conflict rule. Other declared base extensions remain available as before.

Source verification at this checkpoint: 26 contextual expansion checks, 54 legacy expander
checks, 15 import identity/interface checks, 31 import-set checks, 41 REPL transaction/context
checks, 52 artifact/cache checks, 39 module checks, and 22 composition checks pass. The new
Chez AOT acceptance script passes its eight positive/negative cases, including the exact
`%do-step` regression, a saved/re-exported macro, and first-class optional-port output.
The assembled compiler sources also compile and link through the Chez driver. Generated
library and surface guards pass (5 and 16 checks). Scoped formatting and whitespace checks
are complete. Native regeneration, cross-host byte comparisons, and both full suites remain
pending; passing source checks do not substitute for them.

Seventeen exact upstream harness/section probes additionally recovered 14 excluded forms
(11 local/generated syntax cases and three dependent assertions). The two custom-ellipsis
forms and dotted `define-values` remain explicitly unsupported. The conformance README
records source-only evidence without claiming a regenerated native baseline.

The implementation inventory for task 1.1 is:

- `core.ss`: import-set table transforms and environment assembly; `compile-forms`, `compile-program-with-imports`, and `compile-library*` must normalize source before collecting definitions. `expand-unit-form` becomes a lowering-only boundary for already expanded units.
- `expand.ss`: transformer parsing/instantiation, exported-template resolution, and lexical body discovery share contextual identifier resolution. Macro entries need centralized context/origin accessors so forwarding does not reinterpret them.
- `prelude-surface.scm` and `tools/gen-scheme-base.ss`: declare builtin ownership and derive identical source/baked interfaces; the Chez-free surface guard must account for explicitly declared non-runtime exports.
- `repl-core.ss`: mode 3 validates the whole candidate import view before returning initializer symbols; mode 6 commits all binding kinds together. Renamed definition syntax must be resolved before prompt dispatch. Registration and form rollback must retain context and import-view state.
- REPL save/restore vectors persist state across every embedded host call. All new fields need initialization, serialization, restoration, and recovery snapshots; process globals alone are insufficient.
- Export tables retain three runtime/call fields plus the optional compile-time half. `check-cached-rows` validates this shape for modes 14/25/26. The metadata envelope remains `(NAME IMPORTS TABLE INIT)`; C++ treats table payloads as opaque text and delegates validation to Scheme.
- Chez cache stamps and native compiler/cache identities must invalidate insufficient macro artifacts. Modes 11/15/28 serialize interfaces through the shared datum writer. Mode 17 recompiles a pruned library but retains its original full interface, so identities and labels must agree across both versions.

Implement the binding/interface foundation, imports, local expansion/hygiene, diagnostics, and documentation as ordered tasks in this change. Use focused Chez checks throughout. Run the formatter and finish all compiler-source edits before `make regen`; a whole-set layout reformat, if needed, must follow the repository's separate-commit barrier policy.

Then regenerate to convergence, build the native host, and run both full suites without additional compiler-source edits. Commit regenerated IR with the intended source changes under the project's normal commit workflow. The trust check is meaningful only after commit; it deliberately skips dirty bootstrap output, so record that distinction and perform the post-commit check when committing is authorized. Proposal creation itself does not authorize a commit.

Deployment follows the compiler identity change: source-backed caches rebuild; users of artifact-only legacy macro libraries rebuild with the matching compiler. Rollback uses the prior compiler and its matching bootstrap/library artifacts as a set, not a mixture of interface revisions. No new CLI option or permanent compatibility mode for first-import-wins is introduced.
