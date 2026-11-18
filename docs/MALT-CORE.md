# Malt tensor and differentiation core

`(malt learner)` is the public teaching facade. Its tensor representation and
reverse-mode algorithms are ported from the nested-vector `learner` backend of
Malt revision `92a3e63aebf8f0801cffdb6b8a44c199d7973148`, accompanying *The Little
Learner*. Other Malt tensor backends have different representations and are not
selected by this import. Copyright 2021 Anurag Mendhekar and Daniel P. Friedman;
see `lib/malt/LICENSE` for the retained MIT notice.

Use a prefix to keep ordinary Scheme arithmetic and differentiable arithmetic
visible together:

```scheme
(import (scheme base) (prefix (malt learner) ml:))

(ml:gradient (lambda (x) (ml:+ (ml:* x x) x)) 3.0)
;; 7.0

(ml:map* ml:primal (ml:+ 10 (ml:tensor 1 2 3)))
;; (tensor 11 12 13)
```

Run a source file containing this import through `emit run`, load it in
`emit repl`, or build it with `emit build`. The same ordinary library sources
supply all three commands. An unprefixed import requires explicit exclusions
for names also imported from Scheme, such as `+`, `-`, `*`, `/`, `abs`, `max`,
and `expt`. Do not import two different bindings under one name.

## Tensors and shape

A scalar is a number or a scalar differentiation node. Higher-rank tensors are
nonempty, rectangular objects with vector-backed axes. `tensor` constructs one axis and
checks all nested leaves and dimensions. `shape` returns a list of dimensions;
`rank` is its length. Scalars have shape `()` and rank zero.

```scheme
(ml:shape (ml:tensor (ml:tensor 1 2 3) (ml:tensor 4 5 6)))
;; (2 3)

(ml:reshape '(3 2) '#(#(1 2 3) #(4 5 6)))
;; (tensor (tensor 1 2) (tensor 3 4) (tensor 5 6))

(ml:build-tensor '(2 2)
  (lambda (indices) (+ (* 10 (car indices)) (car (cdr indices)))))
;; (tensor (tensor 0 1) (tensor 10 11))
```

`build-tensor` calls its builder with the complete index list. With shape `()`
it invokes the builder once with `()` and returns that scalar result. All
explicit dimensions must be positive exact integers. This deliberately defines
scalar construction and rejects empty-vector shapes instead of relying on
upstream's first-element indexing on those inputs.

`list->tensor` remains shallow: a list of ordinary lists becomes a tensor object
containing those same lists, without recursively converting them. `tensor?`
recognizes scalar values, tensor objects, and any ordinary vector; it is not a
shape validator. Shape-sensitive operations reject malformed or ragged tensors.
Raw nested vectors remain valid inputs to Malt operations, while nonscalar
numerical results are tensor objects.

Tensor objects and scalar duals are distinct records, so `vector?` returns `#f`
for them and `equal?` compares them by identity. Use `check-dual-equal?` for
numerical comparisons. `tensor->vector` returns a fresh shallow vector copy of
an axis, retaining child and dual identities without exposing mutable backing
storage. It also copies raw vector inputs; scalar inputs raise an error. Use
`tref`, `tlen`, and `tmap` instead of general vector accessors on tensors.

`tref` selects one axis, `trefs` gathers indices from a list (with repetition
and caller order preserved), and `tmap` maps over immediate axis members and returns a tensor object.
`reshape` preserves row-major leaf order and the identity of differentiation
nodes, and requires equal element counts.

## Extension and reduction

`ext1` extends a function from its specified base rank to larger tensors.
`ext2` takes a function and its two base ranks. It follows Malt's rank descent:
apply at both base ranks; otherwise descend the operand already needing descent,
pair equal leading lengths, or descend the higher-rank operand when lengths
differ. Incompatible equal-rank shapes raise a catchable error. Singleton axes
do not receive a separate broadcasting rule.

```scheme
(ml:map* ml:primal (ml:+ 10 '#(1 2 3)))
;; (tensor 11 12 13)

(ml:map* ml:primal (ml:sum '#(#(1 2) #(3 4))))
;; (tensor 3.0 7.0)

(ml:map* ml:primal (ml:sum-cols '#(#(1 2) #(3 4))))
;; (tensor 4.0 6.0)
```

`*-2-1` performs extended elementwise matrix/vector multiplication. Follow it
with `sum` for matrix/vector dot products. `correlate` uses Malt's centered,
zero-padded correlation for odd-width filter banks. `flatten` flattens rank-two
slices. `concat` concatenates rank-one slices; `(concat-n n)` returns a procedure
that concatenates at base rank `n`, preserving the smaller trailing dimensions.

The port preserves one distinction present in the pinned upstream backend:
`*-2-1-primal` uses the upstream primal extension composition, whose descent can
differ from differentiable `*-2-1`. For matrix `#(#(1 2) #(3 4))` and vector
`#(2 3)`, the primal variant returns `#(#(2 4) #(9 12))`, while the differentiable
variant's primal leaves are `#(#(2 6) #(6 12))`. Use the differentiable operation
followed by primal extraction when its descent is wanted. Acceptance retains
this upstream behavior explicitly.

