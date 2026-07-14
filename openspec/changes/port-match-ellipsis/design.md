## Context

The `,x` matcher from [[port-match-to-syntax-rules]] handles literal/pair/dotted-rest/binder
patterns but not ellipsis. Adding ellipsis is blocked on the expander: a matcher detects a
user pattern `(p ...)` by having a rule that matches a *literal* `...`, but `...` is the
reserved repetition marker in `syntax-rules`, so it can't be matched directly. The standard
fix is a custom ellipsis identifier for the matcher's own transformers.

Two expander facts (verified in the prior change):
- The ellipsis *escape* `(... <tmpl>)` is supported (added there): a matcher can emit `...`.
- Custom ellipsis `(syntax-rules ::: …)` is **not** supported: `parse-define-syntax` treats
  the second form as the literals list unconditionally, and `*ellipsis*` is hardcoded to `...`.

## Goals / Non-Goals

**Goals:**
- Expander accepts a custom ellipsis identifier in `syntax-rules`.
- The `,x` matcher supports `(p ...)` and `(p ... . tail)` over runtime lists.
- The matcher stays a single module expandable by both Chez and scheme-llvm's expander.

**Non-Goals:**
- Nested ellipsis in matcher patterns beyond one level per list (match the passes' likely
  needs, not full generality) — revisit if a real pass needs deeper.
- Catamorphism, `?`-patterns, `_` wildcard (separate, still deferred).

## Decisions

### D1: Custom ellipsis via an optional leading identifier in syntax-rules

`parse-define-syntax` detects the R6RS/R7RS form `(syntax-rules <ellip> (literals) rules ...)`
when the form after `syntax-rules` is a symbol (not a list): that symbol becomes the
transformer's ellipsis. Thread it (replacing the module-global `*ellipsis*`) through
`pattern-vars`, `match-pat`, `match-ellipsis`, `instantiate-seq`, `expand-ellipsis`, and the
escape. Default remains `...` when the next form is a literals list — fully backward
compatible.

### D2: Matcher detects `...` using a custom ellipsis for its own rules

The matcher's `match-pat` uses a custom ellipsis (e.g. `:::`) so `...` is an ordinary
identifier it can put in its literals list and match. A rule like
`((_ (sub ::: . rest) subj sk fk) …)` then fires only when the user pattern has `...` after
`sub`, generating a loop that matches each element against `sub` and binds each pattern
variable to the collected list. Ellipsis-with-tail reuses the dotted `rest`.

### D3: Behavior-preserving for existing passes

The passes use no ellipsis, so the whole existing suite must stay green; ellipsis is proven
only by new, dedicated tests.

## Risks / Trade-offs

- **Threading the ellipsis identifier touches the expander core** → keep `...` the default;
  add expander unit tests for both custom and default ellipsis before wiring the matcher.
- **Binder collection across a runtime loop is the historically bug-prone part** → dedicated
  tests for `(,x ...)`, `((,k ,v) ...)`, and `(,a ... ,last)`.

## Migration Plan

1. Expander: custom ellipsis support + unit tests (default `...` unchanged).
2. Matcher: ellipsis rules + tests; confirm it still expands under scheme-llvm's expander.
3. Full suite green (regression); ellipsis covered by new tests only.

## Open Questions

- Which concrete custom-ellipsis token the matcher uses internally (cosmetic).
- Whether any near-term pass will actually adopt ellipsis (would add real, not just
  forward-looking, coverage).
