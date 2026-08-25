## ADDED Requirements

### Requirement: An empty-rest variadic fast entry is benchmark-gated

Before changing production code generation, the compiler project SHALL measure a prototype entry
for statically known calls that pass exactly a variadic procedure's minimum arity. The prototype
SHALL use the uniform Scheme function prototype, bind the rest parameter to `()`, and bypass the
ordinary variadic entry's argument-count check, positional-slot spill, and rest-list construction.

The fast entry SHALL be retained only if alternating before/after samples of P9's existing
3,000,000-call `number->string` benchmark show a median elapsed-time improvement of at least 5% at
the timer's recorded resolution. If the gate is not met, the prototype SHALL be removed, production
call behavior SHALL remain unchanged, and the measured no-go result SHALL be recorded.

When retained, the fast entry SHALL be selected only where the callee and the exact minimum argument
count are statically known. Calls with additional arguments, calls through `apply`, value-position
calls, and calls without eligible static callee information SHALL continue through the ordinary
variadic closure entry and SHALL construct the same rest list as before. Both entries SHALL preserve
the existing uniform ABI, observable behavior, and guaranteed tail calls. The fast entry's generated
label SHALL occupy a namespace disjoint from every ordinary code label so a legal Scheme procedure
name cannot create a duplicate LLVM definition.

#### Scenario: A passing prototype becomes the minimum-arity path

- **WHEN** the prototype improves the P9 benchmark's median elapsed time by at least 5%
- **THEN** the retained compiler targets the fast entry for a statically known one-argument call to
  variadic `number->string`, and that entry binds its rest parameter to `()` without calling the
  generic rest builder

#### Scenario: A prototype in the noise is not retained

- **WHEN** the prototype improves the P9 benchmark's median elapsed time by less than 5%
- **THEN** its compiler-source changes are removed and the project records the measured result
  without changing the production call interface

#### Scenario: Additional arguments use the ordinary variadic entry

- **WHEN** a statically known variadic procedure with minimum arity one is called with two arguments
- **THEN** the call uses the ordinary variadic entry and the callee receives a one-element rest list

#### Scenario: Dynamic calls retain variadic behavior

- **WHEN** the same procedure is invoked through `apply` or through a first-class procedure value
- **THEN** its closure's ordinary entry validates the argument count and constructs the same rest
  list as before

#### Scenario: A tail call through the fast entry remains guaranteed

- **WHEN** an eligible exact-minimum call occurs in tail position
- **THEN** the emitted call is still a guaranteed tail call under the uniform function prototype and
  runs in bounded stack

#### Scenario: A Scheme name resembling the fast-entry convention does not collide

- **WHEN** one unit defines a variadic procedure named `foo` and another procedure named `foo.min`
- **THEN** their ordinary entries and `foo`'s generated fast entry have three distinct LLVM labels
  and the unit compiles and links without a duplicate definition
