## ADDED Requirements

### Requirement: Primitive-inlining pass

The frontend pass ladder SHALL include a primitive-inlining pass that rewrites a direct call
whose operator resolves to a global primitive-layer binding into the corresponding bare
primcall, provided the operator is not lexically shadowed, not user-redefined, and not
`set!`-ed. The pass SHALL key its decision on the resolved binding (so shadowing is respected
automatically) and SHALL be an observable stage in the pass ladder, consistent with the
project's one-IL-per-stage discipline.

#### Scenario: The pass is shadow-aware

- **WHEN** a primitive name is shadowed lexically, redefined at top level, or `set!`-ed
- **THEN** the inlining pass does NOT rewrite calls to it; the call remains an ordinary
  closure call

#### Scenario: The pass appears in the documented ladder

- **WHEN** the frontend pass ladder is documented (`docs/PIPELINE.md`)
- **THEN** the primitive-inlining stage is listed with its input and output IL shape
