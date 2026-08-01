## ADDED Requirements

### Requirement: A call into a library lowers to a direct call

When a call's operator resolves to an imported library binding whose export table records a code
label and whose recorded arity matches the call's argument count, the emitter SHALL lower it to a
direct call to that label rather than loading the code pointer from the binding's closure. The
binding's global SHALL still be read and passed as the callee's `self`, since it carries the
captured environment; only the code-pointer load is elided.

The lowering SHALL be observably identical to the indirect call. It rests on library globals being
assigned once, during the unit's initialization, and never reassigned — a property that SHALL be
stated and tested, not assumed, because its failure mode is silent misdispatch rather than a
diagnostic.

Where the recorded arity does not match, or no label is recorded, the call SHALL be lowered
indirectly as before, so that arity errors continue to trap exactly as they do today.

#### Scenario: A fixed-arity library call is emitted as a direct call

- **WHEN** a program calls an imported procedure of matching arity, such as `(zero? n)` from
  `(scheme base)`
- **THEN** the emitted IR calls that procedure's code label directly, with the loaded global passed
  as `self`, and contains no code-pointer load for that call

#### Scenario: An arity mismatch stays indirect and still traps

- **WHEN** a program calls an imported fixed-arity procedure with the wrong number of arguments
- **THEN** the call is lowered indirectly and the program traps with the same arity error as before

#### Scenario: Redefining a library name at the REPL is still observed correctly

- **WHEN** a REPL session redefines a name that `(scheme base)` also exports, and then calls both
  the redefined name and a previously-compiled procedure that used the library's binding
- **THEN** each resolves to the binding it captured, exactly as before this change

## MODIFIED Requirements

### Requirement: The AOT build optimizes the linked module (release profile)

The AOT/build door SHALL compile the linked module with an optimizing pipeline (`-O2`) rather than
the toolchain default, and SHALL additionally enable link-time optimization (`-flto`) so that the
optimizer can act across compilation-unit boundaries.

LTO is what makes a cross-unit direct call worth emitting: measured on a 30-million-call probe, the
direct call alone and LTO alone each change nothing, while together they are ~6× faster than
today's indirect call. Because binary size is a first-class concern for this project, the release
profile's size SHALL be measured when LTO is enabled, and a size regression SHALL be treated as a
reason to reconsider the setting rather than a cost to absorb silently.

The interactive/JIT door SHALL remain unoptimized; this requirement governs the ship path only.

#### Scenario: The delivered executable is built with an optimizing pipeline

- **WHEN** a program is delivered through the AOT/build door
- **THEN** the linked module is compiled at `-O2` with link-time optimization enabled

#### Scenario: Cross-unit calls are optimized across the unit boundary

- **WHEN** a program that direct-calls an imported procedure is delivered through the AOT door
- **THEN** the optimizer may inline that procedure across the unit boundary

#### Scenario: Binary size is measured against the previous release profile

- **WHEN** link-time optimization is enabled
- **THEN** the delivered executable's size is compared against a build without it, and the result
  is recorded
