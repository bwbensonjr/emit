# module-system Specification

## Purpose

Defines the compiler's separate-compilation foundation: how free identifiers are resolved
into typed bindings (local, imported, or primitive), how a compilation unit's own emitted
symbols are named through a deterministic, unit-parameterized function so that separately
compiled units do not collide at link time, and the byte-identity guarantee that this
scaffolding introduces no behavior change for programs that import no library. It covers the
Modules v0 design's separate compilation of `define-library` units into artifacts that are
both linked into an AOT executable and loaded into the REPL: the library/export/import
surface (including export-rename), transitive lib→lib imports with topological dependency
ordering and diamond-safe one-time initialization, and stale-artifact rebuild driven by a
readable manifest.
## Requirements
### Requirement: Typed binding resolution

Free-identifier resolution SHALL classify every resolved binding by a kind — `local` (the
current unit's own top-level definition), `imported` (another unit's export), or `primitive`
(a built-in operator/keyword) — resolving lexical locals first, then the unit's own
top-level definitions, then imported bindings, then primitives, and otherwise reporting an
unbound-variable error. In this change no imported bindings exist yet; the resolution
results for any program that imports no library SHALL be identical to the prior flat model.

#### Scenario: A program's own top-level define resolves as local

- **WHEN** a program references a name it defines at top level
- **THEN** resolution classifies the binding as `local`
- **AND** the emitted reference targets the same global the flat model produced

#### Scenario: A primitive resolves as primitive

- **WHEN** a program references a built-in operator or keyword (e.g. `car`, `if`)
- **THEN** resolution classifies it as `primitive` and emits the same intrinsic as before

#### Scenario: An unbound identifier still errors

- **WHEN** a program references a name that is neither local, imported, nor primitive
- **THEN** resolution reports an unbound-variable error, as it did before

### Requirement: Deterministic module-qualified symbol naming

The compiler SHALL name a compilation unit's own emitted symbols — top-level globals and
lifted code-block labels — through a deterministic, unit-parameterized function. For a
library named `(p₁ p₂ … pₙ)` and an internal name `x`, the function SHALL produce the symbol
`p₁.p₂.….pₙ:x`, a pure function of the library name and the internal name with no dependence
on compile order or counters. The **program** (non-library) unit SHALL use the empty prefix,
so its emitted symbol names are unchanged from today.

#### Scenario: Library name maps to a canonical symbol

- **WHEN** the naming function is applied to library `(scheme base)` and internal name `map`
- **THEN** it returns the symbol string `scheme.base:map`

#### Scenario: The same input always yields the same symbol

- **WHEN** the naming function is applied twice to the same `(library, name)` pair, in
  separate compilations
- **THEN** it returns the identical symbol both times (no counter or order dependence)

#### Scenario: Program-unit symbols are unprefixed

- **WHEN** a lifted code block or top-level global is emitted for the program unit (no
  enclosing library)
- **THEN** its symbol name is exactly what the pre-change compiler emitted (empty prefix)

### Requirement: Scaffolding preserves emitted IR

Introducing the typed-scope resolver and the unit-parameterized naming SHALL NOT change the
LLVM IR emitted for any program that imports no library **and** is compiled `--no-prelude`.
The compiler's own regenerated IR (`bootstrap/*.ll`) SHALL remain a stable self-hosting fixed
point after any change. Re-homing the prelude as `(scheme base)` intentionally changes the
emitted IR of a prelude-enabled program (its prelude procedures become imported externals and
`scheme.base.ll` is linked/loaded); such a program's observable **behavior** (its printed
value) SHALL be unchanged.

#### Scenario: Library-free, prelude-free programs emit byte-identical IR

- **WHEN** a program that imports no library is compiled `--no-prelude` before and after a
  change
- **THEN** the emitted `.ll` is byte-for-byte identical

#### Scenario: A prelude-using program's behavior is preserved across the re-home

- **WHEN** a demo that relies on prelude procedures is compiled and run before and after
  re-homing the prelude as `(scheme base)`
- **THEN** it prints the same value both times, even though its emitted IR changed

#### Scenario: Existing suites and the trust-check pass

- **WHEN** `run-all-tests.sh` and `run-dev-tests.sh` are run after `make regen`
- **THEN** all suites pass, including self-emission-equivalence and the anti-stale
  trust-check (regenerated committed IR is reproduced byte-for-byte from source)

### Requirement: Library definition and export surface

The compiler SHALL accept a `define-library` form naming a library `(p₁ … pₙ)` and
containing `(export …)` declarations and body definitions. Each `export` declaration lists
either a bare name `<name>` or a rename pair `(rename <internal> <external>)`. The
**internal** name (the bare name, or `<internal>` in a rename) MUST be a name the library
defines at its top level; exporting a name the library does not define SHALL be a
compile-time error. The **external** name (the bare name, or `<external>` in a rename) is the
spelling under which importers see the binding. In this stage exports are procedures; `only`/
`except`/`prefix` import-set transforms remain out of scope.

