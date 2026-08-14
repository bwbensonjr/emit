## 1. Baseline

- [x] 1.1 Record the failing baseline at `32d9c79` in the change folder: `write`/`display` of a cycle (non-terminating, killed by timeout), `(error "boom" <cyclic>)` (zero bytes, non-terminating — the trap path's own hang), `write` of `(integer->char 7 / 27 / 0)` (`#\` + raw byte; the NUL case makes `grep` treat output as binary), `(guard (e (#t 'caught)) (apply f (list 1)))` (aborts), the REPL session death on `(define-values (x y . z) (values 1 2 3))` (`exit 1`, no `!trap:`, next form never runs) versus a user-code trap (`exit 0`, `!trap:`, session survives), and `(= 9007199254740992.0 9007199254740993)` → `#t`. Every row asserts a value or an exit status, since three of these are silent or partial.
- [x] 1.2 Confirm the no-regen premise before writing code: `git grep` the fix sites and check that every one is in `src/runtime/runtime.c` or `src/emit.cpp`, neither of which is in `CORE_FLAT`. If a fix reaches into `src/*.ss` or `src/prelude.scm`, stop and re-scope — the change's whole cost model depends on this.

## 2. The printer: terminate on a cycle (#90)

- [x] 2.1 Add the visited-set helper to `src/runtime/runtime.c`: a pointer set that lives in a fixed 32-entry C-frame array and spills to a `GC_MALLOC`ed table beyond that (design D2). Membership and insert only; no removal.
- [x] 2.2 Add pass 1 to `print_val`: walk a pair/vector datum recording nodes reached more than once, assign a label index to each. Skip the pass entirely for a non-compound datum, so an atom, string, number, or character costs exactly what it costs today.
- [x] 2.3 Teach pass 2 (the existing printer) to emit `#N=` at a labelled node's first occurrence and `#N#` at every later one, in both `display` and `write` style.
- [x] 2.4 Verify the five entry points all inherit it — `rt_display`, `rt_write_val`, `rt_stderr_write`, `rt_port_display`, `rt_port_write` — including a **string port**, which is the third of #90's exclusion rows and is the same `FILE *` path.
- [x] 2.5 Confirm acyclic output is byte-identical to before: run the demos and diff, since `demos/run-tests.sh` compares printed values and would otherwise be the place this shows up.

## 3. The trap formatter: bound the walk (#90, second half)

- [x] 3.1 Fix `err_write`'s pair and vector arms to stop **walking** when `rt_trap_msg` is full, not merely to stop copying. This is the measured hang: `err_put` already respects capacity, so the loop spins forever emitting nothing.
- [x] 3.2 Add a depth cap for nested structure, so a deep (not cyclic) irritant cannot exhaust the C stack on the path that is handling a trap.
- [x] 3.3 Assert the trap path allocates nothing: no `GC_MALLOC`, no visited set, no labels (design D1). A cyclic irritant produces truncated text and a normal trap report.
- [x] 3.4 Verify `(error "boom" <cyclic>)` now reports and exits rather than hanging, and that an ordinary `(error "msg" 1 2 3)` report is byte-identical to before.

## 4. Trap delivery: the session must survive (#97)

