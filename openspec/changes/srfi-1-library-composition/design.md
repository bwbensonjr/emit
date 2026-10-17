# Design

## Context

See proposal.md for motivation and specs/module-system/spec.md for the behavior contract.
This design is needed because both fixes affect the meaning of a separately compiled
interface and its consumers on interactive and standalone execution paths.

`compile-library` in `src/core.ss` already receives import tables after import-set
transformation. It currently classifies runtime exports only by membership in
`defined-names`, validates other exports against `macro-env`, and mangles every
runtime export as if this unit owned it. Both whole and pruned branches construct
tables this way. Imported runtime bindings already map to their owner's symbol
through `import-tables->env-alist`.

Export tables contain runtime rows `(external . symbol-string)`, procedure call
rows, and an optional compile-time half `(macros own-refs foreign-refs)`. Runtime
rows already permit a foreign target; no new field is needed to represent one.
Call rows carry the original procedure label, arity, rest marker, and optional
minimum-arity entry.

`resolve-exported-macros` in `src/passes/expand.ss` receives only the library's own
macro environment at its call sites. It resolves private local macros and runtime
imports, but cannot identify an imported macro used by an owned transformer's
template. `reexported-macros` already copies imported transformers transitively
without resolving them again. Reuse that origin-preserving behavior for dependencies
of newly defined exported macros as well as for explicit macro re-exports.

The archived acceptance records snow-fort SRFI 1 version 0.1.3 failing on #121 and
on SRFI 227's `opt-lambda` dependency (#120). The two packages are not yet vendored.
The issue descriptions and exact upstream dependency closure must be verified in
the implementation's initial reproduction step; this proposal uses the repository's
recorded findings, since live GitHub access was unavailable during planning.

## Goals / Non-Goals

**Goals:**

- Make publication independent of binding ownership while retaining deterministic
  interfaces, valid direct calls, and existing dependency initialization.
- Resolve newly defined transformers in their definition environment and forward
  imported transformers with their already resolved dependencies intact.
- Keep the semantics in the shared compiler core, using the existing artifact
  shape and host protocols.
- Demonstrate serialized-interface equivalence, normal cache reuse, and standalone
  behavior with portable sources.

**Non-Goals:**

- Creating wrapper procedures or copied global slots for runtime re-exports.
- Adding native consumption of manifest artifact directories or `emit lib` freshness
  sidecars. That separate host capability is tracked in #123.
