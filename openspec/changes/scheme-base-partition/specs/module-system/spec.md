## ADDED Requirements

### Requirement: The baked library set is a partition emitted in dependency order

The compiler's baked-in prelude source SHALL be compiled into a **set** of libraries described by
the declared partition, not into a single fixed library. The portable derivation SHALL emit each
partition member as its own `define-library` — with its own export list, its own body forms, and an
`import` of the members it depends on — and SHALL emit them in dependency order, so a member is
compiled and initialized after everything it imports.

Every member of the baked set SHALL be reachable **without a manifest**, exactly as `(scheme base)`
is: the guarantee that a program importing only `(scheme base)` (or importing nothing) needs no
manifest present SHALL extend to whatever `(scheme base)` itself imports. A library the baked set
depends on SHALL NOT be resolved through the manifest.

A baked library MAY import another baked library. All doors — the AOT door, the REPL door's eager
preload, the run door's lazy import closure, and the auto-import — SHALL handle a baked library that
has imports, and SHALL continue to emit byte-identical modules across doors for the same program.

#### Scenario: A program with no imports needs no manifest, still

- **WHEN** a program that imports nothing (or only `(scheme base)`) is run from a directory with no
  manifest present, after the prelude has been partitioned into more than one baked library
- **THEN** it compiles and runs exactly as before, with no manifest consulted and no library
  resolution failure

#### Scenario: The baked set initializes in dependency order

- **WHEN** a program is compiled and the baked set contains a library that `(scheme base)` imports
- **THEN** that library's module is emitted before `(scheme base)`, its initializer runs before
  `(scheme base)`'s, and each initializer runs exactly once

#### Scenario: Door parity survives partitioning

- **WHEN** the same program is compiled through the AOT door, the run door, and the Chez-hosted
  driver against the same partition
- **THEN** the emitted program module is byte-identical across all three, as it was before the
  prelude was partitioned

### Requirement: Relocated names live in their R7RS-small libraries

Names that R7RS-small places outside `(scheme base)` SHALL be exported by the library the standard
assigns them to, and SHALL NOT be exported by `(scheme base)`. Specifically:

| library | names |
|---|---|
| `(scheme cxr)` | `caaar` `caadr` `cadar` `caddr` `cdaar` `cdadr` `cddar` `cdddr` `cadddr` |
| `(scheme read)` | `read` |
| `(scheme file)` | `open-input-file` `open-output-file` `with-input-from-file` `with-output-to-file` `call-with-input-file` `call-with-output-file` |

Each SHALL be an ordinary library — resolved through the manifest, compiled to a unit artifact, and
linked like any other — not a baked one, and each SHALL be installed alongside the other shipped
libraries so an installed `emit` can import it. `(scheme base)` SHALL retain the depth-2 accessors
`caar`, `cadr`, `cdar`, `cddr`, which R7RS-small does place there.

The procedures' behaviour SHALL be unchanged by relocation; only the library that exports them
changes. There SHALL be no compatibility re-export from `(scheme base)`.

#### Scenario: A relocated name is unbound without its library

- **WHEN** a program that does not import `(scheme read)` references `read`
- **THEN** compilation fails with an unbound-variable error

#### Scenario: A relocated name works when its library is imported

- **WHEN** a program imports `(scheme read)` and calls `read` on an input port, or imports
  `(scheme cxr)` and evaluates `(caddr '(1 2 3))`, or imports `(scheme file)` and opens a file
- **THEN** each behaves exactly as it did when the name was exported from `(scheme base)`

#### Scenario: The depth-2 accessors stay in (scheme base)

- **WHEN** a program with no explicit import evaluates `(cadr '(1 2 3))`
- **THEN** it compiles and returns `2`, because R7RS-small places the depth-2 accessors in
  `(scheme base)`

#### Scenario: The relocated libraries are reachable from an installed emit

- **WHEN** an installed `emit` runs a program importing `(scheme cxr)`, `(scheme read)`, or
  `(scheme file)` from a directory containing no manifest of its own
- **THEN** the library resolves through the installed manifest and the program runs

### Requirement: An internal substrate library carries shared private machinery

Machinery that more than one shipped library needs but that is not public API — the port
representation and the reader's lexeme and datum helpers — SHALL live in a single **internal**
library, named outside the `(scheme …)` namespace that R7RS reserves for the standard.

