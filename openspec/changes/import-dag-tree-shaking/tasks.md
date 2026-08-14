## 1. Baseline and the D7 measurement gate

No code changes in this group. It establishes the numbers the later assertions are written
against, and it decides whether group 6 happens at all.

- [x] 1.1 Record the baseline for a minimal program: build `(display (car (list 1 2)))` through both
      ship doors, and record the delivered binary size, the linked `scheme.base` and `emit.internal`
      unit sizes, and the count of `emit.internal:*` symbols in the binary. This is the before-side
      of D5's assertion.
- [x] 1.2 Record which `(emit internal)` bindings a **shaken** `(scheme base)` still references, for
      the `car`-only program. Answers the design's first open question — whether `%make-port` /
      `%port-rtd` survive via `__init` rather than via a kept binding — and sets the threshold D5's
      test can honestly assert.
- [x] 1.3 **D7 gate.** Shake `lib/scheme/read.sld` and `lib/scheme/base.sld` to their own export
      interface (one `compile-library*` call with `candidates` passed unfiltered as `keep-roots`)
      and compare byte counts against the unpruned units. Runnable before any door work exists.
      → **0% / 0% / 0.45%.** Measured on `(emit internal)`, `(scheme read)`, `(scheme base)`.
- [x] 1.4 Decide group 6 on 1.3's numbers against the pre-stated threshold: **under 10% on both
      libraries and group 6 is dropped**, the measurement is recorded in `docs/PERFORMANCE.md`, the
      `emit-cli` delta is removed from this change, and issue #104 closes with the measurement as its
      answer. Record the decision either way.
      → **Dropped.** `emit-cli` delta deleted, the `aot-codegen` delivered-library requirement
      withdrawn, proposal/design updated, group 6 struck. `docs/PERFORMANCE.md` entry lands at 8.4.

## 2. The shared root rule (`src/core.ss`)

- [x] 2.1 Give `program-root-internals` a root-text parameter that is no longer only the program's
      IR, keeping one implementation for both doors (the reason `chez-free-unit-pipeline` design D8
      moved it here). Update its comment: the text searched is the program plus finalized importers.
      → **The body needed no change at all** — the parameter was already the text to search, so
      backward propagation is entirely in what the callers pass. Renamed `prog-text` to `root-text`
      and documented D1's soundness argument and D3's `ptr`/`code:` pairing assumption at the one
      place both doors read. Kept the function's name: a program still imposes every root, the text
      it is read out of just grew.
- [x] 2.2 Confirm `compile-library*` needs no change — it already takes `keep-roots` — and note in
      the change record that only the roots handed to it differ. → **Confirmed, untouched.**

## 3. The Chez driver (`src/compile.ss`, exempt from regen)

Iterate this group with `chez --libdirs src --script src/compile.ss`, which includes the source
directly. It is the fast half and it validates the whole idea before the regen barrier is paid.

- [x] 3.1 Iterate `build-modular-artifacts*`'s shake over `order` in **reverse**, accumulating each
      finalized unit's IR text into the root text (D1). → done.
- [x] 3.2 Remove the `(member nm direct-imports)` gate so a transitively imported unit is shakeable,
      and the `(not (member nm imported-by-unit))` gate whose hazard reverse order removes (D2).
      Delete `imported-by-unit` if nothing else uses it. → both gates removed; `imported-by-unit` and `name->ll` deleted with them.
- [x] 3.3 Keep the final `.ll` list in topological link order regardless of the shake order — the
      linker's order is unchanged by this change. → final list mapped back over `order`.
- [x] 3.4 Narrate per unit as before (`shake ~s -> ~a [~a exports reached, ~a bytes]`), per
      `docs/OUTPUT.md`; a unit shaken because of an importer rather than the program should be
      legible as such in the narration. → a unit the program does not import directly narrates `, via importers`.
- [x] 3.5 Verify against 1.1: the `car`-only program's `emit.internal` unit shrinks, the binary
      links, and the value is unchanged.
      → **110,472 → 52,152 B (−52.8%)**; substrate 348,536 → 5,965 B, 0 exports reached;
      `emit.internal:*` symbols 161 → **1** (`__inited`); `rd-*` 55 → **0**; value unchanged.
      The floor is an empty `__init`: `cmd-roots` is empty post-expansion too, so
      `define-record-type` leaves no command and the substrate prunes to zero bindings.
      `demos/run-tests.sh` (RUNNER=aot): **80/80**. `test/aot-tree-shaking-tests.sh`: 9/10, the
      one failure being the cross-door size gap that group 4 exists to close (chez 51,656 B vs
      `emit build` 110,424 B).

## 4. The `emit build` door (`src/repl-core.ss` + `src/emit.cpp`)

`src/repl-core.ss` is in `CORE_FLAT`; `src/emit.cpp` is host C++ and reaches the binaries through
plain `make`. Finish 4.1–4.2 (Scheme) **before** the regen in group 5; 4.3–4.6 are iterable after it
with `make` alone.

- [x] 4.1 Mode 17 (`repl-shake-library`): stop answering `(keep . NAME)` from
      `imported-by-another?`, and take the input's third section as the accumulated root IR rather
      than the program IR. Update the mode's protocol comment, which currently documents the
      prunability rule this change retires.
