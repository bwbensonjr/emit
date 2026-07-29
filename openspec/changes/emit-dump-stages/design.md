## Context

The `dump` side-channel is already the right shape: `compile-forms`,
`compile-library`, and `compile-program-with-imports` all take a `dump` procedure of
`(stage form)` and call it after each pass, and the core never touches a port itself
(`src/core.ss:51-54`). Exactly one caller ever passes a real dumper — the Chez driver's
`dump`, which `pretty-print`s to stderr (`src/compile.ss:139`). Every Chez-free call site
passes the no-op `no-dump`: `src/core.ss` (three convenience entries) and
`src/repl-core.ss:244,350,370,379,432`.

Two things block the shipped binary from filling that slot:

1. **No flag channel.** The host cannot tell the embedded compiler that dumping is on.
   The precedent for exactly this problem is `--no-prelude`, which the
   `compiler-embedding` spec settles as "the smallest viable channel (an environment
   variable the entry reads via a runtime primitive)": `emit.cpp` calls
   `setenv("EMIT_NO_PRELUDE", …)` and the entry probes `(%no-prelude?)` →
   `rt_no_prelude_p` (`src/runtime/runtime.c:610`).
2. **No stderr channel.** The runtime's printers (`rt_display`, `rt_write_val`,
   `rt_newline`) all write stdout, and stderr appears in the runtime only for traps. On
   the `emit run --emit` and `schemec` paths stdout carries IR, so narration on stdout
   would corrupt the artifact and break regen and the trust-check.

Two constraints frame every decision below. **Regen safety**: enabling dumping must not
change one byte of emitted IR, because `tools/regen.sh` drives the compiler through
`emit run --emit` and `test/trust-check.sh` asserts `git diff --exit-code bootstrap/`.
**Staged bootstrap**: a new `%`-op cannot be *used* by the compiler's own source until a
committed seed already knows how to compile it — the D3 lesson recorded in
`first-class-primitives`.

Also worth fixing while here: the dump is *incomplete* even under Chez on the path that
now matters most. `compile-program-with-imports` — what every door takes since the
prelude was re-homed as `(scheme base)` — runs `recognize-let`, `convert-assignments`, and
`convert-closures` but dumps only `collect-toplevel`, `expand`, `parse+rename+imports`,
and `lower` (`src/core.ss:387-388`). `repl-lower-form*` (`src/parse.ss:622`) takes no
dumper at all, so the REPL's per-form lowering is entirely opaque.

## Goals / Non-Goals

**Goals:**

- `--dump` on `emit run`, `emit build`, `emit lib`, `emit repl`, and `schemec` — the IL
  after each named pass, on stderr, from the shipped binary with no Chez present.
- Byte-identical stdout with dumping on or off, on every door.
- Dump output readable enough to replace the Chez dump in daily use.
- All seven stages observable on the modular and per-form paths, not just the
  whole-program path.
- A verification story that the two dumps agree, so the Chez dump can serve as the
  independent-host reference rather than the only implementation.
- Chez's remaining role reduced to verification (trust-check, fixed point, dev suite) and
  the frozen genesis.

**Non-Goals:**

- Byte-identical output with Chez's `pretty-print`. Structural agreement is the contract;
  matching Chez's line-breaking heuristics is not.
- A REPL meta-command (`,dump on`) to toggle dumping mid-session — there is no
  meta-command syntax yet, and adding one is a separate change.
- Dumping the LLVM IR stage itself; `--emit` already writes that.
- Machine-readable (s-expression or JSON) dump output for tooling. Human inspection is
  the use case.
- Retiring the Chez driver or its `--dump`.

## Decisions

### D1 — One nullary probe returning a *level*, not a boolean

Add `%dump-level` → `rt_dump_level()`, a nullary primitive returning a fixnum: `0` off,
`1` stage names only, `2` full form dump. The host sets `EMIT_DUMP_LEVEL` before the first
`scheme_entry()` call, computing it exactly as the Chez driver does at
`src/compile.ss:682` — `--dump` wins, else `EMIT_VERBOSITY=verbose` gives level 1, else 0.

A level rather than a boolean because the Chez driver already has *two* observability
modes over this one channel (full `--dump` and concise `-v` stage announcements), and the
Chez-free doors need both to satisfy `tooling-observability`. One probe serves both.

*Alternative considered:* a general `%getenv` (string → string or `#f`). More reusable,
but it returns a freshly allocated string, widens the compiler's ambient-environment
surface, and would need parsing in Scheme that `emit.cpp` and `tools/log.sh` already do in
two other places. The project's established precedent is one narrow nullary probe per
flag, and it keeps the parsing single-sourced in C.

