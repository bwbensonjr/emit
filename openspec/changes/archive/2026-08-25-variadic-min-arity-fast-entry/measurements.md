## Environment

- Date: 2026-08-24
- Machine: Apple arm64, macOS 26.5.2
- Toolchain: Apple clang 21.0.0 (`clang-2100.1.1.101`)
- Baseline compiler SHA-256: `743873d623efa3748ed7edd66d8617301c435da180e3ee9941229413e3eecb8f`
- Preserved artifacts: `/private/tmp/emit-p9-min-entry.2cJWnq`

## Baseline

Built from the archived P9 manifest before compiler-source edits:

```sh
build/emit build p9-number-to-string \
  --manifest openspec/changes/archive/2026-08-24-cross-unit-variadic-direct-calls/benchmark-manifest.scm \
  -o /private/tmp/emit-p9-min-entry.2cJWnq/p9-before
```

The executable prints `19888890`. Its SHA-256 is
`bd67c373f2e1b89a6a949cee37c6a9bbb01236ce943d3014de7338bf20b7ed5b`.
After one discarded warm-up, ten `/usr/bin/time -p` elapsed samples were:

`0.37, 0.37, 0.40, 0.37, 0.38, 0.38, 0.38, 0.40, 0.38, 0.38 s`

- Best: **0.37 s**
- Median: **0.38 s**

Baseline artifact sizes:

| artifact | bytes |
|---|---:|
| executable | 70,600 |
| program IR | 15,637 |
| pruned `(emit internal)` IR | 5,965 |
| pruned `(scheme base)` IR | 26,746 |
| 80-demo scaffold, aggregate IR | 82,577,977 |

The 80-demo capture and its per-file SHA-256 manifest are preserved as `demo-before/` and
`demo-before.sha256` in the artifact directory.

## Prototype gate

The source-driver prototype emits `scheme.base:code:number->string.min` with the same uniform ABI,
binds its rest parameter directly to `2` (`()`), and contains no arity check, positional spill, or
`rt_build_rest` call. The program loads the ordinary `number->string` closure as `self` and directly
calls that label with `argc = 1`. Both executables print `19888890`.

After one discarded warm-up per executable, ten pairs were run with order reversed on every other
pair:

| pair | first | second |
|---:|---|---|
| 1 | before 0.39 s | prototype 0.36 s |
| 2 | prototype 0.36 s | before 0.38 s |
| 3 | before 0.38 s | prototype 0.36 s |
| 4 | prototype 0.36 s | before 0.39 s |
| 5 | before 0.39 s | prototype 0.36 s |
| 6 | prototype 0.36 s | before 0.39 s |
| 7 | before 0.38 s | prototype 0.36 s |
| 8 | prototype 0.36 s | before 0.39 s |
| 9 | before 0.39 s | prototype 0.36 s |
| 10 | prototype 0.36 s | before 0.39 s |

| executable | best | median |
|---|---:|---:|
| preserved before | 0.38 s | 0.39 s |
| prototype after | 0.36 s | 0.36 s |

Median improvement: **7.69%**, clearing the required 5% gate. Decision: **PASS**; continue to the
production call-interface and compatibility work.

Prototype artifact sizes:

| artifact | before | prototype | delta |
|---|---:|---:|---:|
| executable | 70,600 B | 70,656 B | +56 B |
| program IR | 15,637 B | 15,622 B | -15 B |
| pruned `(scheme base)` IR | 26,746 B | 32,451 B | +5,705 B |

## Suffix-based production candidate (superseded)

The production form replaces blind imported-label derivation with the optional fifth call-row field
and retains the same generated entries. After one discarded warm-up per executable, ten alternating
pairs against the original preserved baseline were:

| pair | first | second |
|---:|---|---|
| 1 | before 0.38 s | final 0.35 s |
| 2 | final 0.37 s | before 0.38 s |
| 3 | before 0.38 s | final 0.35 s |
| 4 | final 0.35 s | before 0.40 s |
| 5 | before 0.38 s | final 0.35 s |
| 6 | final 0.36 s | before 0.37 s |
| 7 | before 0.40 s | final 0.37 s |
| 8 | final 0.35 s | before 0.37 s |
| 9 | before 0.38 s | final 0.35 s |
| 10 | final 0.35 s | before 0.37 s |

| executable | best | median |
|---|---:|---:|
| preserved before | 0.37 s | 0.38 s |
| final source-driver build | 0.35 s | 0.35 s |

Median improvement: **7.89%**, again clearing the 5% gate. Both print `19888890`.

The final benchmark artifact sizes are the same as the prototype: executable 70,656 B (+56 B,
+0.079%), program IR 15,622 B (-15 B), and pruned `(scheme base)` IR 32,451 B (+5,705 B).

