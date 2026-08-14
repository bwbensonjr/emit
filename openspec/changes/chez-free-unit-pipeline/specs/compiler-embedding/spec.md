## ADDED Requirements

### Requirement: The compiler reports the source files a library's registration read

The embedded compiler SHALL expose an entry point that reports, for a library just registered by
compiling it, every source file the registration read: the library's own source and the resolved
path of each file the include family opened on its behalf, transitively. The report SHALL cover
files reached through `include`, `include-ci`, and `include-library-declarations` alike.

This SHALL be a pure query over state the registration already established, costing no second
compilation, and SHALL be scoped to the most recent registration rather than accumulating across
registrations, so that two libraries including the same file each report it once.

#### Scenario: A library's include closure is reported

- **WHEN** a library whose source includes two files, one of which includes a third, is registered by
  compiling it, and the closure is then queried
- **THEN** the report names the library's own source and all three included files, by the paths they
  resolved to

#### Scenario: A library that includes nothing reports only its own source

- **WHEN** a library with no include declarations is registered and its closure is queried
- **THEN** the report names that library's source alone

#### Scenario: Closures do not leak between registrations

- **WHEN** two libraries that include the same fragment are registered in turn and each closure is
  queried after its own registration
- **THEN** each report names that library's own sources, and the second does not include files read
  only for the first

### Requirement: A registered library can be recompiled against an explicit root set

The embedded compiler SHALL expose an entry point that recompiles a library — resolved against the
current session, exactly as its original registration was — retaining only the bindings transitively
reachable from an explicit root set, and returning the pruned unit. The entry SHALL accept the root
set from the caller, so a door that computes roots from an emitted program can drive the same
reachability the batch driver drives.

The pruned unit SHALL be equivalent, for any program whose references are contained in that root
set, to the unpruned unit: the same bindings resolve to the same symbols, and the program's result is
unchanged.

#### Scenario: A pruned unit retains what the root set reaches

- **WHEN** a library is recompiled against a root set naming one exported procedure that calls a
  second, internal one
- **THEN** both are retained in the returned unit, and bindings reachable from neither are absent

#### Scenario: A program linked against a pruned unit behaves identically

- **WHEN** a program is linked against a unit pruned to the root set computed from that program, and
  again against the full unit
- **THEN** the two executables produce identical results

#### Scenario: An empty root set prunes to the unit's unconditional content

- **WHEN** a library is recompiled against an empty root set
- **THEN** the returned unit retains no exported binding, and remains loadable and initializable

## MODIFIED Requirements

### Requirement: The runner supports --no-prelude parity

The runner (`scheme-run` and `bin/scheme-compile`) SHALL accept `--no-prelude` and forward it to
the embedded entry through the smallest viable channel (an environment variable the entry reads
via a runtime primitive). With `--no-prelude`, the entry SHALL skip the `(scheme base)`
auto-import and the derived-form macro merge, emit only the program IR, and leave prelude names
unbound — matching the Chez batch driver's `--no-prelude`. The runner's single-module IR handling
(JIT for `scheme-run`, clang link for `scheme-compile`) SHALL be otherwise unchanged.

`--no-prelude` SHALL suppress the standard library's **compilation**, not only its binding. No door
running under `--no-prelude` SHALL compile, register, or load any member of the baked library set,
from its baked-in source or from a manifest, whether or not a manifest resolves. A door that
performs that work and then discards it violates this requirement even though the resulting session
binds the same names.

#### Scenario: --no-prelude skips the (scheme base) auto-import on the runner

- **WHEN** a program that references a prelude procedure is run through `scheme-run --no-prelude`
- **THEN** the embedded entry emits no `(scheme base)` IR and the reference is an unbound-variable
  error, exactly as under the Chez driver's `--no-prelude`

#### Scenario: --no-prelude on the runner matches the driver's --no-prelude

- **WHEN** the same program is compiled with `bin/scheme-compile --no-prelude` and with the Chez
  driver's `--no-prelude`
- **THEN** both emit only the program IR (no `(scheme base)`) and agree on the observable result

#### Scenario: A resolvable manifest does not reintroduce the standard library's cost

- **WHEN** a door is run with `--no-prelude` in a directory where a manifest resolves and names a
  baked member
- **THEN** no member of the baked set is compiled, and the invocation's cost is indistinguishable
  from the same invocation where no manifest resolves