- Fixing the pre-existing generic-call lowering order defect affecting full
  `(scheme base)` IR (#125). Its export interface remains in parity acceptance.
- Rewriting the general hygiene model, supporting new transformer types, or fixing
  integrated primitive aliases as part of this change.
- Expanding the AOT optimization policy for imported units (PERFORMANCE.md P10).
  The current conservative retention rules must remain sound.
- Claiming full SRFI conformance from a smoke test or globally advertising locally
  available SRFI packages. The proposal lists the remaining scope exclusions.

## Decisions

### D1: Classify exports using the effective binding environment

For each normalized `(external . internal)` export, choose a local runtime
definition first, then an effective imported runtime or macro binding according to
the compiler's existing precedence and shadowing rules. An absent binding remains
an error. Preserve the existing rejection of an own runtime definition and own
macro with the same name.

Re-export lookup uses transformed import tables, so a hidden import cannot be
exported and a renamed import is addressed by its visible name. An imported
runtime row contributes its original target string, not `mangle(current-unit,
internal)`. A locally defined export retains its current mangling. Apply the
classification in one shared helper consumed by whole and pruned emission.

Alternative rejected: accepting an imported name during validation alone. That
would still omit its runtime row or fabricate a nonexistent facade-owned symbol.

### D2: Forward runtime locations and call descriptors without emitting aliases

A facade's runtime row maps its external name directly to the originating global.
It creates no initializer assignment, wrapper lambda, or copied location. Mutation
by the owner is therefore visible through every facade, and callers still resolve
the facade's export as an imported binding that they cannot assign.

For a re-exported imported procedure, copy the chosen source table's call row with
only the external key changed. Preserve all label and arity fields, including the
optional minimum-arity entry; absence of a row must remain absence. Local exports
derive call metadata only from the local unit's lowered procedures. This preserves
direct calls without inventing stability for a mutable binding.

Audit all interface consumers for assumptions that a table's library name owns
every runtime row. In particular, symbol collection, foreign references, call
lookup, and AOT candidate/root construction must follow the row's target rather
than re-mangling the public spelling. A forwarded target must not become a local
definition or local reachability root. The original owner remains in the declared
import closure, initialized once in dependency order, even for a facade with no
runtime body.

Alternative rejected: `(define forwarded imported)` aliases. They copy the value
at initialization and cease to observe later owner assignments, add storage and
code, and lose direct-call information.

### D3: Distinguish owned and imported macro entries during export resolution

Give export-time macro resolution access to the owned macro environment and the
effective imported compile-time interfaces separately. Retain the existing
classification of core keywords, primitives, pattern variables, literals, and
quoted data. An owned macro dependency is resolved and queued as today. An imported
macro dependency is identified through its import table, rewritten to a stable
qualified keyword, and forwarded with its original transformer body intact.

Reuse or factor the traversal used by `reexported-macros` so both explicit
re-exports and template dependencies copy the reachable imported transformer
closure. Keep existing qualified keyword identities; when a public imported alias
needs a carried keyword, derive a deterministic alias from its import identity
and retain that transformer's already resolved body. Never add a facade prefix to
an identifier that is already qualified. Track visited output keywords so
recursive dependencies terminate and copies are emitted in deterministic order.

Carry the runtime references that copied transformers require as foreign refs:
the source table's own refs qualified by its owner, and its existing foreign refs
unchanged. A conservative superset, as used by macro re-export today, is acceptable.
Carried dependency entries use hidden qualified keywords and do not add public
export rows. Import-set filtering may hide the helper's public name but must retain
the entries needed by a kept macro. Caller bindings cannot substitute for a
carried dependency.

Alternative rejected: passing a merged macro environment to the current resolver
and treating every entry as local. Imported bodies are already resolved; rewriting
them against the forwarding library would corrupt private identifiers and refs.

### D4: Preserve artifact shape and verify serialized composition

Runtime forwarding uses existing target strings; macro closure forwarding uses
existing compile-time entries and foreign refs. Preserve table shape, backward
reading of tables without compile-time halves, and all supported call-row shapes.
Use the existing compiler-content identity to invalidate artifacts produced by the
old compiler. No stamp schema bump is planned because the stamp format is unchanged.

Minimal regressions must cross an actual write/read boundary. Compile the owner,
facade, and importer independently, then verify saved `.exports` data is sufficient
for subsequent expansion and code generation. Cross-host checks compare full unit
IR and export data; pruned IR is compared only with an equivalent root set.
As in the existing module equivalence tests, remove host-prepended target triple
and data-layout declarations before comparing full core-emitted unit bodies.

Per the user's scope decision, compare full IR for the focused composition
fixtures and SRFI units/supporting libraries, but compare only the export interface
for `(scheme base)`. Its generic-call lambda-hoisting order differs across hosts on
unchanged HEAD as well; #125 tracks that separate lowerer defect. Keep its committed
IR baseline unchanged rather than changing another compiler pass in this change.

The SRFI comparison exposed #124: recursive expansion and comparison temporary
allocation used effectful `map` callbacks, whose visitation order differs between
Chez and Emit for longer lists. This changes quoted introduced identifiers and
therefore full IR. Exported rules can likewise enqueue carried dependencies in
host-dependent order. Pin those eight traversals with the existing `map-lr` helper;
leave pure rewrites unchanged. Nine focused expander checks cover application,
binding initializer, operand, comparison-temporary, and exported-rule order. This is required for
the already specified deterministic cross-host artifacts, not a new hygiene model.

Alternative rejected: a new host callback or source-dependent expansion fallback.
Either would make artifact reuse depend on more than the compile-time interface.

### D5: Use SRFI 1 and SRFI 227 as fixed acceptance inputs

Start from SRFI 1 version 0.1.3 recorded by the previous change and pin a compatible
SRFI 227 package after checking its metadata. Vendor the package sources, required
includes, metadata, licenses, and upstream tests under the existing `test/snow/`
layout. Record download URLs, versions, dates, archive digests, and source digests;
verify vendored source bytes against the pinned archives. Keep upstream test files
for reference when they require unavailable test infrastructure.

Extend the existing acceptance runner with assertions for `fold`, `filter`,
`append-map`, an imported accessor re-export, and a SRFI 1 optional-argument use.
Exercise `opt-lambda` directly with both omitted and supplied optional arguments.
Use a prefixed SRFI 1 import so implicit `(scheme base)` overlap cannot make a test
accidentally call the wrong implementation. Test expected results as well as parity.

Run the program through the Chez driver, `emit run`, `emit build`, and `emit repl`.
Separately compile the SRFI closure with `emit lib` and compare its saved full IR
and export interfaces with the Chez driver's outputs. Exercise normal native cache
reuse with a dedicated `EMIT_CACHE` directory: warm once, repeat from an unrelated
working directory, require unit-cache hit narration and unchanged expected results.
The Chez regression fixtures cross a saved-interface write/read boundary using that
driver's normal stamped artifacts.

The initial plan assumed native commands consumed a manifest's `(artifacts DIR)`
outputs. Inspection showed that they use the central cache instead, and `emit lib`
writes no freshness stamp. Per the user's scope decision, this change tests serialized
equivalence and existing cache behavior; adding explicit artifact consumption remains
#123. Run the delivered executable from a separate directory with library search
variables unset to verify runtime independence.

If another blocker appears, file it with a reproduction and assess its relation to
this change before expanding scope. A fallback to the old SRFI 2/8 smoke test does
not satisfy this change's acceptance.

## Risks / Trade-offs

- [A facade-owned symbol is fabricated by a downstream consumer] -> Inspect both
  emitted references and export rows; cover two forwarding hops and a diamond.
- [Forwarded call metadata bypasses a mutable slot] -> Test owner replacement of a
  fixed and variadic procedure, including an interface with no call row.
- [Imported macros are resolved twice or lose private dependencies] -> Cover renamed
  imports, recursive helpers, caller collisions, and a saved multi-hop interface.
- [AOT pruning loses the original owner or a macro-only runtime helper] -> Test the
  delivered executable and inspect reachability without broadening optimization policy.
- [Changed macro interfaces affect baked artifacts] -> Measure and explain interface
  and IR deltas; retain the scaffold baseline unless its change is justified.
- [Smoke coverage is mistaken for SRFI conformance] -> Document exactly which cases
  run and that SRFI 64 and full upstream test execution remain later work.

## Migration Plan

No user source migration or command changes are required. Existing local exports
retain their target symbols; newly accepted re-exports use the owner's symbols.
Old cache entries are rebuilt under the changed compiler identity. Rollback is a
revert of implementation and regenerated artifacts together.

Finish all compiler-source edits and any scoped formatting before `make regen`.
Then run `./run-all-tests.sh` followed by `./run-dev-tests.sh` without further
compiler-source edits. Commit the completed implementation and regenerated artifacts
before running `test/trust-check.sh`, per the project barrier. Fixing commits must
reference #120 and #121 with `Fixes` once their regressions and acceptance pass.
