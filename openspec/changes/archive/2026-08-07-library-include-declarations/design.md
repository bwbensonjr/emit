## Context

`parse-define-library` (`src/core.ss:520`) recognizes `export`, `import`, and `begin`, and since
`module-frontend-diagnostics` rejects everything else by name. Four R7RS §5.6.1 declarations are on
the rejected list: `include`, `include-ci`, `include-library-declarations`, `cond-expand`. All four
are **splicers** — each produces more declarations or more body forms *before* any existing
machinery runs — so they belong in one pre-pass rather than four places.

Three constraints shape every decision below.

1. **`src/core.ss` performs no I/O.** That is what lets the same core run under Chez, inside the
   `emit` binary, and inside the REPL. `include` needs a file read.
2. **The Chez driver cannot evaluate `%`-ops.** `src/compile.ss` `include`s the flat core sources
   *as Chez source*, so `%read-file` in `src/core.ss` would be an unbound identifier there. The
   existing answer to exactly this problem is `src/dump.ss`: it rides `CORE_FLAT` (compiled, never
   evaluated by Chez) and the driver supplies its own independent implementation.
   Exploration `library-sources-and-artifacts.md` Finding 3 reached the same conclusion for
   `include` before any of this was written.
3. **The core is handed source *text*, never a path.** Every Chez-free door reads the file in C++
   (`read_file`) and pushes the text through `rt_repl_set`. Nothing downstream knows where the text
   came from — and `include` needs to, because a filename in a `.sld` means "beside this `.sld`".

## Goals / Non-Goals

**Goals:**

- All four declarations work, identically, on every door: the Chez driver, `emit run`, `emit build`,
  `emit lib`, and the REPL's library loader.
- The core keeps its I/O-free property, and the Chez driver keeps `include` (a `%`-op read in
  `src/core.ss` would cost it).
- Diagnostics name the form the user wrote — a missing file names the path *and* the declaration; a
  cycle names the cycle — matching the discipline `module-frontend-diagnostics` set.
- Editing an included file rebuilds the library that included it.

**Non-Goals:**

- `include` / `cond-expand` in program or body position (R7RS §4.1.7, §4.2.1), or at the REPL prompt.
- The `features` procedure from `(scheme base)`. It wants the same declared list, and adding it here
  would create a second derivation of that list — the exact thing `scheme-base-declared-surface`
  removed for the export surface. It should read the declaration this change introduces.
- Target-derived feature identifiers (`darwin`, `x86-64`, `little-endian`, `lp64`, …).
- Import sets, still out of scope everywhere (`only`/`except`/`prefix`/`rename`).

## Decisions

### D1 — One declaration-expansion pre-pass, not four arms in the parse loop

`parse-define-library` first runs `expand-library-declarations`, which rewrites a declaration list
into a list containing only `export`, `import`, and `begin`, recursively:

| declaration | becomes |
|---|---|
| `(cond-expand ⟨clause⟩ …)` | the selected clause's declarations, re-expanded |
| `(include-library-declarations "f" …)` | each file's forms, treated as declarations, re-expanded |
| `(include "f" …)` | `(begin ⟨forms of each file⟩)` |
| `(include-ci "f" …)` | the same, case-folded (D6) |
| anything else | itself |

The existing loop is then untouched: it still sees three declaration kinds, and `check-import-spec`
still validates every import — including one that arrived through a `cond-expand` clause, which is
the reason the expansion must run *before* the loop rather than inside it.

*Alternative rejected*: extra arms in the parse loop. Two of the four splice declarations and two
splice body forms, so the loop would recurse into itself with two different accumulators, and the
import validator would need calling from three places instead of one.

### D2 — The reader is a door-installed side-channel, not a threaded parameter

`src/core.ss` gains `*include-reader*` plus `set-include-reader!`, and calls
`(*include-reader* who filename base)` to obtain a file's forms. Default: a stub that raises
`include: this door installed no source reader ("f.scm")` — a named, recoverable error, not a crash.

`dump` is threaded as a parameter, and this is not, deliberately. `parse-define-library` is called
from the batch doors, the REPL's library loader, the baked-set builder, the driver's toposort, and
`emit lib`'s export-table mode; threading a reader through all of them touches every door for the
benefit of one declaration, and the baked path would have to invent a reader it never uses. A
door-installed global is the same shape as `*dumpf*` in `src/compile.ss` and keeps the core's
property intact: **the core still performs no I/O — it calls a procedure a door gave it.**