### 80-demo IR capture

Each demo was compiled by the Chez source driver. For an exact comparison with
`module-scaffold-baseline.sh capture`, the two source-driver target-header lines were removed from
each full unit and program module, the full units were ordered as in the preserved capture, and the
same boundary marker was inserted. Every reconstructed file was compared directly with its
preserved counterpart.

- 80 changed, 0 byte-identical.
- Aggregate: 82,577,977 B -> 89,288,373 B, **+6,710,396 B (+8.13%)**.
- The common delta is +83,844 B per demo; small deviations come from changed program call labels,
  with `ports.ll` also carrying its additional `(scheme file)` unit.
- Across the reconstructed capture, 13 direct call sites use `.min` and 85 calls to procedures that
  have a minimum entry continue to use the ordinary variadic label.

The raw-IR increase is accepted because it is confined to compiler/module artifacts that are cached,
while closed-world tree shaking and LTO reduce the measured standalone cost to 56 bytes and the hot
benchmark improves by 7.89%. The regenerated compiler binary size is recorded below.

## Collision-safe final representation

Final diff review found that suffix derivation made the candidate label
`scheme.base:code:foo.min` ambiguous with the ordinary label of a legal Scheme procedure named
`foo.min`. A source-driver fixture defining variadic `foo` beside fixed `foo.min` reproduced two
LLVM definitions under one label and clang rejected the unit. The retained representation instead
encodes the complete ordinary label under `min-entry:$...`, escaping `$` as `$d` and `:` as `$c`.
The same fixture then compiled and linked, printed `((7) 8)`, and contained exactly one definition
each for the two ordinary entries and the generated minimum entry.

The benchmark was rebuilt as
`/private/tmp/emit-p9-min-entry.2cJWnq/p9-collision-safe-source`; it and the preserved baseline both
print `19888890`. After one discarded warm-up per executable, ten alternating pairs were:

| pair | first | second |
|---:|---|---|
| 1 | before 0.40 s | collision-safe 0.35 s |
| 2 | collision-safe 0.35 s | before 0.38 s |
| 3 | before 0.40 s | collision-safe 0.35 s |
| 4 | collision-safe 0.36 s | before 0.37 s |
| 5 | before 0.38 s | collision-safe 0.35 s |
| 6 | collision-safe 0.36 s | before 0.42 s |
| 7 | before 0.38 s | collision-safe 0.41 s |
| 8 | collision-safe 0.35 s | before 0.39 s |
| 9 | before 0.37 s | collision-safe 0.35 s |
| 10 | collision-safe 0.35 s | before 0.37 s |

| executable | best | median |
|---|---:|---:|
| preserved before | 0.37 s | 0.38 s |
| collision-safe source build | 0.35 s | 0.35 s |

Median improvement: **7.89%**, still above the 5% gate. Final source-driver artifact sizes are:

| artifact | before | collision-safe | delta |
|---|---:|---:|---:|
| executable | 70,600 B | 70,680 B | +80 B (+0.113%) |
| program IR | 15,637 B | 15,640 B | +3 B |
| pruned `(scheme base)` IR | 26,746 B | 32,469 B | +5,723 B |

The collision-safe 80-demo source capture has 80 changed and 0 byte-identical files. Reconstructing
the shipped full-unit shape from the source driver's captured program modules and full unit
artifacts gives 82,577,977 B before and 89,326,012 B after: **+6,748,035 B (+8.17%)**. The common
delta is +84,585 B per demo; deviations remain confined to program call labels and the additional
units used by a few demos. The code-shape classification remains 13 direct minimum-entry call sites
and 85 ordinary calls to procedures that also have a minimum entry.

Decision: **PASS and retain**. Collision safety adds 24 delivered bytes and 0.04 percentage points
of raw-IR growth over the suffix candidate without changing the measured 7.89% speedup.

## Initial verification (superseded by final-review fix)

- `make regen`: **1,109 s**, fixed point at iteration 2. Regenerated sizes:
  `bootstrap/emit.internal.ll` 415,328 B, `bootstrap/scheme.base.ll` 682,926 B,
  `bootstrap/schemec.ll` 3,303,160 B, `bootstrap/embed.ll` 3,624,103 B, and
  `bootstrap/embed-repl.ll` 3,940,038 B. Linked `build/emit` is 2,221,336 B and
  `build/schemec` is 817,608 B.
- Focused regenerated suites: direct calls 38/38, assigned library 20/20, AOT tree
  shaking 19/19, backend equivalence 55/55, self-emission 15/15, dump parity 9/9,
  and dump stages 12/12. The intended 80-demo scaffold drift was recorded in the
  checked-in hash reference and its repeat check passed.
