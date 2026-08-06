## Context

`compile-library*` (`src/core.ss:690`) lifts a library body's compile-time half out with
`collect-define-syntax` before anything else runs. The transformers land in a local `macro-env`, the
remaining forms become the runtime body, and the function returns
`(list ir-text (list name export-table call-rows))`. The `macro-env` dies with the call. The export
table maps external name → mangled symbol string; the call rows carry `(external label arity)` for
the direct-call path. Every field is runtime. Since `module-frontend-diagnostics` an exported macro
is rejected by consulting that same `macro-env` (`:718-726`) — the diagnostic half of #48.

The importing side has one channel and it is runtime too: `import-tables->env-alist` (`:607`) turns
each table into `(external-name . mangled-symbol)` pairs that seed the unit's environment, and their
names join `known` so hygiene does not rename a reference to an imported binding away.

Macros do cross a boundary today, but not through that channel: `prelude-macro-forms` (`:230`) hands
the baked derived-form set directly to each compile's `macro-env`. It works because the compiler
carries the prelude *source*, which is available to no user library.

Three facts constrain — and cheapen — the design:

- **A transformer is a plain datum.** `parse-define-syntax` (`src/passes/expand.ss:37-43`) yields
  `(name literals (pattern . template) …)`: pairs, symbols, numbers, strings. `write` and the existing
  reader are a complete serialization. There is no compiled transformer and no second expander phase
  to stand up.
- **Private bindings are already externally linkable.** `liba` exports only `a-val`, and
  `build/lib/liba.ll` still emits `@"liba:helper" = global i64 0` at default linkage. A resolved
  reference from another unit reaches it over the `external global i64` path imported names already
  use (`src/emit.ss:1515,1548`).
- **Hygiene is a name-set heuristic, not marks.** `collect-renames`
  (`src/passes/expand.ss:129-146`) renames every template identifier that is not a pattern variable,
  not `.../_`, not inside `quote`, and **not in `known`**. There is no syntax object and no
  provenance. So "an identifier the template introduces" and "an identifier the template references
  but nothing defines" are the *same bucket* today, and any design that must tell them apart is
  buying a much larger change.

## Goals / Non-Goals

**Goals:**

- `(export <macro>)` compiles, and an importing program, library, or REPL session can use the macro.
- Identical behavior on all three doors: Chez batch driver, REPL, Chez-free embedded run door
  (dev→ship fidelity).
- A template may reference the exporting library's **private** bindings without widening its public
  export surface.
- A library may layer macros on its own private macros.
- No program that compiles today changes its emitted IR by a byte.
- A stale three-field `.exports` from a previous build is read, not crashed on.

**Non-Goals:**

- Changing how the baked `(scheme base)` macro set reaches a compile. It keeps the
  `prelude-macro-forms` merge; this change adds a second, additive path.
- Replacing the hygiene heuristic with syntax objects/marks. Explicitly out — see D4.
- Diagnosing a typo inside an exported template at the exporting library. Out, with a recorded issue
  (D4, R2).
- `define-syntax` at inner scope, `let-syntax`/`letrec-syntax`, `syntax-case`, identifier or
  procedural transformers, `(rename …)` in *import* position, and the import-set transforms.

## Decisions

### D1 — The `.exports` datum gains a fourth field, and the reader tolerates its absence

```
(NAME <runtime-table> <call-rows> <compile-time-half>)
```

with

```
<compile-time-half> = (<macro-entry> ... )  <own-refs>  <foreign-refs>
    <macro-entry>  = (<keyword> <literals> (<pattern> . <template>) ...)   ; parse-define-syntax shape
    <own-refs>     = (<internal-name> ...)          ; this unit's own bindings the templates reach
    <foreign-refs> = ("<mangled>" ...)              ; other units' bindings the templates reach
```

Field 4 is exactly `parse-define-syntax`'s output plus two name lists, so nothing converts on either
side: the exporter `write`s the macro-env entries it already built, and the importer conses them onto
a `macro-env`.

`<keyword>` is the **external** name for an exported macro and a unit-qualified spelling for a hidden
one (D3). Refs are split into own/foreign so that neither side has to un-mangle a string: the
importer computes an own-ref's symbol with `mangle` from field 1, and the tree-shake (D6) compares
own-refs against internal names directly.

