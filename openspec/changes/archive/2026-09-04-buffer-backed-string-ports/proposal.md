## Why

An output string port is a libc `FILE`. `open-output-string` is `open_memstream`, which is
`funopen`, which is `__sfp` — and `__sfp` walks libc's list of `FILE` objects looking for a
free slot. A stream that is never closed is never a free slot, so a program that opens
string ports and drops them pays, for each new port, a walk past every port it has ever
opened. Opening 80,000 string ports costs 7.09 s left open against 0.52 s closed, and the
0.52 s is entirely process startup: quadratic against flat.

This is `docs/PERFORMANCE.md` **P21**, found while profiling `pitch` — an external formatter
written in Emit — alongside P19 and P20, which were fixed directly because they were
contained bug fixes. P21 was filed rather than fixed because it is a design change to a
subsystem that was deliberately settled, and the entry says in as many words that it wants
its own change.

A caller can avoid the cost by closing a port it owns, and pitch now does. That is good
hygiene and not a fix: a program that legitimately holds many string ports open still hits
the wall, and no R7RS program is obliged to close a port it has finished with — the
collector is supposed to be the answer.

## What Changes

- **The printer stops taking a `FILE *` and starts taking a sink.** `print_val` and
  `print_node` — 61 stdio calls between them — move to `sink_putc` / `sink_puts` /
  `sink_printf` / `sink_write`. A sink is a tagged union of a `FILE *` and a growable
  runtime-owned byte buffer. The four port-directed byte emitters (`newline`, `write-char`,
  and the two `write-string` entries) move with them.
- **A string output port becomes a buffer, not a stream.** `rt_port_open_output_string`
  allocates a slot whose sink is a buffer; no `FILE` is created, so libc's stream list is
  never touched and the cost of opening one no longer depends on how many are live.
  `get-output-string` copies out of the buffer directly rather than flushing a memstream.
- **`port_memstream_state` and its separate process-lifetime allocation are deleted.** They
  exist because `open_memstream` retains the *addresses* of its buffer and size cells, which
  is what made a growing port table corrupt a retained string port (issue #113, change
  `stabilize-string-output-ports`). A runtime-owned buffer has no such constraint, so this
  change removes the hazard rather than continuing to work around it.
- **A string port's storage becomes one GC-heap allocation instead of two outside it.** Today a
  string port costs a `malloc`'d memstream buffer outside the GC heap plus a
  `GC_MALLOC_UNCOLLECTABLE` `port_memstream_state`, neither ever freed. After this change it
  costs one `GC_MALLOC_ATOMIC` buffer sized by the text written. That buffer is *not* reclaimed
  early: the port table is a permanent strong root and a port record names its storage only
  through a fixnum handle, so no GC edge from Scheme to the buffer exists and port reachability
  is invisible to the runtime. Making it reclaimable needs storage hung off the port record —
  a prelude change and the regen barrier — and is deliberately out of scope here; it is filed as
  debt in `docs/PERFORMANCE.md` instead.
- **File output ports are unchanged**, and so are `stdout` and `stderr`. They stay `FILE *`
  behind the same sink interface; this change removes a platform dependency from string
  ports without adding one anywhere.
- Behavior that MUST NOT change: `get-output-string` continues to work after `close-port`,
  and a retained string port continues to survive later port-table growth.

## Capabilities

### New Capabilities

None. This changes how an existing capability is delivered.

### Modified Capabilities

- `io-ports`: the "Textual output ports over files and strings" requirement gains a guarantee it
  does not currently make — that the cost of opening a string output port is independent of how
  many output ports are already live — and states the shape of a string port's storage: one
  allocation per port sized by its text, with early reclamation explicitly not required.

## Impact

- **Modified**: `src/runtime/runtime.c` only — the printer, the port table, the four
  port-directed byte emitters, and the string-port entry points. No Scheme source changes:
  the port record layout, the handle contract, and every primitive's name and signature stay
  exactly as they are.
- **No regen barrier.** `runtime.c` is host C reaching the binaries through plain `make`, not
  through `tools/regen.sh`'s `CORE_FLAT`. `bootstrap/*.ll` must come back byte-identical if
  regen is run at all, which makes it a useful check rather than a cost.
- **Tests**: `run-all-tests.sh` and `run-dev-tests.sh` both exercise ports heavily; the
  R7RS conformance suite and the string-port cases from `stabilize-string-output-ports` are
  the ones that matter most. A scaling test is added, since the defect is invisible to a
  correctness suite.
- **Performance**: P21 is closed by this change. The acceptance figure is the P21 table —
  80,000 string ports left open must cost what 80,000 closed ones cost today (~0.5 s), not
  7.09 s. The retained-storage half of P21's leak is *not* closed and gets its own entry.
- **Risk concentrated in one place**: the printer is the single most-used code path in the
  runtime, and every `display`, `write`, and error diagnostic goes through it. The change is
  mechanical but wide, which is why the design makes the `FILE *` case a pass-through rather
  than a reimplementation.
