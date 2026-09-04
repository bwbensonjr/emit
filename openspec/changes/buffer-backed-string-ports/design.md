## Context

See `proposal.md` — Why, and `docs/PERFORMANCE.md` P21 for the measurements. This section
records only the current structure the approach has to work with.

**The port table, and why it looks the way it does.** A Scheme record field holds a `val`,
and a C `FILE *` is not one, so the runtime owns the stream and hands Scheme a small integer
index into `port_slots` (change `scheme-io-library`, design D1). Handle 0 is `stdout`, handle
1 is `stderr`, and table slots are handles 2 and up. Every use is a range-and-liveness check
away from a diagnostic instead of a fault. `port_arg_stream` decodes a port record's field 0
to a handle, and that one documented coupling with `src/prelude.scm` is what keeps the four
port-directed output primitives bare primcalls with no Scheme-side wrapper.

**Why string ports are streams.** `print_val` takes a `FILE *`, so `display` and `write` to a
string port are the *same* printer with a different stream rather than a second accumulation
path in Scheme. `open_memstream` made that possible at essentially no cost in code. The
decision was right for the code it produced and wrong for the cost it inherited, which is the
whole of P21.

**Two consequences already visible in the tree.** `open_memstream` retains the *addresses* of
its buffer and size cells, so those cannot live in the doubling `port_slots` array — a
retained string port was corrupted when the table grew (issue #113), and the fix
(`stabilize-string-output-ports`) was a separate process-lifetime `port_memstream_state`
allocation per string port. And that buffer is `malloc`'d outside the GC heap and never
freed, which `rt_port_get_output_string` documents as a bounded leak, because freeing it at
close is what would make `get-output-string`-after-close impossible.

**The surface to convert**, counted:

| site | count |
|---|---|
| stdio calls inside `print_val` / `print_node` | 61 |
| port-directed byte emitters (`newline`, `write-char`, two `write-string` entries) | 4 |
| stdio calls elsewhere in `runtime.c` (stderr diagnostics, the error printer) | 9 |

The 61 and the 4 convert. The 9 do not: they write to `stderr` unconditionally and have no
port behind them.

## Goals / Non-Goals

**Goals**

- Make the cost of opening a string output port independent of how many are live.
- Keep one printer. The value of the current design is that there is exactly one
  `print_val`, and this change must not produce a second accumulation path.
- Remove the `open_memstream` dependency and the two workarounds it forced, rather than
  adding a third.
- Change no Scheme source, no primitive signature, and no port record layout.

**Non-Goals**

- Input string ports. They are implemented in `src/prelude.scm` over a cursor, not as a
  `FILE`, and P21 does not touch them.
- Buffered output for *file* ports. They stay `FILE *`; stdio's buffering is doing a job
  there that a runtime buffer would have to reimplement.
- Making `print_val` faster. This change should be cost-neutral on the file and stdout
  paths, and it is a regression if it is not.
- Freeing a string port's storage at `close-port`. The buffer becomes collectable when the
  port is unreachable, which is the R7RS-appropriate answer; an eager free at close would
  break `get-output-string`-after-close exactly as it does today.

## Decisions

**D1 — A sink is a tagged union passed by pointer, and the `FILE *` arm is a pass-through.**

```c
typedef struct {
  FILE *f;          /* non-NULL: write through to stdio */
  char *buf;        /* non-NULL: accumulate here */
  size_t len, cap;
} sink;
```

`sink_putc`, `sink_puts`, `sink_write` and `sink_printf` branch once on `f` and, in the
stream case, call exactly the stdio function the code calls today. The branch is a
predictable test on a hot-in-cache field, and it replaces a call that was already
indirect. *Alternative rejected:* a vtable of function pointers — it turns a predictable
branch into an indirect call on the hottest path in the runtime, buys extensibility this
runtime has no use for, and would be harder to satisfy the "cost-neutral" goal with.

**D2 — The buffer lives in the port slot and is GC-managed.** `port_slot` gains the sink
in place of `FILE *f` plus `port_memstream_state *memstate`. The bytes are
`GC_MALLOC_ATOMIC` — they contain no Scheme values, exactly like the byte storage
`rt_make_string` allocates — and grow by doubling. Because the runtime owns the buffer, no
external party retains the address of the buffer *cell*, which is the property
`open_memstream` lacked and the entire reason `port_memstream_state` had to be a separate
allocation. `port_memstream_state` is deleted, and the #113 hazard is designed out rather
than guarded against. The table may double freely; a slot's `buf` pointer moves with it and
nothing outside holds a pointer to the slot.

**D3 — `close-port` releases the stream and keeps the buffer.** For a string port there is
no stream to release, so closing marks the slot dead and does nothing else; the buffer stays
reachable from the slot and `get-output-string` keeps working, which is today's documented
behavior and now falls out rather than being arranged. The difference from today is that the
buffer is collectable when the port record becomes unreachable, because it is GC-heap memory
under a slot the collector can reach — where the memstream buffer was `malloc`'d and
permanently lost.

**D4 — `sink_printf` formats through `vsnprintf` into the destination.** For the stream arm,
`vfprintf`. For the buffer arm, `vsnprintf` into the free tail with the remaining capacity;
if the return value says it did not fit, grow to fit and format again. Two formats in the
rare case, none in the common one, and no fixed scratch buffer to overflow. The printer's
`fprintf` calls are small and bounded (numbers, header names, `#<...>` forms), so the
second pass will essentially never run.

**D5 — The handle contract, the record layout, and every primitive signature are unchanged.**
`port_arg_stream` becomes `port_arg_sink` and returns `sink *` instead of `FILE *`; the
decode it performs — record, field 0, fixnum, live handle — is byte-for-byte the same, and so
is the diagnostic when it fails. `stdout` and `stderr` resolve to two statically initialized
stream sinks, preserving "the standard ports need no table slot and no initialization order."
This is what keeps the change out of `CORE_FLAT` and out of the regen barrier.

**D6 — Byte-identical `bootstrap/*.ll` is the correctness oracle for the compiler half.**
No Scheme source changes, so a `make regen` must reproduce every committed `.ll` exactly. That
turns "did this change the compiler's behavior?" into a file comparison. It is not required to
*run* regen to land this change — `runtime.c` reaches the binaries through plain `make` — but
running it is the cheapest strong check available and the task list does it.

**D7 — The scaling requirement gets its own test, because no correctness suite can see it.**
Every existing port test passes today with the quadratic in place. A test that opens tens of
thousands of string ports without closing them, and asserts a wall-clock or ratio bound, is
the only thing that would fail if this regressed. It goes in the dev suite rather than the
default one, and it is written as a ratio against the closing variant rather than an absolute
time, so it does not become a machine-speed tripwire.

## Risks / Trade-offs

- **The printer is the hottest path in the runtime and this change touches all of it.** →
  D1 keeps the stream arm a pass-through to the identical stdio call, so the added cost is one
  predictable branch. The mitigation is measurement, not argument: the task list requires a
  before/after on an output-heavy benchmark, and a regression on the `stdout` path is a reason
  to stop.
- **61 mechanical edits is 61 chances to write `sink_puts` where the code said `fputc`.** →
  The conversion is exhaustive rather than selective: once `print_val` and `print_node` take
  a `sink *`, a missed call site is a compile error, because there is no `FILE *` in scope to
  pass. Making the parameter change first and letting the compiler enumerate the work is the
  order the task list uses.
- **`fwrite` and `fprintf` have semantics the buffer arm must not silently differ on** —
  partial writes, return values, embedded NULs. → `write-char` and `write-string` write
  known-length byte runs and the printer ignores return values today, so the surface is
  narrow; the task list checks embedded NUL and multi-byte UTF-8 explicitly, since Scheme
  strings may contain both.
- **A growable buffer has an overflow surface `open_memstream` handled.** → Growth is by
  doubling with a checked `size_t`, and the one place a caller supplies a length
  (`write-string`) already carries a validated `str_len`.
- **This reopens a subsystem that was deliberately settled twice** (`scheme-io-library`, then
  `stabilize-string-output-ports`). → It settles it further rather than churning it: the
  change deletes `port_memstream_state`, deletes the `open_memstream` dependency, and removes
  the leak, so the count of workarounds in the file goes down. The R7RS conformance suite and
  the string-port cases from #113 are the regression net.

## Migration Plan

1. Introduce the sink type and its four operations alongside the existing code, unused.
2. Change `print_val` / `print_node` to take `sink *`, and fix every resulting compile error.
   Nothing behaves differently yet: every caller passes a stream sink.
3. Convert the four port-directed byte emitters and `port_arg_stream`.
4. Switch `rt_port_open_output_string` to a buffer sink; delete `port_memstream_state`,
   the `open_memstream` call, and the flush in `rt_port_get_output_string`.
5. Add the scaling test; run both suites; measure the printer.

Rollback is a revert of a single-file change. No artifact, no IR, and no Scheme source moves,
so nothing else has to be rolled back with it.

## Open Questions

- Whether the initial buffer capacity should be tuned. Anything from 64 to 256 bytes is
  defensible and the doubling makes it a second-order question; pick one, and revisit only if
  the printer benchmark says otherwise.
- Whether `flush-output-port` on a string port should remain a no-op returning success. It is
  what today's code does once the memstream is gone, and R7RS does not require otherwise, but
  it is worth a deliberate line in the code rather than falling out of a `NULL` check.
