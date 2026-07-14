## Context

Today the language raises but cannot catch. `error` (prelude) → `%error-abort` →
`rt_error` (`runtime.c:544`) → `rt_trap` (`runtime.c:34`, a single `jmp_buf*`) →
`longjmp` or exit. The C++ hosts (`repl-host`, `scheme-run`) `setjmp` on `rt_trap` once, at
the outermost level, so a runtime trap is reported instead of killing the process. There is
no in-language way to intercept and recover — the one real catch site, the REPL's
recover-and-continue, lives in the Chez driver as an R6RS `(guard (e …) …)`
(`compile.ss:214`), which the archived `error-and-guard-conditions` (D2) deliberately kept
out of the language because batch self-hosting never catches.

`repl-embedded-incremental` moves that recovery into the compiled compiler, so catch must
become a language feature. We scope it to the **R7RS-small §6.11** subset that is reachable
without general continuations.

## Goals / Non-Goals

**Goals:**
- `guard`, `raise`, and R7RS `error` + error-objects: enough to express "try to compile a
  form; on error, recover and continue" in compiled Scheme.
- Reuse the existing `setjmp`/`longjmp` (`rt_trap`) machinery; conservative GC already makes
  non-local jumps safe (no frame unwinding needed).
- Stay R7RS-conformant for what is implemented, so this is a down-payment on §6.11, not a
  divergent hook.

**Non-Goals:**
- `with-exception-handler` and `raise-continuable` (faithful semantics require `call/cc`).
- `read-error?` / `file-error?`, general `call/cc`, the R6RS condition-type tower.
- Changing the observable abort behavior of *uncaught* errors.

## Decisions

### D1: A stack of one-shot upward escape frames, not `call/cc`

R7RS derives `guard` from `with-exception-handler` + `call/cc`. We have no `call/cc`, but
`guard` only ever escapes *upward* and never resumes into its body, so a one-shot
`setjmp`/`longjmp` escape suffices. Generalize `rt_trap` (one `jmp_buf*`) into a **stack of
escape frames**, each `{ jmp_buf env; val raised; }`:

- `%guard-enter` pushes a frame and `setjmp`s it; `%guard-leave` pops.
- `raise obj` / `error`: store `obj` in the **top** frame's `raised` slot and `longjmp`
  there; if the stack is empty, fall back to the current outermost behavior (host `rt_trap`,
  else abort) — so uncaught semantics are unchanged.

The C++ host's existing outermost `setjmp` becomes the bottom of this stack (frame 0), so
an uncaught in-language `raise` still lands in the host and the session survives.

*Alternative — implement `call/cc` first, then derive `guard` per R7RS*: cleaner and more
general, but `call/cc` over the `musttail`/`tailcc` calling convention is a large,
independent effort. The escape stack delivers `guard` now and is forward-compatible (a real
`call/cc` can later subsume it).

### D2: `guard` lowers to the escape primitive (a prelude/expander macro)

```scheme
(guard (e clause …) body …)
  ⇒
  (let ([%f (%guard-enter)])          ; push a frame; returns the frame handle
    (if (%guard-raised? %f)           ; did a raise longjmp back into this frame?
        (let ([e (%guard-object %f)])  ; the raised object
          (%guard-leave %f)
          (cond clause …
                [else (raise e)]))     ; no clause matched -> re-raise outward
        (let ([%v (begin body …)])     ; normal path
          (%guard-leave %f)
          %v)))
```

`%guard-enter`/`%guard-raised?`/`%guard-object`/`%guard-leave` are runtime primitives over
the frame stack (D1). Whether `guard` ships as a `syntax-rules` macro in the prelude or a
built-in expander form is an apply-time call; the prelude is preferred (it keeps the special
forms small), provided the macro can bind the fresh `%f`/`%v`/`e` hygienically — which the
current expander already does for macro-introduced identifiers.

