## Why

P9 removed indirect dispatch from statically known calls to variadic library procedures, but its
3,000,000-call benchmark remained at a 0.40 s median because every call still enters the variadic
prologue, spills the positional slots, and calls `rt_build_rest` even when the rest list is known to
be empty. The historical fixed-arity result suggests a material win may remain, but a second entry
point adds code and interface complexity, so the project should prove that win before committing to
the full change.

## What Changes

- Capture a preserved baseline and prototype a same-signature fast entry for calls that pass exactly
  a variadic procedure's minimum arity; the entry binds the rest parameter to `()` without the
  generic arity check, slot spill, or `rt_build_rest` call.
- Gate production work on a repeatable improvement of at least 5% in P9's existing call-dominated
  `number->string` benchmark. If the gate fails, remove the prototype and record the no-go result.
- If the gate passes, publish the optional fast-entry label through the separate-compilation call
  interface and select it for eligible intra-unit and cross-unit known calls while retaining the
  ordinary variadic entry for additional arguments, `apply`, value-position calls, and older
  artifacts. Generate that label in a disjoint compiler namespace so it cannot alias an ordinary
  entry derived from a legal Scheme identifier.
- Preserve the uniform closure ABI, guaranteed tail calls, cross-door behavior, tree-shaking roots,
  assignment safety, and compatibility with existing fixed and variadic call rows.
- Measure the delivered speed and code-size trade-off, update P9 with the result, and complete the
  regeneration and test barrier only for the retained production change.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `aot-codegen`: Permit a known minimum-arity call to bypass an empty-rest variadic prologue through
  a compatible fast entry, subject to a benchmark gate and without weakening tail-call guarantees.
- `module-system`: Extend the optional procedure call interface so separately compiled importers can
  select a published minimum-arity fast entry without changing the ordinary closure entry.

## Impact

The prototype and possible retained implementation affect call lowering and LLVM emission in
`src/passes/lower.ss` and `src/emit.ss`, procedure call-interface production/consumption in
`src/core.ss`, and their focused direct-call, module, tail-call, tree-shaking, parity, and scaffold
tests. Retaining compiler-source edits requires `make regen`, `run-all-tests.sh`, and
`run-dev-tests.sh` under the repository's regeneration barrier. No Scheme-visible API or accepted
program behavior changes.
