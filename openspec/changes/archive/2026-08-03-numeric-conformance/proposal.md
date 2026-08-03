## Why

Emit's numeric *foundation* is sound and standard-sanctioned — R7RS §6.2.3 explicitly blesses an
implementation "in which exact numbers are always integer," which is exactly the fixnum/flonum
tower, and contagion, `/`-returns-exact-when-even, and the overflow trap all match the standard.
The *surface* is where the distance is: Emit binds 20 of roughly 60 R7RS numeric procedures
(#27), three of the five comparisons cannot be passed to a higher-order procedure (#26),
`quotient`/`remainder` return shifted garbage instead of trapping (#23), the reader cannot read
back the `+inf.0` its own printer emits (#25), and a flonum literal with an exponent makes the
compiler emit **invalid LLVM IR** — differently on each door (#24):

```
$ echo '(display (* 100.0 2.0))' | build/emit run
<program>:296:21: error: integer constant must have integer type
  %t1 = fmul double 1e+02, 2.0
```

Numerics is now the largest remaining conformance gap in the accepted language, and #24 is a
dev→ship fidelity break of the same class as the closed #7 — a core design goal, not a breadth
nicety. Doing this before the first tagged release also means the numeric surface is right before
SemVer makes it a commitment (`homebrew-tap-distribution`).

## What Changes

- **Format flonum literals for IR independently of the host printer** (#24). `src/emit.ss:606`
  interpolates `(number->string d)` into IR text; LLVM rejects `1e+02` as an integer constant in a
  `double` position. The emitter gains one IR-double formatter used by every site that writes a
  double, so `emit run` and the Chez-hosted AOT path agree.
- **Make `>`, `<=`, `>=` first-class values** and **`max`/`min` variadic** with R7RS inexactness
  contagion (#26). Operator position keeps compiling to today's inline chain — no emitted IR
  changes for existing code — and value position gains an eta, the mechanism `=`/`<` already use.
- **Type-guard the integer-division primitives** (#23): `quotient`, `remainder`, and
  `integer->char` trap on arguments they currently reinterpret, matching `rt_modulo`'s existing
  guard and contagion choice.
- **Fill the `(scheme base)` numeric inventory** (#27): the missing predicates
  (`positive?` `negative?` `odd?` `even?` `exact-integer?` `rational?` `complex?`), `min`,
  `abs` `gcd` `lcm` `square` `expt` `exact-integer-sqrt`, the rounding family
  (`floor` `ceiling` `truncate` `round`), the R7RS division family
  (`floor/` `floor-quotient` `floor-remainder` `truncate/` `truncate-quotient`
  `truncate-remainder`), `numerator`/`denominator`, the R7RS spellings `exact`/`inexact`
  alongside the retained R5RS `exact->inexact`/`inexact->exact`, and number I/O
  (`string->number`, plus a radix argument on `number->string`).
- **Add `(scheme inexact)`** — `finite?` `infinite?` `nan?` `exp` `log` `sin` `cos` `tan` `asin`
  `acos` `atan` `sqrt` — as a real second standard library, wrapping new internal libm
  primitives. This is also the first library besides `(scheme base)` in the default manifest, so
  it exercises the module system rather than special-casing one library.
- **Read the three non-finite tokens** `+inf.0`, `-inf.0`, `+nan.0` in both readers
  (`src/prelude.scm` and the bootstrap `src/parse.ss`), closing the write/read round trip (#25,
  in part).

Non-goals, deliberately deferred and recorded as such: radix (`#x` `#b` `#o` `#d`) and exactness
(`#e` `#i`) **reader prefixes** and rational syntax `1/2` (the rest of #25 — they share digit
scanning with `string->number` but are a reader-grammar piece of their own); `rationalize`;
bignums; `(scheme complex)`, which should stay absent since Emit is real-only; and curating
`(scheme base)`'s export surface (#29).

## Capabilities

### New Capabilities

- `inexact-math`: the `(scheme inexact)` library — its existence as an importable standard library
  distinct from `(scheme base)`, the non-finite predicates (`finite?` `infinite?` `nan?`), and the
  transcendental and root procedures (`exp` `log` `sin` `cos` `tan` `asin` `acos` `atan` `sqrt`),
  including their exactness results and domain-error behaviour.

### Modified Capabilities

- `core-language`: the **N-ary comparison operators** requirement — `>` `<=` `>=` keep their
  frontend expansion in operator position but gain value-position bindings, which the requirement
  currently forecloses by specifying them as frontend derivations only; the **Primitives usable as
  first-class values** requirement gains all five comparisons; the **Integer division
  primitives** requirement gains the non-integer/non-number argument behaviour it currently leaves
  unspecified (the gap #23 falls into); the **Exact/inexact conversion** requirement gains the
  R7RS `exact`/`inexact` spellings; **number->string for decimal integers** gains a radix
  argument and is joined by `string->number`; the prelude-procedure requirements gain the §6.2
  inventory and the variadic `max`/`min` with contagion; and **Read data from source text** gains
  the three non-finite tokens.
- `aot-codegen`: a requirement that a flonum literal is written into IR in a form LLVM accepts
  regardless of which door's `number->string` runs — the emitter must not derive IR text from host
  printing (the #24 fidelity rule, the same shape as the `fixnum-overflow-trap` delta).

`primitive-layer` needs no delta: its requirements govern how *any* primitive behaves, and the new
libm primitives inherit them unchanged. They are permanently-internal `%`-ops (wrapped by
`(scheme inexact)` rather than made integrable), which the existing "raw `%`-ops staying internal"
non-goal already covers.

`module-system` needs no delta: `(scheme inexact)` uses the manifest and import machinery exactly
as specified. Locating bundled libraries from an *installed* binary (the manifest path is
resolved relative to the working directory) is a pre-existing distribution gap that belongs with
`homebrew-tap-distribution`, not here.

## Impact

- `src/emit.ss` — the IR-double formatter and the two sites that write doubles (`:606`, and the
  `rt_flonum_lit` C-string path at `:183`); `prim-table` and `declare` lines for the new libm ops.
- `src/parse.ss` — `*prims*` (new `%`-ops), `*integrable*` (`> <= >=` entries), and a new
  comparison fold kind in `fold-eta`; the bootstrap reader's non-finite tokens.
- `src/passes/expand.ss` — unchanged behaviour for operator position; `cmp-pair` becomes the
  shared source of the chain shape the new etas fold over.
- `src/runtime/runtime.c` — guards on `rt_quotient`/`rt_remainder`/`rt_integer_to_char`; the new
  `rt_*` libm wrappers; `string->number` support as needed.
- `src/prelude.scm` (→ regenerated `lib/scheme/base.sld`) — the §6.2 inventory, variadic
  `max`/`min`, the non-finite reader tokens.
- `lib/scheme/inexact.sld` (new, hand-written — not generated) and `emit-libs.scm` (a second
  library entry).
- **Staged bootstrap**: new `%`-ops mean the two-step `make regen` procedure in
  `docs/PRIMITIVES.md` ("Adding a new integrable primitive"), and re-recording
  `test/module-scaffold-baseline.sha256` if the new `declare` lines drift every module's IR hash.
- Tests: a new `test/numeric-conformance-tests.sh` in `run-all-tests.sh`, plus the existing
  numeric suites (`fixnum-overflow-tests.sh`, `inline-arith-self-call-tests.sh`) as regression
  guards for the emitter change.
- Docs: `docs/PRIMITIVES.md` (the new ops), `docs/MODULES.md` (a second standard library),
  `docs/COMPLEXITY.md` (refresh), and issues #23 #24 #25 #26 #27 referenced from the commits.
