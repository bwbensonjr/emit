## 1. The error object gains a kind (runtime, no regen)

The C half validates on its own with plain `make`, before the barrier closes.

- [x] 1.1 Widen `rt_make_error_object` (`src/runtime/runtime.c:1971`) to four words,
      `{HDR_ERROR, message, irritants, kind}` — the kind **appended**, so that `err_write`'s
      `HDR_ERROR` arm (`:1884`) and the value printer's arm, which read words 1 and 2 **by index**,
      stay correct without being touched (design D1).
- [x] 1.2 Keep the existing 2-argument entry point working (default kind), or update its callers in
      the same commit — `rt_error` (`:2029`) is one of them.
- [x] 1.3 Add `rt_error_object_kind` with the same `CHECK_TAG` guard the other two accessors have.
- [x] 1.4 Intern the four kind symbols (`error`, `read`, `file`, `runtime`) once via `rt_intern` and
      cache them, so no trap pays for interning after the first. `intern_table` is already an
      uncollectable scanned array (`:674`).
- [x] 1.5 Grep for every other direct index read of an error object before believing 1.1 — the two
      known ones are `err_write` and the printer, and a missed one renders garbage on the error path.

## 2. Traps become catchable (runtime, no regen)

- [x] 2.1 Add the raiser cell: one `GC_MALLOC_UNCOLLECTABLE(sizeof(val))` scanned root holding the
      installed closure, following `rt_repl_cell` (`:1141`) — same file, same pattern.
- [x] 2.2 Add the in-flight flag and clear it **where the longjmp lands**, not after the call:
      `rt_run_guarded`'s caught branch and the host's `rt_trap` frame (design D4). Getting this wrong
      makes the *second* trap fatal, which is what task 5.3 tests.
- [x] 2.3 Route `rt_fatal` (`:377`) and `rt_fatalf` (`:389`) through the raiser: build an error object
      from the message they already format, with kind `runtime` and **`'()` irritants** — the empty
      irritant list is what holds uncaught output byte-identical (design D7) — and invoke the closure
      through the emitter's 1-arg trampoline. Fall back to today's print-and-abort when no raiser is
      installed or the flag is set.
- [x] 2.4 Do **not** edit the ~44 trap sites. They funnel through these two functions; that is what
      keeps every diagnostic's wording identical.
- [x] 2.5 Leave `rt_arity_error` (`:657`) fatal — it duplicates the body rather than calling either
      function, so it does not move by accident (design D2). Same for the guard-depth trap in
      `rt_run_guarded`.

## 3. `delete-file` and `file-exists?` (runtime + prelude)

- [x] 3.1 Runtime primitives over `remove()` and an existence check, shaped like the existing
      `fopen`-based file entry points (`:1062`, `:1380`) but with no port record in front.
- [x] 3.2 Prelude wrappers: `file-exists?` answers `#t`/`#f` and never raises; `delete-file` raises a
      **file**-kind error on failure (design D8).

## 4. Kinds at the raise sites, and the two predicates (prelude)

- [x] 4.1 `%error-object-kind` and the raiser-installation primitive join `*prims*` (`src/parse.ss`)
      and the primcall table (`src/emit.ss`).
- [x] 4.2 `error` raises the plain kind; the message and irritants are unchanged.
- [x] 4.3 The reader's `rd-report` path raises the **read** kind. It is the one place the reader
      raises, so this is a single site.
- [x] 4.4 `open-input-file` / `open-output-file` and the other file entry points raise the **file**
      kind.
- [x] 4.5 Define `read-error?` and `file-error?` over `%error-object-kind`; export them from
      `(scheme base)`, and `delete-file` / `file-exists?` from `(scheme file)`.
- [x] 4.6 Install the trap raiser once at prelude startup, at a point where `raise` and `*handlers*`
      are already defined. Until it runs, traps take the fallback path — which is correct, not
      degraded.
