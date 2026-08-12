## Why

Every primitive that dereferences its argument as a pointer does so **without checking the
argument's tag** (issue #84). A wrong-typed argument is not a diagnostic — it is an unchecked
memory access, and the program dies on a signal:

```console
$ emit run car.scm                       # (display (car '()))
                                         # no output; exit 139 (SIGSEGV)
$ emit run vref.scm                      # (display (vector-ref '() 0))
                                         # no output; exit 139 (SIGSEGV)
$ emit run guarded.scm                   # (display (guard (e (#t 'caught)) (car '())))
                                         # no output; exit 139 -- guard cannot defend against it
$ emit run call.scm                      # (display ((quote not-a-proc) 1))
                                         # no output; exit 138 (SIGBUS)
```

`as_ptr` (`src/runtime/runtime.c:110`) masks the tag bits off and dereferences. For `'()` that is
the address `0`; for a fixnum it is the payload reinterpreted as an address. Arithmetic is the
exception and shows the intended shape — `(+ 1 'a)` reports `+: not a number` and exits 1 — because
`numeric-conformance` gave the arithmetic path an `is_number` guard that nothing else got.

**This is the last unchecked argument class, and it undercuts the one that was just fixed.**
`checked-indexed-access` (#70, merged in #72) made an out-of-range *index* a diagnostic, "never an
unchecked access" — and scoped itself explicitly to bounds, leaving type confusion in force with a
note that "a later change MAY revisit type checking independently"
(`openspec/specs/core-language/spec.md:1277`). This is that change, and the two are not merely
adjacent: `(vector-ref '() 0)` reaches `CHECK_INDEX` having already evaluated `vec_len(v)` on a
non-vector, so **the bounds check reads its bound from garbage**. The index is guarded; the object
it indexes is not. The guarantee #72 states is only true for arguments that were already the right
type.

Two more primitives fail the same way, from the same root cause — a structural assumption about an
argument that nothing verifies:

- **`apply` accepts a non-list final argument and silently drops it** (issue #78).
  `rt_apply_argv` (`runtime.c:463`) computes `rt_list_length(lst)`, gets `0` for a non-pair, and
  builds the argument vector from the leading arguments only: `(apply + 3)` returns `0`,
  `(apply + '(2 3 . 4))` returns `5`. Wrong answers, not crashes — the same defect one layer up,
  and the only one of this group that is silent.
- **Calling a non-procedure dies on `SIGBUS`**: `((quote not-a-proc) 1)` loads a code pointer out
  of a value that is not a closure (`emit-load-code`, `src/emit.ss:1002`) and jumps to it.

And mutable pairs (issue #82) belong here rather than after: `set-car!`/`set-cdr!` do not exist, so
adding them under today's pattern would create the first unchecked *write* through a pair pointer —
two more sites to fix, immediately. `core-language` already anticipates this ordering: `list-set!`
"is deliberately NOT included: it mutates a pair, and mutable pairs do not exist yet …
It SHALL arrive with them" (`spec.md:3336`).

The R7RS conformance suite measures the cost precisely. `test/r7rs/exclusions.tsv` carries **15
forms** excluded for these three issues (5 `issue-84`, 7 `issue-82`, 3 `issue-78`) plus **2 more**
chained off an `issue-84` row via `blocked-by` — forms that cannot RUN, not tests that fail.

Timing: `homebrew-tap-distribution` puts SemVer 0.1.0 on the accepted language. Turning an unchecked
access into a trap tightens what Emit accepts, which is ordinary before a first tag and a breaking
change after it — the same argument that sequenced `checked-indexed-access` ahead of the tag.

## What Changes

- **Every primitive that dereferences an argument checks its tag first.** A `CHECK_TAG`-style guard
  beside the existing `CHECK_INDEX` (`runtime.c:247`), then one line per accessor: `car`/`cdr`, the
  vector/string/bytevector length-and-index accessors and their mutators, `unbox`/`set-box!`, and
  the internal record accessors. **Ordering is part of the requirement** for the indexed ones — the
  type check must precede the length load, or `CHECK_INDEX` still takes its bound from garbage.
- **`set-car!` and `set-cdr!` exist, and are born checked** — new `%set-car!`/`%set-cdr!`
  primitives, `*integrable*` entries so a direct call inlines, exported from `(scheme base)`. With
  them, `list-set!` is no longer blocked and lands in the same change, closing the deferral
  `core-language` already records.
- **`apply` rejects a final argument that is not a proper list**, detected during the walk it
  already performs rather than in a second pass.
- **Calling a non-procedure is a diagnostic, not a `SIGBUS`.** A tag test where the code pointer is
  loaded — only on the *indirect* call path (`emit-app`), since `self-app` and `known-app` call a
  statically-known closure and cannot fail this test. `%procedure?` already exists as a tag test
  (`rt_procedure_p`, `runtime.c:424`), so the predicate is not new work.
- **The diagnostic is a trap, matching the overflow and bounds precedent**: it names the procedure
  and what it got, aborts the computation, and under the in-process runner longjmps back to the host
  so a REPL session survives it.
- **Tests pin each case**, and the 17 conformance-suite exclusions are removed — which
  `test/r7rs-suite-tests.sh` checks in both directions, so a stale exclusion fails the suite just as
  a regression does.

**Not in scope, deliberately:**

- **Making traps catchable by `guard` (issue #89).** `rt_fatal` longjmps to the *host* frame or
  exits; it never consults the Scheme `*handlers*` chain, so it is not a raise and never was. This
  change converts a SIGSEGV into a clean abort with a diagnostic — a large improvement, and the
  precondition for #89 — but `(guard (e (#t 'caught)) (car '()))` still will not catch. Both #84 and
  #78 assume otherwise in their write-ups; that assumption is wrong today for *every* trap,
  including the ones `fixnum-overflow-trap` and `checked-indexed-access` already shipped.
- **A kind field on the error object (issue #85).** Nothing here needs an error object at all.
- **Checking a non-fixnum *index*** — `(vector-ref v "x")`. It is genuinely this change's class, but
  the index is consumed by `UNFIX` rather than by a dereference, so it misreads as a huge index and
  is caught by `CHECK_INDEX` as a range error rather than crashing. The design decides whether to
  spend a second test on it.

## Capabilities

### New Capabilities

None. Every requirement here extends an existing `core-language` stance — the same
report-rather-than-corrupt line already drawn for exact-integer overflow and for indexed access.

### Modified Capabilities

- `core-language`: gains **"A wrong-typed argument to a primitive is a diagnostic, never an
  unchecked access"** — a primitive that dereferences an argument SHALL verify its tag before the
  dereference, and before any length load derived from it; and calling a non-procedure SHALL report
  rather than transfer. Gains **"Pairs are mutable"** — `set-car!`/`set-cdr!`, with `list-set!` no
  longer deferred. Modifies the existing **"Indexed access out of range"** requirement, whose
  bounds-not-types scoping paragraph is superseded (its explicit invitation to a later change is now
  taken up), and the **"Variadic procedures, rest parameters, and apply"** requirement, which gains
  the proper-list condition on `apply`'s final argument. The multiple-values requirement
  (`spec.md:2561`) also cites the unchecked-type-confusion decision in passing and needs its
  sentence reconciled.

## Impact

- `src/runtime/runtime.c` — the `CHECK_TAG` macro plus a guard in each of `rt_car`, `rt_cdr`,
  `rt_unbox`, `rt_set_box`, `rt_vector_ref`/`_set`/`_length`, `rt_string_ref`/`_set`/`_length`,
  `rt_substring`, `rt_bytevector_u8_ref`/`_set`/`_length`, `rt_record_ref`/`_set`, and
  `rt_apply_argv`; new `rt_set_car`/`rt_set_cdr`. Host C — reached by plain `make`.
  **The sweep (task 2) widened this list by thirteen**: the string family (`rt_string_eq`,
  `rt_string_append`, `rt_string_copy`, `rt_string_copy_from`, `rt_string_to_symbol`,
  `rt_string_to_flonum`, `rt_write_string`, `rt_port_write_string`), `rt_symbol_to_string`,
  `rt_flonum_to_string`, `rt_hash_table_spine`, `rt_mv_to_list`, and
  `rt_error_object_message`/`_irritants` all dereference an argument too, and all segfault today.
  They are user-facing `(scheme base)` names, not `%`-internals. See design.md's sweep appendix.
- `src/parse.ss` (`*prims*`, `*integrable*`), `src/emit.ss` (the prim→`rt_` name map, and the
  indirect-call guard in `emit-app`), `src/prelude.scm` (`list-set!`), `src/prelude-surface.scm`
  (three exports). **All four are `CORE_FLAT`/regen inputs, so this is a `make regen` change** —
  unlike `checked-indexed-access`, which touched only host C. Budget the ~12 min regen plus the
  full suite run, and treat the barrier in `CLAUDE.md` as binding.
- **Performance, and it must be measured rather than assumed.** `car` is the hottest primitive in
  the compiler's own sources and lowers to a bare `call i64 @rt_car(i64)`, so this is a branch per
  `car` on the self-hosting path. Two facts bound the cost before measuring: the link is `-flto`
  (`src/emit.cpp:1416`), so `rt_car` is inlinable into its caller and repeated tests on the same
  value are redundancy-elimination candidates; and the test is on a value already in a register, not
  a load. The measurement and its outcome belong in `docs/PERFORMANCE.md`.
- `test/` — a new suite in the shape of `test/indexed-access-tests.sh`, which is the model: it pins
  wrong-typed reads, wrong-typed writes with a neighbouring object checked, both doors agreeing, and
  REPL survival.
- `test/r7rs/exclusions.tsv` — **3 rows removed and 12 retagged.** The estimate above (17 rows
  deleted) was wrong: most of those forms stay excluded, but for reasons the manifest had recorded
  incorrectly. Four `issue-84` rows are really a frontend crash on an unsupported form (#91), three
  `issue-78` rows are fixed but unobservable because `test-error` cannot catch a trap (#89), three
  `issue-82` rows now hang on circular structures (#90), one is an arity gap (#33) and one a `cond`
  hygiene bug (#92). The ratchet verifies pass/fail but never re-checks a *reason*, so they had
  rotted silently.
- Closes #84, #82, #78. Unblocks #89 (traps catchable) and the circular-structure work that #75
  (datum labels) and `write` cycle detection both wait on.
