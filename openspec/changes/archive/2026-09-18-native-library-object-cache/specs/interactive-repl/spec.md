# Spec Delta

## ADDED Requirements

### Requirement: Cached native libraries preserve the persistent REPL model

A REPL library admitted as a cached relocatable native object SHALL occupy the same persistent JIT
symbol namespace and expose the same definitions as that library's full LLVM IR unit. It SHALL
resolve references to other library units and the host runtime, preserve the session's selected JIT
optimization profile, and remain open to references from forms compiled later in the session.

Admitting a native object SHALL NOT initialize its library. The library and its dependency closure
SHALL retain dependency-first, import-time, at-most-once initialization, and its exports SHALL enter
the session scope only after successful initialization. A native object admitted for an exact
manifest entry that is never imported SHALL not be linked or initialized merely because it was
registered at startup.

#### Scenario: A cached library initializes at first import

- **WHEN** a session registers an exact manifest library from a cached native object and later
  imports it
- **THEN** the object is linked into the persistent JIT, its uninitialized dependencies are
  initialized before it, and its exports become usable after its initializer succeeds

#### Scenario: An unimported native library remains unmaterialized

- **WHEN** a session registers a cached native object for a manifest library but never imports that
  library
- **THEN** the object is neither linked nor initialized during the session

#### Scenario: Later forms call symbols from a cached object

- **WHEN** a library is admitted from a cached native object and a later independently compiled REPL
  form calls one of its exports
- **THEN** the call resolves in the shared JIT and produces the same result as when the library was
  admitted from LLVM IR

#### Scenario: Cached and uncached sessions agree

- **WHEN** the same forms and imports run once with no native object and once with a valid native
  object under the same profile
- **THEN** their printed values, effects, diagnostics, initialization counts, and visible bindings
  are identical
