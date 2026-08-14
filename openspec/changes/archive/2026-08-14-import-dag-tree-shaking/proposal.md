## Why

Tree-shaking prunes a library unit to what the program reaches, and it works — a program whose
whole body is `(display (car (list 1 2)))` shakes `scheme.base.ll` from **338,670 B / ~200 defines
down to 6,847 B / 4 defines**. But it prunes only a unit that **no other unit imports**, and since
`scheme-base-partition` one shipped library imports another: `(scheme base)` imports `(emit
internal)`, so the substrate is unprunable **by construction** and ships whole. That same 57,480-byte
executable links **32 `emit.internal:rd-*` reader symbols** against **3 `scheme.base:*` symbols** —
it carries the entire in-language reader and the port representation in order to call `car`.

```
                        committed        linked into `(display (car (list 1 2)))`
scheme.base.ll           338,670 B   ->    6,847 B   pruned to 4 defines
emit.internal.ll         170,716 B   ->  170,716 B   NOT pruned, all 114 defines
```

Binary size is a stated design goal (`CLAUDE.md`: "small, clean, self-contained native
executables"), and ~170 KB of unreachable IR is now the single largest dead payload in a minimal
binary — the last high-value open size item in `docs/PERFORMANCE.md` (P10). Now is the moment for
two reasons: `chez-free-unit-pipeline` just gave `emit build` a shake of its own, so a better root
computation lands on **both** ship doors at once rather than being retrofitted to the second later;
and `homebrew-tap-distribution` will tag 0.1.0, whose first impression is the size of what it
delivers.

## What Changes

- **Propagate root sets backward through the import DAG.** Shake units in **reverse topological
  order** (importers before their dependencies) and seed each unit's root set with the program's
  roots **plus** whatever the already-finalized units that import it still reference. A unit is no
  longer disqualified from shaking because something imports it; it is shaken against its importers'
  *shaken* form. `(scheme base)` pruned to 4 defines references almost nothing in the substrate, so
  a program calling only `car` should keep ~0 reader bindings.
- **Retire the "imported by another unit" prunability gate** on both ship doors — the Chez driver's
  `(member nm imported-by-unit)` test and mode 17's `imported-by-another?` `keep` answer. Under
  reverse-topological order the condition that made the gate necessary (an importer kept full could
  reference a dropped binding) can no longer arise, because every importer is final before its
  dependency is shaken.
- **Retire the "direct import of the program" gate** with it: any unit in the closure becomes
  shakeable, which is the whole point — `(emit internal)` is not a direct import of any program.
- **Key a shaken cache entry on the root text that produced it**, not on the program IR alone.
  Once a unit's roots depend on its importers' shaken IR, the program digest no longer determines
  the root set on its own.
- ~~**Shake a delivered library to its own exported interface** (issue #104), opt-in via a new
  `emit lib` flag.~~ **Withdrawn by its own measurement gate.** #104 asked for the measurement
  first, and the measurement says no: shaking a library to its own exports removes **0%** of
  `(emit internal)` (174 of 174 defines kept), **0%** of `(scheme read)`, and **0.45%** of
  `(scheme base)` (487 of 491 defines kept). Every internal helper in these libraries is reached by
  something exported — which is what a well-kept library looks like. See `measurements.md` 1.3/1.4.
  The measurement is recorded and #104 is answered with it rather than with machinery.

Not breaking: no accepted-language or CLI surface is added, changed, or removed. The delivered
executables change only in size and link time.

## Capabilities

### New Capabilities

None. This is a root-set choice inside machinery that already exists — `compile-library*` already
takes `keep-roots`, the export tables already record what each unit references, and the
`aot-codegen` requirement already says the root set "SHALL be a parameter of the reachability
computation ... so the same mechanism can later serve other roots (e.g. a delivered library's
exported interface) without change." This change is that sentence being cashed in.

### Modified Capabilities

- `aot-codegen`: the tree-shake requirement gains transitivity through the import DAG — a library
  another unit imports is shaken against its importers' retained set rather than kept whole.
- `artifact-cache`: a shaken entry's key must cover the full root text (program IR plus the
  finalized IR of the unit's importers), not the program IR alone.
- ~~`emit-cli`~~: withdrawn with the `emit lib` half. The "byte-for-byte identical to the unit the
  AOT and REPL doors produce" guarantee stays exactly as written, unqualified.

## Impact

**Code.**
- `src/core.ss` — `program-root-internals` is the shared root rule (moved here by
  `chez-free-unit-pipeline` design D8 precisely so both doors compute roots once); it grows a
  root-text parameter that is no longer just the program. `compile-library*` is unchanged — it
  already takes `keep-roots`.
- `src/compile.ss` — `build-modular-artifacts*`: reverse-topological iteration, per-unit root union,
  and removal of both prunability gates. Exempt from `make regen`.
- `src/repl-core.ss` — mode 17 `repl-shake-library`: the input's third section becomes the
  accumulated root IR rather than the program IR; `imported-by-another?` stops forcing `keep`.
- `src/emit.cpp` — `shake_units`: iterate modules in reverse link order, accumulate finalized unit
  text into the root text handed to mode 17, and digest that text for the cache stem. Host C++, so
  it reaches the binaries through plain `make`, not regen.

**Build.** `src/core.ss` and `src/repl-core.ss` are in `CORE_FLAT`, so this pays one `make regen`
barrier (~22 min, 5 self-compiles). All compiler edits land before regen starts.

**Risk.** The failure mode of an under-approximated root set is an **undefined symbol at link
time**, not a wrong answer — loud, and caught by any build. The guard being retired here was
latently broken once already (`memq` where `member` was needed, fixed in `scheme-base-partition`),
so its replacement needs a test that fails when propagation is wrong, not merely when it is absent.

**Docs.** `docs/PERFORMANCE.md` P10 checks off with measurements — and its recorded figures are
already stale by roughly 2x in the direction that strengthens the case (the entry says 170,716 B of
substrate; it is now 348,536 B). Issue #104 is answered with the measurement that says not to build
it.
