# Malt learner provenance

The Scheme port derives from `themetaschemer/malt` revision
`92a3e63aebf8f0801cffdb6b8a44c199d7973148` (MIT), copyright 2021
Anurag Mendhekar and Daniel P. Friedman. The complete notice is in `LICENSE`.
Upstream: <https://github.com/themetaschemer/malt>.

The learner tensor, extension, scalar dual, reverse-mode, and extended-operation
algorithms derive from `learner/tensors/`, `learner/autodiff/`, and
`learner/ext-ops/`. Training derives from `malted/A-core.rkt` through
`malted/O-init.rkt`; hyperparameters derive from `tools/A-hypers.rkt`.

Adaptations replace Racket modules/iteration with R7RS libraries/recursion,
and expose the original Greek identifiers alongside the retained ASCII
spellings. Thus `ρ`, `κ`, `∇`, `∇¹`, and `check-ρ-∇` alias `primal`,
`backprop`, `gradient`, `gradient1`, and `check-primal-gradient`. The primal
operation names retain their `-primal` forms and also expose upstream's `-ρ`
suffix; `ext1-ρ` and `ext2-ρ` alias the existing primal extension procedures,
and `zeroes-ρ` aliases `zeroes-primal`. `λ` re-exports Scheme `lambda`
syntax from `(scheme base)`, matching the spelling supplied by Racket's base
language. These are aliases, preserving binding identity.
Other adaptations include immutable gradient tables replaced with
calculation-local mutable identity tables, and hyperparameter value/setter
macros replaced with Scheme parameters. Empty shapes represent scalars; public shape-sensitive operations
validate rectangular vectors and positive dimensions. Emit retains its bounded
integers and real double numeric tower.

Normal draws use uncached Box-Muller over `(srfi 27)`, rather than Malt's
Ziggurat tables or Racket's PRNG. `current-random-source` and
`current-record-handler` are Emit additions. `(record name value)` is synchronous;
`with-recording` installs a handler dynamically. Vector-backed tensor axes and scalar duals are distinct record objects. Their
custom writers print tensor syntax and primal numbers automatically through
Emit's general `(emit write)` facility. Explicit diagnostics remain available;
`tensor->vector` is an Emit shallow-copy conversion. Ordinary raw vector inputs
remain supported. No Racket global printer or logging thread is ported. RMS retains upstream's
local epsilon `1e-7`; Adam and exported `epsilon` use `1e-8`. The upstream Adam
formula has no bias correction; this port preserves it.

`test/malt-reference/upstream.json` records hashes of relevant upstream files;
`export-map.json` maps every public export to its source group/adaptation.
Committed reference data can be consumed without Racket or this checkout.
The optional reference regeneration command is documented in `docs/MALT.md`.
