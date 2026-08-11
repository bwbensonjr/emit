# Compiler internals (`src/`)

This directory **is** the compiler. This document describes its internals: the
compilation pipeline and where each stage lives, the source-tree layout, the
runtime value representation, and the shared calling convention. It is a guide
for working *on* the compiler.

For everything outside that scope, see:

- **Usage, current status, and the language feature set** — the root `README.md`.
- **The pass framework** (how stages are structured and dumped) — `../docs/PIPELINE.md`.
- **Modules, artifacts, and the four doors** — `../docs/MODULES.md`.
- **IR conventions** (opaque pointers, calling convention, `musttail`) — `../LLVM.md`.
- **Toolchain dependencies** (LLVM, libgc; Chez only for verification) — `TOOLCHAIN.md`.

## Pipeline

`core.ss` is the compiler: source forms (or text) in, textual LLVM IR out, run
through a sequence of hand-rolled `match` passes. It performs **no** file,
subprocess, or port I/O — that is what makes it self-hostable — so a *driver*
owns every effect and calls into it. Each stage is an observable intermediate
language, printable with `--dump`:

```
read source text                                             (driver)
  -> collect-toplevel   (gather top-level defines)            parse.ss
  -> expand             (syntax-rules macros, fixpoint)       passes/expand.ss
  -> parse + alpha-rename + resolve imports                   parse.ss
  -> recognize-let                                            passes/recognize-let.ss
  -> convert-assignments  (set! -> boxes)                     passes/convert-assignments.ss
  -> simplify             (inline / fold / drop; the one optimizer) passes/simplify.ss
  -> convert-closures     (letrec / lambda -> closures)       passes/convert-closures.ss
  -> lambda-lift + lower  (-> L-code)                         passes/lower.ss
  -> emit LLVM IR                                             emit.ss
  -> link / JIT / deliver                                     (driver)
```

The `--dump` stages, in order, are `collect-toplevel`, `expand`, `parse+rename`
(`parse+rename+imports` on the modular path — the one every shipped door takes),
`recognize-let`, `convert-assignments`, `simplify`, `convert-closures`, and `lower`.

There is **no prelude prepend**: the standard library is the auto-imported module
`(scheme base)`, compiled from `prelude.scm` to its own unit and linked or loaded
alongside the program (`../docs/MODULES.md`). Only its derived-form macros are
merged at expand time.

### Two drivers, one core

- **`build/emit`** (`emit.cpp`) is the shipped, user-facing driver — verbs
  `run`, `repl`, `build`, `lib`. It A-links the compiler's *own* compiled IR and
  calls into it in process, so the REPL and the batch compiler share one core.
- **`compile.ss`** is the Chez-hosted driver: a second, independent host over the
  same flat sources, used by the Chez-gated suites to cross-check the self-hosted
  compiler, and the owner of the tree-shaking AOT ship path. Not needed to build
  or use the compiler.

Both deliver native executables; what only the Chez driver has is the three-way
*backend* selection — AOT, JIT (`lli`), bitcode — over one emitted artifact set,
which is what `demos/run-backends.sh` uses to assert the three agree. See
`../LLVM.md` for the backend details.

## Layout

The Scheme sources are **flat** — bare top-level `define`s, no `(library ...)`
wrapper — so the same files can be concatenated into one program the compiler
compiles (`CORE_FLAT` in `tools/regen.sh`) *and* `include`d by the Chez driver.
There is one live source, not two.

```
core.ss            THE COMPILER: forms/text -> IR text; no file or port I/O
parse.ss           source -> core IL, alpha-rename, import resolution
passes/            one pass per file (expand, recognize-let,
                     convert-assignments, simplify, convert-closures, lower)
emit.ss            L-code -> textual LLVM IR (opaque ptrs, fastcc, musttail)
repl-core.ss       interactive session state; assembled into the REPL compiler only
dump.ss            the --dump stage dumper (%-ops; not linked by the Chez driver)
prelude.scm        standard library; the source of the (scheme base) module
prelude-surface.scm  which prelude defines (scheme base) EXPORTS (issue #29)
util.scm           set ops, deterministic fresh names, unit-qualified mangling
match.scm          vendored match macro (from akeep/scheme-to-llvm)

entry-schemec.scm  entry: batch text->IR filter          -> bootstrap/schemec.ll
entry-embed.scm    entry: embedded batch compiler        -> bootstrap/embed.ll
entry-repl.scm     entry: mode-dispatched REPL compiler  -> bootstrap/embed-repl.ll

emit.cpp           the shipped driver build/emit: run/repl/build/lib (`make`)
run-boot.cpp       minimal batch host used only by `make regen`
runtime/runtime.c  C runtime: tagged values, primitives, libgc, printer, main
compile.ss         the Chez-hosted verification driver (see above)
```