- `./run-all-tests.sh`: **35 suites, 0 failed, 1,626 s** (`real 1626.26`).
- `./run-dev-tests.sh`: **22 suites, 0 failed, 997 s** (`real 997.63`). The final
  trust check reported the expected skip because regenerated `bootstrap/` changes are
  uncommitted; the preceding independent-host fixed-point suite re-derived all three
  committed bootstrap modules byte-for-byte.

## Initial regenerated-compiler confirmation (superseded by final-review fix)

`build/emit build` rebuilt the benchmark as
`/private/tmp/emit-p9-min-entry.2cJWnq/p9-regenerated`. It is **70,656 B**, the same
size as the final source-driver build and **+56 B (+0.079%)** over the preserved
70,600 B baseline. Both executables print `19888890`.

After one discarded warm-up per executable, ten pairs were run with order reversed on
every other pair:

| pair | first | second |
|---:|---|---|
| 1 | before 0.38 s | regenerated 0.36 s |
| 2 | regenerated 0.35 s | before 0.38 s |
| 3 | before 0.38 s | regenerated 0.37 s |
| 4 | regenerated 0.38 s | before 0.38 s |
| 5 | before 0.39 s | regenerated 0.35 s |
| 6 | regenerated 0.36 s | before 0.40 s |
| 7 | before 0.38 s | regenerated 0.36 s |
| 8 | regenerated 0.36 s | before 0.40 s |
| 9 | before 0.39 s | regenerated 0.36 s |
| 10 | regenerated 0.38 s | before 0.39 s |

| executable | best | median |
|---|---:|---:|
| preserved before | 0.38 s | 0.385 s |
| regenerated final | 0.35 s | 0.360 s |

The median improvement is **6.49%**, so the regenerated production compiler retains
the change above the required 5% gate.

## Collision-safe regenerated verification

- `make regen`: **1,100 s**, fixed point at iteration 2. Regenerated sizes:
  `bootstrap/emit.internal.ll` 415,337 B, `bootstrap/scheme.base.ll` 683,384 B,
  `bootstrap/schemec.ll` 3,310,123 B, `bootstrap/embed.ll` 3,631,317 B, and
  `bootstrap/embed-repl.ll` 3,947,509 B. Linked `build/emit` is 2,222,328 B and
  `build/schemec` is 818,552 B.
- Focused regenerated suites: direct calls 42/42, assigned library 20/20, AOT tree
  shaking 19/19, backend equivalence 55/55, modules 39/39, self-emission 15/15,
  dump parity 9/9, dump stages 12/12, and artifact metadata 31/31. The refreshed
  80-demo scaffold manifest passed its repeat check.
- `./run-all-tests.sh`: **35 suites, 0 failed, 1,712 s**.
- `./run-dev-tests.sh`: **22 suites, 0 failed, 1,045 s**. The final trust check
  reported the expected skip because regenerated `bootstrap/` changes are uncommitted;
  the preceding independent-host fixed-point suite re-derived `bootstrap/embed.ll`,
  `bootstrap/emit.internal.ll`, and `bootstrap/scheme.base.ll` byte-for-byte.

### Collision-safe regenerated-compiler confirmation

The converged `build/emit` rebuilt the benchmark as
`/private/tmp/emit-p9-min-entry.2cJWnq/p9-collision-safe-regenerated`. It is
**70,688 B**, or **+88 B (+0.125%)** over the preserved 70,600 B baseline and 8 B
over the collision-safe source-driver executable. Its SHA-256 is
`6aa1dc6b221631e6b545d0e3c3b0ded0870614c83bd98f88bd727383b82948da`.
Both executables print `19888890`.

After one discarded warm-up per executable, ten pairs were run with order reversed on
every other pair:

| pair | first | second |
|---:|---|---|
| 1 | before 0.40 s | regenerated 0.37 s |
| 2 | regenerated 0.38 s | before 0.41 s |
| 3 | before 0.40 s | regenerated 0.37 s |
| 4 | regenerated 0.38 s | before 0.41 s |
| 5 | before 0.40 s | regenerated 0.38 s |
| 6 | regenerated 0.38 s | before 0.41 s |
| 7 | before 0.40 s | regenerated 0.38 s |
| 8 | regenerated 0.38 s | before 0.40 s |
| 9 | before 0.40 s | regenerated 0.39 s |
| 10 | regenerated 0.37 s | before 0.40 s |

| executable | best | median |
|---|---:|---:|
| preserved before | 0.40 s | 0.40 s |
| collision-safe regenerated | 0.37 s | 0.38 s |

The median improvement is **5.00%**, meeting the required at-least-5% gate at the
timer's 0.01-second resolution. The regenerated production result therefore retains
the collision-safe minimum entry.
