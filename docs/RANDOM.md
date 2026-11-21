# Random sources

Import `(srfi 27)` for reusable pseudorandom numbers. Nothing is implicitly
imported, and loading the library never obtains entropy or advances a stream.
The generator is MRG32k3a, adapted from the pinned SRFI reference; its provenance
and permission notice ship beside `lib/srfi/27.sld`.

```scheme
(import (srfi 27))
(define source (make-random-source))
(random-source-pseudo-randomize! source 17 3)
(define integers (random-source-make-integers source))
(define reals (random-source-make-reals source))
(define saved (random-source-state-ref source))
(integers 10)                         ; 0
(reals)                               ; 0.36942812616487686
(random-source-state-set! source saved)
(integers 10)                         ; 0 again
```

Each source owns its state. All generators derived from that source advance
the same stream, even when integer and real calls are interleaved. Different
sources are independent mutable objects. Creating a source deterministically
starts the same initial stream; it is equivalent to stream pair `(0,0)`.

The complete API is:

| Binding | Behavior |
|---|---|
| `make-random-source` | Construct a fresh source with deterministic initial state. |
| `random-source?` | Recognize sources, rejecting ordinary vectors/procedures. |
| `random-source-make-integers source` | Return a procedure accepting a positive exact bound `n`, yielding an exact integer in `[0,n)`. |
| `random-source-make-reals source [unit]` | Return a zero-argument procedure yielding a flonum strictly between zero and one. |
| `random-source-state-ref source` | Return an independent, readable state snapshot. |
| `random-source-state-set! source state` | Validate and copy a snapshot atomically. |
| `random-source-pseudo-randomize! source i j` | Select a deterministic stream/substream using nonnegative exact indices. |
| `random-source-randomize! source` | Obtain host entropy and atomically install fresh valid state, or raise a catchable error. |
| `default-random-source` | The initially constructed default source object. |
| `random-integer n` | Integer draw using the original default source. |
| `random-real` | Real draw using the original default source. |

Do not assign another object to `default-random-source`: the two default
procedures retain the original source. Use explicit source generators for
isolation, or a library parameter such as `current-random-source` in the
[emit-packages](https://github.com/bwbensonjr/emit-packages) `(malt learner)` package for scoped learning.

Bounds cover `1` through `1152921504606846975` (`2^60-1`), the positive exact
integer range of Emit. Inexact bounds, negative indices, invalid source objects,
malformed snapshots, and unsupported units raise catchable Scheme errors before
changing any source. The optional unit must be a finite flonum in
`[1.1102230246251565e-16,1)`; the generator always uses the finer `2^-53` grid.
There is no exact fractional output because Emit has no rational number type.

Snapshots have external representation
`(emit-srfi-27 mrg32k3a-v1 s0 s1 s2 s3 s4 s5)`. The first component's three words
are in `[0,4294967087)`, the second's in `[0,4294944443)`, and neither triple is
all zero. Snapshots contain no live mutable aliases to the source. Mutating a
snapshot after saving/restoring cannot alter a source. Save them with ordinary
`write` and restore with `read`; unsupported version tags are rejected.

Indexed streams use the SRFI reference mapping
`A^(16 + (i mod 2^28)*2^127 + (j mod 2^28)*2^76)` applied to the first column
of each component's transition matrix. Both indices accept Emit's full
nonnegative exact range; their periodic aliases match the reference. This is
not a claim that an Emit seed matches Racket or another Scheme's sequence.

For `mrg32k3a-v1`, integer/state sequences and uniform real bit patterns are
stable for a fixed call sequence across source compilation, run, REPL, and
standalone builds. A future incompatible sequence/state change must identify a
new algorithm/state version rather than silently accepting an old snapshot.

The precise consumption contract is:

- A raw core step returns `(x-y) mod 4294967087` and advances both recurrences.
- To obtain `k` bits, request chunks of at most 30 bits, high chunk first. For
  chunk width `w`, let `b=2^w`, `q=floor(4294967087/b)`, and `limit=q*b`.
  Reject raw values `x >= limit`; accept `floor(x/q)` as the uniform chunk.
- For bound `n>1`, draw `bit-length(n-1)` bits and reject candidates `>=n`.
  Bound one consumes exactly one raw core step and returns zero.
- A real draws 53 bits as 30 then 23, rejects a zero candidate, and scales by
  `2^-53`. Both endpoints are excluded, so `log` accepts every result.

All intermediate products fit Emit's exact range: core products are below
`2^53`; modular multiplication uses 16-bit limbs, keeping intermediates below
`2^50`; bit assembly never forms the unrepresentable exact value `2^60`.

Randomization calls the private `%random-entropy` operation for 24 bytes. Its
native contract accepts exact counts `1..256`, returns a fresh bytevector of the
complete requested length or `#f`. Its bounded binary read of `/dev/urandom`
uses operating-system entropy on supported macOS/Linux hosts; short, interrupted,
or failed reads are rejected atomically. The Scheme wrapper
maps a complete result to six valid words and only then replaces source state;
failure raises a catchable error and leaves the source unchanged. No clock or
fixed-seed fallback exists. The raw operation is not a public Scheme API.

This generator is for simulation, sampling, and learning, not cryptographic
secrets. Explicit randomization is nondeterministic; save the resulting state
when a run must be replayed.

Run `bash test/srfi-27-tests.sh` for native acceptance, or add `--source` for an
explicit Chez-driven check. The committed arbitrary-precision oracle and its
known-answer fixtures are under `test/random-sources/`.
