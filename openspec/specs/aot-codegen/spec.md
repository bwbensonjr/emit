# aot-codegen Specification

## Purpose

Defines the ahead-of-time code generation backend: lowering the lambda-lifted core IL to
textual LLVM IR, linking it into a native executable against the C runtime and Boehm GC,
the value representation used at runtime, and the observability of each pipeline stage.
## Requirements
### Requirement: Emit textual LLVM IR and link a native executable

The compiler SHALL lower the lambda-lifted core IL to textual LLVM IR (opaque `ptr`,
LLVM 22 syntax) and drive `clang` to compile and link that IR against the C runtime and
Boehm GC (`libgc`) into a runnable native executable.

#### Scenario: End-to-end AOT build

- **WHEN** a demo program is compiled
- **THEN** the compiler writes a `.ll` file, invokes `clang` to link it with the runtime
  and `libgc`, and the resulting executable runs and reports the program's value

#### Scenario: Values are tagged pointers with heap objects under Boehm

- **WHEN** the emitted IR and runtime represent values
- **THEN** immediates (fixnums, booleans, `()`, characters, and the unspecified value) are tagged
  inline, heap
  objects (pairs, closures, interned symbols, and header-tagged extended objects such as
  strings) are pointer-tagged and allocated through `libgc`, and closures are called
  indirectly through their `code_ptr`

#### Scenario: The unspecified value is an inline immediate with AOT/JIT parity

- **WHEN** the IR encodes the unspecified value, whether from a two-armed `if`, a no-match
  `cond`/`case`, `when`/`unless`, or a side-effecting runtime entry point
- **THEN** it is emitted as an inline **immediate** tagged constant in the same misc-immediate family
  as booleans and characters — no heap allocation, no header word, and no runtime constructor call —
  and the constant the emitter writes SHALL be bit-identical to the constant the C runtime uses, since
  the value representation is shared verbatim between the two
- **AND** the AOT and JIT paths SHALL agree: a program yielding the unspecified value SHALL produce
  the same observable result compiled to a native executable as evaluated in the embedded JIT

#### Scenario: Symbols are interned and quoted structure is materialized

- **WHEN** the IR encodes a quoted symbol or a quoted list
- **THEN** a symbol is a call to `rt_intern` on an emitted private string constant (equal
  names canonicalize to one object), and a quoted pair is materialized by emitted
  `rt_cons` code over the recursively encoded elements

#### Scenario: Strings are materialized on the header-word scheme; characters are immediate

- **WHEN** the IR encodes a string or character literal
- **THEN** a string literal is a heap object on the last primary tag whose first word is a
  type header — a call to `rt_make_string` on an emitted private byte-array constant (with
  its byte length) — while a character literal is emitted as an inline **immediate** tagged
  constant encoding the codepoint, with no heap allocation and no `rt_make_char` call
- **AND** the string header object carries, in addition to its byte length and byte pointer,
  a stored codepoint length and a nullable auxiliary codepoint→byte index pointer (built
  lazily by the runtime, `NULL` at construction); the emitted IR is unchanged — it still
  lowers to a single `rt_make_string(ptr, i64)` call and the runtime populates the extra
  header words — so the runtime/emitter value-representation contract holds without an IR
  edit

### Requirement: Each pipeline stage is independently observable

The compiler SHALL expose a debug mode that prints the intermediate language after each
named pass, so every stage of the lowering can be inspected in isolation. This includes
the top-level pass that collects the program's sequence of top-level forms and desugars
top-level `define`s into the core IL, and the `expand` pass — now a fixpoint
`syntax-rules` macro expander that rewrites user and prelude macro uses (including the
derived forms `cond`, `and`, `or`, `when`, `unless`, `let*`, and named `let`, which are
supplied as prelude macros) into core forms.

The debug mode SHALL be reachable from the **shipped compiler binary** without Chez
Scheme, and SHALL cover every compilation path the compiler takes — the whole-program
path, the modular path used when libraries are imported (including the auto-imported
`(scheme base)`), and the per-form path the REPL uses — not only the whole-program path.
Where a path runs a pass once per top-level form, each dumped stage SHALL identify the
form it belongs to.

