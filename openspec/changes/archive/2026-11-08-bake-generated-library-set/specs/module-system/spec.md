# Spec Delta

## MODIFIED Requirements

### Requirement: The baked library set is a partition emitted in dependency order

The compiler SHALL embed the generated library forms for the baked members of the declared
partition, rather than reconstructing their exports and bodies from raw prelude source. Each
member SHALL retain its own export list, body, and declared imports. The generated forms SHALL
be compiled and initialized in dependency order, after every member they import. The same
generated forms SHALL supply those members to every compiler host.

Every member of the baked set SHALL be reachable **without a manifest**, exactly as `(scheme base)`
is: the guarantee that a program importing only `(scheme base)` (or importing nothing) needs no
manifest present SHALL extend to whatever `(scheme base)` itself imports. A library the baked set
depends on SHALL NOT be resolved through the manifest.

**Every compiler host SHALL register the baked set before it consults the manifest.** This holds for
the Chez driver, the embedded host used by `emit run` and `emit build`, the REPL host, and `emit lib`
alike: a host SHALL NOT require a manifest entry to obtain the standard library, and the directory a command is invoked from
SHALL NOT determine whether the standard library is available. Registration makes each member's
export table and declared imports known to the compile session, so a program or library that imports
a baked member resolves it with no file access.

A host with no program entry to drive initialization - the REPL - SHALL additionally run each
registered member's initializer exactly once, in the dependency order the members were emitted in,
before it evaluates any user form. A host that emits a program SHALL continue to leave initialization
to the program's entry, which calls each `__init` in topological order as an AOT executable does.

**A manifest entry naming a member of the baked set SHALL resolve to the baked member** rather than
loading a second copy of that library. The determination SHALL be by library name, so it covers every
member of the set rather than an enumerated subset. A manifest that names a baked member SHALL
therefore remain valid on every compilation path and SHALL contribute no additional module, and a
manifest that names none SHALL work equally well.

A baked library MAY import another baked library. All compiler hosts - the Chez driver, the REPL's
eager preload, and the embedded host's lazy import closure and auto-import - SHALL handle a baked
library that has imports and SHALL continue to emit byte-identical modules across compilation paths
for the same program.

#### Scenario: A program with no imports needs no manifest, still

- **WHEN** a program that imports nothing (or only `(scheme base)`) is run from a directory with no
  manifest present, after the prelude has been partitioned into more than one baked library
- **THEN** it compiles and runs exactly as before, with no manifest consulted and no library
  resolution failure

#### Scenario: The baked set initializes in dependency order

- **WHEN** a program is compiled and the baked set contains a library that `(scheme base)` imports
- **THEN** that library's module is emitted before `(scheme base)`, its initializer runs before
  `(scheme base)`'s, and each initializer runs exactly once

#### Scenario: Compilation-path parity survives partitioning

- **WHEN** the same program is compiled through the AOT path, the `emit run` command, and the Chez-hosted
  driver against the same partition
- **THEN** the emitted program module is byte-identical across all three, as it was before the
  prelude was partitioned

#### Scenario: Every command has the standard library without a manifest entry for it

- **WHEN** each of the four commands is exercised in a directory whose manifest names only a project's
  own libraries and no member of the baked set
- **THEN** every command resolves `(scheme base)`, so a program referencing a standard-library name
  compiles and runs, a REPL session resolves that name, and a library importing `(scheme base)`
  compiles to its artifact

#### Scenario: A manifest entry for a baked member loads no second copy

- **WHEN** a command starts against a manifest that names `(scheme base)` and the internal substrate,
  after the baked set has been registered
- **THEN** each baked member contributes exactly one module to the session, the manifest entry
  resolves to the baked member, and no duplicate-symbol failure occurs

#### Scenario: The REPL initializes the baked set before the first form

- **WHEN** a REPL session starts with the prelude enabled and the user's first form calls a
  standard-library procedure
- **THEN** each baked member's initializer has already run, in dependency order, and the call
  observes populated globals

### Requirement: The public surface of (scheme base) is declared, not derived

