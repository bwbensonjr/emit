## Context

See [proposal.md](proposal.md) for motivation. `(scheme char)` is an ordinary,
non-baked library containing a generated Unicode 17.0.0 include. Its generator
already reads `UnicodeData.txt` field 2 for decimal classification, but does not
retain the general-category value. The generated include currently stores boolean
property intervals and scalar-to-mapping tables; library code binary-searches
those flat vectors.

UnicodeData normally has one row per assigned code point, but large blocks use
paired `<..., First>` and `<..., Last>` rows. Any category table built as if those
were two isolated scalars would misclassify the interior of CJK, Hangul,
private-use, and other ranges. Gaps between records are unassigned (`Cn`).

## Goals / Non-Goals

**Goals:**

- Reuse the pinned Unicode input and existing library artifact rather than add a
  host Unicode dependency or second copy of the tables.
- Keep lookup logarithmic in the number of compressed category intervals and
  keep generated output deterministic and reviewable.
- Make the extension usable wherever the existing `(scheme char)` library is
  usable, with no compiler or runtime primitive.
- Preserve pay-for-use linking and measure the incremental table cost.

**Non-Goals:**

- Add R6RS library aliases such as `(rnrs unicode (6))`.
- Add category predicates or Pitch-specific identifier policy to Emit.
- Change the pinned Unicode version or any existing character property/casing
  semantics.
- Accept surrogate code points as Scheme characters.

## Decisions

### D1. Publish the operation as a documented `(scheme char)` extension

`char-general-category` is not in R7RS-small, but its data and semantics belong
to the same character unit that already provides the standard Unicode
operations. Exporting it there lets the Pitch reader's former R6RS Unicode import
map to one R7RS library and keeps a single Unicode artifact in the link closure.
Documentation and surface tests call out the name as an Emit extension; it is not
added to auto-imported `(scheme base)`.

Alternative considered: introduce `(emit unicode)` or `(emit char)`. Such a
library would either duplicate the generated table when Pitch also imports
`(scheme char)`, or require a new shared internal library and artifact dependency
solely to hide one closely related name. That is disproportionate machinery and
would make the port import two libraries for one former Unicode surface.

### D2. Generate sorted, coalesced `(start end category)` intervals

The generator reads the code point, name, and general-category fields from every
UnicodeData row. Ordinary rows become singleton intervals. A `First` row must be
followed by its matching `Last` row with the same category; the pair becomes one
closed interval, and malformed or unmatched pairs fail generation rather than
silently producing incomplete data. Adjacent intervals are coalesced only when
they are contiguous and have the same category, so an unassigned gap remains
observable as `Cn`.

The generated include stores the result as one flat vector of triples containing
integer bounds and category symbols. `char-general-category` converts its
argument to a code point and binary-searches aligned entries. A miss returns the
literal symbol `Cn`. This mirrors the library's existing range lookup while
allowing each range to carry a value.

Alternative considered: emit one mapping for every assigned code point. That is
simple but needlessly increases generated source, artifact size, and compile
time. Deriving categories from the existing boolean property tables is not
possible: the Unicode general categories overlap those derived properties and
distinguish many classes that `(scheme char)` currently does not retain.

### D3. Validate against pinned data and Pitch's actual category policy

Generator checks cover normal rows, `First`/`Last` endpoints and interiors,
coalescing boundaries, deterministic regeneration, and the narrated category
interval count. Runtime tests cover representative values from the categories
Pitch uses, a private-use range, a large compact range, and a known Unicode 17.0
unassigned scalar returning `Cn`.

A focused Pitch-prerequisite probe applies the exact initial, subsequent, and
`Zs` membership sets from the derived reader. Library-surface, user-library,
REPL, `emit run`, and AOT checks prove normal module behavior. The implementation
records generated include size and otherwise-equivalent stripped AOT probes with
and without the new lookup; the latter must retain the existing absence of the
Unicode payload when `(scheme char)` is not imported.

Alternative considered: use the bootstrap Chez `char-general-category` as the
oracle. Its Unicode version is host-dependent, so it can disagree legitimately
with Emit's pinned Unicode 17.0.0 data. The vendored UnicodeData file is the
authoritative oracle instead.

### D4. Keep the change outside the compiler regeneration barrier

All implementation stays in the ordinary library, its host-side generator, the
generated include, tests, and documentation. None of the sources concatenated by
`tools/regen.sh` changes, so `make regen` would add cost without producing a
relevant bootstrap change. Focused tests and the normal non-regeneration suite
provide the verification path.

## Risks / Trade-offs

- **[Category intervals enlarge every artifact that imports `(scheme char)`]** →
  Coalesce adjacent equal categories, retain binary search, and record generated
  and stripped-binary deltas before accepting the representation.
- **[Incorrect `First`/`Last` handling silently misclassifies large ranges]** →
  Validate pairing during generation and test endpoints plus an interior scalar.
- **[An unassigned test scalar changes category in a future Unicode refresh]** →
  Tie the fixture explicitly to the library's pinned Unicode version and update it
  as part of any deliberate Unicode upgrade.
- **[A standard-library extension is mistaken for R7RS portability]** → Mark it
  as an Emit extension in the spec, library documentation, and surface tests, and
  leave it absent without an explicit `(scheme char)` import.

## Migration Plan

1. Extend generator validation and output, regenerate the committed Unicode
   include, then add the library lookup and focused tests.
2. Update the declared surface documentation and Pitch prerequisite fixture,
   record size evidence, and run the focused and normal suites without regen.
3. Roll back by reverting the library export, generated table, tests, and
   documentation together. No persisted data or artifact format requires
   migration; cached character-library artifacts can be discarded and rebuilt.

## Implementation Evidence

Unicode 17.0.0 generation produces 3,409 coalesced general-category ranges.
`char-data.scm` grew from 144,843 to 193,481 bytes (+48,638, +33.6%); the
combined generated include plus `char.sld` grew from 149,694 to 198,983 bytes
(+49,289, +32.9%).

On the development arm64 macOS host, a cold self-hosted `emit lib` compile into
an empty artifact directory took 28.16 seconds real (27.90 user, 0.13 system).
The complete character unit is now 4,061,894 bytes of IR plus a 2,711-byte
interface, versus 3,176,042 and 2,582 bytes before this change: +885,852 bytes
of IR (+27.9%) and +129 bytes of interface.

Otherwise-equivalent release-profile probes both print `Ll`: the first imports
only `(scheme base)` and prints the literal symbol, while the second imports
`(scheme char)` and prints `(char-general-category #\a)`. After stripping, they
measure 51,520 and 249,776 bytes respectively, a 198,256-byte linked cost paid
by the importer. The plain executable has no `scheme.char` or Unicode-category
symbol in `nm`; the importing executable contains
`scheme.char:%unicode-general-category` and
`scheme.char:code:char-general-category`, confirming that a program without the
import carries neither the character-library artifact nor the new table payload.