## Value representation

One 64-bit tagged word, shared verbatim between `emit.ss` and `runtime.c`. The
low 3 bits are the tag; a heap object's type is encoded in its pointer tag, so
heap objects carry no header word. All 8 tags are assigned:

| tag | value | kind    | representation |
|-----|-------|---------|----------------|
| 000 | 0 | fixnum  | immediate, payload = `n << 3` (signed) |
| 001 | 1 / 257 / 17 | misc-imm | immediate family; a 5-bit subtype (bits 3–7) selects boolean (`#f` = 1, `#t` = 257), character (payload bits 8+ = Unicode codepoint), or the unspecified value (17); further subtypes reserved |
| 010 | 2 | nil     | immediate, `()` = 2 |
| 011 | 3 | pair    | heap `{car, cdr}` |
| 100 | 4 | closure | heap `{code_ptr, free0, ...}`, called indirectly |
| 101 | 5 | box     | heap `{value}`, for assignment-converted vars |
| 110 | 6 | symbol  | heap `{name}`, interned (`eq?` / `eqv?` by identity) |
| 111 | 7 | ext     | extended heap object; first word is a header code |

Tags 0–6 are exhausted, so further heap types live under `ext` (tag 7) and are
discriminated by a header code in their first word. `runtime.c` is the source of
truth for this table (`#define HDR_*`):

| header code | kind      | layout |
|-------------|-----------|--------|
| 0 (`HDR_STRING`) | string    | `{hdr, byte-length, char *bytes}` — UTF-8, explicit length |
| 1 (`HDR_BYTEVECTOR`) | bytevector | `{hdr, byte-length, uchar *bytes}` — mutable, packed bytes (reclaims the retired `HDR_CHAR` slot) |
| 2 (`HDR_VECTOR`) | vector    | `{hdr, length, elem0, …}` — mutable, fixed-length |
| 3 (`HDR_ERROR`) | error object | `{hdr, message-string, irritants-list}` — R7RS error object |
| 4 (`HDR_HASHTABLE`) | hash table | `{hdr, spine}` — opaque wrapper around a mutable spine `#(count buckets _)`; ops in the prelude |
| 5 (`HDR_RECORD`) | record | `{hdr, type-descriptor, field-count, field0, …}` — user record; descriptor identity gives disjoint types. The field count exists only so `record-ref`/`record-set!` can be bounds-checked (change: checked-indexed-access) |
| 6 (`HDR_RECORD_TYPE`) | record type | `{hdr, name-string}` — a per-type descriptor token (identity distinguishes types) |
| 7 (`HDR_MV`) | multiple values | `{hdr, values-list}` — a `(values …)` bundle |
| 8 (`HDR_FLONUM`) | flonum | `{hdr, double}` — an inexact real |

## Calling convention

Every Scheme function shares ONE prototype, so tail calls can be marked
`musttail` (LLVM requires matching caller/callee prototypes):

```
fastcc i64 (i64 self, i64 argc, i64 a0 ... i64 a{K-1}, ptr overflow)
```

The CC is `fastcc`, not `tailcc` (change: `fix-high-arity-call-convention`): a
non-tail `call tailcc` with a stack-passed argument does not preserve the
caller's live arguments, while `fastcc` does — and `fastcc` still guarantees
`musttail`, which is what the tail calls need. See the header of `emit.ss`.

`K` is the shared closure arity. On the single-module path it is the
whole-program maximum fixed arity; on the **modular** path — the one every
shipped door takes, where closures built by one unit are called from another —
it is pinned to a fixed 8, so the prototype agrees across separately-emitted
modules. `self` is the called closure
(arg 0), from which free variables are loaded. `argc` is the actual argument
count: the first `K` arguments ride in the positional slots (padded with 0 when
fewer), and any excess spills through the `overflow` vector (null when there is
none). A fixed-arity callee checks `argc == f`; a variadic callee (`argc >= f`)
rebuilds its rest list from the positional excess plus `overflow`. Tail calls
are emitted `musttail`; `@scheme_entry` is `ccc` (called from C `main`) and its
calls are regular, not tail.