### D3 — The reader takes the filename *as written*; the door owns resolution

The core passes the literal string from the source and receives back `(TOKEN . FORMS)`. It never
joins, splits, or normalizes a path — it has no path type and no business acquiring one. Path
resolution, "is this absolute", and the base directory all live in the door's closure. This is what
keeps D1 portable across a Chez `input-port` and a `%read-file` slurp with no shared notion of a
filesystem.

TOKEN is the door's identity for the file it read — its resolved path — and is **opaque** to the
core, which only passes it back as the next call's base and compares it for the cycle check. The
core needs it because expansion of an included file happens *after* the reader returned: the
reader's dynamic extent is not the file's, so a door-side "current file" variable would already be
wrong by the time a nested `include` is reached.

### D4 — A door tells the compiler where the source came from via a new mode

New `rt_repl_set` mode: **set source home**, taking the directory of the source about to be
compiled. The Chez-free doors call it before modes 4 (load a library unit), 7 (compile a program),
11 (`emit lib`'s export table), and 12 (a source's imports). The Chez driver sets the same state
directly. `src/include-reader.ss` builds its reader over that state and `%read-file`.

*Alternatives rejected*: an environment probe in the shape of `%no-prelude?` / `%dump-level` — those
are process-wide flags, whereas this is per-source state that would leak between compiles in a
persistent REPL session and be invisible in the mode protocol. Prefixing each payload with a path
line — changes the contract of four modes to carry one occasional fact.

### D5 — A filename resolves relative to the file that named it

An absolute filename is used as written. A relative one resolves against the directory of the
**including file**, which is the rule the manifest already applies to a library's `(source …)`
(`src/emit.cpp:416`, "manifest paths are relative to the manifest, not to the CWD") — so a library
directory can be copied or installed elsewhere and still find its own pieces. A source with no
path (stdin) resolves against the current directory.

The base is therefore threaded, not global: a file included from `lib/a/x.sld` that itself includes
`"y.scm"` resolves `y.scm` beside *it*, not beside the `.sld`, because the core hands the reader the
token of the file the declaration appeared in (D3). The chain of those tokens doubles as the cycle
guard (D9).

### D6 — `include-ci` folds after reading, in the core

The reader returns forms; the core folds symbol case in a portable walk. The alternative — asking
each host's reader to fold — gives Chez's `read` and Emit's reader two independent implementations
of case folding on a path where a divergence would surface as an unexplained IR difference in
`test/self-emit-equiv.sh`. One fold, in the core, cannot diverge.

**Known limit, documented rather than hidden**: a bar-quoted symbol `|MixedCase|` folds too. After
reading, a bar-quoted symbol and a bare one are the same object, so the distinction R7RS draws is
not observable at the point the fold runs. `include-ci` is a compatibility form for old case-folding
source, which is unlikely to contain bar syntax; a reader-level fold is the fix if it ever matters.

### D7 — Advertised features are one declaration, and short

The list lives in one place next to the rest of the front-end declarations, and starts at:

| feature | why it is true here |
|---|---|
| `r7rs` | Emit targets R7RS-small; the identifier is how a program asks "is this an R7RS Scheme" |
| `emit` | the implementation name, as R7RS ⟨name⟩ |
| `ieee-float` | inexact numbers are IEEE 754 doubles (`inexact-numbers`) |

Deliberately **absent**: `exact-closed` — Emit traps on fixnum overflow rather than promoting to a
bignum (`fixnum-overflow-trap`), so `*` on exact inputs may produce *no value at all*, which is not
what the identifier promises; `full-unicode`, `ratios`, `exact-complex` — untrue; OS/CPU/endianness
flags — a non-goal above. A version identifier (`emit-0.1.0`) becomes available and honest once
`homebrew-tap-distribution` establishes the first tag; it is not invented here.

### D8 — `(library ⟨name⟩)` is rejected by name, and inherits the vacated wording

R7RS lets a feature requirement be `(library (scheme base))`, meaning "this library is available".
Answering it truthfully requires the manifest chain — which the parser does not see, and which
differs per door — and a *wrong* answer is the worst failure this change could introduce, because it
silently selects the other clause and reports nothing. So it is named and refused, taking over the
"a recognized R7RS form this stage does not support" message that `include` and `cond-expand` are
vacating. Everything else — feature identifiers, `and`, `or`, `not`, `else` — is supported.

