# malt-learner Specification

## Purpose

Make Malt's nested-vector learner backend and its associated training utilities available as ordinary Scheme libraries with consistent interactive and standalone behavior.

## Requirements

### Requirement: The learner facade is an ordinary explicit library

Emit SHALL provide `(malt learner)` with the public surface below and the learner backend semantics from Malt revision `92a3e63`, subject to the documented adaptations in this spec. It SHALL resolve and compile through ordinary library artifacts and SHALL NOT be baked into the compiler or added to implicit imports.

#### Scenario: Public exports are enumerated

- **WHEN** a program imports the learner facade
- **THEN** the supported export inventory and naming adaptations are the following

The facade's supported exports are listed below. Names use ASCII: `primal` corresponds to upstream's Greek rho, `backprop` to kappa, `gradient` to nabla, and `gradient1` to superscript-one nabla. The ASCII suffix `-primal` replaces upstream's hyphen-rho suffix. These are spelling adaptations, not different tensor algorithms.

| Group | Exports |
|---|---|
| Tensors and lists | `len ref refr tref tlen tmap list->tensor tensor build-tensor scalar? tensor? rank shape reshape trefs map*` |
| Extension and AD | `ext1 ext2 ext1-primal ext2-primal prim1 prim2 dual dual? primal backprop gradient gradient1 gradient-of` |
| Differentiable operations | `+ - * / exp log expt sqrt sqr sum abs *-2-1 argmax max sum-cols correlate rectify flatten concat concat-n` |
| Primal operations | `+-primal --primal *-primal /-primal exp-primal log-primal expt-primal sqrt-primal sqr-primal zeroes-primal sum-primal abs-primal *-2-1-primal argmax-primal max-primal sum-cols-primal correlate-primal rectify-primal flatten-primal concat-primal` |
| Base-rank operations | `+-0-0 --0-0 *-0-0 /-0-0 expt-0-0 exp-0 log-0 abs-0 rectify-0 sqrt-0 sum-1 argmax-1 max-1 flatten-2 concat-1-1` |
| Comparisons | `=-0-0 <-0-0 <=-0-0 >-0-0 >=-0-0 =-1 <-1 >-1 <=-1 >=-1 !=-1` |
| Layers and models | `dot-product-2-1 dot-product line quad linear-1-1 linear plane softmax relu k-relu recu corr k-recu signal-avg model accuracy` |
| Losses and blocks | `l2-loss cross-entropy-loss kl-loss block block-fn block-ls stack-blocks` |
| Training | `revise gradient-descent naked-gradient-descent velocity-gradient-descent rms-gradient-descent adam-gradient-descent smooth epsilon samples sampling-obj` |
| Initialization | `random-normal random-standard-normal random-tensor init-theta init-shape zero-tensor zeroes current-random-source` |
| Hyperparameters | `revs alpha batch-size mu beta declare-hyper declare-hypers with-hyper with-hypers grid-search` |
| Diagnostics | `tolerance trace-print check-dual-equal? check-primal-gradient max-tensor-print-length make-printable record with-recording current-record-handler` |

Upstream's unimplemented extension-gradient stubs, generated setters, provide transformer, threaded logging procedures, and automatic printing controls are excluded. Ordinary Scheme comparisons are retained; the facade does not replace `= < > <= >=`.

#### Scenario: Arithmetic namespaces are explicit

- **WHEN** a program explicitly imports `(scheme base)` and a prefixed `(malt learner)`
- **THEN** ordinary arithmetic and the prefixed differentiable operations coexist
- **AND** an unprefixed import uses explicit exclusions for overlapping Scheme bindings

#### Scenario: Direct learner import selects differentiable arithmetic

- **WHEN** a fresh REPL imports `(malt learner)` and evaluates `(gradient (lambda (x) (* x x)) 3.0)`
- **THEN** it returns `6.0` without explicit exclusions or prefixes
- **AND** unrelated implicit base names remain available

#### Scenario: Learner program uses Emit defaults

- **WHEN** the same import and expression form a program without an explicit base import
- **THEN** `emit run` and a standalone executable both compute `6.0`
- **AND** this implicit-default convenience is documented as an Emit extension

#### Scenario: Explicit program imports remain portable

- **WHEN** a program explicitly imports both `(scheme base)` and unprefixed `(malt learner)` without exclusions
- **THEN** it reports an import conflict
- **AND** excluding `+ - * / abs max expt` from base makes the learner import valid

