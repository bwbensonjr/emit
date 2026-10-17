# Vendored snow-fort.org packages

Portable R7RS libraries from [snow-fort.org](https://snow-fort.org/pkg), compiled **unmodified** by
`test/snow-package-tests.sh` (change: `portable-library-surface`, design D12). They are the
acceptance test for the portable-source surface: `define-library`, `include`, `cond-expand`,
import sets, and `(library …)` requirements, exercised by code nobody wrote for Emit.

| File | Role |
|---|---|
| `lib/srfi/8.sld`, `lib/srfi/8.scm` | `(srfi 8)`, `receive`, **verbatim** from the package. Do not edit. |
| `lib/srfi/2.sld`, `lib/srfi/2.scm` | `(srfi 2)`, `and-let*`, **verbatim** from the package. Do not edit. |
| `lib/srfi/1.sld`, `lib/srfi/1.scm` | `(srfi 1)`, **verbatim** from SRFI 1 0.1.3. Do not edit. |
| `lib/srfi/227.sld`, `lib/srfi/227.scm` | `(srfi 227)`, **verbatim** from SRFI 227 0.1.3. Do not edit. |
| `packages/<pkg>/package.scm` | Each package's metadata, verbatim: name, version, license, dependencies. |
| `packages/<pkg>/test.scm` | Each package's own test, verbatim, executed by `test/srfi-upstream-tests.sh`. |
| `smoke.scm` | The existing SRFI 2/8 program the suite runs on every compilation path. |
| `srfi-1-smoke.scm` | Focused SRFI 1/227 acceptance input; source-driven expected result: `(6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))`. |

`lib/` is a conventional library root: `(srfi 8)` resolves to `lib/srfi/8.sld` with `-L test/snow/lib`.

## Provenance

SRFI 64 0.1.7 was downloaded on 2026-10-17 from
[the upstream archive](https://snow-fort.org/s/iki.fi/retropikzel/srfi/64/0.1.7/srfi-64-0.1.7.tgz),
SHA-256 `85de19c0d3ef194c577241d72cfb9fa70ab979eb9f50aa6bab3e72cccc174f37`.
The complete pristine package is retained in `packages/srfi-64-0.1.7/`, including
its manual, metadata, test, MIT notices, and nested includes. Its normal selected
branch imports base, case-lambda, eval, file, process-context, read, write, and
SRFI 1. SRFI 1 in turn imports cxr, SRFI 8, and SRFI 227; SRFI 227 imports
case-lambda. `64.scm` initializes `test-env` through `environment` and uses `eval`
only in `test-read-eval-string`. The real-only `approx=` is an unsupported stub.
The source-info include selects its portable `syntax-rules` fallback in Emit.

The Emit port lives in the repository's `lib/srfi/`. `srfi-64-emit.patch`
reproduces every adaptation from the pristine reference: portable implemented
imports instead of implementation-specific/evaluator branches, absolute-error
real approximate comparison, and an explicit unsupported-operation diagnostic
for `test-read-eval-string`. Nested runner/source-info includes are unchanged.
There is no fake evaluator or implementation feature identifier. Complex
arithmetic and string evaluation are unsupported; this is not full SRFI 64
conformance. The source-info fallback uses portable `syntax-rules`.

Source-driven acceptance passes these complete, unchanged upstream files:

| SRFI | Version | Pass | Fail / xpass / skip | Approved xfail |
|---|---|---:|---|---:|
| 1 | 0.1.3 | 147 | 0 / 0 / 0 | 0 |
| 2 | 0.1.1 | 29 | 0 / 0 / 0 | 0 |
| 8 | 0.1.2 | 2 | 0 / 0 / 0 | 0 |
| 227 | 0.1.3 | 13 | 0 / 0 / 0 | 0 |
| 64 | 0.1.7 | 47 | 0 / 0 / 0 | 2 |

SRFI 64's two explicit expected failures are its group-skip and test-apply-skip
self-tests (6.4.3.2 and 8.6.3). No evaluator-dependent upstream assertions are
excluded, and the four target package suites have no skips or expected failures.
The external driver selects SRFI 1 before base's `fold-right` extension under the
unchanged first-import-wins policy. It installs a custom current runner as well
as a runner factory because upstream's default installer directly creates its
simple runner. The SRFI 64 self-test retains the default factory it tests.

`acceptance-runner.scm` records exact counts, group identity and completion in a
dedicated result file before upstream `(exit 0)`. Process status and the complete
datum must agree. Controls reject failed assertions with exit 0, missing
completion, and successful counts with exit 7. Failure reports include saved
stdout, stderr, status and counts. Native run/build/REPL checks are registered;
their final execution follows compiler regeneration.

The user-approved fixes for internal variadic definitions (#128) and multiple-value
escape continuations (#129) are source-tested. Escape continuations remain
invalid after their captured extent ends. `srfi-64-smoke.scm` adds eight focused
checks for errors, tolerance boundaries/zero margin, skipped operands, counters,
expected/unexpected outcomes, and the exact evaluator diagnostic. Upstream SRFI
64 additionally checks callbacks, nested groups, cleanup, selection and runner
restoration.

The original SRFI 2 and SRFI 8 archives were downloaded 2026-10-04. SRFI 1 and SRFI 227 were downloaded 2026-10-16 from snow-fort.org, maintainer Retropikzel (iki.fi/retropikzel):

| Package | URL | sha256 of the .tgz | License |
|---|---|---|---|
| `srfi-8` 0.1.2 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/8/0.1.2/srfi-8-0.1.2.tgz` | `fdb048b73681bda800c83e2954cceb88e1a3474c2b7b76b91da3c0103cdbc515` | MIT. The notice is the header of `lib/srfi/8.scm`, by John David Stone. |
| `srfi-2` 0.1.1 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/2/0.1.1/srfi-2-0.1.1.tgz` | `44413aad51790b579e7b8d7ef900aee03531df251ae506dead6fa6d80706b82a` | MIT-0. The notice is the header of `lib/srfi/2.scm`, by Marc Nieper-Wißkirchen. |
| `srfi-1` 0.1.3 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/1/0.1.3/srfi-1-0.1.3.tgz` | `fe3c15c2546cb80fc4212531a2db0a55fb551066f397562b7ed762f10c7773ff` | MIT. The notice is in `lib/srfi/1.scm`, by Olin Shivers. |
| `srfi-227` 0.1.3 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/227/0.1.3/srfi-227-0.1.3.tgz` | `c200a4e7199190ca04975b87568c873a631311f5e01ddf1a77c07bcc52c59d83` | MIT. The notice is in `lib/srfi/227.scm`, by Daphne Preston-Kendal. |

The per-file source digests below identify the exact vendored files and can be checked against the matching paths in the archives. Manuals are omitted for the earlier packages; SRFI 64 retains its complete archive tree.

| Package file | SHA-256 |
|---|---|
| `packages/srfi-1-0.1.3/package.scm` | `e4b962a3a776c25eabf55da5f5ed2f753b2ebc63e4b9aab7ca5b26c21c138bbd` |
| `packages/srfi-1-0.1.3/test.scm` | `d3ad31d0f67fe6e136581174e4cf841dbcb4ebbef5d27914d4cc7f570a8202a3` |
| `lib/srfi/1.sld` | `a16c0ab8a2b77cde3172f4ea14752653b5a1d3021f9553c4d8a6504c22827f3e` |
| `lib/srfi/1.scm` | `8e62f730c99f5775007b2f7d649af889bd76b0c3203e97e0ee7990312069b961` |
| `packages/srfi-227-0.1.3/package.scm` | `67d2ebcc9dbca22a292b398d58f79b1c2dd2df388e716a1c67c31c1f801aed4c` |
| `packages/srfi-227-0.1.3/test.scm` | `c0a226cf8a6e5fb8ce8cef38425fece0bc2b1d26fcb1d743c47c1d16f7a5134b` |
| `lib/srfi/227.sld` | `b7ef3b51194271f001c1c7df2ea526c414f2eddcba0b57053f49453631d902bf` |
| `lib/srfi/227.scm` | `98ccd24d3f4319e9147fbf00ba93a5ba4b4bf29d6ea859157f6f0c04763ed997` |

SRFI 1 directly imports `(scheme base)`, `(scheme cxr)`, `(srfi 8)`, and `(srfi 227)`. SRFI 227 imports `(scheme base)` and `(scheme case-lambda)`. Its `opt-lambda` template depends on `case-lambda`. Upstream package tests use the ordinary `(srfi 64)` port.

Run the focused input with the source-driven compiler from the repository root:

```sh
chez --libdirs src --script src/compile.ss test/snow/srfi-1-smoke.scm \
  -L test/snow/lib -o /tmp/srfi-1-smoke
/tmp/srfi-1-smoke
```

It covers prefixed `fold`, `filter`, `append-map`, the re-exported `caddr` accessor from `(scheme cxr)`, SRFI 1's optional `iota` argument, and SRFI 227 `opt-lambda` with its default and supplied optional argument.

The full runner also verifies warm native unit-cache reuse from an unrelated directory,
compares saved `emit lib` IR and export interfaces with the Chez driver's full units,
and executes the delivered binary with no library search configuration.
`test/srfi-artifact-tests.sh` independently publishes the shipped SRFI closure and
requires explicit-path hits with fresh private caches through native run/build/REPL.
Artifacts are native-only; Chez parity outputs remain separate legacy units.

The implementation units are unmodified from their archives. The two added package directories contain verbatim package metadata and upstream tests. The MIT notices remain in the implementation sources.

`sources.sha256` guards the fourteen pinned source, metadata, and test files.
The acceptance runner checks it before compiling; run `shasum -a 256 -c sources.sha256`
from this directory to verify the same guard independently.

## Reproduce acceptance and provenance

```sh
bash test/snow-provenance-tests.sh
EMIT_SNOW_HOST=chez bash test/srfi-upstream-tests.sh
EMIT_SNOW_HOST=native bash test/srfi-upstream-tests.sh
EMIT_SNOW_HOST=chez bash test/snow-package-tests.sh
```

`lib/srfi/upstream.sha256` guards the eight shipped unmodified source files.
The formatter excludes exactly those pinned paths, not the hand-maintained
SRFI 64 declaration. The provenance test also compares fixtures to shipped
copies, applies the port patch in a temporary directory, and compares all four
SRFI 64 implementation files. Regenerate the patch using `diff -u` with labels
`a/srfi/64.sld`/`b/srfi/64.sld` and `a/srfi/64.scm`/`b/srfi/64.scm` against
`packages/srfi-64-0.1.7/srfi/` and the repository's `lib/srfi/`.
