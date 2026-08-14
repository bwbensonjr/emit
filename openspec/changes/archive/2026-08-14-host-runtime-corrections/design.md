## Context

`src/runtime/runtime.c` is the host C runtime — 2423 lines, outside `CORE_FLAT`, reaching the
binaries through plain `make`. Five open defects live there. Four concern **what the runtime reports**
and one **what it computes**, and batching them is a build-cost decision as much as a thematic one:
this change pays no `make regen` barrier, so its edit/test loop is seconds rather than the ~22 minutes
a `CORE_FLAT` change costs per iteration.

Facts established by reading and measuring at `32d9c79`, several of which change the shape of the
work:

1. **There is one datum printer, not several.** `print_val(FILE *out, val v, int display)` serves
   `rt_display`, `rt_write_val`, `rt_stderr_write`, `rt_port_display` and `rt_port_write`. A string
   port is an `open_memstream` `FILE *`, so "write to a string port" is the same printer with a
   different stream. All three of #90's exclusion rows, and #94, are one function.
2. **There is a second, deliberately different formatter.** `err_write` (`:1895`) renders irritants
   into the static `rt_trap_msg` with no allocation, because it runs on the trap path where the heap
   is suspect. #90 predicted the split; it is real.
3. **Both formatters hang, for different reasons.** `print_val` walks `cdr` until a non-pair, so a
   cycle loops while emitting. `err_write` loops *without* emitting: `err_put` stops copying at
   capacity (`*off + 1 < cap`) but the pair loop keeps walking. Measured:
   `(error "boom" <cyclic>)` produces **zero bytes** and never returns.
4. **`rt_arity_error` (`:681`) duplicates the format-print-abort body** rather than calling
   `rt_fatal`/`rt_fatalf` (`:403`/`:414`), which is exactly why it did not become catchable for free
   when `catchable-errors-with-kinds` routed the other ~44 sites through `rt_trap_deliver` (`:2122`).
5. **#97 is not latent.** The issue says it has no user-visible symptom. It does: a form that makes
   the *compiler* trap kills an interactive session. `(define-values (x y . z) (values 1 2 3))` at the
   REPL prints `car: not a pair: got a symbol` to stderr with no `!trap:` line and **exits 1**, where
   a user-code trap prints `!trap:`, survives, and runs the next form. So the acceptance test for
   #97 is behavioural, not an argument about instances.
6. **`max`/`min` are already right** (`(max 1 2.0)` → `2.0`, matching Chez), so #77 is confined to
   the comparison predicates.

## Goals / Non-Goals

**Goals:**

