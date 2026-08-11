## Context

`src/runtime/runtime.c` computes an element address from an index without ever comparing it against
the length stored in the object's header:

```c
val rt_vector_ref(val v, val i)        { return as_ptr(v)[2 + UNFIX(i)]; }            /* :1195 */
val rt_vector_set(val v, val i, val x) { as_ptr(v)[2 + UNFIX(i)] = x; ... }           /* :1196 */
val rt_bytevector_u8_ref(val v, val i) { return FIX(bv_bytes(v)[UNFIX(i)]); }         /* :1216 */
val rt_record_ref(val r, val i)        { return as_ptr(r)[2 + UNFIX(i)]; }            /* :1315 */
```

The length is right there — `vec_len`, `bv_len`, `str_cplen` all read it from the header the accessor
is already touching — so nothing about the representation prevents the check. Five facts shape the
work.

1. **The trap mechanism exists and has a precedent.** `rt_fatalf` (:208) formats into a static buffer
   (no allocation, safe on any trap path), prints, and longjmps to the host if one is installed, else
   exits non-zero. The fixnum overflow diagnostics use exactly this, and `core-language`'s "Exact
   integer overflow is a diagnostic, never a wrapped value" is the requirement this change mirrors.
2. **None of these accessors is in the emitter's inline fast path.** `inline-arith-table`
   (`src/emit.ss:624`) is arithmetic only; `%vector-ref` and friends map to plain `rt_*` calls
   (`src/emit.ss:394-400`). So one guard per runtime function covers every path and no emitted code
   changes — the same "a future change lands only in `rt_*`" seam `docs/PERFORMANCE.md` item A
   describes for the numeric tower.
3. **Primitives are first-class** (`primitive-layer`), so `(apply vector-ref …)` reaches the same
   runtime function as a direct call. Checking in the runtime is therefore the only placement that
   cannot be bypassed.
4. **Strings are codepoint-indexed over UTF-8 storage.** `str_len` is bytes and `str_cplen` is
   codepoints, and `rt_string_ref` takes the byte offset directly only on the ASCII fast path where
   the two are equal. The bound for a string index is `str_cplen`, never `str_len`.
5. **No Scheme source changes.** This is C only, reached by plain `make`, so `CORE_FLAT` is untouched
   and no `make regen` is needed — unusual for a correctness change here, and worth stating so nobody
   spends the 12 minutes.

## Goals / Non-Goals

**Goals:**

- No indexed access reads or writes an address outside the object, from any door, through any call
  path.
- No construction produces an object with a negative recorded length.
- `(substring "abcdef" 4 1)` stops terminating the process on a signal.
- Diagnostics name the procedure, the index, and the range, matching the overflow messages' shape.
- The cost is measured on the compiler's own workload, not assumed.

**Non-Goals:**

- **Type** checking any accessor, including `car`/`cdr`. The standing `core-language` decision stays;
  see D1 for why bounds and types are separable rather than one question.
- Making the trap a catchable Scheme condition. It is a trap, like overflow (D3).
- Eliding provably-in-range checks in the emitter. That is a follow-on optimization, and D6 records
  where it would apply.
- An unsafe-accessor escape hatch. D6 rejects it explicitly.
- Bounds-checking anything reached through the FFI or the host C++, which is not Scheme-visible.

## Decisions

### D1 — Bounds and types are separate questions, and only bounds are in scope

`core-language` records that the runtime "applies the SAME unchecked semantics it already applies to
any type confusion — e.g. `(car x)` for a non-pair `x`", and adds that it "does NOT add type-checking
to the pair accessors (that is a separate concern)". `manifest-empty-guards` cited that decision when
it declined to make `car` checked. So the obvious objection to this change is that it re-opens a
settled question.

It does not, and the difference is a cost model rather than a preference:

- A **type** check is a tag test on a value the accessor has no other reason to inspect, paid on every
  access, to catch a condition that never occurs in a working program. It also has no single natural
  home: every primitive would need one.
- A **bounds** check compares the index against a word in the object's own header — which the accessor
  loads anyway to find the data — and catches a condition that occurs in ordinary buggy code (an
  off-by-one), on the one path where the consequence is not a wrong value but a corrupted heap.

The requirement states the scope explicitly rather than leaving it to be inferred: the index is
assumed to be a fixnum and the object to be of the right type. `(vector-ref v "x")` stays unchecked.
That is a coherent line — the same line R7RS draws between "is an error" latitude and the
representation guarantees an implementation chooses to make — and it keeps this change from becoming
the tower-wide performance question that the type decision genuinely is.

