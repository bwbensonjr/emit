## Why

Pitch's derived reader uses `char-general-category` to recognize Unicode identifier
constituents and R6RS intraline whitespace. Emit already vendors and processes the
authoritative UnicodeData input, but `(scheme char)` does not expose that category
lookup, so the Pitch port cannot compile without weakening its lexer.

## What Changes

- Add `char-general-category` as a documented Emit extension exported by `(scheme
  char)`, returning the Unicode two-letter general-category symbol for every
  supported character.
- Extend the deterministic Unicode generator and committed character data with a
  compressed general-category table, including correct handling of UnicodeData's
  `First`/`Last` ranges and unassigned scalar values.
- Verify the complete category set, the exact category groups used by Pitch's
  reader, generated-data determinism, and development-to-standalone behavior.
- Record the generated-source and linked-binary size effects while retaining the
  existing pay-for-use `(scheme char)` library boundary.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `character-library`: Extend the Unicode character-library surface with general
  category lookup required by Pitch.

## Impact

The change affects `tools/gen-unicode-tables.ss`, the generated
`lib/scheme/char-data.scm`, `lib/scheme/char.sld`, character-library and Pitch
prerequisite tests, and the library documentation. It adds no dependency, runtime
primitive, compiler-source edit, or unconditional payload to programs that do not
import `(scheme char)`.
