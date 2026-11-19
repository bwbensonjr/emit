# malt-learner Specification

## Purpose

Make Malt's nested-vector learner backend and its associated training utilities available as ordinary Scheme libraries with consistent interactive and standalone behavior.

## Requirements

### Requirement: The learner facade is an ordinary explicit library

Emit SHALL provide `(malt learner)` with the public surface below and the learner backend semantics from Malt revision `92a3e63`, subject to the documented adaptations in this spec. It SHALL resolve and compile through ordinary library artifacts and SHALL NOT be baked into the compiler or added to implicit imports.

#### Scenario: Public exports are enumerated

- **WHEN** a program imports the learner facade
- **THEN** the supported export inventory and naming adaptations are the following

The facade's supported ASCII exports are listed below. They remain available alongside the Unicode aliases specified by the mathematical-notation requirements. `primal` corresponds to upstream's Greek rho, `backprop` to kappa, `gradient` to nabla, and `gradient1` to superscript-one nabla. The ASCII suffix `-primal` corresponds to upstream's hyphen-rho suffix. These are spelling alternatives, not different tensor algorithms.

| Group | Exports |
|---|---|
| Tensors and lists | `len ref refr tref tlen tmap list->tensor tensor->vector tensor build-tensor scalar? tensor? rank shape reshape trefs map*` |
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

Upstream's unimplemented extension-gradient stubs, generated setters, provide transformer, threaded logging procedures, and upstream-specific automatic printing controls are excluded; Emit automatically prints Malt objects using the general custom-writer facility. Ordinary Scheme comparisons are retained; the facade does not replace `= < > <= >=`.

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

Scalars SHALL be numbers or distinct scalar-dual objects. Constructed nonscalar tensors SHALL be distinct objects backed by nested vector storage; scalar duals and constructed tensors SHALL NOT satisfy `vector?`. Malt operations SHALL continue to accept raw nested vectors as tensor inputs. `tensor` SHALL reject empty input, nonnumeric leaves, and inconsistent shapes with catchable errors. `list->tensor` SHALL remain shallow and return a tensor object. `tensor->vector` SHALL return a fresh shallow vector of a tensor's children, preserving child and dual identities; raw vector input SHALL also yield a shallow copy, and scalar input SHALL raise a catchable error. Shape-driven constructors SHALL reject nonpositive dimensions; an empty shape SHALL represent a scalar. `tensor?` SHALL accept scalars, tensor objects, and raw vectors, retaining permissiveness for raw vectors. Shape-sensitive operations SHALL validate object-backed and raw inputs identically. Nonscalar tensor-producing numerical operations SHALL return tensor objects, except that gradients preserve input container kinds; `map*` and recording SHALL also preserve container kinds; tensor objects SHALL have record identity equality.

#### Scenario: Construction and shallow conversion

- **WHEN** `tensor` constructs two rows of three scalars
- **THEN** its shape is `(2 3)` and rank is `2`
- **AND** `list->tensor` on a list of ordinary lists yields a tensor object containing those same lists, without recursively converting them

#### Scenario: Invalid and scalar shapes

- **WHEN** construction receives mismatched rows or a shape containing zero or a negative dimension
- **THEN** it raises a catchable error
- **AND** `build-tensor` with shape `()` invokes its builder once with the empty index list and returns the scalar result

#### Scenario: Tensor storage does not change ordinary vectors

- **WHEN** a tensor is constructed alongside an ordinary vector with the same elements
- **THEN** only the ordinary vector satisfies `vector?` and it still prints using `#(...)`
- **AND** `tensor->vector` returns a shallow copy without exposing mutable backing storage
- **AND** two separately constructed tensors remain distinct under `eqv?` and `equal?`

#### Scenario: Mixed tensor inputs preserve numerical behavior

- **WHEN** extension, reshape, reduction, correlation, differentiation, or training receives tensor objects mixed with valid raw vector inputs
- **THEN** values, ranks, leaf order, and gradients retain the learner contracts
- **AND** nonscalar numerical tensor results are tensor objects; gradients, `map*`, and recording preserve input container kinds, including gradients corresponding to tensor-object inputs

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

`make-printable` and `trace-print` SHALL remain available as explicit diagnostics. Tensor and dual objects SHALL also install per-type custom writers without replacing global printing behavior. `(record name value)` SHALL return `value` while synchronously passing its name and primal value to `current-record-handler`; its default handler SHALL do nothing. `with-recording` SHALL install a caller-supplied handler dynamically and restore it on exit. No background logging thread SHALL be required.

#### Scenario: Recording observes values without changing training

- **WHEN** `(with-recording handler body ...)` runs a computation containing `record`
- **THEN** the handler receives names and primal values in call order, body results are preserved, and the previous handler is restored after normal or exceptional exit

#### Scenario: Plain arithmetic prints useful values automatically

- **WHEN** `(import (malt learner))` is followed by `(* 2 3)` and `(* (tensor 1 2 3) 3)`
- **THEN** automatic result printing produces `6` and `(tensor 3 6 9)` respectively
- **AND** no procedure, record wrapper, or explicit `make-printable` call appears in the output
- **AND** the scalar result remains a dual and `((gradient1 *) 2 3)` still yields `(3.0 2.0)`

#### Scenario: Nested objects use the same presentation

- **WHEN** lists or ordinary vectors contain Malt duals and tensors and are written or displayed
- **THEN** duals render their primal numbers and tensors render recursively as `(tensor ...)`
- **AND** enclosing ordinary vectors keep their `#(...)` delimiters

