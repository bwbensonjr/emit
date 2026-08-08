## 1. Baseline and measurement

Everything here runs without a regen. Sections 1.1–1.2 are done and are what re-scoped the change
(design D7): the P12 rework was dropped, so sections 2–3 of the original plan are gone.

- [x] 1.1 Regenerate the P12 benchmark input — ~200k tokens (50k symbols, 50k integers, 50k
      decimals, 50k strings) — and record the generator alongside it so the measurement is
      reproducible rather than described. — `tools/gen-reader-bench.ss`, fixed-seed LCG,
      byte-identical across runs. Exactly 200k tokens in 25k forms, but **1,939,560 bytes**, not
      1.6 MB: P12's original file was not reproducible, which is why this generator now exists.
      Every number below is on this file, so the comparisons are internally valid; P12's absolute
      figures are not comparable to them.
- [x] 1.2 Record the **before** numbers with the design D7 method: five interleaved runs per binary,
      self-hosted and Chez-hosted. — **The expectation was wrong, and that is the finding.**
      Measured the pre-regression tree (b102070, built in a worktree) against HEAD:

      | door | pre-regression | HEAD | delta |
      |---|---|---|---|
      | `emit run` (JIT, no opt pipeline) | 4.36 s | 5.04 s | **+15.6%** |
      | `emit build` binary (AOT, `-O2 -flto`) | 3.20 s | 3.08 s | **none** |
      | Chez-hosted | 39.4 ms | 44.4 ms | +13% |

      Medians of five interleaved runs. The regression P12 records is **real on the unoptimized
      dev door and absent from the shipped artifact**. `emit run` builds a plain
      `LLJITBuilder().create()` with no IR optimization (`src/emit.cpp:839`); the AOT link passes
      `-O2 -flto` (`src/emit.cpp:1337`, `ship-opt`/`ship-lto` in `src/compile.ss:299`). P12
      measured `emit run` and recorded the result as a property of the reader.

## 2. The fold flag and its entry point (issue #61, design D1/D2)

Iterate with `chez --libdirs src` and `test/read-all-tests.ss`; no regen until section 5.

- [x] 2.1 Thread a fixed fold argument through the descent only — `rd-datum`, `rd-list`, `rd-hash`,
      and the quote/quasiquote/unquote arms — to `rd-atom`. Do **not** give it to `rd-bar`,
      `rd-string`, `rd-char`, `rd-hex`, `rd-skip-ws`, `rd-token-end`, or any classifier. Update
      `read`'s call site in the port section to pass the non-folding default.
- [x] 2.2 Fold in `rd-atom` **on the symbol arm only** — the `rd-not-a-number` branch that reaches
      `string->symbol` — so the fold cannot reach a number's text. ASCII only: codepoints 65–90 map
      down, everything else passes through.
- [x] 2.3 Add `read-all-from-string-ci` beside `read-all-from-string`, both one-argument wrappers
      over one internal worker taking the flag. Not an optional argument (P9), not a mutable global
      (design D1).
