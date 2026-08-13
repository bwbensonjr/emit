## Why

Four filed defects account for **22 of the 386 rows** in `test/r7rs/exclusions.tsv`, and every one of
them is a missing table entry or a wrong ordering — not a missing mechanism:

```console
$ emit run <<< '(display (list #true #false))'
emit: unbound variable rue                    # rd-hash returns after one char

$ emit run <<< '(display (char->integer #\alarm))'
97                                            # want 7 -- read #\a, silently

$ emit run <<< '(display (case (car (quote (c d))) ((a) 1) (else => (lambda (x) x))))'
emit: unbound variable =>                     # case has no receiver rule

$ emit run <<< '(display 100.0)'
1e+02                                         # shortest round-trip, wrong convention
```

They are batched because of what a fix cycle costs here, not because they are one topic.
`make regen` is a barrier (~12 min) and the dev suite is ~25 min, so the unit of economy is the
*cycle*, and these four share one: three edits land in `src/prelude.scm`, one in
`src/passes/expand.ss` — both `CORE_FLAT`, so one regen carries all four — and the fourth is in
`src/runtime/runtime.c`, which reaches the binaries through plain `make` and costs nothing on the
barrier at all.

They also share one **verification command**. `test/r7rs-suite-tests.sh` checks the exclusion
manifest *in both directions*: a form that starts passing while still listed fails the suite as a
stale exclusion. So deleting the 22 rows is not bookkeeping after the fact — it is the mechanical
definition of done, and no fix in this set can be claimed without its rows coming out.

What makes the batch safe is the absence of shared design risk. None of the four needs new
machinery, none can regress another, and each is independently revertible.

## What Changes

### The reader learns five lexical forms (#74, 16 rows)

- **`#true` / `#false`** read as `#t` / `#f`. `rd-hash` dispatches on the single characters `t`/`f`
  and returns immediately, leaving `rue` / `alse` for the next read.
- **The R7RS §6.6 named characters** `#\alarm` (7), `#\backspace` (8), and `#\escape` (27) join the
  nine names already there. `#\delete`, `#\nul`/`#\null`, `#\altmode`/`#\esc` already work.
- **`#\xHH…`** reads a hexadecimal codepoint, so `#\x03BB` is λ. The string form `"\x41;"` is already
  supported, which is what makes the character form's absence an inconsistency rather than a gap.
  Bare `#\x` stays the letter `x`.
- **The string escapes `\a` (7) and `\b` (8)** join `\n \t \r \\ \"`, and **`\`-newline** becomes the
  R7RS §6.7 line continuation: backslash, optional intraline whitespace, newline, optional intraline
  whitespace, all elided.
- **The non-finite tokens become case-insensitive**, so `+INF.0` and `+NaN.0` read as `+inf.0` and
  `+nan.0`. This is not in #74's issue body; it is three of the sixteen rows tagged to it, found while
  reading the manifest.

- **BREAKING (in the narrowest sense): an unknown character name is now reported.** `rd-char-name`
  today falls back to "the first character of the name", which is exactly what turned `#\alarm` into
  `#\a` with no diagnostic, and the current spec text calls this case undefined. It becomes an error
  naming the bad name. A program that relied on `#\foo` meaning `#\f` stops compiling — which is the
  point.

### `case` gains the `=>` receiver clause (#81, 2 rows)

`(case k ((a b) => f) (else => g))` applies the receiver to the key. Two `syntax-rules` rules on the
prelude's `case` macro, following the shape `cond`'s `=>` rule already has. `cond` supports `=>`
today; `case` reports `unbound variable =>`.

### A `syntax-rules` literals list outranks `_` and `...` (#80, 1 row)

`match-pat` tests for the wildcard by name *before* consulting the rule's literals, so `_` named in a
literals list never gets to be a literal. R7RS §4.3.2 gives the literals list priority. The same
precedence is wrong in `pattern-vars`, and the same question applies to an ellipsis identifier named
as a literal — the suite's neighbouring case, currently blocked behind other gaps. All four sites are
fixed together; fixing only `_` would leave the half of §4.3.2 that no test currently reaches.

### Flonums prefer positional notation (#86, 3 rows)

`flonum_format` walks `%.*g` precision upward until the text round-trips, and stops at the first
precision that does — which for `100.0` is `1e+02`. Round-trip is preserved but the convention is
wrong: every other Scheme prints `100.0`, and the existing spec requirement already asks for a
rendering "visually distinguishable from an exact integer" without saying which of the two forms to
prefer. Exponent form becomes the fallback for magnitudes outside a stated decimal-exponent range,
not the default for any value whose shortest `%g` happens to use it.

### Not in this change

