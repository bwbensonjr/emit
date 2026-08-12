## 1. Pin the defects before changing anything

- [x] 1.1 Add `test/typed-argument-tests.sh`, modelled on `test/indexed-access-tests.sh`, covering the
      wrong-typed **reads**: `(car '())`, `(cdr '())`, `(car 7)`, `(vector-ref '() 0)`,
      `(vector-length 7)`, `(string-ref 7 0)`, `(string-length '())`, `(bytevector-u8-ref 7 0)` —
      each expected to abort with a diagnostic; all eight currently exit 139
- [x] 1.2 Add the wrong-typed **write** cases once the mutators exist (task 5): `(set-car! 7 1)`,
      `(set-cdr! '() 1)`, `(vector-set! '() 0 1)`, `(string-set! 7 0 #\a)` — assert a diagnostic and,
      for the vector case, that a neighbouring object is unmodified (the observable that distinguishes
      a real fix from one that traps after the store)
- [x] 1.3 Add the non-procedure call: `((quote not-a-proc) 1)` — currently exit 138 (SIGBUS)
- [x] 1.4 Add the `apply` cases: `(apply + 3)` → `0`, `(apply + 3 4)` → `3`,
      `(apply + '(2 3 . 4))` → `5` today, each expected to abort. These are the only three in this
      change that are silently **wrong** rather than fatal
- [x] 1.5 Add the ordering case that proves the type check precedes the length load:
      `(vector-ref '() 0)` must report a **type** error naming the object, not a range error
- [x] 1.6 Add the guard case: `(guard (e (#t 'caught)) (car '()))` — asserts the trap is *not* caught
      (design D5), so the deliberate non-goal is pinned rather than assumed
- [x] 1.7 Add the first-class-primitive path: `(apply car (list 7))`
- [x] 1.8 Add the right-typed regression guard: `car`/`cdr` over a list, every accessor over a
      correctly-typed object, direct and value-position procedure calls — all must be unchanged.
      An over-tight guard has to fail here before it can fail a user
- [x] 1.9 Add the door-agreement and session-survival cases: the same wrong-typed program under the
      in-process runner and as a standalone executable, and a REPL session that traps and then
      evaluates `(+ 1 2)` to `3`
- [x] 1.10 Confirm 1.1/1.3/1.4/1.5/1.7 fail against the current `build/emit` in the way #84 and #78
      describe, and that 1.8 passes already, so the suite tests the defects rather than passing
      vacuously

## 2. Sweep for the complete set of dereferencing primitives (design open question 4)

- [x] 2.1 Enumerate every `^val rt_` in `src/runtime/runtime.c` and mark each that reaches `as_ptr`,
      `str_bytes`, `bv_bytes`, `vec_len`, `str_cplen`, `bv_len`, `rec_len` or `ext_hdr` on an argument
- [x] 2.2 Separate them into three lists: **dereferences** (in scope — a wrong type is unsafe),
      **reads an immediate's payload** (e.g. `char->integer` on a non-char — wrong answer, not
      unsafe; decide with the list in hand), and **already guarded** (the arithmetic family)
- [x] 2.3 Cross-check against `*prims*`/`*integrable*` (`src/parse.ss:24`, `:87`) so no
      Scheme-reachable primitive is missed, and note which are internal-only
- [x] 2.4 Record the final list in this change before writing guards, so coverage is decided once —
      recorded as design.md "Appendix: the sweep". **The proposal's enumeration was short**: the
      string family (`string=?`, `string-append`, `string->symbol`, `symbol->string`, `string-copy`,
      `write-string`) dereferences too and every one segfaults today, and they are user-facing
      `(scheme base)` names. `error-object-message`/`-irritants` likewise — reached from inside a
      `guard` clause, the one construct used to recover from failure

## 3. The type-check machinery and the accessor guards (design D3, D4) — C only, no regen

