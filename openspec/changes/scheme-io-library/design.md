## Context

The language's I/O surface today is four output procedures that all target stdout implicitly
(`display`, `write`, `newline`, `write-char`), plus `%read-all-stdin`. `io-output-primitives`
(archived) added two of those and recorded ports and all input as explicit non-goals. Nothing has
filled that gap since.

What makes the gap cheap to close is that three of the hard parts are already built, for other
reasons:

| piece | state today | what this change does with it |
|---|---|---|
| the printer | `print_val(FILE *out, val v, int display)`, shared by `rt_display` / `rt_write` / `rt_stderr_write` | choose `out` from a port instead of hard-coding `stdout` |
| the reader | `rd-datum s n i` → `(datum . next-index)`, looped by `read-all-from-string` | one call **is** one `read` against a cursor |
| the eof object | tag 001 misc-immediate family, `SUB_BOOL 0` / `SUB_CHAR 1` / `SUB_UNSPEC 2`, comment reserves "further singletons (eof-object)" | take subtype 3 |

And three things genuinely are missing, which is what bounds the scope: there is no `make-parameter`,
no `parameterize`, and no `dynamic-wind`. Every R7RS I/O procedure whose semantics rest on dynamic
binding is therefore out of reach until those exist.

Records are available (`%make-record-type`, `%make-record`, `%record-ref`, `%record-set!`,
`%record-of-type?`) and bytevectors are available, so neither ports nor binary I/O is blocked on the
object model.

## Goals / Non-Goals

**Goals:**

- A program can open a file, read it by character / line / datum, write to another file, and close
  both — the round trip that is impossible today.
- `read` over a port, reusing the existing reader rather than writing a second one.
- Port-directed output as an **optional argument**, so every existing program's behaviour and
  emitted code are unchanged when the argument is omitted.
- Keep the compiler core I/O-free. This change gives the *language* file access; `src/core.ss`
  continues to perform none, and issue #18's `include` would still take an injected reader.

**Non-Goals:**

- **`with-output-to-file`, `with-input-from-file`, and `current-*-port` as parameter objects.** All
  three need dynamic binding, and the implementation has no `make-parameter` / `parameterize` /
  `dynamic-wind`. `current-output-port` etc. ship as procedures returning fixed ports (D4); making
  them rebindable is a separate change that starts with parameter objects.
- **Binary ports** (`read-u8`, `write-u8`, `open-input-bytevector`, …). Feasible — bytevectors
  exist — but a second port flavour doubles the surface for no current payer. Textual only.
- **Streaming input.** Input ports slurp at open (D2), so a file larger than memory cannot be read,
  and an interactive stdin port cannot see input written after it is opened. Accepted; see the risk.
- **`delete-file`, `file-exists?`, directory operations** — R7RS `(scheme file)`, adjacent but
  separate.
- Fixing issue #18. This unblocks it; it does not do it.

## Decisions

### D1 — A port is a record; a live OS file is a small integer into a runtime table

A port needs to carry state (a cursor, a buffer, whether it is closed) and be recognizable by a
predicate. Records already give both, so a port is a record type and `port?` is
`%record-of-type?` — no new heap header code, no new printer case beyond a readable label.

The question that forces a decision is where a `FILE *` lives, since a record field holds a `val`
and a C pointer is not one.

**Decision: the runtime owns a `FILE *` table and the port record holds its index** (a fixnum). The
runtime exposes open / close / flush / write-string against an index.

*Alternatives considered.*

- **Store the `FILE *` as a fixnum**, relying on 8-byte alignment leaving the tag bits free. It
  would work on the targets in play, but it puts a raw C pointer inside a Scheme value where the
  collector and the printer can both see it, and a stale one after `close-port` is a wild pointer
  rather than a checkable index. The table converts that class of bug into a range check.
- **A new TAG_EXT header code for ports**, with the `FILE *` in a non-scanned field. Cleaner in
  principle, but it spends a header code and requires printer, equality, and GC teaching that the
  record path already has. Records exist precisely so new aggregate types do not each need this.

### D2 — Input ports slurp at open; output ports stream

The asymmetry is deliberate and is where most of the simplicity comes from.

**Input: slurp.** `open-input-file` reads the whole file into a string at open time, and the port is
that string plus a cursor. Three consequences, all good:

1. **A file input port and a string port become the same object.** `open-input-string` is the
   constructor with the slurp skipped, so `open-input-string` costs nothing extra.
2. **Every input operation is pure Scheme over data already in hand** — `read-char` is a
   `string-ref` and a cursor bump; `read-line` scans to the next newline; **`read` is `rd-datum`**
   at the cursor, storing the returned next-index back. No second reader, no C-side buffering, no
   partial-datum state machine.
