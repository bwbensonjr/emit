# Spec Delta

## MODIFIED Requirements

### Requirement: Ordinary write labels cycles only as needed

`write` SHALL produce a readable external representation for readable built-in data and SHALL use datum labels for at least the pair and vector nodes necessary to terminate on cyclic structure. It SHALL NOT emit datum labels when the reachable pair/vector graph is acyclic, even when an acyclic object is shared.

Custom-written records SHALL use their registered representation and SHALL be opaque boundaries for graph discovery. Their output SHALL be exempt from readability and sharing reconstruction guarantees across those boundaries.

#### Scenario: A cyclic pair terminates with a label

- **WHEN** `write` receives a pair whose cdr refers to itself
- **THEN** it terminates and its output uses a datum definition and reference for the cycle

#### Scenario: Acyclic sharing is duplicated by ordinary write

- **WHEN** `write` receives a list containing the same acyclic list twice
- **THEN** both occurrences are written in full with no datum label

### Requirement: Simple write never emits datum labels

`write-simple` SHALL use the same external representation as `write` except that it SHALL never introduce datum labels. Nontermination on circular structure is permitted by R7RS-small.

#### Scenario: Acyclic shared structure has no labels

- **WHEN** `write-simple` receives a list containing the same acyclic list twice
- **THEN** both occurrences are written in full and the output contains no datum definition or reference

### Requirement: Shared write preserves all pair and vector sharing

`write-shared` SHALL use datum labels for every pair or vector object that occurs more than once in the reachable built-in graph of each traversal bounded by custom records, including both cyclic and acyclic sharing. For readable built-in data, reading the result SHALL reproduce the observable sharing relationships. Custom-written records SHALL be opaque boundaries; sharing across those boundaries and reconstruction of custom objects SHALL NOT be guaranteed.

#### Scenario: Acyclic sharing receives a label

- **WHEN** `write-shared` receives a list containing the same acyclic list twice
- **THEN** the first occurrence is a datum definition and the second is a reference to it

#### Scenario: Sharing across pairs and vectors is retained

- **WHEN** an object graph shares a pair through both a pair field and a vector element, is written with `write-shared`, and is read back
- **THEN** the corresponding locations in the result are `eq?`

### Requirement: Display retains display semantics on graphs

`display` SHALL render strings and characters without write-style quoting while otherwise following the ordinary writer's termination behavior for compound data.

#### Scenario: Displayed text is unquoted

- **WHEN** `display` receives a string containing a character that `write` would escape
- **THEN** it emits the string's characters rather than a quoted external representation

#### Scenario: Custom representations preserve display mode

- **WHEN** `display` renders a custom record whose writer recursively emits a string field
- **THEN** that field is emitted without write-style quotes, including inside a list
