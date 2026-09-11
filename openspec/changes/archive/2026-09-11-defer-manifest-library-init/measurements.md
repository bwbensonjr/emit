## P23 startup measurements

Machine: arm64 darwin, 8-core M-series. Method: `/usr/bin/time -p`, **best of five**, stdout and
stderr discarded, one trivial form (`(+ 1 2)`) on stdin, warm artifact cache throughout. The
`repl -> session` line comes from a separate `EMIT_VERBOSITY=verbose` run of the same invocation.

Two facts make the runs comparable across the change: every unit is a cache hit in both the before
and after states (so no figure includes a Scheme-level compile), and the JIT profile is the default
`-O1` in all of them.

### Before (`HEAD` = 5e89896, `build/emit` from that tree)

| invocation | wall | session line |
|---|---|---|
| `emit repl`, repo manifest | **2.20 s** | `12/12 modules, transform 137.8ms, materialize 2004.6ms` |
| `emit repl`, no manifest (empty dir) | 0.33 s | `3/3 modules, transform 55.5ms, materialize 228.8ms` |
| `emit repl --no-prelude`, repo manifest | 0.07 s | `2/2 modules` |

The 12 modules are the REPL prelude batch, the two baked members, and the nine manifest libraries
that are not baked. The 3-module row is the same session with the manifest's nine absent.

**Attribution.** Removing `(scheme char)` from the manifest (absolute-path copy, verified free of
`error:` lines) gives 0.39 s and `11/11 modules, materialize 259.0ms`. So of the 2.20 s:

| component | cost |
|---|---|
| `(scheme char)` — 4,061,923 B of IR, never imported by the session | **~1.82 s** |
| the other eight manifest libraries, together | ~0.05 s |
| the baked set's two `__init`s | ~0.27 s |
| floor (process start, session init, one form) | ~0.07 s |

### After (`build/emit` with the change, same machine, same method)

| invocation | before | after | delta |
|---|---|---|---|
| `emit repl`, repo manifest | 2.20 s | **0.42 s** | **-81%** |
| `emit repl`, no manifest (empty dir) | 0.33 s | 0.36 s | unchanged |
| `emit repl --no-prelude`, repo manifest | 0.07 s | 0.06 s | unchanged |

The session line is the clearer statement of what happened: `12/12 modules` became
**`3/12 modules`**. Twelve modules are still added to the JIT at startup; three are
materialized. ORC was always willing to defer the rest -- `run_init`'s symbol lookup was the
only thing forcing them.

**The work moved; it did not disappear.** A session that does import the outsized library pays
for it there:

| session | session line | wall |
|---|---|---|
| `(+ 1 2)` | `3/12 modules, materialize 244.0ms` | 0.42 s |
| `(import (scheme char))` then `(char-upcase #\a)` | `4/12 modules, materialize 2036.4ms` | ~2.2 s |

That is the honest shape of this fix: it removes the work a session never asked for. Work a
session does ask for is untouched, and is what P23's remaining fixes 2 and 3 address.

### Observability, before against after

Captured from the same scripted session (a define, a call, `(import (scheme char))`, a
`char-upcase`, a `cond`) at three verbosities and under both dump flags:

| surface | result |
|---|---|
| stdout, all five modes | **byte-identical** (11 B, md5 `7c2978a...`) |
| stderr, quiet | identical (63 B) |
| stderr, default | identical (97 B) |
| stderr, `--dump` | identical (2,660 B) |
| stderr, `--dump-all` | identical (2,686,855 B) |
| stderr, verbose | +30 B: one `initialize library scheme.char` line, and `15/15` -> `7/15` modules |

The `--dump-all` row is the one this comparison existed for: P3's cache regression printed 0
library stage headers instead of 1776 while every value stayed correct, and only a pre-existing
dump test caught it.

### Reproducing

```sh
# wall clock, best of five
for i in 1 2 3 4 5; do /usr/bin/time -p sh -c 'echo "(+ 1 2)" | build/emit repl >/dev/null 2>&1'; done

# where the time goes, per phase (deltas between narration lines)
echo '(+ 1 2)' | EMIT_VERBOSITY=verbose build/emit repl 2>&1 >/dev/null \
  | awk '{ cmd="date +%s.%N"; cmd | getline now; close(cmd);
           if (prev) printf "%7.0f ms  %s\n", (now-prev)*1000, $0; prev=now }'
```

A per-library experiment must rewrite the manifest's `(source ...)` paths to absolute before moving
the manifest: they resolve relative to the manifest, so a copy elsewhere silently loads nothing and
reports a fast session that is not the one being measured.
