## Context

See `proposal.md` for motivation and `specs/io-ports/spec.md` for the observable contract.

The runtime represents every non-standard output port as a numeric handle into a contiguous
`port_slot` array. The array begins with capacity eight and grows by allocating a doubled array,
shallow-copying its slots, freeing the old array, and updating the global pointer. File streams are
unaffected because a copied `FILE *` still names the same stream.

String streams have a stronger address-lifetime constraint. `open_memstream` retains the addresses
of the `char *` and `size_t` cells it receives and updates those cells on flush or close. Today those
cells are fields of the movable slot. After table growth the stream updates freed storage while
`get-output-string` reads the copied, stale fields. The handle remains valid, which makes the
failure silent in the minimal reproduction and can become memory corruption or SIGABRT in the
larger Pitch path.

The implementation is confined to `src/runtime/runtime.c`, a host C source outside `CORE_FLAT`, so
the normal build relinks all execution modes without crossing the `make regen` barrier.

## Goals / Non-Goals

**Goals:**

- Give each live memstream's buffer and size cells stable addresses through every table growth.
- Retain numeric handles, range/liveness checks, the shared `FILE *` printer path, and
  `get-output-string` after close.
- Keep the fix local enough that file ports and Scheme-level port records do not change.
- Pin the exact capacity-crossing regression in the existing Chez-free I/O-port suite.

**Non-Goals:**

- Reusing closed handle slots or changing the monotonic handle allocation policy.
- Reclaiming string-port buffers after close; that would conflict with the supported
  close-then-`get-output-string` behavior and is separate lifetime design work.
- Replacing `open_memstream`, changing port APIs, or adding non-POSIX portability work.
- Porting or vendoring Pitch code as part of the regression.

## Decisions

### D1: Allocate a stable state object only for string-port metadata

Add a small separately allocated memstream state containing the buffer pointer and size cells, and
store a pointer to that state in the movable `port_slot`. Pass the state object's field addresses
to `open_memstream`; make string-port collection read them through the state pointer. A shallow
table copy then moves only the pointer, not the cells whose addresses libc retained.

Allocate the state from the runtime's explicit non-moving, uncollectable storage, matching the
table's process-lifetime ownership. This is compatible with the existing choice to keep every
memstream buffer reachable after close so `get-output-string` remains legal.

Alternatives considered:

- Allocate every `port_slot` separately and grow an array of slot pointers. This also stabilizes
  the cells, but adds an allocation and indirection to file ports and rewrites all lookup sites for
  a constraint only string ports have.
- Never free old slot arrays. This avoids immediate use-after-free but does not solve split state:
  libc would keep updating the old copy while the active table reads the new copy.
- Store pointers to separately allocated `char *` and `size_t` cells. It works, but one typed state
  object expresses their shared lifetime and reduces partial-allocation/error paths.

### D2: Preserve the current handle table and close semantics

Table growth, numeric handle identity, `port_stream`, and Scheme record layout remain unchanged.
A string slot owns its stable state pointer whether its stream is open or closed. Closing flushes
and finalizes the stream as today; collection flushes only a live stream and then copies the bytes
and length from stable state.

This keeps the change orthogonal to port identity, validation, and public behavior. Inferring a
string port from a non-null state pointer is acceptable, though retaining `is_string` is also safe
if it makes failure-state handling clearer; implementation should choose the representation that
keeps invalid handles and failed opens on their current diagnostic paths.

### D3: Exercise an actual growth boundary in the existing I/O-port suite

Add the issue's minimal shape to `test/io-ports-tests.sh`: retain the first string output port,
open eight more to cross the initial capacity of eight, write `"captured"` to the retained port,
and require `get-output-string` to return exactly `"captured"`. The suite's value and process-status
checks jointly reject both the current empty result and the Pitch-observed abort.

Keep the regression in the public Scheme API rather than testing C internals. The concrete count
makes it deterministic against the present allocator; the scenario name and comment must explain
that it is intentionally crossing a growth boundary so a future capacity change updates the test
rather than silently weakening it.

## Risks / Trade-offs

- [A future edit embeds retained-address cells in movable storage again] → Document the
  `open_memstream` address-lifetime rule beside the state type and keep the growth regression.
- [The extra state allocation leaks on failed `open_memstream`] → Initialize the slot and state in
  one clear path and explicitly release or retain failure allocations according to the table's
  process-lifetime policy; verify a failed open never exposes a half-valid handle.
- [The fix changes close-then-collect behavior] → Retain a state pointer after `fclose` and run the
  existing closed-string-port coverage together with the new growth case.
- [A one-boundary test misses later growth] → The stable-state design is independent of the number
  of shallow copies; code review confirms no retained cell remains embedded in `port_slots`.

## Migration Plan

1. Add the focused failing regression and confirm it returns an empty string on the affected
   baseline without depending on Pitch.
2. Introduce stable memstream state and update string-port open/collect/close access while leaving
   file-port and handle-table behavior intact.
3. Run the focused I/O-port and runtime tests, then the complete project test workflows. Use plain
   `make`; do not run `make regen` because no compiler source changes are planned.
4. Land the fix with `Fixes #113`, allowing the Pitch port to rerun its 207-assertion CLI suite.

Rollback is a normal revert. There is no artifact-format, bootstrap, or persisted-data migration.
