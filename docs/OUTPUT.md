# Tool Output Convention

> The durable principle behind this doc: **every tool, script, and pipeline stage
> narrates what it is doing, names its inputs and outputs, and reports the metrics that
> make the work observable** — concise by default, quiet or verbose on request, and never
> at the expense of a tool's data output. The normative contract lives in
> `openspec/specs/tooling-observability/`; this page is the "how to write a conforming
> message" contributors actually read. (Origin: issue #3.)

## Message format

```
<verb> <input> -> <output>  [<metrics>]
```

- **verb** — a lowercase action word: `link`, `compile`, `emit`, `assemble`, `regen`,
  `run`, `stage`. First token of the line.
- **input -> output** — for a step that transforms one artifact into another, show the
  arrow. When a step has many inputs (e.g. a link with several objects), name the logical
  target instead of listing them all: `link emit -> build/emit`.
- **metrics** — a trailing clause with the numbers relevant to the action: byte sizes
  (`[12345 bytes]`), durations (`[1.2s]` or `[3s]`), counts (`iter 2`, `12/12 passed`).
  Metrics accompany the action they describe; they are not deferred to a distant summary.

Multi-stage tools that interleave output prefix their lines with a short tag so the
source stays attributable: `regen:`, `test:`, `stage`.

Examples:

```
link embed-repl.ll + scheme.base.ll -> build/emit  [987960 bytes]
emit demos/fact.scm -> /tmp/…/out.ll  [9021 bytes IR]
regen: assemble flat source (ordered cat; no Chez)  [0s]
   schemec fixed point reached (iter 2)
  [PASS] demo values (emit run) (3s)
```

## Stream discipline

- **Narration and status go to standard error.** Informational lines, step banners,
  progress, and metrics are all stderr.
- **Standard output carries only machine-consumable data.** For the filter tools —
  `emit run --emit` and `schemec` — stdout *is* the emitted LLVM IR, and the
  self-hosting fixed-point and self-emission-equivalence checks compare it byte-for-byte.
  Adding or changing narration MUST NOT alter one byte of stdout.
- A tool whose primary product is itself a human report (the test runners) may print that
  report to stdout; it produces no machine-data stream to protect.
- **Usage text goes where its reason sends it.** The same block has two destinations,
  chosen by *why* it was printed (change: emit-cli-front-door):
  - **Requested** — `emit --help`, `emit <verb> --help`/`-h`, `emit help [VERB]`. The text
    is the output the user asked for, so it goes to **stdout** and the exit is **0**. This
    is what makes `emit --help | head` and `emit run --help | less` work without
    redirection; a `--help` that writes to stderr is a `--help` that cannot be piped.
  - **Diagnostic** — usage shown because the command was malformed (no verb, unknown verb,
    unknown option, missing required argument). It is narration accompanying an error, so
    it stays on **stderr** with a **non-zero** exit, and stdout stays empty.

  This is not an inconsistency; it is the rule above applied correctly. Relatedly, every
  door MUST reject an option it does not recognize, naming the door and the option, and
  exit non-zero — a flag that is silently ignored reports success for work not done.

## Verbosity

One control, three levels, read uniformly from the environment variable
`EMIT_VERBOSITY` (unset = `default`):

| level     | value                | shows                                              |
|-----------|----------------------|----------------------------------------------------|
| `quiet`   | `quiet` / `q` / `0`  | errors and data output only — no narration         |
| `default` | unset / anything     | principal actions + headline metrics (concise)     |
| `verbose` | `verbose` / `v` / `2`| per-stage and per-metric detail                    |

Tools that parse their own argv also accept `-q` / `-v` as front-ends to the same
levels. The default is informative enough to follow the work without flooding the
terminal with per-item detail.

```sh
EMIT_VERBOSITY=quiet   make            # errors only
make                                   # concise (default)
EMIT_VERBOSITY=verbose make regen      # per-step timing and detail
```

## Stage dumps (`--dump`)

Per-pass intermediate-language inspection is a fourth, *orthogonal* level of detail: it
is a debugging request, not narration, so an explicit `--dump` outranks the verbosity
level (including `quiet`) — the same precedence the Chez driver has always had.

| flag / variable          | shows                                                         |
|--------------------------|---------------------------------------------------------------|
| `--dump`                 | the IL after each pass, for the unit under inspection         |
| `--dump-all`             | `--dump`, plus `(scheme base)` and imported library units      |
| `EMIT_VERBOSITY=verbose` | pass *names* only (`  stage lower`), no IL                     |

Every door of the shipped binary accepts both flags — `emit run`, `emit build`,
`emit lib`, `emit repl` — as does the Chez driver (`--dump`). All dump output is
**stderr**, so it cannot perturb a door's stdout: `emit run --emit --dump` writes the
same IR bytes as `emit run --emit`, which is what keeps `make regen` and the trust-check
safe. `test/dump-stages-tests.sh` asserts that byte-for-byte.

Mechanism: the host computes a single level and forwards it to the embedded compiler in
`EMIT_DUMP_LEVEL` (`0` off, `1` names only, `2` full dump, `3` + library units), which the
compiler probes via the `%dump-level` primitive and narrates through `%stderr-write`. Tools
without an argument parser therefore use the variable directly:

```sh
build/emit run --dump prog.scm            # or: EMIT_DUMP_LEVEL=2 build/emit run prog.scm
EMIT_DUMP_LEVEL=2 build/schemec < prog.scm > prog.ll    # the filter has no flags
```

Stages that run once per top-level form (the REPL's, and each of a library's defines) tag
their header with that form: `;; ==== after convert-closures [define fact] ====`, plus
`[unit (scheme base)]` under `--dump-all`.

## Implementing a conforming tool

- **Bash scripts** — source `tools/log.sh` (after `cd`-ing to the repo root) and use its
  helpers: `say` (default-level line), `vsay` (verbose-only line), and `bytes <file>`
  (byte count for a metrics clause). Time steps with the shell's built-in `SECONDS` or a
  `date +%s` delta — no external dependency.
- **Makefile recipes** — source `tools/log.sh` in the recipe line, then `say`.
- **The Chez driver (`compile.ss`)** — reads `EMIT_VERBOSITY` (and `-q`/`-v`); stage
  announcements are gated to `verbose`, and `--dump` additionally pretty-prints the full
  intermediate form after each pass.
- **The embedded compiler (the shipped doors)** — narrates through `%stderr-write`, never
  `%display`/`%write` (those are stdout, where the IR payload lives). It reads no
  environment itself: the *entry* builds the dumper from `(%dump-level)` and passes it down
  the core's `dump` parameter, so `src/core.ss` stays port-free and effect-free.

## Reviewer checklist

- [ ] Every file read/write, link, and compile is announced (unless `quiet`).
- [ ] Transforms use the `input -> output` arrow.
- [ ] Produced binaries/IR report their byte size; non-trivial steps report duration.
- [ ] All narration is on stderr; no tool's stdout data changed.
- [ ] `--help` is accepted, prints on stdout, and exits 0; usage shown after an error
      stays on stderr and exits non-zero.
- [ ] Unrecognized options are rejected by name, never ignored.
- [ ] The tool is quiet under `EMIT_VERBOSITY=quiet` and detailed under `verbose`.
