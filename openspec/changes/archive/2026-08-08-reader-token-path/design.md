## Context

`include-ci` folds `|MixedCase|` to `mixedcase` (**GitHub issue #61**). The fold is
`fold-datum-case` in `src/core.ss`, running over forms the reader already returned
(`library-include-declarations` design D6), by which point the bars are gone. R7RS §7.1.1 makes the
characters between the bars the symbol's name literally, so no fold placed after reading can be
right.

This change was originally scoped to fix `docs/PERFORMANCE.md` P12 alongside it, on the theory that
both live in `rd-atom` and one `make regen` should serve both. **The baseline measurement retired
that half** — see D7 — so what follows is the fold, plus the bookkeeping the measurement forced.

**Constraints inherited from the reader as it stands** (all from `reader-lexical-conformance`):

1. **D2 — no rd-\* procedure may raise.** The reader is homed in `(emit internal)`, and
   `scheme-base-partition` D10 keeps `error`/`raise` out of the substrate. Failures travel as
   negative indices; only the entry points raise, through `rd-report`.
2. **D3 — one number grammar, two entrances.** `rd-atom` and `string->number` must accept exactly
   the same tokens as numbers, and today that holds *by construction* — both call `rd-number`.
   Nothing here disturbs it, which is one of the reasons the P12 rework was dropped rather than
   deferred: it was the only part of the original plan that weakened this.
3. **D1 — a block comment is whitespace**, skipped in `rd-skip-ws`, so the REPL completeness probe
   inherits it. Nothing here touches that.

And one from `docs/PERFORMANCE.md`:

4. **P9** — an optional argument costs every call site its cross-unit direct call.
   `read-all-from-string` is called from the compiler core across a unit boundary, on the hot path.

## Goals / Non-Goals

**Goals:**

- `include-ci` folds unquoted symbols and leaves a bar-quoted identifier's name literal, on **both**
  hosts (issue #61).
- The fold reaches every symbol the reader produces, including inside vector literals, which the
  shape-walking `fold-datum-case` misses today.
- P12 is left accurate: corrected numbers, corrected scope, and a benchmark that can be regenerated.
- One `make regen`.

**Non-Goals:**

- **No change to the token dispatch.** `rd-atom`, `rd-token-end`, `rd-number`, and the classifiers
  keep their present structure. (Dropped from this change — D7.)
- No Unicode case folding in Emit. There is no `char-downcase` in the substrate today and this
  change does not add case tables (D5).
- No new reader features, no port-side folding, and no change to `rd-skip-ws`, the sentinel
  encoding, or the probe.
- Not fixing the dev door's missing optimization pipeline. That is filed, not built (D7).

## Decisions

### D1 — The fold flag is a threaded argument, not a mutable global, and not an optional argument

Folding has to happen where the bars are still visible, so `rd-atom` needs to know whether it is
folding. Three ways to tell it:

- **A module-level flag set around the read.** One variable reference in `rd-atom` — but a `set!`
  variable is boxed (P7), so that is an unbox per token, and it puts mutable state in a reader whose
  entire discipline is that the scan position is threaded functionally. Worse, the entry points
  *raise* through `rd-report`: a report with the flag still set leaves the next read folding, so
  every failure path acquires a restore obligation the reader has no `dynamic-wind` to enforce.
  Rejected.
- **An optional argument on `read-all-from-string`.** P9 — every call site loses its cross-unit
  direct call, and the ordinary read is the compiler's own hot path. Making every read pay for the
  rare folding one is precisely backwards. Rejected.
- **A fixed extra argument threaded through the descent.** Taken. A *fixed* arity is what P9 leaves
  alone, and it matches how the scan position already travels. It touches only the procedures on the
  path from an entry point to `rd-atom` — `rd-datum`, `rd-list`, `rd-hash`, the quote/quasiquote/
  unquote sugar arms, and `rd-atom` itself. `rd-string`, `rd-char`, `rd-bar`, `rd-hex`,
  `rd-skip-ws`, `rd-token-end` and every classifier are untouched: none of them produces a symbol
  from an unquoted token.

`rd-bar` not taking the flag is the fix for #61 stated as code: the folding argument does not reach
the procedure that reads between bars, so a bar-quoted name cannot be folded.

**Folding happens on the symbol arm, never on the raw token.** `rd-atom` already classifies before
it interns — it calls `rd-number` and reaches `string->symbol` only on `rd-not-a-number`. The fold
goes on that arm. Folding the token first would put a case conversion in front of every number the
compiler reads and would change the text handed to the parsers; `1E3` becoming `1e3` is harmless,
but "the fold changes no value" should hold by construction rather than by luck.

### D2 — A separate `-ci` entry point, spelled the way R7RS spells case-insensitivity

`read-all-from-string-ci` — one argument, folding — sits beside `read-all-from-string`, and both are
thin wrappers over one internal worker that takes the flag. The `-ci` suffix is R7RS's own spelling
for this (`string-ci=?`, `char-ci=?`, and `include-ci` itself), which ties the name to the
declaration it exists for. Issue #61 sketches it as `read-all-from-string/fold`; the `-ci` spelling
is preferred for that tie.

**It is a published `(scheme base)` export, and two attempts to hide it failed for reasons worth
recording.**

*Attempt 1 — "homed as unstable surface (`*scheme-base-unstable*`)".* That list **does not exist**:
`scheme-base-partition` retired the `unstable` export tier (issue #32) when its last two names moved
into `(emit internal)`. The rule it encoded survives as a fact about the partition — "a name reaches
a public export list because R7RS puts it there or because Emit publishes it deliberately, never
because an internal consumer needs it."

*Attempt 2 — home it in the substrate, which is where that rule now sends such a name.* `(emit
internal)` sits outside the `(scheme ...)` namespace precisely to say "not API", and
`src/include-reader.ss` reaches it through `src/import-substrate.scm`'s single
`(import (emit internal))`. **The regen refused it:**

```
repl: unbound variable rd-report
```

`rd-all`, the worker both entry points wrap, calls `rd-report` — and `rd-report` is the reader's one
name that *raises*, so `scheme-base-partition` D10 keeps it out of the substrate along with
`error`/`raise`. It is homed `((scheme base) private) ((scheme read) private)`, a private copy in
each library that reports. A whole-source entry point reports; therefore it cannot live below the
line where reporting lives, and neither can its worker.

So the homing follows the constraint rather than the preference: `rd-all` is an ordinary
`*scheme-base-private*` helper, and `read-all-from-string-ci` is an ordinary `(scheme base)` export
beside the `read-all-from-string` it wraps. Only the fold helpers `rd-fold-char`/`rd-fold-token` go
to the substrate, because `rd-atom` is there and neither of them raises.

**Publishing it is the cost of the D10 line, and a small one.** `(scheme base)` already publishes the
non-folding twin as a deliberate extension, so this adds one name to a surface that already carries
the concept — 128 exports to 129. The argument for hiding it (no user asked for a folding variant of
an extension) is real, but weaker than the argument for not fragmenting the reader's reporting
discipline, which is a rule the whole partition rests on.

### D3 — Both doors fold at read time, and neither protocol changes

The core already hands the include reader the declaration that asked:
`(reader WHO FILENAME BASE) -> (TOKEN . FORMS)` (`library-include-declarations` D2). `WHO` is
`include-ci` exactly when folding is wanted, so both doors dispatch on an argument they already
receive.

- **Emit** (`src/include-reader.ss`) — `read-all-from-string-ci` instead of
  `read-forms-from-string` when `who` is `include-ci`.
- **Chez** (`src/compile.ss`) — `(parameterize ([case-sensitive #f]) (read-program path))`. Chez's
  reader already draws the distinction R7RS requires; verified directly:

  ```
  case-sensitive #f:  MixedCase -> mixedcase    |MixedCase| -> MixedCase
  ```

`fold-datum-case`, `fold-string-case`, and `fold-char-case` are then deleted from `src/core.ss` —
`included-body-forms` is their only caller — and its `fold?` parameter goes with them.

**A second defect this closes on the way past.** `fold-datum-case` walks symbols and pairs and
returns everything else unchanged, so a symbol inside a `#(...)` vector literal in an `include-ci`'d
file is not folded today. A reader-level fold reaches every symbol the reader produces, wherever it
sits, because it folds at the point of production rather than by walking a shape.

### D4 — The ASCII/Unicode fold divergence is documented and fixture-pinned, not closed

Chez's `case-sensitive` folds Unicode — `ÉCOLE` → `école`, verified — where Emit's fold has always
been ASCII-only (`fold-char-case` tests codepoints 65–90 by hand; there is no `char-downcase`
anywhere in `src/`). Today both hosts share the one ASCII fold, so they agree. After this change
they agree on ASCII and diverge on a non-ASCII uppercase identifier inside an `include-ci`'d file.

Three ways out, and the third is taken:

- *Give Emit Unicode case folding.* Case tables in the substrate for one caller, with a binary-size
  cost against the project's flagship concern. Rejected — out of proportion.
- *Report a non-ASCII uppercase character in a folded file as an implementation restriction*, the
  answer Emit gives for `1/2` and for fixnum overflow. Attractive and idiomatic, but recognizing
  "uppercase" outside ASCII needs the same tables. Rejected for the same reason.
- **Document the limit and pin the agreement by fixture.** `include-ci` is a compatibility form for
  old case-folding Scheme, which is ASCII by construction. The limit is recorded where the ASCII
  limit is recorded today, and a fixture in `test/library-include-tests.sh` exercises mixed-case and
  bar-quoted ASCII on both hosts.

### D5 — Trading a construction guarantee for a tested one, deliberately

`library-include-declarations` D6 put the fold in the core precisely so the two hosts could not
implement folding differently — "one fold, in the core, cannot diverge." This change gives that up.
The reason is that the guarantee was guaranteeing the wrong answer: both hosts agree, and both are
wrong about `|MixedCase|`, and no fold placed after reading can be right.

The replacement is the arrangement the include reader itself already uses. `src/include-reader.ss`
says it outright: it is an implementation independent of `src/compile.ss`'s, and "two independent
implementations of one rule is also what lets the cross-host equivalence suites measure them against
each other." Path resolution, the source home, and cycle detection already live under exactly this
regime. Folding joins them, pinned by an `include-ci` fixture that
`test/self-emit-equiv.sh` compares across the two doors.

### D6 — The benchmark gets a generator, because a described benchmark is not reproducible

P12 records "1.6 MB / ~200k tokens (50k symbols, 50k integers, 50k decimals, 50k strings)" and no
way to rebuild that file. Re-deriving it from the description produced 200k tokens in **1,939,560
bytes** — the same token count, a different file — so P12's absolute seconds are not comparable to
anything measured later, which is most of why its numbers went unquestioned for as long as they did.

`tools/gen-reader-bench.ss` is committed: fixed-seed LCG, byte-identical across runs and machines,
exact per-kind counts. The generated file itself is not committed (2 MB of noise); the generator is.
Any later reader measurement regenerates the same bytes.

### D7 — Why the P12 half was dropped, and what replaces it

The baseline measurement (task 1.2) compared the pre-regression tree (b102070, built in a worktree)
against HEAD on one input:

| door | pre-regression | HEAD | delta |
|---|---|---|---|
| `emit run`, total wall clock | 3.72 s | 4.47 s | +20.2% |
| — of which fixed compile + JIT | 0.61 s | 0.83 s | +0.22 s |
| — **the read itself** | 3.11 s | 3.64 s | **+17%** |
| `emit build` binary (AOT `-O2 -flto`) | 2.84 s | 2.84 s | **none** |
| Chez-hosted (min of 20) | 33.0 ms | 36.5 ms | +10.6% |

Medians of five interleaved runs on an idle machine. The fixed row is easy to miss and matters: `emit run` JIT-compiles the baked set first, and `reader-lexical-conformance` grew `(emit internal)` 170,716 → 289,754 B, so 0.22 s of the 0.75 s delta is compiling a larger substrate rather than reading. `emit run` creates a plain `LLJITBuilder().create()` with no IR
optimization pipeline (`src/emit.cpp:839`); the AOT link passes `-O2 -flto` (`src/emit.cpp:1337`;
`ship-opt`/`ship-lto` at `src/compile.ss:299`). The regression exists on the unoptimized door and
not in the shipped artifact — consistent with P12's own diagnosis of per-call overhead, since
inlining is what removes that. (The `-O2` result is measured; *which* inlining decision removes it
is inference, and is not claimed as more.)

Three consequences, and each is a reason not to do the rework here:

1. **P12's stated justification inverts.** "The reader is on the compiler's own hot path — it reads
   its own source" argues for urgency, but the compiler is an AOT `-O2` binary, so its own reads are
   on the *unaffected* path. The cost lands on `emit run` and the REPL: a dev-loop cost.
2. **The fix would hand-fold what `-O2` already folds** — and would cost D3 its by-construction
   shared-grammar guarantee, replacing it with a corpus test. Real complexity, for a benefit
   confined to the door that does not optimize.
3. **The measurement found a bigger item.** No IR optimization pipeline on the dev door is a cost
   every JITted program pays on every call, not just the reader's. That is the entry the numbers
   actually justify.

So: P12 is **rewritten, not ticked** — corrected numbers, corrected scope, its value re-rated
against the door it affects, and a pointer to the generator. The dev-door pipeline becomes a new
`PERFORMANCE.md` entry. Neither is implemented here; this change ships the fold.

*Alternative rejected — do the rework anyway, since it helps `emit run` and the REPL.* It does, and
if the dev door never gets an optimization pipeline it may be worth revisiting. But doing it now
means paying the D3 cost to fix a symptom whose cause is one entry down the list, and doing it
*inside a correctness change* means the regen that fixes #61 also carries an optimization nobody
measured a need for on the ship path.

## Risks / Trade-offs

- **The two hosts can now drift on folding**, and Chez folds Unicode where Emit does not. → D4's
  fixture and D5's cross-host pin. Accepted knowingly; the alternative preserves a wrong answer.

- **Threading an argument through the descent is a wide, mechanical diff.** → Arity mismatches are
  compile-time errors, and the whole edit/test loop runs under `chez --libdirs src` with
  `test/read-all-tests.ss` for feedback, with no regen until the end.

- **Every program's IR moves**, because the reader is in a baked library. →
  `test/module-scaffold-baseline.sha256` is re-recorded with the reason, exactly as
  `reader-lexical-conformance` did; expect the delta to be confined to the baked libraries with
  every PROGRAM module byte-identical, and check that rather than assume it.

- **`make regen` is a barrier** (CLAUDE.md). All source edits finish before it; a source edit after
  it fails `test/trust-check.sh` ~25 minutes into the dev run, and a killed regen leaves
  `bootstrap/` mixed-source.

- **Behavior change for existing source.** A file included with `include-ci` that contains a
  bar-quoted mixed-case identifier now defines a different name than it did. This is the fix, and
  the population is close to empty — `include-ci` exists for old case-folding Scheme, which predates
  bar syntax being used this way. No deprecation path is warranted.

- **The threaded argument costs the ordinary read something**, on the door that does not inline. →
  Measured, not assumed: the same benchmark runs before and after, and a folding read is measured
  too. If the plain read regresses on `emit run`, that is a finding to record, not to hide.

## Open Questions

None.
