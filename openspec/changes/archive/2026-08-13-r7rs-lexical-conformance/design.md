## Context

Four defects — #74, #80, #81, #86 — are batched here because they share a **fix cycle**, not a
topic. `make regen` is a barrier (~12 min) and the dev suite is ~25 min, so the unit of economy is
the cycle. Three of the four edits land in `src/prelude.scm` and one in `src/passes/expand.ss`, both
`CORE_FLAT`, so one regen carries them; the fourth is `src/runtime/runtime.c`, which reaches the
binaries through plain `make` and does not touch the barrier at all. All four are verified by one
command, `test/r7rs-suite-tests.sh`, which fails on a stale exclusion as loudly as on a failing form.

The relevant current state:

- **The reader is purely functional over a string.** `rd-datum` / `rd-list` / `rd-hash` take a `ci`
  flag as a *downward* parameter and return `(datum . next-index)`. Failure is signalled by returning
  a pair whose cdr `rd-fail?` recognizes, which the entry points (`read-from-string`, `rd-all`,
  `read`) turn into an error through `rd-report`. The substrate cannot raise — design D10 of
  `scheme-base-partition` keeps the handler chain out of it — so every new failure must travel this
  sentinel channel.
- **`cond` and `case` are prelude `syntax-rules` macros** (`src/prelude.scm:53`, `:66`) over a
  **name-based, non-hygienic** expander. `cond`'s literals list is `(else =>)` today.
- **`match-pat` (`src/passes/expand.ss:81`) decides wildcard-vs-literal by testing `_` first.**
  `pattern-vars` (`:71`) makes the same test in the same order, and both treat `...` structurally
  before consulting literals.
- **`flonum_format` (`src/runtime/runtime.c:317`) is shared** by `rt_flonum_to_string`
  (`number->string`) and `print_val` (`display`, `write`, and the final-value printer). It walks
  `%.*g` precision from 1 to 17 and stops at the first that survives `strtod`.

Constraint that shapes several decisions below: **the reader is baked into the compiler**
(`*prelude-source*`), so it reads the compiler's own sources on the next regen, and any source form
Chez accepts but Emit refuses is a cross-host divergence of the kind `library-include-declarations`
already produced once.

## Goals / Non-Goals

**Goals:**

- Retire exactly the 22 exclusion rows tagged `issue-74`, `issue-80`, `issue-81`, `issue-86`.
- Keep every fix at the level of a table entry or a precedence ordering — no new mechanism, so no
  shared design risk between the four and each independently revertible.
- Replace the reader's silent wrong answers with reports, since a silent misread is what let
  `#\alarm` mean `#\a` unnoticed until an external suite was pointed at it.

**Non-Goals:**

