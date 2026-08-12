## Context

Four facts set the shape of this work.

**1. The dereference is unconditional.** `as_ptr` (`src/runtime/runtime.c:110`) masks the low three
tag bits off and casts, and nothing between the argument and the load looks at what the tag was:

```c
val rt_car(val v)   { return as_ptr(v)[0]; }                                    /* :147 */
val rt_cdr(val v)   { return as_ptr(v)[1]; }                                    /* :148 */
val rt_unbox(val b) { return as_ptr(b)[0]; }                                    /* :152 */
val rt_vector_ref(val v, val i) {
  intptr_t k = UNFIX(i);
  CHECK_INDEX("vector-ref", k, vec_len(v));     /* vec_len is as_ptr(v)[1] */   /* :1277 */
  return as_ptr(v)[2 + k];
}
```

The `vector-ref` case is the one to read twice: `CHECK_INDEX` was added by
`checked-indexed-access` and does exactly what it claims, but `vec_len(v)` is itself an unchecked
load through `as_ptr`. Given a non-vector, the bound comes from whatever word sits at that address.
**The type check must therefore precede the length load, not merely exist** — that ordering is the
substance of this change, not a detail of it.

**2. Every predicate this needs already exists**, as the exact same test the Scheme-level predicate
performs: `rt_pair_p` (:419), `rt_vector_p` (:1289), `rt_bytevector_p` (:1320), `rt_string_p`
(:1568), `rt_record_p` (:1441), `rt_procedure_p` (:424). Reusing their conditions means the runtime
guard and the user-visible predicate can never disagree about what a vector is.

**3. The trap mechanism and its macro precedent exist.** `rt_fatal`/`rt_fatalf` (:206, :217) format
into a static buffer — no allocation, so they are safe on any trap path — print to stderr, and
longjmp to the host if one is installed, else `exit(1)`. `CHECK_INDEX` (:247) is the macro shape to
copy, and `core-language`'s two existing requirements (overflow, indexed access) are the stance to
extend.

**4. Unlike `checked-indexed-access`, this one is not C-only.** Mutable pairs add primitives
(`src/parse.ss`), a prim→`rt_` mapping and a call-site guard (`src/emit.ss`), `list-set!`
(`src/prelude.scm`) and three exports (`src/prelude-surface.scm`). All are `CORE_FLAT` inputs, so
`make regen` is required and `bootstrap/*.ll` will move. The `CLAUDE.md` barrier applies in full:
every compiler-source edit lands before regen starts, and no further edits until the suites finish.

## Goals / Non-Goals

**Goals:**

- No primitive dereferences an argument whose tag it has not verified, from any door, through any
  call path — including a primitive used as a first-class value.
- No indexed accessor derives a bound from an object it has not verified. This closes the hole in
  the guarantee `checked-indexed-access` states.
- `set-car!`/`set-cdr!` exist and are checked from their first commit, never joining the unchecked
  set they would otherwise widen.
- `apply` rejects a non-list final argument instead of silently computing a wrong answer.
- Calling a non-procedure reports instead of jumping to a computed address.
- The self-hosting cost is measured on the compiler's own workload and recorded, not assumed.

**Non-Goals:**

- Making traps catchable by `guard` — issue #89. A trap is not a raise and never was; this change
  does not alter that, and D5 explains why it should not be smuggled in here.