- No datum, cyclic or not, can make either formatter fail to terminate (#90).
- `write` emits no raw control byte, and its character rendering reads back (#94).
- An arity mismatch is delivered to a handler like every other condition about data (#96), with the
  spec edited to match rather than quietly contradicted.
- A trap raised inside the compiler is reported without ending the host's session (#97).
- `=` and `<` are decided on mathematical values across the exactness boundary (#77).
- **No `make regen`.** If a fix appears to need a `CORE_FLAT` edit, it leaves this change.

**Non-Goals:**

- **`list?` on a cycle (#108)** and **the reader's `#0=`/`#0#` (#75)** — both in `src/prelude.scm`,
  both pay the barrier this change exists to avoid. #75 is the round-trip partner this change makes
  possible, and should follow it.
- **`write-shared` / `write-simple`** — absent (#33). This change labels cycles only, which is what
  R7RS asks of `write`; labelling *all* shared structure is `write-shared`'s job and a different
  requirement.
- **Editing `emit-arity-check` (`src/emit.ss`)** — read to confirm that its `unreachable` after a
  now-longjmping call is sound, not changed. Changing it would import a regen barrier.
- **Fixing the frontend's unguarded accessors (#91)** — that is what makes `define-values` a probe for
  #97, and it is in-language. Independent fix, independent change.

## Decisions

### D1 — Labels in `print_val`, a bound in `err_write`

Two formatters, two answers, because they have different obligations.

`print_val` gets **datum labels** (`#0=`/`#0#`): R7RS 6.13.3 asks for them, they terminate, and they
read back — which matters because #75 will teach the reader the same notation. `err_write` gets a
**bound**: it only has to not hang, it must not allocate, and its output is already a truncated
compact diagnostic by design. Giving the trap path labels would mean a visited set on the path where
the heap is least trustworthy, for no benefit — nobody reads a trap message back.

Rejected: a bound for both, which #90 offers as the cheap interim. It leaves `write` non-conformant
and non-round-trippable, and the reader work that would expose that gap is next in line.

### D2 — Two-pass labelling, with the visited set stack-allocated until it is worth heap-allocating

R7RS's own shape: walk the datum recording which pairs/vectors are reachable more than once, assign
labels, then print. Two costs to control, since `print_val` is on the REPL's echo path:

- **Allocation.** ~~The visited set starts as a fixed-size array of pointers in the C frame (32
  entries covers ordinary REPL data) and spills to a `GC_MALLOC`ed table only when the structure
  exceeds it.~~ **Amended during implementation.** A 32-entry array scanned linearly is O(n²) for an
  n-node datum — printing a 10,000-element list would have gone quadratic, a real regression on the
  commonest path there is. What shipped is an **open-addressed hash table, 128 slots in `.bss`**,
  doubling into `GC_MALLOC`ed storage only when a datum needs more and **reused across prints** with a
  generation counter in place of a clear. That keeps the property the array was chosen for (ordinary
  data allocates nothing), keeps lookups O(1), and adds one the array lacked: a print abandoned by a
  longjmp leaves nothing to clean up, since `pl_gen++` invalidates every entry at once.
- **The extra walk.** Pass 1 is skipped entirely unless the datum is a pair or a vector — an atom,
  string, number, or character is printed as it is today. For compound data the walk is the same order
  as printing, so the constant factor roughly doubles for large acyclic structures. That is the price
  of terminating, and it is paid only where a cycle is possible.

Rejected: **optimistic printing with a restart** (print until a budget trips, then redo with labels).
It cannot un-emit what it already wrote to `stdout`, so it would need to buffer every print, which
changes streaming behaviour for large output. Rejected: **Floyd's tortoise-and-hare**, which finds a
cycle in a `cdr` chain with no allocation but cannot label, cannot see a cycle through a vector
element, and cannot produce readable output.

### D3 — An arity mismatch is a condition about data, and the spec says so

`rt_arity_error`'s body becomes `snprintf` into `rt_trap_msg` followed by `rt_trap_deliver()` — what
`rt_fatal` already does. The wording does not move because it is the same `snprintf`.

The spec question is the real content. `core-language`'s catchable-condition requirement lists an
arity mismatch among violations that "SHALL remain fatal", and gives the criterion: *a condition about
data leaves the runtime's machinery intact and a handler can meaningfully run, whereas these report
that the machinery itself is unsound*. An arity mismatch reports that a **caller** passed the wrong
number of arguments. The heap is intact, the frame stacks are consistent, the handler runs on
structures whose invariants all hold. By the requirement's own criterion it belongs on the catchable
side; it was on the fatal side by the boundary of the change that introduced the mechanism, which that
change recorded as design D2 and flagged for revisiting. So the list loses one entry, and the
`Variadic procedures` requirement's "reports an error and aborts" becomes delivery-when-handled.

`emit-arity-check` (`src/emit.ss`) emits a check whose failure block ends in `unreachable`. That block
now ends in a call that may longjmp instead of returning, which is what every other trap path already
does — so this is a confirmation step, not an edit.

### D4 — The raiser rides the `rt_trap` bracket that already exists

`src/emit.cpp` brackets every `scheme_entry` call with `jmp_buf *saved = rt_trap; rt_trap = &jb; …
rt_trap = saved;` (`:553`, and the run/REPL paths at `:1555`/`:1601`). The raiser cell gets the same
treatment: saved and restored around each entry, so the instance whose code is executing is the
instance whose handler chain a trap reaches. This is the issue's own option 1, and it is preferred over
keying the cell by instance token (option 2) because it reuses a bracket that is already correct and
already reviewed for this exact "two contexts, one global" problem.

Fact 5 says the observable bug is a killed session, which the raiser cell alone may not explain — the
exit status suggests the compile-time landing site is either unbracketed or lands on a returned frame.
So the work is: reproduce, determine which of the two is responsible, fix both if both are, and let
the behavioural test (session survives, next form runs) be the acceptance criterion. `design D4` of
`catchable-errors-with-kinds` warns that `rt_trap_in_flight` is cleared at the longjmp landing sites
and must not be "fixed" alongside; that warning is honoured — the flag is not touched.

### D5 — Compare exactly by splitting the flonum, not by widening the fixnum

In the mixed exact/inexact arm of `rt_num_eq` (`:604`) and `rt_lt` (`:609`): if the flonum is NaN the
answer is false for both; if it is infinite the sign decides; otherwise compare the fixnum against
`floor` and `ceiling` of the flonum, using the fractional part to break the tie. Everything stays in
the two-type tower and no bignum is involved — the failing values are inside the fixnum range, which is
what distinguishes this from #27.

`>`, `<=`, `>=` derive over `<` (#26), so they inherit the fix; a test asserts that rather than
assuming it. `max`/`min` are verified correct and untouched.

### D6 — The character table cannot be shared, so a test holds the two halves together

The reader's names live in `rd-char-name` (`src/prelude.scm`, in-language); the printer is C. They
cannot be one table without moving one side across the language boundary, which would import a regen
barrier. So the printer gets its own table, and a **round-trip test** — write every named character
and read the output back — is what prevents the two from drifting. The same argument applies to datum
labels: `write`'s labels are C and the reader's will be Scheme, so a round-trip test is the only thing
that will keep the notations in agreement once #75 lands.

Where the reader accepts aliases, `write` emits the R7RS spelling (`escape`, not `altmode`/`esc`), so
output stays portable.

## Risks / Trade-offs

- **`write` output changes, and expectations move with it.** → That is the blast radius #94 asked a
  change to own. It is confined to written control characters and to cyclic data (previously a hang,
  so nothing can be depending on it). Pre-0.1.0, so it is cheap now and breaking later.
- **`print_val` gains a walk on the REPL echo path.** → Skipped for non-compound data, stack-allocated
  below 32 nodes. If it shows up, the fallback is to gate pass 1 behind a cheap depth probe rather
  than to abandon labels.
- **Making arity catchable is a semantic loosening a program could depend on.** → Only a program
  relying on an abort it cannot catch, which is not a shape anyone writes deliberately; the uncaught
  text and exit status are unchanged, and a scenario pins that.
- **The #97 fix touches host lifecycle, not a leaf function.** → It rides an existing bracket rather
  than inventing one, and the acceptance test is behavioural (session survives). The in-flight flag is
  explicitly out of scope, per the warning on the issue.
- **Five issues in one change is a wide review.** → They share one file and one build path, and the
  proposal states plainly that #77 shares only those and not the theme. The alternative — five changes
  — costs five verification cycles for work that touches one translation unit.
- **No regen means `test/trust-check.sh` cannot regress**, since a host-only change cannot alter
  regenerated IR. Both full suites still run.

## Migration Plan

No user migration. `make` rebuilds the binaries from committed IR; no bootstrap change, so no
mixed-source hazard and no fixed point to converge. Rollback is a revert plus `make`.

## Open Questions

- ~~**Does the session death (fact 5) have one cause or two?**~~ **Two, and they are independent
  (answered by task 4.1).** (1) `process_form` called `scheme_entry()` — the compile — with **no trap
  bracket at all**, and `run_thunk` clears `rt_trap` when it finishes isolating the previous form's
  *run*. So a compiler-internal trap found `rt_trap == nullptr` and reached `rt_raise`'s `exit(1)`.
  (2) Separately, the raiser cell was the session's, so `compile-one-form`'s `guard` could not see the
  trap either. Both are fixed, and the order matters for what the user sees: with only the bracket the
  host reports `error: compiler trap: ...`; with the raiser swap as well, the trap reaches the
  compiler's own guard and reports through the ordinary compile-error channel — which also means the
  guard's **session snapshot restore** runs (repl-core design D3), so a form that fails mid-compile no
  longer leaves partial mutations behind. That restore, not the message, is what made the raiser half
  worth doing.
- **Should `display` label a cycle, or truncate it?** The spec delta says label, for one printer and
  one notation. The argument for truncating is that `display` is for humans and `#0=` is noise; the
  argument against is that a second rendering mode in the same function is where bugs live. Revisit
  only if the labelled `display` output proves unreadable in practice.
- **Is `#\xHH` right for an unnamed non-graphic character, or should `write` refuse?** Hex is chosen
  because the reader already accepts it (`r7rs-lexical-conformance`), making it the only spelling that
  round-trips an arbitrary control character.
