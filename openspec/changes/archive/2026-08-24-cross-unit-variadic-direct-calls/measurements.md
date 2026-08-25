## P9 benchmark

Workload: `number-to-string-benchmark.scm`, an optimized AOT executable that performs 3,000,000
one-argument `number->string` calls. Timings are elapsed seconds from `/usr/bin/time -p`, with stdout
discarded. The preserved baseline executable and IR are `/private/tmp/p9-before` and
`/private/tmp/p9-before.ll` during implementation.

### Before

Result: `19888890`.

Program IR uses the indirect path: it loads `@"scheme.base:number->string"`, calls
`rt_check_callable`, masks and loads the closure's code pointer, then calls that pointer.

Samples: **0.81, 0.40, 0.38, 0.38, 0.38 s**. The first execution is a cold outlier; warm median and
best are both **0.38 s**.

### After

The regenerated `build/emit` built `/private/tmp/p9-after` through the checked-in
`benchmark-manifest.scm`. It also prints `19888890`.

The program IR now loads the `number->string` closure for `self` and directly calls
`@"scheme.base:code:number->string"` with `argc = 1`. It contains no callable check, closure mask,
or code-pointer load at that site.

Six before/after pairs were run in alternating order. Raw elapsed samples were:

| executable | samples | best | median |
|---|---|---:|---:|
| preserved before | 0.39, 0.39, 0.40, 0.40, 0.40, 0.42 s | 0.39 s | 0.40 s |
| regenerated after | 0.39, 0.39, 0.40, 0.39, 0.40, 0.40 s | 0.39 s | 0.40 s |

The observed median delta is **0%** at the timer's 0.01-second resolution. Restoring the direct
label call therefore does not recover the historical 0.32 -> 0.39 s regression. That regression
was correlated with the indirect IR but not caused materially by it: the remaining difference is
the variadic entry prologue, which spills the positional slots and calls `rt_build_rest` even when
the rest list is empty.

Across the 80-demo module-scaffold capture, 40 files are byte-identical and all 40 changed files
are smaller, by 7,772 bytes in aggregate. Exactly 97 program call sites lose the callable check
and closure mask/code-pointer load chain and gain direct code-label calls; 60 external label
declarations are added. `ports.ll` also changes its linked `(scheme file)` unit because that unit
calls variadic `(scheme base)` exports. No other linked library unit changes.

## Verification

- `make regen` converged at fixed-point iteration 2 in 1,152 seconds.
- Focused suites passed: direct calls 29/29, assigned library 20/20, AOT tree-shaking 19/19,
  module scaffold 80/80 hashes, numeric conformance 155/155, backend equivalence 55/55,
  self-emission 15/15, and dump parity 9/9.
- `./run-all-tests.sh`: 35 suites, 0 failed, 1,585 seconds.
- `./run-dev-tests.sh`: 22 suites, 0 failed, 985 seconds. Its anti-stale trust-check reported the
  expected skip because regenerated `bootstrap/` artifacts remain uncommitted; the preceding
  self-hosting suite independently re-derived those artifacts and reached a fixed point.
- `openspec validate cross-unit-variadic-direct-calls --strict` and `git diff --check` passed.
