# Validation implementation evidence

This is an acceptance record in progress, not a claim that all change tasks are
complete. The equal-coverage full comparison and non-publishing CI rehearsal
must pass before those acceptance tasks are checked.

## Local environment

Measurements on 2026-10-18 use Mac15,3, ARM64, eight physical/logical CPUs,
16 GiB RAM, macOS 26.6.2, LLVM/clang 23.1.2, libgc 8.2.12, and Chez 10.4.1
where explicitly required. Native baseline PATH excludes Chez; native builds
use explicit matching CC/CXX/LLVM_CONFIG and libgc include/library paths.
Dependencies were already installed. Queue/provisioning time is not applicable
locally and remains separate from project build and tests.

The immutable pre-change checkout is commit
`a6238520b38551b1042e9f35a5768e0bcdd29d36`. Initial detailed macOS `time -l`
returned nonzero after a successful build because sandboxed clockrate access was
denied; no test result was taken from that attempt. Portable `time -p` is used
for the retained baseline logs. Lightweight implementation checks overlapped
parts of the baseline; record the observed variation rather than assuming a
quiet host or comparing isolated single best samples.

## Completed checks

- The first pre-change full-native baseline passed all 53 suites without Chez:
  2,553.87 s wall (2,435.81 s user, 47.46 s system), with dependencies already
  installed. A second baseline and paired new-runner samples are still pending;
  this single sample does not establish an equal-coverage improvement.
- Runner regressions cover GNU `timeout` descendants in separate process
  groups, a SIGTERM-ignoring child, failed aggregate reports on interruption,
  private home/cache roots, and inherited install-destination overrides.
- Classifier regressions retain independent staged/unstaged obligations and
  compiler dependencies aliased into otherwise allowlisted Markdown. Source
  fingerprints include internal symlink target bytes and reject unsafe aliases.
- The three selected native configuration, VERSION, and installation suites
  passed concurrently with two workers: 79.248 s wall, 4.410 s seed build,
  72.475 s worker execution. No tracked compiler/bootstrap bytes changed.
- The first focused native development selection passed all three suites:
  37.263 s wall, 4.084 s seed build, 29.095 s worker execution. This is focused
  feedback, not equivalent coverage to the 53-suite full profile.
- All 15 direct source units passed in every comparison sample. Per-unit
  repository copies took 14.520, 14.619, and 14.422 s (median 14.520). Shared
  immutable inputs with private temporary/cache roots took 9.034, 6.310, and
  6.097 s (median 6.310). Before/after seed hashes matched. Coverage tests pin
  all 15 groups, including REPL import transactions, to the source-unit profile.
- Targeted reference selection passed self-emission, dump parity, and datum
  rendering: 25.205 s wall, with all three explicitly selected groups retained.
- [R7RS assembly evidence](VALIDATION-SETUP.md) compares byte-identical programs
  for all 21 sections and records setup-only process counts/timings. This is not
  a full-native speedup measurement.

Raw local reports/logs are retained under `/private/tmp/emit-streamline-*`,
`/private/tmp/emit-units-*`, and their printed per-invocation log directories.
These temporary paths are evidence locations on the measurement host, not
portable project inputs. Reproduce them using the documented harness and retain
the emitted JSON and logs alongside future measurements.
