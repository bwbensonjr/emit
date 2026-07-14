## Why

The self-hosting gate check ([[self-hosting-bootstrap]] task 1.2) found the compiler core is
not yet compilable by scheme-llvm because the language rejects **internal `define`**:
`parse: 'define' is only allowed at the top level`. The core's own passes use body-level
defines pervasively (`parse.ss`, `expand.ss`, `convert-assignments.ss` ~5 each; others
fewer), so the core cannot compile itself until the language accepts them. This is gap **G1**
and the single biggest blocker to self-hosting.

## What Changes

- Accept internal `define` (and internal `define` runs preceding the body expressions) in
  `lambda`, `let`, `letrec`, and `begin` bodies, giving them `letrec*` semantics — a leading
  define binds a name visible to the rest of the body, including later defines (mutual and
  forward references within the run resolve).
- Reuse the existing top-level define→`letrec` transform (`collect-toplevel` in `parse.ss`):
  `parse-body` gathers a body's leading defines and rewrites them into the same `letrec`
  (lambda bindings) / `letrec*`-as-`let`+`set!` (non-lambda bindings) shape the top level
  already produces, then the trailing expressions form the body.
- A body with no leading defines is unchanged; a `define` that is not at the head of a body
  (interleaved after a non-define expression) remains an error.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: Accept internal (body-level) `define` with `letrec*` semantics in
  `lambda`/`let`/`letrec`/`begin` bodies, in addition to top-level defines.

## Impact

- **Code**: `src/parse.ss` (`parse-body` gains the leading-define transform, sharing
  `collect-toplevel`'s logic). No runtime change. Possibly the expander if macros must expand
  before the defines are gathered — to be confirmed in design.
- **Depends on**: nothing; unblocks [[self-hosting-bootstrap]] (G1).
- **Enables**: compiling the core's passes (which rely on internal defines) with scheme-llvm.