A library body MAY contain, besides `define` and `define-syntax`, **commands** (expressions
evaluated for effect) and **`define-record-type`** declarations. Every body form SHALL be lowered;
no body form SHALL be discarded silently. The remaining R7RS library declarations — `include`,
`include-ci`, `include-library-declarations`, and `cond-expand` — remain out of scope.

A `define-record-type` in a library body SHALL introduce its whole group of bindings (descriptor,
constructor, predicate, accessors, and modifiers) as mutually visible top-level bindings of that
unit, so that sibling body forms MAY reference them and the `export` declaration MAY export them.

#### Scenario: A library exports a procedure it defines

- **WHEN** a `define-library (mylib)` defines a top-level procedure `greet` and declares
  `(export greet)`
- **THEN** the library compiles without error and `greet` is available to importers under
  the external name `greet`

#### Scenario: A library exports a procedure under a renamed external name

- **WHEN** a `define-library (mylib)` defines a top-level procedure `%fast-map` and declares
  `(export (rename %fast-map map))`
- **THEN** the library compiles without error, importers see the binding under the external
  name `map`, and the internal name `%fast-map` is not visible to importers

#### Scenario: Exporting an undefined name is an error

- **WHEN** a `define-library` declares `(export missing)` (or `(export (rename missing m))`)
  but defines no top-level `missing`
- **THEN** compilation reports a compile-time error naming the undefined export

#### Scenario: A library declares and exports a record type

- **WHEN** a `define-library (reclib)` body contains
  `(define-record-type point (make-pt x y) point? (x pt-x) (y pt-y))`, a sibling procedure that
  calls `pt-x`, and `(export make-pt pt-x)`
- **THEN** the library compiles without error, the sibling procedure resolves `pt-x` to the
  library's own binding, and an importing program can construct a `point` and read its field

### Requirement: A library body's commands run during initialization, in source order

A body form that is not a definition is a **command**. The compiler SHALL emit each command as part
of the library unit's one-time initialization, and SHALL evaluate the body's declarations in the
order they appear in the source, so that a command observes the definitions written above it and not
those written below it. A command SHALL NOT be discarded.

#### Scenario: A command in a library body is evaluated

- **WHEN** a library body defines a mutable cell, then contains a command that stores into it, then
  defines an accessor procedure, and a program imports the library and calls the accessor
- **THEN** the program observes the value the command stored

#### Scenario: Declarations are evaluated in source order

- **WHEN** a library body contains a command that appends to a log, a definition, and a second
  command that appends to the same log
- **THEN** the recorded order matches the source order of the two commands

#### Scenario: A top-level `set!` in a library body takes effect

- **WHEN** a library defines `f`, then contains the top-level command `(set! f <other-lambda>)`, and
  a program imports the library and calls `f`
- **THEN** the program observes the assigned value
- **AND** the export table records no call label for `f`, as for any binding its unit assigns

### Requirement: Whole-module import surface

The compiler SHALL accept a whole-module `(import (<lib>))` form that makes every export of
`<lib>` visible in the importing unit under its external name, resolved as an `imported`
binding. Import-set transforms (`only` / `except` / `prefix`) are out of scope for this
stage.

#### Scenario: An imported name becomes referenceable

- **WHEN** a program contains `(import (mylib))` and `mylib` exports `greet`
- **THEN** a reference to `greet` in the program resolves to the imported binding rather than
  reporting an unbound-variable error

### Requirement: Library artifact emission

Compiling a `define-library` SHALL emit an LLVM module (the library unit) that:
contains one external-linkage global per exported binding, named by the Stage 0 symbol namer
(`@"p₁.….pₙ:x"`); contains an initialization function `@"L:__init"` that runs the library's
top-level definitions to populate those globals and is guarded by a one-shot flag
(`@"L:__inited"`) so repeated calls run the body at most once; names the library's internal
top-levels and lifted code blocks through the same unit-qualified namer; and defines **no**
`@scheme_entry`. Library-free programs SHALL remain byte-identical to Stage 0 (only library
units carry the qualified names).

#### Scenario: The library unit exposes exports and an init, not an entry

- **WHEN** `(mylib)` exporting `greet` is compiled to its unit module
- **THEN** the module declares `@"mylib:greet"` with external linkage, defines `@"mylib:__init"`,
  and defines no `@scheme_entry`

#### Scenario: Init runs the body at most once

- **WHEN** `@"mylib:__init"` is called more than once
- **THEN** the library's top-level definitions execute on the first call only (the
  `@"mylib:__inited"` guard suppresses re-execution)

#### Scenario: A library-free program is unchanged

- **WHEN** a program that imports no library is compiled after this change
- **THEN** its emitted IR is byte-for-byte identical to the Stage 0 output

### Requirement: Library export table

