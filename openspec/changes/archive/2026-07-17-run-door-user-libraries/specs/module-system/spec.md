## ADDED Requirements

### Requirement: `emit run` command — run an importing program in-process (Chez-free)

The in-process runner (`build/scheme-run`) SHALL resolve a program's imports (and each
library's imports) through the manifest to their sources, build the transitive dependency
graph, reject import cycles with an error, load each unit in the transitive closure into the
running JIT session in dependency order, invoke each unit's initializer exactly once, and
then compile and run the program against the import environment built from its dependencies'
export tables — all without Chez and without a second library-resolution path (it drives the
same manifest resolution and compile-unit core the AOT and REPLs use).

The manifest SHALL be located the same way the other paths locate it: the `EMIT_MANIFEST`
environment variable if set, otherwise `--manifest FILE` if given, otherwise the default
`emit-libs.scm`. When no manifest is present and the program imports only `(scheme base)` (or
imports nothing), the runner SHALL behave exactly as before (no regression), since the
manifest is consulted only to resolve a non-baked-in imported library.

A library that is not in the program's transitive import closure SHALL NOT be initialized
or linked into the program's initialization sequence, so it can have no observable effect on
the run (the in-process JIT may inertly hold a unit's module without ever running its
initializer).

#### Scenario: A program importing a library runs in-process

- **WHEN** `build/scheme-run` runs a program that imports `(mylib)` and evaluates `greet`,
  with `(mylib)` listed in the manifest
- **THEN** it loads and initializes `mylib`, runs the program, and prints the value `greet`
  returns

#### Scenario: A transitive import chain runs in-process

- **WHEN** `build/scheme-run` runs a program that imports `(a)` where `(a)` imports `(b)`
- **THEN** it loads `(b)` and `(a)` in dependency order, initializes each once, and the
  program's value is printed correctly

#### Scenario: An import cycle is reported

- **WHEN** `build/scheme-run` runs a program whose import graph has `(a)` importing `(b)` and
  `(b)` importing `(a)`
- **THEN** it reports an error naming the cycle (or an unresolved/missing-from-manifest
  import) rather than looping, and exits non-zero

#### Scenario: A program with no user imports is unaffected

- **WHEN** `build/scheme-run` runs a program that imports only `(scheme base)` or imports
  nothing, with no manifest present
- **THEN** it behaves exactly as before this change — the value is identical and no manifest
  is required

### Requirement: `emit run` command matches the AOT path (dev→ship fidelity)

A program run through `build/scheme-run` with a given manifest SHALL produce the same value
as the same program built and run through the AOT path with the same manifest. The emitted
program module and each imported unit's module SHALL be byte-for-byte identical across the run
and AOT paths, because all paths drive the same compile-unit core.

#### Scenario: run-path value matches AOT-path value

- **WHEN** an importing program is run via `build/scheme-run` and also built+run via the AOT
  path, with the same manifest
- **THEN** the two printed values are identical

#### Scenario: A unit's module bytes match across the run and AOT paths

- **WHEN** `(mylib)` is loaded by the `emit run` command and compiled for the AOT link
- **THEN** the two unit modules are byte-for-byte identical
