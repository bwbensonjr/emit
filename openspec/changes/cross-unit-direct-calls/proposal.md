## Why

A call into a library — `(zero? n)`, `(map f xs)`, anything from `(scheme base)` — still loads the
callee's code pointer out of its closure and calls indirectly. P5-B-general made *intra-unit* calls
direct, but 808 call sites in the compiler's own module remain, and they are the ones every program
pays for: `(scheme base)` is auto-imported everywhere.

Measured on a 30-million-call probe against `scheme.base:zero?`, hand-patching the call site to
`call fastcc @"scheme.base:code_N"`:

| | no LTO | with `-flto` |
|---|--------|--------------|
| indirect (today) | 0.06s | 0.06s |
| direct call | 0.06s | **0.01s** |

The shape of that table is the whole point. **Neither half is worth anything alone.** A direct
call by itself only removes an L1-resident load behind a perfectly-predicted branch. LTO by itself
does nothing either, because the callee is a *runtime heap closure* — LLVM cannot devirtualize a
value that `__init` allocated, however much of the program it can see. Only together, where the
direct call is something LLVM can then inline across unit boundaries, do they pay: **6×**.

That is why this is one change rather than three, and why it should not be started piecemeal.

## What Changes

- **Stable code labels for library top-level procedures.** A library's exported procedure gets a
  code label derived from its mangled binding name (`scheme.base:code:zero?`) instead of the
  gensym counter. This is the blocker, found by trying it: AOT tree-shaking recompiles each unit
  per program, so counter-derived labels *renumber* — `zero?` is `scheme.base:code_168` in the
  committed unit and `scheme.base:code_216` in a pruned one. A program cannot name a callee whose
  label depends on a pruning decision driven by that same program. Inner lambdas and program-unit
  code keep the counter untouched.
- **The export table carries the label and arity** for each lambda-valued export, so a program
  compiled against the interface alone can emit the direct call. Library code labels already have
  external linkage, so no linkage change is needed.
- **A call whose operator resolves to a library procedure of matching arity lowers to a direct
  call**, passing the loaded global as the callee's `self` — the global is still read (it carries
  the captured environment); only the code-pointer load disappears.
- **The AOT link enables `-flto`**, without which the above buys nothing.
- **BREAKING (artifact format):** `.exports` gains a field. Cached artifacts are keyed on a
  compiler content hash (`artifact-compiler-stamp`), so existing caches invalidate automatically;
  no migration is needed, but stale hand-copied artifacts would be rejected.

## Capabilities

### New Capabilities

_None._ This extends existing module-system and codegen surfaces.

### Modified Capabilities

- `module-system`: the **Library export table** requirement gains the code label and arity for
  lambda-valued exports, and a new requirement fixes those labels as *stable across pruning* —
  today nothing forbids the tree-shaken recompile from renumbering them.
- `aot-codegen`: a new requirement for **cross-unit direct calls**, sibling to the existing
  self-call requirement; and the **release profile** requirement gains LTO.

## Impact

- **`src/passes/lower.ss`** — a `global-ref` operator with a known label becomes a `known-app`;
  the existing node and emitter path are reused unchanged.
- **`src/core.ss`** — `compile-library*` records each export's label/arity in the table; the
  pruned path must produce the *same* labels as the full path.
- **`src/parse.ss` / import resolution** — the import environment carries label + arity alongside
  the mangled symbol.
- **`src/emit.ss`** — declare the external code labels a module direct-calls.
- **`src/compile.ss`, `src/emit.cpp`** — `-flto` on the AOT link.
- **Artifacts** — `.exports` format; every committed `bootstrap/*.ll` regenerates (labels rename).
- **Risk concentrated in three places:** label stability across the full/pruned pair (a mismatch
  is a link error, which is the safe direction); the closed-world assumption that a library global
  is never reassigned after `__init` (see design D4 — it appears to hold on *both* doors today,
  which would avoid a dev→ship carve-out entirely); and LTO's effect on build time and binary size.
