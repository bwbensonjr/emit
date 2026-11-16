# Design

## Context

See `proposal.md` for motivation and the delta specs for the behavior contract. The exploration records Emit `6ee5c79` and Malt `92a3e63`; inspection confirms the relevant architecture remains applicable. The working-tree exploration is input to this proposal, not a file to rewrite.

The learner backend uses nested vectors, scalar dual nodes, and ordinary backward closures. Emit already has the vectors, identity hash tables, records, parameters, `dynamic-wind`, multiple values, library macro exports, and real math it needs. Its exact integers occupy `[-2^60, 2^60)` and overflow traps; there are no bignums, rationals, complex numbers, or public bitwise library.

`src/parse.ss` enumerates raw operations; `src/emit.ss` maps them to runtime functions and emits declarations. Runtime C is in `src/runtime/runtime.c`. `(scheme file)` currently loads input as a whole text string through `%read-file`; it does not offer a bounded binary device read. Opening an entropy device through that interface would be inappropriate.

Libraries under `lib/srfi/` already ship through conventional lookup. The Makefile's `LIBDIRS` presently covers `lib/scheme`, `lib/emit`, and `lib/srfi`, while `LIBDATA` separately enumerates includes and provenance files. Existing useful harnesses include `test/srfi-artifact-tests.sh`, `test/srfi-install-tests.sh`, `test/snow-package-tests.sh`, module/REPL tests, and `tools/test-registry.json`.

The relevant existing specs are `module-system`, `inexact-math`, `primitive-layer`, `dynamic-extent`, and `distribution`. Existing module/numeric/parameter semantics need no changes. The distribution delta preserves existing SRFI guarantees and adds the new shipped sources.

## Goals / Non-Goals

**Goals:** Keep the reusable algorithms in separately compiled libraries, expose an intentional ASCII Scheme API, provide deterministic replay, and validate the same source and artifacts in interactive and standalone use. Include the complete enumerated training surface in this change, sequenced after randomness and tensor/AD foundations.

**Non-Goals:** Other Malt tensor backends, Racket source compatibility, generated export transformers, procedural macros, general host FFI, binary file ports, new numeric types, automatic tensor printer replacement, background threads, or prerequisite representation/GC optimizations. General higher-order AD is not added as an independent feature; preserve the learner backend's tested behavior.

## Decisions

### 1. One public facade with internal library boundaries

Use `lib/malt/learner.sld` as the public facade. Factor implementation into ordinary internal libraries under `lib/malt/learner/` for tensors, autodiff, operations, hyperparameters, random distributions, training, and diagnostics. Their names and exports are implementation details. Keep dependencies acyclic: hyperparameters and tensor representation at the bottom, AD and operations next, training last; diagnostics consume primal extraction without making AD depend on the facade.

This retains a small teaching-facing import while avoiding a baked prelude extension. A single giant source would complicate arithmetic scoping and review. Multiple independently supported public Malt libraries would expand this first release's API commitment unnecessarily. The facade covers the useful union of upstream `learner.rkt` and `main.rkt`, with exclusions listed in the spec, rather than conflating those two interfaces.

The spec owns the exact export inventory. It deliberately excludes upstream's extension-gradient stubs, which only raise errors, and preserves useful base-rank primitives. All source identifiers use ASCII. `primal`, `backprop`, `gradient`, and `gradient1` replace the Greek names; `gradient-of` remains an alias. User documentation includes the upstream-name mapping in words. No bare differentiable comparisons are added.

Inside implementation libraries prefix or rename `(scheme base)` and `(scheme inexact)` operations so shape arithmetic and AD bookkeeping always call ordinary arithmetic. Export differentiable operators through the facade. Show users a prefixed import first:

```scheme
(import (scheme base) (prefix (malt learner) ml:))
(ml:gradient (lambda (x) (ml:* x x)) 3.0)
```

For book-like unprefixed expressions, show explicit exclusions for overlapping base/math names, including `+ - * / abs max expt` and any other name actually shared with the selected imports. Do not depend on implicit import conflict resolution.

### 2. Retain the learner representation and reverse-mode callbacks

