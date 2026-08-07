## ADDED Requirements

### Requirement: A door installs the compiler's source reader

The compiler core SHALL perform no file access. Where a source form names another file — the
`include` family of library declarations — the core SHALL obtain that file's forms by calling a
reader the **door** installed, taking the filename as written in the source and returning its
top-level forms. Resolution of a filename to a location, and the reading itself, SHALL belong to the
door, so the same core serves the Chez-hosted driver and the Chez-free binary without either one's
I/O mechanism appearing in it.

The Chez-free reader SHALL live in a source file that rides the Chez-free assembly only and is
excluded from the Chez driver's include block, as the stage dumper already is, because it calls
runtime primitives that are unbound identifiers when Chez evaluates the core sources.

A door that installs no reader SHALL still fail comprehensibly: an inclusion attempted without an
installed reader SHALL be a recoverable compile-time error naming the declaration and the filename,
never a crash or a silently empty body.

#### Scenario: Every door reads an included file

- **WHEN** the same library using `include` is compiled by the Chez driver and by each Chez-free
  door
- **THEN** each door reads the included file through its own installed reader and produces the same
  unit

#### Scenario: The core still performs no I/O

- **WHEN** the compiler core is inspected after this change
- **THEN** it contains no file-reading primitive and no path manipulation, and reaches an included
  file only through the installed reader

#### Scenario: An inclusion with no installed reader is named

- **WHEN** a compile path that installed no reader encounters an `include` declaration
- **THEN** a recoverable compile-time error names the declaration and the filename

### Requirement: A door tells the compiler where the source it submits came from

A door SHALL be able to tell the embedded compiler the location of the source it is about to submit,
through the same mode-based entry protocol used for the door's other operations, before submitting
that source for library loading, program compilation, export-table production, or an imports query.
The compiler SHALL use that location, and not the process's working directory, to resolve filenames
appearing in the source. When a door submits source with no location — text read from standard input
— the working directory SHALL be the fallback, and this SHALL be the only case in which it is used.

An imports query SHALL report the imports the source has **after** inclusion and feature selection,
so that a door's dependency resolution sees an import that arrived through
`include-library-declarations` or `cond-expand`.

#### Scenario: A library resolves its includes from outside the project directory

- **WHEN** a door compiles a manifest library that includes a file beside it, from a working
  directory unrelated to the library
- **THEN** the included file is found beside the library source

#### Scenario: Standard input falls back to the working directory

- **WHEN** a program or library is piped to a door with no filename
- **THEN** a relative included filename resolves against the current directory

#### Scenario: An import behind an inclusion is preloaded

- **WHEN** a program imports a library whose own `import` declaration arrives through
  `include-library-declarations`, and that dependency is named in the manifest
- **THEN** the door's dependency walk reaches the dependency and preloads it, rather than reporting
  an unresolved or cyclic import
