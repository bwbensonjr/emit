## ADDED Requirements

### Requirement: emit build distinguishes why no program entry could be resolved

When `emit build` cannot resolve a program entry, it SHALL report which of the distinguishable
causes applies and exit non-zero. It SHALL NOT terminate on a signal, and SHALL NOT exit without a
diagnostic, for any manifest text.

The causes SHALL be reported distinguishably:

1. **No manifest was found.** The message SHALL say so, and SHALL name the manifest filename the
   door searched for, rather than naming an empty path.
2. **A manifest was found but declares no entries** (empty, whitespace-only, or comment-only). The
   message SHALL name the located manifest and say it declares no entries.
3. **A manifest was found and declares entries, but none is a `program` entry.** This is the
   existing `no program entry in manifest <path>` case and SHALL keep naming the manifest.

Because a program entry is what `emit build` builds, cases 1 and 2 SHALL be errors for this door
even though "Finding no manifest at all SHALL remain non-fatal" holds for doors that only resolve
imports.

#### Scenario: emit build with no manifest reports the filename it looked for

- **WHEN** `emit build` is run in a directory with no `emit-libs.scm` and no manifest is found on
  any searched candidate
- **THEN** it reports that no manifest was found, naming `emit-libs.scm`, and exits non-zero
  without crashing

#### Scenario: emit build with an entryless manifest names it

- **WHEN** `emit build` is run with an `emit-libs.scm` that is empty, whitespace-only, or
  comment-only
- **THEN** it reports that the located manifest declares no entries, naming that manifest, and
  exits non-zero without crashing

#### Scenario: emit build with a library-only manifest is unchanged

- **WHEN** `emit build` is run with a manifest declaring libraries but no `program` entry
- **THEN** it reports `no program entry in manifest <path>` as before and exits non-zero

#### Scenario: A source path given where an entry name belongs does not crash

- **WHEN** the user runs `emit build hello.scm` in a directory whose manifest is absent or
  entryless
- **THEN** the door reports the applicable cause above and exits non-zero, rather than terminating
  on a signal
