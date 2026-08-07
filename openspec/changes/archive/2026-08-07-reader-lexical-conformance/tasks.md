> **Regen barrier** (`CLAUDE.md`): `src/prelude.scm`, `src/prelude-surface.scm`, and
> `src/repl-core.ss` are all baked into the binaries, so every source edit below must be finished
> before `make regen`. Iterate with `chez --libdirs src --script src/compile.ss` meanwhile.
>
> **This change moves emitted IR for every program** (the reader is part of `(scheme base)`), unlike
> the include change that preceded it. Do not land it alongside another IR-shaping change: the
> `test/module-scaffold-baseline.sha256` re-record has to be attributable to exactly one cause.

## 1. Block comments (issue #59, design D1/D2)

- [x] 1.1 Teach `rd-skip-ws` (`src/prelude.scm:855`) to skip `#| … |#` with a **nesting depth
      counter**, so `#| a #| b |# c |#` is one comment. — `rd-block-open?` / `rd-skip-block`.
- [x] 1.2 Return a negative sentinel for an unterminated block comment rather than skipping to the
      end of input (design D2). The `rd-*` layer performs no raising — design D10 of
      `scheme-base-partition` keeps the handler chain out of the substrate — so the condition
      travels as a value. **Not a bare `-1`**: the sentinel encodes the position (`-3 - p`) so the
      report can name it, and a failing result is `(REASON . sentinel)`. Design D2 was updated to
      say so; `-1`/`-2` stay free for the probe's own codes.
- [x] 1.3 Propagate the sentinel through `rd-datum` / `rd-list` without arithmetic on it (the
      accessors `rd-fail?` / `rd-fail-pos` are the only decoders), and raise at the three entry
      points that can: `read-from-string`, `read-all-from-string`, and `read` over a port. One
      `rd-report` builds every message, naming the position and — by re-reading the token there —
      the offending text.
- [x] 1.4 Confirm a comment inside a **string literal** is still string content — `rd-string` runs
      before any of this, but the case is cheap to get wrong and cheap to pin.

## 2. Datum comments (issue #59, design D1)

- [x] 2.1 Add `#;` to `rd-datum`: read the next datum, discard it, read the one after. Stacking
      (`#;#;a b c`) falls out of the recursion. — landed in `rd-hash`'s `;` arm, which is reached
      only from `rd-datum`'s `#` dispatch, so it is that arm.
- [x] 2.2 Add it to `rd-list`'s element loop as well, so `(1 #;2 3)` and `(1 2 #;3)` both work —
      including immediately before the closing paren, where there is no following element. That
      case also needed `rd-atom` to stop returning an empty symbol at a delimiter it does not
      claim: `(1 2 #;)` used to spin `rd-list` forever on a zero-width token.
- [x] 2.3 `#;` with nothing after it is the same unterminated case as 1.2: sentinel out, error at
      the entry point, *incomplete* at the prompt.

## 3. Number prefixes and rational literals (issue #25, design D3/D4)

- [x] 3.1 Add a prefix scanner to the token path: at most one radix prefix (`#b` `#o` `#d` `#x`) and
      at most one exactness prefix (`#e` `#i`), in either order, either case.
- [x] 3.2 Route the body through the existing classifiers — `rd-numeric?` / `rd-parse-int` for
      decimal integers, `%string->int` / `%radix-digits` for other radices, `rd-flonum?` /
      `%string->flonum` for decimals — so no second numeric grammar appears.
- [x] 3.3 Enforce that a decimal point or exponent is radix-10 only; `#x1.8` is reported as invalid
      number syntax naming the token.
- [x] 3.4 `#i` yields the inexact value; `#e` yields the exact one where it exists.
- [x] 3.5 Report rational literal syntax `n/m` outright, naming the literal (design D4) — every
      `n/m`, including `4/2` and `#i1/2` whose values are representable, and `#e0.5`. Never a symbol.
      The message names the alternatives (`0.5`, `(/ 1 2)`).
- [x] 3.6 A `#`-token that is none of the recognized forms is reported as unrecognized syntax naming
      it, instead of falling through `rd-hash`'s `[else]` arm into `string->symbol` — the arm that
      produced `unbound variable x1f` and `unbound variable |`.
- [x] 3.7 Extend `string->number` (`:506`) through the same scanner, with a prefix in the text
      winning over the `radix` argument, and returning `#f` — not raising — where the reader reports
      a restriction (R7RS §6.2.6).

## 4. Bar-quoted identifiers, both halves (design D7)

