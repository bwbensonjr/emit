## Context

This is the direct successor to `reader-lexical-conformance`, which built the machinery this change
reuses. That change's design D2 established the arrangement: the reader's lexeme layer cannot raise,
so an unterminated construct travels outward as a **negative index sentinel** encoding the position
it opened at, and the *entry point* — where `error` is in scope — turns it into a diagnostic. It
applied that to `#|`, `|`, and the eof/unexpected cases. It did not apply it to lists or strings.

The unfixed code is two `else` arms that treat end of input as a terminator:

```scheme
(define (rd-list s n i acc ci)
  ...
      [else (cons (reverse acc) j)])))          ; src/prelude.scm:1326 -- j is n

(define (rd-string s n i)
  ...
        (cons (list->string (reverse acc)) i))))  ; src/prelude.scm:1201 -- i is n
```

Both **fabricate a datum the source does not contain**. Five facts constrain the fix.

1. **The sentinel already carries a position; `rd-list` and `rd-string` do not know theirs.**
   `rd-fail-code` encodes position `p` as `-3 - p`, and `rd-report` renders it. But `rd-list` is
   called with the index *after* the opening delimiter and never learns where that delimiter was, so
   the opening position — the thing that makes the message useful — has to be threaded in.
2. **The reader lives in the substrate and cannot raise.** `scheme-base-partition` design D10 keeps
   `error`/`raise` out of `(emit internal)`. Every `rd-*` is total. Only the entry points report.
3. **The REPL probe is a separate implementation, and must stay divergent.** `fc-list`, `fc-string`
   and `fc-bar` (`src/repl-core.ss:768-860`) already return `fc-incomplete` for exactly these
   constructs — which is *why* multi-line entry works today. The probe runs **before** the reader,
   so making the reader report cannot break the prompt. The two must give different answers for the
   same text, permanently.
4. **`rd-report` exists in two copies.** `src/prelude.scm` and `lib/scheme/read.sld` — `(scheme
   read)` cannot import a private name, the arrangement `%check-input-port` already has. The
   `read.sld` copy is **generated** from the prelude, so both move by regeneration, not by hand.
5. **Every new prelude definition forces a visibility decision.** A name that is neither listed
   private in `src/prelude-surface.scm` nor exported fails `test/scheme-base-surface-check.sh`.

On the manifest side, `manifest-empty-guards` consolidated three parsers into one `manifest-entries`
(`src/repl-core.ss:446`), whose `(car forms)` discards `(cdr forms)`. That change's spec explicitly
deferred the truncated-manifest case to this one.

## Goals / Non-Goals

**Goals:**

- Every construct with a closing delimiter reports at end of input, naming the position it **opened**
  at: `(`, `[`, `#(`, `#u8(`, `"`, and the dangling-escape case.
- One mechanism, shared with `#|` and `|`: the existing sentinel and one `rd-report` arm per reason.
- The prompt is unchanged — a list, a string, and a comment can each still be typed across lines.
- A truncated manifest is reported instead of built from; a two-form manifest is reported instead of
  half-read.
- Every consumer of `read-all-from-string` inherits the fix without its own check.

**Non-Goals:**

