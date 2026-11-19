# Malt learner notation delta

## MODIFIED Requirements

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

## ADDED Requirements

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
