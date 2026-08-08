## Context

Issue #63 reports `emit build` segfaulting when the manifest is absent or empty, and proposes a
guard in `src/emit.cpp`: test `mtext.empty()` before crossing into Scheme. Investigation shows that
guard is **necessary-looking but insufficient**, and that the crash is neither where nor what the
issue supposed.

**Where the fault actually is.** `read-all-from-string` (`src/prelude.scm:1392`, over `rd-all`)
returns "the top-level forms in source order (the empty list for empty or whitespace/comment-only
input)". A manifest is a single top-level form — a list of entries — so all three manifest parsers
take the first form:

```scheme
(let loop ([es (car (read-all-from-string text))] [acc ""]) …)   ; :387, :407, :474
```

For a manifest with no datum, `read-all-from-string` returns `()`, and `(car '())` is unchecked:
`rt_car` is `val rt_car(val v) { return as_ptr(v)[0]; }` (`src/runtime/runtime.c:143`). That is
deliberate — `core-language` states "the runtime applies the SAME unchecked semantics it already
applies to any type confusion — e.g. `(car x)` for a non-pair `x`" — so the fault is the parser
calling `car` on a value it never established was a pair.

**Why the proposed C++ guard is insufficient.** Verified against `build/emit` at 562ae62: a
manifest holding only a comment, and one holding only whitespace, both still segfault. Neither is
byte-empty, so `mtext.empty()` is false and the guard never fires. Emptiness that matters here is
*no datum*, which only the reader can decide — comments and block comments are its grammar. A C++
re-implementation of that test would be a second reader, which is exactly what the Chez-free
single-grammar design exists to avoid.

**Blast radius is two doors, not one.** `emit run` segfaults on the same manifests (mode 9,
`repl-manifest-user-paths`), and mode 5 (`repl-manifest-paths`) carries the identical expression.
`emit repl` and `emit lib` were checked and do not crash on these inputs, but they reach the same
parsers on other paths, so all three sites are fixed together rather than only the one with a
reproduction.

**A fourth site, found while auditing the others.** `repl-load-library-text` (mode 4,
`src/repl-core.ss:349`) takes `(car forms)` of a *library source*'s read, and a library source that
exists but holds no datum reaches it. Verified: a manifest naming a comment-only `.sld` that a
program imports segfaults `emit run` (exit 139). The byte-empty case is masked because the host folds
an empty read into "cannot read library source" (`src/emit.cpp:1025`, `:595`) and never calls mode 4
— which is also why `test/project-door-tests.sh` case 20, whose comment records this same
`(car '())` crash for an *unreadable* source, passes today without any Scheme-side guard.

This site needs a **different** answer than the manifest parsers, and D2 splits accordingly: an empty
manifest declares nothing and is benign, whereas an empty library source cannot yield the
`define-library` the caller requires and is an error.

## Goals / Non-Goals

**Goals:**

- No door terminates on a signal for any manifest text.
- A manifest with no datum resolves exactly as no manifest does, per the existing non-fatal
  requirement.
- `emit build` distinguishes "no manifest found" from "manifest declares no entries" from "no
  `program` entry", since the three call for different user actions.
- One fix, three call sites: the parsers stop assuming a non-empty read in one shared place.

**Non-Goals:**

- **Making `car`/`cdr` checked.** A stated `core-language` decision with R7RS latitude behind it,
  and revisiting it is a tower-wide performance question (`docs/PERFORMANCE.md`), not a manifest
  fix. This change does not weaken or cite it as a defect.
- Changing the manifest grammar. That a manifest is one top-level form, and that a second form is
  silently ignored by `car`, is existing behavior; it is noted below as a follow-up, not fixed here.
- Any change to import resolution, library chaining, or narration.

## Decisions

### D1: Fix in Scheme, keep the C++ change to diagnostics

The crash is fixed entirely on the Scheme side, where the reader's notion of "no datum" lives. The
`src/emit.cpp` edits carry **no correctness load** — they only improve which message is printed
once the door is guaranteed to return normally. This keeps the two concerns separable: if the
message wording is revised later, no crash can come back with it.

*Alternative considered:* the issue's `mtext.empty()` guard alone. Rejected — it leaves the
whitespace-only and comment-only manifests crashing, both verified.

### D2: One shared helper for "the manifest's entry list"

Add a single accessor next to the three parsers and route all of them through it:

```scheme
;; The manifest's entry list: its first top-level form, or () when the text holds no
;; datum (empty / whitespace-only / comment-only).  `car` is unchecked (core-language),
;; so the pair test is what keeps a datum-free manifest from faulting the door.
(define (manifest-entries text)
  (let ([forms (read-all-from-string text)])
    (if (pair? forms) (car forms) (quote ()))))
```

Each of `repl-manifest-paths`, `repl-manifest-user-paths`, and `repl-manifest-programs` then loops
over `(manifest-entries text)`. The loops themselves already terminate correctly on `()`, so no
other change is needed in any of them.

*Alternative considered:* guarding each site inline. Rejected — three copies of the same pair test
is how the third one gets missed, which is how this defect reached three sites to begin with.

