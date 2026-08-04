## Context

`(scheme base)` is the prelude re-homed as a module: `scheme-base-library-form` (`src/core.ss:153`)
synthesizes one library from the baked-in prelude string —

```scheme
(define-library (scheme base)
  (export <prelude defines in source order, minus *scheme-base-private*>)
  (begin <the whole prelude>))
```

— with **no import clause**, and `src/prelude-surface.scm` declares only what is *private*, exports
being derived by subtraction. Both facts are load-bearing for this change: relocating names means
the surface declaration must say *where each name goes* rather than merely *whether it is hidden*,
and the relocated procedures' dependencies mean `(scheme base)` stops being import-free.

The three targets are not alike, which is the crux. Each relocated library can
`(import (scheme base))`, so only the names `*scheme-base-private*` hides are out of reach; walking
`src/prelude.scm`'s reference graph from each library's exports and stopping at base-exported names
gives the exact debt:

| library | body | private names it needs |
|---|---|---|
| `(scheme cxr)` | `(define (caaar x) (car (caar x)))` | **0** — pure `car`/`cdr` |
| `(scheme file)` | `open-input-file` → `%make-port`, `%read-file` | **3** — `%make-port`, `%port-rtd`, `%port-rtd-cell` |
| `(scheme read)` | `read` → `%check-input-port`, `%port-buf`, `rd-datum` | **33** — `%port-buf`, `%check-input-port`, and 31 `rd-*` |

Those `%port-*` and `rd-*` names are in `*scheme-base-private*` deliberately, from #29. A relocated
`(scheme read)` cannot reach them, and that single fact drives every decision below.

Constraints that bound the solution space:

- **`(scheme base)` must stay baked and manifest-free.** The module-system spec pins that a program
  importing only `(scheme base)` (or nothing) runs with no manifest present. Anything `(scheme base)`
  depends on inherits that requirement.
- **This is IR-shaping.** `src/core.ss` and `src/prelude-surface.scm` are both in `CORE_FLAT`
  (`tools/regen.sh:43-47`), so the self-hosting fixed point, the anti-stale trust-check, and a
  `test/module-scaffold-baseline.sha256` re-record are all in play — unlike `manifest-search-path`,
  which touched no IR.
- **The compiler compiles itself against the surface being changed.** It uses `caddr` ×35,
  `cadddr` ×10, `cdddr` ×3 across nine `CORE_FLAT` files, reaching them through the auto-imported
  `(scheme base)`.

## Goals / Non-Goals

**Goals:**

- A program importing only `(scheme base)` sees the R7RS-small `(scheme base)` surface and no more
  — for these sixteen names.