### Requirement: Tensors use nested vectors with checked construction

Scalars SHALL be numbers or scalar duals, and tensors SHALL use nested vectors. `tensor` SHALL reject empty input, nonnumeric leaves, and inconsistent shapes with catchable errors. `list->tensor` SHALL remain shallow. Shape-driven constructors SHALL reject nonpositive dimensions; an empty shape SHALL represent a scalar. Raw vector conversion and `tensor?` SHALL retain upstream's permissive behavior.

#### Scenario: Construction and shallow conversion

- **WHEN** `tensor` constructs two rows of three scalars
- **THEN** its shape is `(2 3)` and rank is `2`
- **AND** `list->tensor` on a list of ordinary lists yields a vector of lists, without recursively converting them

#### Scenario: Invalid and scalar shapes

- **WHEN** construction receives mismatched rows or a shape containing zero or a negative dimension
- **THEN** it raises a catchable error
- **AND** `build-tensor` with shape `()` invokes its builder once with the empty index list and returns the scalar result

### Requirement: Indexing and reshape preserve tensor ordering

Indexing, selection, and reshape SHALL follow the learner backend's axis order. Reshape SHALL preserve leaf order and count, including dual identity. Incompatible element counts and invalid indices SHALL produce diagnostics. Validated public shape operations SHALL reject malformed tensors rather than silently train on ragged data.

#### Scenario: Reshape preserves data and gradients

- **WHEN** a `(2 3)` tensor is reshaped to `(3 2)` and selected leaves are differentiated
- **THEN** the six primal leaves retain their row-major order and gradients reach the original leaves
- **AND** reshaping six elements to `(2 2)` raises a catchable error

### Requirement: Extension follows Malt rank descent

`ext1` and `ext2` SHALL descend to their declared base ranks using Malt's learner rules. Binary extension SHALL pair equal leading lengths, otherwise descend the higher-rank argument, and reject incompatible equal-rank shapes. It SHALL NOT introduce singleton-axis broadcasting absent from Malt.

#### Scenario: Scalar extension and incompatible vectors

- **WHEN** differentiable addition receives scalar `10` and vector `#(1 2 3)`
- **THEN** its primal result is `#(11 12 13)`
- **AND** adding vectors of lengths one and three raises a catchable shape error instead of broadcasting the shorter vector

### Requirement: Reverse-mode differentiation preserves node identity

Gradients SHALL accumulate contributions by scalar dual identity, with fresh accumulation state per calculation. Shared nodes SHALL accumulate all contributions, while distinct nodes with equal primal values SHALL remain distinct. `gradient`, `gradient1`, primitive constructors, and structured gradient results SHALL follow the pinned learner backend's contracts.

#### Scenario: Shared and equal-valued nodes

- **WHEN** `f(x) = x*x + x` is differentiated at `x = 3`
- **THEN** its derivative is `7`
- **AND** differentiating `f(x,y) = x + 2*y` at two distinct leaves both equal to `3` yields separate derivatives `1` and `2`

#### Scenario: Independent gradient calls

- **WHEN** the same function and inputs are differentiated repeatedly or a differentiation invokes another calculation
- **THEN** results contain no contributions from an earlier or enclosing accumulator

### Requirement: Primitive derivatives and tensor operations match the learner backend

The supported operations SHALL preserve upstream value, rank, reduction, concatenation, correlation, and derivative rules. Tests SHALL include analytic and central finite-difference checks at smooth points and explicit upstream conventions at nonsmooth points, including rectification at zero and maximum ties.

#### Scenario: Analytic and numerical evidence agree

- **WHEN** smooth scalar, reduction, matrix-vector, and correlation fixtures are differentiated
- **THEN** analytic answers and central finite differences agree within each fixture's declared tolerance
- **AND** maximum tie and rectification-zero tests use pinned upstream answers rather than finite differences

### Requirement: Hyperparameters are dynamically scoped parameter objects

`revs`, `alpha`, `batch-size`, `mu`, and `beta` SHALL be parameter objects shared with imported optimizers. `with-hypers` SHALL preserve `((name value) ...)` binding syntax and restore settings on normal return, exceptions, and supported escape continuations. Custom declarations SHALL create parameter objects without generated setters or automatic exports. Reading an unset setting for training SHALL raise a named catchable error.

#### Scenario: An imported optimizer sees caller settings

