## Why

Every indexed accessor in the runtime is **unchecked** (issue #70). An out-of-range index is not a
diagnostic: a read returns whatever is at the computed address, and a *write* stores into it. The
program continues and exits 0.

```console
$ emit run <<< '(display (vector-ref (vector 1 2 3) 5))'
()                              # a heap word read as a value; exit 0

$ cat ws.scm
(define a (vector 1 2 3))
(define b (vector 7 8 9))
(vector-set! a 5 999)
(display b)
$ emit run ws.scm
#(7 8 9)                        # exit 0; the store landed in some other heap word
```

A far write is not even a crash — index 4000000 is ~32 MB past the object and still silently lands
in mapped memory. `string-ref` at index 100000 and at -5 both return a character.

Two range errors are worse than silent. `(substring "abcdef" 4 1)` computes a **negative length**,
passes it to `rt_make_string` as a `size_t`, and dies:

```console
$ emit run <<< '(display (substring "abcdef" 4 1))'
GC Warning: Failed to expand heap by 18014398509481968 KiB
GC Warning: Out of Memory! Heap size: 8 MiB. Returning NULL!
                                # exit 139 -- a signal, from pure Scheme
```

and `(make-vector -1 0)` returns a vector whose length is `-1`.

R7RS says only that it *is an error* to supply an out-of-range index, so any behaviour conforms. But
the unchecked choice contradicts the stance this implementation already took next door.
`core-language` states that exact integer overflow "SHALL report the violation of the implementation
restriction and abort the computation via the runtime trap mechanism… It SHALL NOT produce a value
that is not the mathematically correct result." An out-of-bounds `vector-set!` is the same class and
strictly worse in consequence: overflow yields a wrong number, this yields a corrupted heap and a
wrong result arbitrarily far from the store, with the GC's invariants in the blast radius.

It also undercuts debugging the compiler itself, which is written in Scheme over vectors —
`src/parse.ss` keeps its environments in them — so an off-by-one in a compiler pass corrupts an
unrelated object instead of reporting. That is the hardest possible version of that bug to find, in
the codebase most exposed to it.

**This is not the stated unchecked-accessor decision.** `core-language` does record one, and
`manifest-empty-guards` cites it: the runtime "applies the SAME unchecked semantics it already applies
to any type confusion — e.g. `(car x)` for a non-pair `x`", and that requirement adds "This change
does NOT add type-checking to the pair accessors (that is a separate concern)." That decision is
about **type** confusion — an argument of the wrong type, where checking means a tag test on every
access. This change is about **bounds** on an argument of the right type, where the limit is a word
in the object's own header that the accessor is already touching. Different question, different cost,
and the type-confusion decision is left exactly as it stands.

Timing: `homebrew-tap-distribution` puts SemVer 0.1.0 on the accepted language. Turning an unchecked
access into a trap is the kind of tightening that is ordinary before a first tag and awkward after.

## What Changes

- **Every indexed accessor reports an out-of-range index** through the existing runtime trap
  mechanism, naming the procedure, the index, and the valid range — the shape the overflow
  diagnostics already use (`rt_fatalf`, `src/runtime/runtime.c:208`):
  - `vector-ref` / `vector-set!`
  - `bytevector-u8-ref` / `bytevector-u8-set!`
  - `string-ref` / `string-set!`
  - `substring`, whose `start` and `end` must each be in range **and** ordered `start <= end`
  - `record-ref` / `record-set!` — internal, but the same store
- **A negative size is rejected at construction**: `make-vector`, `make-bytevector`, and
  `make-string` report rather than producing an object with a negative length.
- **The check lands in the runtime, once per accessor**, not at call sites. None of these accessors
  is in the emitter's inline fast path — `inline-arith-table` (`src/emit.ss:624`) covers arithmetic
  only, and `%vector-ref` and friends lower to plain `rt_*` calls — so one guard per function covers
  every path, including a primitive used as a first-class value (`(apply vector-ref …)`), which
  `primitive-layer` guarantees reaches the same runtime function.
- **The diagnostic is a trap, not a raise**, matching the overflow precedent: it aborts the
  computation, and under the in-process runner it longjmps back to the host so a REPL session
  survives it rather than dying.
- **Tests pin each case**, including that the in-process runner and a standalone executable agree,
  and that the REPL survives a trap and evaluates the next form.

Not in scope: **type** checking on any accessor, including `car`/`cdr`. That is the standing
`core-language` decision named above, it is a different cost (a tag test on every access, on
arguments that are correctly typed in every working program), and re-opening it is a tower-wide
performance question rather than a bounds fix. A non-fixnum *index* is therefore still type
confusion and still unchecked — `(vector-ref v "x")` is out of scope here, and the requirement says
so rather than leaving it ambiguous.

## Capabilities

### New Capabilities

None. This adds a requirement alongside the existing "Exact integer overflow is a diagnostic, never a
wrapped value", which is the same restriction-reporting stance applied to a different limit.

### Modified Capabilities

- `core-language`: gains "Indexed access out of range is a diagnostic, never an unchecked access" —
  an out-of-range index or a negative allocation size SHALL abort via the runtime trap mechanism
  naming the procedure, index, and range, and SHALL NOT read or write the computed address. The
  requirement explicitly scopes itself to bounds on correctly-typed arguments, leaving the existing
  unchecked-type-confusion decision in force and stating that a later change may revisit it
  independently.

## Impact

- `src/runtime/runtime.c` — nine accessors and three constructors: `rt_vector_ref` (:1195),
  `rt_vector_set` (:1196), `rt_bytevector_u8_ref` (:1216), `rt_bytevector_u8_set` (:1217),
  `rt_record_ref` (:1315), `rt_record_set` (:1316), `rt_string_ref` (:651), `rt_string_set` (:718),
  `rt_substring` (:658), `rt_make_vector` (:1188), `rt_make_bytevector` (:1208),
  `rt_make_string_fill` (:699). Host C — reached by plain `make`, **no `make regen`**.
- No Scheme source changes, so `CORE_FLAT` is untouched and `bootstrap/*.ll` does not move. This is
  the rare correctness change that costs no regen cycle.
- **Performance**: the compiler's hot paths run on `vector-ref`/`vector-set!` (`src/parse.ss`
  environments) and `string-ref` (the reader). Each check is a compare against a header word the
  accessor already loads, but it is on a hot path and must be measured, not assumed. The measurement
  and its outcome belong in `docs/PERFORMANCE.md`.
- Tests — a suite covering each accessor's out-of-range read and write, negative indices, the
  `substring` ordering case, negative construction sizes, runner/executable agreement, and REPL
  survival.
- Fixes the reader's own instance only if `reader-input-termination` has not already landed it; that
  change fixes `rd-string`'s dangling-escape read directly and does not depend on this one.
