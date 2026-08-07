## Context

The reader is `rd-*` in `src/prelude.scm` (~250 lines, `rd-skip-ws` through `rd-datum`), and it is
the **only** reader Emit ships: `read-from-string`, `read-all-from-string`, `(scheme read)`'s `read`
over a port, and the self-hosted compiler's own source reading all go through `rd-datum`. The
bootstrap driver reads with Chez's `read` instead, which is why a grammar gap is a *host divergence*
and not merely a missing feature.

Four facts constrain the work.

1. **The reader lives in the substrate and cannot raise.** `scheme-base-partition` design D10 keeps
   `error`/`raise`/`*handlers*` out of `(emit internal)` — duplicating the handler chain would split
   it, so a `guard` around a port error would stop catching it. Every `rd-*` procedure is therefore
   total: it returns an index or a value, never a condition.
2. **Two consumers share `rd-skip-ws`.** The REPL's input-completeness probe (`fc-*`,
   `src/repl-core.ss`) imports it from `(emit internal)` precisely so the probe and the reader cannot
   disagree about where a datum begins. Any change to what counts as leading whitespace is
   automatically a change to the probe's answer — which is a feature here, and a trap if the probe's
   own `fc-hash` is not updated in step.
3. **Every new prelude definition forces a visibility decision.** `src/prelude-surface.scm` declares
   where each name is homed; a definition that is neither listed private nor exported fails
   `test/scheme-base-surface-check.sh`. New `rd-*` helpers go in two lists.
4. **`string->number` already shares the reader's classifiers** for radix 10 (`rd-numeric?`,
   `rd-nonfinite`, `rd-flonum?`) and delegates other radices to `%string->int`. The spec requires
   that sharing; the prefixes must not introduce a second grammar.

## Goals / Non-Goals

**Goals:**

- `#| … |#` (nested) and `#;` read the way R7RS specifies, in every position whitespace or a datum
  may appear, on both readers.
- `#x` `#b` `#o` `#d` `#e` `#i` read, including the legal two-prefix combinations, with one grammar
  shared by the reader and `string->number`.
- Rational literal syntax produces one of R7RS's two sanctioned outcomes instead of a symbol.
- `|foo bar|` reads, and `write` emits bars where they are needed, closing that round trip too.
- An unterminated block comment is reported at the top, and reads as *incomplete* at the prompt.
- No silent divergence left between Chez's `read` and Emit's for the syntax in scope.

**Non-Goals:**

