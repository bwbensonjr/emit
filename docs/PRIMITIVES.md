# The Primitive Layer

How Emit exposes its built-in operations — `cons`, `+`, `car`, `vector-ref`, `display`, … —
and how the compiler turns each one into either a bare machine primitive or a real
first-class procedure, *per occurrence*, depending on how it is used.

This is the reworked design shipped in the `first-class-primitives` change (archived under
`openspec/changes/archive/2026-07-18-first-class-primitives/`). It replaced an older model in
which primitive names were reserved keywords with a short hand-maintained "eta list" of the
few that could also be used as values. `PIPELINE.md` covers the whole frontend pass ladder;
this document zooms in on the one pass and two tables that make primitives what they are.

---

## The one-sentence version

> **Every standard primitive is an ordinary, shadowable procedure that is available
> everywhere — and a shadow-aware compiler pass recovers bare-metal codegen whenever you
> call one directly without having redefined it.**

Three properties fall out of that, and the rest of this document is how each is realized:

- **Universal** — a primitive works in a top-level program, in a user `define-library` that
  does *not* import `(scheme base)`, and in a `--no-prelude` build. No import, no linked
  "primitive library," no special environment.
- **Shadowable** — `(define (cons a b) …)`, a `let`-bound `+`, or a `(set! car …)` wins over
  the primitive, exactly as it would for any user procedure. User-wins, always.
- **First-class** — `(map cons xs ys)`, `(apply + ns)`, `(fold-left * 1 ns)` all work; a
  primitive passed by value becomes a genuine closure. There is no curated list of "which
  primitives may be values" — *all* of them may.

And two properties keep it honest as an implementation choice, not just an ergonomic one:

- **Codegen unchanged in the common case** — the overwhelmingly common shape, a direct
  unshadowed call like `(+ a b)` or `(cons x y)`, compiles to the *same* IR as before:
  inline `add` / a bare `@rt_cons`. Binary size and hot-path speed do not regress.
- **Dev→ship fidelity** — the REPL and the AOT build run the *same* pass and make *identical*
  inlining decisions, because they share one compiler core.

---

## Three layers, one floor

```
  ┌─ (scheme base)  — optional library ─────────────────────────────┐
  │   list  map  append  fold-left  assq  cond/and/or/when … (macros)│   ← imported; shadowable
  └──────────────────────────────────────────────────────────────────┘
  ┌─ integrable primitives — the compiler-intrinsic FLOOR ───────────┐
  │   cons  +  car  vector-ref  string-length  display  string-append │   ← always present, shadowable
  │   (ordinary bindings; plain names; NOT reserved keywords)         │
  └──────────────────────────────────────────────────────────────────┘
  ┌─ raw %-primcalls — reserved, internal ───────────────────────────┐
  │   %cons  %add… (%+)  %car  %vector-ref  %display  %string-append   │   → lower directly to rt_*
  │   (reserved primcall heads; never user-facing; never a value)     │
  └──────────────────────────────────────────────────────────────────┘
```

- **Raw `%`-ops** (`%cons`, `%+`, `%car`, …) are the only reserved primcall heads left. They
  lower straight to runtime C entry points (`rt_cons`, `rt_add`, …) and never appear in a
  user program, never leak into LLVM IR as a `%`-name, and are never used as a value. Only
  compiler/host internals stay down here permanently (hashing, records, error plumbing, the
  host-flag probes `%no-prelude?` / `%dump-level`, the narration writer `%stderr-write`, the
  REPL-state ops).
- **The integrable floor** is the key idea. Each plain primitive name (`cons`, `+`, …) is an
  *ordinary shadowable binding* defined in terms of its raw `%`-op. It is **compiler-intrinsic**:
  the names are baked into the compiler's set of known bindings, not exported from any library,
  so they are present by construction in every build path. This is the "primitive layer," and
  it is *library zero* — below `(scheme base)`, not part of it.