Port the algorithms in upstream `learner/tensors`, `learner/autodiff`, and `learner/ext-ops`; translate Racket iteration forms into straightforward recursion or vector traversal. Use one fresh mutable `make-eq-hash-table` per gradient calculation. Backward callbacks mutate and return that same accumulator, preserving their upstream threading shape. Never key gradients by primal numeric value or use a global gradient table.

Preserve structured inputs/results and seed each scalar output with `1.0`, as upstream does for list/vector outputs. Validate shared subexpressions, equal-valued distinct nodes, unused inputs, multiple output leaves, repeated calls, and a nested calculation that cannot contaminate another accumulator. Do not infer arbitrary higher-order derivative support from those isolation tests.

Keep shallow `list->tensor` and permissive vector recognition. Provide checked shape traversal at public construction/shape-sensitive boundaries so malformed nested vectors fail usefully. Explicitly narrow supported vector dimensions to positive integers; support scalar shape `()` consistently, including `build-tensor`. Upstream's shape code indexes the first element, so empty-vector behavior is not a compatibility goal. Document these validation improvements and test them rather than treating every raw vector as a valid rectangular tensor.

Preserve Malt extension rank descent, not a general broadcasting framework. Reuse upstream derivative conventions at ties and nondifferentiable points. Preserve `/` and other numeric behavior from Emit; use tolerances for inexact cross-host checks.

### 3. Use SRFI 27 with an arithmetic-safe MRG32k3a implementation

