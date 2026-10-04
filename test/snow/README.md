# Vendored snow-fort.org packages

Portable R7RS libraries from [snow-fort.org](https://snow-fort.org/pkg), compiled **unmodified** by
`test/snow-package-tests.sh` (change: `portable-library-surface`, design D12). They are the
acceptance test for the portable-source surface: `define-library`, `include`, `cond-expand`,
import sets, and `(library …)` requirements, exercised by code nobody wrote for Emit.

| File | Role |
|---|---|
| `lib/srfi/8.sld`, `lib/srfi/8.scm` | `(srfi 8)`, `receive`, **verbatim** from the package. Do not edit. |
| `lib/srfi/2.sld`, `lib/srfi/2.scm` | `(srfi 2)`, `and-let*`, **verbatim** from the package. Do not edit. |
| `packages/<pkg>/package.scm` | Each package's metadata, verbatim: name, version, license, dependencies. |
| `packages/<pkg>/test.scm` | Each package's own test, verbatim. It needs `(srfi 64)`, which Emit does not ship, so it is kept for reference. `smoke.scm` carries over its assertions. |
| `smoke.scm` | The program the suite runs on every compilation path. |

`lib/` is a conventional library root: `(srfi 8)` resolves to `lib/srfi/8.sld` with `-L test/snow/lib`.

## Provenance

Downloaded 2026-10-04 from snow-fort.org, maintainer Retropikzel (iki.fi/retropikzel):

| Package | URL | sha256 of the .tgz | License |
|---|---|---|---|
| `srfi-8` 0.1.2 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/8/0.1.2/srfi-8-0.1.2.tgz` | `fdb048b73681bda800c83e2954cceb88e1a3474c2b7b76b91da3c0103cdbc515` | MIT. The notice is the header of `lib/srfi/8.scm`, by John David Stone. |
| `srfi-2` 0.1.1 | `https://snow-fort.org/s/iki.fi/retropikzel/srfi/2/0.1.1/srfi-2-0.1.1.tgz` | `44413aad51790b579e7b8d7ef900aee03531df251ae506dead6fa6d80706b82a` | MIT-0. The notice is the header of `lib/srfi/2.scm`, by Marc Nieper-Wißkirchen. |

Each package's `index.html` manual is not vendored.

## Why these two, and not SRFI 1

The plan named `(srfi 1)` (0.1.3, same maintainer) as the first candidate. It does not compile yet,
for two reasons. Each is filed rather than worked around here:

- It re-exports procedures it imports (`cadr` … `cddddr`), which Emit's `export` rejects (issue
  #121).
- It imports `(srfi 227)`, whose exported `opt-lambda` reaches `case-lambda` through a template.
  An imported non-baked macro does not survive that trip (issue #120).

When both are fixed, vendoring `(srfi 1)` and `(srfi 227)` here is the next acceptance step.
