## Why

A typo in the REPL crashes the compiler. Entering `(define-record-type <point> (x y))`
— a malformed record definition — segfaults `repl-host` instead of reporting a syntax
error and returning to the prompt. This directly undermines the project's core design
goal that the REPL is the primary development loop: a mistyped form must never take down
the session. The same malformed input drives the batch paths into undefined behavior too
(`scheme-run` silently produces no output; `schemec` exits non-zero), so it is also a
dev→ship fidelity defect.

The root cause is that the frontend lowering of `define-record-type`
(`record-type-bindings` / `record-field-bindings` in `src/parse.ss`) destructures the
user's syntax with raw `car`/`cdr`/`cadr`/`caddr` and **no shape validation**. For the
malformed input the predicate slot becomes `(car '())`; in the compiled Emit compiler
that yields a garbage pointer, and dereferencing it deeper in compilation crashes.
Unlike `parse-expr` (which uses arity-safe `match`) and `normalize-define` (which already
validates and raises `(error 'collect-toplevel ...)`), this pre-expansion path runs
unchecked.

## What Changes

- Add shape validation to the `define-record-type` frontend lowering in `src/parse.ss`
  so every malformed record form raises a recoverable `(error 'collect-toplevel ...)`
  diagnostic — the same error channel the REPL already catches and reports as an
  `error:` line before returning to the prompt (proven by the unbound-variable path).
- Validation covers the full shape: the form has a type name, a constructor spec
  `(<constructor> <field-tag> …)`, a predicate name, and zero or more field specs
  `(<field-tag> <accessor> [<mutator>])`; names are symbols; constructor field tags refer
  to declared fields; each field spec is well-formed.
- Guarantee identical behavior across all three frontends (`repl-host`, `scheme-run`,
  `schemec`): a malformed record form is a clean compile-time error, never a segfault,
  silent miscompile, or spurious exit.
- Add regression coverage for the reported crash and the sibling malformed variants
  (empty form, missing predicate, non-list constructor/field specs, non-symbol names).

Out of scope (noted as a separate future change): hardening the runtime primitives
themselves so that `(car '())` / `(cdr 5)` raise Scheme errors instead of returning
garbage. That is a larger change touching `src/runtime/runtime.c` and the
binary-size/performance design goals, and warrants its own design. This change removes
the crash at its actual source — the compiler must never invoke UB on user syntax.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: The `define-record-type` requirement gains an explicit guarantee that
  malformed record forms are rejected with a recoverable compile-time error rather than
  crashing or miscompiling, uniformly across the interactive and batch frontends.

## Impact

- **Code**: `src/parse.ss` — `record-type-bindings`, `record-field-bindings`, and a small
  shared validation helper (mirroring `normalize-define`'s existing validation pattern).
- **Committed IR**: because `src/parse.ss` is part of the compiler, the committed
  `bootstrap/*.ll` must be regenerated (`make regen`) so the shipped binaries carry the
  fix; the Chez-gated trust-check enforces this.
- **Tests**: new negative cases in the record test surface (e.g. `test/`-level and/or a
  `demos/` error demo); existing valid-record behavior is unchanged.
- **No API/behavior change** for well-formed `define-record-type` forms.
