## Why

Emit's 13,229 lines of hand-authored Scheme are formatted by hand, so layout is a
per-file negotiation rather than a property of the tree. Pitch — a reflowing,
safety-checked Scheme formatter that Emit itself compiles — is now installable and
produces verified output on every one of these files, which makes mechanical formatting
available for the first time. Adopting it removes layout from review, and it closes the
loop on the toolchain: the compiler's own sources are formatted by a tool the compiler
builds.

A measurement pass over the candidate set (recorded in `design.md`) establishes both that
this is safe and that it is not yet ready to land as a rewrite. Pitch refused nothing:
38 of 38 files passed all four safety layers, which means token equivalence, datum
equivalence, and idempotence held on the whole corpus. But its current output collides
with two deliberate house conventions in ways no project configuration can reach —
long quoted data tables explode to one item per line, and 372 column-aligned trailing
comments collapse to a single space. A project configuration was written and measured to
find out how much it could absorb: it takes the diff from 9,795 changed lines to 9,219,
and what remains is those two collisions. So this change establishes the *policy and the
tooling* now, and defers the
reformat itself behind named upstream fixes, rather than degrading the tables and comment
columns to get formatting sooner.

## What Changes

- **A declared covered set.** One list, in one place, names the 32 hand-authored Scheme
  files the formatter owns: `src/*.{scm,ss}`, `src/passes/*.ss`, the six hand-authored
  `lib/**/*.sld`, `tools/*.ss`, and `emit-libs.scm`. Generated Scheme
  (`lib/scheme/base.sld`, `cxr.sld`, `read.sld`, `file.sld`, `lib/emit/internal.sld`,
  `lib/scheme/char-data.scm`, `build/*.scm`), vendored code, `historical/`, `demos/`, and
  `test/` are outside it. The generated files are excluded on principle, not
  convenience: their generators write their bytes and byte-identical guards
  (`test/scheme-base-gen-check.sh`) own their formatting, exactly as Pitch excludes its
  own generated reader.
- **A project Pitch configuration**, `pitch.scm`: the resolved width, the dialect per
  file group, and two style entries — `((match) (_ e . dc*))` so the compiler's
  pattern-matching passes lay out under a declared rule rather than the generic fallback,
  and `((define-library) (_ d . body))` so the authored R7RS libraries keep their indented
  bodies. Measured, the two together remove 576 of the 9,795 changed lines and account for
  every improvement in the six authored `.sld` files.
- **Two Makefile doors**, `make format` and `make format-check`, wrapping a single
  `tools/format.sh` that holds the covered-set policy and the per-group dialect
  selection. Both narrate per `docs/OUTPUT.md`: files considered, files that would
  change, elapsed time.
- **An opt-in pre-commit hook**, installed by a Makefile target, checking only the
  *staged* covered files. Full-tree checking is too slow for a hook — the covered set
  costs ~7.4 min single-threaded, and `src/prelude.scm` alone is 112 s — while a typical
  staged set costs seconds.
- **Named upstream blockers**, now filed: `bwbensonjr/scheme-pitch#13` (filled layout for
  overflowing quoted data lists) and `#14` (preserve trailing-comment column alignment).
  The one-time reformat is sequenced behind those two and nothing else. `#15` records
  pitch's superlinear formatting cost and does not block.
- **The one-time reformat**, as the change's final step once those land: a single commit
  containing nothing else, plus `.git-blame-ignore-revs`, followed by `make regen` and
  both suites. Because the committed IR carries no debug metadata, the reformat is
  checkable rather than merely believed: `bootstrap/schemec.ll`,
  `bootstrap/scheme.base.ll`, and `bootstrap/emit.internal.ll` must come back
  byte-identical, and `embed.ll`/`embed-repl.ll` must differ only inside the baked
  `*prelude-source*` string constant.

Non-goals: formatting `demos/` (whose hand layout is part of their teaching value),
`test/`, or `historical/`; introducing CI to a repo that has none; adding a formatting
suite to `run-dev-tests.sh`; and making Pitch a hard build dependency of Emit — Emit
compiles Pitch, so Emit's own build and test path must never require it.

## Capabilities

### New Capabilities

- `source-formatting`: The covered set of hand-authored Scheme sources, the resolved
  Pitch configuration and dialect assignment, the two invocation doors and their
  narration, the staged-file pre-commit gate and its skip behavior when Pitch is absent,
  and the semantics-preservation evidence the one-time reformat must produce.

### Modified Capabilities

- `tooling-observability`: the enumerated list of project tools required to conform to
  the observability principle gains the formatting tool and its Makefile doors.

## Impact

- **New files**: `pitch.scm`, `tools/format.sh`, the pre-commit hook template,
  `.git-blame-ignore-revs`.
- **Modified**: `Makefile` (`format`, `format-check`, hook install target), `CLAUDE.md`
  (the formatting rule and its interaction with the `make regen` barrier), and — in the
  final step only — 29 of the 32 covered source files.
- **Regen barrier**: the reformat touches `CORE_FLAT` and `src/prelude.scm`, so it is a
  barrier crossing in the sense `CLAUDE.md` defines. It must be the only change in its
  commit, and it costs one full `make regen` (5 self-compiles, ~22 min) plus
  `./run-all-tests.sh` and `./run-dev-tests.sh`.
- **Dependencies**: Pitch becomes an optional developer tool, pinned by version, resolved
  from `PATH`. Pitch's layout is explicitly not yet stable — its shipped cost objective is
  the reference implementation's and is expected to change — so an unpinned upgrade would
  silently invalidate the formatted tree.
- **External**: three issues filed against `bwbensonjr/scheme-pitch` — #13 and #14 block
  the final step of this change and nothing else in it; #15 blocks nothing.
- **Performance debt**: Pitch's cost on large files is superlinear enough to shape this
  design (112 s for 2,477 lines; 191 s for the 2,397-line generated Unicode table). That
  belongs in Pitch's backlog, not Emit's, but it is why the gate checks staged files
  rather than the tree.