#### Scenario: Tensor print limits are shared with explicit diagnostics

- **WHEN** `max-tensor-print-length` is set to a positive bound or zero
- **THEN** automatic tensor printing and `make-printable` truncate each tensor axis with `...` at that bound or print all elements for zero
- **AND** the initial bound is five and printing does not alter stored elements or gradients

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

### Requirement: Structured utilities preserve tensor abstraction

`map*`, gradient accumulation, diagnostics, and recording SHALL traverse tensor objects alongside scalars, lists, and raw vectors. `map*` SHALL preserve list, raw-vector, and tensor-object container kinds. Gradient results SHALL preserve the container kinds of their differentiation inputs. Recording SHALL deliver primal copies without exposing dual callbacks or mutable tensor backing storage.

#### Scenario: Mapping and recording retain useful structure

- **WHEN** `map* primal` or a recording callback observes a structure containing both a raw vector and a tensor object
- **THEN** both structures are traversed and keep their respective container kinds
- **AND** recording observes primal leaves without changing the recorded computation's dual identities

#### Scenario: Gradient results preserve mixed input containers

- **WHEN** differentiation inputs contain a list holding both a raw vector and a tensor object
- **THEN** the corresponding gradient result is a list holding a raw vector and a tensor object respectively
- **AND** derivative leaves agree with the same calculation on equivalent numeric inputs

### Requirement: Mathematical procedure spellings alias existing exports

`(malt learner)` SHALL export the Unicode aliases below as the same bindings as their ASCII counterparts. Existing ASCII names and numerical contracts SHALL remain supported. Unicode names SHALL support ordinary import selection, renaming, prefixing, and re-export.

#### Scenario: Accessors and gradient procedures have book spellings

- **WHEN** a caller imports `(malt learner)`
- **THEN** `ρ`, `κ`, `∇`, `∇¹`, and `check-ρ-∇` denote `primal`, `backprop`, `gradient`, `gradient1`, and `check-primal-gradient` respectively
- **AND** `ext1-ρ` and `ext2-ρ` denote `ext1-primal` and `ext2-primal`
- **AND** `gradient-of` remains supported

#### Scenario: Primal operations have equivalent spellings

- **WHEN** a caller imports any Unicode name in this table
- **THEN** it denotes the same binding as the corresponding ASCII name

| Unicode | ASCII |
|---|---|
| `+-ρ` | `+-primal` |
| `--ρ` | `--primal` |
| `*-ρ` | `*-primal` |
| `/-ρ` | `/-primal` |
| `exp-ρ` | `exp-primal` |
| `log-ρ` | `log-primal` |
| `expt-ρ` | `expt-primal` |
| `sqrt-ρ` | `sqrt-primal` |
| `sqr-ρ` | `sqr-primal` |
| `zeroes-ρ` | `zeroes-primal` |
| `sum-ρ` | `sum-primal` |
| `abs-ρ` | `abs-primal` |
| `*-2-1-ρ` | `*-2-1-primal` |
| `argmax-ρ` | `argmax-primal` |
| `max-ρ` | `max-primal` |
| `sum-cols-ρ` | `sum-cols-primal` |
| `correlate-ρ` | `correlate-primal` |
| `rectify-ρ` | `rectify-primal` |
| `flatten-ρ` | `flatten-primal` |
| `concat-ρ` | `concat-primal` |

#### Scenario: Unsupported upstream placeholders stay excluded

- **WHEN** a caller requests `ext1-∇` or `ext2-∇` from `(malt learner)`
- **THEN** the import reports an unavailable export rather than advertising an unimplemented procedure

### Requirement: Learner exports lambda syntax under its book spelling

`(malt learner)` SHALL export `λ` as an alias of Scheme `lambda` syntax. It SHALL preserve lambda's binding identity, lexical scope, supported formal-argument forms, and behavior through prefixed and renamed imports.

#### Scenario: Lambda syntax accepts ordinary and rest arguments

- **WHEN** a caller evaluates `((λ (x) x) 7)`, `((λ args args) 1 2)`, and `((λ (x . xs) xs) 1 2 3)`
- **THEN** the results are `7`, `(1 2)`, and `(2 3)` respectively

#### Scenario: Prefixed syntax preserves lexical scope

- **WHEN** a caller imports `(prefix (malt learner) m:)` alongside `(scheme base)` and evaluates `((m:λ (x) (let ((y x)) y)) 7)`
- **THEN** the result is `7`
- **AND** renaming or re-exporting the syntax preserves its binding identity

### Requirement: Mathematical notation preserves execution fidelity

Programs using the Unicode aliases SHALL produce equivalent results under source-driven compilation, `emit run`, `emit repl`, and standalone execution. Installed libraries SHALL expose the same aliases without requiring the upstream checkout or Racket.

#### Scenario: Book-style differentiation works through every execution path

- **WHEN** `(import (malt learner))` is followed by `(∇ (λ (x) (* x x)) 3.0)`
- **THEN** each supported execution path produces `6.0`
- **AND** a standalone executable runs without library sources at runtime

#### Scenario: Notebook source reaches the same library

- **WHEN** little-learning submits UTF-8 source `(∇ (λ (x) (* x x)) 3.0)` through its Emit adapter with requirement `(malt learner)`
- **THEN** evaluation succeeds and returns `6.0` without source transliteration