- [x] 3.1 Add `rt_type_name(val)` returning a fixed string per tag/header, and `rt_type_error`, beside
      `rt_range_error` (`src/runtime/runtime.c:242`)
- [x] 3.2 Add the `CHECK_TAG(who, v, pred, want)` macro beside `CHECK_INDEX` (:247), reusing the
      conditions behind `rt_pair_p` (:419), `rt_vector_p` (:1289), `rt_bytevector_p` (:1320),
      `rt_string_p` (:1568), `rt_record_p` (:1441) — not new open-coded tag tests
- [x] 3.3 `rt_car` (:147), `rt_cdr` (:148) — the hot pair; `rt_unbox` (:152), `rt_set_box` (:153)
- [x] 3.4 `rt_vector_ref` (:1277), `rt_vector_set` (:1282), `rt_vector_length` (:1288) — **the tag
      check before `vec_len`**, which is the whole point (design D1)
- [x] 3.5 `rt_string_ref` (:697), `rt_string_set` (:781), `rt_string_length` (:692),
      `rt_substring` (:705) — the tag check must precede every `str_len`/`str_cplen` read, of which
      `rt_string_set` has two before its `CHECK_INDEX` (design open question 3)
- [x] 3.6 `rt_bytevector_u8_ref` (:1308), `rt_bytevector_u8_set` (:1313),
      `rt_bytevector_length` (:1319)
- [x] 3.7 `rt_record_ref` (:1427), `rt_record_set` (:1432) — resolve design open question 1 first:
      **included for uniformity**, as `checked-indexed-access` included their bounds check: the only
      defect they can report is a compiler bug, which is the bug worth reporting. Boxes
      (`rt_unbox`/`rt_set_box`) are checked on the same reasoning
- [x] 3.8 The index type test (design D10): a non-fixnum index reports naming the index, rather than
      reaching `CHECK_INDEX` as a huge magnitude. One compare in a block that now exists anyway
- [x] 3.9 Any additional primitive from task 2.2's first list — **13 more than the proposal named**:
      `rt_string_eq`, `rt_string_append` (both arguments each), `rt_string_copy`,
      `rt_string_copy_from`, `rt_string_to_symbol`, `rt_string_to_flonum`, `rt_write_string`,
      `rt_port_write_string`, `rt_symbol_to_string`, `rt_flonum_to_string`, `rt_hash_table_spine`,
      `rt_mv_to_list`, `rt_error_object_message`/`_irritants`

## 4. `apply`'s proper-list check (design D9) — C only, no regen

- [x] 4.1 In `rt_apply_argv` (:463), after the existing copy loop, report when the cursor is not
      `NIL_V`. One comparison, no extra traversal — do **not** add a validating pre-pass
- [x] 4.2 Confirm all three 1.4 cases now report, including `(apply + 3)` where the loop never runs
      and the cursor is still the original argument

## 5. Everything that touches Scheme source — one batch, then one regen

**Barrier (`CLAUDE.md`): complete 5.1-5.6 before starting task 6, and make no further compiler-source
edit until the suites in task 7 have finished.**

- [x] 5.1 `rt_set_car`/`rt_set_cdr` in `runtime.c` — `CHECK_TAG` then a tagged store into word 0/1,
      with the comment recording that Boehm here is non-generational so no write barrier is required
      (design D7)
- [x] 5.2 `rt_check_callable(val)` in `runtime.c`, and the call emitted immediately before the mask in
      `emit-load-code` (`src/emit.ss:1002`) — reached only from `emit-app` (:1036), **not** from
      `self-app`/`known-app`, which call a statically-known closure (design D6)
- [x] 5.3 `src/parse.ss` — `%set-car!`/`%set-cdr!` in `*prims*` (:24), and
      `(set-car! %set-car! 2)`/`(set-cdr! %set-cdr! 2)` in `*integrable*` (:87)