#### Scenario: Stage dump

- **WHEN** a program is compiled with the stage-dump flag enabled
- **THEN** the compiler prints the IL after each pass — the top-level
  collection/`define`-desugaring pass, then `expand`, then `recognize-let`,
  `convert-assignments`, `convert-closures`, `lambda-lift`, and lowering — in order

#### Scenario: Expand stage shows fully macro-expanded core

- **WHEN** a program that uses macros (user-defined or prelude derived forms) is compiled
  with the stage-dump flag enabled
- **THEN** the `expand` stage output contains only core forms and known primitive heads,
  with every macro use rewritten and no `define-syntax`/`syntax-rules` form remaining

#### Scenario: The stage dump needs no Chez Scheme

- **WHEN** a developer compiles a program with the stage-dump flag through the shipped
  binary on a machine with no `chez` on `PATH`
- **THEN** the IL after each named pass is printed, with the same stage names and the same
  order the Chez driver's dump produces for the same program

#### Scenario: The modular path dumps its mid-pipeline stages

- **WHEN** a program that imports a library (or is compiled with the auto-imported
  `(scheme base)`) is compiled with the stage-dump flag enabled
- **THEN** the dump includes `recognize-let`, `convert-assignments`, and
  `convert-closures` in addition to the top-level, `expand`, `parse+rename`, and lowering
  stages

#### Scenario: Per-form stages name their form

