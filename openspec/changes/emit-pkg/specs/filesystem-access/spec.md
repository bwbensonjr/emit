# Spec Delta

## MODIFIED Requirements

### Requirement: The filesystem extension is an ordinary importable library

Emit SHALL provide an ordinary non-baked `(emit filesystem)` library exporting exactly `directory-list`, `file-directory?`, `file-symbolic-link?`, `replace-file`, `create-directory`, and `delete-directory`.

#### Scenario: An installed program imports the extension

- **WHEN** an installed Emit compiles and runs a program importing `(emit filesystem)` from a directory with no checkout-local Emit manifest
- **THEN** all six exports resolve through the installed default manifest

#### Scenario: The extension remains explicit

- **WHEN** a program does not import `(emit filesystem)`
- **THEN** none of the six extension names is introduced by `(scheme base)` or `(scheme file)`

## ADDED Requirements

### Requirement: The filesystem extension resolves like any ordinary library

`(emit filesystem)` SHALL be available to user libraries, the REPL, `emit run`, and standalone builds through the same manifest and artifact mechanism as other ordinary libraries, and SHALL be included in installed Emit layouts.

#### Scenario: A user library re-exports filesystem behavior

- **WHEN** a user library imports `(emit filesystem)` and a program imports only that user library
- **THEN** the program runs under `emit run`, and the same import works in the REPL and in a standalone build

### Requirement: The filesystem extension adds nothing to the standard libraries

Importing `(emit filesystem)` SHALL NOT add any name to `(scheme file)` or to the automatically imported `(scheme base)` surface.

#### Scenario: Standard imports do not expose the extension

- **WHEN** a program imports only `(scheme base)` and `(scheme file)` and calls `directory-list`
- **THEN** compilation reports `directory-list` as unbound

### Requirement: Directory creation is a single exclusive operation

`(create-directory path)` SHALL create one directory, with permissions limited by the process umask, and return the unspecified value. It SHALL NOT create missing parent directories. If `path` already exists as any kind of file, or the directory cannot be created, it SHALL raise a catchable file error, so that a successful call proves this caller created the directory.

#### Scenario: A new directory is created

- **WHEN** `create-directory` is called on an absent path whose parent exists
- **THEN** `file-directory?` returns `#t` for that path

#### Scenario: An existing path is an error

- **WHEN** `create-directory` is called on a path that already names a directory
- **THEN** the raised object satisfies `file-error?` and the directory is unchanged

### Requirement: Directory deletion never follows symbolic links

`(delete-directory path)` SHALL remove an empty directory. `(delete-directory path #t)` SHALL also remove its contents first, depth-first. A symbolic link inside the tree SHALL be unlinked, never traversed. If `path` itself is a symbolic link or not a directory, or anything cannot be removed, the procedure SHALL raise a catchable file error.

#### Scenario: A tree is removed without following a link

- **WHEN** a directory contains files, a subdirectory, and a symbolic link to a directory outside the tree, and `(delete-directory path #t)` is called
- **THEN** the tree is gone and the link's target directory and its contents are unchanged

#### Scenario: A non-empty directory needs the recursive flag

- **WHEN** `(delete-directory path)` is called on a non-empty directory
- **THEN** the raised object satisfies `file-error?` and the directory and its contents remain

#### Scenario: A linked path is refused

- **WHEN** `(delete-directory path #t)` is called where `path` is a symbolic link to a directory
- **THEN** the raised object satisfies `file-error?` and neither the link nor its target is changed