That library SHALL be part of the baked set, because `(scheme base)` depends on it. It SHALL NOT be
auto-imported, so its exports are in scope only for a library or program that names it explicitly;
an ordinary program SHALL therefore still see none of these names. It is not API and carries no
stability guarantee.

Because `(scheme base)` imports it, the substrate SHALL NOT depend on `(scheme base)`: every name its
body reaches SHALL be defined within it. A name that `(scheme base)` also exports and that the
substrate needs only internally SHALL be defined in the substrate without being exported by it.

**No mutable binding SHALL be shared between the substrate and `(scheme base)` by duplication.** A
top-level binding that is assigned after initialization, or that holds an object whose identity is
observable (a record type descriptor), SHALL be assigned to exactly one library, and every procedure
that assigns it SHALL live in that same library — a unit's top-level bindings are written only by its
own initializer, so assigning an imported binding is not available and duplicating a stateful one
would split the state. Consequently the substrate SHALL NOT contain the exception-handler chain, and
machinery that raises errors SHALL be assigned to the libraries that consume it rather than to the
substrate.

Its resolution SHALL be identical on every door: the doors that build the baked set from the
compiler's baked-in prelude source SHALL resolve it baked, and the doors that resolve `(scheme base)`
through the manifest SHALL find the substrate through the manifest too, so `(scheme base)`'s import of
it resolves on either path. It SHALL be installed alongside the other shipped library sources.

#### Scenario: The substrate does not depend on the library that imports it

- **WHEN** the substrate's unit is compiled
- **THEN** it resolves every name its body references without importing `(scheme base)`, and a name
  `(scheme base)` also exports but the substrate needs only internally is absent from the substrate's
  export list

#### Scenario: A port made through a relocated library is a port everywhere

- **WHEN** a program imports `(scheme file)`, opens a file, and passes the resulting port to a
  `(scheme base)` procedure such as `read-char`, `port?`, or `close-port`
- **THEN** the port is recognized and the operation behaves as it did when both procedures lived in
  `(scheme base)`, because the port's type descriptor is created in exactly one library

#### Scenario: An error from relocated machinery is still catchable

- **WHEN** a program guards an expression that calls a relocated procedure which signals an error —
  for example reading from a non-port or a closed port
- **THEN** the guard catches it, exactly as it did before the relocation, because the exception-handler
  chain is a single binding rather than one copy per library

#### Scenario: The substrate resolves on the manifest-driven doors too

- **WHEN** a door that resolves `(scheme base)` from the manifest starts up, and `(scheme base)`'s
  source imports the substrate
- **THEN** the substrate resolves through the same manifest and `(scheme base)` loads, rather than
  failing because an internal library was reachable only when baked

#### Scenario: Substrate names are not in scope in an ordinary program

- **WHEN** a program with no explicit import references a substrate name such as `rd-atom`,
  `rd-skip-ws`, or `%make-port`
- **THEN** compilation fails with an unbound-variable error, exactly as it did when those names were
  private to `(scheme base)`

#### Scenario: A relocated library reaches the substrate

- **WHEN** `(scheme read)` is compiled, whose `read` calls the reader helpers and the port accessors
- **THEN** it resolves them by importing the substrate, and `(scheme base)` does not export them

## MODIFIED Requirements

### Requirement: The public surface of (scheme base) is declared, not derived

The set of names each shipped library exports SHALL be **declared** in a single artifact of the
tree, and SHALL NOT be a mechanical consequence of which definitions the prelude happens to contain.
The declaration SHALL be a **partition**: it assigns each prelude definition to the library that
exports it, or marks it as belonging to no export list. A prelude definition that is not part of any
declared surface SHALL remain in its library's **body** — the exported procedures call it — while
being absent from the `export` list, so it is neither in scope in a program that imports the library
nor part of the published surface.

The partition MAY assign one definition to **more than one** library, which SHALL emit an
independent definition into each. This is the mechanism by which a name can serve both an internal
consumer and a standard library without either re-exporting the other's binding.

Which library's **body defines** a name and which library's **export list publishes** it SHALL be
separate questions, decidable independently **per library**: the declaration SHALL be able to assign a
definition to a library that defines it without exporting it. This is required because a library or
program may import two members of the set at once, and one name offered by two imports resolves
silently to whichever is found first rather than being reported — so a member that needs a name only
for its own body SHALL be able to keep it out of its export list.