- [x] 4.1 **Determine the cause of the session death first** (design's Open Questions). The raiser cell explains why `src/repl-core.ss`'s `guard` does not catch a compiler-internal trap; it does not obviously explain `exit 1`. Establish whether the compile-time entry is bracketed at all, and whether the landing site is a frame that has already returned.
- [x] 4.2 Save and restore the raiser cell around each `scheme_entry` call in `src/emit.cpp`, alongside the `rt_trap` save/restore already there (`:553`, `:1555`, `:1601`), so the executing instance's handler chain is the one a trap reaches.
- [x] 4.3 Do **not** touch `rt_trap_in_flight`. It is global for the same reason and is correct as-is; clearing it in the wrong place makes exactly the second trap of a session fatal (design D4 of `catchable-errors-with-kinds`).
- [x] 4.4 Verify behaviourally: `(define-values (x y . z) (values 1 2 3))` at the REPL reports the trap, the session survives, and a following `(display 42)` runs. Then verify a user-code trap still behaves exactly as it does today.

## 5. write names its characters (#94)

- [x] 5.1 Give `print_val`'s write-style character arm the R7RS table: `alarm` (7), `backspace` (8), `delete` (127), `escape` (27), `newline` (10), `null` (0), `return` (13), `space` (32), `tab` (9) — emitting the R7RS spelling where the reader also accepts an alias.
- [x] 5.2 Hex-escape any other non-graphic codepoint as `#\xHH`; print every remaining character literally. No raw control byte may leave `write`.
- [x] 5.3 Leave `display` alone and pin that with a test: it writes the raw character in every case, which `write-char` and the port procedures depend on.
- [x] 5.4 Add the round-trip test that holds the C table and the reader's `rd-char-name` together (design D6): for every named character, `write` it and read the output back to the same character. They cannot be one table across the language boundary, so this test is the only thing preventing drift.

## 6. An arity mismatch becomes catchable (#96)

- [x] 6.1 Replace `rt_arity_error`'s duplicated body with `snprintf` into `rt_trap_msg` followed by `rt_trap_deliver()`, which is what `rt_fatal` does. The message text must not move — it is the same `snprintf`.
- [x] 6.2 Read `emit-arity-check` (`src/emit.ss`) and confirm its failure block's `unreachable` is sound after a call that may longjmp rather than return, as the other trap paths already are. Confirm only: editing it would import a regen barrier.
- [x] 6.3 Verify both directions: `(guard (e (#t 'caught)) (apply f (list 1)))` answers `caught` with an error object carrying the arity text, and the same call with no handler prints byte-identical text and exits non-zero.
- [x] 6.4 Check the indirect and `apply` paths specifically — a `guard` around a known-arity *direct* call sees nothing either way, because the compiler rejects those statically.

## 7. Exact comparison across the exactness boundary (#77)

- [x] 7.1 In the mixed arm of `rt_num_eq` and `rt_lt`: NaN compares false for both; an infinity compares by sign; otherwise compare the fixnum against `floor`/`ceiling` of the flonum with the fractional part breaking the tie. No `double` widening of the exact operand, no bignum.
- [x] 7.2 Verify the derived operators inherit it: `>`, `<=`, `>=` are defined over `<` (#26), so assert them at the boundary values rather than assuming the derivation.
- [x] 7.3 Confirm `max`/`min` are unchanged and still contagious (`(max 1 2.0)` → `2.0`), which is already correct and must stay that way.

## 8. Tests

- [x] 8.1 Add `test/printer-cycles-tests.sh` (Chez-free): `write`/`display` of a cyclic list and a cyclic vector, through stdout and through a string port; the cyclic irritant trap; and the acyclic byte-identity check.
- [x] 8.2 Add the character rows — named, hex-escaped, `display` unaffected, and the read-back round trip — to that suite or to the existing reader-parity suite, wherever the reader's table is already exercised.
- [x] 8.3 Extend `test/catchable-errors-tests.sh` for the arity case. Note it currently asserts the **opposite** — "a violation of the runtime's own invariants stays fatal (design D2) — an arity error is not delivered to a handler" — so that assertion is inverted here, not merely added to, and the suite's header comment needs the same correction.
- [x] 8.4 Add the REPL session-survival case (a compiler-internal trap, then a following form) to `test/repl-interactive-tests.sh` or the new suite, whichever already drives an interactive session.
- [x] 8.5 Add the numeric boundary rows to `test/numeric-conformance-tests.sh`, beside the existing §6.2 cases.
- [x] 8.6 Wire any new suite into `run-all-tests.sh`.
- [x] 8.7 Update the R7RS exclusion manifest. **Outcome differed from the plan:** the two `write` cycle rows (`4dea3fc446ec34ba`, `797defea53bf5441`) CANNOT be un-excluded — un-excluding them hung section 6.4 for ~3 minutes, because the vendored suite's `test` macro compares with `equal?` and `equal?` does not terminate on a cycle either (R7RS 6.1 requires it to). All three rows are therefore retagged from `issue-90` to `issue-108`, which now owns `list?` and `equal?` together, with reasons that name the real blocker. The `issue-77` row is checked separately in 8.8.
- [x] 8.8 Re-run the stale-exclusion sweep. It caught my own over-correction: the 6.13 **string-port** cycle form now PASSES (its test compares the output string, so `equal?` never sees a cycle) and is removed, while only the 6.4 form -- which compares the cyclic datum itself -- stays, tagged `issue-108` beside the `list?` row. Timeouts 3 -> 2. The `issue-77` row is removed and verified by the sections pass (825 assertions, was 824).

## 9. Verification and close-out

- [ ] 9.1 `make` (not `make regen`) and run `./run-all-tests.sh` with `EMIT_R7RS=1`, then `./run-dev-tests.sh`. Both suites in full; no barrier to budget for.
- [ ] 9.2 Confirm `git status bootstrap/` is clean — a host-only change must not touch committed IR, and a dirty `bootstrap/` here means something reached `CORE_FLAT` after all.
- [x] 9.3 Sync the `core-language` and `dynamic-extent` deltas into the main specs. Both deltas were generated from the live spec text and audited for dropped scenarios and prose; run that audit again after syncing, per the trap that cost a re-sync last change.
- [ ] 9.4 Commit with `Fixes #90`, `Fixes #94`, `Fixes #96`, `Fixes #97`, `Fixes #77`, and open the PR. Note on #97 that its "latent" framing was wrong and the fix is verified by session survival; note on #90 that `list?` moved to #108.
