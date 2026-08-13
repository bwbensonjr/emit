## Why

Two defects meet at the error object, and neither can be fixed without touching it.

**A runtime-detected error is uncatchable (#89).** `error` raises something a `guard` sees; a wrong
type, an out-of-range index, a division by zero, a fixnum overflow, or a bad `apply` argument prints
its diagnostic and terminates:

```scheme
(guard (e (#t "caught")) (error "boom"))          ; caught
(guard (e (#t "caught")) (apply + '(2 3 . 4)))    ; NOT caught -- exit 1
(guard (e (#t "caught")) (vector-ref (vector 1) 9)); NOT caught -- exit 1
```

R7RS 6.11 draws no such line: the conditions signalled by the standard procedures are *raised*, and
`guard` is how a program responds. Today a program cannot defend itself against a bad argument it did
not anticipate, and at the REPL one mistyped argument ends the session rather than the form.

**The error object carries no kind (#85).** `read-error?` and `file-error?` must each be true only
for an object raised by its own source, and there is nothing on the object to discriminate on — so
unlike the rest of the missing `(scheme base)` surface, they cannot be added as prelude definitions
over what exists.

They are one change because they are one field. #89's issue says so outright — *"Pairs with #85,
which needs a kind field on the same error object"* — and the alternative is visiting every raise
site twice: once to make it raise at all, once to say what kind it raises. The nine forms they
retire (`test/r7rs/exclusions.tsv`: six `issue-85`, three `issue-89`) are verified by the one command
that already gates in both directions, and the prelude and runtime edits ride a single `make regen`.

## What Changes

### The error object gains a kind (#85, 6 rows)

- `rt_make_error_object` widens to carry a **kind** alongside message and irritants, with a
  `%error-object-kind` primitive over it.
- The raise sites say what they are: the reader's `rd-report` path raises **`read`**, the file
  operations in `(scheme file)` and the file-opening ports raise **`file`**, and `error` raises the
  plain kind. Every existing message text is unchanged.
- `read-error?` and `file-error?` are defined over the new primitive and exported from
  `(scheme base)`.

Five of the six suite forms this clears already raise catchably today — `(open-input-file
"nonexistent")` and a malformed `read` go through `error`. What they lack is only the kind, which is
why most of this half is a representation change and not a rescue.

### `delete-file` and `file-exists?` (the sixth #85 row)

The sixth form is `(file-error? (guard (exn (else exn)) (delete-file " no such file")))`, and
**`delete-file` does not exist** — `(scheme file)` exports six names and neither of these is among
them. So that row needs a procedure, not a kind:

- `delete-file` removes a file and **raises a file error** when it cannot, which is exactly the
  behaviour the row tests.
- `file-exists?` comes with it. They are an R7RS pair whose only interesting case is the same one
  (`delete-file`'s failure is "no such file"), both are `(scheme file)` names Emit is missing anyway,
  and shipping one without the other leaves the obvious companion to come back as its own issue.

This is a genuine surface addition rather than a repair, and it is called out here rather than folded
into #85's description because it widens the change: it brings its own spec requirement and its own
`(scheme file)` export.

### Runtime traps become catchable conditions (#89, 3 rows)

- `rt_fatal` / `rt_fatalf` build an error object from the message they already format and hand it to
  a **Scheme raiser** installed once at startup, falling back to today's print-and-abort when none is
  installed (during prelude startup, and for the standalone entry before the prelude runs).
- The ~44 trap sites are **not** edited: `CHECK_TAG` funnels through `rt_type_error`, the bounds and
  overflow diagnostics through their own reporters, and all of them through those two functions. The
  change is at the two chokepoints, so every existing diagnostic keeps its exact wording and becomes
  the error object's message.
- A trap raised this way is an ordinary condition: `error-object?` is true for it,
  `error-object-message` returns the diagnostic, and its kind distinguishes it from a user `error`.
- **Not every trap becomes catchable.** Arity errors and "escape/guard nesting too deep" are
  invariant violations rather than conditions a program should recover from; design D4 below draws
  the line and says why.

### What this is not

**This does not re-open `dynamic-extent` design D4.** That change settled the handler architecture —
one handler stack, `guard` is a handler that escapes, unwinding is performed in Scheme by the
escaping side — and explicitly rejected letting the runtime drive Scheme from inside its error path.
The distinction that makes this change compatible rather than contradictory is stated in design D3;
a reviewer who knows D4 should read that decision first.

## Capabilities

### New Capabilities

None. Both gaps are in capabilities that already exist.

### Modified Capabilities

- `core-language`: the error-object requirement gains a kind and the two source predicates; the three
  "is a diagnostic, never an unchecked access" requirements (overflow, indexed access, wrong-typed
  argument) gain the obligation that the diagnostic is a **catchable condition**, not only a report;
  and the `error` requirement stops saying a diagnostic aborts unconditionally.
- `dynamic-extent`: the handler-chain requirements gain the runtime-originated raise — a trap enters
  the same one handler stack, at the raise point, with the same unwinding obligations as any other
  raise.
- `io-ports`: the file-opening requirement states that a failure raises a **file error**, which is
  what makes `file-error?` answer for it, and gains `delete-file` / `file-exists?` as the file
  operations that are not port constructors.

## For the first tag's release notes

Three user-visible changes belong in the notes, because a program can tell:

- **A runtime-detected error is now a condition a `guard` can catch, where it previously ended the
  program.** A wrong-typed argument, an out-of-range index, a negative size, an exact-integer
  overflow, a division by zero, and `apply` with an improper last argument all raise into the same
  handler chain as `raise`. The caught object is an ordinary error object whose message is the
  diagnostic, with no irritants. **Uncaught, nothing moves**: the text and the exit status are what
  they were. A program that previously relied on one of these aborting will now run its handler
  instead — which is the point, and the only direction the change can be noticed from.
- **`read-error?` and `file-error?` exist and answer for their own sources**, so a `guard` can tell
  a malformed `read` from an unopenable file from every other failure. `error` raises neither kind,
  and a caught runtime trap is an `error-object?` of neither. There is deliberately no public
  `error-object-kind`.
- **`(scheme file)` gains `file-exists?` and `delete-file`.** `file-exists?` never raises — a
  missing path is `#f`, not a failure — and `delete-file` raises a file error when it cannot remove
  the path.

## Impact

- `src/runtime/runtime.c` — `rt_make_error_object` and its accessors (widened), `rt_fatal` /
  `rt_fatalf` (route to the raiser), a re-entry guard, and the installed-raiser cell. The two
  chokepoints are the whole of the trap change.
- `src/prelude.scm` — `error` and the `%error-*` wrappers, `read-error?` / `file-error?`, the
  `rd-report` raise path, the file operations, `delete-file` / `file-exists?`, and the one-time
  raiser installation.
- `src/prelude-surface.scm` — the new names need homes, or `test/scheme-base-surface-check.sh` fails.
- `src/parse.ss` / `src/emit.ss` — `%error-object-kind` and the raiser-installation primitive join
  `*prims*` and the primcall table.
- `lib/scheme/base.sld`, `lib/scheme/file.sld`, `lib/emit/internal.sld` — generated; regenerate with
  `tools/gen-scheme-base.ss`.
- **`make regen` is required** and emitted IR will move: the prelude is baked into `(scheme base)`.
- `test/r7rs/exclusions.tsv` — 9 rows removed.
- `test/module-scaffold-baseline.sha256` — will move; classify the drift before re-recording it, as
  `r7rs-lexical-conformance` did.
- Closes #85, #89.