- **`(scheme base)`** is the ordinary standard library (`list`, `map`, `append`, the
  `cond`/`and`/`or` derived-form macros, …). It is imported, optional, and skipped by
  `--no-prelude`. It sits *on top of* the primitive floor.

The critical distinction — and the finding that reshaped the design (see the archived spike) —
is that making primitives `(scheme base)` *exports* would make them **non-universal**: user
libraries don't import `(scheme base)`, and `--no-prelude` skips it, so both would lose their
primitives. The intrinsic floor avoids that entirely.

---

## How it's reflected in the compiler

Everything lives in three places: the two tables in `src/parse.ss`, the lowering table in
`src/emit.ss`, and the `inline-primitives` pass wired into every compile door in `src/core.ss`.

### 1. The tables — `src/parse.ss`

`*integrable*` is the list of plain names, each mapped to its raw `%`-op, its fixed arity, and
(for the variadic folding ops) a *fold kind*:

```scheme
(define *integrable*
  '((cons %cons 2)
    (+ %+ 2 sum) (- %- 2 diff) (* %* 2 product) (= %= 2 cmp) (< %< 2 cmp)
    (eq? %eq? 2) (eqv? %eqv? 2)
    (quotient %quotient 2) (remainder %remainder 2)
    (car %car 1) (cdr %cdr 1) (null? %null? 1) (pair? %pair? 1)
    (equal? %equal? 2) (not %not 1)
    (char->integer %char->integer 1) (integer->char %integer->char 1)
    (string-length %string-length 1) (string-ref %string-ref 2)
    ;; … 40-odd more …
    (display %display 1) (write %write 1) (newline %newline 0)
    (string-append %string-append 2 str)))
```

Each entry is `(name raw arity [fold-kind])`:

| field | meaning |
|-------|---------|
| `name` | the plain, shadowable source name the user writes (`cons`, `+`) |
| `raw`  | the reserved primcall head it inlines to (`%cons`, `%+`) |
| `arity` | the fixed arity for **direct-call** inlining (the expander has already reduced n-ary `(+ a b c)` to binary form, so `+` is arity 2 here) |
| `fold-kind` | *optional*; present only for ops that are variadic **as a value** — `sum`, `product`, `str`, `diff`, `cmp`. Drives the value-position eta (below). `eq?`/`eqv?` are binary in R7RS, so they have no fold kind. |

#### Several entries per name — optional arguments (change: `scheme-io-library`)

A name may appear **more than once**, one entry per accepted arity, and a direct call selects
the entry matching its argument count. That is how the output procedures got their optional
port without anything else moving:

```scheme
(display %display 1) (display %display-port 2)
(write %write 1)     (write %write-port 2)
(newline %newline 0) (newline %newline-port 1)
```

`(display x)` still inlines to the bare `%display` it always did — the emitted IR of a
port-free program is byte-identical — and `(display x p)` inlines to the bare `%display-port`.
**Neither form costs a closure call**, which is the point: expressing the optional argument as
a prelude wrapper would have put a `(scheme base)` procedure call on the path of every
`display` in every program, and made a port-free `hello.scm` link the port machinery.

Two rules keep this honest:

- **The base arity must come first.** A value-position reference (`(map display xs)`) etas the
  *first* entry for the name, so `display` as a value stays the one-argument procedure. A
  port-directed call must therefore be a direct call — the same narrowing every fixed-arity
  primitive already has here (`substring` is exactly 3 in Emit where R7RS allows 2).
- **Single-entry names are unaffected.** `integrable-lookup/arity` matches the one arity or
  returns `#f`, exactly as the old equality test on `(caddr entry)` did.

Where the port itself is decoded is a related decision: `%display-port` is handed the **port
record** and the runtime reads its handle out of field 0 (see `port_arg_stream` in
`src/runtime/runtime.c`). That is one documented coupling between the runtime and the port
record layout in `src/prelude.scm`, bought in exchange for the two-argument form staying a bare
primcall. The check is structural, so it is memory-safe for any argument; it does not prove the
record is a port.

