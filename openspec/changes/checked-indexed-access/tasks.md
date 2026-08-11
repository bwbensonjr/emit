## 1. Pin the defect before changing anything

- [ ] 1.1 Add a suite (or a section of an existing runtime suite) covering the out-of-range **reads**:
      `(vector-ref (vector 1 2 3) 5)`, `(string-ref "abc" 3)`, `(string-ref "abc" 100000)`,
      `(bytevector-u8-ref (bytevector 1 2) 7)`, and the negative cases `(string-ref "abc" -5)` and
      `(vector-ref (vector 1) -1)` — each expected to abort with a diagnostic, all currently exit 0
- [ ] 1.2 Add the out-of-range **write** cases, asserting a *neighbouring object is unmodified*:
      create `a` (length 3) and `b`, run `(vector-set! a 5 999)`, and check `b` — the observable that
      distinguishes a real fix from one that merely traps late. Include
      `(vector-set! (vector 1 2 3) 4000000 1)` and the bytevector set case
- [ ] 1.3 Add `(substring "abc" 0 10)` (currently returns bytes from past the string) and
      `(substring "abcdef" 4 1)` (currently exit 139 with GC "Failed to expand heap" warnings) —
      assert a diagnostic and an exit that is non-zero **and below 128**
- [ ] 1.4 Add the negative-size constructions `(make-vector -1 0)`, `(make-string -1)`,
      `(make-bytevector -1 0)`; `(vector-length (make-vector -1 0))` currently returns `-1`
- [ ] 1.5 Add the first-class-primitive path: `(apply vector-ref (list (vector 1 2 3) 99))`
- [ ] 1.6 Add the **non-ASCII** in-range case that a `str_len`-based guard would wrongly reject: a
      string with a multi-byte character indexed at its last codepoint, asserting it still returns
      that character (design D4)
- [ ] 1.7 Add the in-range regression guard: index every element of a vector, string, and bytevector
      from `0` to `length - 1` and assert the values are unchanged
- [ ] 1.8 Add the door-agreement and session-survival cases: the same out-of-range program under the
      in-process runner and as a standalone executable, and a REPL session that traps and then
      evaluates `(+ 1 2)` to `3`
- [ ] 1.9 Confirm 1.1-1.5 fail against the current `build/emit` in the way #70 describes, and that
      1.6-1.7 pass already, so the suite tests the defect rather than passing vacuously

## 2. Sweep for every range-taking primitive (design open question 2)

- [ ] 2.1 Enumerate all `^val rt_` in `src/runtime/runtime.c` (132 functions) and list every one that
      takes an index, a range, or a size; confirm the twelve named in the proposal are the complete
      set and add any `fill!`/`copy!`-style range operation found
- [ ] 2.2 Cross-check against the prim table (`src/parse.ss:110-125` and the Batch B entries) so no
      Scheme-reachable accessor is missed
- [ ] 2.3 Record the final list in the change before writing guards, so coverage is decided once

## 3. Guard the accessors (design D2, D4)

- [ ] 3.1 `rt_vector_ref` (:1195) and `rt_vector_set` (:1196) — compare against `vec_len`
- [ ] 3.2 `rt_bytevector_u8_ref` (:1216) and `rt_bytevector_u8_set` (:1217) — against `bv_len`
- [ ] 3.3 `rt_string_ref` (:651) and `rt_string_set` (:718) — against **`str_cplen`**, not `str_len`
      (design D4); the ASCII fast path must keep its `str_len == str_cplen` shortcut
- [ ] 3.4 `rt_record_ref` (:1315) and `rt_record_set` (:1316) — checked though redundant (design D6);
      the message names these honestly as internal, since they have no user-facing Scheme spelling
- [ ] 3.5 Use `rt_fatalf` (:208) throughout, naming the Scheme procedure, the index, and the length,
      matching the overflow messages' shape (`+: fixnum overflow: %ld + %ld`)

## 4. Guard the ranges and sizes (design D5)

- [ ] 4.1 `rt_substring` (:658) — `start` and `end` each within `[0, str_cplen]`, **and**
      `start <= end` as a distinct condition; this is the exit-139 crash
- [ ] 4.2 `rt_make_vector` (:1188), `rt_make_bytevector` (:1208), `rt_make_string_fill` (:699) —
      reject a negative size before `GC_MALLOC`
- [ ] 4.3 Any additional range operation found in task 2

## 5. Verify

- [ ] 5.1 `make` (no `make regen` — this change touches no Scheme source and no `CORE_FLAT` file;
      confirm `git diff bootstrap/` is empty afterwards)
- [ ] 5.2 `./run-all-tests.sh`, then `./run-dev-tests.sh`
- [ ] 5.3 Treat any **new** trap in the suites or during a `make regen` as a real off-by-one this
      change found: fix the caller, do not soften the guard (design D7 risk)
- [ ] 5.4 Confirm every #70 reproduction now reports, and that the neighbouring-object assertion in
      1.2 holds

## 6. Measure, and record (design D7)

- [ ] 6.1 Time `make regen` before and after (the compiler compiling itself is the most
      vector-and-string-heavy workload available); repeat enough to distinguish from noise
- [ ] 6.2 Add a `docs/PERFORMANCE.md` entry with the measurement **whether or not it shows a cost** —
      a recorded "no measurable cost" is what stops the question being re-litigated
- [ ] 6.3 If a cost does show, file the emitter-side elision (records first, then constant indices)
      as a follow-on rather than weakening the guard in this change

## 7. Close out

- [ ] 7.1 Comment on #70 with the actual diagnostics, and note the three cases found after filing:
      `(substring "abcdef" 4 1)` exiting 139, `(substring "abc" 0 10)` returning out-of-object bytes,
      and `(make-vector -1 0)` reporting length `-1`
- [ ] 7.2 File the `string-set!` UTF-8 width question (design open question 3) if it turns out to be a
      real defect independent of bounds
- [ ] 7.3 Confirm the `core-language` type-confusion decision is still stated accurately after this
      change syncs, since the new requirement sits next to it and explicitly leaves it in force
