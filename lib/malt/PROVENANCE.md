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
Greek identifiers with ASCII names, immutable gradient tables with calculation-local
mutable identity tables, and hyperparameter value/setter macros with Scheme
parameters. Empty shapes represent scalars; public shape-sensitive operations
validate rectangular vectors and positive dimensions. Emit retains its bounded
integers and real double numeric tower.

Normal draws use uncached Box-Muller over `(srfi 27)`, rather than Malt's
Ziggurat tables or Racket's PRNG. `current-random-source` and
`current-record-handler` are Emit additions. `(record name value)` is synchronous;
`with-recording` installs a handler dynamically. Diagnostics render explicitly.
No Racket global printer or logging thread is ported. RMS retains upstream's
local epsilon `1e-7`; Adam and exported `epsilon` use `1e-8`. The upstream Adam
formula has no bias correction; this port preserves it.

`test/malt-reference/upstream.json` records hashes of relevant upstream files;
`export-map.json` maps every public export to its source group/adaptation.
Committed reference data can be consumed without Racket or this checkout.
The optional reference regeneration command is documented in `docs/MALT.md`.
