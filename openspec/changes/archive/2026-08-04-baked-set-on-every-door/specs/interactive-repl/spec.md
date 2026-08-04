## ADDED Requirements

### Requirement: The session's standard library does not depend on the manifest

A REPL session's standard library SHALL come from the baked library set registered at startup, so
that the availability of `(scheme base)` and the derived-form macros does **not** depend on the
directory the session was started in, on whether a manifest was found, or on what that manifest
names. Starting a session in a project directory SHALL never produce a session in which
standard-library names are unbound.

`--no-prelude` SHALL remain the single way to start a session without the standard library, and SHALL
skip registering the baked set entirely. A session started that way SHALL report an unbound variable
for a standard-library name, as it does today.

#### Scenario: A session in a project directory resolves standard-library names

- **WHEN** `emit repl` starts in a directory whose manifest names only that project's own libraries,
  and the user evaluates a form calling `map`
- **THEN** the form returns its value, and no warning is printed that `(scheme base)` is unloaded

#### Scenario: A session with no manifest at all resolves standard-library names

- **WHEN** `emit repl` starts in a directory with no manifest present and no manifest installed
- **THEN** the session starts with the standard library available, and a form using a derived form
  such as `cond` over a standard-library procedure evaluates correctly

#### Scenario: --no-prelude still yields a bare session

- **WHEN** `emit repl --no-prelude` starts and the user references a standard-library name
- **THEN** the session reports an unbound variable, and the baked set was not registered

### Requirement: Session startup reports what it registered

Session startup SHALL follow the project output convention (`docs/OUTPUT.md`): the baked members it
registered SHALL be reported on standard error at verbose verbosity, absent at default and quiet
verbosity, and SHALL never be written to standard output. A failure to register or initialize a baked
member SHALL be reported at every verbosity as an error rather than leaving the session silently
without a standard library.

#### Scenario: Registration detail is verbose-only

- **WHEN** a session starts at default verbosity and again at `EMIT_VERBOSITY=verbose`
- **THEN** the verbose run names the registered baked members on standard error while the default run
  does not, and the interactive results printed by both are identical

#### Scenario: A failure to initialize the standard library is loud

- **WHEN** a baked member's registration or initialization fails at session startup
- **THEN** the session reports the failure as an error naming the member, rather than continuing into
  a prompt where standard-library names are unbound
