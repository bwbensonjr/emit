## ADDED Requirements

### Requirement: A variadic export may advertise a minimum-arity fast entry

If the benchmark gate for the empty-rest fast entry passes, a separately compiled immutable
variadic procedure export SHALL be able to publish both its ordinary closure-entry label and an
optional fast-entry label for its exact minimum arity. An importer compiling from the export table
alone SHALL target the fast entry only when the statically counted argument count equals the
minimum; it SHALL target the ordinary label when the count is greater than the minimum.

The optional field SHALL preserve backward artifact compatibility: a new compiler reading an
existing variadic call row without a fast label SHALL use its ordinary direct-call behavior. A
binding assigned by its defining unit SHALL publish neither direct-call label. Every cross-unit
fast-label reference SHALL retain the corresponding closure-global reference required for captured
environments and AOT tree-shaking. Newly published fast labels SHALL use the compiler's disjoint,
reversible generated-label namespace rather than a suffix that a Scheme procedure name can reproduce.

#### Scenario: Exact minimum arity selects the advertised fast entry

- **WHEN** an immutable exported variadic procedure advertises minimum arity two and a fast label,
  and an importing program calls it with exactly two statically counted arguments
- **THEN** the importer loads and passes the exported closure as `self` and directly calls the fast
  label

#### Scenario: More than the minimum selects the ordinary label

- **WHEN** that importing program calls the same export with three statically counted arguments
- **THEN** it directly calls the ordinary variadic label and the callee receives the third argument
  in its rest list

#### Scenario: An older variadic row retains ordinary direct calls

- **WHEN** a new compiler reads a variadic procedure call row that records only its ordinary label,
  minimum arity, and variadic marker
- **THEN** every statically valid call continues to target the ordinary label as it did before this
  change

#### Scenario: Assignment withholds both labels

- **WHEN** a library exports a variadic lambda binding that its defining unit assigns
- **THEN** the export table records neither the ordinary direct-call label nor a fast-entry label,
  and importing calls remain indirect

#### Scenario: Tree shaking retains a fast-entry callee and its closure

- **WHEN** an AOT program's only reference to an imported variadic procedure is an exact-minimum call
  through its fast entry
- **THEN** tree shaking retains the fast entry, the closure and environment needed as `self`, and all
  code reachable from that entry

#### Scenario: Exported names cannot alias an advertised fast label

- **WHEN** a library exports a variadic `foo` and a distinct procedure whose Scheme name is
  `foo.min`
- **THEN** `foo`'s advertised fast label differs from both ordinary labels and importing either
  procedure resolves to the intended definition
