## ADDED Requirements

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

A manifest that is *malformed* rather than merely empty is out of scope here: Emit's reader currently
closes an unterminated list or string silently at end of input, in any source and not only a
manifest, so a truncated manifest is accepted as though complete. That is a reader-level gap tracked
separately; this requirement constrains only that no manifest text crashes a door.

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

#### Scenario: No door crashes on a degenerate manifest

- **WHEN** any door is invoked with a manifest that is absent, empty, whitespace-only,
  comment-only, or not a proper list of entries
- **THEN** the door exits with a status it chose — never on a signal — and every non-zero exit
  carries a diagnostic on standard error
