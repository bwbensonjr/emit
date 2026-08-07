## Why

Emit's in-language reader is behind R7RS §7.1 lexical syntax in two ways that a user meets by
typing ordinary Scheme:

```console
$ printf '#| a comment |#\n(display 1)\n' | emit run
emit: unbound variable |                     # issue #59
$ printf '(display (list 1 #;2 3))\n' | emit run
emit: unbound variable                       # issue #59, and the name is empty
$ printf '(display #x1f)\n' | emit run
emit: unbound variable x1f                   # issue #25
$ emit run <<< '(display (quote 1/2))'
1/2                                          # a SYMBOL, which R7RS does not sanction
```

Each failure blames an identifier the author never wrote, because every unrecognized lexeme falls
through the token path into `string->symbol`.

**`library-include-declarations` (#18) raised the stakes.** A library can now `include` a file, and
that file is read by *two different readers* — Chez's `read` under the bootstrap driver, Emit's own
reader inside the binary. Any grammar Emit lacks is now a source file that **compiles one way and
fails the other**: the block comment in that change's own test fixture is what surfaced #59, and it
had to be removed from the fixture with a pointer to the issue. That is a divergence between the two
hosts the whole self-hosting story rests on, and the suites can only catch it where a fixture
happens to exercise it.

Two of these are **round-trip** defects of the kind `numeric-conformance` already fixed once for
`+inf.0` — which, note, is already done: the reader accepts the three non-finite tokens today, so
what remains of #25 is the prefixes and `1/2`, not the infinities its body still describes. The same
break exists for symbols: `(write (string->symbol "a b"))` prints `a b`, which reads back as two
symbols, because the printer emits no bars and the reader accepts none.

On the numbers: `number->string` produces `#x`-free text today, but `(number->string 255 16)` → `"ff"`
reads back as a symbol unless the radix is supplied out of band, and R7RS's own notation for saying
so — `#x` — is not accepted anywhere. `1/2` is worse than unsupported: R7RS §6.2.3 gives exactly two
sanctioned outcomes for an unrepresentable exact literal (report a violation of an implementation
restriction, or represent it inexactly), and reading it as an identifier is a third.

## What Changes

- **Block comments.** `#| … |#` is skipped as whitespace, **nested** as R7RS requires, everywhere
  whitespace is skipped — between top-level forms, inside a list, between a quote and its datum.
- **Datum comments.** `#;` discards the next datum, at top level and inside a list, including
  before a closing paren and stacked (`#;#;a b`).
- **Radix and exactness prefixes.** `#x` `#b` `#o` `#d` `#e` `#i` are read, in either case, singly
  and in the two-prefix combinations R7RS allows (`#x#e1f`, `#e#x1f`). A decimal point or exponent
  stays radix-10 only; `#i` yields the inexact value, `#e` the exact one where it exists.
- **Rational literal syntax is refused outright.** Emit has no exact rationals, so `n/m` is a
  **reported implementation restriction naming the literal** — the same answer
  `fixnum-overflow-trap` gives an unrepresentable exact integer — rather than a silent symbol. Every
  `n/m` is refused, including the ones whose value happens to be representable (`4/2`, `#i1/2`):
  partial support would advertise a notation the implementation does not have.
- **`string->number` keeps sharing one grammar with the reader**, so it accepts the prefixes too —
  and, per R7RS, answers `#f` where the reader raises, since `string->number` is specified to return
  `#f` for a number it cannot represent.
- **Bar-quoted identifiers.** `|foo bar|` reads as the symbol with those characters, with the same
  `\|` and `\xHH;` escapes R7RS §7.1.1 gives it — and `write` **emits** bars for a symbol whose
  name would not read back without them, so `(write (string->symbol "a b"))` stops printing `a b`
  and starts printing `|a b|`. Both halves are needed for the same round-trip property the rest of
  this change is about; today the reader has no bar syntax *and* the printer emits none.
- **The REPL's input-completeness probe learns the same two comment forms**, so an unterminated
  `#|` or a `#;` with nothing after it reads as *incomplete — keep typing* rather than as a
  malformed form. The probe and the reader share `rd-skip-ws` deliberately; this change keeps that
  true instead of letting the two drift.
- **An unterminated block comment is reported, not swallowed.** The substrate reader cannot raise
  (design D10 of `scheme-base-partition` keeps the handler chain out of it), so the skipper answers
  a sentinel that the entry points — `read-from-string`, `read-all-from-string`, `read` — turn into
  an error naming the position. Today the input would read as end-of-file and the forms after the
  comment would vanish silently.

**Not in this change**: exact rationals or bignums (#27 owns the representation question, and this
change only makes their absence *say so*); `#!fold-case` / `#!no-fold-case`; the `#` datum-label
syntax for circular structure.

Note what bar-quoted identifiers do **not** fix: `include-ci`'s case fold still folds `|MixedCase|`,
because that fold runs over the forms the reader already returned, where a bar-quoted symbol and a
bare one are the same object. Fixing it needs a *fold-aware read* — a reader entry that folds as it
tokenizes — which is a separate step this change deliberately leaves for its own issue.

## Capabilities

### New Capabilities

None. This closes gaps in a capability that exists.

### Modified Capabilities

- `core-language`: the reader requirement gains the two comment forms and bar-quoted identifiers;
  `string->number` gains the prefixes; the write-style requirement gains bar-quoting for symbols;
  and three requirements are added — the prefixed number syntax, what a rational literal does, and
  that an unterminated block comment is an error rather than an end of input.
- `compiler-embedding`: the input-completeness probe SHALL agree with the reader about where a datum
  begins, which now includes both comment forms and `|…|` — an unterminated one is *incomplete*, not
  *malformed*.

## Impact

- `src/prelude.scm` — `rd-skip-ws` (block comments + the unterminated sentinel), `rd-datum` /
  `rd-list` (`#;`), `rd-hash` (prefixes), the numeric classifier/parser (radix, exactness, rational),
  `string->number`, and the three entry points that raise.
- `src/prelude-surface.scm` — every new `rd-*` helper needs a home in `*scheme-base-private*` **and**
  `*substrate-rehomed*`, or `test/scheme-base-surface-check.sh` fails. The file already anticipates
  this: "the in-language reader (issue #25 will change these; they are not API)".
- `lib/scheme/base.sld`, `lib/scheme/read.sld`, `lib/emit/internal.sld` — **generated**; regenerate
  with `tools/gen-scheme-base.ss` and commit.
- `src/runtime/runtime.c` — the value printer's write style gains bar-quoting for a symbol that
  needs it (`print_val`). This is the only C-side change, and it is what makes `write` output read
  back.
- `src/repl-core.ss` — `fc-hash` / `fc-datum` / `fc-list` mirror the two comment forms, and `|…|`
  becomes a datum extent like a string (unterminated → incomplete).
- **`make regen` is required** (the prelude is baked in as `*prelude-source*`), and the emitted IR of
  every program will move: the reader is part of `(scheme base)`.
- `test/read-all-tests.ss`, `test/io-ports-tests.sh`, `test/numeric-conformance-tests.sh`,
  `test/repl-interactive-tests.sh` — where the new cases belong beside the existing ones.
- `test/library-include-tests.sh` — restore the block comment in its reader-corners fixture, which
  is the cross-host case that found #59.
- `docs/r7rs/*` and `docs/PROJECTS.md` — the "Numbers" and reader limitations paragraphs.
