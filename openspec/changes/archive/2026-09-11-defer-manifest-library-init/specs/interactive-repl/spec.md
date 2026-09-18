## MODIFIED Requirements

### Requirement: The session's standard library does not depend on the manifest

A REPL session's standard library SHALL come from the baked library set registered at startup, so
that the availability of `(scheme base)` and the derived-form macros does **not** depend on the
directory the session was started in, on whether a manifest was found, or on what that manifest
names. Starting a session in a project directory SHALL never produce a session in which
standard-library names are unbound.

The converse SHALL also hold: a session's standard library never *comes* from the manifest. A
manifest entry naming a member of the baked set SHALL NOT be loaded, compiled, or read for its
source by a session, in either prelude mode. This applies to every baked member — the standard
library and the substrate it stands on — rather than to one name, and makes the REPL's seeding
identical to the `emit run` command's.

`--no-prelude` SHALL remain the single way to start a session without the standard library, and SHALL
skip registering the baked set entirely. A session started that way SHALL report an unbound variable
for a standard-library name, as it does today, and SHALL compile no member of the baked set from any
source. A manifest library that imports a baked member SHALL therefore fail to resolve in such a
session, reported as an unresolved import, rather than being silently satisfied by a standard library
the session does not otherwise have.

*Registration* of the manifest's own libraries SHALL remain eager, because a session is an open
world in which any prompt may import any of them: at startup every manifest library SHALL be read
or reused from cache, compiled if necessary, and admitted to the session, so that the set of
importable libraries and the set of libraries that failed to load are both fixed before the first
prompt. Their *initialization* SHALL NOT be eager — see "A manifest library is initialized when
the session first imports it". The baked set is the exception at both ends: it is registered **and**
initialized at startup, because every session auto-imports it.

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

#### Scenario: --no-prelude with a manifest costs no standard-library compile

- **WHEN** `emit repl --no-prelude` starts in a directory where a manifest resolves and names the
  baked members, and again where no manifest resolves
- **THEN** neither session compiles any baked member, and their startup costs are of the same order
  rather than differing by the cost of compiling the standard library

#### Scenario: A manifest entry for a baked member is free with the prelude

- **WHEN** `emit repl` starts against a manifest that names `(scheme base)` and the substrate, as
  this repository's own manifest does
- **THEN** the session's standard library is the registered baked set, those entries contribute no
  second unit, and no library source for them is read

#### Scenario: A user library importing the standard library is unresolved without it

- **WHEN** `emit repl --no-prelude` starts against a manifest whose library imports `(scheme base)`
- **THEN** that library is reported as an unresolved import and the session continues, matching what
  `emit run --no-prelude` does with the same manifest

#### Scenario: An unloadable manifest library is still reported at startup

- **WHEN** `emit repl` starts against a manifest naming a library whose source cannot be read or
  does not compile
- **THEN** the failure is reported before the first prompt, as it is today, rather than being
  deferred to the import that would have used it, and the session continues with the remaining
  libraries

## ADDED Requirements

### Requirement: A manifest library is initialized when the session first imports it

A manifest library's top-level body — the initialization that gives its definitions their values —
SHALL run when a session **first imports** the library, and SHALL NOT run at session startup. A
library that a session never imports SHALL never be initialized, and SHALL therefore cost the
session no code generation.

An `(import (L))` at the prompt SHALL initialize `L` and every library in `L`'s import closure that
is not yet initialized, in an order in which each library is initialized before any library that
imports it, and SHALL do so **before** `L`'s names enter the session scope. Each library SHALL be
initialized at most once per session, however many forms import it, and however many importing
libraries name it. A library already initialized because an earlier import reached it SHALL NOT be
initialized a second time.

The value a form computes SHALL NOT depend on when initialization happened. A session that imports
a library and uses it SHALL observe exactly the values a session would observe had the library been
initialized at startup, and a program built from the same forms with `emit build` SHALL observe the
same values again, preserving the project's dev→ship fidelity requirement.

Initialization failure SHALL be reported as an error naming the library, at every verbosity, and
the session SHALL continue at the prompt rather than exiting; the names of a library whose
initialization failed SHALL NOT enter the session scope.

#### Scenario: An unimported library is never initialized

- **WHEN** `emit repl` starts against a manifest naming a large library, and the session evaluates
  a form that does not import it
- **THEN** that library's initialization has not run, and the session reaches the prompt without
  generating code for it

#### Scenario: Importing a library initializes it before its names are usable

- **WHEN** a session evaluates `(import (L))` for a manifest library `L` and then calls a procedure
  `L` exports
- **THEN** the call returns the same value it would have returned in a session that initialized `L`
  at startup

#### Scenario: An import initializes the libraries the imported library depends on

- **WHEN** a session imports a manifest library whose own body depends on a second manifest library
  that no form has imported
- **THEN** the second library is initialized first, and the first library's procedures behave as
  they do when both were initialized at startup

#### Scenario: A second import does not re-initialize

- **WHEN** a session imports the same library from two separate forms, and the library's body has
  an observable effect
- **THEN** that effect occurs exactly once

#### Scenario: A failed initialization does not bind the library's names

- **WHEN** a session imports a manifest library whose top-level body raises
- **THEN** the session reports an error naming that library, the library's exported names remain
  unbound, and the session continues accepting forms

#### Scenario: Startup cost does not scale with libraries the session does not use

- **WHEN** `emit repl` starts against a manifest that names a library far larger than the rest, and
  again against the same manifest with that library removed
- **THEN** the two startups cost the same order of time, rather than differing by the cost of
  generating code for the larger library

### Requirement: Deferred initialization is narrated when it happens

Running a manifest library's deferred initialization SHALL be reported on standard error at verbose
verbosity, naming the library, following the project output convention (`docs/OUTPUT.md`): absent
at default and quiet verbosity, and never written to standard output. The narration a session emits
at startup SHALL continue to name every manifest library it registered, so that deferring
initialization does not make the set of available libraries less visible than it is today.

The values, printed results, emitted IR and diagnostics of a session SHALL be unchanged by
deferral, and the stage dumps a session produces under the dump flags SHALL continue to cover the
same units they cover today.

#### Scenario: An initialization at import is verbose-only

- **WHEN** a session started at `EMIT_VERBOSITY=verbose` imports a manifest library, and the same
  session is run again at default verbosity
- **THEN** the verbose run names the initialized library on standard error, the default run does
  not, and the interactive results printed by both are identical

#### Scenario: Startup still names the libraries it registered

- **WHEN** `emit repl` starts at verbose verbosity against a manifest
- **THEN** each manifest library it registered is named on standard error, as it is today, whether
  or not the session goes on to import it
