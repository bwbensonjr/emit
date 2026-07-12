## Context

`compile.ss` reads a source file's top-level forms (`read-program`) and `collect-toplevel`
turns the sequence — any number of `define`s followed by a trailing expression — into one
core expression (all-lambda defines become a `letrec`, so mutual recursion works). There is
no way to share code across programs. The reader arc's step 3 (`read.ss`) is a chunk of
mutually-recursive Scheme that needs somewhere to live, as does any standard library. This
change makes the driver prepend a prelude file's forms to every program.

## Goals / Non-Goals

**Goals:**
- A prelude of Scheme definitions in scope for every compiled program.
- No collision with or clobbering of user code (existing demos must stay green).
- A small starter library that exercises the mechanism.

**Non-Goals:**
- Separate/incremental compilation of the prelude (compile-once + link) — a future speed
  optimization; for now the prelude is recompiled with each program.
- Dead-code elimination of unused prelude procedures.
- A module/namespace/import system; `library` forms; selective imports.
- The reader itself (arc step 3).

## Decisions

### D1 — Prepend prelude source forms (not separate compilation)

The prelude is a Scheme file (`src/prelude.scm`) of top-level `define`s. `compile.ss` reads
its forms and prepends them to the user program's forms; the combined sequence goes through
the existing pipeline unchanged (`collect-toplevel` → … → `emit`). All-lambda prelude
defines join the program's top-level `letrec`, so prelude and user procedures are mutually
visible with no new scoping machinery.

**Alternative considered — separate compilation + linking.** Compile the prelude once to
its own `.ll`/object and link it with each program. Faster (no per-program prelude
recompile) but needs a cross-unit linking story for the `tailcc` closure ABI and global
symbol visibility — real complexity for no correctness gain at this scale. Rejected for now;
noted as the optimization to make when prelude recompile cost bites.

### D2 — User-wins shadowing

The existing demos define names a standard prelude would also want (`list*`, `even?`,
`odd?`), so an unconditional prepend could create duplicate `letrec` bindings. Rule: when
assembling `prelude-forms ++ user-forms`, drop any prelude `define` whose name is also
defined at the user program's top level. The user's definition wins; the prelude can never
clobber user code, and users can override any library procedure. The starter set is *also*
chosen to be collision-free with today's demos (belt and suspenders), so nothing depends on
shadowing yet, but it is in place for future programs.

**Caveat:** if a program shadows a name the prelude uses *internally*, the prelude
procedure that depended on it would pick up the user's version (dynamic-ish via the shared
`letrec`). The starter prelude has no such internal name dependencies beyond primitives;
noted as a sharp edge to revisit if the library grows dependencies.

### D3 — Always-on with a `--no-prelude` escape hatch

The prelude is included by default (a standard library should just be there). `--no-prelude`
compiles a program alone — used for the spike/minimal path, for debugging emitted IR, and to
demonstrate the prelude is additive. Existing demos keep their current output either way
(their names do not collide with the starter set).

### D4 — Starter prelude contents

Pure Scheme over existing primitives + variadic `lambda`:
`not`, `list` (variadic), `length`, `reverse`, `append`, `map` (single list), `memq`,
`assq`. `memq`/`assq` are `eq?`-based (the only equality available until `equal?` ships —
`member`/`assoc` follow then). Small, broadly useful, and collision-free with current demo
names (`list*`, `even?`, `odd?`, etc. are deliberately not included). The library grows when
a consumer (notably `read.ss`) needs more.

## Risks / Trade-offs

- **Per-program prelude recompile cost** → every program now compiles the prelude too;
  acceptable at this size, optimized later by D1's separate-compilation alternative.
- **Name collisions** → handled by D2 (user-wins) and a collision-free starter set; verified
  by keeping all existing demos green.
- **Prelude-internal name dependencies under shadowing** → documented (D2 caveat); starter
  set avoids it.
- **Every program's IR grows** → unused prelude procedures are still emitted (no DCE);
  noted, harmless for correctness, and does not touch hot paths (`countdown`/`namedloop`
  stay bounded-stack).
