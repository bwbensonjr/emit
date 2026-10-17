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
| `packages/<pkg>/test.scm` | Each package's own test, verbatim. It needs `(srfi 64)`, which Emit does not ship, so it is kept for reference. `smoke.scm` carries over its assertions. |
| `smoke.scm` | The existing SRFI 2/8 program the suite runs on every compilation path. |
| `srfi-1-smoke.scm` | Focused SRFI 1/227 acceptance input; source-driven expected result: `(6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))`. |

`lib/` is a conventional library root: `(srfi 8)` resolves to `lib/srfi/8.sld` with `-L test/snow/lib`.

## Provenance

The original SRFI 2 and SRFI 8 archives were downloaded 2026-10-04. SRFI 1 and SRFI 227 were downloaded 2026-10-16 from snow-fort.org, maintainer Retropikzel (iki.fi/retropikzel):

| Package | URL | sha256 of the .tgz | License |
|---|---|---|---|
| `srfi-8` 0.1.2 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/8/0.1.2/srfi-8-0.1.2.tgz` | `fdb048b73681bda800c83e2954cceb88e1a3474c2b7b76b91da3c0103cdbc515` | MIT. The notice is the header of `lib/srfi/8.scm`, by John David Stone. |
| `srfi-2` 0.1.1 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/2/0.1.1/srfi-2-0.1.1.tgz` | `44413aad51790b579e7b8d7ef900aee03531df251ae506dead6fa6d80706b82a` | MIT-0. The notice is the header of `lib/srfi/2.scm`, by Marc Nieper-Wißkirchen. |
| `srfi-1` 0.1.3 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/1/0.1.3/srfi-1-0.1.3.tgz` | `fe3c15c2546cb80fc4212531a2db0a55fb551066f397562b7ed762f10c7773ff` | MIT. The notice is in `lib/srfi/1.scm`, by Olin Shivers. |
| `srfi-227` 0.1.3 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/227/0.1.3/srfi-227-0.1.3.tgz` | `c200a4e7199190ca04975b87568c873a631311f5e01ddf1a77c07bcc52c59d83` | MIT. The notice is in `lib/srfi/227.scm`, by Daphne Preston-Kendal. |

The per-file source digests below identify the exact vendored files and can be checked against the matching paths in the archives. The package's `index.html` manual is not needed by the libraries or tests and is not vendored.

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

SRFI 1 directly imports `(scheme base)`, `(scheme cxr)`, `(srfi 8)`, and `(srfi 227)`. SRFI 227 imports `(scheme base)` and `(scheme case-lambda)`. Its `opt-lambda` template depends on `case-lambda`. SRFI 1's upstream test requires `(srfi 64)`, as does SRFI 227's, so both tests are retained as upstream references; neither is directly runnable without the excluded test harness.

Run the focused input with the source-driven compiler from the repository root:

```sh
chez --libdirs src --script src/compile.ss test/snow/srfi-1-smoke.scm \
  -L test/snow/lib -o /tmp/srfi-1-smoke
/tmp/srfi-1-smoke
```

It covers prefixed `fold`, `filter`, `append-map`, the re-exported `caddr` accessor from `(scheme cxr)`, SRFI 1's optional `iota` argument, and SRFI 227 `opt-lambda` with its default and supplied optional argument.

The full runner also verifies warm native unit-cache reuse from an unrelated directory,
compares saved `emit lib` IR and export interfaces with the Chez driver's full units,
and executes the delivered binary with no library search configuration. Native loading
of manifest artifact directories is separate work tracked in issue #123.

The implementation units are unmodified from their archives. The two added package directories contain verbatim package metadata and upstream tests. The MIT notices remain in the implementation sources.

`sources.sha256` guards the eight newly vendored source, metadata, and test files.
The acceptance runner checks it before compiling; run `shasum -a 256 -c sources.sha256`
from this directory to verify the same guard independently.

## Why the current acceptance does not run the upstream test suites

They depend on `(srfi 64)`, outside the scope of this change. The maintained smoke program covers only the selected acceptance cases; this is not a claim of full SRFI conformance.