Use [SRFI 27](https://srfi.schemers.org/srfi-27/srfi-27.html) as the public interface. Its explicit sources and state operations support reproducible learning without a Racket-shaped global `random` API. SRFI 194 adds distribution generators but is unnecessary for this scope; a bespoke `random`/`random-seed` pair would leave ownership and replay less clear.

Adapt the integer MRG32k3a reference implementation from the [SRFI reference sources](https://github.com/scheme-requests-for-implementation/srfi-27/tree/master/reference). Pin its exact revision, retain a pristine test reference and license, and record adaptations. Use the reference initial state and its two-index jump mapping. Do not substitute a hash of `(i,j)` or promise Racket sequence compatibility. Record the mapping and immutable known answers before accepting the Emit implementation. This is a stronger fit than a small linear congruential generator and avoids requiring bitwise/unsigned-64 arithmetic.

The generator has six integer state words and moduli below `2^32`. Core coefficient products fit safely inside Emit's range. Jump-ahead matrix products can exceed that range: implement modular multiplication using bounded limbs or repeated doubling with reduction after each addition. Prove and test intermediate bounds; do not multiply two unrestricted 32-bit state words directly. Walk exponents by `quotient`/`remainder`, avoiding a bitwise dependency. Represent a source with a private record, not a user-forgeable ordinary vector.

For bounded integers, generate unbiased small power-of-two chunks by rejecting excess core outputs. Assemble only the required number of bits (at most 60), then reject candidates outside `[0,n)`. Never materialize `2^60` as an exact integer or form an overflowing multiple of `n`. Special-case `n=1` with documented state consumption. This covers every representable positive exact bound, including bounds above the core modulus.

For reals, form a uniform nonzero 53-bit integer and scale by `2^-53`; reject zero. All integer-to-double conversions are exact, endpoints are excluded, and requested supported units can use the same finer grid. Reject unsupported precision instead of pretending an exact rational result exists. Fix the draw-consumption rules in documentation and fixtures, since changing them changes subsequent integer and real replay.

Use external state datum `(emit-srfi-27 mrg32k3a-v1 s0 s1 s2 s3 s4 s5)`, with validated ranges and neither component triple all zero. Snapshots are copies; restore validates before mutation and copies again. Keep the initial default source deterministic. Applications explicitly call randomization when desired. No serialized procedure, record descriptor, raw pointer, or normal-distribution cache belongs in state.

### 4. Add one private bounded entropy operation

Add `%random-entropy` taking a small positive byte count and returning a fresh bytevector of exactly that length, or `#f` on host failure. Bound requests to 256 bytes; SRFI 27 needs only 24 bytes. Implement the operation as a bounded binary read from `/dev/urandom` on supported macOS/Linux hosts. Reject short, interrupted, or failed reads and close the device before constructing a Scheme result. This uses existing libc file symbols; a direct `getentropy` call retained an unused import in the no-randomness standalone measurement. No C global PRNG state is needed.

The Scheme wrapper checks the result, maps bytes to valid component states, and commits only after a complete valid state is available. A failed operation becomes a catchable Scheme error and preserves source state. Never use a time-only fallback. A test-only host seam supplies deterministic successful, interrupted, short, and failed reads without exporting an application API. Native smoke tests also use the real operating-system provider. This generator is for simulation and learning, not cryptographic secrets.

Wire the raw operation through `src/parse.ss`, `src/emit.ss`, runtime declarations, and native JIT/AOT symbol resolution wherever runtime operations are registered. Follow the existing private filesystem/port operation pattern. Extend independent-host harness support only where it actually evaluates raw operations; the source-driven Chez compiler otherwise emits the same runtime call. Do not add a public entropy primitive or a new `(scheme base)` export. Adding this raw operation crosses the explicit compiler regeneration barrier.

Alternatives considered: whole-text file input cannot safely read a device; adding binary ports is too broad; a host-only PRNG would duplicate deterministic state/sequence semantics outside Scheme; clock seeding would weaken the stated randomization behavior.

### 5. Hyperparameters are shared dynamic parameters

Define `revs`, `alpha`, `batch-size`, `mu`, and `beta` once as `make-parameter` objects. Optimizers read `(alpha)` etc. `(declare-hyper name)` and `(declare-hypers name ...)` expand with `syntax-rules` into parameter definitions with an unset marker. Callers explicitly export declared parameters in normal library declarations. Resolve an unset required training value through a helper that reports the parameter name.

Expand `with-hypers` to `parameterize`; preserve `(with-hypers ((alpha 0.01) (revs 500)) body ...)` and the one-binding `with-hyper` form. Ordinary direct access is `(alpha)`, and direct assignment is `(alpha value)`. This is a documented adaptation from Racket's bare numeric bindings/generated setters. It works across library boundaries and preserves existing dynamic cleanup. Bindings evaluate according to Emit's `parameterize` contract. No caller lexical rebinding or generated setter names are involved.

Implement grid search using the same parameter objects, explicit Cartesian traversal, and dynamically scoped trial execution. Preserve first-accepted-result and enumeration order. Report chosen settings only through explicit diagnostics; do not reproduce Racket's anaphoric `show-hypers` binding or implicit printing.

### 6. Training randomness is a dynamic SRFI source

Export `current-random-source`, initially holding SRFI 27's default source. Distribution/initialization/sampling procedures derive their generators from the active source, never a generator cached from a previous parameter value. Use explicit `let*` sequencing where draw order matters, including tensor initialization and minibatch construction. Preserve upstream sampling with replacement and the returned-index ordering.

Use uncached Box-Muller in Scheme for standard normals: draw `u1` then `u2`, return `sqrt(-2*log(u1))*cos(2*pi*u2)`, and discard the companion value. Compute pi as `4*atan(1.0)`. This deliberately replaces Malt's Ziggurat implementation and its table/normal-sampler state. Two uniform draws per normal make seed/state replay transparent and keep this first implementation small. `random-normal` strips dual wrappers from its parameters like upstream; `random-tensor` converts variance to standard deviation with `sqrt`.

Require finite means and finite nonnegative variance/standard deviation. Integer sequences and state are exact across paths; transcendental-derived values use tolerances across platforms. No Racket normal or random stream is promised. Compare deterministic Malt algorithms using supplied fixed tensors; compare normal sampling using distribution sanity checks and replay, not Racket's random outputs.

### 7. Port training utilities and keep diagnostics explicit

Translate `malted/A-core.rkt` through `O-init.rkt` for the enumerated layers, losses, blocks, models, accuracy, optimizer state/update rules, and initialization. Preserve upstream formulas, including epsilon, smoothing conventions, and its Adam behavior rather than silently substituting a different optimizer variant. Test every exported operation group, not just the XOR path.

Keep helpers for explicit printable conversion and trace output. Replace RackUnit-dependent diagnostic checks with Scheme predicates/assertions and catchable errors using the existing tolerance setting. `trace-print` accepts a value and output port, strips duals, and prints explicitly. `max-tensor-print-length` remains a dynamic rendering setting. No custom writer registration is needed.

Preserve `(record name value)` and return `value` after calling `(current-record-handler)` with `name` and the primal value. Define `(with-recording handler body ...)` with `parameterize`. The default two-argument handler discards events. Handler exceptions propagate with settings restored. This portable callback contract intentionally differs from upstream's threaded logging and fixed moving-average reporter. Do not expose compatibility names with empty implementations.

### 8. Package, test, and measure the delivered library

Extend Makefile library discovery/install data for `lib/malt/`, its internal directory, includes, and license/provenance notices. Use conventional providers; exact entries in `emit-libs.scm` are only needed if an exceptional layout requires them. Keep optional libraries out of the baked partition and stdlib warm list unless explicitly selected. Preserve all existing SRFI byte-identity checks; give adapted SRFI 27 and Malt their own provenance guards.

Add stable test suite IDs to `tools/test-registry.json` for SRFI 27, Malt tensor/AD, training, and installed acceptance; update changed-input classification. Reuse SRFI 64 and existing shell narration conventions, assert completion and expected assertion counts, and retain reports. Reference checks compare the pinned Racket backend against shared fixed data through a reproducible fixture adapter. Ordinary native tests require no Racket, upstream checkout, network, or Chez. Explicit reference fixture verification requires its declared Racket tool and fails clearly if absent.

Acceptance includes exact PRNG/state known answers, range-reduction rejection cases with controlled core draws, precision limits, malformed state, entropy failures, tensor validation, rank descent, analytic and finite-difference AD, shared-node accumulation, hyperparameter restoration, fixed optimizer updates, scalar quadratic convergence, and seeded XOR. Translate the inspected book `Malt_deep_learning/xor.rkt`: a 2-to-8-to-1 ReLU block stack, four XOR inputs, squared-error loss, naked gradient descent, `alpha = 0.01`, `revs = 4000`, and `batch-size = 4`. Require each prediction to be within `0.1` of its target (therefore all four classify correctly at `0.5`) and total squared error below `0.04`. The book's Racket seed `42` does not select the same Emit stream. Establish and commit an Emit stream pair and independently verified initial tensors/sample schedule during fixture preparation, before accepting port training output; use those fixed data for the Racket comparison. Commit provenance and expected outcomes so later checks are self-contained. A seed choice is test data, not a promise of convergence for arbitrary seeds.

Measure elapsed time, peak memory where available, and executable size for tensor/AD, scalar training, and XOR, recording host/toolchain/input sizes. Compare a no-Malt-import executable before/after and inspect retained symbols to verify no mandatory PRNG/learner payload. Measurements inform later `docs/PERFORMANCE.md` entries; do not make new compiler or GC optimizations prerequisites without concrete correctness needs. Any discovered correctness defect outside this change is filed as a GitHub issue per AGENTS.md.

## Risks / Trade-offs

- Broad teaching API: use the explicit export inventory and upstream-derived test mapping to prevent accidental omissions or placeholder exports.
- Jump-ahead and range-reduction arithmetic: independently compute fixtures with arbitrary-precision host arithmetic, test maximum bounds, and audit all intermediate products before trusting determinism.
- Large numbers of dual nodes and boxed flonums: measure bounded representative training; keep tensor representation optimization out of acceptance.
- Different random-normal transform and numeric tower: publish the differences, compare fixed-data computations against Racket, and use per-fixture tolerances for real math.
- Dynamic parameter API differs from Racket values: provide runnable prefixed and unprefixed examples and cross-library restoration tests.
- Entropy host differences: test the real provider on the supported platform matrix and controlled failure paths without assuming two randomizations can never collide.

## Migration Plan

This is additive. Implement foundation randomness first, then tensor/AD, then training and facade integration. Finish compiler-source changes and formatting before `make regen`; do not edit compiler inputs again until validation finishes. Run full native regression, source units, classified targeted reference suites, and the isolated source comparison. Run complete independent-host verification for the eventual release.

Add one minor `VERSION` bump and matching nonempty changelog section in the implementation PR, selecting the next minor from its actual base. Existing programs acquire no new implicit names. Before handoff, use `emit-finish-change` to sync/archive specs and prepare one reviewable PR; merging that reviewed versioned PR is the release approval. Rollback of an unmerged implementation is removal of the additive libraries/plumbing; released fixes follow the normal new-release process, preserving published tags.
