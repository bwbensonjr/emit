# Spec Delta

## ADDED Requirements

### Requirement: Ordinary printing avoids repeated traversal allocation

Atomic and opaque-record printing SHALL require no managed allocation for printer traversal bookkeeping. After warm-up, repeated top-level compound printing that invokes no custom writers and stays within a documented retained-capacity bound SHALL require no new managed allocation for traversal bookkeeping. This SHALL hold with no registered writers and with unrelated writers registered, without changing output or graph semantics.

#### Scenario: A program repeatedly prints small built-in graphs

- **WHEN** a warmed program repeatedly prints fixed small lists and vectors in top-level traversals to an existing destination without invoking a custom writer
- **THEN** traversal bookkeeping causes no further managed allocations
- **AND** ordinary, display, simple, and shared output retain their respective representations
- **AND** registering a writer for an unrelated record type does not disable this property

#### Scenario: A writer is removed

- **WHEN** the writer for a record type is cleared and its instances are printed again, directly and in built-in graphs
- **THEN** instances print opaquely and warmed ordinary traversal retains the same allocation property

### Requirement: Reused traversal storage preserves invocation isolation

Reuse of printer storage SHALL preserve independent traversal state and callback lifetimes through normal return, nested printing, and supported unwinding. Expired callback procedures and borrowed ports SHALL remain expired during later invocations. Inactive retained storage SHALL release references to printed values and destinations and SHALL obey a documented capacity bound.

#### Scenario: A saved handle is used during a later callback

- **WHEN** a writer saves its recursive renderer or borrowed port and a later writer invokes that saved handle while actively rendering at the same nesting depth
- **THEN** use raises a catchable expired-context error
- **AND** the active invocation can continue with its own valid handles

#### Scenario: Growth and unwinding precede reuse

- **WHEN** a nested traversal grows its graph storage and then raises, traps, or takes a supported nonlocal exit
- **THEN** outer graph labels, destination, mode, and active-record tracking remain valid
- **AND** later top-level printing starts with fresh traversal state

#### Scenario: A large graph is no longer needed

- **WHEN** a traversal finishes normally or is unwound after printing a large graph
- **THEN** inactive retained printer storage does not keep that graph or destination reachable
- **AND** retained traversal capacity remains within the documented bound
