# Spec Delta

## Purpose

Allow ordinary Scheme libraries to control the textual representation of their record objects throughout Emit's shared printing paths.

## ADDED Requirements

### Requirement: Record types have optional custom writers

The optional `(emit write)` library SHALL export `set-record-type-writer!`. Given a record instance and a procedure or `#f`, it SHALL set the writer for that instance's type, affecting existing and future instances. `#f` SHALL restore opaque printing. Other argument types SHALL raise catchable errors. Unregistered types SHALL retain their default output.

#### Scenario: A library installs and removes its writer

- **WHEN** a library calls `(set-record-type-writer! exemplar writer)` on an instance of its record type
- **THEN** all instances of that type use that writer, including instances allocated earlier
- **AND** passing `#f` restores `#<record TYPE>` without affecting other record types

#### Scenario: Invalid registration is recoverable

- **WHEN** registration receives a nonrecord exemplar or a nonprocedure value other than `#f`
- **THEN** it raises a catchable error and leaves the previous writer installed

### Requirement: Writers receive the value and its output context

A writer SHALL be called as `(writer value port mode recur)`. The mode SHALL be `write`, `display`, `write-simple`, or `write-shared`. The supplied output port SHALL denote the actual destination; `recur` SHALL accept one child and render it there using the active mode. Return values SHALL be ignored. Writers SHALL execute only during rendering, once per rendered occurrence, never during graph discovery.

#### Scenario: A writer renders a nested field

- **WHEN** a writer emits delimiters to `port` and calls `recur` on a field containing another custom record
- **THEN** the nested record uses its own writer at that location
- **AND** strings and characters follow the enclosing output mode

#### Scenario: Explicit destination does not redirect unrelated output

- **WHEN** a writer targets an explicit string port while `current-output-port` denotes another port
- **THEN** `port` and `recur` write to the string port and `current-output-port` is unchanged
- **AND** a saved `recur` invoked after its callback returns raises a catchable expired-context error, even while an outer writer remains active

#### Scenario: Graph discovery has no callback effects

- **WHEN** a writer increments a counter and its object occurs once inside an ordinary acyclic list
- **THEN** printing the list increments the counter once, without an additional discovery invocation

### Requirement: All user-facing printing uses custom writers recursively

REPL results, `emit run` final values, standalone final values, and explicit textual writers SHALL dispatch custom writers at any nesting depth. Automatic result printing SHALL use `write` mode and retain unspecified-value suppression. Importing a library with custom record types SHALL NOT change printing of unrelated records, vectors, or other built-in values.

#### Scenario: Interactive and delivered results agree

- **WHEN** the same library-defined custom record is returned directly and inside lists or vectors under REPL, run, and standalone execution
- **THEN** all paths render its custom representation consistently
- **AND** explicit `write`, `display`, `write-simple`, and `write-shared` select their corresponding modes

### Requirement: Custom printing has bounded cycle boundaries

Custom records SHALL be opaque boundaries for ordinary pair/vector graph discovery. Recursive reentry into an actively rendered custom record SHALL emit `#<cycle TYPE>` rather than invoke its writer again, including through nested print calls. Ordinary and shared writing SHALL still terminate on pair/vector cycles within each traversal. Custom output SHALL carry no reader roundtrip or cross-boundary sharing guarantee.

#### Scenario: A record refers to itself through a field

- **WHEN** a record writer recursively renders a field leading back to that active record
- **THEN** output contains `#<cycle TYPE>` and terminates without another invocation for the active record

#### Scenario: A pair cycle passes through a record

- **WHEN** a list contains a custom record whose writer renders that same list
- **THEN** ordinary and shared writing terminate, including the record-cycle marker
- **AND** repeated acyclic custom records are rendered independently

### Requirement: Nested printing and failed writers preserve printer state

Nested writes to the same or different ports SHALL NOT corrupt outer graph labels, modes, destinations, or active-record tracking. Exceptions, runtime traps, and supported nonlocal exits SHALL clean up printer contexts. Explicit writer failures SHALL propagate through existing Scheme error handling; automatic-print failures SHALL use the host error channel and leave the REPL usable. Already emitted bytes SHALL NOT be rolled back.

#### Scenario: Independent printing inside a callback

- **WHEN** a writer prints a cyclic datum to another string port before using `recur` for its field
- **THEN** both outputs have valid independent traversal state and the outer graph completes correctly

#### Scenario: Printing recovers after failure

- **WHEN** a custom writer raises an exception or traps and the error is handled
- **THEN** a subsequent print uses clean state and the correct port
- **AND** a REPL accepts and prints the next valid form after an automatic-print failure

### Requirement: Custom writers survive separate compilation

Writers SHALL be ordinary Scheme closures able to capture library state. Source-driven compilation, whole-library artifacts, cached native libraries, JIT forms, and standalone linking SHALL retain equivalent registration and callback behavior. Programs that do not import Malt SHALL NOT require Malt code or Malt-specific runtime recognition.

#### Scenario: A compiled library owns its writer

- **WHEN** a separately compiled library registers a writer capturing a private formatting setting and a later REPL form prints its value
- **THEN** the callback resolves and uses that captured setting just as in a standalone executable

### Requirement: Native destinations expose borrowed ports safely

When no Scheme destination port exists, a writer SHALL receive a borrowed port valid only for its callback invocation. Closing it SHALL raise a catchable error without closing the underlying destination; use after the invocation SHALL raise a catchable expired-port error. Existing explicit Scheme destination ports SHALL retain their ordinary identity, ownership, and lifetime.

#### Scenario: A result writer retains its destination

- **WHEN** a writer called by automatic result printing saves its borrowed port and later attempts to use or close it
- **THEN** the attempt raises a catchable error without accessing expired state
- **AND** subsequent automatic output still reaches its destination