- Bounds-checking indexed access generally (issue #70). The dangling escape is fixed here because it
  is a reader bug reachable from a source file; `vector-ref`/`string-ref` are a separate change with
  a performance trade-off this one does not want to carry.
- Concatenating multi-form manifests (D5 rejects it, for now).
- Reporting a *line and column* rather than an index. The reader has only an index today and every
  existing message uses one; changing that is a uniform improvement to all of them, not this change.
- Recovering and continuing after an unterminated construct. One report, then stop.

## Decisions

### D1 — Thread the opening index into `rd-list` and `rd-string` as a parameter

`rd-list` gains an `open` parameter (the index of the construct's **first character**) and `rd-string`
likewise. Both are private, recursive, and called from few places — `rd-datum`'s dispatch, `rd-hash`'s
`#(` and `#u8(` arms, and `rd-list`'s own tail recursion — so threading is mechanical.

The opening index is the first character of the *construct*, not of the delimiter that closes it: for
`#(` it is the `#`, not the `(`. That lets one message name `#(` rather than reporting a bare `(` at
an index whose character is `#`.

*Alternative rejected*: have the **caller** catch the eof result and attach the position, leaving
`rd-list`'s arity alone. It reads well at the `rd-datum` dispatch, but `rd-list` recurses on itself
for every element, so the position would have to be re-attached at each level and the innermost
unterminated construct — the one the author actually left open — would be overwritten by its
enclosing list on the way out. Nesting is exactly the case that has to be right (spec scenario "An
unterminated construct nested inside another names the inner one"), so the position travels *down*.

*Alternative rejected*: a mutable "last open" cell in the reader. Cheaper to write, and wrong: the
reader is reentrant through `#;` and the compiler reads nested sources.

### D2 — Two new reasons, not one, and not one per delimiter

`rd-report` gains `rd-unterminated-list` and `rd-unterminated-string`. The list reason covers `(`,
`[`, `#(`, and `#u8(`; its message names the actual opening delimiter by reading the one to four
characters at the reported position out of the source, which the reporting layer already does for
other messages (`rd-token-at`). So the message is specific without four reasons carrying identical
handling.

**Refinement found while implementing:** the delimiter decode is written **inline in `rd-report`**
rather than as an `rd-open-name` helper. `rd-report` is duplicated into `(scheme read)` through the
declared set `*reader-report-shared-with-read*` (`src/prelude-surface.scm:363`), because `(scheme
read)` cannot import a private name — so a helper `rd-report` called would have had to join that set
to travel with it, making a one-line naming detail into a change to the partition declaration. An
inline `cond` costs five lines in a duplicated procedure and touches no declaration. Confirmed that
`rd-list` and `rd-string` themselves are *not* duplicated — `(scheme read)` imports them from
`(emit internal)` — so only the reporting layer has two copies.

The string reason is separate because its message differs in kind — there is no delimiter variant to
name, and the dangling-escape case wants to be recognizable as the same unterminated string rather
than a distinct error the user has to interpret.

*Alternative rejected*: one `rd-unterminated` reason for everything, distinguished entirely by the
character at the position. It works, but `rd-report`'s existing arms are one-per-construct
(`rd-block-comment`, `rd-bar`, `rd-eof`, `rd-unexpected`, `rd-rational`), and matching that shape
keeps the report table readable as a list of the things that can go wrong.

Message form follows #59's, which is the one this change is generalizing:

```
read: unterminated list ( opened at index 9
read: unterminated vector #( opened at index 12
read: unterminated string " opened at index 9
```

### D3 — The dangling escape is a bounds test, and it belongs to the string reason

`rd-string` reads `(string-ref s (+ i 1))` after a backslash with no check that `i + 1 < n`, so a
source ending in `"abc\` reads past the end of the input. Today that returns whatever
`rt_string_ref` finds there, because indexed access is unchecked (issue #70) — so the bug is
currently *invisible* rather than a crash, which is the worst version.

The guard is `(< (+ i 1) n)`, failing to `rd-unterminated-string` with the string's opening index.
The `\xHH;` path needs the same treatment where `rd-hex` can run off the end.

This is the one place this change touches #70's territory, and deliberately: fixing the reader's
own out-of-bounds read does not depend on the tower-wide decision, and leaving it would mean shipping
a reader that reports the *simple* truncation and silently mis-reads the subtle one. Note the fix is
correct whether or not #70 later lands — a checked `string-ref` would turn this into a trap, and a
trap in the reader is still worse than a diagnostic naming the unterminated string.

### D4 — The probe is not touched, and the divergence is specced rather than left implicit

`fc-list` and `fc-string` already answer `fc-incomplete`; verified by entering a multi-line list at
the prompt. So this change adds *no* probe code — which is a claim worth pinning with a test, because
the natural instinct on reading the two implementations is that they duplicate each other and should
be unified. Unifying them would destroy multi-line entry.

The `compiler-embedding` delta therefore states the divergence as **directional and intended**: the
probe answers incomplete where a batch read errors, because a host reading a stream can supply more
input and a file cannot. Without that in the spec, the next person to notice the duplication has
nothing telling them it is load-bearing.

The existing scenario "The probe and the reader answer for the same text" still holds and is the
right invariant: it constrains agreement on text the reader *accepts*, and says nothing about text it
rejects — which is exactly the seam where the two are allowed to differ.

### D5 — A multi-form manifest is rejected, and the count is reported by the core

`manifest-entries` reports when `read-all-from-string` yields more than one form. Rejecting rather
than concatenating is the grammar decision argued in the proposal: it is the smaller change, it
enforces the documented grammar rather than widening it, and it is the direction that can be reversed
later. Concatenation is a one-way door taken by accident if taken now.

**The chain does not conflict with this**, which was the risk worth checking: `resolve_manifests`
returns a vector of *paths* and the host reads and parses each one separately —
`rt_repl_set(9, mtext…)` sits inside `for (mi…)` (`src/emit.cpp:530-534`, and the same shape at
:1004-1016). Nothing concatenates manifest texts, so "exactly one form" is a per-file rule and an
extending chain of three manifests is still three single-form files.

**Naming the manifest.** The mode entry points receive only text — the host owns file I/O and paths
(modes 5, 9, 10 take `(repl-input)`). So the core's message names the *count*, and the path comes
from the host, which has it in the loop variable at each call site. The existing narration already
prints every manifest it resolved before parsing begins, so even without a host change the user sees
the candidate list immediately above the error; but with a chain of three that is ambiguous, so the
host names the manifest it was parsing when the report arrives. That is a small addition at a site
that already has the string.

*Alternative rejected*: threading the path through the mode protocol so the core can name it. It
changes the C++/Scheme boundary for three modes to move a string the host already holds.

**Correction found while implementing — there are TWO manifest parsers, not one.** Issue #67 and this
change's proposal both state that `manifest-empty-guards` consolidated the three parsers into
`manifest-entries`. It consolidated **two**: `repl-manifest-paths` and `repl-manifest-user-paths`.
`repl-manifest-programs` (mode 10) kept its own inline `(read-all-from-string text)` + `(car forms)`,
because it alone returns an `(ok . _)` / `(error . MSG)` status pair and `manifest-entries` raises.

Fixing only `manifest-entries` therefore left the **build door** still dropping the second form: it
resolved the program from form one, narrated `build <sole program> -> p`, and only failed later when
the library preload (mode 5/9) parsed the same text. Observed exactly that way before the fix.

So the form-count *rule* is factored into `manifest-extra-forms` and applied at both sites, with the
wording differing per channel because each prepends its own context. That turns out to be a *better*
outcome than one shared parser would have been, for a reason worth recording: **mode 10's status pair
is the only manifest channel that can name the file.** The host prints `emit: manifest PATH <msg>`
(`resolve_program`, `src/emit.cpp:650`), so routing mode 10's failure — including a *reader* raise,
caught by a new `guard` — through that pair satisfies D5's path-naming for `emit build` with no host
change at all. Modes 5 and 9 return bare strings and still need the host-side guard.

### D6 — Expect every program's IR to move, and say why

The reader is in `(scheme base)` and in the baked substrate, so this change moves emitted IR for
every program — the same situation `reader-lexical-conformance` design D6 describes.
`lib/scheme/base.sld`, `lib/scheme/read.sld` and `lib/emit/internal.sld` are generated committed
inputs and must be regenerated in this change or the guards fail, and
`test/module-scaffold-baseline.sha256` is re-recorded with the delta *explained* per the baseline
protocol. The explanation here is "`rd-list`/`rd-string` gained a parameter and `rd-report` gained
two arms", which should be a small, uniform delta rather than a structural one.

## Risks / Trade-offs

- **Something well-formed today starts reporting.** → The blast radius is every source Emit reads,
  including its own: `CORE_FLAT`, every `.sld`, every `.exports` artifact, and `include` files. All
  are well-formed, so none should move; the way this bites is a *fabricated* construct somewhere in
  the toolchain that happened to rely on the silent close (a generated file missing its last paren
  would have been "working"). Mitigation: run the full suites plus `make regen` to a fixed point —
  a self-hosting compiler that reads its own source is the strongest available test that nothing
  legitimately relied on the old behavior, and a regen that converges proves it.
- **Threading `open` through `rd-list` costs a parameter on a hot recursive path.** The reader is the
  compiler's own hot path (`PERFORMANCE.md` P9 is about exactly this class of cost). → One extra
  fixnum argument on an already-5-argument internal call; no allocation, no indirection, and no new
  call site. Worth a before/after on regen wall-clock, and worth recording in `PERFORMANCE.md` only
  if it shows.
- **The prompt regresses without anyone noticing.** Multi-line entry is interactive, so no existing
  batch suite covers it directly. → The `compiler-embedding` scenarios add a probe assertion *and* a
  session-level assertion that a list typed across two lines still evaluates.
- **The manifest rejection breaks an existing project.** Any manifest in the wild with a trailing
  second form starts failing. → That is the point, and pre-tag is when it costs least: the only
  manifests that exist are in this repo and in test fixtures. Mitigation is that the message says
  what to do (one list of entries), not merely that something is wrong.
- **A chained manifest's report is ambiguous about which file.** → D5's host-side naming; a test
  fixture with a two-manifest chain where the *second* is malformed.

## Migration Plan

No user migration beyond the manifest grammar, which is enforcement of the documented shape rather
than a change to it. Order of work: reader first with its tests (it is self-contained and the
manifest fix depends on it), then the manifest, then one `make regen` at the end per the build
workflow barrier — the reader and `manifest-entries` are both in `CORE_FLAT`, so they share one
regen cycle rather than needing two.

Rollback is per-piece: the reader change and the manifest change are independent commits, and either
reverts without the other.

## Open Questions

- Does the host's per-manifest error naming (D5) want to be a general "which manifest was being
  parsed" context line, reusable by the other manifest diagnostics, rather than one message? Decide
  while implementing; it is a C++-local shape question.
- Should `rd-report`'s messages carry a line/column rather than an index? Out of scope here (all
  existing messages use an index), but this change adds four more index-based messages, which
  strengthens the case for doing it uniformly later. File it if the messages feel weak in practice.