- [x] 5.4 `src/emit.ss` — `(%set-car! "rt_set_car")`/`(%set-cdr! "rt_set_cdr")` in the prim→`rt_` map
      (:389), plus the `declare`s for `rt_check_callable` **and for the two mutators** — the emitted
      IR declares every `rt_` it calls, so the map entry alone links nothing
- [x] 5.5 `src/prelude.scm` — `list-set!` over `set-car!` (design D8)
- [x] 5.6 `src/prelude-surface.scm` — **no edit was needed**: an *integrable* primitive is
      universally available (`(map car *integrable*)`, `src/core.ss:57`), exactly as `car` is, so
      `set-car!`/`set-cdr!` need no export; and a new prelude define is exported by default unless
      declared private, so `list-set!` needs none either. What it does need is the committed
      `lib/**/*.sld` regenerated — `chez --script tools/gen-scheme-base.ss .` — which
      `test/scheme-base-gen-check.sh` and `-surface-check.sh` both then pass
- [x] 5.7 Iterate on 5.1-5.6 with `chez --libdirs src --script src/compile.ss`, which includes the
      source directly, so the whole edit/test loop runs without regen

## 6. Regenerate

- [x] 6.1 `make regen` — converged in **1069s (17m49s)**, single pass
- [x] 6.2 Confirm `bootstrap/*.ll` moved only where expected — **yes**: 1864 new
      `call void @rt_check_callable` in `embed.ll` (1893 in `embed-repl.ll`, 1819 in `schemec.ll`,
      324 in `scheme.base.ll`, 166 in `emit.internal.ll`) plus the two mutator primitives. The
      remaining ~19.5k changed lines are `%tN` renumbering cascading from each inserted line, added
      and deleted in near-equal counts (+21392/−19475). The doubled `declare` per runtime function
      is pre-existing — `rt_arity_error` appears twice at HEAD too

## 7. Verify

- [x] 7.1 `make`, then the new `test/typed-argument-tests.sh` — every case in task 1 now behaves as
      pinned, including 1.6 (still not caught by `guard`) and 1.8 (unchanged)
