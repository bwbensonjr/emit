## MODIFIED Requirements

### Requirement: Textual input ports over files and strings

The language SHALL provide `open-input-file`, which opens a named file for textual input, and
`open-input-string`, which makes an input port delivering the characters of a string. Both SHALL
return a port satisfying `input-port?`, and both kinds SHALL support every input operation
identically, so that code reading from a port need not know which it was given.

`open-input-file` on a path that cannot be opened SHALL raise a **file error** rather than returning
a port — an error object for which `file-error?` is true, so that a program can tell an unopenable
file from every other failure it might catch in the same `guard`.

An input port SHALL read the whole of its source when it is opened. A consequence, which SHALL be
documented rather than treated as a defect, is that input written to the source after the port is
opened is not observed, and a source larger than available memory cannot be read.

#### Scenario: A file port and a string port behave identically

- **WHEN** the same text is read once through `open-input-string` and once through
  `open-input-file` on a file containing it, using the same sequence of operations
- **THEN** both produce the same sequence of results

#### Scenario: Opening a nonexistent file is an error

- **WHEN** a program calls `open-input-file` on a path that does not exist
- **THEN** the program reports an error rather than returning a port or faulting

#### Scenario: The error from opening a nonexistent file is a file error

- **WHEN** a program evaluates
  `(file-error? (guard (exn (else exn)) (open-input-file "no such file")))`
- **THEN** the result is `#t`

## ADDED Requirements

### Requirement: File existence and deletion

The language SHALL provide `file-exists?`, which answers whether a named file exists, and
`delete-file`, which removes one. Both SHALL be exported by `(scheme file)`, which is where R7RS-small
places them.

`file-exists?` SHALL return `#t` or `#f` and SHALL NOT raise for a path that does not exist — the
absence of the file is its answer, not a failure.

`delete-file` SHALL remove the named file, and SHALL raise a **file error** when it cannot — a path
that does not exist, or one that cannot be removed. The raised object SHALL satisfy `file-error?`,
which is what lets a program distinguish it from an unrelated failure caught by the same `guard`.

Neither procedure SHALL report through a mechanism a `guard` cannot reach.

#### Scenario: file-exists? answers for both cases

- **WHEN** a program creates a file, calls `file-exists?` on it, deletes it, and calls `file-exists?`
  again
- **THEN** the results are `#t` and then `#f`

#### Scenario: delete-file removes a file

- **WHEN** a program writes a file, calls `delete-file` on it, and then calls `file-exists?`
- **THEN** the file is gone and `file-exists?` returns `#f`

#### Scenario: Deleting a nonexistent file raises a file error

- **WHEN** a program evaluates
  `(file-error? (guard (exn (else exn)) (delete-file " no such file")))`
- **THEN** the result is `#t`

#### Scenario: file-exists? does not raise for a missing file

- **WHEN** a program calls `file-exists?` on a path that does not exist, with no enclosing `guard`
- **THEN** it returns `#f` and the program continues