The set of names each shipped library exports SHALL be **declared** in a single artifact of the
tree, and SHALL NOT be a mechanical consequence of which definitions the prelude happens to contain.
The declaration SHALL be a **partition**: it assigns each prelude definition to the library that
exports it, or marks it as belonging to no export list. A prelude definition that is not part of any
declared surface SHALL remain in its library's **body** - the exported procedures call it - while
being absent from the `export` list, so it is neither in scope in a program that imports the library
nor part of the published surface.

The partition MAY assign one definition to **more than one** library, which SHALL emit an
independent definition into each. This is the mechanism by which a name can serve both an internal
consumer and a standard library without either re-exporting the other's binding.

Which library's **body defines** a name and which library's **export list publishes** it SHALL be
separate questions, decidable independently **per library**: the declaration SHALL be able to assign a
definition to a library that defines it without exporting it. A library or program may import two members at once, and distinct bindings exposed under one
name SHALL conflict, so a member that needs a name only for its own body SHALL be able to keep it
out of its export list. Integrated primitive and core/auxiliary syntax publication SHALL also
have explicit library ownership, without inventing runtime definitions for those bindings.

The generator SHALL read that one declaration and preserve the prelude's own definition order
in each export list. The Chez-hosted driver and embedded compiler SHALL consume the same generated
library forms, from committed files or embedded copies respectively, with identical export lists
in identical order. The declaration's internal arrangement SHALL NOT affect emitted IR.

Adding a prelude definition SHALL force a visibility decision: a definition that is neither assigned
to a library nor declared as belonging to no export list SHALL fail a test that runs in the default
suite (one that does not require Chez), rather than defaulting to public. A declaration that has
rotted - a name assigned to a library the prelude no longer defines, a
duplicated export, or an assignment to a library that does not exist - SHALL be reported as an error
rather than silently producing a different surface.

The declared surface SHALL distinguish the tiers that make a name's status legible: names
R7RS-small defines, and **extensions**, which Emit adds with no R7RS home. A name exported only
because some consumer outside the library must resolve it SHALL record the reason it is exported;
the compiler is not such a consumer, since it imports the internal substrate directly rather than
reaching internals through `(scheme base)`.

The non-R7RS list extensions `filter`, `fold-right`, and `iota` SHALL be exported by
`(emit list)`, not by `(scheme base)`. The compiler SHALL retain its internal access
without adding these extensions to the implicit user environment.

#### Scenario: Emit list extensions require an explicit import

- **WHEN** a program imports `(scheme base)` and `(emit list)`
- **THEN** `filter`, `fold-right`, and `iota` retain their existing Emit behavior
- **AND** those names are not exported by `(scheme base)` alone

#### Scenario: Standard base and SRFI 1 imports do not conflict

- **WHEN** an unchanged pinned package imports `(scheme base)` and `(srfi 1)`
- **THEN** the three list names denote the SRFI 1 bindings without an import conflict
- **AND** importing distinct Emit and SRFI 1 versions under the same visible names still conflicts

#### Scenario: An internal helper is not in scope in a user program

- **WHEN** a program with no explicit import references a prelude-internal name such as `rd-atom`
  or `%map1`, and is compiled on any path
- **THEN** compilation fails with an unbound-variable error, while a program referencing a public
  name such as `map` in the same position still compiles and runs

#### Scenario: A new prelude definition cannot become public by accident

- **WHEN** a definition is added to the prelude and is neither assigned to a library's surface nor
  declared as belonging to none
- **THEN** the default (Chez-free) test suite fails, and the author's only ways forward are to
  declare the definition internal or to commit the diff that publishes it

#### Scenario: A rotted declaration is an error, not a silent surface change

- **WHEN** an export list is generated while the declaration assigns a name the prelude does not
  define, would yield a duplicate export, or names an unknown library
- **THEN** generation fails with a message naming the offending names

#### Scenario: The two derivations agree

- **WHEN** the same program is compiled by the Chez-hosted driver and by the Chez-free portable
  derivation
- **THEN** both consume the same generated library forms with the same export order, and the
  emitted program module is byte-identical between the two paths

#### Scenario: A private binding still serves the procedures that call it