- [x] 7.2 `./run-all-tests.sh` — **27/27 suites pass, 0 failed, 965s**
- [x] 7.3 `./run-dev-tests.sh` — **21/21 pass, 0 failed, 1604s**, run as a single background job
      rather than individually (the tool's 600s ceiling only applies to a foreground call)
- [x] 7.4 Treat any **new** trap in the suites or during regen as a real type confusion this change
      found: fix the caller, do not soften the guard. The compiler compiling itself is the largest
      available test of whether the predicates are right
- [x] 7.6 Re-record `test/module-scaffold-baseline.sha256` — a committed SHA per demo of emitted
      IR, which `rt_check_callable` moves. Its header requires a before/after capture proving the
      drift is exactly what was intended, plus a log entry; not in the original plan
- [x] 7.5 Commit, then `test/trust-check.sh` — **[OK] committed IR is exactly what the current source
      regenerates** (723s). The real gate on this change: a full `make regen` with every guard active
      reproduced the committed IR byte-for-byte, which also means the compiler compiled its own
      434 KB of source repeatedly with every accessor type-checked and no guard ever fired

## 8. Close the conformance-suite exclusions

**The premise of this section was wrong, and the correction is the finding.** The plan assumed the
19 rows tagged `issue-84`/`issue-82`/`issue-78` (plus their `blocked-by` chains) would all become
stale and be deleted. In fact **3 became stale** and the other 16 stayed excluded *for reasons that
were not what the manifest recorded* — the ratchet checks pass/fail, but nothing checks whether a
reason is still true, so they had rotted silently.

- [x] 8.1 Delete the rows that now pass — **3**, all `issue-82` (`42d4bbc9483588e5`,
      `d00bf01933ba1da7`, `f75283c4c11e8f2b`): the `list-copy`/`list-set!`-adjacent 6.4 and 6.10
      forms that only ever needed mutable pairs
- [x] 8.2 Run the suite. **It found a bug in my own harness change first**: at `EMIT_FORM_TIMEOUT=20`
      every probe timed out under 8-way concurrency (each is a full compile+link) and was silently
      recorded as "not stale" — 389 false negatives, the exactly-wrong direction for a ratchet.
      Raised the default to 120s and made a timeout a **reported, distinct outcome** rather than a
      silent one
- [x] 8.3 Give every surviving row a reason that is actually true — **12 retagged**:
      - `issue-90` ×3 — circular structures: `list?` and `write` do not terminate (newly reachable
        via `set-cdr!`; filed as a consequence of this change)
      - `issue-91` ×4 — `case-lambda` dead clause / rest arity, `letrec-syntax`, `define-values`
        dotted formals: the **frontend** crashes on an unsupported form. These were tagged
        `issue-84` "crashes with a signal (no tag check)"; the tag check did not fix them, it made
        them legible — `car: not a pair: got a symbol`, raised inside the compiler
      - `issue-89` ×3 — `apply` now reports correctly, but the form is `(test-error (apply + 3))`
        and a trap is not catchable, so the suite cannot see the fix. **This is the clearest
        argument for #89 in the repo**: three conformance forms are fixed and still cannot pass
      - `issue-92` ×1 — `(let ((=> #f)) (cond (#t => 'ok)))` calls `'ok`; `cond` matches `=>` by
        spelling rather than by binding
      - `issue-33` ×1 — `(make-list 5)`: the optional-fill arity gap, never about mutable pairs
- [x] 8.4 Re-run: green. **782 assertions (was 779), 794 forms run (was 791), 386 excluded (was
      389)**, plus a `[NOTE]` naming the 3 unverifiable hangs

## 9. Measure, and record (design D11)

- [x] 9.1 Time the compiler compiling itself before and after — interleaved paired samples of regen's
      inner step (`emit-boot --emit < build/embed.scm`), as `checked-indexed-access` did, rather than
      two whole-regen wall-clocks that mix in link time
- [x] 9.2 Record `build/emit` size and a hello-world executable's size before and after; task 5.2
      grows every indirect call site, and binary size is a stated design goal
- [x] 9.3 Read the IR or asm for one hot function to confirm whether LTO folds repeated tag tests on
      the same value (design D1) — the claim that makes the cost acceptable, so verify it rather than
      infer it from the totals
- [x] 9.4 Add a `docs/PERFORMANCE.md` entry with the measurement **whether or not it shows a cost** —
      a recorded "no measurable cost" is what stops the question being re-litigated
- [x] 9.5 If a cost does show — **no TIME cost showed** (median +0.37%, paired deltas straddling zero
      with a negative mean, inside a ~3% noise floor), so nothing is deferred on speed grounds. A
      **size** cost did: +8.58% on a delivered hello-world. Recorded in P16 with the remedy order,
      nothing filed — and `-ffunction-sections`/`--gc-sections` on the runtime link is named as the
      first thing to reach for, since it is not specific to this change

## 10. Close out

- [x] 10.1 Comment on #84, #82 and #78 with the actual diagnostics, and note anything found after
      filing
- [x] 10.2 Update #89 (traps uncatchable) to record that its call sites are now complete — this
      change adds the type traps it will need to route
- [x] 10.3 Confirmed — both stale claims are gone (the `checked-indexed-access` scoping paragraph and
      the multiple-values sentence); `openspec validate --all` passes 22/22, requirements 94 -> 96 and
      scenarios 378 -> 398, no stray delta headers in the main specs. Originally worded: the
      `checked-indexed-access` scoping paragraph and the multiple-values requirement both carry that
      claim and are both MODIFIED by this change's delta
- [x] 10.4 Sync the delta, then `openspec validate --all` on the **main** specs and grep for stray
      delta headers (`grep -rn '^## \(ADDED\|MODIFIED\|REMOVED\|RENAMED\) Requirements' openspec/specs/`)
      before archiving with `--skip-specs`
