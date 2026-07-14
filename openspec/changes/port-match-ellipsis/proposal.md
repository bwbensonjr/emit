## Why

[[port-match-to-syntax-rules]] replaced the `syntax-case` matcher with a `syntax-rules`
`,x` matcher, but deliberately left out **ellipsis** patterns (`(p ...)` and
`(p ... . tail)`). The current compiler passes use no ellipsis, so it was split off to keep
that change focused. This change adds ellipsis support so the matcher is a complete
general-purpose tool (and ready for future passes that want repetition patterns).

The blocker is specific: a matcher must *detect* `...` inside a user pattern, which requires
its `syntax-rules` to treat `...` as a matchable literal. The standard mechanism is a
**custom ellipsis identifier** (`(syntax-rules ::: (literals) rules ...)`), and scheme-llvm's
expander does not support that yet (verified in the prior change: it errors). The ellipsis
*escape* `(... ...)` — needed to emit a literal `...` — was already added.

## What Changes

- Add **custom ellipsis identifier** support to `src/passes/expand.ss`: accept
  `(syntax-rules <ellip> (literals) rules ...)` where `<ellip>` (a symbol) replaces `...` as
  the repetition marker for that transformer, freeing `...` to be matched literally. Falls
  back to `...` when the second form is a literals list, as today.
- Extend the `,x` matcher (`src/match.sls`) with ellipsis `(p ...)` and ellipsis-with-tail
  `(p ... . tail)`, using a custom ellipsis in its own rules to detect the user's `...`, and
  the `(... ...)` escape to emit repetition where needed.
- Add tests (forward-looking; not exercised by current passes): matcher ellipsis behavior,
  and expander custom-ellipsis unit tests. Keep the whole matcher expandable by scheme-llvm's
  own expander.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `macro-system`: Add a requirement that `syntax-rules` supports a custom ellipsis
  identifier, and extend the runtime-matcher requirement with ellipsis / ellipsis-with-tail
  destructuring.

## Impact

- **Code**: `src/passes/expand.ss` (custom ellipsis; threads the ellipsis identifier through
  `pattern-vars`/`match-pat`/`instantiate` instead of the hardcoded `*ellipsis*`),
  `src/match.sls` (ellipsis rules), tests.
- **Depends on**: [[port-match-to-syntax-rules]] (the non-ellipsis matcher and the `(... ...)`
  escape).
- No change to runtime, emit output, or existing pass behavior (ellipsis is additive and
  unused by current passes; the full suite remains the regression oracle).