- **WHEN** a caller uses `with-hypers` to bind `alpha` and `revs`, then invokes an imported optimizer
- **THEN** the optimizer reads those settings from the shared parameters
- **AND** nested overrides and exceptional or escape exits restore the previous settings

#### Scenario: Generic declarations need no procedural macros

- **WHEN** a library declares a custom hyperparameter and explicitly exports it
- **THEN** importers can use it with `with-hypers` and read its value with `(name)`
- **AND** its declaration introduces no synthesized `set-name!` identifier

### Requirement: Training utilities retain their functional contracts

Layers, losses, blocks, models, initialization, sampling, and all four optimizer variants SHALL follow the pinned Malt utilities with learner tensors. Sampling SHALL draw indices with replacement. Grid search SHALL enumerate the first parameter slowest and return the first result accepted by its predicate, or `#f` when exhausted, restoring settings between trials and on exit.

#### Scenario: Optimizer updates are independently checkable

- **WHEN** naked, velocity, RMS, and Adam optimizers run small fixed-gradient fixtures
- **THEN** parameters and optimizer state match independently calculated one-step and multi-step answers within declared tolerances

#### Scenario: Deterministic scalar learning

- **WHEN** naked gradient descent minimizes `(30 - theta[0])^2` from `(3.0)` with `alpha = 0.01` and `revs = 500`
- **THEN** the final scalar is within `1e-9` of `29.998892352401082`

#### Scenario: Grid search order and restoration

- **WHEN** two hyperparameters have two candidate values each and the predicate accepts only the third trial
- **THEN** trials visit pairs in Cartesian-product order with the last parameter changing fastest, return that third result, and restore both outside settings

### Requirement: Learning randomness belongs to an explicit source

`current-random-source` SHALL be a parameter initially referring to SRFI 27's default source. Initialization, normal draws, and sampling SHALL consume only its active source. Restoring that source's state SHALL reproduce the same call sequence without hidden normal-sampler state. `random-tensor` SHALL interpret its second argument as variance; `random-normal` SHALL interpret its second as standard deviation.

#### Scenario: Seeded initialization and sampling replay together

- **WHEN** an independent source is seeded, selected dynamically, snapshotted, and used for initialization followed by minibatch sampling
- **THEN** restoring the snapshot repeats tensor values within platform math tolerance and integer sample indices exactly
- **AND** the default and other independent sources remain unchanged

### Requirement: Diagnostics are explicit and synchronous

`make-printable` and `trace-print` SHALL render tensors explicitly without global printer hooks. `(record name value)` SHALL return `value` while synchronously passing its name and primal value to `current-record-handler`; its default handler SHALL do nothing. `with-recording` SHALL install a caller-supplied handler dynamically and restore it on exit. No background logging thread SHALL be required.

#### Scenario: Recording observes values without changing training

- **WHEN** `(with-recording handler body ...)` runs a computation containing `record`
- **THEN** the handler receives names and primal values in call order, body results are preserved, and the previous handler is restored after normal or exceptional exit

### Requirement: Numerical compatibility follows Emit's supported tower

The port SHALL use Emit's bounded exact integers and IEEE double flonums. Nonintegral exact division SHALL follow Emit's inexact result policy; overflow SHALL retain its diagnostic behavior. Invalid real domains SHALL follow existing IEEE behavior. Documentation SHALL disclose these differences from Racket and SHALL state per-fixture floating-point tolerances.

#### Scenario: Floating-point comparison respects the implementation

- **WHEN** primal values, derivatives, or training results are compared with Racket fixtures
- **THEN** finite flonums use declared absolute/relative tolerances, exact shapes and sample indices use exact checks, and NaN/infinity tests use the existing predicates

### Requirement: Learner behavior has development-to-ship fidelity

The same library source and settings SHALL produce equivalent results under source-driven compilation, `emit run`, `emit repl`, and an executable produced by `emit build`. A small seeded nonlinear training example SHALL learn a useful predictor on all native paths. Standalone execution SHALL require no Emit library sources or Racket installation at runtime.

#### Scenario: Seeded XOR learns through all native paths

- **WHEN** the documented XOR network, seed, initialization, optimizer, and iteration budget are used in run, REPL, and standalone checks
- **THEN** all four inputs are classified correctly, final loss satisfies the committed threshold, and outputs agree within declared tolerances
- **AND** fixtures fix those choices and thresholds before the port's training outputs are accepted
