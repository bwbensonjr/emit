# Acceptance

Recorded 2026-10-23 on macOS arm64 (8-core M-series), LLVM 23.1.2, Apple clang 21.0.0.

## Validation

- `make regen` converged at fixed-point iteration 2 after the final compiler edits
  (`src/parse.ss`, `src/passes/convert-assignments.ss`), 616 s; the fingerprint matches.
  Only `bootstrap/embed.ll`, `embed-repl.ll`, and `schemec.ll` changed; the baked
  library IR is byte-identical.
- `bash tools/test.sh units` 15/15, `source` 1/1 (isolated source consistency),
  `--suite self-emission`, and `--suite dump-parity` passed.
- `bash tools/test.sh full`: 54/55 passed on the first run. The failure was the new
  `srfi-nested-runner` fixture: under the REPL, bare `test-equal` forms print their
  values. The fixture now ends those expressions with no value, and
  `program-toplevel-order-native`, `program-toplevel-order-source`, and
  `module-scaffold-byte-identity` were rerun and passed.

The first acceptance run found a defect in the original #140 approach:
`convert-assignments` hoisted impure "plain" initializers ahead of earlier boxed ones,
so a top-level effect that called a top-level procedure ran after later effects (the
SRFI 64 smoke reported `(5 0)` instead of `(8 0)` in batch). The pass now keeps
source order after a group's first boxed binding (design decision 1). The same run
exposed a latent Chez/native naming difference in `rename`, which allocated fresh
names through `map`; those maps now use `map-lr`.

`test/module-scaffold-baseline.sha256` was re-recorded with a before/after capture
(main vs this change): exactly four of 82 demo modules differ, and all 82 demos
produce identical results on both compilers.

## Issue reproductions

- #140: `test/toplevel-order-tests.sh` prints `2` and `5` for the issue's examples
  through `emit run` (`-O0`/`-O1`/`-O2`), `emit build`, the REPL, and the Chez driver,
  along with the redefinition, leading-effect, exception, record, procedure-effect,
  and SRFI 64 runner cases. The SRFI 64 snow smoke reports `(8 0)` on every path.
- #146: `python3 test/test-runner-tests.py`: 16 tests passed, including the
  deterministic disappearing-status case.
- #139: on this host, doctor selects `/usr/bin/clang` (Apple clang 21.0.0), reports
  `AOT compatibility: unverified`, and exits 0.
- #148 and #149: measured below.

## Startup measurements

An installed prefix (`make install WARM_STDLIB=0`) run from an unrelated directory
with isolated caches. The program imports `(scheme base)`, `(scheme write)`,
`(scheme char)`, `(scheme inexact)`, and `(scheme cxr)`.

| Scenario | Wall clock | Native objects |
|---|---|---|
| `emit run`, empty cache | 19,201 ms | 0 reused, 5 generated |
| `emit run`, second run on that cache | 271 ms | 5 reused, 0 generated |
| `emit build --stdlib`, empty cache | 19,921 ms | portable 0/11, native 0/11 reused; 7,335,843 bytes |
| `emit run`, first use after warming | 278 ms | 5 reused, 0 generated |
| `emit build --stdlib`, repeated | 149 ms | portable 11/11, native 11/11 reused |
| `emit repl` startup to EOF, empty cache | 17,294 ms | |
| `emit repl` startup to EOF, after warming | 148 ms | |

Warming moves library compilation out of the first invocation. The first warm
`emit run` matches an ordinary second run; the remaining 150 to 280 ms is startup
work warming does not remove.

REPL startup stderr with a warm cache: quiet has 2 lines and no resolution output;
default has 3 lines, including one `resolve libraries ->` summary naming the
project root, the installed manifest, and the installed root in order; verbose has
42 lines, including 12 resolution lines.
