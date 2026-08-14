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
identical to the run door's.

`--no-prelude` SHALL remain the single way to start a session without the standard library, and SHALL
skip registering the baked set entirely. A session started that way SHALL report an unbound variable
for a standard-library name, as it does today, and SHALL compile no member of the baked set from any
source. A manifest library that imports a baked member SHALL therefore fail to resolve in such a
session, reported as an unresolved import, rather than being silently satisfied by a standard library
the session does not otherwise have.

Preloading of the manifest's own libraries SHALL remain eager, because a session is an open world in
which any prompt may import any of them.

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
