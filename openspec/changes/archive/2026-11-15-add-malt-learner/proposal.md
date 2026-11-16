# Proposal

## Why

Emit can express Malt's nested-vector learner backend, but cannot yet run its teaching and training examples as shipped Scheme libraries. Porting that backend and adding reusable, seedable randomness makes tensor programming, automatic differentiation, and small learning applications available throughout Emit's development and delivery workflow.

## What Changes

- Ship an ordinary `(malt learner)` library covering the learner tensor/AD backend and the model, layer, loss, initialization, sampling, and optimizer utilities currently composed by Malt's top-level package.
- Provide an explicit ASCII export surface, parameter-based hyperparameters, synchronous recording callbacks, and explicit tensor rendering. Document adaptations from Racket rather than promising source compatibility.
- Ship `(srfi 27)` with independent random sources, deterministic stream selection, state save/restore, unbiased bounded integers, uniform reals, and explicit entropy-based randomization. Use MRG32k3a with arithmetic that fits Emit's exact-integer range.
- Add one private runtime entropy operation and its compiler/runtime plumbing; retain the generator, distributions, tensors, AD, and training algorithms in Scheme libraries.
- Exercise source-driven compilation, `emit lib`, `emit run`, `emit repl`, standalone executables, and installed sources. Include upstream-derived checks, analytic and numerical gradients, and deterministic training examples.

## Capabilities

### New Capabilities

- `random-sources`: The SRFI 27 interface, reproducibility, supported numeric ranges, state ownership, and entropy failure behavior.
- `malt-learner`: Nested-vector tensors, function extension, scalar reverse-mode AD, training utilities, portable hyperparameters, explicit diagnostics, and execution fidelity.

### Modified Capabilities

- `distribution`: Add SRFI 27 to the selected optional shipped SRFIs and install the complete Malt and random-library source and license closure.

## Impact

New sources belong under `lib/malt/` and `lib/srfi/27*`. Minimal entropy plumbing affects `src/runtime/runtime.c`, the primitive parser/emitter and declarations, and independent-host support as needed. Packaging, library tests, the test registry/classifier, documentation, attribution, and source-release checks gain coverage. No new external runtime dependency is required.

The implementation is one feature change and takes one minor version bump with a matching changelog section (currently `0.6.0`, so `0.7.0` if unchanged at implementation). This planning-only proposal takes no bump. The existing module, numeric, parameter, and macro contracts remain in force.

Other Malt backends, Racket's generated setters/provide transformers, its exact PRNG sequence, threaded logging, automatic global printing hooks, rational/complex arithmetic, and compiler/GC optimization are outside this change. Reusable randomness is implemented first within this change rather than requiring a separate proposal.
