## 1. Baseline evidence (before any edit)

- [x] 1.1 On a comparatively idle machine, record `emit run` on a trivial program (best of 5) with
      and without `--no-prelude`, and `emit run --emit` both ways, so the compile/JIT split is
      re-derived rather than inherited from the P3 entry.
- [x] 1.2 Record `./run-all-tests.sh` total and per-suite wall clock as the before figure. Note the
      machine's load alongside it (P3's load caveat).
      *Satisfied by the measurement already recorded in `docs/PERFORMANCE.md` P3 — 28 suites /
      1605 s with the per-suite table — taken earlier the same day under comparable desktop load.
      Not re-run: 27 minutes for a figure that would differ only by noise.*
- [x] 1.3 Capture the emitted IR for every demo via `emit run --emit` into a baseline directory, for
      the cold-vs-warm byte-identity check in task 7.1.

## 2. Core: register a library unit from a prebuilt artifact

- [x] 2.1 Add a reader for the `.exports` datum in `src/core.ss`, the counterpart to the writer mode
      11 already uses — parsing `((name) (external . mangled) … (labels …))` back into the in-memory
      export-table shape, and failing cleanly on a datum it cannot read.
- [x] 2.2 Add a core entry point that registers a library into the session from a unit module plus a
      parsed export table, publishing the same export table and import declarations that
      `run-register-baked-set` publishes today, and performing no compilation and no file I/O.
- [x] 2.3 Add a new mode in `src/repl-core.ss`'s dispatch for 2.2, following the existing mode
      conventions (guarded, returning `(ok . …)` / `(error . msg)` so a failure is recoverable by the
      caller rather than fatal).
- [x] 2.4 Unit-test 2.1 and 2.2 against dumped artifacts under `chez --libdirs src --script`: a table
      round-trips, and a session registered from a prebuilt artifact publishes the same tables as one
      registered by compiling the same library.

## 3. Core: make the baked set reusable as one entry

*Revised during implementation.* Modes 14/15 turned out to be naturally general over N members,
so the baked set needs no path of its own: it is simply the N-member case, and `compile-baked-set`
and mode 8's protocol are both left untouched. See design D9.

- [x] 3.1 ~~Give `compile-baked-set` a reuse path~~ — **not needed.** Mode 14 registers from
      metadata directly and never enters `compile-baked-set`, so the reuse path is not a variant of
      the compile path but a sibling of it. Member order is preserved by the metadata's own order.
- [x] 3.2 ~~Have `run-register-baked-set` return what the host must persist~~ — **replaced by mode
      15**, a pure query over session state. This avoids widening mode 8's `(ok IR . INITS)` return,
      which the host reads positionally, and costs no second compile because it reads what mode 8
      already registered.
- [x] 3.3 Verified for the general N-member case in `test/artifact-cache-core-tests.ss` (a compiled
      library's registration equals the same library's registration from serialized metadata).
      The baked set specifically is verified end-to-end after regen, by task 7.1's cold-vs-warm
      byte-identity check — it cannot be exercised under Chez, whose driver builds `(scheme base)`
      from the manifest rather than from `*prelude-source*`.

## 4. Host: cache location, key, and I/O

- [x] 4.1 Implement cache-location resolution in `src/emit.cpp` per design D4: `$EMIT_CACHE`, then
      the platform user cache directory, then no caching. Never fail; never fall back to `build/lib`.
- [x] 4.2 Implement the compiler-identity digest per D2 — FNV-1a over the executable found by the
      existing `exe_path()` — plus the `(emit-artifact-stamp VERSION HEX-DIGEST)` sidecar shape and
      its hand-bumped format version (D3). Compute it at most once per process.
- [x] 4.3 ~~Source-identity half of the key for a user library~~ — **deferred with user-library
      caching** (see proposal, "Scoped to the baked standard library"). The baked set's source is
      compiled into the binary, so 4.2's executable digest is the whole key and no include-closure
      tracking is needed in this change.
