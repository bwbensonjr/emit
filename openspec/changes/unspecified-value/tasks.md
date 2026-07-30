> **Implementation notes** (deviations from the plan, discovered while applying it):
>
> - **2.1 changed approach.** The plan had `encode-const` emit the constant, which would put a *host*
>   object in the IR as a `(const …)` payload. That breaks dump parity — `src/dump.ss` prints datums
>   through the runtime printer, so the same IR renders `#<void>` under Chez and `#<unspecified>` under
>   a self-hosted Emit, and `test/dump-parity-tests.sh` compares exactly those. The parser instead
>   synthesizes the reserved zero-arg primcall `(primcall %unspec)` (host-independent, prints the same
>   under both), and `emit-primcall` lowers it to the bare immediate `17` with no emission. `%unspec`
>   is kept out of `*prims*` so source cannot call it.
> - **Three sites the inventory missed.** `when`, `unless`, and no-match `cond` are prelude
>   `syntax-rules` macros that hardcoded `#f`, so they still returned `#f` after the parser and runtime
>   were converged. Fixed in `src/prelude.scm`, which forced regenerating `lib/scheme/base.sld` via
>   `tools/gen-scheme-base.ss` (generated from the prelude, staleness-guarded).
> - **Editing `src/prelude.scm` at all requires a regen** — even a comment. The prelude source is
>   embedded verbatim as a string constant in `bootstrap/embed.ll`, so a comment-only edit changes the
>   committed IR and leaves `test/self-host-fixpoint.sh` failing with diff lines in that one constant.
> - **5.3 resolved:** the AOT/batch final-value print is NOT suppressed (only the REPL echo is), so
>   `emit run` matches what the AOT executable prints. Recorded in a comment at both sites.
> - **A fourth site, found after the fact: top-level `define`.** It never appeared in the inventory
>   because `define` is a definition, not an expression, so R7RS gives it no value — but its lowering
>   `(global-set! sym init)` returned the stored value, so `(define f (lambda …))` echoed
>   `#<procedure>`, and it disagreed with a local `(set! x v)` which already yielded the unspecified
>   value via `rt_set_box`. `global-set!` now yields the unspecified value. ~16 REPL test expectations
>   dropped a leading define echo; the two heap-survival tests gained an explicit bare-name form so
>   they keep the evidence the echo used to provide.
> - **Baseline re-record:** `test/module-scaffold-baseline.sha256` was re-recorded twice, each
>   justified by a full before/after IR capture; both verifications are logged in
>   `module-scaffold-baseline.sh`.

## 1. Runtime representation (inert on its own)

- [x] 1.1 In `src/runtime/runtime.c`, add `#define SUB_UNSPEC 2` next to `SUB_BOOL`/`SUB_CHAR`, and
      `#define UNSPEC_V ((val)((SUB_UNSPEC << 3) | TAG_BOOL))` next to `FALSE_V`/`TRUE_V`
- [x] 1.2 Add `#define is_unspec(v) (tag_of(v) == TAG_BOOL && imm_subtype(v) == SUB_UNSPEC)` next to
      `is_bool`/`is_char`
- [x] 1.3 Update the value-representation comment block at the top of `src/runtime/runtime.c` (the
      `tag 001 misc-imm` lines): move `unspecified` out of the "subtypes 2,3,… reserved" note and
      document subtype 2 as taken
- [x] 1.4 Add the `is_unspec` case to `print_val` (`src/runtime/runtime.c:1132`) so it emits
      `#<unspecified>` in both `display` and `write` modes — one case covers `rt_display`,
      `rt_write_val`, and `rt_write`
- [x] 1.5 Rebuild and confirm nothing changed yet: no form produces `UNSPEC_V`, so `./run-all-tests.sh`
      passes exactly as before

## 2. Emitter constant (inert on its own)

- [x] 2.1 In `src/emit.ss`, add the unspecified-value case to the constant encoder alongside the
      existing `#t` → `"257"` and `#f` → `"1"` cases (`src/emit.ss:118`), emitting `"17"`
- [x] 2.2 Add a comment at that site naming the shared-representation contract with
      `src/runtime/runtime.c`, matching the style of the neighbouring boolean/char comments
- [x] 2.3 Verify the emitter and runtime constants agree — `UNSPEC_V` in C and the emitted literal must
      be the same word. Do this by inspection now; task 6.1 makes it a test

## 3. Converge the C side onto `UNSPEC_V`