- Exact rationals and bignums (#27). This change makes their absence *speak*; it does not add them.
- `#!fold-case` / `#!no-fold-case`, and datum labels `#0=`/`#0#`.
- A fold-aware read entry (what `include-ci` would need to stop folding bar-quoted symbols, D7).
- Rewriting the reader into a table-driven lexer. The grammar grows by four dispatch arms.

## Decisions

### D1 — Block comments are whitespace; datum comments are not

`#| … |#` is skipped by `rd-skip-ws`, so it works everywhere whitespace already works and the REPL
probe inherits it through the shared helper (constraint 2). Nesting is a depth counter, per R7RS
§7.1.2 — `#| a #| b |# c |#` is one comment.

`#;` cannot live there: discarding a datum requires a full recursive read, and `rd-skip-ws` neither
recurses nor is allowed to fail. It goes in the two places a datum is *dispatched* — `rd-datum` and
`rd-list`'s element loop — as "read the next datum, throw it away, continue". Stacking
(`#;#;a b c` → `c`) falls out of the recursion for free.

*Alternative rejected*: handling `#;` in `rd-skip-ws` by scanning for a balanced datum textually.
That is a second, weaker parser for the same grammar, and it gets strings and character literals
containing parens wrong.

### D2 — Unterminated is a sentinel, not a raise (constraint 1)

`rd-skip-ws` returns `-1` for an unterminated block comment — an index no valid position takes.
`rd-datum` and `rd-list` propagate it; the **entry points** raise, because they live where `error`
does: `read-from-string`, `read-all-from-string`, and `(scheme read)`'s `read`.

This is what makes the prompt behave correctly for free: the probe treats a negative index as
`fc-incomplete`, which is exactly "keep typing". Today an unterminated comment would skip to
end-of-input and the forms after it would **vanish with no diagnostic** — the silent-wrong-answer
failure mode, which is the one worth spending a sentinel to avoid.

### D3 — One number grammar, entered from two places

The token path grows a prefix scanner: at most two `#⟨letter⟩` pairs, then the body, then one
classifier that already exists. Both entry points feed it — `rd-atom` for the reader, and
`string->number` for the procedure — so "any token the reader accepts as a number is accepted here
identically" stays true by construction rather than by review.

Radix and exactness are orthogonal, as R7RS has them:

| prefix set | body | result |
|---|---|---|
| `#x` `#b` `#o` `#d` | integer digits in that radix | exact integer |
| none / `#d` | R7RS decimal (`rd-flonum?`) | flonum |
| `#i` + anything readable | | the inexact value |
| `#e` + integer-valued decimal | `#e1.0`, `#e1e3` | the exact integer |
| `#e` + non-integral decimal | `#e0.5` | implementation restriction (D4) |
| a decimal point or exponent under `#x`/`#b`/`#o` | | invalid number syntax, named |

`string->number` differs in *one* way, and only because R7RS says so: where the reader raises, it
answers `#f` (§6.2.6 — "or would result in a number that cannot be represented, then
`string->number` returns `#f`").

### D4 — Rational literal syntax is refused outright, not by value

R7RS §6.2.3 sanctions two answers for an exact literal the implementation cannot represent: report a
violation of an implementation restriction, or represent it inexactly. Emit takes the **report**,
for consistency with the answer it already gives for the other unrepresentable exact literal: a
fixnum-overflowing integer *traps* rather than silently becoming a flonum or a wrapped value
(`fixnum-overflow-trap`). A language that refuses to quietly change the value of
`1152921504606846976` should not quietly change the value of `1/2`.

The report is for the **syntax**, not for the value: `4/2` and `#i1/2` are refused too, though both
denote numbers Emit can represent. Accepting those would advertise a notation the implementation
does not have — a user who finds `4/2` working will write `1/3` next — and it would make the rule
"rationals work sometimes", which is harder to state than "Emit has no rationals". The message says
so and names the alternative:

```
read: 1/2 is rational literal syntax, which this implementation does not support
      -- Emit has no exact rationals; write 0.5, or (/ 1 2)
```

`#e` applied to a non-integral decimal (`#e0.5`) reports for the same reason, though it is an
exactness conversion rather than rational syntax.

*Alternatives rejected*: reading `1/2` as `0.5` — sanctioned, and what several Schemes do, but it
makes `(= 1/3 (/ 1 3))` quietly true and hides the missing feature exactly when the user could have
learned about it. Accepting the representable subset (`4/2`, `#i1/2`) — the partial-support surface
above; and if it ever turns out to matter, admitting those later is purely additive.

### D5 — The probe mirrors both forms, and its own `fc-hash` is the trap

`fc-hash` currently dispatches `#(`, `#\`, and "anything else is a token". `#|` and `#;` must be
added there too: the shared `rd-skip-ws` covers a comment in *leading* position, but the probe walks
the rest of the form itself. Without the mirror, `(list 1 #;2` would be reported malformed where the
reader would call it incomplete — the two disagreeing about the same text, which is the failure the
sharing exists to prevent.

### D6 — Regenerate the `.sld` files; expect every program's IR to move

The reader is part of `(scheme base)` and of the baked substrate, so this change moves emitted IR
for every program — unlike `library-include-declarations`, where nothing moved. That is expected and
must be *stated* when `test/module-scaffold-baseline.sha256` is re-recorded: the baseline protocol
asks for the delta to be explained, and "the reader gained four dispatch arms and N helpers" is the
explanation. `lib/scheme/base.sld`, `lib/scheme/read.sld`, and `lib/emit/internal.sld` are generated
from the prelude and are committed build inputs; regenerate them in the same change or the guards
fail.

### D7 — Bar-quoted identifiers need the printer as much as the reader

`|foo bar|` is R7RS §7.1.1 identifier syntax, and it is half of a round trip Emit does not currently
close in **either** direction: the reader rejects the syntax, and the printer never produces it, so
`(write (string->symbol "a b"))` prints `a b` — two symbols when read back. Adding only the reader
would leave the break in place, so both land together:

- **Reader**: `|` opens an identifier that runs to the matching `|`, with `\|` and `\xHH;` escapes
  (the same escape vocabulary strings already have, which is what R7RS specifies). The result is an
  ordinary interned symbol — there is no separate "bar symbol" type, because R7RS says there is not:
  `(eq? '|foo| 'foo)` is true.
- **Printer** (`print_val`, `src/runtime/runtime.c`): write style emits bars around a symbol whose
  name would not read back as that symbol — empty, containing whitespace, a delimiter, `|`, or `"`,
  or beginning with a character that would start a number or another datum. `display` is unchanged:
  it writes the raw name.

**What this deliberately does not fix**, despite what the `include-ci` limit suggests: a bar-quoted
symbol still folds under `include-ci`. That fold (change `library-include-declarations`, design D6)
runs over the forms the reader **already returned**, where `|MixedCase|` and `MixedCase` are the
same object. Fixing it requires a *fold-aware read* — folding during tokenization, where the bars
are still visible — which means a second reader entry threading a fold flag through `rd-*`. That is
a coherent next step and not this one; it should be filed so the `include-ci` note has somewhere to
point.

One consequence worth naming: `render-datum` (`src/core.ss`) writes the `.exports` artifacts and
must stay readable by **both** hosts. It renders a symbol as its bare name today, which is correct
because every name it writes is a mangled identifier. If a symbol needing bars ever reaches it, it
would produce an artifact neither reader reads back — so the printer's "needs bars?" predicate is
the natural thing for it to grow later, and the reason to keep that predicate stateless and
shareable.

## Risks / Trade-offs

- **The two hosts must agree on the new syntax too.** Chez already implements all of it, so the risk
  is Emit accepting something Chez rejects (or valuing it differently) → the cross-host suites
  (`self-emit-equiv`, `dump-parity`, `prelude-base-run-tests`) compare emitted IR, and the include
  suite's reader-corners fixture regains its block comment, which is the case that found the gap.
- **`1/2` erroring is a behavior change for a program that used it as a symbol.** Vanishingly
  unlikely, and it is the reading R7RS does not sanction → stated in the change and in the release
  notes for the tag.
- **IR moves everywhere** (D6), so this change should not ride alongside another IR-shaping one; the
  baseline re-record must be attributable to exactly one cause.
- **A sentinel index is a new convention in the `rd-*` layer** → it is the same convention the probe
  already uses (`fc-incomplete` = `-1`), which is why `-1` and not `#f`: the arithmetic call sites
  keep working on a fixnum.
- **The printer change is visible to anything that writes a symbol**, including the stage dump and
  the REPL's value echo → the predicate fires only for names that would not read back, so every
  symbol any current test prints is unaffected; the dump-parity suite compares Emit's dump against
  Chez's `pretty-print`, which bar-quotes on the same condition, so that suite is the cross-check.
- **Prefix scanning adds work to every token read**, and the reader is on the compiler's own hot
  path (it reads its own source) → the scan is two character comparisons on tokens beginning with
  `#`, which the token path already dispatches separately; measure `emit run` on a large source
  before and after and record it in `docs/PERFORMANCE.md` if it shows.

## Open Questions

Both of this design's open questions were settled before implementation:

1. ~~Should `#e`/`#i` accept a rational body?~~ **No** — rational syntax is refused outright,
   regardless of prefix or value (D4).
2. ~~`|bar quoted identifiers|`: file it, or fold it in?~~ **Folded in**, together with the printer
   half that makes it a round trip (D7).

What remains to be filed, and is explicitly not in scope here: a **fold-aware read** entry, which is
what `include-ci` needs to stop folding bar-quoted symbols (D7).
