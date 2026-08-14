## MODIFIED Requirements

### Requirement: The AOT build tree-shakes unreachable library bindings

Under the closed-world assumption of an AOT build (a sealed program with no further definitions or
redefinitions, and no `eval`/dynamic name lookup), the AOT backend SHALL omit library and prelude
bindings that are not transitively reachable from an explicit **root set**. Reachability SHALL be
computed from the root set over the general unit/export graph (the prelude is treated as one unit
among others, not special-cased). The AOT build SHALL generate initialization that constructs only
the reachable bindings, so that unreachable code becomes genuinely unreferenced and is removed from
the executable.

The root set SHALL be a parameter of the reachability computation (for an executable, the program's
entry and top-level references), so the same mechanism can later serve other roots (e.g. a
delivered library's exported interface) without change.

Root sets SHALL propagate **backward through the import graph**: a unit that another unit imports
SHALL be shaken against what its importers **retain**, and SHALL NOT be exempted from shaking on the
grounds that something imports it. To make that sound, the shipping doors SHALL finalize units in an
order in which every unit that imports a given unit is already final before that unit is shaken, and
SHALL seed each unit's root set with the program's roots together with the references still present
in those finalized importers. Consequently a unit's eligibility for shaking SHALL NOT depend on
whether the program imports it **directly**: every unit in the program's import closure is subject
to the same computation.

This transform SHALL apply to **every** door that delivers a native executable, and the doors SHALL
share one implementation of it rather than each computing reachability its own way. A delivered
executable's size SHALL NOT depend on which door produced it: for the same program and the same
compiler, the shipping doors SHALL retain the same set of library bindings.

This transform SHALL NOT apply to the interactive/REPL door or to in-process execution, which
continue to provide the full library units (open world — any binding may be referenced by a later
form), and all doors SHALL share one compiler core. Tree-shaking SHALL preserve observable behavior:
a program's result SHALL be identical to a non-shaken build.

#### Scenario: Unused library bindings are dropped from the executable

- **WHEN** a program that references only a small subset of `(scheme base)` (e.g. only `car`) is
  built for AOT
- **THEN** library bindings not transitively reachable from the program are absent from the linked
  executable, and the binary is smaller than one linking the full library

#### Scenario: Reachable bindings and behavior are preserved

- **WHEN** a program that transitively uses a library binding (directly or through another reachable
  binding) is built for AOT
- **THEN** that binding is retained and the program produces the same result as a non-shaken build

#### Scenario: Both shipping doors deliver the same shaken program

- **WHEN** the same program is built with `emit build` and with the Chez batch driver's AOT path, at
  the same commit
- **THEN** both executables retain the same library bindings and are of the same order of size,
  rather than differing by the whole unshaken standard library

#### Scenario: Growing the standard library does not grow an unrelated executable

- **WHEN** procedures are added to `(scheme base)` and a program referencing none of them is built
  with `emit build`
- **THEN** the delivered executable does not grow by the added bindings

#### Scenario: The REPL door keeps the full library

- **WHEN** the same library is loaded through the interactive/REPL door
- **THEN** every binding remains available regardless of what any single form references (open
  world), and behavior matches the AOT build for programs that use the same bindings

#### Scenario: Reachability is root-set-driven

- **WHEN** the reachability computation is invoked with an explicit root set
- **THEN** exactly the bindings transitively reachable from that root set are retained, so a
  different root set (e.g. a library's exports rather than a program entry) selects a different
  retained set through the same mechanism

#### Scenario: A library imported by another library is shaken, not kept whole

- **WHEN** a program that reaches only a small subset of `(scheme base)` is built, and `(scheme
  base)` imports the `(emit internal)` substrate
- **THEN** the substrate is pruned to what the **shaken** `(scheme base)` still references, rather
  than being linked whole because something imports it, and substrate bindings no importer retains
  (such as the in-language reader's) are absent from the delivered executable

#### Scenario: A transitively imported unit is shaken even though the program does not import it

- **WHEN** a program imports a library that in turn imports a second library, and the program
  imports the second library nowhere itself
- **THEN** the second library is shaken to what the first retains, rather than being exempt from
  shaking for not being a direct import of the program

#### Scenario: A binding an importer still reaches is retained through the chain

- **WHEN** a program uses a procedure of one library that is implemented in terms of a binding in a
  library it imports
- **THEN** that binding is retained in the imported unit, the executable links, and the program
  produces the same result as a non-shaken build

<!-- The delivered-library interface shake (issue #104) was scoped into this change and then
     withdrawn by its own measurement gate — see measurements.md 1.3/1.4. Shaking a library to its
     own exports removes 0% of `(emit internal)`, 0% of `(scheme read)`, and 0.45% of
     `(scheme base)`, because every internal helper in these libraries is reached by something
     exported. No requirement is added for machinery that would buy nothing. -->

