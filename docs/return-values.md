# Unspecified Return Values

Research notes on why the Scheme standards decline to specify certain return values, and on what
implementations do instead — gathered as input into an explicit policy for Emit. If you only read one
section, read [the policy in brief](#the-policy-in-brief).

> **Status: adopted and implemented** (OpenSpec change `unspecified-value`). Emit now has one
> distinguished unspecified value: a misc-immediate on subtype 2, distinct from `#f` and `()`, truthy,
> written `#<unspecified>`, with no reader syntax and no predicate, suppressed by the REPL echo — so
> `define`, `set!`, mutators, and I/O procedures are all silent at the prompt.
> [Where Emit stood before](#where-emit-stood-before) records what it replaced.
>
> **This is not a promise.** Following Chez's own caveat, what Emit returns at an unspecified-result
> site is an implementation choice that may change. Portable programs must not depend on it, must not
> test for it, and must not branch on it.

The short version: the ambiguity is deliberate and well-documented, it exists for two distinct
reasons that call for different responses, and the great majority of the ~40 surveyed implementations
have converged — without any standard asking them to — on *one distinguished value, not `#f`,
suppressed by the REPL*. Emit has no such value: it returns `#f` from the syntactic forms and `()`
from the side-effecting C primitives, and its REPL echoes both, so `(display "hi")` prints `hi()`.

## Five different things called "unspecified"

The single word "unspecified" covers five distinct situations in R7RS, and conflating them is the
main source of confusion. Only the first is the subject of this document, but a policy has to say
which category a given latitude falls into, because they warrant different compiler treatment.

| # | Category | R7RS examples | What the implementation may choose |
|---|----------|---------------|------------------------------------|
| 1 | **Unspecified return value** | `set!`, `set-car!`, `vector-set!`, one-armed `if`, `when`, `unless`, no-match `cond`/`case`, `for-each`, `write`, `display`, `newline`, `delete-file`, record setters | *Which object* comes back |
| 2 | **Unspecified order of evaluation** | operands of a call, `let`/`letrec` inits, `define-values`, `do` steps | *When* subexpressions run |
| 3 | **Unspecified predicate result** | `(eqv? "" "")`, `(eqv? +nan.0 +nan.0)`, `(eq? 2 2)`, `(memq 101 '(100 101 102))` | The *answer* to a real question |
| 4 | **Unspecified initial contents** | `(make-vector 3)`, `(make-string 3)`, `(make-bytevector 3)` | What fills fresh storage |
| 5 | **Unspecified effect / behavior** | mutating a literal, overlapping `string-copy!` regions, `dynamic-wind` escapes | Anything, including failure |

Category 1 is a *courtesy* — the report is saying "nobody needs this value." Category 3 is a genuine
*disagreement* about a meaningful question. Category 5 is closer to C's undefined behavior. A
compiler that treats them alike will either over-constrain itself or under-warn its users.

Emit has already been bitten by category 2, and the workaround is in the tree:
[demos/records.scm:16](../demos/records.scm) sequences its reads with `let*` explicitly because
argument evaluation order "differs between the JIT and AOT paths." That is a live example of why the
project needs a written per-category policy rather than an ad-hoc one.

### What R7RS actually requires

R7RS defines the term narrowly ([§1.3.2](r7rs/02-overview.md#errorsituations)):

> If the value of an expression is said to be "unspecified," then the expression must evaluate to
> some object without signaling an error, but the value depends on the implementation; this report
> explicitly does not say what value is returned.

Two constraints hide in that sentence and one more sits in the change list:

1. **It must be a value.** Signaling an error is not conforming.
2. **It must be exactly one value.** R7RS [§7.3](r7rs/11-language-changes.md) lists as a deliberate
   departure from R6RS: "When a result is unspecified, it is still required to be a single value.
   However, non-final expressions in a body can return any number of values."
3. **The general convention is stated once**, and in an easily-missed place — the naming-conventions
   section, as a consequence of the `!` suffix ([§1.3.5](r7rs/02-overview.md)): "The value returned by
   a mutation procedure is unspecified."

Two traps worth flagging for anyone implementing the report literally. First, `when` and `unless`
have an unspecified result **even when the branch is taken** — R7RS
[§4.2.1](r7rs/05-expressions.md) says flatly "The result of the `when` expression is unspecified,"
with no exception for the true case. Most implementations return the last body value anyway, and
[§7.3](r7rs/11-language-changes.md) confirms the looseness was intentional ("The utility macros
`when` and `unless` are provided, but their result is left unspecified"). Second, `for-each` and
friends are category 1, so an implementation is free to return the last application's value — and at
least one prominent one does (see [below](#chez-does-not-normalize-either)).

## Why the standards left it open

### The 1989 rationale, from the source

The clearest statement of intent comes from Guillermo J. Rozas (MIT) on `rrrs-authors`, 17 April
1989, replying to Jonathan S. Shapiro's review of the R3.95RS draft — the draft that became R4RS.
Shapiro had proposed standardizing a `#undefined` value, arguing it "substantially simplifies
debugging." Rozas ([msg00075](https://groups.csail.mit.edu/mac/ftpdir/scheme-mail/HTML/rrrs-1989/msg00075.html))
gave the canonical two-reason answer:

> The return values of certain expressions are left unspecified for a variety of reasons:
> - No agreement within the community on what the return value should be. See below the case of SET!
> - Agreement that no value is especially useful and/or meaningful. In this case the implementation
>   does not have to track down some other value, and can return something more convenient.

These are genuinely different, and the split maps onto the taxonomy above. Reason 1 is a standstill;
reason 2 is a performance concession — *don't make the compiler manufacture a value nobody wants.*

The `set!` case Rozas promised is the concrete standstill, and it explains why `set!` in particular
never got pinned down:

> There is disagreement in the community about what the return value should be. MIT Scheme follows
> the convention that assignment (ie. SET!) and slot assignment procedures (ie. SET-CAR!,
> STRING-SET!, etc.) return the OLD contents, not the new value. Other implementations follow the
> more usual convention of returning the new value. Code making the assumption that any particular
> convention holds is not portable.

So the ambiguity is not an oversight or a failure of nerve. It is a recorded impasse between two
installed bases — MIT returning the old value, everyone else the new one — neither of which would
yield. Shapiro's own complaint, incidentally, was that "there is enough code out there that makes
this assumption," which is exactly the argument that lost.

### Why a standard `#undefined` was rejected

Rozas also supplied the counter-argument to the debugging rationale, which is the reason the
distinguished-value idea kept failing at the standards level:

> The "problem" with unspecified values is that they can propagate for an unbounded amount of time
> before anyone actually tries to do something with them that will fail. For example, they can be
> stored in a data structure which will not be examined until much later. At the point at which the
> unspecified object causes an error, there is often no context from the process that created the
> unspecified object, so debugging is not really enhanced.

He floated, and declined to recommend, the richer alternative: "a class (type) of unspecified objects
which would capture some 'essential' aspect of the situation in which they were created/returned.
This could be made much more useful for debugging, but would probably incur some performance
problems."

This argument is correct as far as it goes, but note its scope: it defeats *propagation-based*
debugging, not *use-site* checking. Gauche later found the use-site half of the idea worth shipping
(see [below](#gauche-warns-you)). That distinction matters for Emit.

### R4RS/R5RS: exactly one unspecified value

R4RS and R5RS settled on the conservative reading — the expression yields one object, unspecified
which. The IEEE 1178 standard followed. This is the compatibility baseline everything later has to
argue against.

### R6RS: relaxed to zero-or-more

R6RS deliberately widened the latitude. Its
[Rationale §11.9.3](https://www.r6rs.org/final/html/r6rs-rationale/r6rs-rationale-Z-H-13.html)
declines to settle the interaction with multiple values at all:

> R6RS does not specify the semantics of multiple values completely. In particular, it does not
> specify what happens when several (or zero) values are returned to a continuation that implicitly
> accepts only one value.

It sketches the two coherent positions an implementation may adopt — strict ("Passing the wrong
number of values to a continuation is typically a violation, one that implementations ideally detect
and report") versus lenient ("Continuations not created by `begin` or `call-with-values` should
ignore all but the first value, and treat zero values as one unspecified value") — and then permits
either, plus the key extra freedom:

> R6RS allows an implementation to let `set!`, `vector-set!`, and other effect-only operators to pass
> zero values to their continuations.

The stated motive is defensive: returning *nothing* prevents "a program from making obscure use of
the return value." It is the strongest available enforcement of "don't rely on this" — you cannot
depend on a value that was never produced.

### R7RS: back to exactly one, and no API

R7RS-WG1 reopened both questions and the voting record is public, which makes this the best-documented
part of the story.

**Ballot item #68 — "'Undefined value' vs. 'undefined values'"**
([ballot](https://small.r7rs.org/wiki/WG1Ballot2/),
[results](https://small.r7rs.org/wiki/WG1Ballot2Results/)). Options were `r5rs` (one value), `r6rs`
(any number, including zero), and `zero` (exactly zero). Selected rationales:

- **Cowan** (`r5rs`): "R5RS, reluctantly. I really don't think it would in practice break
  compatibility, because in practice Scheme implementations are okay with handling multiple values in
  `begin` forms and the equivalent."
- **Shinn** (`r5rs`): "Too many existing programs expect exactly one value."
- **Ganz** (`zero`): "This seems much more elegant — as long as we've got multiple values, use zero
  of them."
- **Snell-Pym** (`r6rs`): "'Exactly zero' undefined values is just plain arbitrary and therefore
  sucks. An undefined number allows for future expansion, compatibly."
- **Medernach** (`r6rs`): "I am now convinced that R6RS phrasing is the more flexible option. However
  I exhort using `(values)` whenever possible."

**Result: `r5rs`** (5:3). Backward compatibility with R5RS and IEEE 1178 beat elegance and
flexibility. This is why R7RS §7.3 carries the explicit "still required to be a single value" note.

**Ballot item #49 — "Undefined value API"** ([ticket](https://small.r7rs.org/ticket/49/)). Filed by
Medernach in April 2010 on the grounds that "there are code which uses tricks to report `<undefined>`
values, like this one: `(if #f #f)`. Some cleaner mechanism has to be proposed." His concrete
proposal: "The best would be to standardize 'void', at least I known that Chicken, Gambit, Guile and
STklos implementations have it." Options were to standardize a generator (`void`), a predicate
(`undefined?`), both, or neither.

**Result: none** (6:3), closed `wontfix` — "WG1 voted not to have an undefined-value API." The
rationales are the most useful part of the record, because they are the objections Emit's own design
has to answer:

- **Cowan**: "I really don't like this; it encourages people to have such a defined-undefined value,
  which is semantically bogus."
- **Gleckler**: "Undefined should be undefined. Being able to test for it makes it defined.
  Implementations should be given freedom to interpret undefined in a way that is appropriate and
  efficient, not constrained in this strange and contradictory way."
- **Shinn**: "It's a bug to write programs which rely on this — unspecified is unspecified, and may
  be anything or even vary per compiler and program and call."
- **Rush**: "I used to advocate the 'both' position, but I have since decided that many of the use
  cases for `(void)` and `undefined?` are much better served by using explicit-CPS forms."
- **Hsu** (voting *for* a generator, against a predicate): "Testing for this value is bad practice…
  Systems like Chez Scheme normalize to this void object, but the point of `(void)` is to enable one
  to explicitly make a procedure return unspecified values."

Note the asymmetry in Hsu's and Snell-Pym's positions, which is the practically important one: a
**generator** is defensible (it lets *you* declare "this procedure has no interesting value"), while
a **predicate** is not (it lets you *depend* on someone else's non-value). Snell-Pym confessed to the
exact anti-pattern — using Chicken's `(void)` "in unit tests that force me to check the return value
of procedures called only for side effect" — and concluded the right fix was a test macro that
"doesn't compare return values."

## What implementations actually do

The empirical picture is much more uniform than the standards are. The tables below draw on the
[schemedoc/surveys](https://github.com/schemedoc/surveys) collection — John Cowan's long-running
survey of ~40 Schemes — cross-checked against local runs where noted.

### The distinguished value

From [`void-value.md`](https://github.com/schemedoc/surveys/blob/master/surveys/void-value.md):

| Implementation | Generator | Read syntax | Write syntax |
|---|---|---|---|
| Chez Scheme | `(void)` | — | `#<void>` |
| Racket | `(void)` | — | `#<void>` |
| Chicken | `(void)` | — | `#<unspecified>` |
| Gambit | `(void)` | `#!void` | `#!void` |
| STklos | `(void)` | `#void` | `#void` |
| Scheme 9 | `(void)` | — | `#<unspecific>` |
| Sagittarius | `(undefined)` | — | `#<unspecified>` |
| Guile | — | — | `#<unspecified>` |
| Mosh | — | — | `#<unspecified>` |
| MIT | — | `#!unspecific` | `#!unspecific` |
| Larceny | — | `#!unspecified` | `#!unspecified` |
| Kawa | — | `#!void` | *nothing written* |
| LIPS | — | `#void` | `#void` |
| Chibi, Cyclone, Gauche, s7, TinyScheme, Owl Lisp | — | — | — |

The survey lists Gauche as having none of the three, but Gauche's own manual (cited
[below](#gauche-warns-you)) documents `(undefined)`, `undefined?`, and the written form `#<undef>`;
only the reader syntax is genuinely absent. Treat the table as a starting point, not gospel.

### One-armed `if`

From [`one-armed-if.md`](https://github.com/schemedoc/surveys/blob/master/surveys/one-armed-if.md),
the survey's own summary is the headline finding:

> The great majority of all Schemes tested have an "unspecified value" value, which is not the same
> (in the sense of `eq?`) to any other value, and is returned as the value of `(if #f #f)` and in
> similar circumstances. The printing of this value is often suppressed by the REPL.

The exceptions, in full — note how few there are, and that they are overwhelmingly small or historical
implementations:

| `(if #f #f)` yields | Implementations |
|---|---|
| a distinct unspecified value | **the great majority** |
| `#f` | Bigloo, JScheme, Dream, Owl Lisp |
| `()` | NexJ, TinyScheme, Elk, UMB, Llava, Dfsch, Inlab |
| `#t` | Shoe, FemtoLisp |
| both `#f` and `()` | XLisp, Rep |
| a closure that loops forever when invoked | SXM |

And the crucial negative result about the R6RS latitude:

> Although R6RS allows returning an unspecified number of unspecified values, including no values, no
> known Scheme implementation actually does so.

The zero-values option is, empirically, dead. R6RS granted the freedom; nobody took it. Emit should
not be the first, and under R7RS may not be anyway.

### Multiple values reaching a single-value continuation

From [`multiple-values.md`](https://github.com/schemedoc/surveys/blob/master/surveys/multiple-values.md),
testing `(+ 1 (values 2 3))` — this is the R6RS Position 1 vs. Position 2 split, decided in the field:

- **Error** (strict): Racket, MIT, Gambit, Scheme48/scsh, Kawa, SISC, Chibi, SCM, **Chez**,
  Ikarus/Vicare, Ypsilon, IronScheme, and others.
- **Reduce to one value** (lenient): Gauche, Chicken, Bigloo, Guile, Larceny, Mosh, STklos, s7,
  Sagittarius, and others. Of these, Guile and NexJ treat *zero* values in a single-value context as
  an error; most of the rest yield their unspecified value.

For `(begin (values 1 2) 3)` — the non-final-body-expression case R7RS explicitly blessed — nearly
everything returns `3` without complaint. Cowan's ballot rationale ("in practice Scheme
implementations are okay with handling multiple values in `begin` forms") checks out.

### Adjacent survey results

Three more datapoints show how far the divergence spreads once a value is genuinely unconstrained:

- **`(define x)`** ([`empty-define.md`](https://github.com/schemedoc/surveys/blob/master/surveys/empty-define.md)):
  a syntax error in Racket, Gauche, Bigloo, Kawa, Chibi, STklos and others; binds the unspecified
  value in Gambit, Chicken, Guile, Chez, Vicare, Ypsilon, Mosh, Sagittarius; binds a distinct
  "unassigned" marker in MIT, Scheme48, Larceny.
- **`(make-vector 1)` contents** ([`default-values.md`](https://github.com/schemedoc/surveys/blob/master/surveys/default-values.md)):
  `0` in Chez, Gambit, Racket, Loko; `#<undef>`/`#<unspecified>` in Chibi, Gauche, Chicken, Guile,
  Sagittarius, Ypsilon; `#f` in Cyclone, MIT; and *genuinely random* in Cyclone's bytevectors and
  SCM's strings. (Category 4, not category 1 — but it shows the standard's word means what it says.)
- **What `load` returns** ([`what-load-returns.md`](https://github.com/schemedoc/surveys/blob/master/surveys/what-load-returns.md)):
  loading a file containing `(values 1 2 3)` yields three values in Racket, Scheme48, Guile; the
  unspecified value in Chez, Chicken, Kawa, Chibi, Larceny, Ypsilon, STklos; `1 0` in Bigloo; and
  `#t 2 3` in Gauche.

## Where implementors have been explicit

Several implementations document their choice deliberately, and their wording is worth copying.

### Chez Scheme — the model statement

The Chez Scheme User's Guide is the most careful of the lot. From `csug/intro.stex`, chapter 1
"Introduction", section ["Notational Conventions"](https://cisco.github.io/ChezScheme/csug10.0/intro.html):

> Chez Scheme usually returns a single, unique *void* object (see `void`) whenever the result is
> unspecified; avoid counting on this behavior, however, especially if your program may be ported to
> another Scheme implementation. Printing of the void object is suppressed by Chez Scheme's waiter
> (read-evaluate-print loop).

And from `csug/objects.stex`, chapter 6 "Operations on Objects", section
["Void"](https://cisco.github.io/ChezScheme/csug10.0/objects.html):

> Many Scheme operations return an unspecified result. Chez Scheme typically returns a special *void*
> object when the value returned by an operation is unspecified. The Chez Scheme void object is not
> meant to be used as a datum, and consequently does not have a reader syntax. As for other objects
> without a reader syntax, such as procedures and ports, Chez Scheme output procedures print the void
> object using a nonreadable representation, i.e., `#<void>`. Since the void object should be returned
> only by operations that do not have "interesting" values, the default waiter printer (see
> `waiter-write`) suppresses the printing of the void object. `set!`, `set-car!`, `load`, and `write`
> are examples of Chez Scheme operations that return the void object.

Five separate design decisions are stated there, and every one is load-bearing:

1. **One unique object**, not a per-site value.
2. **Documented as unreliable** — "avoid counting on this behavior."
3. **No reader syntax** — deliberately not a datum you can write down.
4. **Printed non-readably** as `#<void>` when it *is* printed.
5. **Suppressed by the REPL**, so it is invisible in normal interactive use.

Chez also exposes the generator but not a predicate, matching Hsu's ballot position:

> `void` is a procedure of no arguments that returns the void object. It can be used to force
> expressions that are used for effect or whose values are otherwise unspecified to evaluate to a
> consistent, trivial value. Since most Chez Scheme operations that are used for effect return the
> void object, however, it is rarely necessary to explicitly invoke the `void` procedure.

There is no `void?` predicate in the documented interface. That is consistent: hand users a way to
*produce* the non-value, not a way to *depend on* it.

### Chez does not normalize either

Worth knowing before treating Chez as a normalization model, because the word "usually" in its own
documentation is doing real work. Probing Chez Scheme 10.3.0 locally:

```
(if #f #f)                            => #<void>
(set! x 2)                            => #<void>
(vector-set! v 0 9)                   => #<void>
(when #f 1) / (unless #t 1)           => #<void>
(cond (#f 1)) / (case 1 ((2) 3))      => #<void>
(newline) / (write 1)                 => #<void>
(values)                              => 0 values
(for-each (lambda (x) (* x 10)) '(7))       => 70        ;; <-- not void
(for-each (lambda (x) (* x 10)) '(1 2 7))   => 70        ;; <-- last call's value
(for-each (lambda (x) (* x 10)) '())        => #<void>
(for-each (lambda (a b) (+ a b)) '(1 2) '(3 4)) => 6
```

`for-each` returns the value of the **last application**, falling back to void only for the empty
list. The mechanism is not documented, but the obvious reading is that the last iteration is a tail
call and letting its value through costs nothing while discarding it costs an instruction. Either way
this is Rozas's reason 2 observed in the wild, thirty-five years on: where a natural value already
sits in the return register, an implementation that documents a distinguished void object still
declines to spend anything overwriting it.

The lesson for Emit is precise, and it cuts against over-engineering: adopt a distinguished value as
the *default* for sites with no natural value, but do not add code to *force* it at sites where a
value falls out for free. Chez's own "usually" is the honest word.

### Gauche warns you

Gauche is the one implementation that acted on the *use-site* half of the debugging argument Rozas
dismissed. From [Undefined values](https://practical-scheme.net/gauche/man/gauche-refe/Undefined-values.html),
`#<undef>` is documented as "a value used as a filler where the actual value doesn't matter, or
there's no other suitable value, or the binding hasn't been calculated," with an explicit warning
against branching on it:

> Since the return value isn't specified, no one should be using it. The code that tests such result
> value as a generalized boolean may break if the procedure changes the return value.

And then the tooling that makes the warning enforceable:

> `GAUCHE_CHECK_UNDEFINED_TEST` — warn when `#<undef>` value is used in the test of branches.

This is the single most useful idea in the survey for a compiler with Emit's stated transparency
goals. It is also **only possible with a distinguished value.** If the unspecified value is `#f`,
there is nothing to detect: every `(if (vector-set! ...) ...)` looks exactly like a legitimate test of
a legitimately-false result. Gauche also documents the distinction that ticket #49 turned on: "Do not
confuse undefined values with unbound variables; A variable can be bound to `#<undef>`, for it is just
an ordinary first-class value."

### Racket, Larceny, MIT, Guile

- **Racket** ([reference §4.21](https://docs.racket-lang.org/reference/void.html),
  [guide §3.12](https://docs.racket-lang.org/guide/void_undefined.html)): "The constant `#<void>` is
  returned by most forms and procedures that have a side-effect and no useful result." Racket makes
  the same REPL choice as Chez — when the result is `#<void>`, the REPL prints nothing — and keeps
  `void` (which accepts and ignores any arguments) as the generator. Racket additionally maintains a
  *separate* `undefined` value for letrec-style use-before-initialization, keeping "no interesting
  value" distinct from "not yet computed."
- **Larceny** ([user manual §4.1](https://larcenists.github.io/Documentation/Documentation1.3/user-manual-alt.html)):
  "By default, Larceny recognizes several Larceny-specific flags of the form permitted by the R6RS.
  The flag you are most likely to encounter represents **one of** Larceny's unspecified values:
  `#!unspecified`." The plural is deliberate — Larceny keeps more than one, which is exactly the
  latitude R6RS granted and a reminder that "the unspecified value" is not universally singular.
- **MIT/GNU Scheme** likewise keeps two distinct objects: `#!unspecific` for "no interesting value"
  and `#!default` for "no argument supplied." Its reference manual gives the conservative gloss —
  when a value is unspecified, "the expression will evaluate to some object without signalling an
  error, but programs should not depend on the value in any way." Note that the old MIT convention
  Rozas cited in 1989 (assignment returning the *old* contents) is no longer the documented behavior;
  modern MIT documents `set!` as unspecified like everyone else. The impasse outlived the position
  that created it.
- **Guile** exposes the value as the variable `*unspecified*` and prints `#<unspecified>`. Guile's is
  the most "first-class" treatment of the group — `*unspecified*` doubles as a legitimate filler
  argument, e.g. `(make-typed-array 'u32 *unspecified* 4)` — which is precisely the drift toward
  "defined-undefined value" that Cowan objected to in ballot #49.

The convergence is striking given that no standard ever asked for it. Across implementations with no
common ancestry: one distinguished object, not `#f`, printed non-readably, suppressed at the REPL,
generator exposed, predicate withheld or discouraged.

Reader syntax is the one point where the field genuinely splits — roughly half the implementations in
the table above provide it (`#!void`, `#void`, `#!unspecific`, `#!unspecified`) and half deliberately
do not. Chez's reasoning for withholding it is the sharper argument: the value "is not meant to be
used as a datum," and giving it a written form invites exactly the dependence everyone says they want
to prevent.

## Where Emit stood before

Historical, kept because it is the evidence the recommendation rests on. Before the
`unspecified-value` change Emit did not have *one* unspecified value — it had **two**, split along
the Scheme/C boundary, and neither was distinct from an ordinary datum. Observed by running
`./build/emit repl`:

| Expression | Emit *before* | Source of the value |
|---|---|---|
| `(if #f #f)` | `#f` | [src/parse.ss:273](../src/parse.ss) desugars one-armed `if` to `(const #f)` |
| `(void)` | `#f` | [src/prelude.scm:222](../src/prelude.scm): `(define (void) (if #f #f))` |
| `(when #f 1)`, `(unless #t 1)` | `#f` | prelude, via `(if #f #f)` |
| `(cond (#f 1))`, `(case 9 ((1) 2))` | `#f` | derived-form no-match default |
| `(for-each car '((1)))` | `#f` | `%for-each1` base case returns `(if #f #f)` |
| `(display "")`, `(newline)` | `()` | `rt_display`/`rt_newline` return `NIL_V` |
| `(write-char #\a)` | `()` | `rt_write_char` returns `NIL_V` |
| `(vector-set! v 0 1)` | `()` | `rt_vector_set` returns `NIL_V` |

The syntactic forms and the prelude yielded `#f`; every side-effecting C primitive yielded `NIL_V` —
the empty list. Both are R7RS-conforming in isolation (each is an object, each is a single value, no
error is signaled), so this was not a bug against the report. But it meant Emit had *no* unspecified
value in the sense every surveyed implementation means it, and it put Emit simultaneously in the
four-member `#f` minority (Bigloo, JScheme, Dream, Owl Lisp) and the `()` minority (TinyScheme, Elk,
UMB, and others) out of roughly forty implementations.

The split was also invisible in the source: nothing in the runtime comments flagged `NIL_V` as
standing for "unspecified," so the two conventions had drifted with nothing to catch them.

Two facts made changing it cheap:

1. **The runtime already reserves the encoding.** [src/runtime/runtime.c:8-11](../src/runtime/runtime.c)
   documents tag `001` as a misc-immediate *family* with a 5-bit subtype in bits 3–7, currently using
   subtype 0 for booleans and 1 for characters, and states outright: "subtypes 2,3,… reserved
   (eof-object, unspecified, …)". A distinguished unspecified value costs one subtype constant, no
   new primary tag, no heap allocation, and no header word — which matters for the small-executable
   goal in [CLAUDE.md](../CLAUDE.md).
2. **Nothing depended on the old choice.** A grep of `test/` and `demos/` for `(void)` and
   `(if #f #f)` returned no hits, so no test asserted what the unspecified value was.

And one fact made the REPL half of the recommendation immediately relevant rather than deferred:
Emit's REPL **already echoed every result unconditionally**. `run_thunk`
([src/emit.cpp](../src/emit.cpp)) called `rt_write(r)` on whatever the compiled thunk returned and
printed a newline, with no suppression path — as the `interactive-repl` spec requires ("prints the
resulting value using the runtime value printer"). So an interactive session read:

```
> (display "hi")
hi()
> (define x 5)
5
> (vector-set! v 0 1)
()
```

Every side-effecting form echoed a junk value, and `display` produced the memorable `hi()`. That was
the concrete, visible cost of having no distinguished value: there is nothing the REPL *could*
suppress, because `()` and `#f` are both legitimate results that must be printed when a program really
does return them.

## Recommendation

Adopted and implemented as OpenSpec change `unspecified-value`. The survey above is the evidence; this
section is what it adds up to, with the reasoning attached so it can be revisited.

### The policy in brief

Emit adopts **one distinguished unspecified value** — a single immediate, distinct from `#f` and from
every other value — returned wherever R7RS leaves a return value unspecified and no natural value is
already at hand.

| Question | Decision | Follows |
|---|---|---|
| Which object? | one unique immediate, **not** `#f` | Chez, Racket, Guile, Gauche, Chicken, Gambit, MIT, Larceny, STklos |
| How many values? | always exactly one | R7RS [§7.3](r7rs/11-language-changes.md); ballot #68 |
| Reader syntax? | none — it is not a datum | Chez, Racket, Chicken, Guile |
| Written form? | `#<unspecified>` | Guile, Chicken, Mosh, Sagittarius |
| REPL echo? | suppressed | Chez, Racket, and most others |
| Generator? | yes — keep `(void)` | Chez; ballot #49 (Hsu) |
| Predicate? | **no** — do not add `unspecified?` | ballot #49 result (6:3); Gleckler, Cowan, Shinn |
| Guarantee to users? | none — documented as unreliable | Chez's "avoid counting on this behavior" |

Nothing here required new tooling. Decision 1 is what makes a Gauche-style diagnostic *possible*
later; building it was out of scope.

### The decisions in detail

**1. Adopt one distinguished unspecified value.** Add `SUB_UNSPEC` as misc-immediate subtype 2 — the
slot the runtime already reserves. Mirror it in the emitter's constant encoder alongside the existing
`TRUE_V`/`FALSE_V` cases at [src/emit.ss:118](../src/emit.ss).

The decisive argument is not conformance or convention but **diagnosability**. Of all the candidate
values, `#f` is uniquely bad: it is the one that collides with a legitimate, constantly-tested result.
Most implementations that declined a distinguished value at least picked something truthy (`()`, `#t`),
which fails loudly in a different direction; only four of ~40 chose `#f`. With `#f`,
`(if (vector-set! v 0 1) 'a 'b)` is indistinguishable — to a reader, a linter, or the compiler — from
a deliberate test of a genuinely false result. That kills Gauche's `GAUCHE_CHECK_UNDEFINED_TEST`
approach, which is the one demonstrated-useful piece of tooling in this whole area and a natural fit
for a compiler whose stated goal is transparency. Note the asymmetry: adopting a distinguished value
keeps the diagnostic option open without obliging Emit to build it now, whereas keeping `#f`
forecloses it permanently.

**2. Always exactly one value.** Do not follow R6RS's zero-values latitude. R7RS
[§7.3](r7rs/11-language-changes.md) forbids it for unspecified results, no surveyed implementation
does it, and Emit's `HDR_MV` bundle ([src/runtime/runtime.c:71](../src/runtime/runtime.c)) already
gives `(values)` a representation — so there is a tempting path here that leads nowhere useful.

**3. No reader syntax; print non-readably as `#<unspecified>`.** Follow Chez exactly: the value is not
a datum. `#<unspecified>` is more self-describing than `#<void>` and matches Guile, Chicken, Mosh, and
Sagittarius. Deciding this now avoids a Guile-style drift where the value becomes a legitimate filler
argument that programs pass around on purpose.

**4. Export the generator, not a predicate.** Keep `(void)` in the prelude — retargeted to return the
new immediate instead of `#f` — and do not add `unspecified?`. This is Hsu's ballot position and
Chez's shipped interface: give users a way to *declare* "this procedure has no interesting value,"
not a way to *depend on* someone else's non-value. Gleckler's objection is the one to respect here:
"Being able to test for it makes it defined."

**5. Default, not mandate — and document the word "usually."** Use the distinguished value wherever
there is no natural value: one-armed `if`, no-match `cond`/`case`, `set!`, mutators, `when`/`unless`,
I/O procedures. The rule to take from Chez is narrow — do not *add* code to force the value at sites
where a value already falls out for free. It is not an instruction to un-normalize what Emit already
normalizes: `%for-each1` ([src/prelude.scm:177](../src/prelude.scm)) is written as
`(if (null? xs) (if #f #f) (begin (f (car xs)) …))`, so it deliberately returns the unspecified value
rather than the last application's. That costs nothing to keep and is *more* diagnosable than Chez's
behavior, so keep it.

The honest tension: every site that lets a natural value through is a site the Gauche-style check can
never flag. Consistency and cheapness pull in opposite directions here, and this recommendation
resolves it in favor of consistency wherever the prelude already pays the cost. Then write Chez's
caveat into Emit's own documentation regardless: this is what Emit happens to return, it is not a
promise, and portable programs must not rely on it.

**6. Suppress it in the REPL.** Chez, Racket, and most others print nothing when the result is the
unspecified value. This was not deferred work: Emit's REPL echoed every result via `rt_write` in
`run_thunk` ([src/emit.cpp](../src/emit.cpp)), so it printed `()` and `#f` noise after every
side-effecting form. Suppression is only implementable given decision 1 — with `#f` and `()` there is
nothing safe to suppress — which made this the most immediately user-visible payoff of the change.

The guard is deliberately *not* in `print_val`, so `(write (if #f #f))` still prints
`#<unspecified>`: suppression is a REPL display policy, not a property of the value. It is also not
applied to `emit run`, which prints a whole *program's* value — that is a batch report, and it matches
what the AOT executable prints, so dev→ship fidelity is preserved. (This resolves the open question the
design doc left on that point.)

**7. Write down the per-category policy.** The five categories at the top of this document need
separate answers, and only category 1 is settled by the above. Category 2 in particular is already
live: the JIT and AOT paths disagree on argument evaluation order
([demos/records.scm:16](../demos/records.scm)). Dev→ship fidelity is a stated project goal in
[CLAUDE.md](../CLAUDE.md), and an unspecified-order divergence *between Emit's own two backends* is a
fidelity bug in the project's own terms even though it is standards-conforming. Now tracked as
[issue #6](https://github.com/bwbensonjr/emit/issues/6); it deserves its own change proposal.

### What implementation changed about the plan

Three things the proposal did not anticipate, recorded because each is a trap for the next person:

**The value is a synthesized primcall, not a `const` payload.** The plan said "emit the
unspecified-value constant" from `encode-const`, which would require the IR to carry a *host* object
as a `(const …)` payload. That breaks dump parity: `src/dump.ss` prints datums through the runtime
printer (`%stderr-write`), so the same IR would render as `#<void>` under the Chez bootstrap and
`#<unspecified>` under a self-hosted Emit, and `test/dump-parity-tests.sh` compares exactly those two.
The parser instead synthesizes the reserved zero-arg primcall `(primcall %unspec)`, whose head is a
symbol and prints identically under both hosts. `emit.ss` lowers it to the bare immediate — no call,
so it needs no `declare` and no `prim-table` entry. `%unspec` is deliberately kept out of `*prims*`,
so source cannot call it: the value stays reachable only by evaluating a form that yields it.

**`when`, `unless`, and no-match `cond` were three more `#f` sites.** The proposal's inventory missed
them: they are `syntax-rules` macros in the prelude that hardcoded `#f` — `(if test (begin e ...) #f)`,
`(if test #f (begin e ...))`, and `((_) #f)` — so they kept returning `#f` after the parser and runtime
were both converged. `case` and `do` were already correct because they used the `(if #f #f)` idiom.
Fixing them meant `lib/scheme/base.sld` had to be regenerated too (`tools/gen-scheme-base.ss`), since
it is generated from the prelude and guarded for staleness.

**Editing `src/prelude.scm` at all — even a comment — requires a bootstrap regen.** The prelude source
is embedded verbatim as a string constant in `bootstrap/embed.ll`, so a comment-only edit changes the
committed IR. Skipping the regen leaves `test/self-host-fixpoint.sh` failing with a handful of
diff lines in that one string constant, which reads like a compiler divergence and is not one.

**A top-level `define` was a fourth site, found after the fact.** `define` is a *definition*, not an
expression, so R7RS gives it no value and it never appeared in the category-1 inventory — but its
lowering, `(global-set! sym init)`, returned the *stored value*, so `(define square (lambda (n) …))`
echoed `#<procedure>` at the REPL as though the definition evaluated to the procedure. That also made
it disagree with a local `(set! x v)`, which lowers to a `set-box!` primcall and so already yielded the
unspecified value through `rt_set_box` — an internal inconsistency, not merely a cosmetic one.
`global-set!` now yields the unspecified value, which makes `define` silent at the prompt (the echo
suppression does the rest) and matches Chez, Racket, Guile, and Gambit. `define-syntax` was already
quiet. Note the blast radius was almost entirely in *library initializers*: 8520 changed IR lines
across 71 demos, every one a `ret` in a `scheme.base:__init_N` per-define thunk whose value is
discarded, and none in any procedure body.

### Costs and counterarguments

Stated plainly, since the recommendation is not free:

- **Real work, small scope.** A new immediate touches `runtime.c` (the constant, the `write`/`display`
  printer, and the ~dozen side-effecting `rt_*` entry points that currently `return NIL_V`), the
  emitter's constant encoder, `parse.ss`'s one-armed `if` desugaring, the prelude's `void`, and
  `run_thunk`'s REPL echo. Contained, but spread across the Scheme/C boundary — which is exactly why
  the two conventions drifted in the first place.
- **Two behavior changes, both conforming.** `(if (vector-set! v 0 1) 'a 'b)` flips from `'a` (today,
  since `()` is truthy) to `'a` (unchanged — the new value is also truthy), but
  `(if (if #f #f) 'a 'b)` flips from `'b` to `'a`. And `(null? (display ""))` flips from `#t` to `#f`.
  No test in `test/` or `demos/` depends on either. The second is the one to grep for at
  implementation time.
- **The standards-level objection stands.** Cowan and Gleckler are right that a distinguished value
  "encourages people to have such a defined-undefined value." But their objection was to putting it in
  *the standard* — where it becomes a portable guarantee. An implementation choosing one for its own
  diagnostics is a different act, which is exactly why Chez, Racket, Guile, Gauche, Chicken, Gambit,
  MIT, Larceny and STklos all did it while voting it out of R7RS. Withholding the predicate
  (decision 4) is what keeps Emit on the right side of that line.
- **Rozas's propagation critique still applies.** A distinguished value genuinely does not help when
  it is stored in a structure and tripped over much later. It helps at the *use site* — the branch
  test — which is where Gauche aims and where most real mistakes are made. The claim here is narrow
  and should stay narrow.

## Sources

Standards and design records:

- R7RS-small, local copy: [§1.3.2 Error situations and unspecified behavior](r7rs/02-overview.md#errorsituations),
  [§4 Expressions](r7rs/05-expressions.md), [§6 Standard procedures](r7rs/07-standard-procedures.md),
  [§7.3 Language changes](r7rs/11-language-changes.md)
- [R6RS Rationale §11.9.3, Multiple values](https://www.r6rs.org/final/html/r6rs-rationale/r6rs-rationale-Z-H-13.html)
- Guillermo J. Rozas, ["Comments on the draft standard"](https://groups.csail.mit.edu/mac/ftpdir/scheme-mail/HTML/rrrs-1989/msg00075.html),
  `rrrs-authors`, 17 April 1989 — replying to Jonathan S. Shapiro; the canonical rationale. Thread
  continues at [msg00076](https://groups.csail.mit.edu/mac/ftpdir/scheme-mail/HTML/rrrs-1989/msg00076.html)
  and [msg00077](https://groups.csail.mit.edu/mac/ftpdir/scheme-mail/HTML/rrrs-1989/msg00077.html).
  Full archive index: [RRRS-Authors Mailing-List Archive](https://groups.csail.mit.edu/mac/projects/scheme/rrrs-archive.html)
- R7RS-WG1 ballot 2, items #68 and #49: [ballot text](https://small.r7rs.org/wiki/WG1Ballot2/),
  [results and voter rationales](https://small.r7rs.org/wiki/WG1Ballot2Results/)
- [R7RS ticket #49, "undefined values"](https://small.r7rs.org/ticket/49/) — closed `wontfix`

Implementation surveys ([schemedoc/surveys](https://github.com/schemedoc/surveys)):

- [void-value.md](https://github.com/schemedoc/surveys/blob/master/surveys/void-value.md) ·
  [one-armed-if.md](https://github.com/schemedoc/surveys/blob/master/surveys/one-armed-if.md) ·
  [multiple-values.md](https://github.com/schemedoc/surveys/blob/master/surveys/multiple-values.md) ·
  [default-values.md](https://github.com/schemedoc/surveys/blob/master/surveys/default-values.md) ·
  [empty-define.md](https://github.com/schemedoc/surveys/blob/master/surveys/empty-define.md) ·
  [what-load-returns.md](https://github.com/schemedoc/surveys/blob/master/surveys/what-load-returns.md) ·
  [set-undefined-variable.md](https://github.com/schemedoc/surveys/blob/master/surveys/set-undefined-variable.md)

Implementation documentation:

- Chez Scheme User's Guide, ch. 1 [Introduction](https://cisco.github.io/ChezScheme/csug10.0/intro.html)
  ("Notational Conventions") and ch. 6 [Operations on Objects](https://cisco.github.io/ChezScheme/csug10.0/objects.html)
  ("Void") — local source at `csug/intro.stex` and `csug/objects.stex` in the Chez checkout
- Gauche Users' Reference, [Undefined values](https://practical-scheme.net/gauche/man/gauche-refe/Undefined-values.html)
- Racket Reference, [§4.21 Void](https://docs.racket-lang.org/reference/void.html); Racket Guide,
  [§3.12 Void and Undefined](https://docs.racket-lang.org/guide/void_undefined.html)
- Larceny User Manual, [§4.1 Flags](https://larcenists.github.io/Documentation/Documentation1.3/user-manual-alt.html)
- [MIT/GNU Scheme Reference Manual](https://www.gnu.org/software/mit-scheme/documentation/stable/mit-scheme-ref/Assignments.html)
- [Guile Reference Manual](https://www.gnu.org/software/guile/manual/) — `*unspecified*`

Local probes (Chez 10, macOS) recorded inline in
[Chez does not normalize either](#chez-does-not-normalize-either).
