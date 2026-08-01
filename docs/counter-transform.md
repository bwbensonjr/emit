# Transformation walkthrough: `demos/counter.scm`

Every stage of the pipeline applied to the most feature-dense demo. It exercises
the full pass chain at once:

- a captured variable mutated with `set!` (→ boxing)
- a closure returned from a closure (nested `lambda`, free-variable capture)
- `letrec` / `let` binding forms and a primitive call at the top level

Regenerate the IL stages with either door — they agree:

```sh
build/emit run --dump demos/counter.scm                                   # shipped
chez --libdirs src --script src/compile.ss demos/counter.scm -o /tmp/counter --dump
```

## Source

```scheme
(letrec ([make-counter (lambda ()
                         (let ([c 0])
                           (lambda () (set! c (+ c 1)) c)))])
  (let ([f (make-counter)])
    (+ (f) (f))))
```

`make-counter` returns a fresh closure over its own `c`. Each returned
counter increments and returns its private `c`. `(+ (f) (f))` calls the
one counter twice, so the program evaluates to `1 + 2 = 3`.

## Stages 1–2 — collect-toplevel, expand

Both are no-ops here: the program is a single expression with no top-level
`define`s to gather, and it uses no macros. Output is the source.

## Stage 3 — parse + alpha-rename + imports (`parse.ss`)

Surface syntax becomes the core IL, and every binding gets a unique
suffix (`make-counter.0`, `c.1`, `f.2`) so later passes never have to
worry about shadowing. Literals become `(const …)`, calls `(call …)`, and
the two-form `lambda` body folds into `(seq …)`.

`inline-primitives` runs in the same step: `+` is an *integrable* primitive and
this is a direct call at a known arity, so it becomes the raw op `%+` rather than
a call to `(scheme base)`'s `+`. Free identifiers that are **not** primitives
would be resolved here to their exporting unit's global (`parse+rename+imports`);
this program references none.

```scheme
(letrec ([make-counter.0 (lambda ()
                           (let ([c.1 (const 0)])
                             (lambda ()
                               (seq (set! c.1 (primcall %+ c.1 (const 1)))
                                    c.1))))])
  (let ([f.2 (call make-counter.0)])
    (primcall %+ (call f.2) (call f.2))))
```

## Stage 4 — recognize-let (`passes/recognize-let.ss`)

A no-op here: `let` was already explicit in the source, so there is
nothing for this pass to recover. (It matters for programs that write
`let` as an immediately-applied `lambda`.) Output is identical to Stage 3.

## Stage 5 — convert-assignments (`passes/convert-assignments.ss`)

`c.1` is mutated by `set!`, so it is heap-allocated in a **box**. The
original initializer is renamed to `c.1.3`, a new binding `c.1` holds
`(box c.1.3)`, reads become `(unbox c.1)`, and the `set!` becomes
`(set-box! c.1 …)`. After this pass no `set!` remains — mutation is just
primitive calls on a heap cell, which is what lets a closure share the
mutable variable.

Only bindings that are *really* mutated get a box (P7): `make-counter.0` and
`f.2` are left alone.

```scheme
(letrec ([make-counter.0 (lambda ()
                           (let ([c.1.3 (const 0)])
                             (let ([c.1 (primcall box c.1.3)])
                               (lambda ()
                                 (seq (primcall
                                        set-box!
                                        c.1
                                        (primcall
                                          %+
                                          (primcall unbox c.1)
                                          (const 1)))
                                      (primcall unbox c.1))))))])
  (let ([f.2 (call make-counter.0)])
    (primcall %+ (call f.2) (call f.2))))
```

## Stage 6 — simplify (`passes/simplify.ss`)

The ladder's only *optimizing* pass, and the most dramatic step in this
walkthrough: **`make-counter` disappears entirely.** It is a lambda binding
referenced exactly once, in operator position, at matching arity — so its body is
inlined into that one call site and the now-empty `letrec` is dropped. Constant
propagation then folds `c.1.3` away, leaving `(primcall box (const 0))` inline.

