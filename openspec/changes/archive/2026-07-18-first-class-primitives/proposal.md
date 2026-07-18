## Why

Primitives are reserved, head-only keywords: they cannot be passed as values (only four
are eta-patched — `car`/`cdr`/`cons`/`string-append`) and cannot be shadowed, unlike every
other procedure. We want full consistency: **any procedure, including a primitive, is a
first-class value and is shadowable.** The `primitives-first-class-spike` (archived) proved
the approach is viable — first-class use and shadowability work essentially for free once
primitives are ordinary bindings — and surfaced the one design constraint that shapes this
change: primitives must stay **universally available**, so their ordinary-binding wrappers
cannot live only in the optional `(scheme base)` layer.

## What Changes

- **An always-linked "primitive layer."** Introduce a base set of ordinary procedures —
  one per primitive (`cons`, `+`, …) — defined over raw `%`-prefixed primcalls
  (`%cons`, `%add`, …). This layer is available **everywhere the raw primitives are today**:
  in programs, in user libraries (which do not import `(scheme base)`), and under
  `--no-prelude`. Only the raw `%`-ops remain reserved primcall heads; the plain names
  become ordinary, shadowable bindings.
- **A primitive-inlining pass.** A shadow-aware pass rewrites a direct call whose operator
  resolves to the global, unshadowed, un-`set!` primitive-layer binding back into a bare
  primcall, so `(cons a b)`/`(+ a b)` keep today's bare-op codegen. Value-position and
  shadowed/`set!` uses go through the ordinary closure. Perf is unchanged "in most cases."
- **Staged bootstrap.** Renaming a primcall head is a two-regen operation (teach the
  committed seed the `%` names, then flip the plain names to wrappers) — an inherent
  self-hosting constraint the spike proved. The rollout applies primitives in staged
  batches, each a 2-regen.
- **Dual-host shim.** Where the prelude/primitive layer is `(load)`-ed under Chez
  (e.g. `test/read-all-tests.ss`), bind every `%`-prim to its Chez equivalent.
- Retire the four-primitive eta special-case (`prim-as-value`) once all primitives are
  first-class through the layer.

## Capabilities

### New Capabilities
- `primitive-layer`: The requirement that primitives are exposed as ordinary, universally
  available, shadowable procedures over reserved `%`-raw primcalls, with a shadow-aware
  inliner recovering bare primcalls for direct unshadowed calls, and dev→ship fidelity.

### Modified Capabilities
- `core-language`: primitives change from reserved, non-rebindable, head-only keywords to
  ordinary first-class, shadowable bindings (the "reserved primitive" framing for the plain
  names — e.g. `not`, `eqv?`, the M1 arithmetic/pair ops — is updated; the raw `%`-ops are
  the reserved forms).
- `compiler-pipeline`: add the primitive-inlining pass to the frontend pass ladder.

## Impact

- **Modified**: `src/parse.ss` (prims set, resolver hook, retire eta), `src/emit.ss`
  (%-raw op table), `src/prelude.scm` + the new always-linked layer, a new inline pass,
  `bootstrap/*.ll` (staged regens), the Chez host shim for affected tests.
- **Behavior**: primitives usable as values and shadowable everywhere; direct-call codegen
  and binary sizes unchanged where the inliner fires (verified against the spike's baseline).
- **Reference**: builds directly on the archived `primitives-first-class-spike` findings.