- [x] 3.1 Change the side-effect returns in `src/runtime/runtime.c` from `NIL_V` to `UNSPEC_V`:
      `rt_set_box`, the string-mutation return at ~line 576, `rt_repl_state_set`, `rt_display`,
      `rt_write_val`, `rt_newline`, `rt_write_char`, `rt_vector_set`, `rt_bytevector_u8_set`,
      `rt_record_set`
- [x] 3.2 Leave the ~14 `return NIL_V` placeholders that follow `rt_fatal(...)` untouched (arithmetic
      and conversion entry points, plus line 1087) — `rt_fatal` does not return, so those values are
      dead and changing them would misrepresent dead code as meaningful
- [x] 3.3 Re-grep `return NIL_V` and confirm every remaining site is either a genuine empty-list return
      or a post-`rt_fatal` placeholder
- [x] 3.4 Rebuild and run `./run-all-tests.sh`; expect failures only in golden output that records `()`
      after a side-effecting form, and fix those expectations

## 4. Converge the Scheme side, then re-bootstrap

- [x] 4.1 In `src/parse.ss:273`, stop desugaring two-armed `(if test then)` to `(const #f)` — emit the
      unspecified-value constant instead. Update the comment, which currently explains the `#f` choice
- [x] 4.2 In `src/prelude.scm:222`, keep `(define (void) (if #f #f))` if the parser change makes it
      yield the new value; otherwise point it at the new constant directly. Update the comment
- [x] 4.3 Confirm `%for-each1` / `%for-eachn` still return the unspecified value via their
      `(if #f #f)` base cases (`src/prelude.scm:177`) — no change expected, but verify rather than assume
- [x] 4.4 Grep `src/` for compiler code that relies on an unspecified result being false (e.g.
      `(if (when …) …)`, `(not (for-each …))`, a two-armed `if` in test position). The compiler is
      self-hosting, so such a site would silently change behavior
- [x] 4.5 Regenerate the committed bootstrap IR with `tools/regen.sh` and confirm the fixed-point loop
      converges
- [x] 4.6 Run `./run-dev-tests.sh` (needs `chez`) for backend equivalence, self-emission fixed point,
      and the anti-stale trust-check

## 5. REPL echo suppression

- [x] 5.1 In `run_thunk` (`src/emit.cpp:472`), guard both the `rt_write(r)` call and the trailing
      `printf("\n")` on the result not being the unspecified value, so nothing at all is printed for it
- [x] 5.2 Keep the guard out of `print_val` — `(write (if #f #f))` must still print `#<unspecified>`
- [x] 5.3 Decide the open question from `design.md`: whether the AOT runner's final-value print should
      also suppress. Record the decision in a comment either way
- [x] 5.4 Verify interactively: `(display "hi")` prints `hi` and nothing else; `(vector-set! v 0 1)`
      prints nothing; `(null? 1)` still prints `#f`; `(list)` still prints `()`

## 6. Tests

- [x] 6.1 Add a test asserting emitter/runtime agreement and value identity:
      `(eqv? (if #f #f) (void))` is `#t`, and `(list (eqv? (void) #f) (eqv? (void) (quote ())))` is
      `(#f #f)`
- [x] 6.2 Add a test that the unspecified value is truthy: `(if (if #f #f) 'a 'b)` yields `a`
- [x] 6.3 Add a test that every unspecified-result site agrees — the syntactic forms, the prelude, and
      the side-effecting primitives all return one `eqv?` value (covers the `#f`/`()` split this change
      removes)
- [x] 6.4 Add a test that `write` and `display` both render it as `#<unspecified>`
- [x] 6.5 Add a REPL test that side-effecting forms echo nothing while legitimate `#f` and `()` results
      still print (extend `test/repl-interactive-tests.sh`)
- [x] 6.6 Confirm AOT/JIT parity: the same program yields the same observable result through
      `emit run` and through the JIT
- [x] 6.7 Confirm no `unspecified?` or `void?` binding leaked into the primitive layer or prelude

## 7. Documentation

- [x] 7.1 Update `docs/return-values.md`: record that the recommendation was adopted, and replace the
      "Where Emit stands today" table's observed values with the new behavior
- [x] 7.2 Add the Chez-style caveat to user-facing docs — this is what Emit happens to return, it is not
      a promise, and portable programs must not rely on it
- [x] 7.3 Check `docs/PRIMITIVES.md` for any enumeration of primitive return values that names `()` or
      `#f` as the unspecified result
- [x] 7.4 Run `./tools/complexity.sh` if the catalogue tracks the changed files, per the
      `complexity-catalogue` spec
