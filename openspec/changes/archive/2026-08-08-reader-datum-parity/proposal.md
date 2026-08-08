## Why

Emit's reader reads `#(...)` and `#u8(...)`, and `core-language` requires that it SHALL. Nothing
downstream can handle the result. Three places fall back to a `?` placeholder or an error on a datum
the reader is required to produce (issues #64, #52):

- **`encode-const` cannot lower a vector or bytevector constant** (`src/emit.ss:292`–`329`), so
  `(display '#(1 2))` is a compile failure: `emit: emit: bad const ?`.
- **`render-datum` has no vector or bytevector arm** (`src/core.ss:382`), so the diagnostic above
  cannot even name the literal it choked on — the `?` *is* the renderer.
- **`repl-irritant->string` renders every non-symbol, non-string, non-number irritant as `"?"`**
  (`src/repl-core.ss:63`), so an interactive `(import (bad))` of a library that failed to load
  reports `imported library not loaded ?`, dropping the one part of the message the user typed.

They are one change because of what the second one is *hiding*. `render-datum` no longer writes only
diagnostics — since `library-macro-export` it writes the **export table**, and its own comment says
so: "a datum it renders as `?` would corrupt a table rather than merely read poorly in a message".
That is happening now. Verified against `build/emit` at 562ae62, a library exporting a macro whose
template holds a vector literal compiles **successfully** and writes a corrupt table:

```console
$ emit lib veclib.sld
lib veclib.sld -> build/lib/veclib.ll  [5316 bytes]      # exit 0
$ cat build/lib/veclib.exports
((veclib) () () (((vconst () ((_) quote ?))) () ()))     # #(1 2) became ?
```

Today that corruption is masked: an importer recompiling the same library hits `bad const ?` from
the missing `encode-const` arm and fails loudly first. **Fixing #64 alone would unmask it** — the
literal would lower, the compile would succeed, and the silently wrong export table would be the
only remaining symptom. The lowering fix and the rendering fix have to land together, or the loud
bug becomes a quiet one.

## What Changes

- **`encode-const` gains vector and bytevector clauses.** Both follow the existing `pair?` clause's
  pattern — encode each element with `encode-const`, materialize at runtime — and both constructors
  already exist (`rt_make_vector` / `rt_vector_set`, `rt_make_bytevector` /
  `rt_bytevector_u8_set`). No new runtime support.
- **`render-datum` gains vector and bytevector arms**, spelled `#(…)` and `#u8(…)` — the external
  representations `core-language` already requires both readers to accept, so the export table
  continues to round-trip through Chez's `read` and Emit's own reader.
- **`repl-irritant->string` falls through to `render-datum`** instead of `"?"`, which fixes every
  list irritant on every door at once rather than the one call site #52 reports. `render-datum`
  moved to `src/core.ss` during `module-frontend-diagnostics` for exactly this reason, so it is
  already available everywhere.
- **`bad const` becomes nameable.** With the renderer's arms in place, a constant that still cannot
  be lowered names itself rather than printing `?`.
- **The library path is covered, not just the program path.** #64 asks whether the baked/library
  route has the same hole; it does, and a quoted vector in a library body is a fixture here.

## Capabilities

### New Capabilities

None. Every requirement below constrains behavior an existing capability already owns.

### Modified Capabilities

- `core-language`: gains a requirement that a datum the reader is required to read SHALL be usable
  as a quoted constant — closing the gap between "Vector printing and reader syntax" (:838) and
  "Bytevector printing and reader syntax" (:2021) and what the emitter can lower.
- `module-system`: gains a requirement that the "Library export table" (:653) records a macro
  template's data faithfully, and that a datum the writer cannot represent is an error rather than
  a placeholder.
- `emit-cli`: gains a requirement that a diagnostic naming a datum renders that datum, extending
  "A door's diagnostics name that door" (:216) from *which tool* to *which value*.

## Impact

- `src/emit.ss` — `encode-const` (:292–:329). **In `CORE_FLAT`.**
- `src/core.ss` — `render-datum` (:382). **In `CORE_FLAT`.**
- `src/repl-core.ss` — `repl-irritant->string` (:63). **In `CORE_FLAT`.**
- All three are in `CORE_FLAT`, so this is **one `make regen` cycle** (~12 min) for the whole
  change — the reason #64 and #52 are batched rather than done in sequence.
- IR shape changes for programs containing vector/bytevector constants (they emit
  materialization code where they previously failed to compile). Export tables change only for
  libraries whose exported macro templates contain such literals — today those tables are corrupt,
  so this is a fix, not a format change.
- `bootstrap/*.ll` changes because the compiler's own source changes; no compiler source *uses* a
  quoted vector today, so the fixed point should converge in one pass.
