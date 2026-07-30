## Why

Emit has no unspecified value. It has **two**, split along the Scheme/C boundary: the syntactic forms
and the prelude's `void` yield `#f` (`src/parse.ss` desugars one-armed `if` to `(const #f)`), while
every side-effecting C primitive returns `NIL_V` — the empty list (`rt_display`, `rt_newline`,
`rt_write_char`, `rt_vector_set`, …). Each is R7RS-conforming in isolation, so this is not a bug
against the report, but the drift is invisible in the source and has two concrete costs.

The visible cost is the REPL. `run_thunk` echoes every result unconditionally via `rt_write`, so an
interactive session today reads:

```
> (display "hi")
hi()
> (vector-set! v 0 1)
()
```

Nothing can be suppressed, because `()` and `#f` are legitimate results that must print when a program
really returns them.

The structural cost is that `#f` is, of all candidate values, the one that forecloses diagnosis: it
collides with a constantly-tested legitimate result, so `(if (side-effect!) …)` is indistinguishable —
to a reader, a linter, or the compiler — from a deliberate test. That permanently rules out the one
demonstrated-useful tool in this area, Gauche's `GAUCHE_CHECK_UNDEFINED_TEST`.

`docs/return-values.md` surveys ~40 implementations and the standards' design record (Rozas on
`rrrs-authors` 1989; R7RS-WG1 ballots #68 and #49) and recommends the convergent answer: one
distinguished value, not `#f`, exactly one value, printed non-readably, suppressed by the REPL,
generator exposed, predicate withheld. `src/runtime/runtime.c` already *reserves* the encoding —
misc-immediate subtypes "2,3,… (eof-object, unspecified, …)" — so the representation costs one subtype
constant, no new primary tag, no heap allocation, and no header word.

## What Changes

- **New immediate.** Add `SUB_UNSPEC` as misc-immediate subtype 2 under `TAG_BOOL`, with an
  `UNSPEC_V` constant and an `is_unspec` accessor, mirrored in the emitter's constant encoder
  alongside the existing `TRUE_V`/`FALSE_V` cases.
- **Single source of the value.** `(if #f #f)`, `(void)`, `when`/`unless` with an untaken branch,
  no-match `cond`/`case`, and `for-each` all yield the new immediate. `src/parse.ss` stops desugaring
  one-armed `if` to `(const #f)`.
- **C primitives converge.** Every side-effecting `rt_*` entry point that currently returns `NIL_V`
  as a stand-in for "unspecified" returns `UNSPEC_V` instead.
- **Printed non-readably** as `#<unspecified>` by `write` and `display`. No reader syntax — the value
  is not a datum.
- **REPL suppression.** `run_thunk` prints nothing (no value, no newline) when the result is the
  unspecified value; every other value prints as today.
- **No predicate.** `(void)` stays as the generator; no `unspecified?` is added, per R7RS-WG1 ballot
  #49 (rejected 6:3).
- **Documented as unreliable**, following Chez's wording: this is what Emit happens to return, not a
  promise, and portable programs must not rely on it.
- **BREAKING** (behavior, not API): `(if (if #f #f) 'a 'b)` changes from `'b` to `'a`, and
  `(null? (display ""))` from `#t` to `#f`. Both old and new results are R7RS-conforming. No test in
  `test/` or `demos/` depends on either — verified by grep.

Explicitly **out of scope**: a Gauche-style branch-test diagnostic (this change only makes it
possible), a reader syntax, an `unspecified?` predicate, an `eof-object` immediate (subtype 3, the
obvious follow-on), and the unspecified *evaluation-order* divergence between the JIT and AOT paths
noted in `demos/records.scm` — a different category needing its own change.

## Capabilities

### New Capabilities

None. This change pins down a value the language already has rather than adding a capability.

### Modified Capabilities

- `core-language`: Adds a requirement fixing the identity and representation of the unspecified value
  — one distinguished immediate, distinct from `#f`, `()`, and every other value; always exactly one
  value; written `#<unspecified>`; no reader syntax; no predicate. Existing requirements that say a
  form "returns the unspecified value" (`write-char`, `display`, `newline`, `write`, `for-each`,
  record setters, hash-table mutators, two-armed `if`, `when`/`unless`, `void`) keep their wording but
  gain a definite referent; the **Two-armed if** requirement's parenthetical "(the value denoted by
  `(if #f #f)`)" is replaced by a reference to the new requirement.
- `interactive-repl`: Modifies **Read-eval-print loop prints results interactively** to require
  suppressing the echo when the result is the unspecified value.
- `aot-codegen`: Modifies the immediates requirement so the unspecified value is emitted as an inline
  tagged immediate, alongside fixnums, booleans, `()`, and characters, with AOT/JIT parity.

## Impact

- `src/runtime/runtime.c` — `SUB_UNSPEC`/`UNSPEC_V`/`is_unspec`; the tag-walking printer shared by
  `rt_display`, `rt_write_val`, and `rt_write`; the ~dozen side-effecting `rt_*` entries returning
  `NIL_V`.
- `src/emit.ss` — constant encoder (the `#t`/`#f` immediate cases).
- `src/parse.ss` — one-armed `if` desugaring.
- `src/prelude.scm` — `void`; `%for-each1`/`%for-eachn` base cases.
- `src/emit.cpp` — `run_thunk` REPL echo suppression.
- `bootstrap/` — regenerated seed IR, since the prelude and parser change (`tools/regen.sh`).
- `docs/return-values.md` — record the decision; `docs/PRIMITIVES.md` if it enumerates return values.
- Risk: the value representation is shared verbatim between `runtime.c` and the LLVM IR emitter, so
  the two must be changed together or the mismatch is silent.
