## Why

The archived `error-and-guard-conditions` change shipped `error` as diagnose-and-abort
only and deliberately dropped `guard` (its D2): batch self-hosting has no place to *catch*
a compile error, so the one real catch site — the interactive REPL's recover-and-continue
(`src/compile.ss:214`) — lived in the Chez driver and needed nothing in the language.

Porting the REPL into the embedded compiler (`repl-embedded-incremental`) reverses that: the
"a bad form is reported and the session survives" behavior must become expressible in
compiled Scheme, which today has only a one-way `error → trap → abort`. This change adds the
minimal **R7RS-small §6.11** subset that makes catch-and-recover a first-class,
standard-aligned capability — the down-payment on R7RS exception conformance, not an ad-hoc
hook.

## What Changes

- Adopt the **R7RS `error` signature**: `(error message obj …)` (a string `message`, no
  `who`), producing a catchable **error object**. **BREAKING** vs. the current
  `(error who message irritant …)`; internal call sites migrate.
- Add **error-object accessors**: `error-object?`, `error-object-message`,
  `error-object-irritants`.
- Add **`raise`** — raise any object to the nearest enclosing `guard` (or, if none, the
  outermost trap).
- Add **`guard`** (syntax): `(guard (var clause …) body …)`, clauses evaluated `cond`-style
  in the guard's continuation, re-raising outward when no clause matches — the ergonomic
  catch the REPL recovery uses.
- Runtime support: generalize the single-slot trap hook (`rt_trap`, one `jmp_buf*`) into a
  **stack of escape frames** so nested `guard`s compose, integrating with the C++ host's
  existing outermost trap isolation.
- Keep `error`'s abort-when-uncaught behavior (REPL host reports and survives; standalone
  exits non-zero) — now as "uncaught `raise`/`error` reaches the outermost trap".

## Capabilities

### New Capabilities
- _(none — extends `core-language`.)_

### Modified Capabilities
- `core-language`: replace the "error aborts with a diagnostic" requirement with the R7RS
  `error`/error-object behavior, and add requirements for `raise` and `guard`
  (catch-and-recover) — the R7RS-small §6.11 subset that omits the parts requiring
  general continuations.

## Impact

- **Unblocks:** `repl-embedded-incremental` (the compile-error rollback can be expressed
  in-language). Consumes the `rt_trap` mechanism established in this repo.
- **Code:** `src/runtime/runtime.c` (error-object representation, escape-frame stack over
  `rt_trap`, `rt_error` → error-object), `src/prelude.scm` (`error`, `raise`, error-object
  accessors), the expander/prelude (`guard` macro over the escape primitive), `src/parse.ss`
  (`%error-abort` wiring), and **all internal `(error 'who …)` call sites** (compiler passes)
  migrated to the R7RS signature.
- **Fixed point:** the compiler recompiles itself; re-verify the byte-identical fixed point
  after the `error` call-site migration (error paths are not hit during a clean self-compile,
  but their string literals change).
- **Out of scope (deferred):** `with-exception-handler` and `raise-continuable` (faithful,
  non-unwinding, resumable semantics need `call/cc`), `read-error?` / `file-error?`
  (I/O-specific), full `call/cc` / general continuations, and the R6RS condition-type
  hierarchy. `guard` here is implemented directly on a one-shot upward escape, not derived
  from `with-exception-handler`.