- [x] 4.1 Reader: `|` opens an identifier that runs to the matching `|`, with `\|` and `\xHH;`
      escapes. The result is an ordinary interned symbol — `(eq? '|foo| 'foo)` is `#t` — so this is a
      new lexeme, not a new type. Unterminated uses the same sentinel as 1.2.
- [x] 4.2 Printer (`print_val`, `src/runtime/runtime.c`): write style emits `|…|` around a symbol
      whose name would not read back — empty, or containing whitespace, a delimiter, `|`, or `"`, or
      starting like a number or another datum — escaping `|` and `\` inside. `display` unchanged.
- [x] 4.3 Confirm no symbol any existing test prints changes shape: the predicate must fire only for
      names that genuinely need bars, or every dump and REPL echo in the suites moves.
- [x] 4.4 Round trip: `(write (string->symbol "a b"))` then reading that text yields an `eq?` symbol.
- [x] 4.5 Leave `render-datum` (`src/core.ss`) alone but note the coupling in its comment: it writes
      `.exports` artifacts that BOTH hosts read back, and every name it writes today is a mangled
      identifier that needs no bars (design D7's closing note).

## 5. The interactive probe (issue #59 item 3, design D5)

- [x] 5.1 Mirror both comment forms in `fc-hash` / `fc-datum` / `fc-list` (`src/repl-core.ss:679+`).
      The shared `rd-skip-ws` covers only a comment in leading position; the probe walks the rest of
      the form itself.
- [x] 5.2 Map the unterminated sentinel to `fc-incomplete`, not `fc-malformed`, so a block comment
      can be typed across lines at the prompt.
- [x] 5.3 Check the probe and the reader agree on the same text: anything the reader consumes as one
      datum, the probe reports complete with the same extent. — Six interactive sessions in
      `test/repl-interactive-tests.sh` type each construct ACROSS lines, so a value only appears if
      every intermediate prefix was answered "keep typing"; the value itself is what says the two
      then agreed on the extent.

## 6. Surface bookkeeping and generated libraries (design D6)

- [x] 6.1 Add every new `rd-*` helper to **both** `*scheme-base-private*` and `*substrate-rehomed*`
      in `src/prelude-surface.scm`. A definition in neither fails
      `test/scheme-base-surface-check.sh`; the file's reader comment already says "issue #25 will
      change these".
- [x] 6.2 Regenerate `lib/scheme/base.sld`, `lib/scheme/read.sld`, and `lib/emit/internal.sld` with
      `tools/gen-scheme-base.ss` and commit them — they are committed build inputs
      (`tools/regen.sh` derives `bootstrap/scheme.base.ll` from `base.sld`).

## 7. Tests

- [x] 7.1 Reader cases in `test/read-all-tests.ss`: nested block comments, a comment in each
      position (top level, inside a list, between quote and datum), `#;` including before a closing
      paren and stacked, comment syntax inside a string, and the unterminated error.
- [x] 7.2 Numeric cases in `test/numeric-conformance-tests.sh`: each radix prefix, case
      insensitivity, a sign after a prefix, both prefix orders, `#x1.8` rejected, `1/2` reported,
      `4/2` integral, `#i1/2`, and the `#x` + `number->string` round trip.
- [x] 7.3 `string->number` cases beside them, including a prefix beating the radix argument and
      `#f` where the reader raises.
- [x] 7.4 Probe cases in `test/repl-interactive-tests.sh`: a multi-line block comment typed across
      lines is *incomplete* then completes; `(list 1 #;` is incomplete; a session survives an
      unterminated comment and evaluates the next form.
- [x] 7.5 Restore the block comment in `test/library-include-tests.sh`'s reader-corners fixture and
      drop the `#59` pointer beside it — that fixture is the **cross-host** case, and it is the one
      that found this.
- [x] 7.6 Port-reader case in `test/io-ports-tests.sh`: `read` over a file whose text contains both
      comment forms.
- [x] 7.7 Bar-quoted identifier cases beside the write-style ones: `|foo bar|` reads, `(eq? '|foo|
      'foo)`, the two escapes, `write` emitting bars, `display` not, and the write/read round trip.
      Include a case asserting an ORDINARY symbol still prints bare — that is what says the
      predicate is not over-firing.

## 8. Docs

- [x] 8.1 `docs/PROJECTS.md`: the Numbers paragraph says what `1/2` now does, and the reader
      limitations lose the comment entries.
- [x] 8.2 `docs/MODULES.md`: the `include-ci` note explains that a bar-quoted symbol still folds,
      and why that is a separate remaining gap.