*Alternative rejected:* a separate `.macros` sidecar. It doubles the artifact-freshness surface
(`artifacts-fresh?` already juggles `.ll`/`.exports`/`.stamp`) for no gain — the compile-time half is
small, textual, and always read with the runtime table.

*Alternative rejected:* a format version tag. `artifacts-fresh?` compares mtimes and the compiler
stamp; a compiler that knows about field 4 has a different stamp than one that does not, so a stale
artifact is already rebuilt. Tolerating a three-field datum (`(if (null? (cdddr t)) '() …)`) is one
line and covers the hand-copied case a stamp would miss.

### D2 — An exported template's free identifiers are resolved in the **exporting** library

At export time, each exported macro's templates are walked and each identifier is classified:

| identifier | action |
|---|---|
| pattern variable of that rule's pattern | leave — substituted at each use |
| `...`, `_`, or anything under `quote` | leave |
| core keyword, `*prims*`, `*integrable*`, `*extra-op-keywords*` | leave — universally known |
| a baked `(scheme base)` derived-form macro | leave (D5) |
| a top-level binding of this library (exported or not) | rewrite to `(mangle <unit> <name>)`; record in `<own-refs>` |
| a name in this library's import env | rewrite to that already-mangled symbol; record in `<foreign-refs>` |
| a macro keyword of this library | rewrite to its unit-qualified spelling and carry it hidden (D3) |
| anything else | **leave** — treated as template-introduced, renamed per expansion exactly as today (D4) |

This is R7RS definition-environment hygiene, and it is what makes a private helper usable from an
exported template with no public-surface widening — the reason this option was chosen over carrying
the template verbatim and requiring every name it mentions to be exported under that spelling. It
also **relaxes** the current prohibition on `(rename …)` for template names: the template no longer
depends on the importer resolving any particular spelling.

The pass is a pure structural rewrite — no `fresh-name`, no counter — so the compile-time half is
deterministic and byte-identical across doors, which `render-datum` and dev→ship fidelity both
require.

The library's **own** body keeps compiling against the *unresolved* `macro-env`, unchanged. Resolving
in place would be tidier but would move emitted IR for a library that uses a macro it also exports;
keeping both envs guarantees the "not a byte moves" goal. The two are IR-equivalent — a unit-internal
reference to `helper` mangles to `@"mymac:helper"` anyway — with one benign difference noted in R4.

### D3 — A private macro an exported template uses travels hidden, under a mangled keyword

Every macro keyword a template mentions is rewritten to `(mangle <unit> <keyword>)` and its own entry
is added to the compile-time half, transitively (its templates are resolved by the same pass, so
private helpers reached two macros deep also work). This is uniform: it applies whether or not the
inner macro is *also* exported publicly, so nothing depends on the importer's naming and one rule
covers both cases. The duplication is a small datum.

Because a macro keyword and a global would then share the `unit:name` spelling, a library that binds
the same name with both `define` and `define-syntax` becomes **an error**, named as such. That
ambiguity exists today (the export check would resolve it arbitrarily); this change is where it gets
a diagnostic.

*Alternative rejected:* expanding an exported template against the exporter's macro-env at export
time so no hidden entry is needed. Pattern variables are opaque at that point, so the inner macro's
patterns cannot be matched — the fixpoint has nothing to work on.

### D4 — An unresolvable identifier stays an introduced identifier (no binding analysis)

The table's last row is the load-bearing one. Because hygiene is a name-set heuristic (see Context),
telling a template-introduced temporary (`tmp` in `(let ((tmp a)) …)`) from a typo'd reference
requires knowing the template's binding structure — and a binder can itself arrive through a macro,
where it is structurally invisible. Attempting the distinction buys either false rejections of
working macros or the marks-based rewrite this change is not.

So: an identifier the pass cannot resolve is left alone and renamed per expansion in the importer,
**exactly as today**. A working macro cannot be broken by the pass, and a typo inside a template
surfaces where it surfaces today — as an unbound renamed variable in the importer. That is a real
diagnostic gap; it gets a GitHub issue rather than a heuristic, and the proposal's earlier phrasing
("rejected at the exporting library") is superseded by this decision.

### D5 — Baked `(scheme base)` macros in a template are left alone, not copied

`when`, `cond`, `case`, `guard` and friends are universally available: every door registers the baked
set before reading the manifest (change: `baked-set-on-every-door`), so an importer's `macro-env`
already has them. Leaving them unresolved keeps artifacts small and avoids dragging each derived
form's own template — and its prelude-procedure references — into every user library's compile-time
half. They join `*prims*` in the pass's "universally known" set.