### D2 — One guard per runtime function; the emitter is untouched

Fact 2 makes this nearly free to arrange: add the compare at the top of each `rt_*`, return unchanged
otherwise. No emitter change, no IR change, no regen. A representative shape:

```c
val rt_vector_ref(val v, val i) {
  intptr_t k = UNFIX(i), n = vec_len(v);
  if (k < 0 || k >= n)
    rt_fatalf("vector-ref: index out of range: %ld (length %ld)", (long)k, (long)n);
  return as_ptr(v)[2 + k];
}
```

*Alternative rejected*: emit the check inline at call sites, where the emitter sometimes knows the
length statically and could skip it. It is faster in principle and wrong to do first — it would leave
the first-class primitive path (fact 3) unchecked, which is the path a `(apply vector-ref …)` or a
higher-order use takes, and it would put the safety property in the compiler rather than in the one
place that defines the operation. Inline elision is a later optimization *on top of* a correct
runtime, not a substitute for one.

### D3 — Trap, not a catchable condition

`rt_fatalf` aborts and longjmps to the host; it is not a Scheme `raise` and `guard` cannot catch it.
That matches the overflow precedent exactly, and the requirement inherits the property that makes the
precedent good: the in-process runner's host survives, so a REPL session reports the error and
evaluates the next form, while a standalone executable exits non-zero.

*Alternative considered*: raise a Scheme condition so `guard` can catch an out-of-range access. More
R7RS-shaped, and rejected for now on consistency — overflow, arity errors, and the "not an integer"
guards are all traps, and having one class of runtime restriction be catchable while its neighbours
are not is a worse surface than having none be. If catchable runtime conditions are wanted, that is
one change covering all of them, not a special case introduced here.

### D4 — String bounds are codepoint bounds

Per fact 4, `string-ref` and `string-set!` check against `str_cplen`, and `substring` checks both
bounds against `str_cplen` too. Using `str_len` would appear to work on ASCII — where the suites
mostly live — and would wrongly reject valid indices into any string with a multi-byte character.
This is the one place in the change where the naive guard is subtly wrong, so the tests include a
non-ASCII string indexed at its last codepoint.

### D5 — `substring` checks ordering, not only range

`rt_substring` computes `rt_make_string(b + so, eo - so)`; with `end < start` that length is negative
and reaches a `size_t` parameter, which is the 18-exabyte allocation and the exit-139 crash. So
`start <= end` is a distinct condition from either bound being in range, and both bounds being
individually valid does not imply it. `make-vector` / `make-bytevector` / `make-string` get the
matching non-negative-size guard, which is the same defect one step earlier: a negative size
currently yields an object whose header claims a negative length.

### D6 — Records are checked too, though the check is provably redundant

`record-ref` / `record-set!` are internal: the emitter generates each field accessor with a
compile-time constant index derived from the record definition, so a well-formed compiler cannot emit
an out-of-range record access. The check is still added, because the value is in catching a *compiler*
bug — a field-index miscalculation is precisely the mistake that would otherwise corrupt a neighbouring
object — and because a redundant compare on an already-loaded header word is not worth reasoning about
saving.

This is the natural place for the later elision D2 mentions: the emitter knows these indices are
constant and in range, so if measurement (D7) shows the record path costs anything, the fix is to elide
where provable rather than to remove the guard.

*Alternative rejected*: an unsafe/unchecked accessor variant exposed to Scheme, so hot code can opt
out. That re-introduces exactly the hazard being fixed, and it would immediately be used in the
compiler's own hot paths — the code with the most to lose from a silent heap corruption.

### D7 — Measure on the compiler, and record the result

The workload that matters is the compiler compiling itself: `src/parse.ss` keeps its environments in
vectors and the reader runs on `string-ref`, so `make regen` is both the hottest and the most
representative benchmark available. Measure regen wall-clock before and after, and record the outcome
in `docs/PERFORMANCE.md` — including if it is nil, because "bounds checks cost nothing measurable
here" is exactly the kind of finding that keeps the question from being re-litigated.

If it does show, the order of remedies is: elide where the emitter can prove the index in range
(records first, then constant indices), and only then consider anything that weakens the guarantee.
The guarantee is not traded for speed in this change.

### D8 — Sweep result: the twelve are the complete set (task 2, open question 2)