- [x] 4.7 Home every new name in `src/prelude-surface.scm` (both the private list and
      `*substrate-rehomed*` where it belongs), or `test/scheme-base-surface-check.sh` fails.
- [x] 4.8 Regenerate `lib/scheme/base.sld`, `lib/scheme/file.sld`, `lib/emit/internal.sld` with
      `tools/gen-scheme-base.ss`.

## 5. Tests, written before the barrier

- [x] 5.1 Catching each trap family: wrong type, out-of-range index, overflow, division by zero, and
      `(apply + '(2 3 . 4))`.
- [x] 5.2 The caught object: `error-object?` true, message equals the uncaught diagnostic, irritants
      empty, `read-error?`/`file-error?` both false.
- [x] 5.3 **Two traps in sequence**, both caught — the flag-clearing regression (design D4).
- [x] 5.4 **A trap raised inside a handler** reports and aborts rather than recursing.
- [x] 5.5 Uncaught diagnostics are byte-identical: compare the stderr text of a representative trap
      against the pre-change wording for every family in 5.1.
- [x] 5.6 The kind predicates over all four sources: `error`, a malformed `read`, an unopenable file,
      a caught trap; plus a non-error object raised with `raise`.
- [x] 5.7 `delete-file` / `file-exists?` behaviour, including the file-error on a missing path.
- [x] 5.8 A REPL session that traps, recovers, and traps again — the `rt_trap` route is longer now
      (`test/repl-interactive-tests.sh`).
- [x] 5.9 Iterate on 3–5 without regen via `chez --libdirs src --script src/compile.ss`. Finish every
      compiler-source edit here.

## 6. The regen barrier

- [x] 6.1 `make regen`, run to convergence. The prelude is baked, so the compiler that regenerates is
      not the compiler being generated; do not kill it mid-flight.
- [x] 6.2 Make no further compiler-source edit until the suites have finished.

## 7. Retire the exclusions and verify

- [x] 7.1 Removed the 9 rows tagged `issue-85` (6) and `issue-89` (3) — and then 3 more the
      staleness half found, exactly as 7.2 warned: two `unimplemented` `file-exists?` rows and
      `write-char` to a closed port, an `rt_fatal` trap this change makes catchable. 12 total.
- [x] 7.2 `test/r7rs-suite-tests.sh` — checks in both directions, so this is the definition of done.
      Watch for rows tagged `unimplemented` that this change also fixes: the stale-exclusion half
      found two such rows last time that a tag-based sweep could not see.
- [x] 7.3 `./run-all-tests.sh`.
- [x] 7.4 `./run-dev-tests.sh`, individually — the suites are independent and the batch outlives the
      command timeout.
- [x] 7.5 `test/module-scaffold-baseline.sh` will drift. **Classify before re-recording**, with the
      before/after capture method its header documents (detached worktree at the pre-change commit,
      `make emit` from committed IR, split at `; ==EMIT-UNIT-BOUNDARY==`). Unlike
      `r7rs-lexical-conformance`, the program modules are *expected* to move here — the prelude gains
      exports, so every program's header gains declare lines. The check is that the delta is **only**
      what the new names account for.

## 8. Record and close

- [x] 8.1 Update the exceptions and `(scheme file)` paragraphs in `docs/PROJECTS.md`.
- [x] 8.2 Note the user-visible change for the first tag's release notes: a runtime trap is now a
      condition a `guard` can catch, where it previously ended the program.
- [x] 8.3 Committed as ff6113a on `feat/catchable-errors-with-kinds`; `test/trust-check.sh`
      then passed — the committed IR is exactly what the current source regenerates.
- [x] 8.4 The commit carries `Fixes #85` / `Fixes #89`, so both close when the branch merges.
      Two follow-ups worth filing, neither blocking: the raiser cell is global while a host
      has TWO prelude instances (design Risks — costs nothing observable today), and
      `rt_arity_error` is excluded from the catchable set by scope rather than by principle
      (design D2, and the Open Question the mechanism now unblocks).
