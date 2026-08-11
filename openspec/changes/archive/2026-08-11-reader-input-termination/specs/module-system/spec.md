## ADDED Requirements

### Requirement: A manifest is exactly one top-level form

A manifest SHALL consist of exactly one top-level form — the list of entries. A manifest holding
**more than one** top-level form SHALL be reported as an error naming the manifest and the number of
forms found, and SHALL NOT have its extra forms silently discarded.

The mistake this prevents is writing one parenthesized group per entry:

```scheme
((library (a) (source "a.sld")))
((library (b) (source "b.sld")))   ; a second top-level form
```

which looks like a list of entries and reads as several. Discarding the second form leaves `(b)`
unresolvable and reports the failure at whatever imports it, naming the importer rather than the
manifest that dropped the entry.

Rejecting rather than concatenating is a deliberate grammar decision. Treating several top-level
lists as one entry list would make the shape above simply work, and would let a manifest be assembled
by appending files — but it widens the documented grammar rather than enforcing it, and it is the
more permissive of the two, so it is the one that cannot be taken back. Rejecting now keeps the
choice open: admitting concatenation later is purely additive, while withdrawing it after a tagged
release would be a breaking change.

A manifest holding **no** datum remains an empty manifest and is not an error — see "A manifest
containing no datum is an empty manifest". The requirement here constrains only the case of more
than one form.

#### Scenario: A second top-level form is reported, not ignored

- **WHEN** a door locates a manifest whose text is two top-level lists, each holding one entry
- **THEN** the door reports an error naming the manifest and that it holds two top-level forms, and
  exits non-zero — rather than resolving only the first list's entries

#### Scenario: The dropped entry is not reported as an unresolved import

- **WHEN** a program imports `(b)`, which is declared in the **second** top-level form of the
  manifest
- **THEN** the reported error names the manifest's form count, not an unresolved import of `(b)` —
  the diagnostic points at the file that holds the mistake

#### Scenario: A single-form manifest is unaffected

- **WHEN** a door locates a well-formed manifest — one top-level list of any number of entries,
  with any surrounding whitespace and comments
- **THEN** it resolves every entry in that list, exactly as before

## MODIFIED Requirements

### Requirement: A manifest containing no datum is an empty manifest

A manifest file that exists and is readable but contains no datum — a zero-byte file, a file of
only whitespace, or a file of only comments — SHALL be equivalent to a manifest that declares no
entries. It SHALL NOT be an error to *locate* such a manifest, and no door SHALL fail on account
of one except where that door requires an entry it cannot find, in which case it SHALL report the
absence rather than terminate abnormally.

This extends "Finding no manifest at all SHALL remain non-fatal" to the case where a manifest is
found but declares nothing: the two SHALL be indistinguishable to every door in what they resolve,
differing only in narration, which continues to name the manifest that was located.

No door SHALL terminate on a signal, and no door SHALL exit without a diagnostic, for any manifest
text.

A manifest that is *truncated* — one whose text ends inside an unterminated list or string — SHALL
be reported rather than accepted as complete. This is enforced at the reader rather than in the
manifest parsers: `core-language`'s "An unterminated block comment is reported, not read as end of
input" makes an unterminated construct an error in every source, so a manifest inherits it along
with every other consumer of the whole-source read. A truncated manifest therefore reports the
construct it left open, rather than resolving as though the missing entries were never written.

#### Scenario: An entryless manifest resolves like no manifest

- **WHEN** a door locates an `emit-libs.scm` that is empty, whitespace-only, or comment-only
- **THEN** it resolves the same set of libraries it would have resolved had no manifest been found
  — the baked set alone — and narrates the manifest it located

#### Scenario: A program importing only baked libraries runs under an entryless manifest

- **WHEN** `emit run prog.scm` is invoked with an entryless manifest present and `prog.scm` imports
  only baked-in libraries
- **THEN** the program runs and produces its normal output, with no error and no crash

#### Scenario: An unresolved import under an entryless manifest names the library

- **WHEN** `emit run prog.scm` is invoked with an entryless manifest present and `prog.scm` imports
  a library that is neither baked nor declared
- **THEN** import resolution reports a compile-time error naming the unresolved library, and the
  door exits non-zero without crashing

#### Scenario: A library source holding no datum is reported, not crashed on

- **WHEN** a manifest names a library whose source file exists but holds no datum — a zero-byte file,
  whitespace only, or comments only — and a program imports that library
- **THEN** the door reports a compile-time error naming that source as containing no
  `define-library`, and exits non-zero without crashing

#### Scenario: A manifest that is not a list of entries does not crash a door

- **WHEN** a door locates a manifest whose top-level form is not a proper list — a bare symbol, a
  number, a string, or an improper list such as `(a . b)`
- **THEN** the door resolves no entries from it and exits with a status it chose, never on a signal

#### Scenario: A truncated manifest is reported, not built from

- **WHEN** a door locates a manifest whose text is `((program p (source "hello.scm") (output "h")`
  — one closing paren short — and a program is built
- **THEN** the door reports the unterminated list and exits non-zero, rather than resolving the
  entry and writing an executable