- Any error-object representation change (issue #85).
- An unsafe-accessor escape hatch (`unsafe-car`, a compile flag). Rejected for the same reason
  `checked-indexed-access` rejected it: it makes the guarantee conditional on how the program was
  built, which is the one property that makes a safety guarantee worth stating.
- Static type inference to elide checks. D11 records where that would apply as a follow-on.
- Checking arguments of primitives that do not dereference (`+` on a non-number is already checked;
  `char->integer` on a non-char reads an immediate's bits and is wrong, not unsafe).

## Decisions

### D1 — Reversing the "bounds, not types" scope is warranted, and this is the change invited to do it

`checked-indexed-access` scoped itself explicitly and left an opening:

> **Scope: this constrains bounds, not types.** … checking a *type* means a tag test on arguments
> that are correctly typed in every working program, whereas the bound checked here is a word in the
> object's own header that the accessor already loads. A later change MAY revisit type checking
> independently without altering this requirement. (`openspec/specs/core-language/spec.md:1277`)

That cost argument was correct when written and is still the right frame. Three things changed:

- **The bounds guarantee turned out to depend on the type check.** `vec_len` on a non-vector is an
  unchecked load, so `(vector-ref '() 0)` bounds-checks against garbage. This is not a new defect
  next to #70's; it is #70's, incompletely closed.
- **The consequence is worse than the class it was compared against.** A wrong-typed argument is a
  SIGSEGV that takes the process down, versus a wrong *value*. The stated line — report the
  violation rather than produce a wrong result — points the same direction here, more strongly.
- **The cost is now bounded by something checkable.** The link is `-flto` (`src/emit.cpp:1416`), so
  `rt_car` is inlinable into its caller and repeated tests on the same value within a block are
  redundancy-elimination candidates: `(car (cdr x))` should pay one test for `x`'s pair-ness at
  most, not two, and a loop over a list should hoist nothing but still fold the repeats. That is a
  claim to verify (D11), not to assume — but it is the reason the answer may differ from 2026-08-11.

**Alternative considered: check only the accessors that are not hot** (`vector-ref` yes, `car` no).
Rejected — `car` on `'()` is the single most common way a Scheme program fails, and a guarantee with
a hole where the failures actually happen is not one.

### D2 — The check lives in the runtime primitive, exactly as the bounds check does

`primitive-layer` requires a primitive used as a value to be the same procedure as the directly
called one, so `(apply car (list 7))` reaches `rt_car`. A guard emitted at call sites would leave
that path open, and would have to be repeated in the emitter for every primitive. One guard per
`rt_*` function covers every door and every path, and — for everything except the non-procedure call
(D6) — leaves the emitted IR untouched.

### D3 — A `CHECK_TAG` macro beside `CHECK_INDEX`, ordered before the length load

```c
static void rt_type_error(const char *who, const char *want, val got) {
  rt_fatalf("%s: not %s: got %s", who, want, rt_type_name(got));
}
#define CHECK_TAG(who, v, pred, want)                            \
  do { val chk_v_ = (v);                                         \
       if (!(pred)(chk_v_)) rt_type_error((who), (want), chk_v_); \
  } while (0)
```

and at each indexed accessor the two checks in the only order that works:

```c
val rt_vector_ref(val v, val i) {
  CHECK_TAG("vector-ref", v, is_vector, "a vector");   /* first: the bound comes from v */
  intptr_t k = UNFIX(i);
  CHECK_INDEX("vector-ref", k, vec_len(v));
  return as_ptr(v)[2 + k];
}
```

The message shape follows the existing diagnostics (`+: not a number`, `vector-ref: index out of
range: 5 (length 3)`): the Scheme procedure's name, then what was wrong.

### D4 — The diagnostic names the *type* it got, not the value

`rt_type_name(got)` returns a fixed string per tag/header (`the empty list`, `a fixnum`, `a string`,
`a procedure`, …). Rendering the offending *value* is possible — `err_write` (:1616) writes into a
buffer without allocating, and `rt_raise` uses it — but is rejected here:

- the value that reached a type check is exactly the value most likely to be malformed, and the
  printer walks it structurally;
- an arbitrarily deep or circular structure would fill the 128-byte `rt_trap_msg` with noise where
  the useful information is the type;
- `+: not a number` already sets the precedent of naming the class, not the value.

**Alternative considered:** render immediates only (`car: not a pair: got 7`) and name the type for
heap objects. Deferred to the open questions — it is a strictly better message when it applies, but
it doubles the formatting paths, and the type name alone is sufficient to identify the defect.

### D5 — It stays a trap; it does not become a raise

`(guard (e (#t 'caught)) (car '()))` will still not catch after this change — it will print
`car: not a pair: got the empty list` and abort, as `(vector-ref (vector 1 2) 9)` does today.
`rt_fatal` longjmps to the *host* frame (`rt_trap`) or exits; the Scheme handler chain is
`*handlers*` in `src/prelude.scm:557`, which C cannot reach. Routing traps into it is issue #89 and
a genuine design (a C-callable door onto the Scheme handler chain, plus a re-entrancy story).

Keeping them separate is deliberate: this change is a **memory-safety** change with a large blast
radius across the runtime and a regen cycle, and #89 is a **control-flow** change that alters what
every existing trap does — including the ones already shipped. Merging them would make a bisect
between "the check is wrong" and "the raise path is wrong" impossible. Sequencing this one first
also gives #89 its full set of call sites to route.

The proposal and both issues (#84, #78) claim or imply `guard` involvement; the specs must say
plainly that it does not, so that nobody reads "diagnostic" as "catchable".

### D6 — The non-procedure call is checked at the call site, on the indirect path only

There is no runtime function to guard: `emit-app` (`src/emit.ss:1036`) calls `emit-load-code`
(:1002), which masks, loads word 0 as a code pointer, and calls through it. The other two call
shapes — `self-app` and `known-app` — pass a statically-known closure and never load a code pointer
out of an untrusted value, so **they need no check and must not pay for one**. That is what keeps
this affordable: the guard lands only where the callee is genuinely dynamic.

The emitted guard is a call to a new `rt_check_callable(val)` immediately before the mask, rather
than an inline compare-and-branch:

- one line of IR per indirect call instead of a compare, a branch, two blocks and a trap call, so
  the IR-size cost (a first-class concern here — binary size is a design goal) stays minimal;
- `-flto` inlines the test back into the caller, so the runtime cost is the same compare either way;
- the diagnostic text stays in C beside every other trap message.

This is the one part of the change that alters emitted IR, so `bootstrap/*.ll` moves and every
delivered executable grows slightly. If measurement (D11) says the growth is unacceptable, this
requirement is the separable one — it is the second half of #84 and can be dropped to a follow-on
without touching the rest.

### D7 — `set-car!`/`set-cdr!` are primitives, integrable, and checked from birth

New `%set-car!`/`%set-cdr!` in `*prims*`, `(set-car! %set-car! 2)`/`(set-cdr! %set-cdr! 2)` in
`*integrable*` (`src/parse.ss:87`) so a direct call inlines and a value reference etas, mapped to
`rt_set_car`/`rt_set_cdr` in `src/emit.ss`, exported from `(scheme base)` via
`src/prelude-surface.scm`. Each is a `CHECK_TAG` and a tagged store into word 0 or 1.

Two questions #82 raises, answered:

- **Literal mutability.** R7RS 4.1.2 makes altering a constant an error. Emit already lets
  `vector-set!` mutate a quoted vector literal, and `core-language` records that "mutating a string
  literal is undefined" (`spec.md:918`). Pairs get the same answer — undefined, and *not* checked —
  rather than a third policy. What the specs must guarantee is that it does not crash: a quoted pair
  is an ordinary heap pair, so the store is memory-safe whatever one thinks of it.
- **GC write barrier.** Boehm here is non-generational and does not require one, so a plain store is
  correct. This is recorded in a comment at the store, because it is precisely the assumption a
  later collector change would silently break.

### D8 — `list-set!` lands in this change

`core-language` defers it in terms that name this change's precondition: "`list-set!` is deliberately
NOT included: it mutates a pair, and mutable pairs do not exist yet (`set-car!`/`set-cdr!` are
absent). It SHALL arrive with them" (`spec.md:3336`). Leaving it out would leave a spec sentence
false in the other direction. It is a prelude definition over `set-car!`, so it costs nothing beyond
the export.

### D9 — `apply`'s proper-list check costs one comparison, not a traversal

`rt_apply_argv` (:463) already walks the list once to copy elements, after `rt_list_length` walked
it to size the vector. The check needs neither a third pass nor a change to either: after the copy
loop, the cursor is `NIL_V` for a proper list and something else otherwise.

```c
for (intptr_t i = 0; i < m; i++) { v[n + i] = as_ptr(lst)[0]; lst = as_ptr(lst)[1]; }
if (lst != NIL_V) rt_fatal("apply: last argument is not a proper list");
```

This catches all three cases #78 lists: `(apply + 3)` (length 0, loop does not run, cursor is still
`3`), `(apply + 3 4)`, and the improper `'(2 3 . 4)` (cursor ends at `4`). #78 proposed folding the
detection into the traversal; this is cheaper still — one compare on a value already in a register.
Note it must come *after* the copy loop and the loop's own dereferences are safe, because
`rt_list_length` bounded them.

### D10 — A non-fixnum index is checked too, in the same pass

`(vector-ref v "x")` does not crash today: `UNFIX` shifts the tagged pointer right by three, yielding
a huge index that `CHECK_INDEX` rejects — as `index out of range: 481036337168`, which names the
wrong defect. Every accessor now has a type-check block anyway, so testing the index's tag in it is
one more compare in a block that already exists, and it turns a misleading range message into
`vector-ref: index is not an exact integer: got a string`. Included as a message-quality fix, flagged
as such rather than as a safety fix, so the measurement can drop it if it does not carry its weight.

### D11 — Measurement is part of the change, with a defined fallback

`car`/`cdr` are the hottest primitives in the compiler's own sources, so the self-compile is the
right workload and the honest test. What to record in `docs/PERFORMANCE.md`:

- `make regen` wall time before and after (~1000s baseline, per the suite timings), which is the
  compiler compiling itself and is dominated by exactly these accessors;
- `build/emit` binary size before and after, and a delivered hello-world executable's size — binary
  cleanliness is a stated design goal, and D6 grows every indirect call site;
- whether LTO folds the repeated tests, checked by reading the IR/asm for one hot function rather
  than inferred from the totals.

**If the cost is material**, the fallback is *not* an unsafe mode. It is emitter-side elision: the
emitter already knows the type of a freshly allocated `cons`, and `inline-primitives` already
rewrites primcalls, so a provably-pair argument could lower to an unchecked `rt_car_unchecked`. That
is a separate change with its own correctness burden, and this design records it as the escape route
rather than pre-emptively building it.

## Risks / Trade-offs

- **[Self-hosting slows measurably]** → D11 measures before the change is called done; the fallback
  (emitter-side elision) preserves the guarantee instead of weakening it. The check is a compare on
  a register-resident value under LTO, so the expected cost is small — but "expected" is why it gets
  measured.
- **[Emitted IR and binaries grow, via D6]** → D6 is the separable requirement. If size regresses
  beyond tolerance it can be deferred without touching the accessor work, and the change still
  closes the segfaults that motivate it.
- **[The regen barrier gets crossed]** → this change touches four `CORE_FLAT` inputs, so a stray
  edit after regen starts costs a ~25-minute failure in `trust-check.sh`, and a killed regen leaves
  `bootstrap/` mixed-source. Mitigation: the task list sequences *all* Scheme edits before the single
  regen, and the C-only accessor work — which needs no regen — is completed and tested first.
- **[`guard` still cannot catch, and users will expect otherwise]** → stated explicitly in the specs
  and in the diagnostic-shaped scenarios, and #89 is filed with this change named as its
  precondition.
- **[Un-excluding 17 conformance forms exposes second-order failures]** → expected and desirable:
  two of the rows are `blocked-by` an `issue-84` row precisely because their real behaviour has never
  been observed. The suite fails once by design and names what to un-exclude; any form that still
  fails gets a fresh, accurate exclusion reason rather than a silent re-exclusion.
- **[A wrong predicate makes a working program fail]** → the guards reuse the conditions behind the
  existing Scheme predicates (D3, Context fact 2) rather than open-coding new tag tests, and the task
  list front-loads in-range/right-typed regression cases so an over-tight guard fails the suite
  before it fails a user.
- **[Mutation reaches a quoted literal]** → undefined per D7, consistent with strings and vectors,
  and memory-safe by construction. Not checked, and the specs say so rather than leaving it implied.

## Migration Plan

1. **C-only work first, no regen**: `CHECK_TAG`, every accessor guard, `rt_set_car`/`rt_set_cdr`
   (defined but not yet reachable from Scheme), the `apply` check, `rt_check_callable`. Testable
   immediately via `make` and the new suite, iterating with
   `chez --libdirs src --script src/compile.ss`.
2. **Scheme-side work in one batch**: `src/parse.ss` prim/integrable entries, `src/emit.ss` name map
   and `emit-app` guard, `src/prelude.scm` `list-set!`, `src/prelude-surface.scm` exports.
3. **One `make regen`** (~12 min), then `./run-all-tests.sh`, then `./run-dev-tests.sh` suite by
   suite (each exceeds the 600s tool timeout).
4. **Measure and record** in `docs/PERFORMANCE.md` (D11).
5. **Un-exclude the 17 conformance rows** and re-run `test/r7rs-suite-tests.sh`.
6. **Commit, then `test/trust-check.sh`** — it `[SKIP]`s while `bootstrap/` is dirty by design.

Rollback: steps 1 and 2 are independent commits; reverting step 2 alone restores the pre-regen
compiler with the accessor guards intact, since nothing in step 1 is reachable from new Scheme
surface except the mutators.

## Appendix: the sweep (task 2)

154 `rt_*` functions in `src/runtime/runtime.c`, classified by whether a wrong-typed argument is
*unsafe* (a dereference) or merely *wrong* (a representation read). The proposal's enumeration was
short: the **string family is in scope too**, and every one of them segfaults today —
`(string=? 7 "a")`, `(string-append 7 "a")`, `(string->symbol 7)`, `(symbol->string 7)`,
`(string-copy 7)`, `(write-string 7)` all exit 139, and they are user-facing `(scheme base)` names,
not `%`-internals.

**1. Dereferences an argument — guarded by this change.**

| group | functions |
|---|---|
| pairs | `rt_car`, `rt_cdr`, and the new `rt_set_car`, `rt_set_cdr` |
| boxes | `rt_unbox`, `rt_set_box` |
| vectors | `rt_vector_ref`, `rt_vector_set`, `rt_vector_length` |
| strings | `rt_string_ref`, `rt_string_set`, `rt_string_length`, `rt_substring`, `rt_string_eq` (both arguments), `rt_string_append` (both), `rt_string_copy`, `rt_string_copy_from`, `rt_string_to_symbol`, `rt_string_to_flonum`, `rt_write_string`, `rt_port_write_string` |
| symbols | `rt_symbol_to_string` (`sym_name` is `as_ptr(s)[0]` read as a `char *` — the worst of the set: it reaches `strlen`) |
| bytevectors | `rt_bytevector_u8_ref`, `rt_bytevector_u8_set`, `rt_bytevector_length` |
| records | `rt_record_ref`, `rt_record_set` (`rt_make_record_type` only *stores* its name argument, so it is not in this list) |
| other heap types | `rt_hash_table_spine`, `rt_mv_to_list`, `rt_error_object_message`, `rt_error_object_irritants`, `rt_flonum_to_string` |
| structural | `rt_apply_argv` (a proper list, D9), and the call sites via `rt_check_callable` (D6) |

`rt_error_object_message`/`_irritants` are worth singling out: they are user-facing R7RS names
reached from a `guard` clause, so `(error-object-message e)` on a non-error crashes inside the one
construct a program uses to recover from failure.

**2. Reads a representation without dereferencing — a wrong answer, not unsafe. Out of scope.**
`rt_char_to_integer` (`(char->integer 7)` returns `0`), `rt_list_to_string` (`(list->string 7)`
returns `""`), `rt_list_length` (returns `0` for a non-list). Each answers design open question 4 the
same way: the defect is conformance, not memory safety, and folding them in would widen a
memory-safety change into a conformance sweep. Filed as follow-on work rather than fixed here.

**3. Already guarded — no change.** The arithmetic and rounding families (`is_number` /
`is_integer_valued`), `rt_integer_to_char`, `rt_read_file` and `rt_port_open_output_file` (both
already test `HDR_STRING` and return `#f`), the tag predicates, and the tag-dispatched printers and
`rt_equal`/`rt_eqv_p`. `rt_string_len`/`rt_string_bytes`/`rt_make_string` are the host C++ boundary
and are a stated non-goal.

## Open Questions

1. **Do the internal record accessors need the type check?** `rt_record_ref`/`rt_record_set` are
   compiler-generated — `define-record-type` emits them with a type-checked descriptor comparison
   already in the prelude — so the argument may be provably a record at every call site. Their
   `CHECK_INDEX` messages already say `(internal)`, acknowledging a user should never see one.
   Cheapest to include for uniformity; worth confirming there is no path where a user value reaches
   them directly (`%record-ref` is in `*prims*` but not `*integrable*`, so it is not user-reachable
   by name).
2. **Should immediates render their value in the diagnostic** (`car: not a pair: got 7`)? D4 defers
   it. Decide once the message shape is in front of a failing test.
3. **Does `rt_string_set` need any additional guard beyond the tag?** It rebuilds the string's byte
   buffer, so a wrong-typed argument reaching `str_len` is the same garbage-bound problem as
   `vec_len`; confirm the tag check placement covers the `blen`/`str_cplen` reads, both of which
   happen before `CHECK_INDEX`.
4. **Is `char->integer` on a non-char in scope?** It reads an immediate's payload bits rather than
   dereferencing, so it returns a wrong number instead of crashing — this change's class by intent
   but not by mechanism. Sweep for the full set of "reads a representation it did not verify"
   primitives during task 2 and decide with the list in hand, as `checked-indexed-access` did.
