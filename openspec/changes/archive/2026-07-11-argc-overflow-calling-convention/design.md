## Context

`src/emit.ss` emits one shared prototype for every Scheme function so `musttail` is legal
(LLVM requires matching caller/callee prototypes):

```
tailcc i64 @code_N(i64 %self, i64 %a0 … i64 %a{K-1})   ; K = whole-program max arity
```

- `emit-code-def` writes that `define`, binding params to `%a0..%a{n-1}`, `%self` = the
  closure pointer (free vars load from it).
- `emit-app` builds every call, padding the actual args to `K` with the literal `0`
  (`pad-args`). Used for both tail calls (`musttail call tailcc`) and `@scheme_entry`'s
  non-tail calls.

The calling-convention spike decided this must widen to carry an argument count and an
overflow pointer so variadic/rest/`apply` become expressible (see
`spike/calling-convention/RESULTS.md`). This change lays that ABI into the emitter.

## Goals / Non-Goals

**Goals:**
- Emit the decided uniform prototype
  `tailcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)` for every Scheme
  function, and pass `argc` + `overflow` at every call.
- Preserve `musttail`/bounded stack and **byte-identical observable behavior** across all
  three backends.
- Keep the change confined to `src/emit.ss`.

**Non-Goals:**
- Dotted rest parameters, variadic `lambda`, `apply`, arity checking — the features this
  ABI enables. Deferred to a follow-on change; here the callee side ignores `argc`/
  `overflow` and no call site produces overflow.
- Any frontend (`parse`/`lower`) or runtime change.
- Optimizing away `argc`/`overflow` when a program is entirely fixed-arity (they are inert
  but present, which is the point — the ABI is uniform for `musttail`).

## Decisions

### D1 — ABI migration first, features second (behavior-preserving)

Ship the prototype/plumbing change alone, proven behavior-preserving by
`demos/run-backends.sh` (every demo must give identical results across AOT/JIT/bitcode
before and after). Rationale: this is a cross-cutting codegen change to every function
signature and call site; separating the ABI migration from the language features means the
harness can assert "nothing changed" — the cleanest possible check for an ABI move. The
features then build additively on a correct, verified ABI. This mirrors landing the
backends before their consumers.

### D2 — Exact emitter changes

- **`emit-code-def`** — prototype becomes
  `define tailcc i64 @label(i64 %self, i64 %argc, i64 %a0 … i64 %a{K-1}, ptr %overflow)`.
  Param→`%aI` binding, `%self`, and the body are unchanged. `%argc`/`%overflow` are
  declared but unused (LLVM does not warn).
- **`emit-app`** — the call argument list becomes
  `i64 <fop>, i64 <argc>, i64 <a0> … i64 <a{K-1}>, ptr null`, where `<argc>` is the count
  of *actual* args (`(length aops)`, a constant), positional args are padded to `K` as
  today, and `overflow` is the literal `ptr null`. Both the `musttail call tailcc` (tail)
  and plain `call tailcc` (non-tail, from `@scheme_entry`) paths get the new shape from
  this one function.
- **Unchanged:** `*arity*`/`max-arity` (still `K`), `pad-args`, closure/`make-closure`/
  free-var loads, `rt-declarations`, and `@scheme_entry`'s own `ccc` signature.

### D3 — `musttail` stays legal

All Scheme functions share the one widened prototype, and indirect calls through the
closure code pointer are emitted with exactly that signature, so caller/callee prototypes
still match. `overflow` is passed as an explicit `ptr` (a heap pointer / null), never LLVM
`varargs` and never a caller `alloca`, so the `musttail` constraints continue to hold (as
the spike confirmed at 100e6 iterations).

### D4 — `argc` value convention

`argc` = number of actual arguments at the call (not padded `K`). Fixed-arity callees
ignore it. This is the value a future variadic callee will read to know how many of the
positional slots (and how much of `overflow`) are real, so emitting the true count now
keeps the follow-on additive.

## Risks / Trade-offs

- **Prototype mismatch breaking `musttail`** → Mitigation: one uniform prototype for all
  Scheme functions and all indirect calls; verified by the `countdown`/`namedloop` demos
  (10M tail iters) staying bounded-stack across all three backends.
- **"Nothing observable changed" makes the change look empty** → it is an ABI foundation
  by design; the value is a verified-correct convention for the features. The emitted-IR
  inspection (widened prototype + `argc`/`ptr null`) is the concrete artifact.
- **Backend divergence introduced by the new IR shape** → Mitigation: the 3-backend
  equivalence harness is the acceptance gate; any divergence fails it.
- **Inert `argc`/`overflow` drifting from the future features' expectations** → Mitigation:
  emit the *true* `argc` and a real `ptr null` overflow now (not placeholders), matching
  exactly what variadic callees/`apply` will consume.