## Reverse-mode gradients

`(gradient f theta)` differentiates a one-argument function over a scalar,
list, vector, tensor object, or nested combination of them and returns the same input
structure filled with gradients. `gradient-of` is an alias. `(gradient1 f)`
returns a variadic procedure whose result is the list of argument gradients.
These ASCII names replace upstream's Greek nabla and superscript-one spelling.

Every scalar output contributes a seed of `1.0`; a structured output therefore
differentiates the sum of its leaves. Each calculation owns a fresh identity
hash table. Shared nodes accumulate contributions, and distinct nodes with
equal primal numbers remain distinct. Unused input leaves receive `0.0`.

```scheme
((ml:gradient1 (lambda (x y) (ml:+ x (ml:* 2 y)))) 3.0 3.0)
;; (1.0 2.0)

(ml:gradient (lambda (x) (list (ml:* x x) (ml:* x x))) 3.0)
;; 12.0
```

`dual` takes a primal scalar and a backward callback. `primal` extracts the
number (or returns a nondual argument unchanged); `backprop` extracts the
callback. These replace upstream's Greek rho and kappa. `prim1` takes a primal
function and derivative function `(lambda (a upstream-gradient) ...)`. `prim2`
takes a primal function and derivative function
`(lambda (a b upstream-gradient) (values gradient-a gradient-b))`.

The `-primal` suffix replaces upstream's hyphen-rho suffix. Base-rank names such
as `+-0-0`, `sum-1`, and `flatten-2` remain available for the book's construction
of extended operations. Boolean scalar comparators have names such as
`=-0-0`; tensorized comparators such as `=-1` return `1.0`/`0.0` leaves.

At nonsmooth points the upstream conventions are retained: `rectify` passes its
input through at zero, so its derivative there is `1.0`; `abs` likewise chooses
`1.0` at zero. `max`/`argmax` choose the last tied index; `max` sends its gradient
to that selected node, and `argmax` has zero input gradients. General higher-order
AD is not a new compatibility promise.

Emit has bounded exact integers and IEEE double flonums. Nonintegral division
produces flonums, exact overflow retains its existing diagnostic, and invalid
real domains follow Emit's NaN/infinity behavior. This port does not add
Racket's rational or complex numbers.

## Automatic printing and explicit diagnostics

Malt registers writers on its own tensor and dual record types through
`(emit write)`. Arithmetic prints the primal number directly; tensor axes print
as `(tensor ...)`, including when nested inside ordinary lists or vectors:

```scheme
(ml:* 2 3)
;; 6
(ml:* (ml:tensor 1 2 3) 3)
;; (tensor 3 6 9)
```

This presentation applies to REPL results, program final results, `write`, and
`display`. The values retain their dual bookkeeping and remain differentiable.
Ordinary vectors keep their `#(...)` output, including when they contain Malt
objects. `max-tensor-print-length` controls automatic and explicit tensor
formatting together: initially five elements per axis, with zero unlimited.

`make-printable` strips duals and returns ordinary lists headed by the symbol
`tensor` for tensor objects or raw tensor vectors. An optional nonnegative maximum length truncates
each vector with the symbol `...`; zero means unlimited, and omission reads the
`max-tensor-print-length` parameter (initially five). `trace-print` accepts a
value and output port and writes that explicit representation plus a newline.
The automatic writers are attached only to Malt record types; no global predicate hook changes ordinary values.

`check-dual-equal?` compares numeric leaves using the `tolerance` parameter
(initially `0.0001`) and raises a catchable error on mismatch. Its recursive
comparison also handles lists, vectors, and tensor objects. The syntax
`(check-primal-gradient (function argument ...) expected-value gradients)`
checks both primal output and the argument-gradient list. Checks succeed with
`#t`; they do not depend on RackUnit.

## Verification

`bash test/malt-core-tests.sh` checks native run, standalone build, persistent
REPL, and explicit whole-library artifacts. It requires the native build tools
and no Chez or Racket. `bash test/malt-core-tests.sh --reference` instead invokes
the source-driven Chez compiler and requires Chez. Each path must finish all
120 checks and print `(malt-core-complete 120)`; process success alone is
insufficient. `test/malt-core-exports.py` independently checks the four internal
library interfaces used by the facade (112 bindings, counting re-exports).

Fixtures cover tensor validation, shallow conversion, scalar shapes, reshape
identity, Malt extension, shared and distinct nodes, structured outputs,
repeated/nested accumulation, all scalar/reduction/correlation/comparison
families, primal variants, tie conventions, and diagnostic macros/rendering.
Analytic answers use absolute tolerance `1e-9`; central finite differences use
step `1e-5` and tolerance `1e-6`. Upstream operation expectations come from the
adjacent learner tests at the pinned revision; finite-difference answers are
computed independently from forward values.