What survives is the essential program: allocate a box, close over it, call the
result twice.

```scheme
(let ([f.2 (let ([c.1 (primcall box (const 0))])
             (lambda ()
               (seq (primcall
                      set-box!
                      c.1
                      (primcall %+ (primcall unbox c.1) (const 1)))
                    (primcall unbox c.1))))])
  (primcall %+ (call f.2) (call f.2)))
```

## Stage 7 — convert-closures (`passes/convert-closures.ss`)

This pass turns a `letrec` group into an explicit `(closures …)` form naming each
lambda's free variables. Here it is a **no-op**: Stage 6 removed the only
`letrec`, so nothing is left for it to convert. Output is identical to Stage 6.

(In a program whose mutually-recursive group survives simplification, this is
where the group becomes data the lowering can consume — and where P5-B-general's
direct calls between siblings become possible.)

## Stage 8 — lambda-lift + lower (`passes/lower.ss`)

The final IL (`L-code`). The one remaining `lambda` is lifted to a top-level
`code` block taking an explicit closure pointer (`cp.5`). Free-variable
references become `(free-ref N)` — slot indices into the closure record — so the
counter reads its captured box as `(free-ref 0)`. The closure is built with
`(make-closure "code_4" ((local c.1)))`, capturing the box into slot 0. Calls
become `(app …)` and variable references are tagged `(local …)`.

Because the callee here is a `let`-bound value rather than a closure-block
binding, both calls stay `(app …)` — indirect. A statically-known callee would
lower to `(known-app label f …)` or, for a self-call, `(self-app label …)`.

```scheme
(program
  ((code "code_4" cp.5 () #f
     (seq (primcall
            set-box!
            (free-ref 0)
            (primcall %+ (primcall unbox (free-ref 0)) (const 1)))
          (primcall unbox (free-ref 0)))))
  (let ([f.2 (let ([c.1 (primcall box (const 0))])
               (make-closure "code_4" ((local c.1))))])
    (primcall %+ (app (local f.2) ()) (app (local f.2) ()))))
```

The `#f` in the `code` form is the rest-parameter name: this callee is
fixed-arity, so there is none.

## Stage 9 — emit LLVM IR (`emit.ss`)

L-code is rendered to textual LLVM. Notes on the mapping:

- Each `code` block is a `fastcc i64 @code_N(i64 %self, i64 %argc, i64 %a0 … i64
  %a7, ptr %overflow)` function — every Scheme function shares this one prototype
  so tail calls can be `musttail`. `%self` is the closure pointer. `K` is 8 here
  (the modular path pins it, so closures cross unit boundaries safely).
- **Entry arity check**: `icmp eq i64 %argc, 0` and a branch to `rt_arity_error`
  on mismatch, so a wrong-arity call traps instead of miscomputing.
- `(free-ref 0)` is `%self & -8` (strip the `100` closure tag) →
  `inttoptr` → `getelementptr i64, ptr, i64 1` (skip the code pointer) →
  `load`. Slot 0 lives at record index 1 because index 0 is the code pointer.
- `(make-closure …)` allocates via `rt_alloc_words` — declared to return an
  `align 8 ptr`, which is what lets `-O2` see that masking a fresh object's tag
  recovers the pointer it was built from (P6-B) — stores the code pointer then
  each captured value, and tags the result with `or …, 4`.
- `(primcall %+ …)` gets an **inline fixnum fast path** (P5-A): a tag test
  (`or` the operands, `and 7`, `icmp eq 0`) branching to a native `add`, with the
  `rt_add` call kept on the slow path and a `phi` merging them. `(const 1)` is
  the raw tagged word `8` (`1 << 3`).
- Box operations still dispatch to the C runtime (`rt_box`, `rt_unbox`,
  `rt_set_box`).
- `@scheme_entry` (plain `ccc`, called from C `main`) first calls
  `@"scheme.base:__init"` to initialize the auto-imported standard library, then
  builds the counter closure and calls it twice.

