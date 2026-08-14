## Why

Five open defects live entirely in `src/runtime/runtime.c`, the host C runtime. Four of them are
about **what the runtime reports** — the text it prints and where the report goes — and one is about
a comparison it computes wrongly. All five reproduce at `32d9c79`:

| # | symptom | measured |
|---|---|---|
| #90 | `write`/`display` of a circular structure never terminates | `(1 2 1 2 1 2 ...` until killed |
| #94 | `write` emits a raw control byte for a named character | `#\` + BEL / ESC / **NUL** |
| #96 | an arity mismatch aborts where every other data-shaped condition is caught | `guard` does not see it |
| #97 | the trap raiser is one global, but a host holds two prelude instances | latent, no symptom yet |
| #77 | `=` and `<` coerce an exact integer to `double` above 2^53 | `(#t #f #t)` where Chez says `(#f #t #f)` |

**Why these five together.** `src/runtime/runtime.c` is host C: it reaches the binaries through plain
`make`, not `make regen`. So this change has **no fixed-point barrier** — the edit/test loop is
seconds, where a `CORE_FLAT` change pays ~22 minutes per iteration. That is the practical reason to
batch them, and it is not the only one: `err_write`, the formatter #90 must fix, *is* the trap path's
formatter, and #96 routes arity errors through that same delivery path for the first time. The
printer and the trap mechanism are one subsystem, so reviewing them together is cheaper than
reviewing them twice. #77 shares only the file and the build path, and the proposal says so rather
than inventing a theme for it.

**Why now.** #90 is the sharpest correctness defect left in the open list: it was unreachable before
`set-cdr!` (`checked-primitive-arguments`), and a printer that hangs takes the harness with it — its
three exclusion rows are the **only** forms that time out in `test/r7rs-suite-tests.sh`'s
stale-exclusion sweep, 120s each, reported `UNVERIFIED` on every full run.

> **Corrected twice during implementation; the measured outcome is 3 timeouts → 2.**
>
> The claim above ("clears all three") was too optimistic: un-excluding both `write` rows hung the
> section-6.4 program, because the vendored suite's `test` macro compares with `equal?` and
> **`equal?` does not terminate on a cycle either** (R7RS 6.1 requires that it must).
>
> My first correction then over-swung the other way, re-excluding both. The staleness sweep caught
> that — the honest direction for it to fail — because the two forms differ: the **6.13 string-port
> form compares the output STRING**, so `equal?` never sees a cycle and it now **passes** (removed
> from the manifest); only the **6.4 form compares the cyclic datum itself**, so it stays, tagged
> **#108**, alongside the `list?` row.
>
> Net: two rows removed (the string-port cycle, and #77's comparison), two 120s timeouts remain, both
> now blocked on #108 — which this work extended from `list?` to `list?` *and* `equal?`, both in
> `src/prelude.scm` and so both paying the regen barrier this change avoids. The printer fix rests on
> `test/printer-cycles-tests.sh` (21 rows) rather than on an exclusion count. #94 is worse than
cosmetic in a way its own issue understates: writing `(integer->char 0)` emits an actual NUL byte,
which is enough to make `grep` treat a test log as binary and print nothing. And `write` output is
user-visible, so all of it is cheap before the 0.1.0 tag and breaking after.

## What Changes

- **`print_val` gains datum labels** (R7RS 6.13.3). One function serves `display`, `write`,
  `write` to a file port, and `write` to a string port (string ports are `open_memstream` `FILE*`s),
  so all three of #90's rows are one fix. A structure with a cycle SHALL print `#N=` at the first
  occurrence and `#N#` at every later one, and `display` gets the same treatment — R7RS only
  constrains `write`, but a `display` that hangs is no better.
- **`err_write` gets a bound instead of labels.** It formats into the static `rt_trap_msg` with no
  allocation, on a path that must survive a trap while the heap is suspect. A depth and length cap
  makes a cycle produce truncated output rather than a hang, which is all that path needs.
- **`write` names every R7RS character and hex-escapes the rest.** `alarm backspace delete escape
  newline null return space tab` by name, `#\xHH` for any other non-graphic codepoint, the literal
  character otherwise. `display` is unchanged — it writes the raw character, which `write-char` and
  the port tests depend on. **BREAKING** for any expectation containing a written control character.
- **An arity mismatch becomes a catchable condition** (#96). `rt_arity_error` stops duplicating the
  format-print-abort body and calls `rt_trap_deliver`, like the ~44 sites `rt_fatal`/`rt_fatalf`
  funnel. The wording is unchanged because it is the same `snprintf`. **This contradicts the spec as
  written and the spec changes with it** — `core-language` currently lists an arity mismatch among the
  violations that SHALL remain fatal.
- **The trap raiser becomes per-entry rather than one global** (#97), riding the `rt_trap`
  save/restore bracket `src/emit.cpp` already puts around every `scheme_entry` call, so a trap inside
  the compiler reaches the compiler's handler chain and one inside user code reaches the session's.
- **`=` and `<` compare exactly across the exactness boundary** (#77). The mixed arm stops going
  through `double`; `>`/`<=`/`>=` derive over `<` (#26) and inherit the fix. `max`/`min` are already
  correct (verified: `2.0`/`1.0`, matching Chez) and are not touched.
- **Non-goals**: `list?` on a cycle (#108 — in the prelude, so it pays a regen barrier this change
  deliberately avoids); the reader's `#0=`/`#0#` (#75, also prelude, and the round-trip partner this
  change makes possible); `write-shared`/`write-simple` (absent, recorded on #33); exact rationals
  and bignums (#27).

## Capabilities

### New Capabilities

None. All five are corrections to behaviour existing capabilities already claim.

### Modified Capabilities

- `core-language`: five requirements change. **write writes any datum in write style** and **display
  writes any datum in display style** gain termination on a cyclic datum, and `write` gains the
  character-naming table. **Numeric tower with fixnum/flonum contagion** splits its one sentence in
  two: contagion stays the rule for *arithmetic*, while a *comparison* is decided on the operands'
  mathematical values, so the coercion the current text mandates is confined to arithmetic. **The
  runtime trap mechanism raises a catchable condition** moves an arity mismatch off the
  remain-fatal list, and the **fixed-arity call** requirement's "reports an error and aborts" becomes
  delivery to a handler when one is installed.
- `dynamic-extent`: **guard and raise participate in unwinding** gains the rule that a trap is
  delivered to the handler chain of the code that trapped, which is what makes the raiser
  per-entry rather than global.

## Impact

- **`src/runtime/runtime.c`** — `print_val` (:1240 and its definition beside `rt_write`), `err_write`
  (:1895), `rt_arity_error` (:681), the raiser cells (:2103-2131), `rt_num_eq` (:604), `rt_lt` (:609).
- **`src/emit.cpp`** — the raiser joins the existing `rt_trap` brackets (:553, :1555, :1601).
- **No `make regen`.** Both files are host C, outside `CORE_FLAT`; `make` rebuilds the binaries from
  committed IR. The full suites still run, and `test/trust-check.sh` is unaffected by construction —
  a host-only change cannot alter regenerated IR.
- **Test expectations move** wherever a written control character appears, which is the blast radius
  #94 asked a change to own.
- **`emit-arity-check` (`src/emit.ss`) is read but not edited**: its block ends in `unreachable` after
  a call that may now longjmp, which needs confirming rather than changing (the other trap paths
  already reach `rt_trap_deliver` the same way). Editing it would pull a regen barrier into a change
  whose whole premise is not having one.
- Closes #90, #94, #96, #97, #77. Retags the `list?` exclusion row from #90 to #108.
