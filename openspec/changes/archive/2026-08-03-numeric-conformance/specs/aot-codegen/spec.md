## ADDED Requirements

### Requirement: Flonum literals are written into IR by a canonical formatter

The emitter SHALL write an inexact (flonum) literal into emitted IR using a **canonical
formatter of its own**, and SHALL NOT derive the IR text from the host's number printer. This
applies to every site that renders a double into emitted output — both the unboxed operand form
used inside a flonum region (`fmul double …`) and the string constant form rebuilt at runtime by
`rt_flonum_lit`.

The formatter SHALL satisfy two independent properties:

1. **Validity** — the emitted text SHALL be accepted by LLVM in a `double` position. A
   floating-point constant SHALL therefore always carry a decimal point (or use the
   hexadecimal bit-pattern form), so a value whose shortest decimal uses an exponent SHALL NOT
   be rendered in a form (such as `1e+02`) that LLVM parses as an integer constant and rejects.
2. **Door independence** — for a given double, the emitted text SHALL be **byte-identical
   regardless of which door's number printer is available**: the Chez-hosted bootstrap driver and
   the self-hosted compiler SHALL emit the same IR text for the same literal. The formatter MAY
   consume the host's shortest-round-trippable digits, but SHALL impose its own canonical framing
   (sign, decimal point placement, exponent presence and spelling) so that host framing
   differences cannot reach the IR.

The formatter SHALL preserve the value exactly: the double recovered from the emitted text SHALL
be bit-identical to the literal the compiler read. Non-finite values (infinities and NaN), which
have no decimal spelling LLVM accepts, SHALL be emitted in the hexadecimal bit-pattern form.

#### Scenario: A literal whose shortest decimal uses an exponent compiles

- **WHEN** a program evaluating `(* 100.0 2.0)` is compiled through any door
- **THEN** it compiles successfully and yields `200.0` — the literal is emitted with a decimal
  point rather than as `1e+02`, which LLVM rejects as an integer constant in a `double` position

#### Scenario: The same literal emits identical IR on every door

- **WHEN** a program containing flonum literals — including an integral value (`100.0`), a
  large-magnitude value (`1e15`, `1e308`), and a subnormal value — is compiled by the
  Chez-hosted driver and by the self-hosted compiler, and the emitted IR of each is compared
- **THEN** the IR text is identical, including the operands of flonum arithmetic and the
  contents of any emitted literal string constant

#### Scenario: Values round-trip exactly through the emitted text

- **WHEN** a program returns a flonum literal that requires all 17 significant digits to
  round-trip
- **THEN** the value it yields is bit-identical to the literal in the source

#### Scenario: Non-finite literals emit a form LLVM accepts

- **WHEN** a program contains a literal that reads as an infinity (for example `1e400`) in a
  position where the emitter renders a double
- **THEN** the emitted IR uses the hexadecimal bit-pattern form and compiles, rather than
  emitting a decimal spelling LLVM cannot parse
