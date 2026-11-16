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