3. It matches what the implementation already does: `%read-all-stdin` slurps, so slurping is the
   established input model rather than a new one.

**Output: stream.** An output port writes through to its `FILE *` on each operation. Buffering is
libc's, `flush-output-port` is `fflush`, and nothing accumulates in Scheme. `open-output-string` is
the exception — it accumulates in the record and `get-output-string` returns the accumulation.

*Cost, stated plainly.* A file larger than memory cannot be read, and a port on an interactive stream
cannot observe input produced after the open. That is the price of not writing an incremental reader,
and it is the same limitation `%read-all-stdin` already has. If it ever bites, the port record is the
right seam to fix it behind: `read-char` and friends go through the record, so refilling a buffer
becomes an implementation detail of one accessor.

### D3 — The eof object is misc-immediate subtype 3

`runtime.c` already documents this exact extension point. Subtype 3 costs no header code, no
allocation, and gives `eof-object?` as an immediate tag test. `print_val` learns to print it.

The alternative — a unique heap object, or reusing an existing sentinel like the unspecified value —
either spends more or conflates eof with a value a program can legitimately compute. R7RS requires
the eof object to be distinguishable from every other object, so reuse is not available.

### D4 — `current-output-port` is a procedure returning a fixed port, not a parameter

R7RS makes these parameter objects, so that `with-output-to-file` can rebind them dynamically. The
implementation has no parameter objects, no `parameterize`, and no `dynamic-wind`, so honouring that
is out of reach in this change.

**Decision:** ship them as ordinary procedures returning the fixed stdout / stdin / stderr ports, and
**do not** ship `with-output-to-file` / `with-input-from-file` at all rather than shipping versions
that look standard and silently do not rebind. A missing procedure is a loud error; a
non-parameterizing `current-output-port` that a program `parameterize`s would be a silent wrong
answer, which is the failure mode this project consistently refuses.

Making them real parameters is a follow-up whose first task is `make-parameter`.

### D5 — Binary size is a first-class review criterion for this change

Unlike the last several module changes, this one **grows `(scheme base)`**, and therefore
`bootstrap/scheme.base.ll` and every delivered binary. Standalone-executable size is a stated design
goal, and P1's size gains are described in `docs/PERFORMANCE.md` as recent and hard-won.

The tree-shake is what should protect this: a program that never mentions a port should link none of
it. **That must be measured, not assumed** — the AOT shake prunes a unit only when no other unit
imports it, and `(scheme base)` is imported by everything. The measurement is a task, and a
`hello.scm` that grows materially is a reason to reconsider the split (for example, moving ports to a
separate `(scheme file)`-style library that must be imported explicitly) rather than something to
note and move past.

## Risks / Trade-offs

- **Slurp-on-open makes an interactive or huge-file port wrong rather than slow** → documented as a
  limitation, with the port record as the seam to fix it behind (D2). The risk is that a user hits it
  and reads the behaviour as a bug; the mitigation is that the limitation is in the spec text, not
  only the design.
- **`(scheme base)` growth reaches every binary** (D5) → measure `hello.scm` and a demo before and
  after; a material regression triggers the separate-library question rather than a footnote.
- **A stale port index after `close-port`** → the table makes this a range/liveness check with a
  proper error, which is the entire reason for choosing it over a raw pointer (D1).
- **Partial R7RS conformance reads as full conformance** → `current-output-port` exists but is not a
  parameter, and `with-output-to-file` is absent. Both are stated in the spec deltas so the gap is
  recorded where a reader looks, not only here.
- **The optional port argument touches the four existing output procedures** → their no-argument
  behaviour is byte-identical or the change has broken something; that is a task, checked against a
  captured baseline the way the last two changes did it.

## Migration Plan

Additive. Existing programs use the no-argument forms, whose behaviour and emitted code are
unchanged; nothing is removed or renamed. `bootstrap/*.ll` regenerates, and unlike the last two
changes `bootstrap/scheme.base.ll` legitimately moves.

## Open Questions

- **Should ports live in `(scheme base)` or a separate library?** D5's measurement decides it. If
  ports cost every binary meaningfully, a separately-imported library is the better shape and the
  module system already supports it.
- **Is `char-ready?` meaningful under slurp-on-open?** It is trivially `#t` for a port with input
  remaining, which is conformant but vacuous. Worth including for completeness, or omitting as
  misleading — decide when writing the spec scenarios.
- **Does `read` need to share the reader with the compiler's own front end, or copy it?** They are
  the same procedure today (`rd-datum` in the prelude). Keeping one copy is obviously right, but it
  means a user-visible `read` and the compiler's reader move together — worth being deliberate about
  before relying on it.