`*prims*` is the companion list of the reserved raw `%`-ops (and the handful of permanently
internal ops). `prim?` and `integrable?` are the two predicates the resolver uses.

### 2. The lowering table — `src/emit.ss`

Each raw `%`-op maps to a runtime C entry point. `%cons → rt_cons`, `%display → rt_display`,
and so on. A second small table gives the arithmetic/comparison ops an *inline* fast path
(e.g. `%+ → add i64`) so `(+ 1 2)` emits a machine `add` rather than a call — that inline path
is why direct-call codegen is unchanged.

### 3. The resolver leaves the symbol alone — `src/parse.ss`

During alpha-renaming (`rename-program`), the resolver treats an integrable exactly like a raw
prim: it **leaves the bare source symbol in place**. A *shadow* — a lexical binding, a
top-level user `define`, or a `set!` — is alpha-renamed to a unique gensym like `cons.7`.

That renaming is the whole trick. After rename you can tell, with **no scope tracking at all**,
whether a given `cons` is the primitive or a shadow:

- bare `cons` (unrenamed) → the primitive
- `cons.7` (renamed) → a user binding that shadowed it

### 4. The pass that decides — `inline-primitives` (`src/parse.ss`)

A universal core→core pass, run **after** rename/resolve, on every occurrence:

```scheme
(define (inline-primitives e)
  (define (I e)
    (match e
      …
      ;; bare symbol in VALUE position → synthesize an eta lambda
      [,x (guard (symbol? x))
          (let ([p (integrable-lookup x)]) (if p (eta-integrable p) x))]
      ;; DIRECT CALL of the right arity → bare primcall
      [(call ,f . ,args)
       (let ([p (and (symbol? f) (integrable-lookup f))])
         (if (and p (= (length args) (caddr p)))
             `(primcall ,(cadr p) ,@(map I args))   ; (cons a b) → (primcall %cons a b)
             `(call ,(I f) ,@(map I args))))]       ; value / wrong-arity → falls to symbol case
      …)))
```

Three outcomes, keyed on the post-rename symbol:

| the occurrence | becomes | why |
|----------------|---------|-----|
| **direct call**, unshadowed, right arity — `(cons a b)` | `(primcall %cons a b)` → `rt_cons` | recover baseline codegen; the `%`-op never reaches LLVM as a name |
| **value / apply / wrong-arity** use of the bare symbol — `(map cons xs)` | an **eta lambda** `(lambda (p q) (primcall %cons p q))` | a genuine, tree-shakeable closure |
| **shadowed** — the renamed `cons.7` | **left untouched** | it's an ordinary user binding; user wins |

Because the shadowed name was renamed away, the pass simply never matches it against the
table — shadowing is respected for free.

### 5. Value-position etas — fixed-arity vs. variadic folds

`eta-integrable` builds the closure for a value use:

- **Fixed-arity** ops get the obvious wrapper: `car` → `(lambda (p) (primcall %car p))`.
- **Variadic folding** ops (those with a fold kind) get a **self-contained rest-param fold
  built from raw primcalls** — crucially, *not* a call into a prelude helper. A rest-param
  lambda `(lambda gs …)` collects every argument into a list `gs`, which serves both
  `(map + xs ys)` (args passed individually) and `(apply + ns)` (a list) uniformly:

  | fold kind | ops | value-use semantics |
  |-----------|-----|---------------------|
  | `sum`     | `+` | left fold from `0` over `%+` |
  | `product` | `*` | left fold from `1` over `%*` |
  | `str`     | `string-append` | left fold from `""` over `%string-append` |
  | `diff`    | `-` | `(- a)` negates, `(- a b …)` subtracts left-to-right |
  | `cmp`     | `= <` | short-circuit pairwise chain (0/1 operand → `#t`) |
  | `cmp-rev` | `>` | the same chain over `%<` with the operands **swapped** |
  | `cmp-le`  | `<=` | the same chain, pairwise `(if (%< x y) #t (%= x y))` |
  | `cmp-ge`  | `>=` | the same chain, pairwise `(if (%< y x) #t (%= x y))` |

  Because these fold over *raw* `%`-ops, the synthesized closure has **no prelude dependency**
  and works identically under `--no-prelude`. This is what let `string-append` become
  fully first-class and shadowable, retiring the last parse-time special case.

