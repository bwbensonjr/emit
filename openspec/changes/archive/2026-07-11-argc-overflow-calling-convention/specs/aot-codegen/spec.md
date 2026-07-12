## ADDED Requirements

### Requirement: Emit the argc + overflow calling convention

Every emitted Scheme function SHALL use the single uniform prototype
`tailcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)` (`K` = whole-program
max fixed arity), and every emitted call SHALL pass `argc` = the number of actual
arguments, the positional arguments padded to `K`, and an `overflow` pointer (`ptr null`
while all functions are fixed-arity). The convention SHALL preserve guaranteed tail calls
(`musttail`) and SHALL NOT change the observable behavior of existing programs.

#### Scenario: Widened prototype and call shape

- **WHEN** a program is compiled to LLVM IR
- **THEN** each Scheme function is defined with the `(self, argc, a0 … a{K-1}, overflow)`
  prototype, and each call site passes the actual-argument count as `argc`, the padded
  positional arguments, and `ptr null` as `overflow`

#### Scenario: Behavior preserved across all backends

- **WHEN** every demo is compiled and run through AOT, JIT, and bitcode after the
  convention change
- **THEN** each demo produces the same value it produced before the change, byte-identical
  across all three backends

#### Scenario: Tail calls remain guaranteed

- **WHEN** a tail-recursive loop (e.g. the 10M-iteration `countdown` / named-`let` loop)
  is compiled under the widened prototype
- **THEN** the tail call is emitted as `musttail` and the program runs in bounded stack
