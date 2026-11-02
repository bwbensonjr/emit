# Spec Delta

## ADDED Requirements

### Requirement: emit build can link the garbage collector statically

`emit build` SHALL accept `--static-gc`, which links the Boehm libgc static archive into the
delivered executable so that the executable has no runtime dependency on a libgc shared library.
Without the option, `emit build` SHALL link libgc as a shared library exactly as before. The option
SHALL apply to both manifest-program and direct-source builds and SHALL NOT change the program's
observable behavior.

#### Scenario: A statically linked executable has no libgc runtime dependency

- **WHEN** the user runs `emit build --static-gc hello.scm` with a toolchain whose libgc library
  directory contains the static archive
- **THEN** the delivered executable's dynamic dependencies (as reported by `otool -L` on macOS or
  `ldd` on Linux) name no libgc library, and running it produces the same output as an executable
  built without the option

#### Scenario: The statically linked executable runs without libgc installed

- **WHEN** an executable built with `--static-gc` is run in an environment where no libgc shared
  library can be found by the dynamic loader
- **THEN** it starts and runs to completion with the same output as on the build machine

#### Scenario: The default link is unchanged

- **WHEN** the user runs `emit build hello.scm` without `--static-gc`
- **THEN** the delivered executable links libgc as a shared library, as it did before this change

#### Scenario: The option applies to a manifest program

- **WHEN** the manifest contains a `(program my-app …)` entry and the user runs
  `emit build my-app --static-gc`
- **THEN** the executable is delivered at the entry's output path with libgc linked statically

### Requirement: A static GC link without an archive fails before linking

When `--static-gc` is given and the resolved libgc library directory holds no static archive,
`emit build` SHALL exit non-zero without writing an executable, with a diagnostic naming the archive
path it looked for and how to supply one. It SHALL NOT fall back to a shared libgc link.

#### Scenario: No static archive is available

- **WHEN** the user runs `emit build --static-gc hello.scm` and the resolved libgc library directory
  contains only the shared library
- **THEN** `emit build` reports that the libgc static archive was not found at the named path,
  suggests installing a libgc that provides it or setting `GC_LIB` to a directory that does, exits
  non-zero, and writes no executable

### Requirement: emit build narrates its libgc link mode

`emit build` SHALL report on stderr, at the default verbosity, whether it linked libgc statically or
as a shared library, so the dependency shape of the delivered executable is visible.

#### Scenario: A static build names its link mode

- **WHEN** the user runs `emit build --static-gc hello.scm` at the default verbosity
- **THEN** the build narration states that libgc was linked statically and names the archive used

#### Scenario: A quiet build stays quiet

- **WHEN** the user runs `emit build --static-gc hello.scm` with `EMIT_VERBOSITY=quiet`
- **THEN** no link-mode narration is printed