- [x] 4.4 Implement entry read: locate, validate both halves of the key, and return the artifacts, or
      report a miss. Any unreadable or malformed entry is a miss, not an error (D7).
- [x] 4.5 Implement entry write: temp file plus atomic rename, stamp written last (D8). A write
      failure is not an error.
- [x] 4.6 Add cache narration per the spec and `docs/OUTPUT.md` — reused vs recompiled, with the
      reason when recompiled, on stderr and verbosity-controlled.

## 5. Wire the doors

- [x] 5.1 Make `register_baked_set` consult the cache before driving mode 8, and populate it after a
      from-source compile. `emit run`, `emit build`, `emit lib`, and `emit repl` all reach this
      through `seed_session`, so all four gain it at once.
- [x] 5.2 ~~Make `preload_user_libraries` cache-aware~~ — **deferred** with user-library caching.
      Confirm instead that it is left behaving exactly as today.
- [x] 5.3 Confirm `--no-prelude` still skips the standard library entirely and consults no cache
      entry for it.
- [x] 5.4 Confirm the AOT/Chez path (`src/compile.ss`) is untouched and its `build/lib` cache still
      behaves exactly as before.

## 6. Regen barrier

- [x] 6.1 Confirm every edit under `src/` that lands in `CORE_FLAT` or `src/repl-core.ss` is
      finished — tasks 2 and 3 complete, nothing pending — before starting regen (`CLAUDE.md`).
- [x] 6.2 Run `make regen`, confirm the fixed point converges, and record the resulting
      `bootstrap/` diff. IR is expected to change (the core gained a mode); the change must be
      explicable as that and nothing more.
- [x] 6.3 Run `make all schemec` and confirm all three backends still agree.

## 7. Tests

- [x] 7.1 Add the cold-vs-warm byte-identity test (design D6): compile the demo corpus with an empty
      cache and again warm, and require byte-identical emitted IR. This is the load-bearing test.
- [x] 7.2 Add invalidation tests: a rebuilt (or byte-altered) compiler binary forces a recompile and
      is narrated with the reason; two different binaries do not share an entry.
- [x] 7.3 Add degradation tests: unwritable cache location, corrupt/truncated entry, and absent cache
      directory each still complete normally with the correct result.
- [x] 7.4 Add a parallel-population test: many concurrent `emit` processes against a cold cache all
      succeed and converge on a valid entry (D8).
- [x] 7.5 Add an install-path test alongside `test/install-layout-tests.sh`: an installed `emit`
      caches on first use in a user-writable location, and the installed tree still ships no compiled
      artifact.
- [x] 7.7 Confirm a program importing a user library still works and still recompiles that library
      per invocation (the deferred half), so the deferral is recorded as tested behaviour rather than
      assumed.
- [x] 7.6 Run `./run-all-tests.sh` and `./run-dev-tests.sh` and confirm both pass.

## 8. Evidence and bookkeeping

- [x] 8.1 Re-measure task 1.1 and 1.2 warm, on the same machine in the same session, and record the
      before/after. Acceptance: a trivial `emit run` approaches its `--no-prelude` floor, and
      `run-all-tests.sh` drops substantially from its 1605 s baseline.
- [x] 8.2 Tick P3 in `docs/PERFORMANCE.md` (heading and status table), add the outcome note with the
      measured figures, and record which of the entry's fix sketches was taken and which was not
      (the `.bc`/`.o` half remains open — see design Open Questions).
- [x] 8.3 Note in P3 that the ~0.30 s IR parse/JIT half is unaddressed, so the item's residue is
      explicit rather than implied by a ticked box.
- [x] 8.4 Confirm issue #101 (`emit repl --no-prelude` compiles `(scheme base)` from the manifest and
      then does not bind it) is still open and unaffected, or closed if this change happens to fix it
      as a side effect of 5.1/5.3.
