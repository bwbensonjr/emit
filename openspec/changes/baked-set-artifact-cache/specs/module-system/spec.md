## MODIFIED Requirements

### Requirement: An artifact is stale when a file it included changes

A compiled library artifact SHALL be considered fresh only when it is newer than **every** source
that contributed to it, including files reached through `include`, `include-ci`, and
`include-library-declarations`. The artifact's stamp sidecar SHALL record the resolved list of
included files so that freshness can be checked without recompiling, and the rebuild reason reported
for a stale artifact SHALL distinguish a changed source from a changed compiler as it does today.

This freshness rule SHALL govern every door that reuses a compiled artifact, not only the Chez
driver: the Chez-free doors (`emit run`, `emit build`, `emit lib`, `emit repl`) SHALL apply the same
rule to the units they reuse. It SHALL also govern the **baked standard library**, whose source is
compiled into the binary rather than read from disk, and for which the binary's own identity SHALL
serve as the contributing source's identity.

#### Scenario: Editing an included file rebuilds the library

- **WHEN** a library is compiled, an included file is then edited, and the build is re-run
- **THEN** the unit is rebuilt rather than reused, and the narration reports it as rebuilt

#### Scenario: An untouched library with includes is still reused

- **WHEN** a library with `include` declarations is compiled twice with no file changed in between
- **THEN** the second build reuses the artifact and reports it as fresh

#### Scenario: A Chez-free door applies the same freshness rule

- **WHEN** a program importing a library with `include` declarations is compiled through `emit run`,
  an included file is edited, and it is compiled again
- **THEN** the second compile rebuilds that library's unit rather than reusing it

#### Scenario: A rebuilt compiler makes the baked standard library stale

- **WHEN** the compiler binary is rebuilt and a Chez-free door is run again
- **THEN** the baked standard library is recompiled rather than reused, and the narration reports a
  changed compiler as the reason

## ADDED Requirements

### Requirement: The Chez-free doors reuse library units across processes

The Chez-free doors SHALL reuse a compiled library unit that is fresh by the rule above, rather than
recompiling it from source at every process start. This applies to the baked standard library, which
every door registers, and to each user library reached through a program's import closure. Reuse
SHALL be transparent: no door's emitted IR, resolved bindings, initialization ordering, or
diagnostics may depend on whether a unit was reused or recompiled.

#### Scenario: The import closure is not recompiled on every invocation

- **WHEN** a program importing two user libraries is compiled twice through `emit run` with no
  source changed
- **THEN** the second compile reuses both units and the standard library, recompiling none of them

#### Scenario: Reuse does not alter initialization ordering

- **WHEN** a program whose libraries import one another is run with a cold cache and again with a
  warm one
- **THEN** the libraries initialize in the same order and the program prints the same result
