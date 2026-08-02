## Context

`docs/return-values.md` surveys why the Scheme standards leave certain return values unspecified and
what ~40 implementations do instead. Its recommendation is the subject of this change.

Emit's current state, observed by running `./build/emit repl` rather than by reading the source:

| Expression | Today | Source |
|---|---|---|
| `(if #f #f)`, `(void)`, `(when #f 1)`, no-match `cond`/`case`, `for-each` | `#f` | `src/parse.ss` desugars one-armed `if` to `(const #f)`; `src/prelude.scm` defines `(define (void) (if #f #f))` |
| `(display "")`, `(newline)`, `(write-char #\a)`, `(vector-set! …)` | `()` | the `rt_*` entry points `return NIL_V` |

So there are **two** conventions, split along the Scheme/C boundary, and neither value is distinct from
an ordinary datum. Both are R7RS-conforming in isolation — this is not a bug against the report — but
nothing in the source flags `NIL_V` as standing for "unspecified," which is how the two drifted apart
unnoticed.

Constraints that shape the design:

- **The value representation is shared verbatim** between `src/runtime/runtime.c` and the LLVM IR
  emitter in `src/emit.ss`. A mismatch is silent, not a compile error.
- **`runtime.c` already reserves the encoding**: tag `001` is documented as a misc-immediate *family*
  with a 5-bit subtype in bits 3–7, subtype 0 for booleans and 1 for characters, and the comment states
  "subtypes 2,3,… reserved (eof-object, unspecified, …)". This change spends the slot the design
  anticipated.
- **The compiler is self-hosting.** Changing `src/parse.ss` and `src/prelude.scm` requires a bootstrap
  seed regeneration (`tools/regen.sh`), and the prelude sources must stay inside the subset the current
  seed can compile.
- **Small, clean executables are a stated goal** (`CLAUDE.md`). An immediate costs no heap object and
  no header word, so binary-size impact is one constant plus one printer case.

## Goals / Non-Goals

**Goals:**

- One distinguished unspecified value, distinct from `#f`, `()`, and every other value, shared by the
  Scheme forms and the C primitives.
- Exactly one value at every unspecified-result site — never zero, never several.
- Printed as `#<unspecified>` by `write` and `display`; no reader syntax.
- Suppressed by the REPL echo, so side-effecting forms are quiet at the prompt.
- `(void)` retained as the generator; no predicate added.
- AOT/JIT parity, and a bootstrap that still regenerates cleanly.

**Non-Goals:**

- A Gauche-style branch-test diagnostic (`GAUCHE_CHECK_UNDEFINED_TEST`). This change only makes it
  *possible*; building it is separate work and may never be worth it.
- An `unspecified?` / `void?` predicate. Deliberately withheld — see Decision 4.
- A reader syntax. Deliberately withheld — see Decision 3.
- An `eof-object` immediate on subtype 3. The obvious follow-on, but out of scope here.
- The unspecified **evaluation-order** divergence between the JIT and AOT paths noted in
  `demos/records.scm`. A different category of "unspecified" (see the taxonomy in
  `docs/return-values.md`) needing its own change.
- Changing what `for-each` returns. It already normalizes to the unspecified value and should keep
  doing so.

## Decisions

### 1. Represent it as misc-immediate subtype 2, not a heap object or a reused value

`SUB_UNSPEC = 2` under `TAG_BOOL`, giving `UNSPEC_V = (2 << 3) | 1 = 17`, with an `is_unspec(v)`
accessor alongside the existing `is_bool` and `is_char`.

*Why:* the slot is already reserved and documented for exactly this. Zero heap cost, no new primary tag
(all 8 are spoken for), no header word, trivially GC-safe on both paths, and a one-instruction
constant on the emitter side.

*Alternatives considered.* **Keep `#f`** — free, but it is the one candidate that collides with a
legitimate constantly-tested result, so nothing can ever diagnose misuse and the REPL cannot suppress
it. **Keep `()`** — truthy, so it fails less silently than `#f`, but `(null? (display ""))` returning
`#t` is its own trap and it is equally unsuppressable. **A heap singleton under `TAG_EXT`** — costs a
header word and an allocation or a global, for no benefit over an immediate. **Return zero values via
`HDR_MV`** — R7RS §7.3 forbids it for unspecified results, and the survey found no implementation that
does it (R6RS granted the freedom; nobody took it).

### 2. Converge the C side onto `UNSPEC_V`, but only the side-effect returns

`grep 'return NIL_V' src/runtime/runtime.c` finds 24 sites, which split into two groups that must be
treated differently:

- **Side-effect returns (~10) — change these.** `rt_set_box`, `rt_string_set`-family (line ~576),
  `rt_repl_state_set`, `rt_display`, `rt_write_val`, `rt_newline`, `rt_write_char`, `rt_vector_set`,
  `rt_bytevector_u8_set`, `rt_record_set`. These use `NIL_V` as a stand-in for "unspecified."
- **Unreachable placeholders after `rt_fatal` (~14) — leave these alone.** The arithmetic and
  conversion entry points end with `rt_fatal(...); return NIL_V;` purely to keep a value-returning
  function well-typed. `rt_fatal` does not return, so the value is dead. Line 1087 says so explicitly
  ("unreachable; keeps the i64-returning call site well-typed").

*Why the distinction matters:* mechanically rewriting all 24 would be harmless at runtime but would
misrepresent dead code as meaningful, and would make the diff much harder to review. The task list
enumerates the ~10 deliberately.

### 3. No reader syntax