- [x] 8.3 Note in the change what the release notes for the first tag should say: `1/2` used to read
      as a symbol and now reports, and `write` now bar-quotes symbols that need it.
- [x] 8.4 `docs/r7rs/` cross-references: §7.1.1 identifiers and §7.1.2 comments are now implemented;
      §6.2.5 prefixes are implemented and rationals deliberately are not. — **Nothing to edit
      there**: `docs/r7rs/` is a verbatim copy of the report and carries no Emit annotations at all
      (`grep -rl Emit docs/r7rs/` is empty), so it has no conformance notes to cross-reference. The
      statement this task wanted lands in `docs/PROJECTS.md`'s new **Lexical syntax** bullet (8.1),
      which names what is implemented and what deliberately is not (`#!fold-case`, datum labels).

## 9. Regen, suites, close-out

- [x] 9.1 `make regen` (~12 min), watching for the two-pass prelude/bootstrap ordering case. — Ran
      three times (the second folded in the `repl-irritant->string` number arm, the third the
      reader's classifier ordering). Each reached the fixed point at iteration 2 in ~16 min; the
      two-pass ordering case did not arise.
- [x] 9.2 `./run-all-tests.sh`, then `./run-dev-tests.sh` (individually if a suite outlives the
      command timeout). — `run-all-tests.sh`: 24 suites, 0 failed. One pre-existing case had to
      move with the change: `numeric-conformance`'s "the deferred reader syntax is unchanged",
      which pinned `(symbol? (read-from-string "1/2"))` as `#t` — the very deferral this change
      ends. It is replaced by the three sections that pin what took its place.
- [x] 9.3 Re-record `test/module-scaffold-baseline.sha256` **with the delta explained** per that
      script's protocol: the reader is in `(scheme base)`, so every program's IR moves. Confirm the
      move is confined to the reader — the cross-host suites (`self-emit-equiv`, `dump-parity`,
      `prelude-base-run-tests`) must still pass, which is what says the two readers still agree. —
      All 80 hashes moved, as predicted. Verified against an 80-demo before/after capture from a
      detached-HEAD worktree, split at `; ==EMIT-UNIT-BOUNDARY==`: every demo's **program** module
      is byte-identical and every demo's unit count is unchanged; the whole delta is the two baked
      libraries (`(emit internal)` 170716 → 289754 B, `(scheme base)` 338670 → **330361** B — it
      shrank, which is the three numeric kernels re-homed into the substrate). The log entry in
      `test/module-scaffold-baseline.sh` records this.
- [x] 9.4 Measure `emit run` on a large source before and after (design's last risk): the prefix
      scan is on the compiler's own hot path. Record it in `docs/PERFORMANCE.md` only if it shows.
      — It shows: **3.65 s → 4.37 s** (+20%) for `read-all-from-string` over a generated 1.6 MB /
      ~200k-token file, five interleaved runs per binary. Recorded as **P12**. The cause is not the
      prefix scan the design worried about — it is one procedure call per token per classifier, and
      the micro-fix (ordering the rational scan after the classifiers) is worth ~10% under Chez and
      nothing on the self-hosted door, which is what says the cost is structural. P12 names the
      three fixes that would remove work rather than move it.
- [x] 9.5 Commit, then `test/trust-check.sh` (it `[SKIP]`s while `bootstrap/` is dirty). — Passed:
      "committed IR is exactly what the current source regenerates". Worth recording the trap it
      caught first: a **comment-only** edit to `src/prelude.scm` invalidates `bootstrap/`, because
      the prelude is baked in as the `*prelude-source*` string constant *verbatim* — comments
      included. Unlike `src/core.ss` and the passes, which are compiled and whose comments vanish.
      That is what failed `self-host-fixpoint` ("4 diff lines") on the first dev-tests run, together
      with `.sld` files not regenerated after the last two prelude edits.
- [x] 9.6 `openspec validate --all`, including the main specs. — 21 items, 0 failed.
- [x] 9.7 Reference both issues from the commit (`Fixes #59`, `Fixes #25`) and comment on #27 that
      its §2 reader-grammar overlap with #25 is closed, leaving it the representation question.
      Note in #25's close that the non-finite half was already done by `numeric-conformance` — its
      body still describes it as open.
- [x] 9.8 File the follow-up this change deliberately leaves: a **fold-aware read** entry, which is
      what `include-ci` needs to stop folding bar-quoted symbols (design D7). — Filed as
      [#61](https://github.com/bwbensonjr/emit/issues/61); both pointers below now name it. The
      `include-ci` note in
      `docs/MODULES.md` and the limit comment in `src/core.ss` should point at it.
