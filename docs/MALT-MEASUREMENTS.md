# Malt learner measurements

Measured 2026-11-15 on macOS arm64, Emit 0.7.0, LLVM 23.1.4, Apple clang
21.0.0, and Boehm GC 8.2.12. These are standalone executables built with the
default AOT profile (`-O2` and LTO), using shared libgc. Library sources and
Racket are unnecessary during execution.

| Workload | Input / work | Executable bytes | Wall seconds | CPU seconds | Peak resident bytes |
|---|---|---:|---:|---:|---:|
| Tensor and AD acceptance | 95 assertions, including correlation and finite differences | 210,136 | 0.302 | 0.005 | 3,063,808 |
| Scalar quadratic training | One scalar parameter, 500 naked gradient updates | 112,984 | 0.179 | 0.007 | 2,916,352 |
| Seeded XOR | Four two-element inputs, 2-to-8-to-1 ReLU network, 4,000 minibatch updates | 172,432 | 1.335 | 1.129 | 2,965,504 |

Each measurement is one process execution. CPU and peak resident memory come
from `os.wait4` for that child; wall time includes process startup. Other
validation was running concurrently, so the wall times are observations rather
than performance thresholds. Compilation is excluded from these times.

The quadratic finishes at `29.998892352401082`. The XOR fixture uses stream
`(17, 0)`, learning rate `0.01`, and batch size four; total squared error is
`4.067564042545842e-31`. Its committed independent initial tensors and sampling
schedule live in `test/malt-reference/xor-data.json`.

To rebuild the core and XOR programs from the checkout:

```sh
build/emit build -L lib test/malt-core.scm -o /tmp/malt-core
build/emit build -L lib demos/malt-xor.scm -o /tmp/malt-xor
/tmp/malt-core
/tmp/malt-xor
```

The scalar workload minimizes `(30 - theta[0])^2` from `(3.0)` with
`alpha = 0.01` and `revs = 500`; the learner guide shows the same API.

A no-Malt-import program `(display "plain-size-check")` is 52,360 bytes both
before and after this change. That comparison links the identical emitted
program/library IR against the original and updated C runtime, uses the same
output basename, and compares retained symbol sets. They are identical; no
learner, PRNG, or entropy symbol remains. A direct `getentropy` call had left an
unused dynamic import in this comparison, so the final private entropy edge
uses a bounded binary OS-device read through existing libc file operations.

These workloads establish useful costs for the nested-vector learner backend.
They do not justify changing tensor representation, boxed flonums, or GC as a
prerequisite to the port. Larger workloads need their own measurements.

## Custom writer and object comparison

Measured 2026-11-17 on the same macOS arm64 / LLVM 23.1.4 toolchain, comparing
0.8.0 with the 0.9.0 custom-writer implementation. Values below are medians of
three executions, alternating before and after binaries. CPU and resident
memory use `os.wait4`; wall time includes process startup. Regeneration was
running concurrently, so these are observations, not timing thresholds.

| Workload | Version | Executable bytes | Wall seconds | CPU seconds | Peak resident bytes |
|---|---|---:|---:|---:|---:|
| Original core, 95 assertions | Before | 210,136 | 0.004108 | 0.003312 | 3,096,576 |
| Original core, 95 assertions | After | 228,248 | 0.004242 | 0.003240 | 3,096,576 |
| Seeded XOR, 4,000 updates | Before | 172,432 | 0.847596 | 0.844447 | 2,998,272 |
| Seeded XOR, 4,000 updates | After | 174,688 | 0.910181 | 0.897120 | 2,998,272 |

The original core fixture is held at 95 assertions for comparison; only its
numeric-total helper was adapted to traverse tensor objects through `tlen` and
`tref`. The expanded acceptance fixture now has 120 assertions. Both comparison
binaries produce the original completion marker, and XOR retains its numerical
predictions and `4.067564042545842e-31` loss. New binaries were compiled through
the current Chez source driver with the default AOT `-O2 -flto` profile.

For a minimal no-Malt control, the identical no-prelude IR for
`(display "plain-size-check")` was linked against the old and new runtimes with
`-O2 -flto`: 52,280 bytes before and 35,880 after. Both print exactly the same
bytes; `nm` finds no Malt symbols in the new executable. This control differs
from the historical default-prelude measurement above and is not a claim about
all programs' sizes. Malt remains an optional dependency.

The original core grows by 18,112 bytes (8.6%); XOR grows by 2,256 bytes (1.3%)
and uses about 6.2% more CPU in these samples. Follow-up investigation is recorded
as P25 in [the performance backlog](PERFORMANCE.md#p25-malt-object-traversal-and-writer-retention).
