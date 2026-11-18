# Spec Delta

## MODIFIED Requirements

### Requirement: The learner facade is an ordinary explicit library

Emit SHALL provide `(malt learner)` with the public surface below and the learner backend semantics from Malt revision `92a3e63`, subject to the documented adaptations in this spec. It SHALL resolve and compile through ordinary library artifacts and SHALL NOT be baked into the compiler or added to implicit imports.

#### Scenario: Public exports are enumerated

- **WHEN** a program imports the learner facade
- **THEN** the supported export inventory and naming adaptations are the following

The facade's supported exports are listed below. Names use ASCII: `primal` corresponds to upstream's Greek rho, `backprop` to kappa, `gradient` to nabla, and `gradient1` to superscript-one nabla. The ASCII suffix `-primal` replaces upstream's hyphen-rho suffix. These are spelling adaptations, not different tensor algorithms.

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

## ADDED Requirements

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
