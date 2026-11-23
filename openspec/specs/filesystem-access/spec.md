# Filesystem Access Specification

## Purpose

Defines the non-standard filesystem operations Emit programs need for deterministic directory traversal, symbolic-link-aware policy, and atomic file replacement without a general host FFI.

## Requirements

### Requirement: The filesystem extension is an ordinary importable library

Emit SHALL provide an ordinary non-baked `(emit filesystem)` library exporting exactly `directory-list`, `file-directory?`, `file-symbolic-link?`, `replace-file`, `create-directory`, and `delete-directory`.

#### Scenario: An installed program imports the extension

- **WHEN** an installed Emit compiles and runs a program importing `(emit filesystem)` from a directory with no checkout-local Emit manifest
- **THEN** all six exports resolve through the installed default manifest

#### Scenario: The extension remains explicit

- **WHEN** a program does not import `(emit filesystem)`
- **THEN** none of the six extension names is introduced by `(scheme base)` or `(scheme file)`

### Requirement: Directory listing returns immediate entry names

`directory-list` SHALL accept a directory path string and return a proper list of strings naming its immediate entries. Each result SHALL be a bare entry name rather than the input directory joined to that name, and the result SHALL exclude the special `.` and `..` entries. Entry order is unspecified; callers that require deterministic traversal SHALL sort the returned names.

If the path cannot be opened or completely enumerated as a directory, `directory-list` SHALL raise a catchable file error for which `file-error?` is true. It SHALL NOT return a partial listing or terminate through an uncatchable runtime fault.

#### Scenario: A directory is listed without synthetic entries

- **WHEN** a directory containing `a.scm`, `sub`, and a symbolic link named `linked` is passed to `directory-list`
- **THEN** the result contains the three strings `"a.scm"`, `"sub"`, and `"linked"` exactly once each, contains neither `"."` nor `".."`, and contains no directory prefix

#### Scenario: Listing a missing directory raises a file error

- **WHEN** a program catches the object raised by `directory-list` on a path that does not exist
- **THEN** `file-error?` returns `#t` for that object

### Requirement: Directory and symbolic-link classification remain separate

`file-directory?` SHALL accept a path string and return `#t` exactly when resolving that path, including following a symbolic link in its final component, names a directory. It SHALL return `#f` when the path is absent or resolves to an existing non-directory.

`file-symbolic-link?` SHALL accept a path string and return `#t` exactly when the final path component itself is a symbolic link, without following that final link. It SHALL return `#f` when the path is absent or its final component is not a symbolic link. Symbolic links in earlier path components continue to be resolved by normal host path lookup.

An operating-system failure that prevents classification and is not the ordinary negative result described above SHALL raise a catchable file error rather than being reported as `#f` or causing a runtime fault.

#### Scenario: A linked directory has both classifications

- **WHEN** `real` is a directory and `linked` is a symbolic link naming `real`
- **THEN** both `(file-directory? "linked")` and `(file-symbolic-link? "linked")` return `#t`

#### Scenario: An ordinary directory is not a symbolic link

- **WHEN** `real` is an ordinary directory rather than a symbolic link
- **THEN** `(file-directory? "real")` returns `#t` and `(file-symbolic-link? "real")` returns `#f`

#### Scenario: A missing path is a negative classification

- **WHEN** both predicates are called on a path that does not exist
- **THEN** both return `#f` without raising

### Requirement: File replacement uses one atomic rename operation

`replace-file` SHALL accept source and destination path strings and move the source name to the destination using the host filesystem's atomic replacement operation. On success, it SHALL return the unspecified value, the source path SHALL no longer name the moved file, and the destination SHALL name the complete former source contents. If the destination already exists, observers SHALL see either its complete old contents or the complete replacement contents, never a state produced by deleting or truncating the destination before the rename.

Atomic replacement is guaranteed when the source and destination are on the same filesystem and the host supports atomic rename for those path kinds. The procedure is not required to copy across filesystems or provide crash-durable storage. If replacement cannot be completed, it SHALL raise a catchable file error for which `file-error?` is true and SHALL NOT remove or truncate the destination as a preparatory step.

#### Scenario: A same-directory target is replaced

- **WHEN** a closed temporary file and an existing target are in the same directory and `replace-file` is called with those paths
- **THEN** the target contains the complete temporary-file contents, the temporary path is absent, and no destination-absent interval is introduced by Emit

#### Scenario: Failed replacement preserves the destination

- **WHEN** replacement fails before the host rename can succeed, such as because the source path is absent
- **THEN** the raised object satisfies `file-error?` and the existing destination contents remain unchanged

### Requirement: Filesystem behavior has development-to-ship fidelity

For the same host filesystem state and operation sequence, `(emit filesystem)` SHALL produce the same Scheme results, file-error classifications, and filesystem effects under `emit run` and a standalone executable produced by `emit build`.

#### Scenario: A Pitch-style filesystem probe agrees across paths

- **WHEN** the same probe lists a directory, classifies an ordinary directory and a linked directory, and atomically replaces a same-directory target once through `emit run` and once through a standalone executable
- **THEN** both executions report equivalent results and leave equivalent filesystem state

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
