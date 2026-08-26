## 1. Reproduce and Pin the Growth Failure

- [x] 1.1 Run GitHub issue #113's minimal program against the current `build/emit` and record that
  it exits normally but returns `""` instead of `"captured"`; verify the retained port plus eight
  later string ports crosses the runtime's initial capacity boundary.
- [x] 1.2 Add a narrated case to `test/io-ports-tests.sh` that retains a string output port across
  that growth boundary, writes `"captured"`, and requires the exact returned string; verify the new
  case fails on the affected runtime while the neighboring ordinary and close-then-collect cases
  still pass.

## 2. Stabilize Memstream Metadata

- [x] 2.1 Introduce a separately allocated memstream state object for the buffer and size cells,
  store its pointer in each string `port_slot`, and document why those cells must never live in the
  movable slot array; verify `make` compiles `src/runtime/runtime.c` cleanly with the discovered C
  toolchain.
- [x] 2.2 Update string-port construction to initialize the stable state before calling
  `open_memstream` and to leave no usable half-open handle on failure; verify existing invalid-port
  and file-port error cases keep their current diagnostics.
- [x] 2.3 Update `get-output-string` and close handling to flush/finalize through the existing
  stream while reading buffer metadata through stable state; verify the new growth regression,
  ordinary accumulation, repeated collection, and collection after close return exact strings
  without a fault.
- [x] 2.4 Audit every `port_slots` copy and string-state access to confirm table growth moves only a
  stable-state pointer and no address retained by libc; verify file ports, standard ports, numeric
  handles, and range/liveness checks remain structurally unchanged.

## 3. Integration Verification and Handoff

- [x] 3.1 Run `make` and `test/io-ports-tests.sh`; verify the complete focused suite passes and its
  narration clearly names the capacity-growth regression.
- [x] 3.2 Run the in-progress Pitch R7RS CLI suite against this checkout's rebuilt Emit and Pitch's
  `emit-libs.scm`; verify all 207 assertions pass, including the formatted standard-input capture,
  with no exit status 134.
- [x] 3.3 Run `./run-all-tests.sh` and the independent suites in `./run-dev-tests.sh`; verify every
  suite passes and `git diff -- bootstrap/` remains empty, with no `make regen` required for this
  host-runtime-only change.
- [x] 3.4 Run `openspec validate stabilize-string-output-ports --strict`, review the final diff for
  the proposal's runtime-and-test scope, and verify the change is ready to sync/archive and the
  eventual fixing commit is identified with `Fixes #113`.