- [x] 2.4 Home `read-all-from-string-ci` in `src/prelude-surface.scm` under `*scheme-base-unstable*`
      with the one-line reason: exported so the compiler core can resolve it, not API. — **Two
      attempts to hide it failed; it is a published `(scheme base)` export.** (1) That list does not
      exist: `scheme-base-partition` retired the `unstable` tier (issue #32). (2) Homing it in
      `(emit internal)` via `*substrate-rehomed*` — where that tier's rule now lives — was refused by
      the regen with `repl: unbound variable rd-report`: the worker `rd-all` reports, and D10 keeps
      reporting out of the substrate. Only `rd-fold-char`/`rd-fold-token` live there (`rd-atom` calls
      them and neither raises). `(scheme base)` goes 128 → 129 exports. Design D2 rewritten with
      both dead ends, so the next person does not retry them.
- [x] 2.5 Extend `test/read-all-tests.ss` with the six ADDED-requirement scenarios: unquoted folds,
      bars stay literal, `(A |A|)` stays two symbols, folding reaches quoted and vector structure,
      strings/characters/numbers untouched, and `read-all-from-string` itself still does not fold.

## 3. Both doors fold at read time (design D3)

- [x] 3.1 `src/include-reader.ss` — dispatch on the `who` the core already passes: `include-ci`
      reads with `read-all-from-string-ci`, everything else with `read-forms-from-string`. No change
      to the `(reader WHO FILENAME BASE) -> (TOKEN . FORMS)` protocol.
- [x] 3.2 `src/compile.ss` — `driver-include-reader` reads an `include-ci` file inside
      `(parameterize ([case-sensitive #f]) ...)`.
- [x] 3.3 `src/core.ss` — delete `fold-datum-case`, `fold-string-case`, and `fold-char-case`, and
      drop the `fold?` parameter from `included-body-forms`. Replace the D6 comment block with one
      stating where folding now happens and why it moved. — Also required, and not anticipated:
      `read-all-from-string-ci` had to be declared in `*scheme-base-elsewhere*` and the committed
      `lib/**/*.sld` regenerated with `chez --script tools/gen-scheme-base.ss`, or
      `test/scheme-base-gen-check.sh` fails. `lib/scheme/read.sld` moved too, since `read` calls
      `rd-datum` at its new arity.
- [x] 3.4 Grep for any remaining caller of the deleted helpers before regen; there should be none.

## 4. Fixtures that replace the construction guarantee (design D4/D5)

- [x] 4.1 Extend the `include-ci` fixture in `test/library-include-tests.sh` with mixed-case **and**
      bar-quoted ASCII identifiers, plus a symbol inside a vector literal, asserting the names the
      module-system spec scenarios name. — Mixed-case and bar-quoted done (`LEGACY` → `legacy`,
      `|KeepCase|` kept, its body still folded). **The vector case could not go through a door**: a
      quoted vector cannot be lowered as a constant at all (`bad const ?`, filed as issue #64), so
      it is pinned at the reader in `test/read-all-tests.ss` instead, and the fixture comment says
      why it is not here.
- [x] 4.2 Confirm the fixture is on a path `test/self-emit-equiv.sh` compares across the two doors;
      if it is not, add the cross-host assertion explicitly rather than assuming coverage. — **It is
      not**: `self-emit-equiv.sh` compiles inline source strings with `--emit-ir --no-prelude`, so it
      never reads an included file. The equivalent assertion already exists one suite over —
      `library-include-tests.sh`'s driver section builds `geom.ll` through the Chez door and `cmp`s
      it byte-for-byte against the Emit door's. That is the check a folding disagreement fails, so
      no new assertion was added; the fixture comment now names it.
- [x] 4.3 Keep the fixture ASCII. Record in the fixture's own header comment that non-ASCII folding
      is a known divergence (Chez folds Unicode, Emit does not) and is deliberately untested here.

## 5. The regen barrier

Nothing above may be edited after 5.1 starts. `make regen` is ~12 min; a source edit after it
guarantees a `test/trust-check.sh` failure ~25 min into the dev run, and a killed regen leaves
`bootstrap/` mixed-source.

- [x] 5.1 `make regen`. If the prelude-bootstrap ordering needs a second pass, run it to convergence.
      — Needs a **staged two-pass landing**, not just a second convergence pass. `build/emit-boot` is
      linked from *committed* `bootstrap/` IR, so the compiler's own source can only use names the
      **previous** generation's baked prelude exports. Regen 1 died with
      `repl: unbound variable read-all-from-string-ci`. The staging:

      - **Pass A** — the prelude defines and exports the name; `src/include-reader.ss` does **not**
        yet call it. Regen converges, and the new `bootstrap/` carries the name.
      - **Pass B** — restore `include-reader.ss`'s `who`-dispatch. Regen converges against a seed
        that now has the name.

      Pass A's own first attempt also failed — `repl: unbound variable rd-report` — which is the
      homing error recorded in 3.3/design D2, not the staging. Pass A converged in 1120s, pass B in
      701s. Verified between them that the pass-A binary resolves `read-all-from-string-ci`, and
      after pass B that the Emit door yields `(old kept Plain)` — byte-for-byte what the Chez door
      already gave.
- [x] 5.2 `./run-all-tests.sh`. — 22/24 first pass. Both failures were mine and both are fixed:
      `module-scaffold byte-identity` ran before 5.4's re-record, and `library include declarations`
      had a stale second expected value (the REPL case keeps its own `WVALUE`, which I had not
      updated when `describe` gained `(|KeepCase|)`). Re-ran both: scaffold 80/80, includes 18/18.
- [x] 5.3 `./run-dev-tests.sh`, suite by suite if the batch outruns the command timeout. Pay
      attention to `library-include-tests.sh`, `read-all reader`, `self-emission equivalence`, and
      `module-scaffold-baseline`. — **20/20 pass, 763s**, including self-hosting fixed point (328s),
      self-emission equivalence, backend equivalence, and --dump parity vs chez. `trust-check`
      `[SKIP]`ped as designed (bootstrap/ dirty); it runs post-commit in 7.1.
- [x] 5.4 `test/module-scaffold-baseline.sha256` — re-record, and log the reason the way
      `reader-lexical-conformance` did. Check the claim rather than assert it: every demo's PROGRAM
      module byte-identical, unit counts unchanged, the whole delta in the baked libraries. Report
      the `(emit internal)` and `(scheme base)` sizes both ways. — **The expected claim was wrong
      and the capture caught it.** Program modules are *not* byte-identical: each gained exactly one
      line, `@"scheme.base:read-all-from-string-ci" = external global i64`, because (scheme base)
      gained an export and every program declares it in the header. 80 additions, **zero
      deletions**, no other line moved in any of the 80. Unit counts unchanged. (emit internal)
      289754 → 297072 B (+7318, the fold helpers and the threaded argument's arity changes);
      (scheme base) 330361 → 332807 B (+2446, the new entry point and `rd-all`). Logged in
      `test/module-scaffold-baseline.sh`; `check` passes 80/80 against the new manifest.

## 6. Record the measurement, and what it found

- [x] 6.1 Re-run 1.2's measurement on the regenerated binaries, same method. Measure a **folding**
      read too, so the threaded argument's cost is a number rather than an assumption (design's last
      risk). A plain-read regression on `emit run` is a finding to record, not to hide. — Re-run on
      an **idle** machine; 1.2's numbers were taken with background builds running, so they are
      superseded. P12's regression, cleanly:

      | door | prereg (b102070) | HEAD (9a84ca2) | delta |
      |---|---|---|---|
      | `emit run`, total wall clock | 3.72 s | 4.47 s | +20.2% |
      | — of which fixed compile + JIT | 0.61 s | 0.83 s | +0.22 s |
      | — **the read itself** | 3.11 s | 3.64 s | **+17%** |
      | `emit build` (AOT `-O2 -flto`) | 2.84 s | 2.84 s | **none** |
      | Chez-hosted (min of 20) | 33.0 ms | 36.5 ms | +10.6% |

      The fixed row was nearly missed: `emit run` JIT-compiles the baked set first, and
      `reader-lexical-conformance` grew `(emit internal)` 170,716 → 289,754 B, so 0.22 s of the
      0.75 s delta is compiling a bigger substrate, not reading. A naive totals comparison would
      have overstated the reader's share and, in P13, would have called the dev door 57% slower
      when the honest figure is 28%.

      Tighter than 1.2's +15.6% and matching P12's original "+20%" almost exactly (run-to-run spread
      3.71–3.73 and 4.46–4.49). This change's own cost, same method:

      | door | before (9a84ca2) | after, plain | after, **folding** |
      |---|---|---|---|
      | `emit run` (JIT) | 4.48 s | 4.49 s | 4.52 s (+0.9%) |
      | AOT binary | 2.84 s | 2.84 s | 2.87 s (+1.1%) |
      | Chez-hosted (min of 20) | 36.5 ms | 36.3 ms | — |

      So the threaded argument costs **nothing measurable**, and folding costs ~1% — paid only by
      `include-ci`, and only on the symbols in the file.
- [x] 6.2 `docs/PERFORMANCE.md` P12 — **rewrite, do not tick.** Corrected numbers from 1.2 and 6.1,
      the corrected scope (the dev door, not the shipped artifact), its value re-rated against the
      door it actually affects, a pointer to `tools/gen-reader-bench.ss`, and a cross-reference to
      the new item below. Keep the three fix sketches; they are still the right sketches for the
      door that does not optimize.
- [x] 6.3 `docs/PERFORMANCE.md` — add the item the measurement found: the JIT/REPL door builds a
      plain `LLJITBuilder` with no IR optimization pipeline, so every JITted program pays full
      per-call overhead, and `emit run` is measurably slower than the `-O2` binary of the same
      program. Symptom with the numbers, cause with file references, fix sketch, and the sequencing
      note that it partly subsumes P12. Add it to the status table.
- [x] 6.4 `docs/MODULES.md` — rewrite the `include-ci` bullet that names the bar-quoting gap; it is
      now the rule, plus the ASCII-only limit.

## 7. Close

- [ ] 7.1 Commit with `Fixes #61`, then run `test/trust-check.sh` — it `[SKIP]`s while `bootstrap/`
      is dirty, so it is a post-commit check.
- [ ] 7.2 Remove the pre-regression worktree (`git worktree remove`) used for the baseline.
- [ ] 7.3 Sync the two delta specs into `openspec/specs/` and archive the change.