#### Value-position-ONLY entries: arity `#f` (change: `numeric-conformance`)

`>`, `<=`, and `>=` own no raw primcall. In **operator** position they stay frontend rewrites
over `<`/`=` (`expand-compare`); what they needed was a *binding*, so that `(map > …)` and
`(apply >= …)` resolve instead of reporting an unbound variable — being listed in
`*integrable*` is what supplies one, since `(map car *integrable*)` feeds `compute-known` and
`*repl-known*`.

Their entries therefore carry **arity `#f`**, meaning *value position only*:

```scheme
(> %< #f cmp-rev) (<= %< #f cmp-le) (>= %< #f cmp-ge)
```

`integrable-lookup/arity` never matches an `#f` arity, so `inline-primitives` has **no
direct-call lowering available** for these names and a direct call falls through to the eta
(correct at any arity). That is the whole point of the marker rather than a convention: an
ordinary entry like `(> %< 2 cmp)` would let a surviving `(> a b)` lower to `(primcall %< a b)`
with the operands **silently reversed**. No such call survives expansion today, but that
invariant lives in a *different pass*, and the failure mode is a wrong answer rather than an
error.

The pairwise rule consequently exists in two representations, which must agree: `cmp-pair`
(`src/passes/expand.ss`) states it in **surface syntax** for operator position, and
`cmp-pair-il` (`src/parse.ss`) states it in **IL** for the eta. They cross-reference each
other; keep them in step.

### 6. Universality and the REPL — the "known" sets

Universality is achieved by making the integrable names **compiler-intrinsic knowledge**, not
imports:

- **Batch/AOT door** — `compute-known` in `src/core.ss` unions `(map car *integrable*)` into
  the set of known bindings, so the names are present in every program, every user library,
  and every `--no-prelude` build.
- **REPL door** — `init-session` in `src/repl-core.ss` unions the same `(map car *integrable*)`
  into `*repl-known*`. This mirrors the batch path and also serves macro hygiene: a macro
  template that mentions an integrable (e.g. `(syntax-rules () ((_ e) (+ e e)))`) must treat
  `+` as a *known* binding, or hygiene would rename it to `+.0` and leave it unbound.

`inline-primitives` itself runs in **every** door — `compile-forms`,
`compile-program-with-imports`, and `repl-lower-form` — right after rename/resolve. One pass,
every path: that is the mechanical reason dev and ship inline identically.

---

## Examples

### Direct call — baseline codegen, no closure

```scheme
(+ a b)          ; ⇒ inline  add i64  (never a call)
(cons x y)       ; ⇒ (primcall %cons x y) ⇒ @rt_cons
```

### As a value — a real procedure is synthesized

```scheme
(map cons xs ys) ; cons ⇒ (lambda (p q) (primcall %cons p q))
(apply + ns)     ; + ⇒ a self-contained rest-param sum-fold over %+
(fold-left * 1 ns)
(for-each display items)
```

### Shadowing — user always wins

```scheme
;; top-level redefinition
(define (cons a b) (list 'shadowed a b))
(cons 1 2)                       ; ⇒ (shadowed 1 2)

;; lexical binding
(let ((+ (lambda (a b) (* a b)))) ; a local "+" that multiplies
  (+ 3 4))                        ; ⇒ 12, not 7

;; even set! shadows
(set! car (lambda (p) 'nope))     ; the ordinary binding wins from here on
```

### Universal — no import needed

```scheme
;; a user library that does NOT import (scheme base)
(define-library (my lib)
  (export bump)
  (begin
    (define (bump x) (+ x 100))))  ; + resolves to the intrinsic floor — builds and runs
```