The full module also declares ~100 `rt_*` primitives and every `(scheme base)`
export it might reference as an `external global`; both are elided below. This
program reaches none of them, which is why the AOT tree-shake reports
`0 exports reached` and links a `(scheme base)` unit containing nothing.

```llvm
declare align 8 ptr @rt_alloc_words(i64)
declare i64 @rt_box(i64)
declare i64 @rt_unbox(i64)
declare i64 @rt_set_box(i64, i64)
declare i64 @rt_add(i64, i64)
declare void @rt_arity_error(i64, i64)
; … ~95 more rt_* declarations, and the scheme.base:* external globals, elided
declare i64 @"scheme.base:__init"()

define fastcc i64 @code_4(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1 = icmp eq i64 %argc, 0
  br i1 %t1, label %argok2, label %arityerr1
arityerr1:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok2:
  %t2 = and i64 %self, -8
  %t3 = inttoptr i64 %t2 to ptr
  %t4 = getelementptr i64, ptr %t3, i64 1
  %t5 = load i64, ptr %t4
  %t6 = and i64 %self, -8
  %t7 = inttoptr i64 %t6 to ptr
  %t8 = getelementptr i64, ptr %t7, i64 1
  %t9 = load i64, ptr %t8
  %t10 = call i64 @rt_unbox(i64 %t9)
  %t11 = or i64 %t10, 8
  %t12 = and i64 %t11, 7
  %t13 = icmp eq i64 %t12, 0
  br i1 %t13, label %fixfast3, label %fixslow4
fixfast3:
  %t14 = add i64 %t10, 8
  br label %fixmerge5
fixslow4:
  %t15 = call i64 @rt_add(i64 %t10, i64 8)
  br label %fixmerge5
fixmerge5:
  %t16 = phi i64 [ %t14, %fixfast3 ], [ %t15, %fixslow4 ]
  %t17 = call i64 @rt_set_box(i64 %t5, i64 %t16)
  %t18 = and i64 %self, -8
  %t19 = inttoptr i64 %t18 to ptr
  %t20 = getelementptr i64, ptr %t19, i64 1
  %t21 = load i64, ptr %t20
  %t22 = call i64 @rt_unbox(i64 %t21)
  ret i64 %t22
}

define i64 @scheme_entry() {
entry:
  call i64 @"scheme.base:__init"()
  %t23 = call i64 @rt_box(i64 0)
  %t24 = call ptr @rt_alloc_words(i64 2)
  %t25 = ptrtoint ptr %t24 to i64
  store i64 ptrtoint (ptr @code_4 to i64), ptr %t24
  %t26 = getelementptr i64, ptr %t24, i64 1
  store i64 %t23, ptr %t26
  %t27 = or i64 %t25, 4
  %t28 = and i64 %t27, -8
  %t29 = inttoptr i64 %t28 to ptr
  %t30 = load i64, ptr %t29
  %t31 = inttoptr i64 %t30 to ptr
  %t32 = call fastcc i64%t31(i64 %t27, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t33 = and i64 %t27, -8
  %t34 = inttoptr i64 %t33 to ptr
  %t35 = load i64, ptr %t34
  %t36 = inttoptr i64 %t35 to ptr
  %t37 = call fastcc i64%t36(i64 %t27, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t38 = or i64 %t32, %t37
  %t39 = and i64 %t38, 7
  %t40 = icmp eq i64 %t39, 0
  br i1 %t40, label %fixfast6, label %fixslow7
fixfast6:
  %t41 = add i64 %t32, %t37
  br label %fixmerge8
fixslow7:
  %t42 = call i64 @rt_add(i64 %t32, i64 %t37)
  br label %fixmerge8
fixmerge8:
  %t43 = phi i64 [ %t41, %fixfast6 ], [ %t42, %fixslow7 ]
  ret i64 %t43
}
```

The module ends with an `@__apply0` trampoline — the arity-0 entry the runtime
uses to call a closure from C — which is emitted into every module.

## Result

```
$ build/emit run demos/counter.scm
3
```

`(f)` returns 1, the second `(f)` returns 2 (the shared box persists
between calls), and `(+ 1 2)` is `3`.
