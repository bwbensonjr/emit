# Spec Delta

## ADDED Requirements

### Requirement: Doctor reports static libgc archive availability

`emit doctor` SHALL report whether the resolved libgc library directory contains a static archive
usable by `emit build --static-gc`, naming the path it checked. The absence of the archive SHALL be
reported as information and SHALL NOT by itself make doctor exit non-zero, because the shared link
remains the default.

#### Scenario: The archive is present

- **WHEN** the resolved libgc library directory contains the static archive and the user runs
  `emit doctor`
- **THEN** doctor reports the archive path as available for static GC linking

#### Scenario: The archive is absent

- **WHEN** the resolved libgc library directory contains only the shared library and every other
  check passes
- **THEN** doctor reports that static GC linking is unavailable, naming the path it checked, and
  exits zero
