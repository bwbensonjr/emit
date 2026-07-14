## Why

The gap sweep ([[self-host-gap-sweep]]) found gap **G7**: `parse-expr` accepts only the
three-armed `(if test then else)`. A two-armed `(if test then)` falls through to the
application case and is compiled as a *call* to `if`, which then fails as an unbound variable.
The core relies on two-armed `if` in two ways: the `(if #f #f)` "unspecified value" idiom
(`core.ss` `no-dump`, an `emit.ss` site) and — pervasively — the **`case` macro's no-`else`
default**, whose base case expands to `(if #f #f)` and is used by `expand-arith`/`cmp-pair`.
So the assembled core cannot be parsed by scheme-llvm until two-armed `if` is accepted.

## What Changes

- Grow `parse-expr` to accept `(if test then)` as sugar for `(if test then UNSPEC)`, where
  `UNSPEC` is the unspecified value (the same value `(if #f #f)` denotes). This is standard
  R7RS `if` and closes the gap at its root, so the `case` macro and the `(if #f #f)` idiom both
  work unchanged.
- No change to three-armed `if`.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: `if` accepts an optional alternative; a two-armed `(if test then)` evaluates
  to an unspecified value when the test is false, consistent with R7RS and with the `case`
  derived form's no-match result.

## Impact

- **Code**: `src/parse.ss` (`parse-expr`'s `if` clause — add the two-armed pattern producing a
  three-armed core-IL `if` with an unspecified alternative). No emitter change (it already
  lowers three-armed `if`).
- **Depends on**: nothing; unblocks [[self-hosting-bootstrap]] (G7 is a front-end blocker for
  the assembled core, hit via the `case` macro).
- **Note**: fixing `if` at the parser is preferred over patching the `case` macro + rewriting
  the `(if #f #f)` sites, because it removes the whole class rather than the instances.