*Note on `setjmp` + returned handle*: `%guard-enter` cannot itself both `setjmp` and return
a Scheme value across the convention safely; the practical shaping is a single runtime
primitive `%call-guarded(thunk)` that `setjmp`s internally and returns a tagged
`(ok . value)` / `(raised . object)` pair, with the macro destructuring that. D2's exact
primitive boundary is settled by a small spike (Risks).

### D3: R7RS `error` signature + error-objects

Adopt `(error message obj …)` — a string `message`, **no `who`** — producing a heap
**error-object**: a new extended header type `HDR_ERROR` holding `{ message-string,
irritant-list }`. Add `error-object?`, `error-object-message`, `error-object-irritants`.
`raise`ing an error-object that reaches the outermost trap renders it exactly as `error`
does today (message + irritants) and aborts / is caught by the host.

Internal compiler call sites currently use the R6RS `(error 'who "msg" irritant …)`. Migrate
each to `(error "who: msg" irritant …)` (folding `who` into the message string) — mechanical,
meaning-preserving, and it keeps existing diagnostics readable.

*Alternative — keep the `who` arg*: non-conformant, and the whole point is R7RS alignment.
Migrate.

### D4: Preserve uncaught behavior; only add a catch layer

An uncaught `raise`/`error` must still: under the REPL/`scheme-run` host, report and let the
session survive; standalone, exit non-zero. Because the host's `setjmp` is frame 0 of the D1
stack, this falls out for free — no host change beyond initializing the stack with its frame.

## Risks / Trade-offs

- **`setjmp`/`longjmp` across the tailcc convention** → the escape primitive must be a C
  runtime function that owns the `setjmp`; JIT'd Scheme calls into it and passes a thunk
  closure it invokes. A spike validates calling a Scheme thunk from the runtime and returning
  a tagged pair (the boundary in D2).
- **GC and non-local jumps** → conservative Boehm GC needs no unwinding; already relied on by
  `rt_trap`. New heap allocated in an abandoned `guard` body is simply collected later.
- **Frame-stack discipline on normal exit** → `%guard-leave` must pop on the normal path and
  on the caught path; a `guard` whose body itself escapes via an *outer* raise must not leave
  a stale frame. The single-primitive `%call-guarded` shaping (D2) makes enter/leave
  automatic, avoiding leaks.
- **Fixed point after the `error` migration** → re-run the triple test; error paths aren't
  exercised by a clean self-compile, but the changed message literals alter the compiler's
  own emitted error-call IR consistently across stages, so the fixed point should hold. Verify.
- **Nested `guard` + host trap interaction** → the host must install its frame as the bottom
  of the stack before running any code; document the initialization order in both hosts.

## Migration Plan

1. Runtime: add the escape-frame stack (generalize `rt_trap`), `HDR_ERROR` error-objects,
   `error-object?`/`-message`/`-irritants`, and `%call-guarded` (or the enter/raised/object/
   leave set per the D2 spike). `rt_error` builds and raises an error-object.
2. Prelude: R7RS `error`; `raise`; error-object accessors; the `guard` macro (D2).
3. Migrate internal `(error 'who …)` call sites to the R7RS signature (D3).
4. Host: initialize the frame stack with the outermost frame (both `repl-host` and
   `scheme-run`); confirm uncaught behavior unchanged (D4).
5. Verify: `guard` catches a `raise`d object and an `error` object; nested `guard`s;
   re-raise-when-no-clause; uncaught still aborts/survives; the self-hosting fixed point holds
   after migration.
6. **Rollback:** the escape stack degenerates to the old single-slot `rt_trap` if only
   frame 0 is used, so reverting the prelude/`guard` additions restores prior behavior.

## Open Questions

- **Exact escape-primitive boundary** (D2): one `%call-guarded(thunk)` returning a tagged
  pair, vs. an enter/setjmp/leave set — settle by spike.
- **`guard` home**: prelude `syntax-rules` macro vs. built-in expander form.
- **error-object printing**: how `rt_write` renders an error-object if a program prints one
  (vs. only rendering it on abort).
- **Depth bound** on the frame stack (fixed array vs. growable), and its interaction with the
  10M-iteration tail-call demos that never nest guards.