Consequence, and it is the pre-existing one: under `--no-prelude` an exported macro whose template
uses `when` fails, the same way the baked set fails there today. No regression, and the alternative
(copying transformers) would not fix it either, since their expansions call prelude procedures.

### D6 — The tree-shake's candidate root set grows; the reachability gate does not

`program-root-internals` (`src/compile.ss:596`) folds over the **export list**, testing each mangled
spelling against the emitted program IR text. A private binding reached only through an exported
template is not in that list, so it is not a candidate and gets pruned into a link-time undefined
symbol. The fix is to fold over `exports ∪ <own-refs>` — keeping the "does the program's IR actually
mention it" gate, so a program that never uses the macro still gets the binding pruned. Unconditional
rooting would be simpler and would silently give back size the shake exists to save.

`<foreign-refs>` need no shake handling: they belong to another unit, and a unit that some other unit
imports is not prunable at all under the existing rule (`:604-606`).

### D7 — The importer merges on three axes, at the three existing sites

For each imported table's compile-time half:

- `macro-env` ← its macro entries (exported keywords and hidden mangled keywords alike);
- `known` ← those keywords, plus every ref's symbol, so `collect-renames` does not rename an
  already-resolved identifier away;
- the environment alist ← `(<ref-sym> . <ref-sym>)` for every ref, so a resolved reference lowers as
  `(global-ref <ref-sym>)` and — because the symbol is already unit-qualified — emit does not
  re-mangle it and it becomes an `external global` (the mechanism documented at `src/core.ss:600-606`).

The sites are `compile-library*` (`:695`), `compile-program-with-imports` (`:826`), and the REPL's
import path (`src/repl-core.ss:240-260`), which pushes into `*repl-macro-env*` / `*repl-known*` /
`*repl-env*` and therefore persists across forms the way an imported procedure already does. A new
`import-tables->macro-env` sits beside `import-tables->env-alist` so all three share one reader.

### D8 — No new door mode

`emit lib` (mode 11) resolves its imports against the manifest already, so it can build the same
four-field datum the driver writes; `render-datum` gains the fourth field and stays the single
renderer. The run door's `preload_user_libraries` needs nothing new: a program that uses only a macro
from a library still `import`s it, so the existing closure walk (mode 12) links the unit whose globals
the expansion references.

## Risks / Trade-offs

- **R1 — A stale `.exports` is reused and `cadddr` fails.** → The reader tolerates a three-field
  datum (D1); a pinned test writes a three-field file by hand and reads it.
- **R2 — A typo inside an exported template is diagnosed in the importer, not the exporter.**
  → Accepted (D4) and filed as an issue. It is today's failure mode, not a new one.
- **R3 — A ref's symbol is renamed away by hygiene in the importer.** → Refs join `known` (D7); the
  test that pins this is a template calling a private helper from a *second* library also imported by
  the same program, so the two units' `known` sets have to compose.
- **R4 — An exported macro used inside its own library expands to a unit-internal reference, but to
  an external one in an importer.** → IR-equivalent (same `@"unit:name"` global); the only difference
  is that the internal case can take the direct-call path while the external case goes through the
  call-rows table, which is the pre-existing behavior for every cross-unit reference. Noted, not
  fixed.
- **R5 — A hidden macro's mangled keyword collides with a global of the same spelling.** → The
  double-binding case becomes a named error (D3).
- **R6 — Emitted IR moves for a library that both defines and exports a macro.** → No such library
  exists today, and D2 keeps the own-body env unresolved; `test/module-scaffold-baseline.sha256` and
  `test/self-host-fixpoint.sh` are the check, and both must be run rather than reasoned about.
- **R7 — Artifact growth.** → A transformer datum is small and D5 keeps the baked set out of it, but
  standalone-executable size is a stated design concern: the compile-time half must never reach the
  emitted `.ll`. It is written only to `.exports`.
- **R8 — Self-hosting.** The compiler compiles itself and imports `(emit internal)`. The new pass runs
  on every library compile, so a defect in it can break the fixpoint. → `test/self-emit-equiv.sh` and
  `test/self-host-fixpoint.sh` gate the change; `(emit internal)` exports no macro, so the pass should
  be a no-op there and that no-op is worth asserting explicitly.