*Why:* following Chez, whose documentation states the void object "is not meant to be used as a datum,
and consequently does not have a reader syntax." The field genuinely splits here — roughly half the
surveyed implementations provide `#!void` / `#void` / `#!unspecific` — but giving the value a written
form invites exactly the dependence everyone says they want to prevent. Guile's `*unspecified*` drifting
into a legitimate filler argument (`(make-typed-array 'u32 *unspecified* 4)`) is the cautionary case.

Deciding this now is cheaper than retracting a syntax later.

### 4. Generator yes, predicate no

`(void)` stays; no `unspecified?` is added.

*Why:* this is the asymmetry the R7RS-WG1 record turns on (ballot #49, rejected 6:3). A generator lets a
program *declare* "this procedure has no interesting result"; a predicate lets it *depend on* someone
else's non-value. Gleckler: "Undefined should be undefined. Being able to test for it makes it defined."
Chez ships `void` with no `void?`, and that is the interface to copy.

*Alternative considered:* provide `unspecified?` for test suites. Rejected — Snell-Pym's ballot comment
describes exactly this anti-pattern ("unit tests that force me to check the return value of procedures
called only for side effect") and concludes the fix is a test macro that doesn't compare return values.

### 5. Write as `#<unspecified>`, in the shared printer

The single `print_val(FILE*, val, int display)` at `src/runtime/runtime.c:1132` backs `rt_display`,
`rt_write_val`, and `rt_write`, so one case there covers `write`, `display`, and the REPL echo path
consistently.

*Why `#<unspecified>` over `#<void>`:* more self-describing, and it matches Guile, Chicken, Mosh, and
Sagittarius. Both are non-readable `#<…>` forms, so neither can be read back.

### 6. Suppress the REPL echo in `run_thunk`, not in the printer

`run_thunk` (`src/emit.cpp:472`) currently calls `rt_write(r)` then prints a newline unconditionally.
Guard both on `r != UNSPEC_V`.

*Why there and not in `print_val`:* suppression is a REPL-display policy, not a property of the value.
`(write (if #f #f))` must still print `#<unspecified>` — a program that explicitly asks to print the
value gets it. Putting the guard in the printer would break that and would silently affect AOT programs
too.

This is the most immediately user-visible part of the change: today `(display "hi")` echoes `hi()` and
`(vector-set! v 0 1)` echoes `()`.

## Risks / Trade-offs

- **Emitter/runtime constant mismatch is silent** → change `runtime.c` and `src/emit.ss` in the same
  commit, and add a test asserting `(eqv? (if #f #f) (void))` and that the value prints as
  `#<unspecified>` under both the AOT and JIT paths. A mismatch makes that test fail rather than
  corrupting values quietly.
- **Bootstrap seed staleness** → `src/parse.ss` and `src/prelude.scm` both change, so the committed
  seed IR in `bootstrap/` must be regenerated with `tools/regen.sh` and the self-host cycle re-run.
  Risk: a seed regenerated against a half-applied change bakes in the old `#f` default. Mitigation:
  land the runtime + emitter constant first, verify, then the parser/prelude, then regen.
- **Two conforming behavior changes** → `(if (if #f #f) 'a 'b)` moves from `'b` to `'a`, and
  `(null? (display ""))` from `#t` to `#f`. `(if (vector-set! …) 'a 'b)` is *unchanged* (`()` and the
  new value are both truthy). No test in `test/` or `demos/` depends on any of these — verified by
  grep — but the compiler is self-hosting, so any *compiler* source relying on `(if #f #f)` being false
  would break. Mitigation: grep `src/` for tests of an unspecified result before landing, and rely on
  the self-host cycle as the backstop.
- **`#<unspecified>` echoes will disappear from expected test output** → any golden-output test that
  currently records `()` or `#f` after a side-effecting REPL form needs updating. Expected to be few;
  find them by running the suite.
- **Reserving subtype 2 for this forecloses nothing** → subtypes 3–31 remain, so the anticipated
  `eof-object` still has a slot.

## Migration Plan

No user-facing API changes and no data migration. Sequenced to keep the self-hosting cycle green at
each step:

1. Runtime: add `SUB_UNSPEC`, `UNSPEC_V`, `is_unspec`, and the `print_val` case. Nothing yields the
   value yet, so behavior is unchanged.
2. Emitter: mirror the constant in `src/emit.ss`. Still unchanged behavior.
3. Runtime: switch the ~10 side-effect `rt_*` returns from `NIL_V` to `UNSPEC_V`. `()` echoes become
   `#<unspecified>` echoes.
4. Parser and prelude: one-armed `if` desugars to the new immediate; `void` returns it. Regenerate the
   bootstrap seed and re-run the self-host cycle.
5. REPL: suppress the echo in `run_thunk`.
6. Tests, then documentation (`docs/return-values.md` records the decision; check
   `docs/PRIMITIVES.md`).

Rollback: revert in reverse order. Steps 1–2 are inert on their own, so a partial rollback to "constant
exists but nothing returns it" is safe.

## Open Questions

- **Should `(define x)` bind the unspecified value?** Emit's current handling is untested here, and the
  survey shows implementations split three ways (syntax error / unspecified value / distinct
  "unassigned" marker). Out of scope, but worth deciding once the value exists.
- **Does any golden test record a REPL echo of `()` or `#f`?** Resolve by running the suite at step 3
  rather than by guessing.
- **Should the AOT runner's final-value print also suppress?** `rt_write` is used both for the REPL echo
  and, per the `runtime.c` comment, for "the runner's final-value print." A program whose last value is
  unspecified would print `#<unspecified>` at exit. Leaving it visible is probably right — a batch run
  is not an interactive prompt — but it should be a deliberate call, not an accident of where the guard
  goes.