- **WHEN** the per-form path (the REPL, or a modular program's per-form lowering) dumps a
  stage that runs once per top-level form
- **THEN** each stage header identifies which top-level form it belongs to, so repeated
  stage names are unambiguous

### Requirement: Calling-convention decision for variadic application is evidence-backed and recorded

The project SHALL record a decision on the calling convention used for Scheme functions —
how dotted rest parameters, variadic `lambda`, and `apply` over arbitrary-length lists are
supported while preserving guaranteed tail calls (`musttail`) under a single uniform
function prototype — supported by a direct comparison of candidate conventions that emit
and run real LLVM IR, together with the rationale and the scoring that produced it.

#### Scenario: Candidate conventions are exercised in real IR

- **WHEN** the calling-convention decision is made
- **THEN** at least the leading candidate conventions have been implemented as throwaway
  LLVM IR experiments that compile and run
- **AND** each is shown to express a dotted-rest function and an `apply` over a
  runtime-built list longer than the fixed-argument width
- **AND** each is shown either to preserve `musttail` on a tail-recursive loop (running in
  bounded stack) or to be eliminated for failing to

#### Scenario: Decision is recorded with rationale

- **WHEN** the comparison is complete
- **THEN** the chosen convention, the scoring (correctness, `musttail` preserved,
  hot-loop overhead vs. the current fixed-arity baseline, emission complexity), and the
  rationale are recorded in the design doc
- **AND** `LLVM.md`'s "Calling convention" and "Tail calls" sections are updated to be
  consistent with the recorded decision

### Requirement: Emit the argc + overflow calling convention

Every emitted Scheme function SHALL use the single uniform prototype
`fastcc i64 (i64 self, i64 argc, i64 a0 … i64 a{K-1}, ptr overflow)` (`K` = whole-program
max fixed arity), and every emitted call SHALL pass `argc` = the number of actual
arguments and the positional arguments padded to `K`. When a call supplies more than `K`
arguments (variadic calls and `apply`), the excess arguments SHALL be passed through the
`overflow` vector; fixed-arity calls with no excess SHALL pass `ptr null`. Variadic
callees SHALL consume `argc` and `overflow` to build their rest list, and fixed-arity
callees SHALL check `argc`. The convention SHALL preserve guaranteed tail calls
(`musttail`), and the fixed-arity hot path SHALL remain allocation-free.

Argument passing SHALL be correct at **every** arity `K`, including `K` large enough that a
call's argument count (`K + 3`) exceeds the target's register-argument budget and arguments
are passed on the stack. In particular, a non-tail call SHALL preserve the caller's live
arguments across the call regardless of `K`. (The convention uses `fastcc` rather than
`tailcc` precisely because a non-tail `call tailcc` with a stack-passed argument does not
preserve the caller's live arguments on arm64; `fastcc` does, and — because every emitted
tail call is `musttail`, which `fastcc` guarantees — guaranteed tail calls are unaffected.)

#### Scenario: Widened prototype and call shape

- **WHEN** a program is compiled to LLVM IR
- **THEN** each Scheme function is defined with the `fastcc (self, argc, a0 … a{K-1},
  overflow)` prototype, and each call site passes the actual-argument count as `argc`, the
  padded positional arguments, and either `ptr null` (no excess) or an `overflow` vector
  (excess args)

#### Scenario: Overflow carries excess arguments

- **WHEN** a variadic procedure or `apply` is called with more than `K` arguments
- **THEN** the first `K` arguments occupy the positional slots and the remainder are passed
  through the `overflow` vector, and the callee reconstructs the full argument sequence

#### Scenario: Tail calls remain guaranteed

- **WHEN** a tail-recursive loop (e.g. the 10M-iteration `countdown` / named-`let` loop)
  is compiled under the convention
- **THEN** the tail call is emitted as `musttail`, the program runs in bounded stack, and
  the loop allocates nothing on its hot path

#### Scenario: High arity preserves caller arguments across non-tail calls

- **WHEN** a program whose whole-program max fixed arity is `K ≥ 6` (so a call passes at least
  9 arguments and at least one is stack-passed) compiles a function that makes a non-tail
  closure call and then uses one of its own arguments after the call returns
- **THEN** the caller's argument is preserved and the function computes the correct result
  (e.g. `(define (big a1 a2 a3 a4 a5 a6) (+ a1 a2)) (define (helper x) (+ x 100))
  (define (f a b) (+ (helper a) b)) (f 10 20)` evaluates to `130`), with no corruption,
  hang, or crash

### Requirement: Emission order is independent of host evaluation order

The emitter SHALL produce the same textual IR — identical temporary numbering and instruction
order — regardless of the host's unspecified argument-evaluation order. Where a form emits two
or more independently-emitting sub-parts (e.g. a call's callee and its operands), the emitter
SHALL sequence them explicitly (rather than relying on the order in which a host evaluates
procedure-call arguments), so that the compiler run under the bootstrap host (Chez) and the
same compiler compiled to native `schemec` emit byte-identical IR for the same program. This is
the determinism the self-hosting fixed point (byte-identical stage-1/stage-2 IR) depends on.

#### Scenario: schemec and the host-hosted compiler agree byte-for-byte

- **WHEN** a program that emits calls, nested calls, closures, and recursion (e.g.
  `demos/fact.scm`) is compiled to IR by the Chez-hosted compiler and by the native `schemec`
- **THEN** the two IR outputs are byte-identical (not merely semantically equivalent)

#### Scenario: Callee and operands emit in a fixed order

- **WHEN** the emitter lowers a call `(f a b)` (or `(apply f … lst)`), which emits both the
  callee reference and the operand expressions
- **THEN** the sub-parts are emitted in a fixed, host-independent order, so temporary numbering
  does not depend on whether the host evaluates arguments left-to-right or right-to-left

### Requirement: Fixnum numeric primitives lower to an inline fast path

The numeric primitives `+`, `-`, `*`, `=`, and `<` SHALL be lowered to an inline instruction sequence for the
common case where both operands are fixnums (and the comparisons `>`, `>=`, `<=` reduce to
`<`/`=` before emission), rather than always emitting an out-of-line runtime
call. The emitter SHALL guard the inline path with a fixnum-tag test on the operands and, when
the test fails, SHALL delegate to the existing runtime primitive (`rt_add`, `rt_sub`, `rt_mul`,
`rt_num_eq`, `rt_lt`). The runtime primitive SHALL remain the single definition of numeric
semantics: the inline path is a transparent accelerator that MUST produce a result identical to
the runtime primitive for fixnum operands.

The inline fixnum path for the arithmetic primitives `+`, `-`, and `*` SHALL ALSO detect when the
operation's result is **not representable as a fixnum**, and on detection SHALL delegate to the
same runtime primitive the fixnum-tag test delegates to. The emitter SHALL NOT decide the outcome
of an overflow itself: it detects and delegates, leaving the runtime primitive the single
definition of numeric semantics for the overflow case exactly as it already is for the
non-fixnum case. Detection SHALL be exact — every overflowing operation and no in-range
operation reaches the runtime by this route — and SHALL add no arithmetic to the fast path beyond
the overflow test itself. The comparisons `=` and `<` cannot overflow and SHALL be unchanged.

This delegation is what allows a later change to the representation of exact integers (for
example, promoting an out-of-range result to an arbitrary-precision integer instead of trapping)
to be made **entirely within the `rt_*` runtime primitives**, with no emitter change and no change
to the emitted IR shape.

The emitter SHALL ALSO provide a **flonum inline fast path** for the same primitives (`+`, `-`,
`*`, `=`, `<`, and the reduced `>`, `>=`, `<=`). When both operands are known or guarded to be
flonums, the emitter SHALL emit the native floating-point instruction (`fadd`, `fsub`, `fmul`,
`fcmp`) operating on unboxed `f64` values, rather than an out-of-line call to `rt_*`. The flonum
fast path MUST be a transparent accelerator: for flonum operands it MUST produce a result
identical to the corresponding runtime primitive, so that the `rt_*` runtime primitives remain
the single definition of numeric semantics for both fixnum and flonum operands. Any operand that
is proven or guarded to be neither a fixnum nor a flonum (and any mixed fixnum/flonum case that
is not specialized inline) SHALL flow to the `rt_*` runtime primitive, which performs the
inexact (contagious) tower arithmetic or comparison. Flonum arithmetic overflows to an infinity
under IEEE 754 rather than leaving a representable range, so the flonum fast path requires no
overflow detection.

The flonum fast path SHALL keep intermediate flonum values **unboxed** in native `f64` machine
registers within a single expression tree. A flonum result that feeds another flonum operation
SHALL stay in an `f64` register (producer→consumer fusion); the emitter SHALL construct a boxed
flonum (`rt_make_flonum`) only at an **escape point**, and SHALL cancel every `box ∘ unbox`
(`rt_make_flonum` immediately followed by `flo_val`) pair. The escape points at which an `f64`
result MUST be boxed back into a `val` are: storage into a pair, vector, record, or box; use as a
function result returned into a `val` slot; passage to a call with a `val`-typed parameter
(INCLUDING the self-recursive loop back-edge under the uniform `tailcc` calling convention);
consumption by a `val`-only runtime operation (e.g. `display`, `write`, `eqv?`, `equal?`,
`cons`); and assignment to a type-unstable variable that also holds non-flonum values.

The flonum-ness required to select the fast path SHALL be established from cheap, certain type
sources — literal flonums, the result of any flonum-fast-path operation, and `exact->inexact` —
propagated forward within the expression; where flonum-ness cannot be proven, the emitter SHALL
fall back to the boxed `rt_*` path. This change does NOT alter the calling convention: flonum
parameters continue to be passed as boxed `val`s across the `tailcc` back-edge (loop-carried
unboxing is out of scope), and no unboxed flonum-array representation is introduced.

The division and flooring-remainder primitives `/` and `modulo` have NO inline path (like
`quotient`/`remainder`); they lower to out-of-line calls to `rt_div` and `rt_modulo`, which the
emitter SHALL declare as externs and map in the prim→runtime table.

The observable behavior of every numeric primitive SHALL be unchanged relative to the previous
lowering for every input whose result is representable — identical results for all in-range
fixnum inputs, and results matching the runtime's tower behavior for flonum and mixed operands.
Because the unboxing decisions are made in the shared emitter, the JIT and AOT backends SHALL
emit byte-identical code, and the `byte-identical-backends` demo check MUST continue to pass.

#### Scenario: Inline fast path emitted for fixnum arithmetic

- **WHEN** a program containing `(+ a b)`, `(- a b)`, `(= a b)`, or `(< a b)` is compiled to
  LLVM IR
- **THEN** the emitted IR contains a native arithmetic/compare instruction
  (`add`/`sub`/`icmp`) reached under a fixnum-tag guard, with a call to the corresponding
  `rt_*` primitive on the non-fixnum path

#### Scenario: The arithmetic fast path detects overflow and delegates

- **WHEN** a program containing `(+ a b)`, `(- a b)`, or `(* a b)` is compiled to LLVM IR
- **THEN** the emitted fast path tests whether the operation overflowed and, when it did,
  branches to the same `rt_*` call the fixnum-tag test branches to — so an overflowing
  both-fixnum operation reaches the runtime primitive rather than producing a wrapped value
  inline

#### Scenario: Results are identical to the runtime primitive

- **WHEN** the demo suite (which exercises n-ary `+ - *` and chained `< = > <= >=`) is compiled
  and run
- **THEN** every demo produces exactly the same value it produced under the previous
  runtime-call lowering

#### Scenario: N-ary and chained forms are covered

- **WHEN** a program uses n-ary arithmetic `(+ a b c)` or a chained comparison `(< a b c)`
- **THEN** each reduced binary operation is lowered through the same inline fast path (the
  reduction to binary forms happens before emission), producing the correct result

#### Scenario: Runtime remains the single definition of semantics

- **WHEN** an operand is not a fixnum or flonum at run time, or a both-fixnum operation
  overflows
- **THEN** the emitted code calls the runtime primitive, so the runtime alone determines the
  outcome in both cases

#### Scenario: Flonum fast path emitted for flonum arithmetic

- **WHEN** a program compiles `(+ 1.0 2.0)`, `(* zx zx)`, or `(< d 4.0)` where the operands are
  proven or guarded flonums
- **THEN** the emitted IR contains a native floating-point instruction (`fadd`/`fmul`/`fcmp`) on
  unboxed `f64` values, producing the same result the corresponding `rt_*` primitive would

#### Scenario: Intra-expression flonum intermediates stay unboxed

- **WHEN** a flonum-producing operation's result feeds directly into another flonum operation
  within one expression tree (e.g. the `(+ (* zx zx) (* zy zy))` subexpression)
- **THEN** the intermediate flonum stays in an `f64` register and NO `rt_make_flonum` allocation
  is emitted for it, with every `rt_make_flonum` immediately followed by `flo_val` cancelled

#### Scenario: Flonum boxed at escape points

- **WHEN** a flonum result is stored into a pair/vector/record, returned into a `val` slot,
  passed to a `val`-typed call, or consumed by a `val`-only operation such as `display`
- **THEN** the emitter constructs a boxed flonum (`rt_make_flonum`) at that point, so the value
  crosses the boundary as a canonical `val`

#### Scenario: Loop back-edge still boxes the loop-carried flonum

- **WHEN** a self-recursive (named-let) loop passes a flonum-valued loop variable across the
  `tailcc` back-edge
- **THEN** the value is boxed before the recursive call, because loop-carried unboxing across the
  calling convention is out of scope for this change

#### Scenario: Dev→ship byte-identity is preserved

- **WHEN** a program exercising the flonum fast path is compiled through both the JIT and the AOT
  backend
- **THEN** the two backends emit byte-identical code and the `byte-identical-backends` demo check
  passes

#### Scenario: Division and modulo lower to runtime calls

- **WHEN** a program compiles `(/ a b)` or `(modulo a b)`
- **THEN** the emitted IR contains an out-of-line call to `rt_div` / `rt_modulo` (no inline
  fast path), with the corresponding extern declared

### Requirement: A function's self-call lowers to a direct call

When a call's operator is the enclosing function's own self-binding (its self-reference,
captured at closure creation), the emitter SHALL lower it to a direct call to that function's
code (`call fastcc @code_N`) rather than loading the code pointer from the closure and calling
indirectly, and SHALL elide the redundant argument-count (`argc`) arity check for that call
since the arity is statically known. This lowering SHALL be observably identical to the indirect
call: the self-reference is fixed for the lifetime of the activation, so a direct call resolves
to the same code the indirect call would have.

The function's entry SHALL continue to check `argc` for calls that arrive through the closure
(external callers); only the direct self-call path elides the check.

#### Scenario: Self-recursive call is emitted as a direct call

- **WHEN** a self-recursive function such as
  `(define (ack m n) (cond ((= m 0) (+ n 1)) ((= n 0) (ack (- m 1) 1)) (else (ack (- m 1) (ack m (- n 1))))))`
  is compiled to LLVM IR
- **THEN** its recursive calls are emitted as direct `call fastcc @code_N` instructions rather
  than closure-loaded indirect calls, without the per-call `argc` guard on that path

#### Scenario: Result is unchanged

- **WHEN** `(ack 3 12)` is evaluated
- **THEN** the result is `32765`, identical to the indirect-call lowering

#### Scenario: External callers still arity-checked

- **WHEN** the same function is also called through its closure from another site with the wrong
  number of arguments
- **THEN** the function still reports an arity error (the entry arity check is preserved for
  closure-entry callers)

#### Scenario: Tail self-calls remain guaranteed tail calls

- **WHEN** a self-recursive tail call (e.g. `(ack (- m 1) 1)` in tail position) is compiled
- **THEN** the direct self-call is still emitted as a `musttail` call and runs in bounded stack

### Requirement: A call into a library lowers to a direct call

When a call's operator resolves to an imported library binding whose export table records a code
label and whose recorded arity matches the call's argument count, the emitter SHALL lower it to a
direct call to that label rather than loading the code pointer from the binding's closure. The
binding's global SHALL still be read and passed as the callee's `self`, since it carries the
captured environment; only the code-pointer load is elided.

The lowering SHALL be observably identical to the indirect call. It rests on library globals being
assigned once, during the unit's initialization, and never reassigned — a property that SHALL be
stated and tested, not assumed, because its failure mode is silent misdispatch rather than a
diagnostic.

Where the recorded arity does not match, or no label is recorded, the call SHALL be lowered
indirectly as before, so that arity errors continue to trap exactly as they do today.

#### Scenario: A fixed-arity library call is emitted as a direct call

- **WHEN** a program calls an imported procedure of matching arity, such as `(zero? n)` from
  `(scheme base)`
- **THEN** the emitted IR calls that procedure's code label directly, with the loaded global passed
  as `self`, and contains no code-pointer load for that call

#### Scenario: An arity mismatch stays indirect and still traps

- **WHEN** a program calls an imported fixed-arity procedure with the wrong number of arguments
- **THEN** the call is lowered indirectly and the program traps with the same arity error as before

#### Scenario: Redefining a library name at the REPL is still observed correctly

- **WHEN** a REPL session redefines a name that `(scheme base)` also exports, and then calls both
  the redefined name and a previously-compiled procedure that used the library's binding
- **THEN** each resolves to the binding it captured, exactly as before this change

### Requirement: The AOT build optimizes the linked module (release profile)

The AOT/build door SHALL compile the linked module with an optimizing pipeline (`-O2`) rather than
the toolchain default, and SHALL additionally enable link-time optimization (`-flto`) so that the
optimizer can act across compilation-unit boundaries.

This optimization SHALL preserve observable behaviour: the delivered executable SHALL produce the
same values and errors as an unoptimized build for every program.

LTO is what makes a cross-unit direct call worth emitting: measured on a 30-million-call probe, the
direct call alone and LTO alone each change nothing, while together they are ~6× faster than
today's indirect call. Because binary size is a first-class concern for this project, the release
profile's size SHALL be measured when LTO is enabled, and a size regression SHALL be treated as a
reason to reconsider the setting rather than a cost to absorb silently.

The interactive/JIT door SHALL remain unoptimized; this requirement governs the ship path only.

#### Scenario: The delivered executable is built with an optimizing pipeline

- **WHEN** a program is delivered through the AOT/build door
- **THEN** the linked module is compiled at `-O2` with link-time optimization enabled
- **AND** the executable produces the same result as an unoptimized build (e.g. `(ack 3 12)` ⇒
  `32765`)

#### Scenario: Cross-unit calls are optimized across the unit boundary

- **WHEN** a program that direct-calls an imported procedure is delivered through the AOT door
- **THEN** the optimizer may inline that procedure across the unit boundary

#### Scenario: Binary size is measured against the previous release profile

- **WHEN** link-time optimization is enabled
- **THEN** the delivered executable's size is compared against a build without it, and the result
  is recorded

#### Scenario: Emitted IR and bootstrap IR are unchanged

- **WHEN** the AOT release optimization is enabled, including link-time optimization
- **THEN** the emitter's per-form textual IR and the committed `bootstrap/*.ll` are byte-identical
  to before — both `-O2` and `-flto` act at link/codegen time, not on emission — so IR
  byte-identity and self-hosting fixed-point checks still hold

### Requirement: The AOT build tree-shakes unreachable library bindings

Under the closed-world assumption of an AOT build (a sealed program with no further definitions or
redefinitions, and no `eval`/dynamic name lookup), the AOT backend SHALL omit library and prelude
bindings that are not transitively reachable from an explicit **root set**. Reachability SHALL be
computed from the root set over the general unit/export graph (the prelude is treated as one unit
among others, not special-cased). The AOT build SHALL generate initialization that constructs only
the reachable bindings, so that unreachable code becomes genuinely unreferenced and is removed from
the executable.

The root set SHALL be a parameter of the reachability computation (for an executable, the program's
entry and top-level references), so the same mechanism can later serve other roots (e.g. a
delivered library's exported interface) without change.

Root sets SHALL propagate **backward through the import graph**: a unit that another unit imports
SHALL be shaken against what its importers **retain**, and SHALL NOT be exempted from shaking on the
grounds that something imports it. To make that sound, the shipping doors SHALL finalize units in an
order in which every unit that imports a given unit is already final before that unit is shaken, and
SHALL seed each unit's root set with the program's roots together with the references still present
in those finalized importers. Consequently a unit's eligibility for shaking SHALL NOT depend on
whether the program imports it **directly**: every unit in the program's import closure is subject
to the same computation.

This transform SHALL apply to **every** door that delivers a native executable, and the doors SHALL
share one implementation of it rather than each computing reachability its own way. A delivered
executable's size SHALL NOT depend on which door produced it: for the same program and the same
compiler, the shipping doors SHALL retain the same set of library bindings.

This transform SHALL NOT apply to the interactive/REPL door or to in-process execution, which
continue to provide the full library units (open world — any binding may be referenced by a later
form), and all doors SHALL share one compiler core. Tree-shaking SHALL preserve observable behavior:
a program's result SHALL be identical to a non-shaken build.

#### Scenario: Unused library bindings are dropped from the executable

- **WHEN** a program that references only a small subset of `(scheme base)` (e.g. only `car`) is
  built for AOT
- **THEN** library bindings not transitively reachable from the program are absent from the linked
  executable, and the binary is smaller than one linking the full library

#### Scenario: Reachable bindings and behavior are preserved

- **WHEN** a program that transitively uses a library binding (directly or through another reachable
  binding) is built for AOT
- **THEN** that binding is retained and the program produces the same result as a non-shaken build

#### Scenario: Both shipping doors deliver the same shaken program

- **WHEN** the same program is built with `emit build` and with the Chez batch driver's AOT path, at
  the same commit
- **THEN** both executables retain the same library bindings and are of the same order of size,
  rather than differing by the whole unshaken standard library

#### Scenario: Growing the standard library does not grow an unrelated executable

- **WHEN** procedures are added to `(scheme base)` and a program referencing none of them is built
  with `emit build`
- **THEN** the delivered executable does not grow by the added bindings

#### Scenario: The REPL door keeps the full library

- **WHEN** the same library is loaded through the interactive/REPL door
- **THEN** every binding remains available regardless of what any single form references (open
  world), and behavior matches the AOT build for programs that use the same bindings

#### Scenario: Reachability is root-set-driven

- **WHEN** the reachability computation is invoked with an explicit root set
- **THEN** exactly the bindings transitively reachable from that root set are retained, so a
  different root set (e.g. a library's exports rather than a program entry) selects a different
  retained set through the same mechanism

#### Scenario: A library imported by another library is shaken, not kept whole

- **WHEN** a program that reaches only a small subset of `(scheme base)` is built, and `(scheme
  base)` imports the `(emit internal)` substrate
- **THEN** the substrate is pruned to what the **shaken** `(scheme base)` still references, rather
  than being linked whole because something imports it, and substrate bindings no importer retains
  (such as the in-language reader's) are absent from the delivered executable

#### Scenario: A transitively imported unit is shaken even though the program does not import it

- **WHEN** a program imports a library that in turn imports a second library, and the program
  imports the second library nowhere itself
- **THEN** the second library is shaken to what the first retains, rather than being exempt from
  shaking for not being a direct import of the program

#### Scenario: A binding an importer still reaches is retained through the chain

- **WHEN** a program uses a procedure of one library that is implemented in terms of a binding in a
  library it imports
- **THEN** that binding is retained in the imported unit, the executable links, and the program
  produces the same result as a non-shaken build

### Requirement: Flonum literals are written into IR by a canonical formatter

The emitter SHALL write an inexact (flonum) literal into emitted IR using a **canonical
formatter of its own**, and SHALL NOT derive the IR text from the host's number printer. This
applies to every site that renders a double into emitted output — both the unboxed operand form
used inside a flonum region (`fmul double …`) and the string constant form rebuilt at runtime by
`rt_flonum_lit`.

The formatter SHALL satisfy two independent properties:

1. **Validity** — the emitted text SHALL be accepted by LLVM in a `double` position. A
   floating-point constant SHALL therefore always carry a decimal point (or use the
   hexadecimal bit-pattern form), so a value whose shortest decimal uses an exponent SHALL NOT
   be rendered in a form (such as `1e+02`) that LLVM parses as an integer constant and rejects.
2. **Door independence** — for a given double, the emitted text SHALL be **byte-identical
   regardless of which door's number printer is available**: the Chez-hosted bootstrap driver and
   the self-hosted compiler SHALL emit the same IR text for the same literal. The formatter MAY
   consume the host's shortest-round-trippable digits, but SHALL impose its own canonical framing
   (sign, decimal point placement, exponent presence and spelling) so that host framing
   differences cannot reach the IR.

The formatter SHALL preserve the value exactly: the double recovered from the emitted text SHALL
be bit-identical to the literal the compiler read. Non-finite values (infinities and NaN), which
have no decimal spelling LLVM accepts, SHALL be emitted in the hexadecimal bit-pattern form.

#### Scenario: A literal whose shortest decimal uses an exponent compiles

- **WHEN** a program evaluating `(* 100.0 2.0)` is compiled through any door
- **THEN** it compiles successfully and yields `200.0` — the literal is emitted with a decimal
  point rather than as `1e+02`, which LLVM rejects as an integer constant in a `double` position

#### Scenario: The same literal emits identical IR on every door

- **WHEN** a program containing flonum literals — including an integral value (`100.0`), a
  large-magnitude value (`1e15`, `1e308`), and a subnormal value — is compiled by the
  Chez-hosted driver and by the self-hosted compiler, and the emitted IR of each is compared
- **THEN** the IR text is identical, including the operands of flonum arithmetic and the
  contents of any emitted literal string constant

#### Scenario: Values round-trip exactly through the emitted text

- **WHEN** a program returns a flonum literal that requires all 17 significant digits to
  round-trip
- **THEN** the value it yields is bit-identical to the literal in the source

#### Scenario: Non-finite literals emit a form LLVM accepts

- **WHEN** a program contains a literal that reads as an infinity (for example `1e400`) in a
  position where the emitter renders a double
- **THEN** the emitted IR uses the hexadecimal bit-pattern form and compiles, rather than
  emitting a decimal spelling LLVM cannot parse