**The walks terminate on `pair?`, not `null?`.** Found while reviewing the above: a manifest whose
top-level form is not a *proper list* crashes the same way, because the loops only stop at `()`.
Verified — `hello`, `42`, `"str"`, and `(a . b)` each segfault `emit run` (exit 139). Changing each
loop's termination test from `(null? es)` to `(not (pair? es))` makes the walk total: it stops at a
proper list's `()`, at an improper list's non-pair tail, and immediately on a manifest that is a bare
atom. One predicate covers every shape, rather than enumerating them — which matters because the
enumeration is what this defect has already defeated twice.

For modes 5 and 9, whose channel is a bare string with no error arm, a non-list manifest therefore
yields no libraries — non-fatal, exactly as the `module-system` requirement wants, with any real
failure surfacing as an ordinary unresolved-import error that names the library.

**The library-source site takes the error idiom instead.** `repl-load-library-text` (mode 4) cannot
treat "no datum" as benign — its caller needs a `define-library` form, and there is none. It is
already wrapped in `(guard (e (#t (cons (quote error) …))))`, so it uses the shape
`compile-one-form-text` (`src/repl-core.ss:159`) already established for exactly this case:

```scheme
(if (null? forms)
    (cons (quote error) "empty form")        ; the existing precedent, mode 14
    …)
```

becoming, for mode 4, an error naming the library source as holding no `define-library`. Reusing that
idiom rather than inventing a second one keeps the two empty-read outcomes — benign `()` for a
manifest, error status for a source — visibly different at each call site.

### D3: Mode 10 returns a status pair so the build door can name the cause

`emit build` needs to tell an entryless manifest from a library-only one, and only the Scheme side
can decide "no datum". Mode 10 currently returns a bare string of program triples. Change it to the
`(status . payload)` convention **already used by modes 4 and 8**, for which `src/emit.cpp` already
has `status_of` and `door_msg`:

- `(ok . TRIPLES)` — zero or more program entries, current wire format unchanged;
- `(error . "…declares no entries…")` — the text held no datum.

`resolve_program` then reports three cases: `manifest.empty()` → no manifest found (naming
`kManifestName`, not an empty path); `status_of(…) == "error"` → the Scheme-side message; and the
existing `progs.empty()` branch → no `program` entry.

*Alternatives considered:* (a) a sentinel first line such as `#no-entries` — rejected, it shares a
namespace with program names and cannot be made collision-proof; (b) merging cases 2 and 3 into one
message naming the manifest — cheaper, and honest for both, but loses the distinction between "you
have not written your manifest yet" and "your manifest declares libraries but no program", which is
the more useful half of this fix. If the protocol churn proves worse than expected during
implementation, (b) is the fallback and the `project-build` spec's first two scenarios collapse
into one.

### D4a: The program path names its unresolved imports, as the library path already did

Found by the fixture for the "unresolved import under an entryless manifest" scenario: `emit run`
reported the constant `program imports a library not found in the manifest`, naming nothing, in every
case — no manifest, entryless manifest, and a well-formed manifest lacking the entry. `emit lib` two
hundred lines away reported `unresolved import (not baked, not in the manifest): (absent)`. Same
failure, two messages, and only one of them actionable.

`module-system` already required the name — "the resulting failure SHALL be reported by import
resolution, naming the unresolved library" — so this is a conformance gap, not a new feature, and the
delta spec's scenario here would otherwise have shipped unmet.

The fix is a factoring, not new logic: `lone-library-unresolved-msg` becomes `unresolved-imports-msg`
over the import NAMES, because the program path already holds them as `direct` while only the
library path has a form to parse them out of. Pre-existing rather than introduced by this change, and
folded in because it is four lines inside a regen cycle this change is already paying for — the
alternative was a third issue whose fix would need its own eleven minutes.

*Cost:* a second `make regen`. Accepted deliberately.

### D4: Fixtures assert exit status *and* message, on both doors

Every case here exits non-zero, so a status-only assertion passes when the wrong message is
printed — and passing the *wrong* diagnostic is the failure mode this change exists to remove.
Each fixture pins the message text. A signal-death assertion (exit < 128) is worth its own check,
since that is the regression being prevented.

## Risks / Trade-offs

- **`src/repl-core.ss` is in `CORE_FLAT`** → this costs a full `make regen` (~12 min) plus both
  suites, and `make regen` is a barrier: every source edit lands before it starts. The C++ half
  reaches the binary through plain `make`, so it can be developed and tested first; iterate the
  Scheme half through `chez --libdirs src --script src/compile.ss` and regen once at the end.
- **Mode 10's contract changes on both sides at once** → a half-applied change leaves `emit build`
  reading a status pair as a triple string, or vice versa. Both sides are in one commit, and
  `test/project-door-tests.sh` covers the ordinary build path, so a mismatch fails loudly rather
  than silently resolving the wrong program.
- **The `(error . …)` payload for an entryless manifest is a message, not a condition** → wording
  lives in Scheme while the other two cases' wording lives in C++. Accepted: it is the only way the
  reader's decision reaches the door, and D1 keeps it out of the crash-fix path.
- **The existing grammar silently ignores a manifest's second top-level form** (`car` takes only
  the first). Out of scope, and unchanged by this fix — but now visible in one place rather than
  three. Worth a follow-up issue after this lands.

## Open Questions

- Should `emit build`'s "no manifest found" message list the searched candidates (the chain from
  `resolve_manifests`) rather than just `emit-libs.scm`? More helpful for an installed Emit, more
  noise for a project. Deferred to implementation; the spec requires only that the filename be
  named rather than an empty path.