All 132 `^val rt_` in `src/runtime/runtime.c` were enumerated and classified. Exactly twelve take an
index, a range, or a size from Scheme, and they are the twelve the proposal names — there is no
`vector-fill!`/`vector-copy!`/`bytevector-copy!` in this runtime at all, so no range operation was
missed. Cross-checked against the prim table (`src/parse.ss:100-130`), every Scheme-reachable
accessor routes to one of them.

Four near-misses, each excluded for a stated reason rather than by omission:

- `rt_make_string(const char *, intptr_t len)` — C-internal, called only with a length the runtime
  itself computed. Scheme's `make-string` is `%make-string` → `rt_make_string_fill`, which is guarded.
- `rt_build_rest(argc, fixed, K, slots, overflow)` — the rest-argument calling convention, with
  counts the emitter generates; not an index from a program.
- `rt_escape_to` / `rt_escape_live_p` — the argument is a monotonic frame *id* resolved by a linear
  scan over live frames, not an index into storage; a stale id already returns `#f` by design.
- `list-ref` / `list-tail` (`src/prelude.scm:241-242`) — walk pairs, so an over-long index ends in
  `(car '())`. That is type confusion, which D1 leaves out of scope; noted here so its absence is a
  decision rather than an oversight.

Also settled by the reproduction pass: `make-string` is fixed-arity 2 in Emit, so the negative-size
case is `(make-string -1 #\a)` (`(make-string -1)` is an arity error, a different diagnostic).

## Risks / Trade-offs

- **Working code starts trapping.** Any program relying on an out-of-range access is by definition
  relying on unspecified memory, but "relying" includes *accidentally* — a loop whose bound is off by
  one and whose garbage result is discarded. → The compiler's own test suites are the sample that
  matters, and they are large; a trap during `make regen` or the suites is a real bug this change
  found, and should be treated as a finding rather than as a reason to soften the check.
- **A hot-path slowdown in the compiler.** → D7 measures it before the change is called done, on the
  workload most exposed to it.
- **The non-ASCII string bound is easy to get wrong** (D4). → A test indexing a multi-byte string at
  its last codepoint, which fails under a `str_len` guard and passes under `str_cplen`.
- **Trap-in-REPL regression.** These accessors run inside the compiler itself, which runs in-process
  during a REPL session, so a trap on a *compiler-internal* access would longjmp out of a compile
  rather than out of user code. → That is already true of every existing trap (overflow included), and
  the session-survival test covers the user-code case; a compiler-internal trap is a compiler bug and
  should be loud.
- **Scope creep toward type checking.** The moment bounds are checked, "why not types" becomes the
  obvious next question in review. → D1 answers it in the design and the requirement states the scope,
  so the answer is written down once rather than argued each time.

## Migration Plan

C-only, so: edit `src/runtime/runtime.c`, `make`, run the suites. No `make regen`, no bootstrap IR
movement, no generated `.sld` regeneration. Rollback is a single-file revert.

Sequence within the change: write the failing tests first (they are cheap and each is a one-liner),
then the guards accessor-by-accessor, then measurement. Landing after `reader-input-termination` means
the reader's dangling-escape read is already fixed, so a trap there will not appear as a mysterious
reader failure mid-suite.

## Open Questions

- Should the diagnostics name the *Scheme* procedure (`vector-ref`) or the runtime symbol
  (`rt_vector_ref`)? The overflow messages use the Scheme spelling (`+: fixnum overflow`), so follow
  that — noted only because `record-ref` has no user-facing Scheme spelling and will have to name
  something honest about being internal.
- ~~Is there any range-taking primitive beyond the twelve listed in the proposal?~~ **Resolved by the
  task 2 sweep — see D8.** The twelve are the complete set; no `vector-fill!`-style range operation
  exists in this runtime.
- ~~Does `string-set!` have a separate UTF-8 width problem — replacing a character with one of a
  different byte width — independent of bounds?~~ **Resolved: no, nothing to file.** `rt_string_set`
  already splices (rebuilding the byte buffer and rewriting the byte-length word), so all three
  directions are correct — narrow→wide `(string-set! (make-string 3 #\a) 1 #\á)` → `"aáa"` length 3,
  wide→narrow `"há"` → `"hb"` length 2, and wide→wide with a tail `"hállo"` → `"üállo"` with index 4
  still `#\o`. The codepoint count is invariant under a one-for-one replacement, which is why the
  count word needs no adjustment.
