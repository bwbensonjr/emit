# Malt learner

`(malt learner)` provides the nested-vector learner backend from *The Little
Learner* with layers, losses, optimizers, initialization, and minibatch sampling.
It ships as optional ordinary Scheme source: importing it compiles its library
closure, and a standalone executable needs no Malt, Racket, or Emit source files
at runtime. See [tensor and AD details](MALT-CORE.md), the
[public facade](../lib/malt/learner.sld), and
[source attribution and adaptations](../lib/malt/PROVENANCE.md).

[Standalone measurements](MALT-MEASUREMENTS.md) record binary size, CPU time,
and memory for the core, scalar training, and XOR workloads.

Use a prefix to keep ordinary arithmetic distinct from differentiable tensor
operations:

```scheme
(import (scheme base) (scheme write) (prefix (malt learner) m:))
(write (m:gradient (lambda (x) (m:+ (m:* x x) x)) 3.0))
(newline)
;; 7.0
```

The port uses ASCII names: `primal`, `backprop`, `gradient`, and `gradient1`
replace upstream's Greek rho, kappa, nabla, and superscript-one nabla.
`gradient-of` aliases `gradient`. The suffix `-primal` replaces upstream's
hyphen-rho suffix. All supported exports are enumerated by the facade; there are
no placeholder exports for upstream's unimplemented extension-gradient stubs.

For an unprefixed import, explicitly exclude overlaps from `(scheme base)`:

```scheme
(import (except (scheme base) + - * / abs max expt)
        (malt learner))
(gradient (lambda (x) (* x x)) 3.0)
```

If importing `(scheme inexact)` as well, prefix it or exclude its overlapping
math names. The facade leaves ordinary `= < > <= >=` unchanged; differentiable
base-rank and tensor comparator names remain explicit.

## Training

Models retain Malt's curried contracts. A target receives input and returns a
procedure accepting its parameter list. A loss receives a target, then inputs
and labels, then parameters. Parameters are lists of scalar or tensor values.

```scheme
(m:with-hypers ((m:alpha 0.01) (m:revs 500))
  (m:naked-gradient-descent
    (lambda (theta) (m:sqr (m:- 30 (car theta))))
    '(3.0)))
;; (29.998892352401082)
```

The layer surface includes `line`, `quad`, `linear`, `linear-1-1`, `plane`,
`softmax`, `relu`, `k-relu`, `corr`, `recu`, `k-recu`, and `signal-avg`.
`block`, `block-fn`, `block-ls`, and `stack-blocks` compose layer functions and
their parameter shapes. `model` fixes trained parameters; `accuracy` compares
argmax class predictions. Losses include `l2-loss`, `cross-entropy-loss`, and
`kl-loss`. Like upstream, reductions follow Malt tensor extension rules rather
than a separate general array-broadcasting system.

The four supplied optimizers are `naked-gradient-descent`,
`velocity-gradient-descent`, `rms-gradient-descent`, and
`adam-gradient-descent`. `gradient-descent` constructs custom stateful updates
from inflate, deflate, and update procedures. `revise` applies a revision a
nonnegative exact number of times. The upstream formulas are preserved:
velocity uses `mu`, RMS uses `beta` and local epsilon `1e-7`, and Adam uses
`mu`, `beta`, and exported `epsilon = 1e-8` without bias correction.
`smooth` performs decay-weighted averaging; `zeroes` builds matching zero values.

`samples` draws indices with replacement and retains Malt's reverse-draw output
order. `(sampling-obj expectant xs ys)` selects a fresh batch using `batch-size`
for each objective evaluation.

## Hyperparameters

`alpha`, `revs`, `batch-size`, `mu`, and `beta` are parameter objects shared by
the imported optimizers. Read `(m:alpha)` or assign `(m:alpha 0.01)`. Required
unset training parameters raise errors naming the missing setting.
`with-hypers` and the one-binding `with-hyper` preserve the book's binding-list
syntax and restore settings on normal return, exceptions, and supported escape
continuations. A caller's ordinary lexical binding of `alpha` cannot change an
imported optimizer's setting.