- **`#!fold-case` / `#!no-fold-case` and datum labels (#75).** Both were considered for this batch and
  cut. R7RS §7.1.1 puts a directive in *intertoken space* and applies it to the remainder of the
  **port**; Emit's reader threads `ci` strictly downward as a parameter, `rd-skip-ws` returns only an
  index, the port record has no `ci` slot, and `scheme-io-library` design D3 records "No folding over a
  port" as a deliberate decision. Honest support means changing `rd-skip-ws`'s contract across the
  whole reader — including the REPL completeness probe that shares it — and reversing D3. That is
  machinery, and admitting it would forfeit the property that justifies batching the other four. The
  datum-scoped approximation that would pass the suite is the same silently-partial semantics
  `reader-lexical-conformance` explicitly refused for rational literals. #75 stays whole for its own
  change, sequenced after `set-car!`/`set-cdr!` and `write` cycle detection as its issue already says.
- **Write style for named characters.** The write-style printer emits `#\space` and `#\newline` by name
  and every other character raw, so `(write (integer->char 7))` writes `#\` followed by a bare BEL.
  That still round-trips through the reader this change ships, no exclusion row depends on it, and
  changing it is a user-visible output change of its own. Worth an issue, not worth this change's
  diff.
- **#92 (`cond` treats a shadowed `=>` as receiver syntax).** Its issue proposes pairing it with #80
  since both are auxiliary keywords matched by spelling. They are not comparable in size: #80 is a
  precedence reordering, while #92 needs identifiers resolved through a binding environment — real
  hygiene in a name-based expander — for one row. Note that adding `=>` to `case`'s literals list
  extends #92's exposure from `cond` to `case`; that is inherited from how every literal is matched
  today, not introduced here, and #92 fixes both at once when it lands.

## For the first tag's release notes

Two user-visible behavior changes belong in the notes, because a program can tell:

- **An unknown character name now reports instead of yielding its first letter.** `#\alarmm` used
  to read as `#\a`; it now names the bad name. A program that relied on the old fallback stops
  compiling — which is the point, since the fallback is what hid `#\alarm` meaning `#\a`. In the same
  family, `#tfoo` is reported rather than read as `#t` followed by the symbol `foo`.
- **A round flonum prints positionally**, so `(display 100.0)` writes `100.0` where it wrote
  `1e+02`. The digits are unchanged and every value still reads back; only the notation moves, and
  only for decimal exponents in `[-3, 9]`. This also brings the printer into agreement with Chez,
  which is what the two doors are compared against.

Also worth a line, as additions rather than changes: `#true`/`#false`, the R7RS character names
(`#\alarm`, `#\backspace`, `#\escape`, and `#\delete`) plus `#\page`, the `#\xHH` character form,
the `\a` and `\b` string escapes, the `\`-newline line continuation, case-insensitive `+INF.0`,
`case` with a `=>` receiver clause, and a `syntax-rules` literals list that correctly outranks `_`
and `...`.

## Capabilities

### New Capabilities

None. Every gap here is in a capability that already exists.

### Modified Capabilities

- `core-language`: the reader requirement gains `#true`/`#false`, three named characters, `#\xHH`,
  the `\a`/`\b` escapes and the `\`-newline line continuation, and its "an unknown character name is
  undefined" clause becomes a reported error; the non-finite-token requirement gains case
  insensitivity; the `case` requirement gains the `=>` receiver clause; and the flonum-printing
  requirement gains a stated preference for positional over exponent notation.
- `macro-system`: the pattern-matching requirement states that an identifier in the literals list is
  matched as a literal even when it is spelled `_` or `...`.

`r7rs-conformance` needs no delta. Its requirements govern how exclusions are *declared and checked*,
and both are unchanged — 22 rows leave the manifest, which is that capability working as specified.

## Impact

- `src/prelude.scm` — `rd-hash` (`#true`/`#false`), `rd-char-name` (three names, and the fallback
  becomes a failure), `rd-char` (the `x<hex>` arm), `rd-str-esc` (`\a`, `\b`), `rd-string` (the line
  continuation), `rd-nonfinite` (case folding), the `rd-report` arm for the new failure reason, and the
  `case` macro.
- `src/prelude-surface.scm` — any new `rd-*` helper needs a home in **both** the private list (line
  160) and `*substrate-rehomed*` (line 286), or `test/scheme-base-surface-check.sh` fails.
- `lib/scheme/base.sld`, `lib/scheme/read.sld`, `lib/emit/internal.sld` — generated; regenerate with
  `tools/gen-scheme-base.ss` and commit if the surface moves.
- `src/passes/expand.ss` — `match-pat` and `pattern-vars` precedence.
- `src/runtime/runtime.c` — `flonum_format`. The only non-`CORE_FLAT` edit, and the only one that does
  not ride the regen barrier.
- **`make regen` is required** and the emitted IR of every program moves: the reader and `case` are
  part of `(scheme base)`.
- `test/r7rs/exclusions.tsv` — 22 rows removed; the suite fails if any is removed early or left late.
- `test/read-all-tests.ss`, `test/numeric-conformance-tests.sh`, `test/expander-tests.ss` — where the
  new cases belong beside the existing ones.
- `docs/r7rs/*` — the reader-limitations and number-printing paragraphs.
- Closes #74, #80, #81, #86.
