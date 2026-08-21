# JIT development-profile measurements

## Environment and method

- Machine: arm64 macOS, repository working tree at the change baseline
- LLVM: 22.1.4 (`/opt/homebrew/Cellar/llvm/22.1.4/bin/llvm-config --version`)
- Cache: `EMIT_CACHE=/private/tmp/emit-jit-bench/cache`, explicitly warmed before samples
- Narration: `EMIT_VERBOSITY=quiet`
- Timer: `/usr/bin/time -p`; the baseline below is one characterization sample per workload.
  The final comparison uses interleaved repeated samples.
- Reader input: `chez --script tools/gen-reader-bench.ss
  /private/tmp/emit-jit-bench/reader-data.scm` (200,000 tokens, 1,939,560 bytes).
- Reader driver: `(length (read-all-from-string (read-string 3000000
  (current-input-port))))`.
- Call/arithmetic driver: the `demos/ackermann.scm` definition evaluated at `(ack 3 12)`.
- Allocation driver: `demos/char-intern.scm` (one million pairs, forcing GC).

The first attempted sample used the platform-default cache directory.  The workspace sandbox
cannot write there, so every invocation narrated `cache: no entry for baked set, compiling it` and
the numbers were cold (trivial 1.57 s, REPL 1.67 s, reader 5.47 s, Ackermann 4.22 s, allocation
1.62 s).  Those are discarded rather than mixed with the warm-cache comparison.

## Pre-change O0-equivalent baseline

The current host has no LLVM IR transform, so its ordinary invocation is the O0-equivalent.

| workload | command shape | result | real | user | sys | guest estimate |
|---|---|---:|---:|---:|---:|---:|
| trivial run | `emit run trivial.scm` | `1` | 0.34 s | 0.33 s | 0.01 s | floor |
| two-form REPL | `printf forms \| emit repl` | `42` | 0.46 s | 0.44 s | 0.01 s | n/a; +0.12 s over trivial |
| reader | `emit run reader.scm < reader-data.scm` | `25000` | 3.94 s | 3.92 s | 0.01 s | ~3.60 s |
| Ackermann | `emit run ack.scm` | `32765` | 2.99 s | 2.97 s | 0.01 s | ~2.65 s |
| allocation/GC | `emit run demos/char-intern.scm` | `1101111` | 0.38 s | 0.36 s | 0.01 s | ~0.04 s |

The guest estimates subtract the 0.34 s trivial floor.  They are useful for orientation only; the
post-change host timing counters separate compile/cache, transform, materialization, and guest
execution more directly.

## Post-change profile comparison

Three rounds were run in interleaved profile order (`O0`, `O1`, `O2`) for each workload.  The
tables report medians.  Host counters are milliseconds and split Scheme compile/cache work, LLVM
transform work, remaining ORC materialization, and guest execution.  External `real` is seconds.
The first O0 trivial sample was a cold cache entry for the newly linked host (1.80 s) and is
excluded; the warm samples were 0.35, 0.36, and 0.54 s, with the last showing external scheduling
delay not present in its 0.41 s of narrated work.

| workload/profile | compile | transform | materialize | execute | real samples | median real |
|---|---:|---:|---:|---:|---|---:|
| trivial O0 | 112.9 | 0.0 | 222.0 | 0.1 | 0.35, 0.36, 0.54 | 0.36 |
| trivial O1 | 111.4 | 56.7 | 230.6 | 0.1 | 0.45, 0.42, 0.42 | 0.42 |
| trivial O2 | 112.3 | 91.4 | 226.1 | 0.1 | 0.46, 0.45, 0.45 | 0.45 |
| reader O0 | 114.4 | 0.0 | 219.2 | 3645.2 | 3.99, 4.00, 4.01 | 4.00 |
| reader O1 | 113.2 | 55.4 | 225.7 | 3651.0 | 4.05, 4.07, 4.18 | 4.07 |
| reader O2 | 113.7 | 89.1 | 223.1 | 3634.8 | 4.08, 4.08, 4.36 | 4.08 |
| Ackermann O0 | 116.6 | 0.0 | 217.7 | 2849.4 | 3.01, 3.21, 3.28 | 3.21 |
| Ackermann O1 | 116.4 | 56.0 | 226.0 | 2509.1 | 2.93, 2.93, 3.09 | 2.93 |
| Ackermann O2 | 117.0 | 90.7 | 223.9 | 2538.2 | 2.96, 2.99, 3.12 | 2.99 |
| allocation O0 | 128.5 | 0.0 | 221.8 | 19.2 | 0.40, 0.39, 0.40 | 0.40 |
| allocation O1 | 128.0 | 57.3 | 233.4 | 21.2 | 0.47, 0.46, 0.50 | 0.47 |
| allocation O2 | 129.0 | 91.7 | 229.2 | 19.7 | 0.52, 0.50, 0.48 | 0.50 |

O1 improves the whole-program Ackermann guest by about 12% (2.85 s to 2.51 s) while adding a
median 57 ms transform.  It does not improve the reader or allocation guest, so their totals rise
by the transform cost.  O2 adds another ~35 ms without a representative execution win over O1.
This is sufficient for the low-latency O1 default—the fixed increase is about 60–70 ms and a
call-heavy whole program benefits—but it is a narrower result than P13 anticipated.

### Reader and P12/P13

The delivered AOT executable was rebuilt from the same `reader.scm` with the existing `-O2 -flto`
ship profile.  Its three real samples were 3.21, 2.93, and 2.92 s (median 2.93 s).  The JIT guest
medians are 3.645 s at O0, 3.651 s at O1, and 3.635 s at O2: O1 recovers **none** of P12/P13's
reader gap, and remains about 25% slower than the delivered executable before JIT startup is
counted.  The safe per-module standard pipeline cannot reproduce the cross-unit/closed-world work
performed by the AOT LTO link.  P12 therefore remains open, and P13 is only partially addressed by
the profile/control and same-module optimization added here.

### Multi-form interactive latency

For each profile, three sessions entered the Ackermann definition as the first form; another three
entered that definition plus five separate `(ack 3 10)` forms.  Medians:

| profile | first-form session | six-form session | marginal later form | aggregate transform | aggregate guest (five calls) |
|---|---:|---:|---:|---:|---:|
| O0 | 0.36 s | 1.37 s | 202 ms | 0 ms | 1011 ms |
| O1 | 0.43 s | 1.44 s | 202 ms | 63 ms | 978 ms |
| O2 | 0.47 s | 1.44 s | 194 ms | 100 ms | 963 ms |

O1 adds about 70 ms to the first optimized session and about 3% improves the five calls.  Because
each later form remains its own open-world module, the definition cannot be inlined into those
forms.  The marginal later-form latency is effectively unchanged; the fixed first-form cost is
small enough to retain O1, while O2's additional fixed cost is not justified as the default.

## Compiler-IR observation boundary

The committed pre-change host was rebuilt from `git archive HEAD` in an isolated temporary tree
against the same LLVM 22.1.4 installation.  For `demos/fact.scm`, all four combinations of
pre-change/post-change host and plain/`--dump` `emit run --emit` produced SHA-256
`2302f1bef660f9d85c3aaba56a6c602897e8039001a71fc9a5b2ff0e9502ad9c`.
`git diff -- bootstrap/` is empty.  The backend transform therefore does not cross either the
compiler-produced IR or bootstrap observation boundary.