`declare-hyper` and `declare-hypers` create additional parameter objects using
`syntax-rules`. A declaring library exports them explicitly in its normal
`export` declaration. No `set-name!` identifiers or provide transformers are
generated. `grid-search` uses these objects, visits the Cartesian product with
the first setting changing slowest, and returns the first result accepted by its
predicate, or `#f`. Settings are restored between trials and after exit; there
is no implicit report printing or anaphoric `show-hypers` binding.

## Reproducible initialization

Randomness uses [SRFI 27](RANDOM.md). Select an independent source dynamically:

```scheme
(import (srfi 27))
(define source (make-random-source))
(random-source-pseudo-randomize! source 17 0)
(parameterize ((m:current-random-source source))
  (m:init-theta '((8 2) (8) (1 8) (1))))
```

`current-random-source` initially refers to SRFI 27's default source. Each
normal draw uses uncached Box-Muller with two uniform draws; snapshots therefore
replay normals, initialization, and sampling without hidden sampler state.
`random-normal` takes a mean and **standard deviation**. `random-tensor` takes
a mean, **variance**, and shape. Means must be finite; variance/standard
deviation must be finite and nonnegative. `zero-tensor` builds zero tensors;
`init-shape` initializes rank-one bias tensors to zero and rank-two/rank-three
weight tensors using the upstream fan-in variance. `init-theta` initializes
its shape list in order.

This is a different PRNG/normal transform from Racket Malt. The same numeric
seed does not select the same Racket sequence. The self-contained
[XOR example](../demos/malt-xor.scm) uses stream `(17, 0)`, a 2-to-8-to-1 ReLU
network, 4000 naked-gradient updates, `alpha = 0.01`, and batch size four.
Run it with `build/emit run demos/malt-xor.scm`, or build with
`build/emit build demos/malt-xor.scm -o /tmp/malt-xor` and run that executable.
It checks all predictions within `0.1` of the targets and total squared error
below `0.04`.

## Recording and diagnostics

`(record name value)` synchronously calls `current-record-handler` with `name`
and the primal value, then returns the original value, preserving gradients.
The default handler does nothing. Loss procedures emit named `loss` events.
Install a two-argument handler with `(with-recording handler body ...)`; nested
handlers restore correctly even when the body or handler raises. This replaces
Racket's logging thread and higher-order loss-wrapper `with-recording` contract.
Explicit `make-printable` and `trace-print` render values without changing a
global printer. `max-tensor-print-length` controls explicit rendering.

## Numerical behavior and validation

Emit has bounded exact integers and IEEE double flonums. Exact overflow retains
Emit's diagnostic behavior; nonintegral division produces an inexact value;
invalid real domains follow the existing NaN/infinity policy. Exact rational
and complex results are unavailable. Fixed finite reference values use
absolute tolerance `1e-9` plus relative tolerance `1e-10`; the scalar quadratic
has absolute tolerance `1e-9`. Integer sample indices, shapes, and random state
are compared exactly. XOR uses its explicit prediction/loss thresholds and
cross-path tolerance `1e-9`.

Run native checks with `bash test/malt-training-tests.sh` and
`bash test/malt-xor-tests.sh`. They assert exact completion counts and require
no Racket, Malt checkout, Chez, or network. Add `--source` for the explicitly
Chez-dependent source-driven checks. Reference data and their independent
generation are under `test/malt-reference/`; ordinary checks consume committed
fixtures. To verify/recompute them against the pinned upstream checkout:

```sh
python3 test/malt-reference/check.py --upstream /path/to/malt
```

This explicit check requires Racket and the exact pinned Malt revision. It
verifies upstream hashes, reruns both Racket adapters, and compares the committed
data. The independent Python scalar-gradient XOR oracle also checks the source
stream's initial tensors, all 4000 sample batches, and acceptance thresholds.