```
$ build/emit run --no-prelude prog.scm   # (cons 1 2) / (+ 1 2) still work: the floor is always present
```

---

## Adding a new integrable primitive

Because the raw `%`-op is a reserved primcall head that the *committed bootstrap seed* must
already recognize, adding a primitive is a **staged bootstrap** (design decision D3), not a
one-line table edit. The safe procedure:

1. **Emit lowering** — add `(%foo "rt_foo")` to the table in `src/emit.ss` (and the inline
   fast-path table too, if it's an arithmetic/comparison op).
2. **Reserve the `%`-name** — add `%foo` to `*prims*` in `src/parse.ss` and **regen** the
   bootstrap, so the committed seed learns `%foo` as a recognized primcall head.
3. **Make the plain name integrable** — add `(foo %foo <arity> [fold-kind])` to `*integrable*`
   and **regen** again.
4. **Verify** — `make && ./run-dev-tests.sh` (18/18), including the self-host fixed point and
   the trust-check (a second regen is a no-op).

### Adding a permanently-internal `%`-op

Same staging, minus step 3 — an internal op has no plain shadowable name, so it never enters
`*integrable*`. `emit-dump-stages` added two this way (`%dump-level`, `%stderr-write`):

1. **Stage 1, tables only** — the runtime C function, its `prim-table` entry and `declare`
   line in `src/emit.ss`, and the name in `*prims*` (`src/parse.ss`). Nothing *calls* it yet,
   so the current seed compiles all of it (it is data and string constants), and `make regen`
   produces a seed that knows the op. Expect the committed IR diff to include the new
   `declare` in every module — which changes every demo's emitted-IR hash, so
   `test/module-scaffold-baseline.sha256` must be re-recorded, with a before/after capture
   proving the drift is *only* those lines.
2. **Stage 2, call sites** — now the compiler's own source may use `(%foo …)`. Regen again.
3. **Verify** — the full dev suite at the end of *each* stage, and commit the regenerated
   `bootstrap/*.ll` at each stable stage. The trust-check *skips* while `bootstrap/` is dirty,
   so re-run it after committing to see it actually pass.

A caller-visible `%`-op also needs a home: if the compiler's own source calls it, that source
file cannot be in `compile.ss`'s `(include ...)` block, which Chez *evaluates* — an unbound
identifier there. `src/dump.ss` is the pattern: it rides `$CORE_FLAT` (compiled, never
evaluated) in `tools/regen.sh` and `test/self-host-fixpoint.sh`.

The D3 lesson recorded in the archived change: the "two regens per batch" rule is a *safe
upper bound*, not always required — when a batch only renames a primcall head to a `%`-synonym
that lowers to the same `rt_*`, one direct regen often converges. The fixed-point loop fails
loudly (no convergence in 5 iterations) if a jump is too big, at which point you insert the
stage-1 synonym regen. Try direct first.

If a new integrable is used inside macro templates, no extra work is needed: unioning
`(map car *integrable*)` into both known-sets (§6) covers it automatically.

---

## The I/O primitives (change: `scheme-io-library`)

The port surface is deliberately thin at the primitive layer: everything about *what a port
is* lives in `src/prelude.scm` as a record, and the primitives are only the edges where the
runtime must be involved.

**Integrable (plain, shadowable names):**

| name | arities | notes |
|---|---|---|
| `display` / `write` | 1, 2 | second argument is a textual output port |
| `newline` | 0, 1 | |
| `write-char` | 1, 2 | |
| `write-string` | 1, 2 | contents **literally** — no quotes, no escaping. `display` narrowed to strings, not `write` |
| `eof-object` | 0 | the singleton end-of-file object |
| `eof-object?` | 1 | an immediate tag test; safe on any value |

**Internal `%`-ops** (no plain name; the prelude's ports are built over them): `%read-file`,
`%port-open-output-file`, `%port-open-output-string`, `%port-get-output-string`, `%port-flush`,
`%port-close`, `%set-current-output!`, and the `%…-port` lowering targets of the table above.
`%file-exists?` and `%delete-file` (change: `catchable-errors-with-kinds`) join them with no port
record in front at all — a path string in, a boolean out — because the prelude is where a failure
becomes an error object and only the prelude knows the kind it should carry.

Three things are worth knowing about how these behave:

- **The eof object is misc-immediate subtype 3.** No header code, no allocation, and
  `eof-object?` is a tag+subtype test. R7RS requires it to be distinct from every other object,
  so it is *not* `#f`, `()`, or the unspecified value — a program that reads a `#f` datum can
  still tell that from end of input.
- **A live OS file is a small integer, never a pointer.** The runtime owns a `FILE *` table and
  Scheme holds an index, so a stale handle after `close-port` is a range check rather than a
  wild pointer. Handles 0 and 1 are reserved (stdout, stderr) and are never closed, so closing
  `(current-output-port)` cannot take the process's stdout with it.
- **Where a port-less `display` writes is indirect.** `(display x)` compiles to a bare
  `rt_display`, but R7RS requires it to follow `with-output-to-file` and `parameterize` on
  `current-output-port`. Both hold at once because the port-less entry points write to a
  runtime destination cell (`rt_current_out`) that the `current-output-port` parameter updates
  on every rebinding, including the restore leg. The emitted IR is unchanged; the cost is one
  global load per call.

### Two error channels, deliberately

Port errors come back two different ways, and the split is intentional:

- **Prelude-level errors are catchable R7RS error objects** — a nonexistent file, a closed
  port, `get-output-string` on a file port. `(guard (e (#t …)) (open-input-file "/nope"))`
  works.
- **A port-directed primitive handed a non-port aborts with a diagnostic**, exactly as
  `(+ 1 "a")` does. It is a primitive type error, not a condition; it is memory-safe and
  reports, but `guard` does not catch it.

### Documented limitation — input ports slurp at open

`open-input-file` reads the **whole file** at open time, which is what makes a file input port
and a string input port the same object and every input operation pure Scheme over the reader
that already exists (design D2). Two consequences you can actually hit:

- a source **larger than memory** cannot be read;
- input written to the source **after** the port is opened is never observed — so a port on an
  interactive stream sees only what was already there.

`(current-input-port)` softens the second case slightly: its text is pulled in on the *first
read*, not when the parameter is created, so a program that never reads stdin never blocks on
it. The port record is the seam to fix this behind if it ever bites — `read-char` and friends
all go through it, so refilling a buffer would be one accessor's business.

### Deliberate R7RS gaps

- **`char-ready?` is omitted.** Under slurp-on-open it would be `#t` for any port with input
  remaining: conformant, but carrying no information, and a predicate that always says "yes"
  invites programs to poll on it as though it distinguished something. It becomes meaningful
  only if input ports ever stream, which is where it belongs.
- **Binary ports are out of scope** (`read-u8`, `write-u8`, `open-input-bytevector`, …).
  Bytevectors exist, so this is feasible; a second port flavour just doubles the surface with
  no current payer. Textual only.
- **`(scheme file)` operations are a separate change** — `file-exists?`, `delete-file`, and
  directory operations. Adjacent, not included.
- **The input operations require their port argument.** R7RS lets it default to
  `(current-input-port)`; here `(read-char p)` is the only spelling.

---

## The numeric primitives (change: `numeric-conformance`)

Seventeen `%`-ops added in **one** staged bootstrap, for the three places R7RS §6.2 needs C.
None is integrable — every one is wrapped by Scheme, and that is deliberate.

| group | ops | wrapped by |
|---|---|---|
| classification | `%finite?` `%nan?` | `rational?` in the prelude; `finite?`/`nan?`/`infinite?` in `(scheme inexact)` |
| rounding | `%flo-floor` `%flo-ceiling` `%flo-truncate` `%flo-round` | `floor` `ceiling` `truncate` `round` in the prelude |
| libm | `%sqrt` `%exp` `%log` `%sin` `%cos` `%tan` `%asin` `%acos` `%atan` `%atan2` `%pow` | `(scheme inexact)`; `%pow` also serves the prelude's `expt` |

Three things worth knowing about them:

- **Why they are internal, not integrable.** An integrable name is universally available with
  no import. R7RS puts `sqrt`/`sin`/`log` behind `(import (scheme inexact))`, so making them
  integrable would put them in scope for every program — including one that wants to define
  its own `sqrt`. Wrapping is what keeps the surface honest; verified by the suite, where
  `sqrt` is an unbound variable without the import.
- **The rounding ops take the FLONUM arm only.** An exact integer is already rounded, so
  `(floor n)` returns it unchanged and never calls in. That is both the R7RS exactness rule and
  the reason `(floor 1e30)` does not raise an overflow: the inexact arm stays in `double`
  instead of routing a large magnitude through the fixnum range. `%flo-round` is `rint`
  (round-half-to-**even**); `floor(x + 0.5)` would get `2.5` and `0.49999999999999994` wrong.
- **Out-of-domain follows IEEE, not a trap.** `(sqrt -1.0)`, `(log -1.0)`, `(asin 2.0)` are
  NaN; `(log 0.0)` and `(exp 1000.0)` are infinities. Emit is real-only so no complex result is
  available, R7RS §6.2.3 permits the inexact non-finite answer, and a NaN stays testable with
  `nan?` where a trap — being uncatchable — would end the program.

**Cost, measured.** The `declare` header is emitted unconditionally for the whole prim table,
so these added +34 lines to every demo's IR (17 declares × the two headers per demo IR) whether
a program calls them or not. In a delivered `emit build` executable the C functions cost only
**+416 B** (LTO drops the unreferenced ones), but `build/schemec` grew **+17,744 B (+3.2%)**
because it links `runtime.c` without `-ffunction-sections`/`--gc-sections`. Recorded alongside
`docs/PERFORMANCE.md` P8.

---

## Known limitation — shadowed n-ary folding ops (task 4.3, deferred)

The n-ary → binary reduction for the folding ops (`+ - * = < string-append`) is done by the
**expander**, which runs *before* rename and therefore has **no shadow information**. It keys
on the head symbol unconditionally. So a **shadowed** folding op **called with 3+ args, or
with 0/1 args**, is folded as if it were the primitive:

```scheme
(let ((+ f)) (+ 1 2 3))  ; folds to (f (f 1 2) 3), not (f 1 2 3)
(let ((+ f)) (+))        ; folds to 0 (the identity), ignoring f
```

The **2-ary** shadowed case is correct — `(let ((+ f)) (+ 1 2))` → `(f 1 2)` — which is the
spec's shadowing scenario. The gap bites only when a user *both* rebinds one of these six ops
to a *non-associative* function *and* calls it at a non-binary arity — vanishingly rare, and an
associative custom `+` folds to the same result anyway.

The fix (task 4.3, if ever wanted) is to move the n-ary fold out of the expander and into the
shadow-aware `inline-primitives` pass, so it fires only on the unshadowed integrable. It was
rated low-value / moderate-risk and deliberately left as a separate future change. Every other
primitive — every fixed-arity op, and every value/`apply` use of the folding ops — shadows
correctly.

---

## Related documents

- `docs/PIPELINE.md` — the full frontend pass ladder; the `inline-primitives` entry there
  places this pass among its neighbors.
- `openspec/specs/primitive-layer/spec.md` — the normative requirements and scenarios.
- `openspec/specs/core-language/spec.md` — how "primitive" is defined for the core language.
- `openspec/changes/archive/2026-07-18-first-class-primitives/` — the design (`design.md`,
  including decisions D0–D4), proposal, and the batch-by-batch rollout record.
- `docs/MODULES.md` — how `(scheme base)` and user libraries are assembled on top of the floor.