- `#!fold-case` / `#!no-fold-case` and datum labels (#75) — see D7.
- Hygienic auxiliary-keyword matching (#92) — see D4.
- Write style for named characters — see D8.
- Any change to how exclusions are declared or checked. `r7rs-conformance`'s requirements are
  unchanged; only its data moves.

## Decisions

### D1: An unknown character name is reported, reversing a documented "undefined"

`rd-char-name` ends in `[else (string-ref tok 0)]` — "unknown name: first char" — and the
`core-language` reader requirement blesses it: "Malformed input for these extensions (an unrecognized
escape, an unknown character name, or a misplaced `.`) is undefined for this subset."

That fallback is not a neutral choice: it is the direct cause of thirteen of #74's rows. `#\alarm`
did not fail, it *answered 97*, and no test can catch an answer that looks like a valid character.
The name-table gap and the silent fallback are one defect, and fixing only the table would leave the
next missing name equally invisible.

`rd-char` returns the `rd-fail` sentinel for an unknown name, with a new reason and a matching
`rd-report` arm naming the offending name. No new machinery: this is the channel `rd-unterminated-string`
and `rd-rational` already use.

*Alternative considered — extend the table, keep the fallback.* Cheaper, and it clears the rows.
Rejected because it preserves the property that made the bug undetectable, and this change is the
only one that will be reading this function closely for a while.

### D2: `#\x` disambiguates on token length, not on lookahead

`#\x` is the letter `x`; `#\x41` is `A`. `rd-char` already splits on token length — length 1 takes
the single-character path — so the hex arm belongs on the multi-character side, before the name
table: a token whose first character is `x` and whose remainder is all hex digits is a codepoint.
Anything else falls to the name table and, per D1, is now reported.

This ordering makes `#\xyz` an error rather than the character `x`, which is correct — R7RS defines
no character named `xyz` — and it costs no lookahead in `rd-hash`.

### D3: `case` gains `=>` in its literals list; the two new rules precede their non-receiver twins

Two rules, ordered before the clause forms they would otherwise be shadowed by:

```scheme
((_ k ((d ...) => f) clause ...) (if (memv k (quote (d ...))) (f k) (case k clause ...)))
((_ k (else => f)) (f k))
```

`(else => f)` must precede `(else e ...)` and `((d ...) => f)` must precede `((d ...) e ...)`, or the
receiver form matches the general rule and `=>` is expanded as an ordinary expression — which is
exactly today's `unbound variable =>`. The key is already bound to a hygienic temp by the
compound-key rule, so the receiver gets the key without re-evaluating it; the existing rules
established that shape and these follow it.

`case`'s literals list widens from `(else)` to `(else =>)`.

### D4: #92 is inherited, not introduced, and is left to #92

Widening `case`'s literals list extends the reach of #92 — a shadowed `=>` is matched by spelling, so
`(let ((=> #f)) (case 1 ((1) => 'ok)))` will misread just as `cond` does today. This is worth stating
plainly rather than discovering later: the change makes an existing defect apply to one more form.

It is not fixable here. Matching an auxiliary keyword by *binding* requires resolving identifiers
through a lexical environment the expander does not maintain — hygiene, in a name-based expander —
which is an open-ended change worth one exclusion row. #92 fixes `cond` and `case` in one stroke when
it lands, and having both forms wrong in the same way is a *better* starting point for it than having
one wrong and one absent.

### D5: The literals list outranks `_` and `...`, at all four sites

R7RS §4.3.2 gives the literals list priority over both special identifiers. The precedence is decided
in four places, and a partial fix is worse than none because it leaves the two halves inconsistent:

| Site | Current | Fixed |
|---|---|---|
| `match-pat`, wildcard arm | `_` tested first | literals tested first |
| `match-pat`, ellipsis arm | `(eq? (cadr pat) *ellipsis*)` unconditional | not when `...` is a literal |
| `pattern-vars`, special-identifier arm | `_`/`...` tested first | literals tested first |
| `pattern-vars`, ellipsis descent | unconditional | not when `...` is a literal |

Only the first clears an exclusion row (the suite's ellipsis-as-literal case is blocked behind other
gaps, so its status is unknown). The other three are fixed anyway because they are the same one-line
question, and because "worth checking `...` for the same precedence bug while there" is what the issue
asks for.

The change is inert for every rule with an empty or ordinary literals list, which is every macro in
the compiler's own sources — so the expected effect on emitted IR is nil, and any movement is a
signal worth investigating rather than noise.

### D6: Flonum positional preference is *offered then verified*, inside a magnitude gate

The rule, in `flonum_format` so that `display`, `write`, `number->string`, and the final-value printer
all move together:

1. Find the shortest round-tripping `%.*g` precision, exactly as today.
2. If that rendering used exponent notation **and** the value's decimal exponent is in `[-3, 10)`,
   render positionally and accept the positional form **only if it survives the same `strtod`
   comparison**. Otherwise the exponent form stands.

**The range is Chez's, measured rather than chosen.** Probing `chez` across the `1eN` and `1.5eN`
series puts its switchover at exactly the same two points in both — positional for a decimal exponent
in `[-3, 9]`, exponent form outside it, independent of how many significant digits the value needs:

```
1e-4 -> 1e-4        1e-3 -> 0.001     1e9 -> 1000000000.0     1e10 -> 1e10
1.5e-4 -> 1.5000000000000001e-4       1.5e-3 -> 0.0015        1.5e9 -> 1500000000.0     1.5e10 -> 1.5e10
```

`test/dump-parity-tests.sh` compares Emit's stage dump against Chez's for the same program, and Chez
is the bootstrap host, so a printer that agrees on which *digits* to emit but disagrees on which
*notation* is a two-host divergence in the sense this project treats as a defect elsewhere. An earlier
draft of this decision used `[-10, 21)` (JavaScript's convention); it would have printed `1e20` as
`100000000000000000000.0`, introducing a parity divergence while fixing a conformance one.

**What this does and does not close.** `%g` is not neutral about notation either, and its rule —
exponent form when the decimal exponent is `< -4` or `>= precision` — is what the range interacts with:

- **Fixed:** exponent form chosen because the value needed *fewer significant digits than its
  magnitude*. That is the whole of the defect (`1e+02` for `100.0`, `1e+09` for `1000000000.0`), and it
  is what all three `issue-86` rows test — each is
  `(test-numeric-syntax "1e2" 100.0 "100.0" "100.")`.
- **Not touched, and unchanged by this edit:** the *low* switchover and the *exponent spelling*. `%g`
  already renders `exp >= -4` positionally, so `0.0001` prints as `0.0001` where Chez prints `1e-4`,
  and `FLO_POS_EXP_MIN` never fires for it. Values above the range keep `%g`'s `1e+10` where Chez
  writes `1e10`. Both divergences exist today, both survive this change untouched, and neither is
  covered by an exclusion row.

So this decision narrows the gap at the point the rows measure; it does not claim to close it. Closing
it means forcing exponent form below `-3` and rewriting `e+NN` to `eNN`, which would change `0.0001` to
`1e-4` — a user-visible change no row requires, and the right size for its own issue rather than a
rider on this one. `FLO_POS_EXP_MIN` is kept as a stated bound even though `%g`'s rule makes it
currently unreachable, so the intent survives if that rule is ever replaced.

The gate is also a **buffer constraint**, and the measured range clears it with room to spare:
`flonum_format` writes through `snprintf(buf, 32, …)`, and positional `1e300` needs 300 characters. At
the two edges, with the 17 significant digits the loop can ask for, the worst cases are
`-1234567890.1234567` (19 bytes) at `E = 9` and `-0.` plus 19 fraction digits (22 bytes) at `E = -3`.

The verification step means the round-trip property the existing spec requirement guarantees cannot be
lost by an arithmetic slip in computing the digit count — the positional form is a *candidate*, and the
same test that already gates precision gates it. A sweep over `m × 10^e` for `m` in `[1, 10)` by halves
and `e` in `[-12, 25]` confirms round-trip, the `.`-or-exponent invariant, and the 32-byte bound at
every point.

*Alternative considered — compute the positional digit count and trust it.* Rejected: it makes the
round-trip guarantee depend on exponent arithmetic being right at the extremes, where it is hardest to
get right and where no test will look.

### D7: `#!fold-case` is cut, and #75 stays whole

Sized against the reader as it stands, `#!fold-case` is not the table entry its issue suggests. R7RS
§7.1.1 places a directive in *intertoken space* — anywhere whitespace may appear — and applies it to
the **remainder of the port**. Emit's reader threads `ci` downward as a parameter; propagating a
directive rightward means `rd-skip-ws` returning a flag beside its index, which changes its contract
across the whole reader *and* the REPL's input-completeness probe that deliberately shares it. `read`
would additionally need a `ci` slot on the port record, reversing `scheme-io-library` design D3 ("No
folding over a port").

The cheap version — an arm shaped like `#;` that reads the next datum with the flag flipped — passes
the suite's `(read (open-input-string "#!fold-case ABC"))` and is wrong: it scopes to one datum, not
the port. That is the silently-partial semantics `reader-lexical-conformance` refused for rational
literals, on the reasoning that partial support advertises a notation the implementation does not
have.

So #75 keeps both halves and gets its own change, sequenced after `set-car!`/`set-cdr!` and `write`
cycle detection, as its issue already proposes. Cost to this change: one of the 22 rows stays.

### D8: `#\page` is added as a recorded extension, because D1 makes its absence fatal

`tools/r7rs-manifest.ss:104` contains `#\page`. It runs under Chez, which accepts it, and Emit's
reader does not — today that would silently read as `#\p`, and after D1 it becomes a hard error. That
is precisely the two-reader divergence `library-include-declarations` created once already: a source
file that compiles under one host and fails under the other.

Adding `page` (12) beside the extensions already present (`altmode`, `esc`, `nul`) costs one table row
and removes the divergence before it can bite. It is not R7RS; it is recorded as an extension, as
those three already are.

### D10: Making the reader case-insensitive drags the PRINTER with it

Found by the suite rather than by reading: `sym_needs_bars` (`src/runtime/runtime.c`) decides whether
`write` must bar-quote a symbol, and its comment states the invariant plainly — it "mirrors what
`src/prelude.scm`'s reader actually does with a token." One of its arms was an exact, case-sensitive
`strcmp` against the three non-finite spellings.

Making `rd-nonfinite` case-insensitive (D-none, part of #74) broke that mirror in the direction that
costs a round trip. `+NaN.0` now reads as a **number**, so the symbol of that name written bare comes
back as a number rather than as itself — and the existing `core-language` requirement "Write style
escapes so its output reads back" is exactly what that violates. The reader change created a printer
defect at a distance.

So the same comparison becomes case-insensitive on the printer side, via a local `ci_streq` (no new
header, no locale, for one comparison). This is not scope creep: it is the other half of a change
already being made, and skipping it would ship a round-trip break that this change introduced.

The general lesson for anything later that touches the reader's token rules: `sym_needs_bars` is a
second implementation of "what would the reader do with this text," and it does not move on its own.

### D11: `+NaN.0abc` is a deliberate divergence, not a defect

The suite also wants `(write '|+NaN.0abc|)` to emit bars; Emit writes it bare. Checked against the
vendored report rather than assumed: R7RS 7.1.1 makes `+NaN.0abc` a legal ⟨peculiar identifier⟩ —
⟨explicit sign⟩ `+`, ⟨sign subsequent⟩ `N`, then ⟨subsequent⟩* `aN.0abc`, where `.` is a
⟨special subsequent⟩ — so the bare spelling is permitted *and* reads back as the same symbol in Emit.
chibi is stricter than the report here.

That makes it a `deliberate:` row in the exclusion manifest with the grammar derivation written into
its note, not an `issue-NN` row. Filing a bug for it would record a defect that does not exist; the
round-trip property the requirement actually asks for holds.

### D9: Write style for named characters is left alone

`print_val` writes `#\space` and `#\newline` by name and every other character raw, so
`(write (integer->char 7))` emits `#\` followed by a bare BEL byte. This *does* round-trip through the
reader — `rd-char`'s single-character path reads it back — so the `core-language` write-style
requirement is satisfied, and no exclusion row depends on it. Emitting the names is a user-visible
output change belonging to its own issue rather than to this change's diff.

## Risks / Trade-offs

**D1 turns silent misreads into compile failures in code outside this repo** → That is the intent, and
D8 removes the one occurrence inside the tree. The blast radius is a program containing a character
name Emit does not know, which today gets a wrong character rather than a message. It belongs in the
first tag's release notes as a behavior change a program can tell.

**The flonum change moves the text of every flonum-printing site at once** → It has to: `flonum_format`
is shared, and splitting it would let `write` and `number->string` disagree, which is a worse defect
than the one being fixed. Existing test expectations containing exponent-form output must be updated in
the same commit — `test/numeric-conformance-tests.sh` has four (`(* 100.0 2.0)` on three doors, and the
bare `100.0` literal). `test/dump-parity-tests.sh` compares Emit's dump against Chez's, and Chez prints
`100.0` — so this should move parity *toward* agreement, and any divergence it reveals is real.

**...but it does NOT move emitted IR.** Worth stating, because the proposal's Impact says the IR of every
program moves and that is true only of the reader and `case` (which are baked into `(scheme base)`), not
of this. The emitter never passes the printer's framing through: `numeric-conformance` design D1 already
established that host framing must not reach IR text, so `ir-double` decomposes whatever the printer
produced into sign + digits + point via `flonum-parts` — which explicitly "handles both doors' framing" —
and re-frames canonically (shorter of positional and scientific, positional on a tie). Only a change to
the *digits* could move IR, and digit selection is untouched. So `test/self-emit-equiv.sh`,
`test/module-scaffold-baseline.sh`, and the committed `bootstrap/*.ll` are insulated from this by
construction rather than by luck.

**Regen may not converge in one pass** → The reader and `case` are baked in, so the compiler that
regenerates is not the compiler being generated. This is the known two-pass condition; run regen to
convergence rather than assuming one pass, and never kill it mid-flight (a mixed-source `bootstrap/` is
recovered with `git checkout -- bootstrap/` on a clean tree).

**D5 could move emitted IR unexpectedly** → It should be inert: no macro in the compiler's own sources
names `_` or `...` as a literal. Treat any IR movement as a signal that a rule was relying on the wrong
precedence, not as expected churn.

**Four fixes in one commit obscures which one broke something** → Mitigated by their independence: each
touches a different function, and each maps to a disjoint set of exclusion rows, so a suite failure
names its own culprit. The tasks sequence the C-side fix first precisely because it needs no regen and
can be validated on its own before the barrier.

## Open Questions

None blocking. One judgment left to implementation: whether `#\escape` and the existing `#\altmode` /
`#\esc` should be reported as one name with two aliases or three independent rows — cosmetic, decided
at the table.