Alongside the library unit the compiler SHALL produce a readable export table mapping each
export's **external** name to the **internal-name-based** mangled symbol (procedures only; a
macro slot is reserved but unused). For a bare export the external name equals the internal
name; for `(rename <internal> <external>)` the table key is `<external>` while the mangled
symbol is derived from `<internal>`. A driver reading the table together with the unit module
SHALL have everything needed to resolve references into the library with no access to the
library's source.

For an export whose top-level initializer is a **lambda of fixed arity**, the table SHALL
additionally record the binding's **code label** and that arity, so that a program compiled
against the table alone can emit a direct call to the procedure's code without loading a code
pointer out of its closure. Exports that are not fixed-arity lambdas SHALL record no label, and
calls to them SHALL continue to be lowered indirectly.

The table SHALL record a code label only for a binding whose slot cannot be reassigned after the
unit's initialization. A binding that the defining unit itself **assigns** SHALL therefore record
no label, however its initializer is shaped, and calls to it SHALL be lowered indirectly. This is
the property a cross-unit direct call depends on: an importer learns a callee's label only from
this table, so withholding the label is what keeps a direct call from binding code that the slot no
longer points to. The binding SHALL still be exported and callable.

#### Scenario: Export table maps external name to mangled symbol

- **WHEN** `(mylib)` exporting `greet` is compiled
- **THEN** its export table records that external name `greet` maps to symbol
  `mylib:greet`

#### Scenario: A renamed export keys on the external name but mangles the internal name

- **WHEN** `(mylib)` declares `(export (rename %fast-map map))`
- **THEN** its export table records that external name `map` maps to symbol
  `mylib:%fast-map`

#### Scenario: A procedure export records its code label and arity

- **WHEN** `(mylib)` exports `greet`, defined as a two-argument lambda
- **THEN** its export table additionally records `greet`'s code label and the arity 2
- **AND** a program that imports `(mylib)` can emit a call to that label without reading the
  library's source or its unit module

#### Scenario: A non-procedure export records no label

- **WHEN** `(mylib)` exports a value binding, or a procedure of variable arity
- **THEN** the table records no code label for it, and calls to it are lowered indirectly

#### Scenario: An export the unit assigns records no label

- **WHEN** `(mylib)` exports `f`, defined as a fixed-arity lambda, and some procedure in `(mylib)`
  assigns `f`
- **THEN** the export table records `f`'s mangled symbol but no code label for it
- **AND** an importing program lowers every call to `f` indirectly, reading the slot on each call

#### Scenario: The stable label is not claimed twice within a unit

- **WHEN** a library defines `f` as a top-level lambda and also assigns a lambda to `f` from inside
  another procedure's body
- **THEN** only the top-level initializer takes the stable, name-derived label `mylib:code:f`; the
  assigned lambda is hoisted under an ordinary counter-derived label
- **AND** the emitted unit defines each code label exactly once and links

### Requirement: Library procedure code labels are stable across pruning

A library top-level procedure's code label SHALL be derived from its mangled binding name rather
than from the compilation's gensym counter, so that the label is identical whether the unit is
compiled whole or recompiled as a tree-shaken subset. Labels for inner and anonymous lambdas, and
for all program-unit code, SHALL be unaffected.

This is what makes a cross-unit direct call possible at all: the AOT tree-shake recompiles a unit
against a root set derived from the very program that must name the callee, so a counter-derived
label is not knowable by that program.

#### Scenario: The same procedure has the same label whole and pruned

- **WHEN** a library is compiled whole, and then recompiled as a tree-shaken subset that still
  contains a given exported procedure
- **THEN** that procedure's code label is identical in both units

#### Scenario: Program-unit and inner-lambda labels are unchanged

- **WHEN** a program with nested and anonymous lambdas is compiled
- **THEN** its code labels are numbered exactly as before this change

### Requirement: A library unit may assign its own top-level binding

A compilation unit SHALL be permitted to `set!` a name it defines at its own top level, per R7RS
§5.3.1 (a definition introduces a mutable location). The assignment SHALL store into that unit's
global slot, so that every subsequent read of the binding — from within the unit, and from every
importing unit or program — observes the assigned value.

Assignment to a binding the unit does **not** own SHALL remain an error: an **imported** binding
(the slot belongs to the exporting unit) and a **primitive** (there is no slot) SHALL both be
rejected at compile time with a diagnostic. A REPL session global SHALL remain assignable.

#### Scenario: A library assigns its own exported procedure

- **WHEN** a library defines `f` and also defines `bump` as a procedure whose body is
  `(set! f <new-lambda>)`, and the library is compiled
- **THEN** the library compiles without error
- **AND** an importing program that calls `f`, then calls `bump`, then calls `f` again observes the
  original value first and the assigned value second

#### Scenario: Assignment to an imported binding is still rejected

- **WHEN** a library imports `(scheme base)` and its body assigns an imported name such as
  `(set! car …)`
- **THEN** compilation fails with a diagnostic naming the binding, and no unit is emitted

### Requirement: Tree-shaking covers a body form that defines no name