- `(scheme cxr)`, `(scheme read)`, `(scheme file)` are ordinary manifest-resolved libraries, like
  `(scheme inexact)`, reachable from an installed `emit` (which #35 made possible).
- `src/prelude.scm` stays the single source of truth for what these procedures *are*.
- The compiler keeps self-hosting with no edits to its 48 `cxr` call sites.
- #29's privacy guarantee survives: reader and port internals stay out of scope in an ordinary
  program.

**Non-Goals:**

- The R7RS §6 absence audit (#33's second half) — an open-ended inventory, deliberately separate.
- `include`/`cond-expand` (#18): not a prerequisite under this route, and not made one.
- Retiring the unstable export tier (#32) — but see R2, which this change must not worsen.
- Import sets (`only`/`except`/`prefix`) and re-export machinery — see D3.
- Baking `lib/scheme/base.sld` (#31).

## Decisions

### D1 — An internal substrate library, not `include` and not duplication

The relocated procedures need the private machinery; three ways to give it to them:

| route | cost |
|---|---|
| `include` a shared source fragment into each `.sld` | makes #18 a hard prerequisite |
| generator copies the reader/port source into each `.sld` | the reader compiles into several libraries; binary size is a `CLAUDE.md` design concern |
| **an internal library both import** | one new baked library (D2); no #18; no duplicated machinery |

Chosen: the third. Note it does *not* widen `(scheme base)`'s surface — the substrate is a separate
library that is **not auto-imported**, so its exports are reachable only by something that names it.
#29's guarantee ("internals are not in scope in every user program") therefore holds unchanged, and
the change avoids growing the `unstable` tier that #32 exists to retire.

*Amended by D10.* "No duplicated machinery" holds for the **reader and the port representation**,
which is what this decision was weighing. It does not hold absolutely: because `(scheme base)`
imports the substrate (D2), the substrate is the **lower** layer and cannot import `(scheme base)`
back, so a base-exported name the substrate's own body reaches has to be defined in it. That is 18
definitions, thirteen of them `cxr` one-liners the substrate already carries for D6. D10 sizes it and
records why the set stops there.

### D2 — The substrate is baked; the baked form becomes a partition (N=2)

`(scheme base)` keeps `read-from-string` and the port procedures, so it imports the substrate — and
since `(scheme base)` must resolve with no manifest, so must the substrate. `scheme-base-library-form`
therefore generalizes from *one hardcoded library* to *a partition of the prelude emitted in
dependency order*: the substrate first, then `(scheme base)` importing it.

This is the "compiler grows; generalizes to N libraries" cost the exploration's Finding 2 attributed
to the bake-more option, reached by a different road. It is bounded — **N=2** — and the on-disk
three are unaffected, so #35's decision that new standard libraries live in `$PREFIX/share/emit`
stands.

*Alternative rejected:* substrate on disk. It would break the no-manifest guarantee for **every**
program, since `(scheme base)` is auto-imported everywhere. Strictly worse than the defect this
whole line of work is fixing.

### D3 — No deprecation window, because there cannot be one

`compile-library*` (`src/core.ss:462`) validates each export against the body's `defined-names`:

```scheme
(unless (memq (cdr e) defined-names)
  (error 'compile-library "export of a name the library does not define" (cdr e)))
```

and the export table maps each external name to `(mangle name internal-name)` — a symbol mangled to
*that* unit. So `(scheme base)` cannot re-export a name it imports; a window would require new
re-export machinery (and plausibly import sets, which do not exist). This **answers the
exploration's open question 2** — it was never a preference. A clean break is what pre-`0.1.0`
exists for, and is the issue's own timing argument.

### D4 — One substrate, not a ports/reader split

`(scheme file)` needs only the port group; `(scheme read)` needs ports plus the reader. Splitting
would let `(scheme file)` avoid linking the reader — except that **`(scheme base)` is auto-imported
into every program and already contains both**, so the reader is present regardless. A split buys
nothing at link time and costs a third baked library and a third partition. One substrate.

### D5 — Named `(emit internal)`

R7RS reserves the `(scheme …)` namespace for the standard, so an implementation-internal library
must not live there. `(emit internal)` says whose it is and that it is not API. It is listed in the
manifest for the Chez driver's benefit like `(scheme base)` is, but resolves baked in the Chez-free
doors.

### D6 — The substrate also defines the nine `cxr` forms; `(scheme cxr)` defines its own

The compiler's 48 `caddr`/`cadddr`/`cdddr` sites resolve through the auto-imported `(scheme base)`;
relocating those names puts them out of scope. Rather than edit 48 sites in the compiler core (every
edit IR-shaping, under the fixed point), the substrate defines the nine forms and the compiler's
flat source gains a single `(import (emit internal))`. The on-disk `(scheme cxr)` defines its own
nine.

The duplication is nine one-line wrappers over `car`/`cdr` — categorically unlike duplicating the
reader, and it lands in a library most programs never link. `(scheme base)` itself retains the
depth-2 forms (`caar cadr cdar cddr`), which R7RS does place there.

### D7 — All three libraries are generated, from one partition map

`read` and the file procedures are *defined in `src/prelude.scm`*, which must remain their single
source of truth; hand-writing `read.sld` would fork them. So the generator routes each definition to
its target `.sld` according to the partition map.

The map therefore assigns each prelude definition to a partition, and **permits a name to be
assigned to two** — the nine `cxr` forms go to both `(emit internal)` (for the compiler) and
`(scheme cxr)` (for users); D10 adds three more uses. That dual assignment *is* D6's mechanism,
expressed as data rather than as a special case in the generator.

**Home and visibility are separate axes, per assignment.** A library's body defining a name and a
library's export list publishing it are different questions, and the answer differs *per library* for
the same name: the substrate defines `length` and `reverse` (D10) but must not export them, because
`(scheme read)`, `(scheme file)` and the compiler's own source import both `(scheme base)` and the
substrate, and two imports offering one name is a silent shadowing in
`import-tables->env-alist` (`src/core.ss:420` appends and `assq` takes the first) rather than an
error. So an assignment records, for each library, whether that library *exports* the name or merely
*defines* it. The global `*scheme-base-private*` list stays as it is — it is the "hidden everywhere"
default — and the per-assignment marker is the exception to it.

This keeps one declaration, one generator, and no hand-maintained copies —
`test/scheme-base-gen-check.sh` then guards all four generated `.sld` files instead of one.

### D8 — The substrate retires the `unstable` export tier (advances #32)

`*scheme-base-unstable*` holds exactly two names, `rd-skip-ws` and `rd-token-end`, exported "ONLY
because something outside the library must resolve the name." The spec's macro-template requirement
(`module-system:817`) makes a template the usual reason — but here the consumer is recorded at
`src/prelude-surface.scm:51-52` and is not a template: it is **`src/repl-core.ss`**, the REPL's
input-completeness probe, which "deliberately reuses the reader's own lexeme helpers so the two
cannot drift." Nine call sites, and `repl-core.ss` is part of the *compiler* (`CORE_FLAT` for
`embed-repl`).

So these two are the same category as the nine `cxr` forms (D6): names exported from `(scheme base)`
only because the compiler needs them. Once the compiler imports `(emit internal)` they move to the
substrate with the rest of the reader and **leave `(scheme base)`'s export list entirely**, emptying
the `unstable` tier.

That is #32's stated goal ("retire the unstable export tier") reached as a side effect. This change
should therefore *delete* the tier rather than carry it — and no dual assignment is needed for these
two, unlike the `cxr` nine, because nothing outside the compiler resolves them.

Two consequences to honour: `test/prelude-base-run-tests.sh:63` asserts `rd-skip-ws` is callable
from an ordinary program (`run_val surface-unstable`) and must be retired with the tier; and the
`unstable` tier's prose in `src/prelude-surface.scm:38-50` and the corresponding spec requirement
go with it.

### D9 — `(scheme cxr)` ships complete: all 24 procedures, not the 9 Emit happens to have

`docs/r7rs/09-standard-libraries.md:190` is explicit: the library "exports twenty-four procedures
which are the compositions of from three to four `car` and `cdr` operations", and "the procedures
`car` and `cdr` themselves and the four two-level compositions are included in the base library."

Emit defines only nine of the twenty-four — the eight three-level forms plus `cadddr` — because the
prelude grew as self-hosting needed names. Relocating just those nine would create a library
*named after the standard* that is 37% complete, in which `(caddar x)` is an unbound variable. That
is a worse conformance state than today, where at least nothing claims to be `(scheme cxr)`.

So the fifteen missing four-level forms (`caaaar`, `caaadr`, `caadar`, `caaddr`, `cadaar`,
`cadadr`, `caddar`, `cdaaar`, `cdaadr`, `cdadar`, `cdaddr`, `cddaar`, `cddadr`, `cdddar`,
`cddddr`) are added. They are one-line compositions, mechanically derivable, needed by nothing else,
and assigned to `(scheme cxr)` only — not to the substrate, since the compiler does not use them.

This is a deliberate, bounded exception to the "no §6 absence audit" scope line: completing a
library *this change creates* is part of creating it properly, whereas auditing `(scheme base)` for
absences is the open-ended survey that stays out.

### D10 — The substrate never raises: the port guards are dual-assigned to their consumers

D2 makes the substrate the layer *below* `(scheme base)`, so it cannot import it back. Everything the
substrate's body reaches must therefore be inside the substrate — and the naive reading of D1 ("move
the port group and the reader down") does not close: walking the reference graph shows that body
reaching **22** base-exported names, and two of them are `error` and `raise`, which reach
`*handlers*`.

`*handlers*` cannot come along, and it cannot be duplicated either:

- **Duplicating it splits the handler chain.** `(scheme base)`'s `guard` would push onto base's chain
  while the substrate's `raise` consulted its own empty one, so `(guard (e (#t 'caught)) (read-char 5))`
  would abort instead of being caught — a behavioural regression in a change whose whole claim is that
  behaviour is unchanged.
- **Single-homing it in the substrate does not work either.** `with-exception-handler` and `raise`
  (`src/prelude.scm:578,589`) `set!` it, and they are `(scheme base)` exports, so `(scheme base)` must
  define them — which would mean assigning an *imported* binding. `assign-global`
  (`src/parse.ss:754`) rejects that on purpose: "a unit's globals are written only by its own
  `__init`, which is what cross-unit direct calls rest on", with a test at
  `test/repl-interactive-tests.sh:109`. Not an accident to work around.

The exception machinery is reached from exactly two places: `%check-input-port` and
`%check-output-port` (`src/prelude.scm:1124-1136`), the wrong-type/closed-port guards. Those are
**stateless** — the only reason they were headed for the substrate is that `read` calls one. So they
do not go there. They are **dual-assigned to the library that needs them**: `(scheme base)` (which
already defines them today) and `(scheme read)`, whose copy resolves `error` and `input-port?` through
its own `(import (scheme base))`. Duplicating a four-line type check is the cheap side of this trade.

With that one move the substrate closes, and closes small:

| | count |
|---|---|
| substrate body | **54** definitions |
| — hidden in `(scheme base)` today (31 `rd-*`, `%port-buf`, `%make-port`, `%port-rtd`, `%port-rtd-cell`, …) | 36 |
| — defined-not-exported base exports: the 13 `cxr` forms, `length`, `list`, `reverse`, `list->vector`, `list->bytevector` | 18 |
| mutable state in it | **1** — `%port-rtd-cell` |
| references to `error` / `raise` / `*handlers*` / `*winds*` | **0** |

The single mutable cell is the one that *must* be single-homed for a different reason:
`rt_make_record_type` (`src/runtime/runtime.c:1299`) mints a fresh descriptor per call and record
types are compared by object identity, so two `%port-rtd-cell`s would be two disjoint port types and a
port from `(scheme file)`'s `open-input-file` would fail `(scheme base)`'s `port?`. It is written only
by `%port-rtd`, which sits in the same unit — so nothing crosses the boundary and the `assign-global`
rule above is respected rather than dodged.

Of the 18 duplicated definitions, nine (`length`, `list`, `reverse`, `list->vector`,
`list->bytevector`, and the depth-2 `caar`/`cadr`/`cdar`/`cddr`) are **defined but not exported** by
the substrate — D7's visibility axis — because `(scheme base)` exports those names and something
importing both must not see two.

*Alternative rejected: a process-global port record type.* A runtime primitive returning one interned
port RTD would let the substrate import `(scheme base)` instead of the reverse — no cycle, no
duplicated utilities, `scheme.base.ll` untouched. It costs a new primitive (hence the two-step
`make regen` a prelude-visible primitive needs) and, because the substrate would then hold its own
copy of the reader, duplicates the reader into every compiler binary — which is the binary-size cost
D1 rejected, arriving by the other road.

## Risks / Trade-offs

- **R1 — The bootstrap changes the surface the compiler is compiled against.** A half-applied
  partition yields a compiler that cannot compile itself. → Land the substrate (with the `cxr`
  forms and the compiler's `import`) *before* removing anything from `(scheme base)`'s exports, so
  every intermediate state has a working compiler. The fixed point and trust-check are the check.
- **R2 — resolved, and favourably; see D8.** The `unstable` tier's two members turn out to exist for
  the *compiler*, not for a macro template, so the substrate retires the tier instead of growing it.
- **R3 — IR churn is unavoidable and large.** Partitioning changes unit boundaries, so mangled
  symbols and `__init` order move. → `test/module-scaffold-baseline.sha256` is re-recorded **once**,
  with the delta explained per that script's header protocol; keep the partition a single step so
  the re-record has one explanation.
- **R4 — Silent behavioural break for existing code.** Any in-tree program or demo using a relocated
  name now fails with an unbound variable. → Sweep `demos/`, `test/`, and the docs; the failure is
  loud, not silent, which is the good case.
- **R5 — A baked library importing another baked library is a new shape.** The auto-import (mode 6),
  the REPL's eager preload (mode 5), and the run door's lazy closure all assume `(scheme base)` is
  import-free. → Exercise all four doors explicitly; the door-parity guards
  (`test/prelude-base-run-tests.sh`, `test/dump-parity-tests.sh`, `test/self-emit-equiv.sh`) are the
  net.

## Migration Plan

Ordered so a working compiler exists at every step (R1):

1. **Partition map** — `src/prelude-surface.scm` becomes name → partition(s), with every name still
   assigned to `(scheme base)`. No behaviour change; the guards should pass untouched.
2. **N-library baked form** — `scheme-base-library-form` generalizes to emit a partition in
   dependency order, still with a one-entry partition. Fixed point + trust-check green before
   anything moves.
3. **Substrate** — move the port/reader privates and *copy* the nine `cxr` forms plus D10's nine
   defined-not-exported helpers into `(emit internal)`; `(scheme base)` imports it; the compiler's
   flat source imports it. The port guards stay dual-assigned to their consumers (D10), so nothing
   mutable crosses the boundary. The compiler still sees every name it did. Re-record the baseline
   here.
4. **Relocate** — the sixteen names move out of `(scheme base)`'s exports into generated
   `cxr.sld` / `read.sld` / `file.sld`; manifest entries added; guards updated. This is the
   breaking step.
5. **Sweep and document** — in-tree users, `docs/MODULES.md`, `README.md`.

Rollback: steps 1–3 are behaviour-preserving and revert independently; step 4 is the one commit that
changes the surface.

## Open Questions

1. **Answered: yes, it is listed** — and not as a preference. The REPL door does not use the baked
   registration at all: it preloads the manifest (`src/emit.cpp:811` → mode 5, then mode 4 per
   library) and resolves `(scheme base)` from `lib/scheme/base.sld`, so once that file carries
   `(import (emit internal))` the import has to resolve *through the manifest* or the REPL has no
   standard library. The Chez driver needs it the same way. So `(emit internal)` gets a manifest entry
   and a generated on-disk `lib/emit/internal.sld` beside its baked twin, exactly as `(scheme base)`
   has both. Consequence for the installer: `make install` globs `lib/scheme/*.sld`
   (`Makefile:164`), which does **not** reach `lib/emit/`, so the install rule grows a second glob.
2. **Answered** (task 1.3, `docs/r7rs/09-standard-libraries.md:190-215`): `(scheme cxr)` exports the
   twenty-four depth-3-and-4 compositions only; the depth-2 four stay in `(scheme base)` and are not
   re-offered. This also surfaced D9.
