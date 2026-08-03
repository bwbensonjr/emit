## ADDED Requirements

### Requirement: Exact integer overflow is a diagnostic, never a wrapped value

Exact integers are fixnums with a bounded range (`[-2^60, 2^60)` under the current
tagging). When an exact integer operation's mathematically correct result falls
outside that range, the implementation SHALL report the violation of the
implementation restriction and abort the computation via the runtime trap
mechanism. It SHALL NOT produce a value that is not the mathematically correct
result — in particular it SHALL NOT wrap modulo the fixnum range.

This applies to `+`, `-`, and `*` on exact integer operands; to `quotient` and `/`
in the one case where an exact quotient leaves the range (the most negative fixnum
divided by `-1`); and to `inexact->exact` where the argument's value lies outside
the range. It applies identically whether the operation is reached through the
emitter's inline fast path or through the runtime primitive: both SHALL agree, with
the runtime primitive remaining the single definition of the outcome.

An out-of-range exact integer **literal** in source text SHALL likewise be a
diagnostic rather than reading as a different number. The reader computes literal
values with the same arithmetic operators, so it inherits this behaviour.

This requirement records an implementation restriction, not a permanent language
limitation: it is the sanctioned "report a violation of an implementation
restriction" outcome, chosen so that a later change providing exact integers of
unbounded size makes these traps unreachable without altering the result of any
program that produces a value today.

#### Scenario: Addition past the fixnum range traps

- **WHEN** a program evaluates `(+ 1152921504606846975 1)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism with a diagnostic
  identifying an overflow, rather than yielding `-1152921504606846976`

#### Scenario: Multiplication past the fixnum range traps

- **WHEN** a program evaluates `(* 1000000000000 1000000000)` with no enclosing
  guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-735865998743175168`

#### Scenario: Subtraction past the negative bound traps

- **WHEN** a program evaluates `(- 0 -1152921504606846976)` — whose correct result
  `2^60` is one past the range — with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-1152921504606846976`

#### Scenario: In-range arithmetic is completely unaffected

- **WHEN** a program evaluates `(+ 1152921504606846974 1)`, `(* 2 3 4)`, and
  `(- 1152921504606846975 1)`
- **THEN** the results are the exact fixnums `1152921504606846975`, `24`, and
  `1152921504606846974` — every result representable as a fixnum is produced
  exactly as before

#### Scenario: The most negative fixnum divided by -1 traps

- **WHEN** a program evaluates `(quotient -1152921504606846976 -1)` or
  `(/ -1152921504606846976 -1)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-1152921504606846976`

#### Scenario: Flooring and truncating remainders are unaffected

- **WHEN** a program evaluates `(modulo -1152921504606846976 -1)` and
  `(remainder -1152921504606846976 -1)`
- **THEN** the results are `0` and `0` — these are in range for every input and
  are not affected by this requirement

#### Scenario: An out-of-range source literal traps at read time

- **WHEN** a program contains the literal `1152921504606846976`, one past the
  fixnum range
- **THEN** reading it aborts via the runtime trap mechanism, rather than producing
  the wrapped value `-1152921504606846976`

#### Scenario: The inline fast path and the runtime agree

- **WHEN** the same overflowing operation is reached through the emitter's inline
  fixnum fast path and through a call to the runtime primitive
- **THEN** both abort with the same diagnostic — the inline path detects the
  overflow and delegates to the runtime primitive rather than deciding the outcome
  itself

#### Scenario: Both backends agree

- **WHEN** an overflowing program is run under the in-process runner and as an
  AOT-compiled executable
- **THEN** both report the overflow; the in-process runner's host survives the trap
  and the standalone executable exits with a nonzero status, per the existing trap
  discipline

## MODIFIED Requirements

### Requirement: Exact/inexact conversion

The language SHALL provide `exact->inexact`, converting an exact integer to the
flonum of the same value (and returning a flonum argument unchanged), and
`inexact->exact`, converting a flonum with an integer value to the exact fixnum of
that value (and returning a fixnum argument unchanged). `inexact->exact` of a
non-integral flonum SHALL raise a runtime trap (there are no exact rationals).
`inexact->exact` of a flonum whose value lies outside the fixnum range SHALL
likewise raise a runtime trap, rather than producing a truncated or wrapped
result — the conversion SHALL NOT rely on an out-of-range floating-point-to-integer
cast.

#### Scenario: exact to inexact

- **WHEN** a program evaluates `(exact->inexact 3)` and `(inexact? (exact->inexact 3))`
- **THEN** the results are the flonum `3.0` and `#t`

#### Scenario: inexact to exact on an integral flonum

- **WHEN** a program evaluates `(inexact->exact 3.0)` and `(exact? (inexact->exact 3.0))`
- **THEN** the results are the fixnum `3` and `#t`

#### Scenario: inexact to exact on a non-integral flonum traps

- **WHEN** a program evaluates `(inexact->exact 2.5)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

#### Scenario: inexact to exact outside the fixnum range traps

- **WHEN** a program evaluates `(inexact->exact 1e30)` or
  `(inexact->exact (exact->inexact 1152921504606846975))` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-1` or the most negative fixnum