- **WHEN** an exported procedure whose implementation calls a private helper (e.g. the reader's
  entry point over its lexeme helpers) is called from an importing program
- **THEN** it behaves exactly as before, because the helper is present in the library body or in the
  substrate the library imports, and those calls resolve without a public export

#### Scenario: A definition assigned to two libraries is emitted into both

- **WHEN** the partition assigns one definition to both an internal library and a standard one
- **THEN** each library's emitted unit defines it independently, and neither re-exports the other's
  binding

### Requirement: Implicit import of (scheme base)

Unless `--no-prelude` is given, the compiler SHALL make the prelude available to a user
program (and REPL session) without an explicit import, as though it began with `(import
(scheme base))`: the prelude procedures resolve to `(scheme base)` and the derived-form macro
set is merged into the compile's `macro-env`. This SHALL hold identically on all three paths -
the Chez batch driver, the REPL, and the Chez-free embedded runner (`scheme-run` /
`scheme-compile`): on each, the procedures resolve as imported bindings referencing `scheme.base`
external globals and `scheme.base.ll` is linked/loaded/concatenated into the result. On the
Chez-free embedded runner, `(scheme base)` is compiled from its embedded generated library
form with no filesystem access, so the runner imports rather than prepends. A name the
program defines itself SHALL take precedence over the auto-imported one (user-wins shadowing, per
the Stage 0 resolution order).

When a program's own imports include explicit views of `(scheme base)`, their union SHALL be
the program's whole view of `(scheme base)`: the implicit import SHALL NOT also make the
library's other exports visible. `(scheme base)` is still linked or loaded and
initialized exactly as for the implicit import. A bare `(import (scheme base))` is the same view as
the implicit one and changes nothing.

#### Scenario: A program uses prelude procedures with no explicit import

- **WHEN** a program that references only prelude procedures (e.g. `(map (lambda (x) (+ x 1))
  '(1 2 3))`) is compiled without `--no-prelude` and without any `import`
- **THEN** it builds and runs; on every path the prelude procedures resolve to
  `(scheme base)` exports and `scheme.base.ll` is linked/loaded/concatenated into the result

#### Scenario: A derived-form macro works without a prepended prelude

- **WHEN** a program uses `cond`/`case`/`when` without `--no-prelude` on any path
- **THEN** the derived-form macro expands correctly (its expansion's procedure calls resolve
  to `(scheme base)` exports) and the program produces the expected value

#### Scenario: A user definition shadows an auto-imported prelude name

- **WHEN** a program defines its own top-level `map` while the prelude is enabled
- **THEN** references to `map` resolve to the program's own definition, not the `(scheme base)`
  export

#### Scenario: --no-prelude skips both halves

- **WHEN** a program is compiled `--no-prelude` (on any path, including the embedded runner)
- **THEN** `(scheme base)` is not auto-imported, the derived-form macros are not merged, and a
  reference to a runtime prelude procedure or derived macro is an unbound/undefined error
- **AND** the explicit compiler environment retains core syntax and integrated primitives

#### Scenario: The embedded runner re-homes the prelude like the Chez driver

- **WHEN** a prelude-using program is compiled by the Chez-free embedded runner
  (`scheme-run --emit`) and by the Chez batch driver, both with the prelude enabled
- **THEN** both resolve prelude procedures through `(scheme base)` and emit byte-identical
  program IR - the embedded runner consumes the generated `(scheme base)` form from its
  embedded copy instead of reading `lib/scheme/base.sld` from disk

#### Scenario: An explicit import set narrows the implicit import

- **WHEN** a program contains `(import (except (scheme base) map))` and references `map` without
  defining it
- **THEN** compilation reports `map` as unbound, on every path

#### Scenario: A prefixed (scheme base) is the program's only spelling

- **WHEN** a program contains `(import (prefix (scheme base) b:))` and evaluates
  `(b:map (b:lambda (x) (b:+ x 1)) (b:quote (1 2)))`
- **THEN** the program produces `(2 3)`, and an unprefixed reference to `map` is reported as unbound
- **AND** integrated primitives and core syntax are available under their prefixed names only, unless another import or local binding supplies a bare name

