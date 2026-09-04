## 1. The sink type, introduced alongside the existing code

- [ ] 1.1 Define the `sink` struct in `src/runtime/runtime.c` per design D1 — a `FILE *f`
      plus `char *buf` / `size_t len, cap` — with a comment recording why it is a tagged
      union and not a vtable, and why the stream arm must stay a pass-through.
- [ ] 1.2 Implement `sink_putc`, `sink_puts`, `sink_write` and `sink_printf`. The stream arm
      calls exactly the stdio function the current code calls; the buffer arm appends,
      growing by doubling with `GC_MALLOC_ATOMIC` (design D2). `sink_printf` uses
      `vsnprintf` into the free tail and re-formats after growing if it did not fit (D4).
- [ ] 1.3 Add two statically initialized stream sinks for `stdout` and `stderr`, so the two
      reserved handles keep needing no table slot and no initialization order (D5).
- [ ] 1.4 Confirm the build is unchanged at this point: `make` succeeds and both binaries
      behave identically, because nothing calls the new code yet.

## 2. Convert the printer

- [ ] 2.1 Change `print_val` and `print_node` to take `sink *` instead of `FILE *`, and let
      the compiler enumerate the work — with no `FILE *` in scope, every unconverted call
      site is a compile error rather than a silent survivor (design, Risks).
- [ ] 2.2 Convert all 61 stdio calls inside `print_val` / `print_node` to the sink
      operations. Mechanical: no formatting, escaping, or policy behavior changes.
- [ ] 2.3 Convert the six `print_val` call sites that pass `cur_out()`, `stdout` or `stderr`
      to pass the corresponding stream sink.
- [ ] 2.4 Leave the 9 stdio calls outside the printer alone. They write to `stderr`
      unconditionally with no port behind them; converting them would widen the change for
      nothing. Confirm by inspection that this is still true after 2.1–2.3.
- [ ] 2.5 Verify no behavior moved: `make` and run `./run-all-tests.sh`. Every port, printer
      and error-diagnostic suite must pass with string ports still memstream-backed.

## 3. Convert the port-directed emitters

- [ ] 3.1 Rename `port_arg_stream` to `port_arg_sink` returning `sink *`, keeping the decode
      (record, field 0, fixnum, live handle) and its failure diagnostic byte-for-byte
      identical (design D5). Same for `port_arg_or_die` and `port_stream`.
- [ ] 3.2 Convert the four port-directed byte emitters — `rt_port_newline`,
      `rt_port_write_char`, `rt_write_string`, `rt_port_write_string` — to the sink
      operations.
- [ ] 3.3 Run `./run-all-tests.sh` again. This is the last point at which a failure is
      attributable to the conversion rather than to the storage change.

## 4. Make a string port a buffer

- [ ] 4.1 Replace `port_slot`'s `FILE *f` + `port_memstream_state *memstate` with the sink
      (design D2). A file port's sink has `f` set; a string port's has `buf` set.
- [ ] 4.2 Rewrite `rt_port_open_output_string` to allocate a buffer sink. No `open_memstream`
      call, so libc's stream list is never touched — this is the line that closes P21.
- [ ] 4.3 Rewrite `rt_port_get_output_string` to copy out of the buffer with
      `rt_make_string`. The flush disappears with the stream. It must still return `#f` for a
      handle that is not a string port, so the prelude can raise the proper error.
- [ ] 4.4 Update `rt_port_close` so a string port's close releases nothing and keeps the
      buffer reachable, and `rt_port_flush` so a string port flush is a deliberate no-op
      rather than an accident of a `NULL` check (design D3 and Open Questions).
- [ ] 4.5 Delete `port_memstream_state`, its `GC_MALLOC_UNCOLLECTABLE` allocation, and the
      comment block explaining why it had to be a separate process-lifetime allocation.
      Replace that comment with one recording that the runtime now owns the buffer, so the
      constraint no longer exists (design D2).
- [ ] 4.6 Update the port-table header comment: it currently states that a string port is a
      table slot backed by `open_memstream` and that this is what keeps `print_val` single.
      The second half stays true and the first is now wrong.

## 5. Verify

- [ ] 5.1 Run `./run-all-tests.sh` and report the actual output.
- [ ] 5.2 Run `./run-dev-tests.sh` and report the actual output, including the R7RS
      conformance suite and the string-port cases added by `stabilize-string-output-ports`
      (issue #113) — the retained-port-survives-table-growth case is the one this change
      most needs to keep passing.
- [ ] 5.3 Check embedded NULs and multi-byte UTF-8 explicitly through a string port, since
      the buffer arm replaces `fwrite` and Scheme strings may contain both (design, Risks).
- [ ] 5.4 Check a write far larger than the initial buffer capacity, per the spec's
      no-truncation scenario, so the doubling path is exercised rather than assumed.
- [ ] 5.5 Confirm `get-output-string` still works after `close-port`, and that a file port
      still reports an error for it.

## 6. Prove the defect is gone and nothing else moved

- [ ] 6.1 Add the scaling test (design D7): open tens of thousands of string ports without
      closing them, and assert a ratio bound against the same program closing each port,
      rather than an absolute wall-clock time. Put it in the dev suite.
- [ ] 6.2 Reproduce P21's table on the new runtime: 20,000 / 40,000 / 80,000 ports left open
      must track the "closed" column (~0.5 s, essentially process startup) rather than
      today's 0.68 / 1.19 / 7.09 s.
- [ ] 6.3 Measure the printer on an output-heavy benchmark, before and after. The `stdout`
      and file paths must be cost-neutral; a regression there is a reason to stop and
      reconsider D1 rather than to accept it.
- [ ] 6.4 Run `make regen` and confirm every `bootstrap/*.ll` comes back byte-identical
      (design D6). No Scheme source changed, so any difference is a defect. Note this is a
      check, not a rebuild requirement — `runtime.c` reaches the binaries through plain
      `make`.

## 7. Record the outcome

- [ ] 7.1 Tick P21 in `docs/PERFORMANCE.md` — both the status table and the item heading —
      fill its **OpenSpec change** field with `buffer-backed-string-ports`, and add the
      one-line note pointing at the archived change, per that file's "Maintaining this file"
      rules.
- [ ] 7.2 Update P21's prose so it reads as history rather than as a plan: the caller-side
      workaround is no longer the only mitigation, and the design it proposed is the one that
      landed. Note the two things the change removed as well as the cost it fixed — the
      `open_memstream` dependency and the never-freed buffer.
- [ ] 7.3 Check whether P14's note still reads correctly. P19 cross-references it for the
      remaining half of the quoted-symbol cost; this change touches neither, so the expected
      outcome is "no edit needed" — confirm rather than assume.