- [x] 4.2 Keep the `(keep . NAME)` answer itself for the reasons that remain (an unresolvable
      library, a door that cannot supply source), so the host's "kept whole (…)" narration still
      distinguishes a sound skip from an error.
      → **The premise did not survive the code.** `keep` had exactly ONE producer — the
      import-graph gate 4.1 removed — and one consumer, so it was removed from both sides
      rather than kept as a verb nothing emits. A unit that cannot be pruned now reports an
      error, which the host already narrates as "kept whole (…)" and treats as sound.
      Separately hardened the host: it now reads the payload only for `error`, whose cdr is a
      message string. Found the honest way — mid-change a new host ran against a core that
      still answered `keep` (cdr = a library *name*), and `scm_str` on it silently produced no
      output at all.
- [x] 4.3 `shake_units`: iterate `modules` in **reverse** link order and accumulate each finalized
      module's text into the root text handed to mode 17.
- [x] 4.4 Key the shaken cache entry on a digest of that full root text rather than of `prog_ir`
      (D4), and correct the comment that justifies the current key ("same IR, same roots,
      necessarily") — that claim no longer holds.
- [x] 4.5 Keep every failure best-effort: a missing source, a mode-17 error, or an unwritable cache
      leaves that unit whole, which stays sound under the new order.
      → A unit left whole is appended to `root_text` **whole**, so its own references still
      root its dependencies and nothing downstream is over-pruned on its behalf. Verified for
      real in the intermediate state above: new host + old core degraded to "kept whole (door
      answered keep)" and still delivered a correct binary.
- [x] 4.6 Verify the cross-door requirement against 1.1: the same program built both ways retains
      the same set of library bindings and delivers binaries of the same order of size.
      → **Byte-identical, not merely the same order: 52,152 B from both doors**, 1
      `emit.internal:*` symbol each, 0 reader bindings each.

## 5. Regen barrier

- [x] 5.1 Confirm every `CORE_FLAT` edit is finished (`src/core.ss`, `src/repl-core.ss`) — no
      compiler-source edit after this point until the suites have finished.
- [x] 5.2 `make regen` (expect 5 self-compiles, ~22 min, converging at fixed-point iteration 2).
      → **809s, converged at iteration 1** — faster than CLAUDE.md's estimate for a run that
      follows a compiler-source edit. Only `bootstrap/embed-repl.ll` changed, which is the
      right answer: the `src/core.ss` edit was comments plus a local parameter rename (no IR
      delta), and `src/repl-core.ss` reaches only the REPL embed.
- [x] 5.3 `make` and re-verify 4.3–4.6 against the regenerated binaries.

## 6. `emit lib --shake` — DROPPED by the 1.4 gate

Not built. 1.3 measured the win at 0% / 0% / 0.45%; the threshold was 10%. The four tasks that
were here (`--shake` flag, untouched `.exports`, pruning narration, default byte-identity) are
struck rather than deferred — if the libraries' internals ever diverge from their exports enough to
change the answer, the measurement is cheap to re-run and lives in `measurements.md`.

- [x] 6.0 Withdraw the scope: `specs/emit-cli/` deleted, the `aot-codegen` delivered-library
      requirement removed, proposal and design annotated with the outcome.

## 7. Tests

- [x] 7.1 Extend `test/aot-tree-shaking-tests.sh` with D5's size assertion: for a minimal program,
      the linked substrate is a small fraction of its full size and named reader symbols
      (`rd-datum`, `rd-token-at`) are **absent** from the delivered binary.
- [x] 7.2 Add the over-pruning counterpart in the same suite: a program that reads keeps those
      symbols and produces the right value. Without it, a test that only checks for absence passes
      when the shake is too aggressive.
- [x] 7.3 Add a transitive-chain case: a program → library A → library B where the program never
      names B, asserting B is shaken to what A retains, links, and runs.
- [x] 7.4 Add D3's invariant test: for every `@"U:code:n"` in a shipped unit's IR there is a matching
      `ptr @"U:n"`. This is what turns a future codegen change (P9's fixed-arity entry points) from
      an undefined symbol at link into a named failure.
- [x] 7.5 Extend `test/unit-pipeline-tests.sh` (or `test/artifact-cache-tests.sh`) for D4: two
      programs that prune a shared importer differently are each served their own entry for the
      transitively imported unit.
- [x] 7.6 Confirm the open-world doors are untouched — `emit run` / `emit repl` still seed from full
      units and keep every binding available. → Already asserted by two pre-existing checks in
      `unit-pipeline-tests.sh`; both still pass, so no new test was needed.

## 8. Verification and close-out

- [x] 8.1 `./run-all-tests.sh` (~27 min, Chez-free). → **33 suites, 0 failed, 329s.**
- [x] 8.2 `./run-dev-tests.sh` — its suites are independent and can be run individually if one
      outlives a command timeout. → **22 suites, 0 failed, 751s**, including the self-hosting
      fixed point (393s), backend equivalence, and AOT tree-shaking. `trust-check` `[SKIP]`ped
      as designed (`bootstrap/` dirty until 8.3 commits).
- [ ] 8.3 Commit, then run `test/trust-check.sh` — it `[SKIP]`s while `bootstrap/` is dirty, by
      design.
- [x] 8.4 Check off P10 in `docs/PERFORMANCE.md` with the before/after measurements from 1.1 and
      7.1, correct its stale figures (it records 170,716 B of substrate; it is 348,536 B), and
      update the "Status at a glance" table and the cycle-time decomposition that name P10 as open.
- [ ] 8.5 Close #104 with 1.3's measurement as the answer — the interface shake buys 0–0.45%, so it
      is declined, not deferred. Record the numbers in the issue. Avoid the literal `close #N`
      phrasing in any sentence meant to say the opposite.
- [ ] 8.6 Sync the two spec deltas (`aot-codegen`, `artifact-cache`), then `openspec validate --all`
      and grep the **main** specs for stray delta headers before archiving with `--skip-specs`.
