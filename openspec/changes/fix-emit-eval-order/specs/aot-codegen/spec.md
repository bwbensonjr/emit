## ADDED Requirements

### Requirement: Emission order is independent of host evaluation order

The emitter SHALL produce the same textual IR — identical temporary numbering and instruction
order — regardless of the host's unspecified argument-evaluation order. Where a form emits two
or more independently-emitting sub-parts (e.g. a call's callee and its operands), the emitter
SHALL sequence them explicitly (rather than relying on the order in which a host evaluates
procedure-call arguments), so that the compiler run under the bootstrap host (Chez) and the
same compiler compiled to native `schemec` emit byte-identical IR for the same program. This is
the determinism the self-hosting fixed point (byte-identical stage-1/stage-2 IR) depends on.

#### Scenario: schemec and the host-hosted compiler agree byte-for-byte

- **WHEN** a program that emits calls, nested calls, closures, and recursion (e.g.
  `demos/fact.scm`) is compiled to IR by the Chez-hosted compiler and by the native `schemec`
- **THEN** the two IR outputs are byte-identical (not merely semantically equivalent)

#### Scenario: Callee and operands emit in a fixed order

- **WHEN** the emitter lowers a call `(f a b)` (or `(apply f … lst)`), which emits both the
  callee reference and the operand expressions
- **THEN** the sub-parts are emitted in a fixed, host-independent order, so temporary numbering
  does not depend on whether the host evaluates arguments left-to-right or right-to-left