The closed-world AOT tree-shake SHALL preserve the meaning of a pruned unit for every body-form
shape. A form that defines **no** name — a command — SHALL always be kept, and the unit's own
bindings it references SHALL be treated as reachability roots, so that the shake cannot prune a
binding a surviving command calls.

A command's effects are not modelled by reachability analysis, so a command SHALL NOT be dropped on
the grounds that nothing references it; dropping one would reintroduce the silent
lost-initialization failure this behaviour exists to prevent.

A record type's bindings SHALL be reachable independently of one another. Each of the constructor,
predicate, accessors, and modifiers references the type's descriptor, so reaching any one of them
keeps the descriptor; reaching one SHALL NOT require keeping the others.

#### Scenario: A pruned unit still runs its commands

- **WHEN** a program imports a library with a command in its body and is built through the AOT
  tree-shaking path
- **THEN** the pruned unit still contains the command, and the program's value matches the value it
  has when the unit is compiled whole

#### Scenario: A command's references survive pruning

- **WHEN** a library body's command calls a procedure the library defines but the importing program
  never references
- **THEN** the pruned unit still defines that procedure, and the program links

#### Scenario: A reached record accessor keeps the descriptor it needs

- **WHEN** a program reaches a library's record constructor and one accessor, and is built through
  the tree-shaking path
- **THEN** the pruned unit defines the record type's descriptor alongside them, and the program
  links and reads the field correctly

### Requirement: Imported binding resolution

Free-identifier resolution SHALL resolve an imported name against an in-memory import
environment (built from the imported libraries' export tables), classifying it as an
`imported` binding whose symbol is the exporter's mangled symbol, and SHALL emit a reference
to it as an `external global` resolved by name at link/load time. The importing unit SHALL
NOT define that global. A name the importing unit defines itself SHALL take precedence over
an imported name of the same spelling.

#### Scenario: Imported reference emits an external global

- **WHEN** a program importing `(mylib)` references the exported `greet`
- **THEN** resolution classifies `greet` as `imported` with symbol `mylib:greet` and the
  program module references it as an external global it does not define

#### Scenario: A local definition shadows an import

- **WHEN** a program imports `(mylib)` (which exports `greet`) but also defines its own
  top-level `greet`
- **THEN** references to `greet` resolve to the program's own definition, not the import

### Requirement: Program initialization ordering

A program that imports libraries SHALL, in its `@scheme_entry`, call the imported libraries'
`@"L:__init"` functions in an order consistent with the dependency graph — every library's
`__init` runs after the `__init`s of the libraries it depends on and before the program body
— so every imported global (direct or transitive) is populated before first use.

#### Scenario: A transitive dependency is initialized before its dependents

- **WHEN** a program imports `(a)`, `(a)` imports `(b)`, and the program body uses an export
  of `(a)` that internally calls an export of `(b)`
- **THEN** `@scheme_entry` calls `@"b:__init"` before `@"a:__init"` and both before the
  program body, and the call observes both globals populated

#### Scenario: Imported library is initialized before the program body

- **WHEN** a program imports `(mylib)` and calls `greet` in its body
- **THEN** `@scheme_entry` calls `@"mylib:__init"` before the body runs, and the call to
  `greet` observes the populated global

### Requirement: AOT door — build and link an importing program

An import-aware build path SHALL resolve a program's imports (and each library's imports)
through the manifest to their sources, build the transitive dependency graph, reject import
cycles with a compile-time error, compile each unit against the import environment built from
its dependencies' export tables, and link the program module, every unit in the transitive
closure, and the runtime into a single working executable in dependency order. A library that
is not in the program's transitive import closure SHALL NOT be linked.

#### Scenario: A program importing a library builds and runs

- **WHEN** the build path is run on a program that imports `(mylib)` and prints the result of
  `greet`
- **THEN** it produces an executable that, when run, prints the value `greet` returns

#### Scenario: A transitive import chain builds and runs

- **WHEN** the build path is run on a program that imports `(a)` where `(a)` imports `(b)`
- **THEN** it compiles `(b)`, `(a)`, and the program, links all three plus the runtime, and
  the resulting executable runs correctly

#### Scenario: An import cycle is reported

- **WHEN** the build path resolves a graph in which `(a)` imports `(b)` and `(b)` imports `(a)`
- **THEN** it reports a compile-time error naming the cycle rather than looping or linking

### Requirement: REPL door — import a library interactively

The interactive REPL SHALL, on evaluating `(import (<lib>))`, resolve the library and its
transitive dependencies through the manifest, load each unit module into the running session
in dependency order, invoke each unit's `@"L:__init"` exactly once, and merge the imported
library's export table into the session scope so subsequent forms may reference the imported
names.

#### Scenario: Imported procedure is callable in the REPL

- **WHEN** the user evaluates `(import (mylib))` and then calls `greet` in a later form
- **THEN** the REPL loads `mylib`, initializes it once, and the later form returns the value
  `greet` produces

#### Scenario: A transitive dependency is loaded and initialized in the REPL