*Alternative considered:* extend the existing `rt_repl_set(mode, bytes, len)` request
channel with a level argument. Rejected: that channel is per-*operation*, while the dump
level is per-*process*; and it would change a protocol three hosts (`emit.cpp`,
`run-boot.cpp`, and the REPL) share.

### D2 — One stderr primitive, carrying the display/write flag

Add `%stderr-write` → `rt_stderr_write(val v, val display_flag)`, which writes `v` to
stderr and returns it. The runtime already has `static void print_val(val, int display)`
shared by `rt_display` and `rt_write_val` (`src/runtime/runtime.c:688`); this is that
function pointed at stderr, so there is no second printer to keep in sync.

Carrying the display/write flag as an argument rather than adding two primitives keeps the
new surface at two `%`-ops total, and both consumers are needed: **write**-style for IL
forms (so `(code "code_6" …)` shows its string quoted, as Chez's `pretty-print` does) and
**display**-style for the dumper's own header text, indentation, and newlines.

*Alternative considered — no stderr primitive at all:* have the embedded compiler return
the dump text in-band, prefixed to the IR and split off by the host on a marker, reusing
the `*emit-unit-boundary*` trick. Rejected: it needs splitting logic in three hosts,
buffers the entire dump in memory instead of streaming it (so a compile that traps shows
nothing), does not work for `schemec` (whose IR goes to stdout via `display`, not a
returned string), and makes narration part of the host protocol rather than a property of
the compiler.

### D3 — The dumper is built at the entry, not in the core

`src/core.ss` keeps taking `dump` as a parameter and keeps `no-dump`; it gains no
primcall. A new `(make-dumper level)` — returning `no-dump` at level 0, a stage-name
announcer at level 1, and the pretty-printing dumper at level 2 — lives with the
compiler's other internal helpers and is called by the entries (`entry-embed.scm`,
`entry-schemec.scm`, and `repl-core.ss`'s mode dispatch), which then pass the result down
the same parameter that Chez's `dump` travels.

This preserves the `compiler-pipeline` requirement that the pure core be separable from
the I/O driver — the core stays port-free and effect-free; only the entry layer probes the
environment and writes stderr. It also means the Chez driver and the embedded doors remain
*two dumpers over one plumbing*, not two plumbings.

### D4 — The pretty-printer is compiler-internal, not prelude

The in-language pretty-printer goes in `src/util.scm` (assembled into the compiler only),
**not** `src/prelude.scm`. The prelude is now `(scheme base)` and links into every user
executable; a printer added there would grow every delivered binary, and binary
size/cleanliness is an explicit design concern in `CLAUDE.md` ("favoring separate
compilation over an extensive library prelude"). Nothing outside the compiler needs it
yet.

Style: print a form on one line when its flat width fits the column budget, otherwise
break after the head and indent operands one level. This is the readable-enough 80% of
`pretty-print` in a small amount of code; the exact width is D-open (see Open Questions).

### D5 — Parity with Chez is checked structurally, not byte-wise

A Chez-gated dev check compiles the same program with the Chez driver's `--dump` and with
`emit run --dump`, splits both stderr streams on the `;; ==== after <stage> ====` headers,
`read`s each section, and asserts the stage *names and order* match and each stage's form
is `equal?` across the two. Chez reads both sides, so the two formatters need not agree on
whitespace.

This is what makes the change a real reduction in Chez's role rather than a fork: the Chez
dump becomes the independent reference the shipped dump is checked against — the same
posture `test/self-host-fixpoint.sh` takes toward the committed IR.

### D6 — stdout invariance is a checked property, not a convention

A Chez-free check in `run-all-tests.sh` asserts
`emit run --emit < P` and `emit run --emit --dump < P` produce byte-identical stdout, for
a program exercising macros, closures, and imports. Two invariants back it: dumping only
*reads* the IL (it never allocates a `fresh-name`, so the gensym counter cannot drift), and
all dump bytes go to stderr per D2.

### D7 — `--dump` dumps the program unit; library units are opt-in

Since the prelude was re-homed, a plain `emit run` compiles `(scheme base)` as a library
unit *before* the program. Dumping every stage of the prelude on every run would bury the
program's stages in thousands of lines — a problem the Chez path sidestepped only because
`--no-prelude` was the usual debugging posture.

So `--dump` covers the **program unit** (and, for `emit lib`, the library named on the
command line — that is the unit under inspection there). `--dump-all` additionally dumps
`(scheme base)` and preloaded manifest units. The distinction is a filter in the dumper
the entry constructs, keyed on the unit being compiled, so it costs no extra plumbing.

### D8 — Per-form stages are labelled with their form

On the modular and REPL paths the mid-pipeline passes run *inside* `repl-lower-form*`, once
per top-level form, so a bare `;; ==== after convert-closures ====` would repeat dozens of
times with no way to tell which form produced it. Thread the dumper into
`repl-lower-form*` and qualify the header with the form's identity — its `define` name when
it has one, otherwise its index — e.g. `;; ==== after convert-closures [define fact] ====`.

The whole-program path (`compile-forms`, used by `schemec` and the Chez driver) keeps its
current unqualified headers, so its output — and the D5 parity check against Chez — is
unchanged.

### D9 — Staged bootstrap: two regens, in this order

New `%`-ops are unusable by the compiler's own source until a committed seed knows them,
so the work splits at the point where a call site appears:

- **Stage 1 (tables only).** `runtime.c` gains the two functions; `emit.ss` gains the two
  `prim-table` entries and the two `declare` lines; `parse.ss` gains the two reserved
  heads. Nothing *calls* them. The current seed compiles all of this — it is data and
  string constants — and `make regen` produces a seed that knows `%dump-level` and
  `%stderr-write`. Commit `bootstrap/*.ll`. (Expect the diff to include the two new
  `declare` lines in every module, since the declare header is emitted into all of them.)
- **Stage 2 (call sites).** `make-dumper`, the pretty-printer, the entry/mode plumbing,
  the `emit.cpp` flag parsing, and the missing `dump` calls in
  `compile-program-with-imports` / `repl-lower-form*`. Regen again with the stage-1 seed.

Run `run-dev-tests.sh` (dev suite + fixed point + trust-check) at the end of each stage,
and commit the regenerated IR at each stable stage. The `first-class-primitives` finding is
that "two regens per batch" is a safe upper bound and a single direct regen often
converges; the fixed-point loop in `tools/regen.sh` will report its iteration count either
way.

### D10 — The Chez driver is left alone

`src/compile.ss` keeps its `dump` and `announce-stage` verbatim. It is not rewritten to
share the new in-language dumper: it has `pretty-print` and real ports, its output is the
D5 reference, and changing it would mean changing the very baseline the new path is
measured against.

## Risks / Trade-offs

- **[Staged bootstrap breaks mid-stage — a seed that cannot compile the next stage]** →
  Each stage is an independently committed, fully green tree (`run-dev-tests.sh` including
  the trust-check). Rollback is a revert to the previous stage's `bootstrap/*.ll`, which
  is a working compiler by construction.
- **[Dump output silently diverges from the Chez dump, so a developer debugs a fiction]** →
  D5's structural parity check runs in the dev suite; divergence in stage names, order, or
  forms fails CI.
- **[Narration leaks into stdout and corrupts a bootstrap artifact]** → The only new writer
  is stderr-only by construction (D2), and D6 asserts byte-identical stdout. The
  trust-check would catch a leak that reached `bootstrap/`, but the D6 check localizes the
  failure.
- **[The compiler binary grows]** → The printer is compiler-internal (D4), so delivered
  user executables are unaffected; measure and report `build/emit` and `bootstrap/*.ll`
  sizes before and after, per the project's binary-size concern and
  `tooling-observability`'s metric requirement.
- **[Dump volume makes the feature unusable on real programs]** → D7 scopes the default to
  the program unit; level 1 (`-v`) gives stage names only when the full IL is too much.
- **[A second `%`-op pair is permanent surface]** → Two nullary/binary probes is the
  minimum that satisfies both channels, and both are modelled on primitives that already
  exist (`rt_no_prelude_p`, `print_val`). No new runtime concept is introduced.
- **[Per-form headers on the REPL path have no counterpart in the Chez dump]** → D8 keeps
  the whole-program path's headers unchanged, so the parity check compares like with like;
  the per-form headers are additive and covered by their own assertion.

## Open Questions

- **Pretty-printer column budget and break style.** 78 columns with
  "break after the head, indent operands one level" is the proposed starting point; worth
  a look at real `lower`-stage output before fixing it.
- **Per-form header wording** (D8) — `[define fact]` vs `[form 3]` vs both. Decide from
  the first real REPL dump.
- **Environment variable name.** `EMIT_DUMP_LEVEL` (explicit, matches the value it
  carries) vs `EMIT_DUMP` (shorter, matches `EMIT_NO_PRELUDE`'s boolean-ish style). Leaning
  `EMIT_DUMP_LEVEL` since it holds `0|1|2`, with `--dump` as the ergonomic front door.
- **Whether `emit build` should dump at all,** given it delegates to the same front half as
  `emit run --emit`. Cheap to include and consistent; the only argument against is one more
  flag on one more verb.
