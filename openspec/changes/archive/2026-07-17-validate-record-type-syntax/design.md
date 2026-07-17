## Context

`define-record-type` is lowered in the frontend (`src/parse.ss`), in the pre-expansion
`collect-toplevel` phase, because it introduces top-level bindings that must be understood
before the syntax-rules expander folds the program into a single letrec body (see the
comment block above `record-type-form?`). Two helpers do the lowering:

- `record-type-bindings` — destructures `(define-record-type NAME (CTOR cf …) PRED
  (fld ACC [MUT]) …)` into `(name init)` binding pairs over the record primitives.
- `record-field-bindings` — destructures each field spec `(fld ACC [MUT])`.

Both use raw `car`/`cdr`/`cadr`/`caddr` with **no shape validation**. When the form is
malformed, these read past the end of short lists. `(car '())` in the compiled Emit
compiler does not raise — it returns a garbage pointer (Emit's `car`/`cdr` are currently
unchecked), which then propagates into further list construction and compilation and
manifests as undefined behavior: a segfault under `repl-host`, silent empty output under
`scheme-run`, or a non-zero exit under `schemec`.

The codebase already has the correct pattern nearby. `normalize-define` validates the
`define` shape and raises `(error 'collect-toplevel "malformed …" f)`; `parse-expr` uses
`match`, which is arity-safe by construction. The REPL host already catches such errors,
prints an `error:` line, and returns to the prompt (demonstrated by the unbound-variable
path). So the fix is to bring the record lowering up to the same standard — no new
machinery is required.

## Goals / Non-Goals

**Goals:**
- Every malformed `define-record-type` form produces a recoverable compile-time error
  (`error 'collect-toplevel …`) instead of a crash, silent miscompile, or spurious exit.
- Uniform behavior across `repl-host`, `scheme-run`, and `schemec`.
- Zero change to the semantics or output of well-formed record forms.
- Validation lives entirely in the frontend, before any destructuring — consistent with
  `normalize-define`.

**Non-Goals:**
- Making the runtime primitives (`car`, `cdr`, `vector-ref`, `%record-ref`, …) safe on
  bad inputs. That is the deeper enabling factor but a separate, larger change with
  binary-size/performance implications; it gets its own proposal.
- Adding new record features (e.g. R7RS constructor-field subsetting rules beyond what
  already exists, duplicate-name detection beyond basic shape).
- Changing how errors are surfaced by the REPL or batch drivers — the existing `error`
  channel is reused as-is.

## Decisions

**Decision: Validate shape in the frontend before destructuring, raising `error`.**
Add a validation step (a helper such as `check-record-type-form`, or inline `unless`
guards mirroring `normalize-define`) that verifies the whole shape, then let the existing
`record-type-bindings` destructure a form already known to be well-formed. Rationale: this
matches the established `normalize-define` pattern, keeps the fix in one place, and uses
the error channel the REPL already handles. *Alternative considered:* scatter defensive
checks through the destructuring — rejected as harder to read and easy to leave
incomplete.

**Decision: Enumerate the specific malformed cases from the spec scenarios.**
Check, in order: form has type name + constructor spec + predicate present; constructor
spec is a list with a symbol head; predicate is a symbol; each field spec is a list
`(fld ACC [MUT])` of symbols; each constructor field tag names a declared field. Rationale:
these correspond one-to-one to the spec's scenarios, so each is directly testable.
*Alternative considered:* a single catch-all "malformed record" check — rejected because
targeted messages are far more useful in the primary dev loop.

**Decision: Keep the fix frontend-only; do not touch the runtime.** The crash's proximate
cause is the compiler invoking UB on user syntax; validating the syntax removes it
entirely for this form. Hardening primitives would also help but is out of scope (see
Non-Goals). Rationale: smallest correct change, aligned with the "simple and
easy-to-understand" and small-binary design goals.

**Decision: Regenerate committed IR via `make regen`.** `src/parse.ss` is part of the
compiler, so the committed `bootstrap/*.ll` must be regenerated for the shipped binaries
to carry the fix. The Chez-gated trust-check enforces that `make regen` from a clean tree
leaves `git diff bootstrap/` empty, so this cannot be forgotten silently.

## Risks / Trade-offs

- **Over-strict validation rejects a form R7RS permits** → Cross-check the grammar against
  the existing `records` demo and the R7RS-small text (`docs/r7rs-small.md`); the
  "well-formed record still compiles" scenario and the existing record tests guard against
  regressions.
- **Error message quality in the REPL** → Reuse `(error 'collect-toplevel …)` so messages
  match the existing `define` diagnostics; verify the REPL prints a clean `error:` line and
  stays alive (the primary symptom being fixed).
- **Forgetting `make regen`** → The change is invisible in the running binaries until IR is
  regenerated; mitigated by the trust-check and an explicit task step + verification.
- **Residual UB from unsafe primitives elsewhere** → This change does not claim to fix the
  general class; it is explicitly scoped to `define-record-type`. The follow-up
  runtime-hardening proposal is referenced so the broader risk is tracked, not lost.

## Migration Plan

No migration for users; behavior only changes for previously-crashing malformed input.
Deploy is: edit `src/parse.ss`, add tests, `make regen`, run the suites. Rollback is a
straight revert of the commit followed by `make regen`.

## Open Questions

- Should duplicate field/accessor/mutator names be a validation error here, or deferred to
  the runtime-hardening follow-up? (Leaning: basic shape now; duplicate-name detection is a
  reasonable small add if cheap, otherwise deferred.)