- **WHEN** the user evaluates `(import (a))` where `(a)` imports `(b)`
- **THEN** the REPL loads both `b` and `a` in dependency order, initializes each once, and a
  later form calling an export of `(a)` that relies on `(b)` returns the expected value

### Requirement: Run door — run an importing program in-process (Chez-free)

The in-process runner (`emit run`) SHALL resolve a program's imports (and each
library's imports) through the manifest to their sources, build the transitive dependency
graph, reject import cycles with an error, load each unit in the transitive closure into the
running JIT session in dependency order, invoke each unit's initializer exactly once, and
then compile and run the program against the import environment built from its dependencies'
export tables — all without Chez and without a second library-resolution path (it drives the
same manifest resolution and compile-unit core the AOT and REPL doors use).

The manifest SHALL be located by the ordered procedure specified in the **Library manifest**
requirement — `--manifest FILE` first, then `EMIT_MANIFEST`, then `./emit-libs.scm`, then the
executable-relative and installed-prefix candidates — identically to every other door. When no
manifest is found and the program imports only `(scheme base)` (or imports nothing), the runner
SHALL behave exactly as before (no regression), since the manifest is consulted only to resolve a
non-baked-in imported library.

A library that is not in the program's transitive import closure SHALL NOT be initialized
or linked into the program's initialization sequence, so it can have no observable effect on
the run (the in-process JIT may inertly hold a unit's module without ever running its
initializer).

#### Scenario: A program importing a library runs in-process

- **WHEN** `emit run` runs a program that imports `(mylib)` and evaluates `greet`,
  with `(mylib)` listed in the manifest
- **THEN** it loads and initializes `mylib`, runs the program, and prints the value `greet`
  returns

#### Scenario: A transitive import chain runs in-process

- **WHEN** `emit run` runs a program that imports `(a)` where `(a)` imports `(b)`
- **THEN** it loads `(b)` and `(a)` in dependency order, initializes each once, and the
  program's value is printed correctly

#### Scenario: An import cycle is reported

- **WHEN** `emit run` runs a program whose import graph has `(a)` importing `(b)` and
  `(b)` importing `(a)`
- **THEN** it reports an error naming the cycle (or an unresolved/missing-from-manifest
  import) rather than looping, and exits non-zero

#### Scenario: A program with no user imports is unaffected

- **WHEN** `emit run` runs a program that imports only `(scheme base)` or imports
  nothing, with no manifest present
- **THEN** it behaves exactly as before this change — the value is identical and no manifest
  is required

#### Scenario: `--manifest` outranks the environment variable

- **WHEN** `emit run` is given `--manifest FILE` while `EMIT_MANIFEST` is also set to a
  different, existing manifest
- **THEN** the manifest named by `--manifest` is the one used

### Requirement: Run door matches the AOT door (dev→ship fidelity)

A program run through `emit run` with a given manifest SHALL produce the same value
as the same program built and run through the AOT door (`emit build`) with the same
manifest. The emitted program module and each imported unit's module SHALL be
byte-for-byte identical across the run and AOT doors, because all doors drive the same
compile-unit core.

#### Scenario: Run-door value matches AOT-door value

- **WHEN** an importing program is run via `emit run` and also built+run via the AOT
  door (`emit build`), with the same manifest
- **THEN** the two printed values are identical

#### Scenario: A unit's module bytes match across the run and AOT doors

- **WHEN** `(mylib)` is loaded by the run door and compiled for the AOT link
- **THEN** the two unit modules are byte-for-byte identical

### Requirement: Dev→ship fidelity for library units

A library unit's emitted module SHALL be byte-for-byte identical whether it is produced for
the AOT door or the REPL door, because both doors drive the same compile-unit core entry.

#### Scenario: A unit's module bytes match across doors

- **WHEN** `(mylib)` is compiled for the AOT link and for REPL loading
- **THEN** the two unit modules are byte-for-byte identical

### Requirement: Separately compiled units link without symbol collision

Two libraries compiled independently, each with an internal helper and lifted code blocks of the same spelling, SHALL link together into one program with no duplicate-symbol conflict, because every unit-owned symbol is qualified by the unit's library name.

#### Scenario: Two units with same-named internals coexist

- **WHEN** libraries `(liba)` and `(libb)` each define an internal `helper` and each lift
  code blocks, and a program imports both
- **THEN** the units link into one executable with no symbol collision and both libraries'
  exports work

### Requirement: Library manifest

Library discovery SHALL be driven by a readable s-expression manifest mapping each library name
to its source file and an optional artifact directory; compiled artifacts SHALL default under a
build directory rather than the source tree. The manifest MAY list any number of libraries.
Resolving an imported library that has no manifest entry SHALL be a compile-time error naming the
missing library. The standard library `(scheme base)` SHALL be resolvable through the manifest like
any other library, so both doors build/load it through the same machinery.

**Locating the manifest.** Every door SHALL locate the manifest by the same ordered procedure,
taking the first candidate that exists and is readable:

1. the `--manifest FILE` argument, when the door accepts one and it is given;
2. the `EMIT_MANIFEST` environment variable, when set;
3. `./emit-libs.scm`, relative to the current working directory;
4. `<dir of the resolved real path of the running executable>/../share/emit/emit-libs.scm`,
   where the executable's path SHALL be resolved through symbolic links so that a symlinked
   launcher locates the manifest installed beside the real binary;
5. a compiled-in installation default, `<install prefix>/share/emit/emit-libs.scm`.

Candidates 1 and 2 are explicit requests: when either is given but names a file that does not
exist, the door SHALL report that named file as missing rather than silently falling through to a
later candidate. Candidates 3–5 are searched, so a missing candidate is not an error. Finding no
manifest at all SHALL remain non-fatal — a program that imports only baked-in libraries runs
unaffected — and the resulting failure SHALL be reported by import resolution, naming the
unresolved library.

**Paths inside a manifest.** A relative path appearing in a manifest entry — a library's
`(source …)`, a program entry's `(source …)`, and a program entry's `(output …)` — SHALL be
resolved against the directory containing the manifest in which it appears, not against the
current working directory. An absolute path SHALL be used as given. A manifest therefore carries
its own library sources with it and resolves identically no matter which directory the door is
invoked from.

**Narration.** Each door SHALL narrate which manifest it resolved, on standard error, in the
project's tool-output format, suppressed at `EMIT_VERBOSITY=quiet` and never altering standard
output.

The manifest MAY additionally contain **program entries** of the form
`(program NAME (source S) [(output O)])`, where `NAME` is a bare symbol naming a
deliverable program, `source` names its top-level source file, and the optional
`output` names the delivered executable path. A program entry names a build target,
not a library: it is never a target of `import`, and reading the manifest to resolve
library imports SHALL ignore program entries (library resolution is unchanged by
their presence). Manifest reading SHALL accept a manifest that mixes library and
program entries in any order.

#### Scenario: Manifest resolves a library name to its source

- **WHEN** the manifest contains an entry mapping `(mylib)` to a source file and the build
  path resolves `(import (mylib))`
- **THEN** the library's source is located via the manifest and its artifacts are written
  under the configured (default `build/`) directory

#### Scenario: An unresolved import is reported

- **WHEN** a program (or library) imports `(nope)` and the manifest has no entry for `(nope)`
- **THEN** the build path reports a compile-time error naming the missing library

#### Scenario: (scheme base) resolves through the manifest

- **WHEN** the auto-import of `(scheme base)` (or an explicit `(import (scheme base))`) is
  resolved
- **THEN** `(scheme base)` is located through the manifest and compiled/loaded like any other
  library unit

#### Scenario: A program entry is parsed and does not affect library resolution

- **WHEN** the manifest mixes `(library (mylib) (source …))` and
  `(program my-app (source "app.scm"))` entries and a build resolves `(import (mylib))`
- **THEN** `(mylib)` resolves through the manifest exactly as before and the program
  entry is ignored during library resolution

#### Scenario: A program entry is resolvable by name

- **WHEN** the manifest contains `(program my-app (source "app.scm") (output "build/app"))`
  and the program `my-app` is looked up
- **THEN** the manifest yields its source (`app.scm`) and output (`build/app`), each resolved
  against the directory containing that manifest

#### Scenario: An installed manifest is found from an unrelated directory

- **WHEN** a door is invoked from a directory containing no `emit-libs.scm`, and a manifest is
  installed at `<prefix>/share/emit/emit-libs.scm` beside the running executable
- **THEN** the installed manifest is located through the executable-relative candidate and its
  libraries resolve, so a program importing a non-baked-in standard library runs successfully

#### Scenario: A symlinked executable locates its installed manifest

- **WHEN** the running executable is reached through a symbolic link whose own directory has no
  `../share/emit/emit-libs.scm`, while the link's target directory does
- **THEN** the executable's real path is resolved first, so the manifest beside the real binary
  is the one found

#### Scenario: Manifest sources resolve against the manifest's own directory

- **WHEN** a manifest at `<dir>/emit-libs.scm` maps `(mylib)` to the relative source
  `"mylib.sld"`, and a door is invoked from a different current working directory
- **THEN** the source is read from `<dir>/mylib.sld`, and the same manifest resolves identically
  regardless of the directory the door was invoked from

#### Scenario: An explicitly named manifest that is missing is reported

- **WHEN** `--manifest FILE` (or `EMIT_MANIFEST`) names a file that does not exist
- **THEN** the door reports that named file as missing and does not fall through to
  `./emit-libs.scm` or to an installed manifest

#### Scenario: The resolved manifest is narrated

- **WHEN** a door resolves a manifest at default verbosity
- **THEN** it names the resolved manifest path on standard error, and at
  `EMIT_VERBOSITY=quiet` that line is absent while standard output is byte-identical either way

### Requirement: Transitive library imports

