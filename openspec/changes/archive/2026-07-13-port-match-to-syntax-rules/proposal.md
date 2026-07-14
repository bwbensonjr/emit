## Why

The compiler's passes are expressed with a vendored `match` macro (`src/match.sls`) that
is implemented with **`syntax-case`** (procedural macros: `with-syntax`,
`generate-temporaries`, `datum`, quasisyntax, nested ellipsis). The scheme-llvm language
only provides `syntax-rules`, so this `match` cannot be expanded by our own expander —
making it the single largest obstacle on the path to self-hosting. Investigation showed
that although `match.sls` *implements* catamorphism, the compiler **never uses** it: every
pattern in the passes is within the non-catamorphic subset (literal symbol, pair, single
ellipsis `(p ...)`, ellipsis-with-tail `(p ... plast)`, `,id` binder, `(guard …)`, `else`).
That subset is expressible with `syntax-rules`, so we can remove the `syntax-case`
dependency without losing anything the compiler relies on — and we defer `syntax-case`
itself until R7RS-large's pattern-matching direction (the SRFI-200/204/241 lineage) settles.

This change consumes the recorded decision from [[select-syntax-rules-matcher]] (build a
`,x`-convention `syntax-rules` matcher; add the ellipsis escape `(... ...)` to the expander).

**Scope note (option B):** during implementation we confirmed the current passes use **no
ellipsis patterns**, and that ellipsis *matching* needs the expander to *detect* `...` in
patterns (a custom ellipsis identifier) — more than the escape alone. So ellipsis is split
into a dedicated follow-up ([[port-match-ellipsis]]); this change lands the non-ellipsis
matcher, which covers 100% of real pass usage and removes the `syntax-case` blocker.

- Implement the ellipsis escape `(... ...)` in `src/passes/expand.ss`, with unit tests
  (needed by the eventual ellipsis matcher and independently useful).
- Replace `src/match.sls` with a `syntax-rules`-only `,x` matcher (`(import (rnrs))`),
  used by **both** the host (Chez) build and — verified — scheme-llvm's own expander, so
  there is a single matcher and no host/target divergence.
- Because the `,x` convention is preserved and the passes use no ellipsis, the pass
  `match` forms need **no rewrite**; the existing suite is the behavior-preserving oracle.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `compiler-pipeline`: Add a requirement that the pass pattern-matcher depends only on
  `syntax-rules` (no `syntax-case`), recording this as a self-hosting enabler. The
  hand-rolled pass-framework decision itself is unchanged.
- `macro-system`: Add a requirement that `syntax-rules` is sufficient to host a runtime
  pattern matcher — including whatever construct the spike identifies as required (the
  candidate being the ellipsis-escape `(... ...)`).

## Impact

- **Code**: `src/match.sls` (replaced), `src/passes/expand.ss` (possibly extended), and all
  pass files that use `match` (pattern rewrites). No change to runtime, emit output, or
  observable compiler behavior — the full test suite is the regression oracle.
- **Dependency removed**: the `(chezscheme)` `syntax-case` surface (`datum`, `errorf`,
  `trace-define-syntax`) that `match.sls` imports; the new matcher is portable
  `syntax-rules`.
- **Self-hosting**: removes the `match`/`syntax-case` blocker; unblocks compiling the
  passes with scheme-llvm's own expander. `syntax-case` is explicitly deferred, not
  implemented.
- **Risk**: the literal↔binder convention differs between the nanopass `,x` style and
  Wright/SRFI style; a mis-migrated literal silently becomes a catch-all binder. Mitigated
  by convention choice and by testing each pass against the existing suite.