Every derivation of an export list SHALL read that one declaration, so the Chez-hosted driver (which
resolves the committed `.sld` files) and the Chez-free portable derivation (which builds the baked
set from the compiler's baked-in prelude source) SHALL produce **identical export lists in identical
order** for every library they both derive. The order SHALL be the prelude's own definition order, so
the declaration's internal arrangement cannot affect emitted IR.

Adding a prelude definition SHALL force a visibility decision: a definition that is neither assigned
to a library nor declared as belonging to no export list SHALL fail a test that runs in the default
suite (one that does not require Chez), rather than defaulting to public. A declaration that has
rotted — a name assigned to a library the prelude no longer defines, a name that is a macro, a
duplicated export, or an assignment to a library that does not exist — SHALL be reported as an error
rather than silently producing a different surface.

The declared surface SHALL distinguish the tiers that make a name's status legible: names
R7RS-small defines, and **extensions**, which Emit adds with no R7RS home. A name exported only
because some consumer outside the library must resolve it SHALL record the reason it is exported;
the compiler is not such a consumer, since it imports the internal substrate directly rather than
reaching internals through `(scheme base)`.

#### Scenario: An internal helper is not in scope in a user program

- **WHEN** a program with no explicit import references a prelude-internal name such as `rd-atom`
  or `%map1`, and is compiled on any door
- **THEN** compilation fails with an unbound-variable error, while a program referencing a public
  name such as `map` in the same position still compiles and runs

#### Scenario: A new prelude definition cannot become public by accident

- **WHEN** a definition is added to the prelude and is neither assigned to a library's surface nor
  declared as belonging to none
- **THEN** the default (Chez-free) test suite fails, and the author's only ways forward are to
  declare the definition internal or to commit the diff that publishes it

#### Scenario: A rotted declaration is an error, not a silent surface change

- **WHEN** an export list is generated while the declaration assigns a name the prelude does not
  define, names a `define-syntax`, would yield a duplicate export, or names an unknown library
- **THEN** generation fails with a message naming the offending names

#### Scenario: The two derivations agree

- **WHEN** the same program is compiled by the Chez-hosted driver and by the Chez-free portable
  derivation
- **THEN** both resolve each shipped library against the same export list in the same order, and the
  emitted program module is byte-identical between the two doors

#### Scenario: A private binding still serves the procedures that call it

- **WHEN** an exported procedure whose implementation calls a private helper (e.g. the reader's
  entry point over its lexeme helpers) is called from an importing program
- **THEN** it behaves exactly as before, because the helper is present in the library body or in the
  substrate the library imports, and those calls resolve without a public export

#### Scenario: A definition assigned to two libraries is emitted into both

- **WHEN** the partition assigns one definition to both an internal library and a standard one
- **THEN** each library's emitted unit defines it independently, and neither re-exports the other's
  binding

### Requirement: (scheme base) is library zero for the compiler's own build

The compiler binaries themselves — `schemec`, `embed` (the `scheme-run` runner), and `embed-repl`
(the REPL host) — SHALL consume the baked library set as linked libraries rather than carrying a
prepended copy of the prelude's procedures. Their source SHALL be compiled with `(scheme base)`
auto-imported (procedures resolving to `scheme.base:*` external globals, derived-form macros merged
compile-time), and MAY additionally import the internal substrate explicitly where the compiler uses
machinery that `(scheme base)` does not export — the compositional accessors its passes use, and the
reader lexeme helpers the REPL's input-completeness probe reuses. Each binary SHALL link the
committed IR for every member of the baked set, initializing each once via its `__init` guard.

This makes the baked set library zero for the compiler, the largest consumer of the module system,
exactly as it is for user programs. Because the compiler reaches internal machinery by importing the
substrate, no name SHALL be added to a standard library's export list solely to satisfy the
compiler.

#### Scenario: A compiler binary references the prelude through the baked set

- **WHEN** a compiler binary's committed IR is inspected
- **THEN** the prelude procedures it uses appear as external globals resolved against the linked
  baked-set IR, not as the binary's own inlined top-level definitions

#### Scenario: The compiler links each baked library exactly once

- **WHEN** any of the compiler binaries is built from committed IR
- **THEN** it links exactly one module per baked library and runs each `__init` once, and the binary
  behaves identically to the build it replaces

#### Scenario: The compiler's internal use does not widen a public surface

- **WHEN** the compiler uses a name that R7RS-small does not place in `(scheme base)`, such as
  `caddr` or a reader lexeme helper
- **THEN** it resolves that name by importing the substrate, and the name is absent from
  `(scheme base)`'s export list