A `define-library` SHALL be permitted to contain `(import (<other-lib>))` declarations. When
compiling such a library, the compiler SHALL build its import environment from the export
tables of the libraries it imports and resolve its free identifiers against that environment
exactly as it does for a program — a name exported by an imported library resolves to an
`imported` binding referencing the exporter's mangled symbol as an external global the
importing library does not define, with the library's own top-level definitions taking
precedence over an imported name of the same spelling.

#### Scenario: A library references another library's export

- **WHEN** `(a)` imports `(b)`, `(b)` exports `add1`, and `(a)`'s body calls `add1`
- **THEN** the reference to `add1` in `(a)` resolves to the `imported` binding `b:add1` and
  `(a)`'s emitted unit references it as an external global it does not define

#### Scenario: A library's own definition shadows a transitive import

- **WHEN** `(a)` imports `(b)` (which exports `helper`) but `(a)` also defines its own
  top-level `helper`
- **THEN** references to `helper` inside `(a)` resolve to `(a)`'s own definition, not `(b)`'s
  export

### Requirement: Diamond-safe one-time initialization

The compiler SHALL ensure a library reachable by more than one path in the transitive import
graph (a diamond) executes its top-level body exactly once across the whole program run, even
though its `@"L:__init"` may be invoked from more than one dependent — guaranteed by the
one-shot `@"L:__inited"` guard.

#### Scenario: A shared dependency initializes once in a diamond

- **WHEN** a program imports `(a)` and `(b)`, both of which import `(c)`, and `(c)`'s body has
  an observable one-time effect
- **THEN** running the program executes `(c)`'s body exactly once even though both `(a)` and
  `(b)` cause `@"c:__init"` to be invoked

### Requirement: Stale-artifact rebuild

The build driver SHALL rebuild a library's `.ll` and `.exports` artifacts when they are
missing, older than the library's source, **or produced by a different compiler**, and SHALL
reuse existing artifacts only when they are newer than the source **and** were produced by the
current compiler, so a multi-unit build does not recompile units whose source is unchanged yet
never reuses a unit compiled by a different (e.g. older) compiler.

Compiler identity SHALL be captured as a **compiler-identity stamp** — a version marker
combined with a content hash over the compiler sources that determine the emitted IR — and
SHALL be recorded alongside each unit's artifacts when they are written. An artifact whose
recorded stamp differs from the current compiler's stamp SHALL be treated as stale and
recompiled, even when its source is unchanged.

#### Scenario: A changed source triggers a rebuild

- **WHEN** a library's source is newer than its committed `.ll`/`.exports` artifacts (or the
  artifacts are absent) and a build resolves an import of that library
- **THEN** the driver recompiles the library, writing fresh `.ll` and `.exports`

#### Scenario: Fresh artifacts are reused

- **WHEN** a library's artifacts are newer than its source and carry the current compiler's
  identity stamp, and a build resolves an import of that library
- **THEN** the driver reuses the existing artifacts without recompiling the library

#### Scenario: A compiler change invalidates unchanged-source artifacts

- **WHEN** the compiler that determines emitted IR has changed (its identity stamp differs
  from the stamp recorded with a unit's artifacts) but the library's source is unchanged, and
  a build resolves an import of that library
- **THEN** the driver recompiles the library instead of reusing the stale artifact, so the
  emitted IR reflects the current compiler (e.g. a boolean literal re-encoding is not served
  from a unit compiled by the old emitter)

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

### Requirement: Prelude split into (scheme base) runtime and macro halves

The compiler SHALL treat the standard prelude as the library `(scheme base)`, split into two
halves driven from one prelude source: a **runtime half** — the prelude's procedure
definitions, compiled as a `(define-library (scheme base) …)` unit that exports its **declared
public surface** (see "The public surface of (scheme base) is declared, not derived") and is
linked (AOT) / loaded (REPL) like any library — and a **compile-time half** — the
prelude's derived-form macros (`and`, `or`, `when`, `unless`, `let*`, `cond`, `case`,
`guard`, and their helpers), carried by the compiler as a macro set rather than emitted into
the artifact. The runtime half SHALL be compiled with the derived-form macros in scope,
because prelude procedures use them internally. Every prelude definition SHALL be present in the
unit's body whether or not it is exported, so a private helper is available to the procedures that
call it. The two halves SHALL stay consistent with the
single prelude source (no divergent hand-maintained copies).

#### Scenario: The runtime half is a linkable/loadable library exporting the prelude procedures

- **WHEN** `(scheme base)` is compiled
- **THEN** it produces `scheme.base.ll` + `scheme.base.exports` exporting the prelude's declared
  public procedures (e.g. `map`, `assq`, `append`) and not its internal helpers, with a guarded
  `@"scheme.base:__init"` and no `@scheme_entry`

#### Scenario: The runtime half compiles using the derived-form macros

- **WHEN** a prelude procedure whose body uses `cond`/`case` (e.g. `case` expands to `memv`)
  is compiled into the `(scheme base)` unit