#### Scenario: Explicit base views replace the implicit view together

- **WHEN** a program explicitly imports multiple sets over `(scheme base)`
- **THEN** the union of those explicit views replaces the implicit binding view, with duplicate and conflicting names checked normally

#### Scenario: A REPL replaces its implicit base view

- **WHEN** a session's first explicit base import uses a prefix or selection set
- **THEN** its complete explicit view replaces the implicit view for subsequent forms while existing compiled procedures retain their resolved bindings
- **AND** additional explicit imports accumulate subject to conflict validation

## ADDED Requirements

### Requirement: Standard-library generation is portable and deterministic

Standard-library generation SHALL run without Chez using Emit, with explicit prelude, declaration, and output locations. The same generation logic SHALL run under Chez and produce byte-identical files for every declared partition member. Generated bytes SHALL be independent of temporary directory names and verbosity.

#### Scenario: Independent hosts generate the complete partition

- **WHEN** Emit and Chez generate libraries from identical prelude and declaration inputs into separate temporary roots
- **THEN** the declared member sets and every generated file are byte-identical, including non-baked members

#### Scenario: Generation needs no general evaluator or implicit input paths

- **WHEN** a caller selects alternative prelude and declaration inputs and an empty output root without Chez on PATH
- **THEN** Emit generates the selected partition without reading default inputs or requiring a general-purpose evaluator

### Requirement: Invalid surface declarations have executable diagnostic coverage

The generation test suite SHALL exercise every supported declaration guard with isolated invalid inputs, asserting nonzero status and the guard-specific diagnostic and offending name or row. Valid controls SHALL succeed, including private macros and supported re-exports. Retired guards SHALL NOT be reintroduced solely to match an older issue inventory.

#### Scenario: Partition declarations fail at the intended guard

- **WHEN** separate fixtures introduce a stale private name, stale assignment, duplicate assignment, unknown home library, repeated home, missing elsewhere entry, or extra elsewhere entry
- **THEN** each fails with its expected diagnostic and offending name rather than merely any nonzero status

#### Scenario: Builtin declarations fail at the intended guard

- **WHEN** separate fixtures introduce duplicate builtin names, raw primitive exports, malformed builtin rows, invalid primitive extension ownership, invalid or duplicate write ownership, or inconsistent write identities
- **THEN** each fails with its expected diagnostic and offending name or row

#### Scenario: Every retained guard has a demonstrated trigger

- **WHEN** the guard coverage inventory is checked
- **THEN** every retained guard, including duplicate-export detection, has a fixture that reaches it, or an explicitly documented redundancy proof and removal
- **AND** an unexpected earlier error cannot satisfy the fixture

#### Scenario: A private macro remains valid

- **WHEN** a valid declaration marks an existing macro private
- **THEN** generation succeeds and the macro remains available to its library body without becoming a public export

### Requirement: Generated library freshness is checked without Chez

The default native checks SHALL regenerate the complete partition into an isolated tree using Emit and compare it with committed generated files. Missing, changed, extra generated members and invalid declarations SHALL fail. Checks SHALL NOT rewrite the checkout. Explicit regeneration and isolated source verification SHALL include generation inputs and embedded forms in their source accounting.

#### Scenario: A stale generated body cannot pass on a matching export list

- **WHEN** a committed generated file has the correct export list but a changed body
- **THEN** the Chez-free whole-file guard fails and preserves a useful mismatch diagnostic

#### Scenario: Checking detects mismatched membership without repair

- **WHEN** a generated member is missing or an orphan generated file remains
- **THEN** the guard fails without changing committed files

#### Scenario: Ordinary build remains independent of generation

- **WHEN** a clean source release is built from committed bootstrap IR with Chez unavailable
- **THEN** the build succeeds without invoking regeneration or silently rewriting generated libraries

#### Scenario: Working-tree generation changes enter the source proof

- **WHEN** isolated source verification is run with edited generation inputs or generated members
- **THEN** it includes those working-tree inputs and fails for stale or missing members rather than accepting a dirty matching fingerprint as proof
