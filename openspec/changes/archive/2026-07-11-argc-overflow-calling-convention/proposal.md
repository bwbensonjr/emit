## Why

The calling-convention spike (`spike/calling-convention/`, archived
`2026-07-11-calling-convention-spike`) decided the convention that will support dotted
rest parameters, variadic `lambda`, and `apply`: a single uniform prototype
`tailcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)`. Today `src/emit.ss`
still emits the fixed-arity prototype `tailcc i64 (i64 self, i64 a0 … i64 a{K-1})` and
pads with `0`. This change lays the decided convention into the emitter so the ABI is
ready for those features — done as a **behavior-preserving migration**, de-risked by the
3-backend equivalence harness, before any language feature builds on it.

## What Changes

- `src/emit.ss` emits the widened uniform prototype for every Scheme function:
  `tailcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)`.
- Every emitted call (tail and non-tail) passes `argc` = the number of actual arguments,
  the positional slots padded to `K` as today, and `overflow` = `ptr null`.
- `musttail` is preserved (the prototype stays uniform across all Scheme functions, so
  caller/callee signatures still match).
- **Behavior is unchanged.** All current programs are fixed-arity, so `argc` is inert and
  `overflow` is always null; every demo must produce byte-identical results across AOT,
  JIT, and bitcode before and after this change.
- **Scope is the ABI only.** Dotted rest parameters, variadic `lambda`, `apply`, and
  arity checking are **explicitly deferred** to a follow-on change; this change makes the
  emitted convention correct so that work is purely additive on the callee side.
- **No runtime change.** Runtime primitives use the C convention and are untouched.

## Capabilities

### New Capabilities
<!-- None: this implements an already-decided convention within existing codegen. -->

### Modified Capabilities
- `aot-codegen`: add a requirement that emitted Scheme functions use the decided
  `argc`+`overflow` uniform calling convention (widened prototype, `argc` and `overflow`
  threaded through every call), preserving guaranteed tail calls and observable behavior.

## Impact

- **Code (emitter only):**
  - `src/emit.ss` — `emit-code-def` (widened `define` prototype: add `%argc` and
    `%overflow`), `emit-app` (add `argc` and `ptr null` to every call's argument list).
    `*arity*`/`K` and closure/free-var handling are unchanged.
- **Unaffected:** `src/runtime/runtime.c` (C-convention prims), `src/parse.ss`,
  `src/passes/**` (frontend still produces fixed-arity lambdas), `@scheme_entry`'s `ccc`
  signature (only its internal calls pick up the new shape).
- **Verification:** `demos/run-tests.sh` (AOT) and `demos/run-backends.sh` (3-way
  equivalence) must stay green with identical values; emitted IR inspection confirms the
  widened prototype and `argc`/`ptr null` at call sites.
- **Unblocks (follow-on change):** dotted rest params, variadic `lambda`, `apply`, arity
  checking — all now additive on top of a correct ABI.