- **THEN** the derived-form macros are in scope for that compilation and the unit compiles
  without an unbound-macro error

#### Scenario: Curating the surface does not change the library's emitted code

- **WHEN** names are removed from `(scheme base)`'s export list with no change to the prelude's
  definitions
- **THEN** the emitted library IR is byte-identical (library emission and code labels are derived
  from binding names, not export status), and only importing **program** modules change — each loses
  one external-global declaration per removed export

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

### Requirement: A name an exported macro template mentions is exported under that spelling

A macro a library exports (or that the compiler carries as `(scheme base)`'s compile-time half) is
instantiated in the **importer's** scope. Therefore every name its template mentions that is not a
core form, a primitive, or a binding the template itself introduces SHALL be exported by that library
under **exactly the spelling the template uses**; otherwise the expansion's reference is subject to
hygienic renaming in the importer and fails as an unbound variable at lowering.

It follows that `(rename internal external)` SHALL NOT be used to hide a name a template mentions:
the renamed export keys the importer's environment under the external name, leaving the internal
spelling in the template unresolvable. A name a template mentions that is not intended as public API
SHALL instead be recorded in the declared surface as exported-but-unstable, with its reason, or the
template SHALL be rewritten to mention only public names.

#### Scenario: A derived form whose template calls a helper works in an importing program

- **WHEN** a program with no explicit import uses a derived form whose expansion calls a prelude
  procedure (e.g. `guard`, whose template calls the handler installer, or `parameterize`)
- **THEN** the expansion compiles and runs, because that procedure is exported under the spelling
  the template uses

#### Scenario: Hiding a template's helper by renaming it away breaks the form

- **WHEN** a name a template mentions is exported only under a different external name via
  `(rename …)`
- **THEN** a program using that derived form fails to compile with an unbound variable, which is why
  the mechanism is prohibited for template names

### Requirement: Implicit import of (scheme base)

Unless `--no-prelude` is given, the compiler SHALL make the prelude available to a user
program (and REPL session) without an explicit import, as though it began with `(import
(scheme base))`: the prelude procedures resolve to `(scheme base)` and the derived-form macro
set is merged into the compile's `macro-env`. This SHALL hold identically on all three doors —
the Chez batch driver, the REPL, and the Chez-free embedded runner (`scheme-run` /
`scheme-compile`): on each, the procedures resolve as imported bindings referencing `scheme.base`
external globals and `scheme.base.ll` is linked/loaded/concatenated into the result. On the
Chez-free embedded runner, `(scheme base)` is compiled from the compiler's baked-in prelude
source with no filesystem access, so the runner re-homes rather than prepends. A name the
program defines itself SHALL take precedence over the auto-imported one (user-wins shadowing, per
the Stage 0 resolution order).

#### Scenario: A program uses prelude procedures with no explicit import

- **WHEN** a program that references only prelude procedures (e.g. `(map (lambda (x) (+ x 1))
  '(1 2 3))`) is compiled without `--no-prelude` and without any `import`
- **THEN** it builds and runs; on every door the prelude procedures resolve to
  `(scheme base)` exports and `scheme.base.ll` is linked/loaded/concatenated into the result

#### Scenario: A derived-form macro works without a prepended prelude

- **WHEN** a program uses `cond`/`case`/`when` without `--no-prelude` on any door
- **THEN** the derived-form macro expands correctly (its expansion's procedure calls resolve
  to `(scheme base)` exports) and the program produces the expected value

#### Scenario: A user definition shadows an auto-imported prelude name

- **WHEN** a program defines its own top-level `map` while the prelude is enabled
- **THEN** references to `map` resolve to the program's own definition, not the `(scheme base)`
  export

#### Scenario: --no-prelude skips both halves

- **WHEN** a program is compiled `--no-prelude` (on any door, including the embedded runner)
- **THEN** `(scheme base)` is not auto-imported, the derived-form macros are not merged, and a
  reference to a prelude name (procedure or macro) is an unbound/undefined error

#### Scenario: The embedded runner re-homes the prelude like the Chez driver

- **WHEN** a prelude-using program is compiled by the Chez-free embedded runner
  (`scheme-run --emit`) and by the Chez batch driver, both with the prelude enabled
- **THEN** both resolve prelude procedures through `(scheme base)` and emit byte-identical
  program IR — the embedded runner assembles `(scheme base)` from baked-in prelude source
  instead of reading `lib/scheme/base.sld` from disk

### Requirement: (scheme base) links or loads exactly once

The compiler SHALL link `(scheme base)` into an executable exactly once and initialize it
exactly once even when it is auto-imported alongside explicit imports, guaranteed by the
transitive-closure dedup and the one-shot `@"scheme.base:__inited"` guard.

#### Scenario: Auto-import plus explicit import links (scheme base) once

- **WHEN** a program is compiled with the prelude enabled and also explicitly imports another
  library
- **THEN** `scheme.base.ll` appears exactly once in the link and its `__init` runs once

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
