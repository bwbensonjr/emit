# SRFI 27 reference and acceptance

The pristine files in `upstream/` come from
<https://github.com/scheme-requests-for-implementation/srfi-27>, revision
`a547c5508d648c61e73bebed2bcd2283fba5abaa`, `reference/` directory.
Their permission notice is retained in `lib/srfi/27-LICENSE.txt`.
`upstream.sha256` guards the original bytes, including line endings.

The port preserves MRG32k3a's recurrence, initial state, and indexed stream
mapping. It changes the source representation to a private Scheme record,
uses copied versioned readable state, replaces large-integer generation with
bounded bit chunks, uses a 53-bit open real grid, and replaces clock-based
randomization with operating-system entropy. It is an adaptation, not a
byte-identical upstream package. No upstream confidence tests are removed or
modified; `conftest.scm` is retained as reference material, while Emit's tests
exercise the selected numeric contract and native command behavior.

`reference.py` independently implements the recurrence and full matrix powers
using Python arbitrary-precision integers, not the bounded 16-bit-limb Scheme
arithmetic. Its `RandomSource` class is also the oracle, vendored by the emit-packages collection, for Malt's seeded XOR
fixture. Run `python3 test/random-sources/reference.py` to regenerate JSON and
Scheme known answers; run it with `--check` to verify them. Fixtures cover the
initial state, independent stream/substream jumps, `(17,3)`, maximum Emit
indices, bounded integers, mixed real draws, and resulting full state.

The accepted stream selection is exactly the reference mapping: start at
`A^(16 + (i mod 2^28)*2^127 + (j mod 2^28)*2^76)` and take the first column of
each component matrix. Thus indices are periodic in each dimension, as in
the reference implementation. The large-index fixture verifies this rather
than silently narrowing accepted exact inputs.

`checks-prefix.scm`, generated `known-answers.scm`, and `checks-suffix.scm`
form the program consumed by `test/srfi-27-tests.sh`. The runner checks the
exact assertion count and completion marker on run, REPL, standalone, and
explicit artifact paths. `--source` explicitly requires Chez and verifies
source-driven compilation. Tests include forced range-reduction rejection
through known initial states, malformed state, copy isolation, source
validation, unsupported units, and entropy smoke checks. Runtime provider
failure/interruption tests live with the private entropy operation's C tests.
