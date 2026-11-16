# Design

## Context

See proposal.md for motivation. `validate-import-tables` in `src/core.ss` currently checks one namespace across all import tables using original binding identities. `repl-candidate-import-views` in `src/repl-core.ss` rebuilds views from a flat accumulated spec list, prepending base unless explicit base views exist. Consequently it cannot distinguish a conflict within the new declaration from intentional replacement of an older declaration. The existing `module-system` conflict requirement explicitly rejects the latter and must change.

Program assembly also supplies implicit base tables, with explicit base selection handled by import-set transforms. The shared core and all source/native entry programs must resolve the same visible names. The implementation must follow the actual consumers of these helpers, rather than change only the REPL check.

## Goals / Non-Goals

Goals: one binding-selection policy shared across compilation paths; preserve origin identity and definition contexts; make the policy work for every public binding kind.

Non-goals: Malt-specific compiler behavior, changes to R7RS import syntax, replacement of explicit imports inside program/library scopes, retroactive rebinding of compiled code, or changing precedence of session-owned definitions. No new artifact format is intended.

## Decisions

### 1. Treat implicit base as a fallback view

Resolve and strictly validate explicit program imports together first. When base is implicit, remove its public visible names supplied by explicit imports, then merge remaining defaults. When any explicit base view exists, retain the existing explicit-view union rule and do not supply implicit defaults. Never apply this fallback policy to a library's explicit dependencies.

Use the final names after `only`, `except`, `prefix`, and `rename`. Compare all public kinds in one namespace. Do not infer implicit provenance merely from a table's library name: explicit and implicit base imports have different precedence. Keep this provenance in compilation/session orchestration; existing export interfaces need not encode it.

Alternative: globally allow last import to win. Rejected because it makes explicit program and library conflicts order-dependent. Alternative: special-case Malt's arithmetic names. Rejected because every alternative numeric library has the same need.

### 2. Retain REPL declaration boundaries

Validate all views requested by one import declaration together before overlaying them on the previous imported view. A later declaration replaces only overlapping imported visible names; unrelated names accumulate. A same-origin repeated import is harmless, and reimporting an older library can restore its spelling without rerunning initialization. A declaration containing two distinct bindings for one name remains an error.

Retain enough declaration history or normalized visible-view state to rebuild this result deterministically. A flat union of every historical spec is insufficient. Preserve the first explicit base selection rule: it removes the implicit base view as a whole; later explicit base views accumulate with interactive replacement for overlaps. Previously shadowed implicit defaults must not reappear as a side effect of that transition.

Session-owned definitions retain their current priority. Replacement of imports cannot silently overwrite an interactive `define` or `define-syntax`.

### 3. Filter public visibility without damaging definition contexts

Apply precedence to the public namespace while preserving hidden transformer dependencies, definition-site bindings, original runtime locations, and origin identities. Rebuild the active expansion environment, primitive/core visibility, runtime lookup, known-name set, and direct-call metadata from the selected binding set. Removing a macro must remove it from public expansion lookup; replacing a procedure must remove stale call information. Already compiled procedures and transformers keep their original references.

Replacing the underlying exported location would change existing code and potentially other importers; reject that approach.

### 4. Stage before publishing

Build and validate a candidate binding view before initializing the newly requested closure. Publish active imports only after successful initialization using the existing transaction boundary. Rejected resolution, compile-time validation, or initialization leaves prior session bindings usable and publishes none of the candidate names. No promise is added to roll back arbitrary external effects performed by an initializer that subsequently fails.

### 5. State portability precisely

R7RS-small section 5.2 recommends interactive conflicting imports be permitted. Emit will define successive-declaration replacement; rejecting ambiguity within one declaration remains its conservative policy. Standard programs start empty, so base defaults that yield to imports are an Emit extension. Explicit base plus alternative arithmetic still needs exclusions in programs and libraries. Keep a portable explicit-exclusions Malt example alongside the shorter Emit example.

Source: https://small.r7rs.org/attachment/r7rs.pdf (sections 5.1, 5.2, 5.7).

## Risks / Trade-offs

- Stale macro or direct-call metadata could make the apparent replacement differ by binding kind. Mitigation: cross-kind replacement tests plus imported macro definition-context tests.
- Reconstructing history could revive shadowed bindings. Mitigation: sequences covering repeated imports, explicit base narrowing, renamed views, and failed transactions.
- Only updating native entry paths could hide stale source behavior. Mitigation: source units, classified independent-host suites, regeneration, and isolated source verification.
- Replacement changes some previously rejected interactions into successful ones. Mitigation: document the declaration boundary and release as a minor version.

## Migration Plan

Planning changes no shipped files or version. During implementation update the relevant examples and tests, bump VERSION to the next minor version with a matching changelog section, format edited Scheme, finish compiler-source edits, and cross the explicit regeneration barrier. Validate before further compiler edits. Finish through `emit-finish-change`; do not merge automatically. Reverting the implementation restores rejection behavior without migrating serialized artifacts.
