# Malt learner port to Emit

Status: implemented in Emit 0.7.0; moved to the
[emit-packages](https://github.com/bwbensonjr/emit-packages) collection by the
`move-malt-to-emit-packages` change (see `emit-packages-registry.md`).
Captured: 2026-11-15. Emit checkout: `6ee5c79`; Malt checkout: `92a3e63`.

Implement an R7RS library named `(malt learner)` supporting the tensor and
automatic differentiation facilities used in *The Little Learner*, followed by
its training utilities. Include the supporting Emit libraries needed for useful
examples, particularly seedable pseudorandom numbers. The core appears feasible
with Emit's existing runtime; preserving Racket-specific macros, imports, and
display behavior needs deliberate adaptation.

## Repository context

Local source repositories:

- Emit: `/Users/bwb/src/github.com/bwbensonjr/emit`
- Malt: `/Users/bwb/src/github.com/themetaschemer/malt`
- Book examples: `/Users/bwb/src/github.com/mark-watson/Racket-AI-book`

`themetaschemer/malt` is the toolkit accompanying *The Little Learner*.
`Racket-AI-book/source-code/Malt_deep_learning` consumes that package through
`(require malt)`; it does not contain a second Malt implementation. Its separate
category-theory and MicroGPT implementations are not Malt API substitutes.

Malt's default `learner` backend uses nested vectors and scalar differentiation
nodes. It corresponds to Appendix A. Other Malt backends have different internal
representations; this proposal should specify the `learner` behavior explicitly.
The upstream README calls for `nested-tensors` or `flat-tensors` for Morse.

## Existing Emit capabilities

Emit already supplies vectors, closures, rest arguments, proper tail calls,
multiple values, real floating-point math, identity hash tables, parameters,
`dynamic-wind`, and R7RS libraries with import selection and renaming.

Useful implementation references in Emit:

| Capability | Source |
|---|---|
| Multiple-vector `vector-map` | `src/prelude.scm`, definition of `vector-map` |
| Identity hash tables | `src/prelude.scm`, `make-eq-hash-table`, `hash-table-ref/default`, `hash-table-set!` |
| Dynamic settings and cleanup | `src/prelude.scm`, `make-parameter`, `parameterize`, `dynamic-wind` |
| Real transcendental functions | `lib/scheme/inexact.sld` |
| Libraries, imports, macros, and limitations | `docs/MODULES.md`, `docs/PROJECTS.md` |
| Numeric representation and allocation | `src/runtime/runtime.c`, `rt_make_flonum` and arithmetic procedures |

A primitive smoke test through `build/emit run` confirmed distinct vector keys
in an identity table, multiple-vector mapping, multiple return values, parameter
restoration, and `sqrt`, `exp`, and `log`. A complete Malt port has not been run.

## Adaptations to design

### Tensor and differentiation core

Port nested-vector construction, rank, shape, indexing, reshaping, and function
extension without changing their observable rules. In particular, Malt's
extension rules are the reference, rather than assuming NumPy broadcasting.
Its default `list->tensor` is a shallow `list->vector`, not a recursive conversion
of nested ordinary lists.

Malt's reverse-mode callbacks are ordinary closures; they do not require full
Scheme continuations. Its validation uses `call/cc` for early exits, compatible
with Emit's escape-only implementation.

Upstream threads immutable identity tables through differentiation. A candidate
adaptation is one fresh mutable identity table per gradient calculation,
mutating and returning the same table through those callbacks. Preserve node
identity: equal numeric values in different nodes must not merge. Test repeated
use of one node and distinct nodes with equal values.

### Macros and arithmetic namespaces

Replace `#lang`, `require`, and `provide` with R7RS libraries. Separate ordinary
arithmetic used inside primitives from exported differentiable arithmetic using
explicit imports, exclusions, and renaming. Decide whether `(malt learner)`
exports the full training surface or composes smaller libraries.

Malt's `declare-hyper`, `with-hypers`, and custom `hypers` export transformer use
`syntax-case` and generated identifier names. Emit supports `syntax-rules` only.
Preserving the standard `with-hypers` call syntax appears practical, but the
generic declaration and setter-generation mechanism needs a new design. Do not
assume lexical rebinding of a caller's `alpha` changes an imported optimizer's
binding; define how dynamic settings reach library procedures. Prefer a library
solution before proposing procedural macro support in the compiler.

### Random numbers

No public `random` or `random-seed` facility was found in Emit's shipped
libraries, prelude, or runtime. Malt uses uniform real `(random)` and bounded
integer `(random n)` calls for initialization and sampling, then implements a
normal sampler in Scheme.

Choose a public library and API for a reusable seedable PRNG. Specify state
ownership, seed behavior, output ranges, bounded-integer sampling, reproducible
sequences, and operation within Emit's bounded exact-integer arithmetic. Consider
an established Scheme random interface before adding a bespoke one. Matching
Racket's exact random sequence is a separate decision from supporting Malt's
operations. Normal sampling can use Malt's transform or another specified
algorithm, with appropriate attribution.

### Runtime integration and numerical behavior

Replace Racket iteration forms and helper procedures as needed. Use Emit's test
infrastructure or SRFI 64 in place of RackUnit. Replace threaded Racket logging
with a suitable callback or synchronous implementation. Explicit tensor printing
is a simpler first target than replicating Racket's global port hooks.

Emit has bounded exact integers and IEEE double flonums, without exact rational
or complex arithmetic. State which numerical differences are accepted, including
non-integral division, exactness, overflow, and invalid-domain results. Compare
floating-point outputs with tolerances.

The `learner` backend creates many vectors and backward closures; Emit also
allocates boxed flonums. Measure representative workloads before proposing
unboxing, packed tensors, GC changes, or other performance work as prerequisites.

## Suggested proposal scope and acceptance

1. Define the `(malt learner)` export surface, compatibility target, library
   boundaries, and hyperparameter design.
2. Provide the seedable random library and deterministic checks of its specified
   sequences and ranges.
3. Port tensors, extension, scalar primitives, and reverse-mode differentiation.
4. Add layers, losses, parameter initialization, sampling, and optimizers needed
   by selected book examples.
5. Verify the same library in `emit run`, the REPL, and an `emit build` standalone
   executable. Preserve Emit's development-to-delivery behavior.

Acceptance should cover rectangular tensor construction and shape errors,
extension semantics, analytic and finite-difference gradients, shared-node
accumulation, nested hyperparameter restoration, seeded initialization, and a
small end-to-end training example. Reuse relevant upstream tests and compare
against Racket Malt. The book repository's XOR example currently runs successfully
under installed Racket Malt and is a useful application reference.

Choose explicitly whether the first change includes all training utilities or
splits reusable randomness and the tensor/AD core into prerequisite changes.
Treat other tensor backends, full Racket source compatibility, automatic custom
printing, threaded logging, and compiler optimization as separate scope choices.

## Upstream source map

Paths below are relative to the Malt repository:

- `main.rkt`, `learner.rkt`: exported interface.
- `learner/tensors/0-duals.rkt`: dual nodes and gradient accumulation.
- `learner/tensors/B-tensor-basics.rkt`: vector representation and construction.
- `learner/tensors/C-tensor-ops.rkt`: shape, rank, reshape, validation.
- `learner/tensors/D-extend.rkt`: unary and binary function extension.
- `learner/autodiff/A-autodiff.rkt`: reverse-mode traversal.
- `learner/autodiff/B-prims.rkt`: differentiable primitive constructors.
- `learner/ext-ops/`: arithmetic, reductions, correlation, concatenation.
- `malted/`: layers, losses, gradient descent variants, blocks, initialization.
- `tools/A-hypers.rkt`: hyperparameter macros.
- `tools/B-random.rkt`: normal sampling and required uniform PRNG operations.
- `tools/C-logging.rkt`, `ports.rkt`, `learner/autodiff/E-print.rkt`: Racket integration.
- `README.md`, `scribblings/docs/`, and adjacent test directories: usage and contracts.
- `LICENSE`: MIT; retain upstream copyright and license notices when porting code.

## Prompt for the next Emit session

Read `AGENTS.md` and `openspec/explorations/malt-learner.md`. Use the repository's
OpenSpec proposal workflow to propose `(malt learner)` and the supporting
seedable random library. Inspect the local Malt source and current Emit support,
resolve the API and scope choices above, and produce the proposal, design,
specification deltas, and tasks. Favor library changes; justify any compiler or
runtime changes with a concrete requirement. Prepare the proposal before
starting implementation.
