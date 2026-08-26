## Why

String output ports retain `open_memstream` metadata cells inside a runtime table that moves when
it grows, so opening enough later ports can make an older port lose its accumulated text or abort
the process. GitHub issue #113 blocks the Pitch port's last R7RS CLI assertion and must be fixed so
long-lived capture ports remain reliable while formatting opens temporary ports.

## What Changes

- Keep every string output port's buffer and size metadata at stable addresses for the full
  lifetime of its memstream, including across any number of later port-table growth events.
- Preserve existing output-port behavior: handles remain range-checked, file and string ports use
  the shared `FILE *` output path, closed string ports still support `get-output-string`, and port
  table growth remains transparent to Scheme programs.
- Add a focused regression that retains a string output port across the initial capacity boundary,
  writes to it, and verifies the exact accumulated string without a crash.
- Verify the fix through the normal Emit runtime, I/O-port, and full test workflows without a
  compiler regeneration, because the affected implementation is host runtime C.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `io-ports`: Require a string output port to preserve all accumulated output when unrelated ports
  opened later cause internal port-storage growth.

## Impact

- Affected implementation: `src/runtime/runtime.c`, especially port-slot allocation, string-port
  construction, lookup, close, and collection paths.
- Affected verification: `test/io-ports-tests.sh` and the existing aggregate test runners.
- User-visible API signatures and module exports do not change; the change restores the existing
  `(scheme base)` string-port contract and unblocks Pitch's in-memory stdout/stderr capture path.
- No bootstrap IR update or `make regen` is expected because `src/runtime/runtime.c` is outside
  `CORE_FLAT`.
