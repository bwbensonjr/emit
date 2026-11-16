## MODIFIED Requirements

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
