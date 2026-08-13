## Context

Two defects meet at one object. `read-error?`/`file-error?` cannot be written over what exists
because the error object carries no kind (#85); runtime traps cannot be caught because they never
become objects at all (#89). Both are representation, and doing them apart means visiting every raise
site twice.

The relevant current state, verified rather than assumed:

- **The error object is three words.** `rt_make_error_object` (`src/runtime/runtime.c:1971`)
  allocates `{HDR_ERROR, message, irritants}`; `rt_error_object_p` is one header compare, and the two
  accessors read words 1 and 2. **`err_write` reads those words directly** (`:1884`), as does the
  value printer's `HDR_ERROR` arm — so the layout has more readers than the accessors.
- **The ~44 trap sites funnel through two functions.** `CHECK_TAG` → `rt_type_error` → `rt_fatalf`;
  the bounds, negative-size, overflow, division and `apply` diagnostics likewise. `rt_fatal` /
  `rt_fatalf` (`:377`, `:389`) format into the static `rt_trap_msg`, print to stderr, then
  `longjmp(*rt_trap, 1)` to the *host's* frame or `exit(1)`. `rt_trap` is what lets `emit repl`
  survive a bad form; it is not a guard frame, and no Scheme handler runs on the way out.
- **`rt_arity_error` (`:657`) does not call either.** It duplicates the format-print-abort body, so
  it is a separate decision rather than something that moves for free.
- **The raise path is Scheme.** Under `dynamic-extent` D4, `raise` (`src/prelude.scm:646`) walks
  `*handlers*` and *calls* the current handler; `guard` is a handler that escapes. `rt_raise`
  (`:1995`) is only the unhandled tail.
- **Both mechanisms this change needs already exist next door.** `rt_intern` canonicalizes symbols by
  name against an uncollectable scanned table (`:674`), and `rt_repl_cell` (`:1141`) is the
  established pattern for a GC-scanned root cell holding a Scheme value across calls.

The nine forms being retired are narrower than the issue bodies suggest, and knowing which is what
keeps the change bounded:

| rows | forms | what they actually need |
|---|---|---|
| 5 (#85) | `(read-error? (guard … (read …)))` ×2, `(file-error? (guard … (open-input-file …)))`, and two negative cases over `(error "BOOM!")` | these already raise **catchably** through `error` — only the kind is missing |
| 1 (#85) | `(file-error? (guard … (delete-file " no such file")))` | **`delete-file` does not exist** — see D8 |
| 3 (#89) | `(test-error (apply + 3))`, `(apply + 3 4)`, `(apply + '(2 3 . 4))` | `rt_fatalf` at `:652`; `test-error` is `(guard (e (#t #t)) …)`, so the trap must reach a handler |

## Goals / Non-Goals

**Goals:**

- `read-error?` and `file-error?` answer correctly for the three sources R7RS 6.11 distinguishes.
- A condition arising from **data** — wrong type, out-of-range index, overflow, division by zero, a
  bad `apply` argument — is a catchable condition rather than a process abort.
- Every existing diagnostic keeps its **exact wording**, caught or uncaught.
- The kind stays an internal representation detail, so it can be re-encoded later without a
  user-visible change.

**Non-Goals:**

- `raise-continuable` and resumable handlers. `with-exception-handler` is already public
  (`dynamic-extent`); nothing here needs the resumable half.
- Making the runtime's own invariant violations catchable — see D2.
- Re-opening `dynamic-extent` D4. See D3, which argues this change is compatible with it, not a
  revision of it.
- A public `error-object-kind`. R7RS-small has no such procedure and exposing one would freeze the
  encoding (D1).

## Decisions

### D1 — The kind is an interned symbol in a **fourth** word, and it is private

Layout becomes `{HDR_ERROR, message, irritants, kind}` — the kind **appended**, not prepended.

That ordering is the whole point. `err_write` and the value printer read words 1 and 2 by index, not
through the accessors, so putting the kind first would silently move every existing reader of an
error object and any missed one would render garbage on the error path — the worst place to find a
bug. Appending leaves every current reader correct by construction and confines the edit to the
constructor plus one new accessor.

*Why a fourth word rather than a header code.* Encoding the kind as `HDR_ERROR_READ`/`HDR_ERROR_FILE`
keeps the object three words but costs the single-compare `is_error_obj`, turning it into a range
test that every predicate and every printer arm must agree about — and tag-7 header codes are a
managed, shared resource. One word on an object that is allocated only when something has already
gone wrong is not worth that.

*Why a symbol rather than a fixnum enum.* The issue asks whether the kind should be open or closed,
and notes the representation is awkward to widen later. A symbol is open at no cost: `rt_intern`
canonicalizes by name, so the four kinds are interned once and are thereafter ordinary immediate
comparisons. Four are used now — `error` (from `error`), `read`, `file`, and `runtime` (D6).

*Why private.* Only `read-error?` and `file-error?` become public; the kind is reached through
`%error-object-kind`, an internal primitive. This is what makes "awkward to widen later" untrue: no
user-visible contract mentions the encoding, so a future change may re-encode freely.

### D2 — Catchable is a condition about **data**; fatal is a violation of the runtime's own invariants

The line, and the reason for it:

| stays fatal | becomes catchable |
|---|---|
| `escape/guard nesting too deep` (`rt_run_guarded`) | wrong type (`rt_type_error`, every `CHECK_TAG`) |
| escape to a dead frame | index out of range, negative size |
| `rt_arity_error` | fixnum overflow, division by zero |
| allocation failure | `apply`: last argument is not a proper list |

A condition *about data* is something a program can meaningfully recover from: it says an argument
was wrong, and a handler can substitute, report, or retry. A violation of the runtime's **own**
invariants says the machinery is unsound — and running a Scheme handler on top of unsound machinery
is strictly worse than aborting, because the handler runs on the very structures whose invariant just
failed. The guard-depth trap is the sharpest case: it fires because the escape frame stack is full,
and a handler that escapes needs exactly that stack.

**`rt_arity_error` is on the fatal side by the boundary of this change, not by that principle**, and
saying so plainly matters more than a tidy rule. It duplicates the format-print-abort body rather
than calling `rt_fatal`, so it does not move for free; no exclusion row needs it; and an arity
mismatch is arguably data-shaped, so a later change may well move it. It is left where it is because
nothing here requires touching it, and that is a scope decision.

The practical consequence of the funnelling is that **the ~44 sites are not edited**. All of them
reach `rt_fatal` or `rt_fatalf`, so the change is at those two functions; every diagnostic keeps its
wording because it is the same `snprintf` producing it.

### D3 — The runtime hands off **once**; it does not drive Scheme. This is why D4 stands

`dynamic-extent` design D4 rejected an alternative that looks like this one:

> **Wind stack in C, with `rt_raise` calling back into Scheme** to run each `after`. Rejected: it puts
> Scheme calls in the middle of the runtime's error path, where a raise from within an `after` thunk
> becomes re-entrant in the worst possible place.

A reviewer who knows that will read this change as re-opening it. It is not, and the difference is
structural rather than a matter of degree:

- The rejected design put the **unwinding loop** in C. The runtime would call into Scheme once per
  `after` thunk, staying in the middle of a control transfer across an unknown number of re-entries,
  with its own state half-updated between them.
- This change calls Scheme **once and hands off**. `rt_fatal` builds an object and invokes the
  installed raiser; from that call onward the runtime is not in the loop. `raise` walks `*handlers*`
  in Scheme, the handler escapes, and *the escape path already runs the `after` thunks in Scheme* —
  which is precisely the machinery D4 built.

The runtime's job stays what D4 wanted it to be: transfer control. What changes is only the
destination — into the handler chain rather than to the host's `rt_trap` frame. D4's own framing
supports it: `guard` is not a primitive mechanism but a handler that escapes, so a trap that enters
the handler chain is not a new kind of control flow, it is the existing kind with a new origin.

*Mechanism.* A `GC_MALLOC_UNCOLLECTABLE` cell holds the raiser closure, following `rt_repl_cell`'s
precedent in the same file, so the closure is a scanned root and survives collection. It is installed
once by the prelude through a `%set-trap-raiser!` primitive, which the emitter special-cases exactly
as it does `%run-guarded`: the call carries the module's own `@__apply0` pointer, because a trap
fires from anywhere in the runtime and has no call site to be handed a trampoline by.

Two refinements, both settled during implementation and both narrowing the mechanism rather than
changing what it does:

- **The raiser is a THUNK, and the object travels through a second cell** (`%trap-object`) — not a
  one-argument procedure invoked through a 1-arg trampoline, as this decision first said. A
  `@__apply1` would have to agree with the installing module's positional-slot count `K`, which is
  `(max-arity defs)` and may be 0; the object would then have to ride the overflow array. Reusing
  `@__apply0` sidesteps that entirely, at the cost of one more uncollectable cell. The in-flight
  flag already forbids nested delivery, so a single-slot cell cannot be clobbered mid-flight.
- **The arming rides `*handlers*`'s own initializer**, rather than standing as a definition of its
  own. The AOT tree-shake keeps a library binding only when something reaches it
  (`compile-library*`, `src/core.ss`), and an arming definition nothing references is pruned out of
  every shipped executable — silently, with traps quietly going back to aborting. A bare top-level
  *command* would be kept unconditionally, but the partition homes forms by the name they bind
  (`library-body-forms`), so the prelude has no way to write one. Tying it to `*handlers*` is
  also the honest dependency: a raiser with no handler chain has nowhere to deliver, so it is armed
  exactly when the chain it feeds exists.

*Fallback.* With no raiser installed — during prelude startup, and for a standalone entry before the
prelude runs — `rt_fatal` behaves exactly as today. The fallback is not a degraded mode to be
apologised for; it is the only correct behaviour when there is no handler chain yet.

### D4 — A trap **inside** the raiser is the re-entrancy hazard, and one flag settles it and the buffer question together

If a handler itself traps — `(guard (e (#t (+ 1 'a))) …)` — control re-enters `rt_fatal` while the
first trap is still in flight. Unbounded, that recurses.

An **in-flight flag**: while set, a trap skips the raiser and takes the print-and-abort path. This
also disposes of the issue's separate worry about `rt_trap_msg` being a single static buffer. The
worry is that a second trap overwrites the first's message; with the flag, a second trap in flight
does not proceed to build an object at all — it aborts with its own message, which is the one that
matters, and the first is already spent.

**Clearing the flag is the subtle part, and it must be done where the `longjmp` lands, not where it
was set.** A handler that escapes never returns to `rt_fatal`'s frame, so no cleanup after the call
runs. The flag is therefore cleared at the two points that receive control: `rt_run_guarded`'s
caught branch, and the host's `rt_trap` frame. Getting this wrong fails in a specific, testable way —
the *second* catchable trap in a session becomes fatal — so the suites must include catching two
traps in sequence, and catching a trap raised from inside a handler.

### D5 — Allocation on the trap path is accepted, deliberately

`rt_fatalf`'s comment records the current property: *"Formats straight into the static trap buffer —
no allocation, so it is safe on any trap path."* Building an error object gives that up: a message
string plus four words, per catchable trap.

Accepted, because the property was protecting against a hazard that does not apply to the traps being
converted. These fire from ordinary Scheme execution — a wrong argument to `+`, an out-of-range
index — where the collector is in a normal state and allocation is exactly as safe as the allocation
the failing expression was already doing. The traps where allocation would genuinely be unsafe are
allocation failure itself and the machinery invariants, and D2 leaves all of those fatal. The kind
symbols cost nothing after the first intern.

### D6 — A trap's kind is `runtime`, and `error-object?` is true for it

Once a trap becomes an object, `error-object?` answers `#t` for it and `error-object-message` returns
the diagnostic. R7RS 6.11 permits this — `error-object?` covers objects from `error` "or one of an
implementation-defined set" — and it is what makes the caught object useful rather than opaque.

`read-error?` and `file-error?` are `#f` for it, which is the behaviour the six #85 rows check from
the other direction.

### D7 — Uncaught output is byte-identical, and there is a specific reason

Routing traps through `raise` means an **un**handled trap now renders through `rt_raise`'s
`err_write` rather than through `rt_fatal`'s `fprintf`. That could have changed the text of every
uncaught diagnostic in the suites.

It does not, provided trap objects are built with the formatted message as the message string and
**`'()` as irritants**: `err_write`'s `HDR_ERROR` arm emits the message, then each irritant preceded
by a space. With no irritants it emits the message and nothing else — the same bytes
`fprintf(stderr, "%s\n", rt_trap_msg)` produces today.

So the empty irritant list is not incidental; it is what holds the wording fixed. A trap that put its
operands in irritants instead of in the message would change every affected expectation.

### D8 — `delete-file` and `file-exists?` ship together, and the error kind is why they belong here

The sixth #85 row needs `delete-file`, which Emit does not have. That makes one of the nine rows a
**surface addition** rather than a repair, and it is worth being explicit that this widens the change
rather than pretending the row was always about the error object.

They ship as a pair. R7RS puts both in `(scheme file)`, `delete-file`'s only interesting failure is
the one `file-exists?` answers, and a change that adds the first while leaving the second missing
invites the follow-up issue immediately. The runtime work is small and has precedent in the same
file: the existing file ports are `fopen` with a port record in front, so these are `remove` and an
access check with nothing in front.

What ties them to *this* change rather than to a general `(scheme file)` completion is the kind:
`delete-file` on a missing path must raise something `file-error?` answers `#t` for, which does not
exist until D1 lands. Implementing it earlier would mean raising a plain error and revisiting the
site — the same double-visit this change exists to avoid.

*Not included*: `open-binary-input-file` / `open-binary-output-file`, the rest of `(scheme file)`'s
R7RS surface. No row needs them, they need a binary-port representation Emit does not have, and that
is a different change.

## Risks / Trade-offs

**A handler now runs where the process used to end** → That is the point, but it means user code runs
in states it never saw before, at every `CHECK_TAG` site. The compensating property is that the state
is an ordinary Scheme state: the trap fires *before* the primitive dereferences anything (that is
what `checked-primitive-arguments` established), so nothing is half-mutated.

**The flag-clearing bug is invisible until the second trap** → D4 names the exact failure and the
tests that catch it. Both cases (two traps in sequence; a trap inside a handler) belong in the suite
before the mechanism is believed.

**Emitted IR moves and the demo baseline drifts** → Expected: the prelude is baked. Classify the
drift with the before/after capture method rather than re-recording the hashes, as
`r7rs-lexical-conformance` did — the program modules should move this time (the prelude gains
definitions and two exports), so the interesting check is that the delta is *only* what the new names
account for.

**The REPL's survival path changes shape** → `rt_trap` is what lets `emit repl` survive a bad form.
Traps now reach it only when unhandled, which is the same set of cases as today from the REPL's
point of view, but the route is longer. `test/repl-interactive-tests.sh` is the regression check, and
a REPL session that traps, recovers, and traps again is worth adding to it.

**The raiser cell is global, and a host has TWO prelude instances** → `build/emit` links its own
baked `(scheme base)`, and a REPL session (or `emit run`) JITs a second copy for the code it
compiles. Each `__init` arms the raiser, so the later one wins and the compiler's own traps would be
raised into the *session's* handler chain rather than the compiler's. This is a real wrinkle and it
costs nothing observable: the session's chain is empty while the compiler is running (compile and
run are separate host calls), so such a trap falls through to `rt_raise` and the host's frame —
exactly where it went before. The ordering also happens to be favourable: the program's
`(scheme base)` initializes *after* compilation finishes. Worth knowing before someone relies on a
compiler-internal trap reaching a compiler-side `guard`; the honest fix is a per-instance raiser,
which nothing needs yet.

**Scope creep toward a general condition system** → Resisted by D1's privacy and the Non-Goals:
four kinds, no public accessor, no resumable handlers. The next thing anyone will want is a
condition hierarchy; this change deliberately does not start one.

## Open Questions

None blocking. One worth revisiting after the mechanism lands: whether `rt_arity_error` should join
the catchable set (D2 says it is excluded by scope, not by principle). It is a self-contained
follow-up once the raiser exists.