### D9 — A cycle is named; depth is not capped

The include stack holds the tokens (D3) of the files currently being expanded, in the core.
Encountering a token already on the stack is an error naming the cycle. It is not a depth counter: a legitimately deep include chain should work, and a
cycle is the actual defect. Note that including one file twice in *different* branches is legal and
stays legal — the check is against the stack, not against every file ever read. Only
`include-library-declarations` can actually build a cycle: an `include` inside an included *body*
file is program-position `include`, which this change does not implement, so a body splice never
recurses.

### D10 — The `.stamp` records the include list, and the stamp version bumps

`artifacts-fresh?` (`src/compile.ss:552`) compares one source's mtime against the artifact's. With
`include`, a library has several sources, and the ones that are not the `.sld` are invisible to it —
so editing an included file would leave a stale unit in place with a `reuse … [fresh]` line claiming
otherwise. The unit's `.stamp` therefore records the resolved include list, and freshness requires
the artifact to be newer than every entry. `compiler-stamp-version` bumps to force one global
invalidation, since the sidecar's shape changes.

*Alternative rejected*: hashing the post-splice source. It reads every included file anyway and
replaces the mtime rule the cache already uses with a second one.

`emit lib` recompiles unconditionally and needs nothing here.

### D11 — The imports query splices before answering

Mode 12 answers "which libraries does this source import" and drives the run door's lazy preload
closure. An `import` can now arrive through `include-library-declarations` or a `cond-expand` clause,
so the query must run the D1 expansion — otherwise the closure walk misses a dependency and the
program fails with `unresolved or cyclic import (dependency missing from manifest?)`, blaming the
manifest for something that is in the source. That is precisely the misattribution class
`module-frontend-diagnostics` set out to eliminate.

### D12 — A baked library resolves `cond-expand` at bake time; say so

`(scheme base)` and the rest of the baked set are compiled from source that is part of the compiler,
so their feature requirements are resolved against the compiler that baked them, not against the
importer's compile. For the baked set that is arguably the correct reading — they *are* the
implementation. For a manifest library nothing changes: it is compiled when it is imported. No
shipped library uses `cond-expand` today, so this commitment costs nothing now and is stated so #31
(baking `lib/scheme/base.sld`) inherits a decision rather than a surprise. This answers open
question 4 of `library-sources-and-artifacts.md`.

## Risks / Trade-offs

- **Two readers now read the same included file.** Chez's `read` under the driver, Emit's reader in
  the binary. A grammar divergence (brackets, block comments, datum labels) becomes an IR difference
  rather than a parse error → the equivalence suites already diff the two hosts' output; add an
  included file that deliberately exercises brackets, `#| |#`, quasiquote, and characters, so the
  suites are actually looking at this.
- **A door that forgets to set the source home resolves against the current directory.** Silent and
  correct-looking from the repo root, wrong from anywhere else — the exact failure mode
  `manifest-search-path` and `baked-set-on-every-door` each had to fix once → the new suite runs from
  a temporary directory outside the repo, the way `test/project-door-tests.sh` does, on every door.
- **"The source" is no longer one file**, so anything keyed on the source path — narration lines,
  dump tags, the stamp — is now describing a set → narration names the included files at verbose
  level, and the stamp holds the list (D10).
- **`cond-expand` freezes into baked artifacts** (D12) → stated as a commitment, and no shipped
  library uses it.
- **Emitted IR should not move at all** (no shipped library uses these declarations), so
  `test/module-scaffold-baseline.sha256` should not need re-recording. If it does, that is a signal
  the pre-pass perturbed something — most plausibly the gensym counter — and the delta gets explained
  before the baseline is touched, per that script's protocol.
- **`make regen` is required** (`src/core.ss` and `src/repl-core.ss` both change), so the barrier in
  `CLAUDE.md` applies: finish every compiler-source edit first, then regen, then the suites.

## Open Questions

1. Should `features` (R7RS `(scheme base)`) land in the same change after all? It is small, but it
   moves the declared list from a compile-time constant to something a running program reads — one
   derivation or two is the question `scheme-base-declared-surface` already answered once.
2. `include` in program position is the same splicer at a different site. Worth filing as its own
   issue once this lands, or worth folding in when someone asks?
