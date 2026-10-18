# Proposal

## Why

Import transforms currently leave integrated primitives and core syntax universally visible, and conflicting imports silently select a binding (#119, #118). The same spelling-based model prevents local macros and permits capture of definition-site helpers (#106); frontend diagnostics and the module documentation also retain obsolete limitations (#91, #133).

## What Changes

- Give runtime bindings, primitives, core syntax, auxiliary syntax, and transformers stable identities, with import transforms operating on their published names uniformly.
- **BREAKING**: Reject different imported bindings exposed under the same name, including runtime/macro collisions; allow repeated imports of the same original binding.
- **BREAKING**: Move the non-R7RS `filter`, `fold-right`, and `iota` extensions from `(scheme base)` to `(emit list)`. This keeps joint base/SRFI 1 imports valid without weakening conflict checks or modifying pinned upstream packages.
- **BREAKING**: Honor hiding and renaming of integrated primitives and core keywords, remove blanket publication by every `(scheme ...)` library, and respect lexical shadowing of core syntax. Preserve implicit `(scheme base)` for ordinary programs and the explicit `--no-prelude` compiler environment.
- Support `let-syntax`, `letrec-syntax`, and internal `define-syntax` with `syntax-rules`, including macro-generated definitions in body definition prefixes.
- Strengthen hygiene with definition-site references, use-site syntax preservation, fresh introduced binders, and binding-aware literal comparison; fix #106 without making user-written helper names unshadowable.
- Resolve #91 against current behavior: support local recursive macros, retain existing `case-lambda` support, and report malformed or unsupported frontend forms by name, including dotted `define-values`.
- Correct #133's obsolete transitive-tree-shaking claim and associated delivery prose; distinguish source-based AOT pruning, full-unit artifact reuse, and open-world execution.

## Capabilities

### New Capabilities

- `frontend-diagnostics`: Recoverable expression/definition frontend diagnostics for malformed and explicitly unsupported source forms.

### Modified Capabilities

- `module-system`: Uniform importable binding kinds, origin identity across artifacts and re-exports, conflict rejection, and local syntax in library bodies.
- `macro-system`: Lexical transformer scopes, definition-site hygiene, binding-aware literals, and binding-based core syntax recognition.

## Impact

The implementation will affect shared frontend code in `src/core.ss`, `src/passes/expand.ss`, and `src/parse.ss`; incremental state in `src/repl-core.ss`; prelude surface declarations/generation; compile-time interface serialization and cache identity; and host protocol consumers as needed. Tests must cover Chez compilation, `emit run`, `emit build`, `emit lib`, saved artifacts, and incremental REPL behavior, followed by regeneration and both project suites. Documentation changes center on `docs/MODULES.md`, with conformance exclusions and related language documentation reconciled. No new runtime macro evaluator, procedural transformer system, dotted `define-values` implementation, or tree-shaking algorithm is proposed.

Issue references: [#119](https://github.com/bwbensonjr/emit/issues/119), [#118](https://github.com/bwbensonjr/emit/issues/118), [#106](https://github.com/bwbensonjr/emit/issues/106), [#91](https://github.com/bwbensonjr/emit/issues/91), [#133](https://github.com/bwbensonjr/emit/issues/133).
