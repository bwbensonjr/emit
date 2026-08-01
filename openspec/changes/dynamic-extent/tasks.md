## 1. Baselines and the open questions

- [ ] 1.1 Capture the size baseline (`hello.scm` and a demo through the AOT ship path, plus `build/lib/scheme.base.ll`) — `(scheme base)` grows here, and it cannot be reconstructed after the edit
- [ ] 1.2 Settle design's open question: what an `after` thunk that itself raises or escapes does. Pick a rule, write it into the spec delta as a scenario BEFORE implementing — it is emergent behaviour otherwise
- [ ] 1.3 Settle the `guard` reraise question: a non-matching `guard` clause reraises from the handler's wind depth, not the raise point; confirm the resulting `after` order against R7RS and pin it as a scenario

## 2. Runtime: escape frames with a liveness check (design D1)

- [ ] 2.1 Generalize `rt_guard_env` / `rt_guard_depth` in `src/runtime/runtime.c` to serve `guard` AND escape continuations from ONE frame stack — two stacks that must agree about depth would be a defect generator
- [ ] 2.2 Give each frame a monotonically increasing **generation id**, never reused, and carry an escape payload that is either a raised object or a returned value
- [ ] 2.3 Primitive to capture a frame (returning index + id) and one to escape to `(index, id)` with a value
- [ ] 2.4 **The liveness check** — escaping to a frame that is popped, or whose id no longer matches, raises `continuation invoked outside its extent`. This is what makes D1 incomplete-but-sound rather than undefined behaviour; it is the single most important line in the change
- [ ] 2.5 Confirm the id counter's width is not a practical wraparound risk (a recycled id would make the 2.4 check silently pass)
- [ ] 2.6 `RT_GUARD_MAX` becomes the shared nesting limit and stays a hard `rt_fatal`, not silent truncation

## 3. Primitive layer

- [ ] 3.1 Register the capture/escape primitives in `*prims*` (`src/parse.ss`) and their runtime mapping and externs (`src/emit.ss`)
- [ ] 3.2 Confirm `longjmp` across the `@__apply0` `ccc` trampoline is sound for the new escape path exactly as it already is for `guard` — same mechanism, so this is a check, not new ground

## 4. The wind list, in Scheme (design D2, D4)

- [ ] 4.1 A Scheme-side wind list of `(before . after)` pairs with the current depth, in `src/prelude.scm`. Keep the list even though nothing re-enters yet — full `call/cc` later adds a traversal instead of a redesign (design D2)
- [ ] 4.2 `dynamic-wind`: run `before`, push, run the body, pop and run `after` on the normal path
- [ ] 4.3 **Unwind BEFORE the longjmp** — the escaping side walks the wind list from the current depth down to the target's, running each `after` innermost-first on the still-live stack, and only then invokes the escape primitive. A `longjmp` cannot run intervening thunks; this is the correctness crux (design D4)
- [ ] 4.4 `call/cc` over the capture primitive: the continuation object is a one-argument procedure that unwinds per 4.3 and then escapes

## 5. `guard` / `raise` onto the shared machinery

- [ ] 5.1 Re-express `raise` so it unwinds the wind list before transferring, rather than longjmping directly — otherwise an `after` between the raise and the handler is skipped
- [ ] 5.2 Re-express `guard` over the shared frame stack, preserving its current specified behaviour exactly (clause selection, reraise, unhandled-raise rendering and exit status)
- [ ] 5.3 Keep the runtime's error path free of Scheme calls (design D4's rejected alternative) — the unwinding is Scheme-side, the runtime only transfers control

## 6. Parameter objects (design D3)

- [ ] 6.1 `make-parameter`: a closure over a box, with the optional converter applied to the initial value and to every bound value; callable with zero arguments per R7RS, so it is substitutable for a plain accessor
- [ ] 6.2 `parameterize` as a `syntax-rules` macro over `dynamic-wind` — `before` installs the converted value, `after` restores — so restoration on escape and on raise comes from task 4, not from separate code
- [ ] 6.3 Regenerate `lib/scheme/base.sld` (`tools/gen-scheme-base.ss`); `test/scheme-base-gen-check.sh` passes

## 7. Verification

- [ ] 7.1 Escape basics: `(+ 1 (call/cc (lambda (k) (+ 100 (k 41)))))` is 42; a non-invoked continuation returns normally; early exit from a fold
- [ ] 7.2 **The out-of-extent diagnostic actually fires** — store a continuation, let the `call/cc` return, invoke it, and assert the specific error. D5's whole argument is conditional on this, so it is a test and not an assertion
- [ ] 7.3 `dynamic-wind`: `after` on a normal return, on an escape crossing it, and on a raise crossing it; nested winds unwind innermost first
- [ ] 7.4 Parameters: read, `parameterize`, restoration after normal exit AND after an escape; the converter applied to both the initial and the bound value
- [ ] 7.5 **`guard` regression** — its existing behaviour is unchanged: clause selection, reraise, and the unhandled-raise rendering and non-zero exit. This is the part most likely to be broken by task 5, and it is already covered by existing suites, so run them deliberately rather than incidentally
- [ ] 7.6 The rule chosen in 1.2 (a raising `after` thunk) behaves as specified
- [ ] 7.7 All three doors agree — AOT, run, REPL — on an escape, a wind, and a parameterize
- [ ] 7.8 **Size:** re-measure 1.1 and report the `hello.scm` delta; an unused `dynamic-wind` should be pruned by the tree-shake, which must be measured rather than assumed
- [ ] 7.9 New suite registered in `run-all-tests.sh`; `./run-all-tests.sh` and `./run-dev-tests.sh` green
- [ ] 7.10 `make regen` reconverges and `test/trust-check.sh` passes on the commit; `bootstrap/scheme.base.ll` legitimately moves here, so confirm the compiler's own behaviour is unchanged (`self-emit-equiv`, `self-host-fixpoint`, `dump-parity`)

## 8. Close-out

- [ ] 8.1 Record the escape-only restriction where a user meets it: the R7RS conformance notes and `docs/` — not only in the design
- [ ] 8.2 Record the full-`call/cc` follow-up as an issue, carrying design D1's analysis while the evidence is fresh: CPS costs the direct-call optimizations and binary size; stack copying is more feasible here than usual because the calling convention holds no stack-interior pointers (overflow args use `rt_alloc_words`, closures are heap objects)
- [ ] 8.3 Revise `openspec/changes/scheme-io-library`: D4 is superseded, `current-*-port` become parameter objects, `with-output-to-file` / `with-input-from-file` move from Non-Goals into scope, and the provisional "not parameter objects" requirement comes out of its delta
- [ ] 8.4 Commit; note on the I/O change that it is unblocked
