/* runtime.c -- C runtime for the core-lambda-slice compiler.
 *
 * Value representation (tagged pointers, one 64-bit word), shared verbatim with
 * the LLVM IR emitter. Low 3 bits are the tag; the type of a heap object is
 * encoded in its pointer tag, so heap objects carry no header word.
 *
 *   tag 000  fixnum    immediate, payload = word >> 3 (signed)
 *   tag 001  misc-imm  immediate family; bits 3-7 = subtype, bits 8+ = payload:
 *                        subtype 0 boolean  (#f = 1, #t = 257)
 *                        subtype 1 char     (payload = Unicode codepoint)
 *                        subtype 2 unspec   (the unspecified value; only 17)
 *                        subtype 3 eof      (the end-of-file object; only 25)
 *                        subtypes 4,5,... reserved
 *   tag 010  nil       immediate, the empty list (only value 0b010 = 2)
 *   tag 011  pair      pointer, heap {car, cdr}
 *   tag 100  closure   pointer, heap {code_ptr, free0, ...}
 *   tag 101  box       pointer, heap {value}   (assignment-converted vars)
 *   tag 110  symbol    pointer, heap {name}    (interned; eq? by identity)
 *
 * Scheme truthiness: only #f is false; everything else (incl. 0 and ()) is true.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <dirent.h>
#include <sys/stat.h>
#include <math.h>
#include <setjmp.h>
#include <gc/gc.h>

typedef intptr_t val;

/* Trap escape hook.  A runtime trap (e.g. an arity error) aborts the process
 * in the AOT/batch model.  A persistent host (the ORC/LLJIT REPL) instead sets
 * rt_trap to a jmp_buf and setjmp()s before calling into JIT'd code, so a trap
 * longjmps back to the host loop and the session survives.  NULL => exit(1),
 * preserving the standalone-executable behavior.  rt_trap_msg holds the last
 * trap's message so a host can report it on its result channel (the host
 * silences the runtime's stderr to keep it out of the framed pipe). */
jmp_buf *rt_trap = NULL;
char rt_trap_msg[128] = "";

/* Is a trap currently being DELIVERED to a Scheme handler (change:
 * catchable-errors-with-kinds, design D4)?  While set, a further trap skips the
 * raiser in rt_trap_deliver and takes the print-and-abort path instead, so a handler
 * that itself traps reports rather than recursing -- and a second trap cannot
 * overwrite rt_trap_msg out from under the first, which is the same worry from the
 * other side.
 *
 * IT IS CLEARED WHERE THE LONGJMP LANDS, not after the raiser call: a handler that
 * escapes never returns to the trapping frame, so no cleanup there would run.  The
 * two landing sites are rt_run_guarded's caught branch and rt_guard_reset (which
 * every host calls after catching an outermost trap).  Getting this wrong makes the
 * SECOND trap of a session fatal, which is a specific, testable failure. */
static int rt_trap_in_flight = 0;

#define TAG_MASK    7
#define TAG_FIXNUM  0
#define TAG_BOOL    1
#define TAG_NIL     2
#define TAG_PAIR    3
#define TAG_CLOSURE 4
#define TAG_BOX     5
#define TAG_SYMBOL  6
#define TAG_EXT     7   /* extended heap object; first word = a header code */

/* Tag 001 (TAG_BOOL) is a misc-immediate FAMILY: bits 3-7 hold a 5-bit subtype,
 * bits 8+ the payload.  Booleans, characters, and the unspecified value are all
 * immediates in this family; further singletons (eof-object) can take new
 * subtypes without needing a new primary tag. */
#define SUB_BOOL    0
#define SUB_CHAR    1
#define SUB_UNSPEC  2   /* the unspecified value (change: unspecified-value) */
#define SUB_EOF     3   /* the end-of-file object (change: scheme-io-library, design D3) */

/* header codes for TAG_EXT objects (tags 0-6 are exhausted, so new heap types
 * live under tag 7 and are discriminated by this header word) */
#define HDR_STRING     0
#define HDR_BYTEVECTOR 1   /* { HDR_BYTEVECTOR, byte-length, unsigned char *bytes } (reclaims
                            * the retired HDR_CHAR slot -- characters are now immediate) */
#define HDR_VECTOR     2   /* { HDR_VECTOR, length, elem0, ... } */
#define HDR_ERROR      3   /* { HDR_ERROR, message-string, irritants-list, kind-symbol } (R7RS
                            * error obj).  The KIND is APPENDED (change:
                            * catchable-errors-with-kinds, design D1) precisely so that the
                            * readers which index words 1 and 2 directly -- err_write and the
                            * value printer -- stay correct without being touched. */
#define HDR_HASHTABLE  4   /* { HDR_HASHTABLE, spine-vector } -- opaque wrapper around a
                            * mutable spine #(count buckets _); ops live in the prelude */
#define HDR_RECORD     5   /* { HDR_RECORD, type-descriptor, field-count, field0, ... } -- user
                            * record; the descriptor (itself an ext obj) is the per-type identity
                            * token.  The field count exists solely so the record accessors can be
                            * bounds-checked like every other indexed accessor (change:
                            * checked-indexed-access, design D6): nothing else needs it -- the
                            * printer prints only the type name and equal? on records is identity. */
#define HDR_RECORD_TYPE 6  /* { HDR_RECORD_TYPE, name-string } -- a record type descriptor;
                            * object identity (eq?) distinguishes types, name is for printing */
#define HDR_MV          7  /* { HDR_MV, values-list } -- a multiple-values bundle (change:
                            * multiple-values).  Disjoint wrapper so `values` of 0 or >=2 args
                            * is never confused with a real single value; consumed only by
                            * call-with-values.  A unary `(values x)` returns x, not a bundle. */
#define HDR_FLONUM      8  /* { HDR_FLONUM, double } -- an inexact real (change: inexact-numbers).
                            * A double needs all 64 bits, so a flonum cannot be an immediate;
                            * the box is atomic (no pointers inside).  All numeric semantics
                            * live in the rt_* arithmetic, so the emitter's inline fixnum fast
                            * path routes any non-fixnum operand here automatically. */

#define FIX(n)     ((val)(((intptr_t)(n)) << 3))
#define UNFIX(v)   (((intptr_t)(v)) >> 3)
#define FALSE_V    ((val)TAG_BOOL)                     /* 1   (subtype BOOL, payload 0) */
#define TRUE_V     ((val)((1 << 8) | TAG_BOOL))        /* 257 (subtype BOOL, payload 1) */
#define NIL_V      ((val)TAG_NIL)                       /* 2 */
/* THE unspecified value: one distinguished immediate, returned wherever R7RS leaves
 * a result unspecified.  Distinct from #f and () by construction (different subtype /
 * primary tag), and truthy since it is not FALSE_V.  No reader syntax -- it is not a
 * datum -- and no predicate is exposed to Scheme (see openspec change
 * unspecified-value, decision 4).  The emitter writes this same literal; the two must
 * agree (src/emit.ss). */
#define UNSPEC_V   ((val)((SUB_UNSPEC << 3) | TAG_BOOL))  /* 17 (subtype UNSPEC, payload 0) */
/* THE end-of-file object (change: scheme-io-library, design D3).  R7RS requires it to be
 * distinguishable from every other object, so it cannot reuse #f, (), or UNSPEC_V -- a
 * program that reads a #f datum must still be able to tell that from end of input.  It
 * costs no header code and no allocation: subtype 3 is the slot the misc-immediate family
 * comment reserved for exactly this.  Unlike UNSPEC_V it IS Scheme-visible, via the
 * eof-object / eof-object? primitives. */
#define EOF_V      ((val)((SUB_EOF << 3) | TAG_BOOL))     /* 25 (subtype EOF, payload 0) */
#define tag_of(v)  (((intptr_t)(v)) & TAG_MASK)
#define as_ptr(v)  ((val *)(((intptr_t)(v)) & ~(intptr_t)TAG_MASK))
#define tag_ptr(p, t) ((val)(((intptr_t)(p)) | (t)))

/* misc-immediate subtype accessor, plus the char immediate: payload = codepoint
 * in bits 8+, subtype SUB_CHAR in bits 3-7, primary tag TAG_BOOL in bits 0-2. */
#define imm_subtype(v) ((((intptr_t)(v)) >> 3) & 0x1F)
#define MK_CHAR(cp)    ((val)((((intptr_t)(cp)) << 8) | (SUB_CHAR << 3) | TAG_BOOL))
#define CHAR_CP(v)     (((intptr_t)(v)) >> 8)
#define is_bool(v)     (tag_of(v) == TAG_BOOL && imm_subtype(v) == SUB_BOOL)
#define is_char(v)     (tag_of(v) == TAG_BOOL && imm_subtype(v) == SUB_CHAR)
/* C-side only: used by the printer and by the REPL's echo suppression.  Deliberately
 * NOT surfaced as a Scheme predicate. */
#define is_unspec(v)   (tag_of(v) == TAG_BOOL && imm_subtype(v) == SUB_UNSPEC)
#define is_eof(v)      (tag_of(v) == TAG_BOOL && imm_subtype(v) == SUB_EOF)

static inline val truthy(int b) { return b ? TRUE_V : FALSE_V; }

/* --- argument types (change: checked-primitive-arguments, design D3) -------
 * Every primitive that DEREFERENCES an argument verifies the argument's tag
 * first.  `as_ptr` masks the tag bits off and casts, so without this a wrong-typed
 * argument is an unchecked memory access: `(car '())` dereferenced address 0 and
 * `(car 7)` reinterpreted the payload as an address (GitHub issue #84).
 *
 * ORDERING IS THE POINT for the indexed accessors.  `CHECK_INDEX` above reads its
 * bound out of the object's own header -- itself an unchecked load -- so a bounds
 * check on an unverified object takes its bound from garbage.  The type check runs
 * BEFORE the length load, or the bounds guarantee `checked-indexed-access` states
 * holds only for arguments that were already the right type.
 *
 * These `is_*` predicates are THE definition of each type test: the Scheme-level
 * predicates below (rt_pair_p, rt_vector_p, ...) delegate to them, so a guard here
 * and the predicate a program can call cannot disagree about what a vector is. */
static void rt_fatalf(const char *fmt, ...);       /* defined with the trap machinery below */

static int is_pair(val v)     { return tag_of(v) == TAG_PAIR; }
static int is_box(val v)      { return tag_of(v) == TAG_BOX; }
static int is_symbol(val v)   { return tag_of(v) == TAG_SYMBOL; }
static int is_closure(val v)  { return tag_of(v) == TAG_CLOSURE; }
static int is_fixnum(val v)   { return tag_of(v) == TAG_FIXNUM; }
/* tags 0-6 are exhausted, so every other heap type lives under tag 7 and is
 * discriminated by its header word.  A bare tag test would accept any of them --
 * which is exactly how `(vector-ref "abc" 0)` would read a string's byte pointer
 * as an element -- so the header is part of the test, never optional. */
static int is_ext(val v, intptr_t hdr) {
  return tag_of(v) == TAG_EXT && (intptr_t)as_ptr(v)[0] == hdr;
}
static int is_string(val v)     { return is_ext(v, HDR_STRING); }
static int is_vector(val v)     { return is_ext(v, HDR_VECTOR); }
static int is_bytevector(val v) { return is_ext(v, HDR_BYTEVECTOR); }
static int is_record(val v)     { return is_ext(v, HDR_RECORD); }
static int is_hashtable(val v)  { return is_ext(v, HDR_HASHTABLE); }
static int is_mv(val v)         { return is_ext(v, HDR_MV); }
static int is_error_obj(val v)  { return is_ext(v, HDR_ERROR); }

/* The type a value HAS, for the diagnostic.  A fixed string per tag/header rather
 * than a rendering of the value itself (design D4): the value that reached a type
 * check is the one most likely to be malformed, the printer walks it structurally,
 * and an arbitrarily deep or circular structure would fill rt_trap_msg with noise
 * where the useful information is the type.  `+: not a number` set that precedent. */
static const char *rt_type_name(val v) {
  switch (tag_of(v)) {
    case TAG_FIXNUM:  return "a fixnum";
    case TAG_NIL:     return "the empty list";
    case TAG_PAIR:    return "a pair";
    case TAG_CLOSURE: return "a procedure";
    case TAG_BOX:     return "a box";
    case TAG_SYMBOL:  return "a symbol";
    case TAG_BOOL:
      switch (imm_subtype(v)) {
        case SUB_BOOL:   return "a boolean";
        case SUB_CHAR:   return "a character";
        case SUB_UNSPEC: return "the unspecified value";
        case SUB_EOF:    return "the end-of-file object";
      }
      return "an immediate";
    default:                                    /* TAG_EXT: dispatch on the header */
      switch ((intptr_t)as_ptr(v)[0]) {
        case HDR_STRING:      return "a string";
        case HDR_BYTEVECTOR:  return "a bytevector";
        case HDR_VECTOR:      return "a vector";
        case HDR_ERROR:       return "an error object";
        case HDR_HASHTABLE:   return "a hash table";
        case HDR_RECORD:      return "a record";
        case HDR_RECORD_TYPE: return "a record type";
        case HDR_MV:          return "a values bundle";
        case HDR_FLONUM:      return "a flonum";
      }
      return "a heap object";
  }
}
static void rt_type_error(const char *who, const char *want, val got) {
  rt_fatalf("%s: not %s: got %s", who, want, rt_type_name(got));
}
/* The index of an indexed accessor (design D10).  Not a safety fix -- UNFIX of a
 * tagged pointer yields a huge index that CHECK_INDEX already rejects -- but the
 * message it produced named the wrong defect: `index out of range: 544356370`. */
static void rt_index_type_error(const char *who, val got) {
  rt_fatalf("%s: index is not an exact integer: got %s", who, rt_type_name(got));
}
#define CHECK_TAG(who, v, pred, want)                            \
  do {                                                           \
    val chk_t_ = (v);                                            \
    if (!pred(chk_t_)) rt_type_error((who), (want), chk_t_);      \
  } while (0)
#define CHECK_FIXNUM(who, i)                                     \
  do {                                                           \
    val chk_f_ = (i);                                            \
    if (!is_fixnum(chk_f_)) rt_index_type_error((who), chk_f_);  \
  } while (0)

/* --- allocation -------------------------------------------------------- */
/* raw n-word allocation; the emitter tags the result and fills the slots
 * (used for closures, whose size/content is per-lambda).
 *
 * Returns a POINTER, not a `val`, so the emitter can declare it
 * `align 8` (docs/PERFORMANCE.md P6-B).  Tagging needs the low three bits of the
 * address to be zero, and without that fact stated LLVM cannot prove that masking
 * a tagged closure word recovers the pointer it was built from -- so it could not
 * forward the code-pointer store to the load, and every call through a closure it
 * had just allocated stayed indirect and uninlinable.  GC_MALLOC is at least
 * word-aligned, so the attribute is simply telling the optimizer what was already
 * true. */
void *rt_alloc_words(intptr_t n) { return GC_MALLOC((size_t)n * sizeof(val)); }

/* --- pairs ------------------------------------------------------------- */
val rt_cons(val a, val b) {
  val *p = (val *)GC_MALLOC(2 * sizeof(val));
  p[0] = a; p[1] = b;
  return tag_ptr(p, TAG_PAIR);
}
val rt_car(val v) { CHECK_TAG("car", v, is_pair, "a pair"); return as_ptr(v)[0]; }
val rt_cdr(val v) { CHECK_TAG("cdr", v, is_pair, "a pair"); return as_ptr(v)[1]; }
/* R7RS 6.4.  Pairs were the one aggregate Emit left immutable (GitHub issue #82) --
 * vectors, strings, bytevectors and records all had mutators -- so this was an
 * accident of what self-hosting happened to need, not a design.
 *
 * No write barrier: the collector here is Boehm, non-generational, so a plain store
 * into a heap object is safe.  Stated because it is precisely the assumption a
 * later collector change would break silently (design D7).
 *
 * Mutating a pair that came from a QUOTED constant is undefined per R7RS 4.1.2 and
 * is deliberately not checked -- the same answer Emit already gives for string and
 * vector literals.  It is memory-safe either way: a quoted pair is an ordinary heap
 * pair, so the store is well-defined at the representation level. */
val rt_set_car(val p, val v) {
  CHECK_TAG("set-car!", p, is_pair, "a pair");
  as_ptr(p)[0] = v;
  return UNSPEC_V;
}
val rt_set_cdr(val p, val v) {
  CHECK_TAG("set-cdr!", p, is_pair, "a pair");
  as_ptr(p)[1] = v;
  return UNSPEC_V;
}
/* The operator of a call, checked where the code pointer would be loaded out of it
 * (design D6).  This is the one guard in this change that cannot live in a runtime
 * primitive -- there is no primitive to guard, the emitter loads word 0 of the
 * closure and jumps to it -- so the emitter calls this immediately before the mask.
 * Only the INDIRECT call paths reach it: a call to a statically-known closure
 * (self-app / known-app) cannot fail this test and does not pay for it. */
void rt_check_callable(val f) {
  if (!is_closure(f)) rt_type_error("call", "a procedure", f);
}

/* --- boxes (assignment-converted variables) ---------------------------- */
val rt_box(val v)          { val *p = (val *)GC_MALLOC(sizeof(val)); p[0] = v; return tag_ptr(p, TAG_BOX); }
/* Boxes are compiler-generated (assignment conversion), so a user value cannot
 * reach these with the wrong type -- checked anyway, for the reason
 * checked-indexed-access checked the record accessors: the only defect it can
 * report is a bug in the compiler, which is exactly the bug worth reporting. */
val rt_unbox(val b)        { CHECK_TAG("unbox", b, is_box, "a box"); return as_ptr(b)[0]; }
val rt_set_box(val b, val v) {
  CHECK_TAG("set-box!", b, is_box, "a box");
  as_ptr(b)[0] = v; return UNSPEC_V;
}

/* --- flonums (tag-7 HDR_FLONUM: { HDR_FLONUM, double }) ------------------
 * memcpy is used for the double<->word type-punning (well-defined, no strict-
 * aliasing UB).  is_flonum reads the header directly (as_ptr(v)[0]) so it needs
 * no forward reference to ext_hdr, which is defined later. */
static int    is_flonum(val v) { return tag_of(v) == TAG_EXT && as_ptr(v)[0] == HDR_FLONUM; }
static double flo_val(val v)   { double d; memcpy(&d, &as_ptr(v)[1], sizeof d); return d; }
val rt_make_flonum(double d) {
  val *p = (val *)GC_MALLOC_ATOMIC(2 * sizeof(val));   /* no pointers inside */
  p[0] = (val)HDR_FLONUM;
  memcpy(&p[1], &d, sizeof d);
  return tag_ptr(p, TAG_EXT);
}
static int    is_number(val v) { return tag_of(v) == TAG_FIXNUM || is_flonum(v); }
static double to_double(val v) { return tag_of(v) == TAG_FIXNUM ? (double)UNFIX(v) : flo_val(v); }
/* Is v INTEGER-VALUED?  True for every fixnum and for a finite flonum with no
 * fractional part (3.0 but not 2.5, and never an infinity or a NaN).  This is the
 * one definition of what `integer?` means, shared by that predicate, the
 * exactness conversions, and the integer-division family's argument guard
 * (change: numeric-conformance, design D3) -- the test was open-coded in three
 * places before, which is how quotient/remainder came to have none at all. */
static int is_integer_valued(val v) {
  if (tag_of(v) == TAG_FIXNUM) return 1;
  if (!is_flonum(v)) return 0;
  double d = flo_val(v);
  return isfinite(d) && d == floor(d);
}

/* Format a flonum as the shortest decimal that reads back exactly (the classic
 * increase-precision-until-round-trips loop), ALWAYS carrying a '.' or exponent
 * so the reader never mistakes it for an integer.  Non-finite values render as
 * +inf.0 / -inf.0 / +nan.0.  buf must be >= 40 bytes; returns the byte length. */
/* POSITIONAL NOTATION IS PREFERRED within the exponent range below, so 100.0 prints
 * as 100.0 rather than 1e+02 (change: r7rs-lexical-conformance, design D6).  Shortest
 * round-trip says nothing about which NOTATION to use, and %g picks exponent form on
 * its own schedule -- one significant digit at 1e2 is enough for it to prefer 1e+02.
 *
 * The range is CHEZ'S, measured rather than chosen: probing chez across the 1eN and
 * 1.5eN series puts its switchover at the same two points in both, independent of how
 * many significant digits the value needs.  Matching it exactly is what keeps
 * test/dump-parity-tests.sh comparing like with like -- Chez is the bootstrap host, and
 * a printer that agrees on the digits but not the notation is a two-host divergence.
 *
 * The range is a BUFFER constraint too: this writes through snprintf(..., 32, ...), and
 * positional 1e300 would need 300 characters.  With the 17 significant digits the loop
 * can ask for, the worst cases are -1234567890.1234567 (19 bytes) at the top of the
 * range and "-0." + 19 fraction digits (22 bytes) at the bottom -- both clear of 32.
 * Widening either end costs bytes fast and must not be done without the bound.
 *
 * The positional form is a CANDIDATE, never a computation trusted on sight: it is
 * accepted only if it survives the same strtod round-trip that gates the precision
 * search above it, so the round-trip guarantee cannot be lost to exponent arithmetic at
 * the extremes -- where it is hardest to get right and where no test will look. */
#define FLO_POS_EXP_MIN (-3)   /* lowest decimal exponent still printed positionally */
#define FLO_POS_EXP_MAX 10     /* first decimal exponent NOT printed positionally */
static int flonum_format(double d, char *buf) {
  if (isnan(d)) { memcpy(buf, "+nan.0", 7); return 6; }
  if (isinf(d)) { memcpy(buf, d < 0 ? "-inf.0" : "+inf.0", 7); return 6; }
  int len = 0, prec = 1;
  for (prec = 1; prec <= 17; prec++) {
    len = snprintf(buf, 32, "%.*g", prec, d);
    if (strtod(buf, NULL) == d) break;
  }
  const char *ex = strpbrk(buf, "eE");
  if (ex) {                                   /* %g chose exponent form -- reconsider */
    int exp10 = atoi(ex + 1);
    if (exp10 >= FLO_POS_EXP_MIN && exp10 < FLO_POS_EXP_MAX) {
      /* `prec` significant digits with the point after the first leaves prec-1-exp10
       * of them to the RIGHT of it.  At least one, so the '.' is never left bare and
       * the result stays distinguishable from an integer without the fixup below. */
      int frac = prec - 1 - exp10;
      if (frac < 1) frac = 1;
      char alt[40];
      int alen = snprintf(alt, sizeof alt, "%.*f", frac, d);
      if (alen > 0 && alen < 32 && strtod(alt, NULL) == d) {
        memcpy(buf, alt, (size_t)alen + 1);
        return alen;
      }
    }
  }
  if (!strpbrk(buf, ".eEnN")) { buf[len++] = '.'; buf[len++] = '0'; buf[len] = '\0'; }
  return len;
}
/* Build a flonum from a C string literal (used by the compiler for inexact
 * literals -- one alloc, no intermediate scheme string).  strtod is correctly
 * rounded, so it recovers exactly the double the printer produced. */
val rt_flonum_lit(const char *s) { return rt_make_flonum(strtod(s, NULL)); }

/* --- arithmetic and predicates ----------------------------------------- */
/* Deliver whatever is in rt_trap_msg: hand it to the installed Scheme raiser if
 * there is one, else print it and longjmp back to the REPL host (or exit non-zero
 * for the standalone executable).  Defined with the error objects below, since
 * building one is what the raiser path needs.  Never returns.
 * (change: catchable-errors-with-kinds, design D3) */
static void rt_trap_deliver(void);

/* Report a runtime error the same way rt_arity_error does, except that the report
 * is now a CONDITION when a raiser is installed: record the message, then deliver.
 * Uncaught, the bytes on stderr are the same ones this used to print itself
 * (design D7). */
static void rt_fatal(const char *msg) {
  snprintf(rt_trap_msg, sizeof rt_trap_msg, "%s", msg);
  rt_trap_deliver();
}

/* Same, with a printf-style message.  Formats straight into the static trap
 * buffer.  Used by the overflow diagnostics, where naming the operands is most of
 * the diagnostic's value: a wrapped source literal reports the multiply that
 * overflowed while reading it.  (The formatting itself still allocates nothing;
 * building the error object does, which design D5 accepts for exactly the traps
 * that reach a handler.) */
static void rt_fatalf(const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  vsnprintf(rt_trap_msg, sizeof rt_trap_msg, fmt, ap);
  va_end(ap);
  rt_trap_deliver();
}

/* --- indexed-access bounds (change: checked-indexed-access, design D2) ----
 * Every indexed accessor compares its index against the length in the object's own
 * header -- the same word it already loads to find the data -- so an out-of-range
 * index is a diagnostic rather than a read or a store at the computed address
 * (GitHub issue #70).  The check lives here, in the runtime primitive, and not at
 * the emitter's call sites: primitives are first-class (`primitive-layer`), so
 * `(apply vector-ref ...)` reaches this function and an emitter-side check would
 * leave that path open.
 *
 * These constrain BOUNDS, not TYPES.  The index is assumed to be a fixnum and the
 * object to be of the accessor's type; supplying either of the wrong type stays
 * unchecked under the standing type-confusion decision recorded in `core-language`
 * (design D1).  The message shape follows the overflow diagnostics
 * (`+: fixnum overflow: %ld + %ld`): the Scheme procedure's name, then the values
 * that made it fail. */
static void rt_range_error(const char *who, intptr_t i, intptr_t n) {
  rt_fatalf("%s: index out of range: %ld (length %ld)", who, (long)i, (long)n);
}
/* An ELEMENT index: valid over [0, n).  Range bounds (substring) are inclusive of
 * n and are checked in place, since they also carry an ordering condition. */
#define CHECK_INDEX(who, i, n)                                   \
  do {                                                           \
    intptr_t chk_i_ = (i), chk_n_ = (intptr_t)(n);               \
    if (chk_i_ < 0 || chk_i_ >= chk_n_)                          \
      rt_range_error((who), chk_i_, chk_n_);                     \
  } while (0)
/* A negative allocation size is the same defect one step earlier: it used to
 * produce an object whose recorded length was negative, or to reach a size_t
 * parameter as a huge value and die on a signal (design D5). */
static void rt_size_error(const char *who, intptr_t n) {
  rt_fatalf("%s: negative size: %ld", who, (long)n);
}


/* --- the exact-integer range ---------------------------------------------
 * Fixnums carry a 61-bit signed payload (the tag takes the low 3 bits), so the
 * exact integers Emit represents are [-2^60, 2^60).  R7RS 6.2.3 permits this
 * restriction but allows only two outcomes when a result leaves the range:
 * report the violation, or coerce to inexact.  Emit reports (change:
 * fixnum-overflow-trap, design D1) -- chosen because it is the outcome a later
 * arbitrary-precision change makes UNREACHABLE, rather than one it would have to
 * contradict.  fits_fixnum is the single definition of the range; FIX is only
 * ever applied to a value that has passed it. */
#define FIXNUM_MAX ((intptr_t)1 << 60)          /* one past the largest fixnum */
#define FIXNUM_MIN (-((intptr_t)1 << 60))
static int fits_fixnum(intptr_t v) { return v >= FIXNUM_MIN && v < FIXNUM_MAX; }

/* Two-type numeric tower (change: inexact-numbers).  Both-fixnum keeps the exact
 * fixnum path unchanged; any flonum operand promotes to double arithmetic
 * (contagion) and returns a flonum; a non-number operand traps.
 *
 * Exact overflow traps (change: fixnum-overflow-trap).  __builtin_*_overflow does
 * the arithmetic and reports whether it wrapped, which also retires the signed-
 * overflow UB the old `FIX(UNFIX(a) * UNFIX(b))` carried at -O2.  Two checks are
 * needed, not one: the product of two 61-bit values can overflow intptr_t itself,
 * and a result that fits intptr_t can still leave the narrower fixnum range (where
 * the shift in FIX would drop its top bits).
 *
 * These are ALSO the target of the emitter's inline fast path when its own
 * overflow test fires (design D3), so the decision about what overflow means lives
 * here and only here: a later arbitrary-precision change replaces the rt_fatalf
 * call with a bignum allocation and touches nothing outside this file. */
val rt_add(val a, val b) {
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) {
    intptr_t r;
    if (__builtin_add_overflow(UNFIX(a), UNFIX(b), &r) || !fits_fixnum(r))
      rt_fatalf("+: fixnum overflow: %ld + %ld", (long)UNFIX(a), (long)UNFIX(b));
    return FIX(r);
  }
  if (is_number(a) && is_number(b)) return rt_make_flonum(to_double(a) + to_double(b));
  rt_fatal("+: not a number"); return NIL_V;
}
val rt_sub(val a, val b) {
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) {
    intptr_t r;
    if (__builtin_sub_overflow(UNFIX(a), UNFIX(b), &r) || !fits_fixnum(r))
      rt_fatalf("-: fixnum overflow: %ld - %ld", (long)UNFIX(a), (long)UNFIX(b));
    return FIX(r);
  }
  if (is_number(a) && is_number(b)) return rt_make_flonum(to_double(a) - to_double(b));
  rt_fatal("-: not a number"); return NIL_V;
}
val rt_mul(val a, val b) {
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) {
    intptr_t r;
    if (__builtin_mul_overflow(UNFIX(a), UNFIX(b), &r) || !fits_fixnum(r))
      rt_fatalf("*: fixnum overflow: %ld * %ld", (long)UNFIX(a), (long)UNFIX(b));
    return FIX(r);
  }
  if (is_number(a) && is_number(b)) return rt_make_flonum(to_double(a) * to_double(b));
  rt_fatal("*: not a number"); return NIL_V;
}
/* real division.  Any inexact operand -> flonum.  exact/exact -> exact fixnum
 * when it divides evenly, else a flonum.  Division by an EXACT zero traps
 * (even when the numerator is inexact); an inexact zero divisor follows IEEE
 * (inf/nan), which the printer renders safely. */
val rt_div(val a, val b) {
  if (!is_number(a) || !is_number(b)) { rt_fatal("/: not a number"); return NIL_V; }
  int bfix = tag_of(b) == TAG_FIXNUM;
  if (bfix && UNFIX(b) == 0) { rt_fatal("division by zero: /"); return NIL_V; }
  if (tag_of(a) == TAG_FIXNUM && bfix) {
    intptr_t da = UNFIX(a), db = UNFIX(b);
    if (da % db == 0) {
      /* The one exact quotient that leaves the range: FIXNUM_MIN / -1 = 2^60
       * (change: fixnum-overflow-trap, design D6). */
      if (!fits_fixnum(da / db))
        rt_fatalf("/: fixnum overflow: %ld / %ld", (long)da, (long)db);
      return FIX(da / db);
    }
    return rt_make_flonum((double)da / (double)db);
  }
  return rt_make_flonum(to_double(a) / to_double(b));
}
/* The integer-division family's shared argument guard (change:
 * numeric-conformance, design D3 / GitHub issue #23).
 *
 * R7RS defines quotient/remainder/modulo on INTEGERS, and Emit's tower admits
 * integral flonums -- `integer?` is true of 7.0 and false of 7.5 -- so the rule is
 * uniform across all three: an integer-valued argument is accepted, with an
 * inexact one making the result inexact by contagion; a non-integral flonum or a
 * non-number traps.  Contagion rather than "trap on any flonum" follows rt_modulo,
 * which already made that choice and was the only one of the three with settled
 * behaviour.
 *
 * Before this, rt_quotient and rt_remainder applied UNFIX unconditionally, so a
 * flonum or a symbol was reinterpreted as a fixnum payload and the result was
 * whatever fell out of shifting a heap address -- `(quotient 7.0 2)` returned a
 * different number on each run.  rt_modulo guarded its TYPES but not integrality,
 * so `(modulo 7.5 2)` returned the fractional 1.5; it now traps, which no spec
 * scenario covered and no correct program can depend on. */
static void check_int_operand(val v, const char *who) {
  if (!is_number(v)) rt_fatalf("%s: not a number", who);
  /* Reached only for a number, so to_double is safe -- and %g is how the other
   * numeric diagnostics render an offending inexact value. */
  if (!is_integer_valued(v)) rt_fatalf("%s: not an integer: %g", who, to_double(v));
}

/* quotient/remainder: C integer division truncates toward zero, which is
 * exactly R7RS quotient/remainder.  Division by zero traps.  So does the single
 * out-of-range quotient, FIXNUM_MIN / -1 (change: fixnum-overflow-trap, D6);
 * `remainder` and `modulo` are in range for every input and need no check. */
val rt_quotient(val a, val b) {
  check_int_operand(a, "quotient"); check_int_operand(b, "quotient");
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) {
    intptr_t d = UNFIX(b);
    if (d == 0) rt_fatal("division by zero: quotient");
    if (!fits_fixnum(UNFIX(a) / d))
      rt_fatalf("quotient: fixnum overflow: %ld / %ld", (long)UNFIX(a), (long)d);
    return FIX(UNFIX(a) / d);
  }
  double da = to_double(a), db = to_double(b);
  if (db == 0) { rt_fatal("division by zero: quotient"); return NIL_V; }
  return rt_make_flonum(trunc(da / db));
}
val rt_remainder(val a, val b) {
  check_int_operand(a, "remainder"); check_int_operand(b, "remainder");
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) {
    intptr_t d = UNFIX(b);
    if (d == 0) rt_fatal("division by zero: remainder");
    return FIX(UNFIX(a) % d);
  }
  double da = to_double(a), db = to_double(b);
  if (db == 0) { rt_fatal("division by zero: remainder"); return NIL_V; }
  return rt_make_flonum(fmod(da, db));      /* truncating: sign of the dividend */
}
/* modulo: flooring remainder -- the result takes the sign of the divisor
 * (unlike remainder, which takes the dividend's).  Distinct name/semantics. */
val rt_modulo(val a, val b) {
  check_int_operand(a, "modulo"); check_int_operand(b, "modulo");
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) {
    intptr_t da = UNFIX(a), db = UNFIX(b);
    if (db == 0) { rt_fatal("division by zero: modulo"); return NIL_V; }
    intptr_t r = da % db;
    if (r != 0 && ((r < 0) != (db < 0))) r += db;
    return FIX(r);
  }
  double da = to_double(a), db = to_double(b);
  if (db == 0) { rt_fatal("division by zero: modulo"); return NIL_V; }
  double r = fmod(da, db);
  if (r != 0 && ((r < 0) != (db < 0))) r += db;
  return rt_make_flonum(r);
}
/* --- comparison across the exactness boundary (change: host-runtime-corrections, #77) ---
 * A COMPARISON IS DECIDED ON THE OPERANDS' MATHEMATICAL VALUES, not by widening the exact
 * one to `double`.  Both predicates used to fall through to `to_double(a) OP to_double(b)`,
 * and a fixnum with more than 53 significant bits is not representable as a double -- so
 * `(= 9007199254740992.0 9007199254740993)` answered #t and `<` answered #f, both wrong,
 * with the integer still inside the fixnum range (this is not #27's missing bignums).
 *
 * Contagion is a rule about arithmetic RESULTS: an inexact operand makes the result inexact.
 * A comparison produces a boolean, so there is nothing to make inexact and no reason to
 * lose precision computing it -- R7RS 6.2.6, and 6.2's rule that a mixed comparison behaves
 * as if the exact value were used exactly.  `max`/`min` are different and are left alone:
 * they return a value, so contagion does apply, and they already do it.
 *
 * Everything stays in the two-type tower.  Sign of (x - d) for a fixnum x and a double d:
 * compare x against floor(d), then let the fractional part break the tie.  The
 * out-of-fixnum-range guards also give the infinities for free -- floor(+inf) is +inf, which
 * is above any fixnum -- so only NaN needs handling by the callers, where it makes every
 * comparison false. */
static int cmp_fix_double(intptr_t x, double d) {
  double fl = floor(d);
  if (fl >  9.3e18) return -1;          /* d (or +inf) exceeds every fixnum: x < d */
  if (fl < -9.3e18) return  1;          /* ...and below every fixnum: x > d */
  intptr_t fi = (intptr_t)fl;           /* exact: fl is integral and now in range */
  if (x < fi) return -1;
  if (x > fi) return  1;
  return (d == fl) ? 0 : -1;            /* x == floor(d): d is x plus a fraction in (0,1) */
}

val rt_num_eq(val a, val b) {
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) return truthy(UNFIX(a) == UNFIX(b));
  if (is_number(a) && is_number(b)) {
    if (tag_of(a) == TAG_FIXNUM) {                      /* exact vs inexact */
      double d = flo_val(b);
      return truthy(!isnan(d) && cmp_fix_double(UNFIX(a), d) == 0);
    }
    if (tag_of(b) == TAG_FIXNUM) {
      double d = flo_val(a);
      return truthy(!isnan(d) && cmp_fix_double(UNFIX(b), d) == 0);
    }
    return truthy(to_double(a) == to_double(b));        /* both inexact */
  }
  rt_fatal("=: not a number"); return NIL_V;
}
val rt_lt(val a, val b) {
  if (tag_of(a) == TAG_FIXNUM && tag_of(b) == TAG_FIXNUM) return truthy(UNFIX(a) < UNFIX(b));
  if (is_number(a) && is_number(b)) {
    if (tag_of(a) == TAG_FIXNUM) {                      /* exact < inexact */
      double d = flo_val(b);
      return truthy(!isnan(d) && cmp_fix_double(UNFIX(a), d) < 0);
    }
    if (tag_of(b) == TAG_FIXNUM) {                      /* inexact < exact */
      double d = flo_val(a);
      return truthy(!isnan(d) && cmp_fix_double(UNFIX(b), d) > 0);
    }
    return truthy(to_double(a) < to_double(b));         /* both inexact */
  }
  rt_fatal("<: not a number"); return NIL_V;
}
val rt_null_p(val v)       { return truthy(v == NIL_V); }
val rt_pair_p(val v)       { return truthy(is_pair(v)); }
/* procedure?: a closure is TAG_CLOSURE, and EVERY callable value in Emit is one --
 * including a primitive used in value position, which inline-primitives eta-expands
 * into an ordinary closure (src/parse.ss).  So this one tag test answers the whole
 * predicate; there is no separate primitive-object case to consider. */
val rt_procedure_p(val v)  { return truthy(is_closure(v)); }
val rt_eq_p(val a, val b)  { return truthy(a == b); }
/* eqv?: same-object identity, plus flonum value comparison (change:
 * inexact-numbers).  == covers every immediate (fixnums, booleans, characters)
 * and interned symbols; two DISTINCT flonum boxes with the same value are eqv?
 * by value.  Stays #f across the exact/inexact boundary (a fixnum and a flonum
 * are never eqv?, though `=` compares them numerically). */
val rt_eqv_p(val a, val b) {
  if (a == b) return TRUE_V;
  if (is_flonum(a) && is_flonum(b)) return truthy(flo_val(a) == flo_val(b));
  return FALSE_V;
}
val rt_not(val x)          { return truthy(x == FALSE_V); }  /* only #f is false */

/* --- variadic / apply support ------------------------------------------ */
intptr_t rt_list_length(val lst) {
  intptr_t n = 0;
  while (tag_of(lst) == TAG_PAIR) { n++; lst = as_ptr(lst)[1]; }
  return n;
}

/* Build a variadic callee's rest list: the arguments at indices [fixed, argc)
 * in order.  Argument i lives in slots[i] when i < K, else in overflow[i-K].
 * `slots` points at the callee's K positional args spilled to a small array;
 * `overflow` is the calling-convention overflow vector (only read when
 * argc > K, so it may be NULL for calls with no excess). */
val rt_build_rest(intptr_t argc, intptr_t fixed, intptr_t K, val *slots, val *overflow) {
  val result = NIL_V;
  for (intptr_t i = argc - 1; i >= fixed; i--) {
    val a = (i < K) ? slots[i] : overflow[i - K];
    result = rt_cons(a, result);
  }
  return result;
}

/* apply: flatten n leading args (in `pre`) followed by the elements of `lst`
 * into a freshly allocated argument vector of length max(n+len(lst), K).  The
 * block is zero-initialized (GC_MALLOC) so the callee's K positional slots are
 * always readable even when the call supplies fewer than K arguments. */
val *rt_apply_argv(intptr_t n, val *pre, val lst, intptr_t K) {
  intptr_t m = rt_list_length(lst);
  intptr_t argc = n + m;
  intptr_t cap = argc > K ? argc : K;
  val *v = (val *)GC_MALLOC((size_t)(cap ? cap : 1) * sizeof(val));
  for (intptr_t i = 0; i < n; i++) v[i] = pre[i];
  for (intptr_t i = 0; i < m; i++) { v[n + i] = as_ptr(lst)[0]; lst = as_ptr(lst)[1]; }
  /* R7RS 6.10: apply's final argument is a LIST.  rt_list_length returns 0 for a
   * non-pair, so without this the argument vector was built from the leading
   * arguments alone and the rest was dropped silently -- `(apply + 3)` returned 0
   * and `(apply + '(2 3 . 4))` returned 5 (GitHub issue #78).  The cursor has
   * already been walked to the end by the copy loop above, so the check is one
   * comparison on a value in a register: for a proper list it is NIL_V, and for
   * `(apply + 3)` the loop never ran and it is still the original argument
   * (design D9).  No second traversal, and none of the loop's dereferences is
   * unguarded -- rt_list_length bounded them. */
  if (lst != NIL_V)
    rt_fatalf("apply: last argument is not a proper list: got %s", rt_type_name(lst));
  return v;
}

/* arity error: report to stderr and abort with a non-zero exit code. */
/* AN ARITY MISMATCH IS A CONDITION ABOUT DATA (change: host-runtime-corrections, issue
 * #96), so it is delivered to a handler like every other one.
 *
 * This body used to DUPLICATE the format-print-abort sequence rather than call rt_fatal,
 * which is the whole reason it did not become catchable for free when
 * `catchable-errors-with-kinds` routed the other ~44 trap sites through rt_trap_deliver:
 * they funnelled through rt_fatal/rt_fatalf and this one never called either.  The wording
 * cannot move, because it is the same snprintf into the same buffer.
 *
 * On the criterion `core-language` states for the fatal side -- "the machinery itself is
 * unsound" -- this belongs here rather than there: a mismatch reports that a CALLER passed
 * the wrong number of arguments, the heap and the frame stacks are intact, and a handler
 * runs on structures whose invariants all hold.  It sat on the fatal side by the boundary of
 * the change that introduced the mechanism, not by that test.
 *
 * A `guard` around a known-arity DIRECT call still sees nothing: the compiler rejects those
 * statically, so no call is emitted.  This governs indirect and `apply` calls. */
void rt_arity_error(intptr_t expected, intptr_t got) {
  snprintf(rt_trap_msg, sizeof rt_trap_msg,
           "arity error: expected %ld argument(s), got %ld",
           (long)expected, (long)got);
  rt_trap_deliver();
}

/* --- symbols (interned) ------------------------------------------------ */
/* A symbol is a heap object { char *name }.  rt_intern canonicalizes by name so
 * two symbols with the same name are the same word, making eq? correct for
 * symbols with no special case.  The intern table array is allocated
 * GC_MALLOC_UNCOLLECTABLE: it is never collected and IS scanned for pointers, so
 * the symbols it holds are kept alive as roots.  (A plain static pointer into
 * the GC heap is not enough — under lli's JIT the module's data segment is not a
 * registered Boehm root, so the array would be collected mid-run.)
 *
 * The table is an open-addressed hash set rather than a flat array, because
 * rt_intern is not only called when a program says `string->symbol`: the code
 * generator emits a call for every evaluation of a quoted symbol literal, so
 * `(eq? k 'concat)` in an inner loop interns on every iteration.  While the
 * lookup was a strcmp against every symbol interned so far, that made a program's
 * cost the product of how much work it does and how many distinct symbols it has
 * seen — quadratic for anything, like a formatter or a compiler, whose input
 * supplies both.  Linear probing over a power-of-two table keeps a hit to one
 * hash and normally one strcmp.
 *
 * Empty slots are 0, which no symbol can be: a symbol is a tagged non-null
 * pointer.  GC_MALLOC_UNCOLLECTABLE zeroes, so a fresh table is all-empty. */
static val *intern_table = NULL;   /* uncollectable, scanned; open-addressed */
static intptr_t intern_count = 0;
static intptr_t intern_cap = 0;    /* power of two, or 0 before first use */

static const char *sym_name(val s) { return (const char *)as_ptr(s)[0]; }

/* FNV-1a.  Cheap, no seeding, and adequate for identifier-shaped keys. */
static uintptr_t sym_hash(const char *name) {
  uintptr_t h = (uintptr_t)1469598103934665603ULL;
  for (const unsigned char *p = (const unsigned char *)name; *p; p++) {
    h ^= (uintptr_t)*p;
    h *= (uintptr_t)1099511628211ULL;
  }
  return h;
}

/* The slot `name` belongs in: either the symbol itself, or the first empty slot
 * on its probe sequence.  The table is never full — it is grown at half load —
 * so the walk always terminates. */
static intptr_t intern_slot(val *table, intptr_t cap, const char *name) {
  intptr_t mask = cap - 1;
  intptr_t i = (intptr_t)(sym_hash(name) & (uintptr_t)mask);
  while (table[i] != 0 && strcmp(sym_name(table[i]), name) != 0)
    i = (i + 1) & mask;
  return i;
}

static void intern_grow(void) {
  intptr_t ncap = intern_cap ? intern_cap * 2 : 64;
  val *nt = (val *)GC_MALLOC_UNCOLLECTABLE((size_t)ncap * sizeof(val));
  memset(nt, 0, (size_t)ncap * sizeof(val));
  for (intptr_t i = 0; i < intern_cap; i++)
    if (intern_table[i] != 0)
      nt[intern_slot(nt, ncap, sym_name(intern_table[i]))] = intern_table[i];
  if (intern_table) GC_free(intern_table);
  intern_table = nt;
  intern_cap = ncap;
}

val rt_intern(const char *name) {
  if (intern_cap == 0) intern_grow();
  intptr_t i = intern_slot(intern_table, intern_cap, name);
  if (intern_table[i] != 0) return intern_table[i];

  size_t len = strlen(name);
  char *copy = (char *)GC_MALLOC_ATOMIC(len + 1);   /* name has no pointers */
  memcpy(copy, name, len + 1);
  val *p = (val *)GC_MALLOC(sizeof(val));
  p[0] = (val)copy;
  val s = tag_ptr(p, TAG_SYMBOL);

  /* Grow at half load, then re-find the slot: the probe sequence has moved. */
  if ((intern_count + 1) * 2 > intern_cap) {
    intern_grow();
    i = intern_slot(intern_table, intern_cap, name);
  }
  intern_table[i] = s;
  intern_count++;
  return s;
}

/* --- extended heap objects: strings and characters (tag 7) ------------- */
/* An extended object is a heap block whose first word is a small header code
 * discriminating its type.  Further heap types (vectors, ...) add header codes
 * without needing a new primary tag. */
static intptr_t ext_hdr(val v) { return as_ptr(v)[0]; }

/* string: { HDR_STRING, byte-length, cp-length, char *bytes, cpidx *index }
 * -- UTF-8, explicit byte length so embedded NULs are fine (the trailing NUL is
 * for C-side convenience only).  Two extra words support codepoint indexing
 * (change: codepoint-string-indexing / backlog P4):
 *   cp-length  -- codepoint count, computed once here so string-length is O(1)
 *                 and the ASCII fast path (byte-length == cp-length => index ==
 *                 byte offset) is a single compare.
 *   index      -- nullable pointer to a lazily-built codepoint->byte breadcrumb
 *                 table (NULL here; built on first random access to a multi-byte
 *                 string), turning an indexed traversal from O(n^2) to O(n). */
static int      utf8_seq_len(unsigned char b);            /* fwd (defined below) */
static intptr_t utf8_count(const unsigned char *b, intptr_t blen);
val rt_make_string(const char *bytes, intptr_t len) {
  char *copy = (char *)GC_MALLOC_ATOMIC((size_t)len + 1);
  memcpy(copy, bytes, (size_t)len);
  copy[len] = '\0';
  val *p = (val *)GC_MALLOC(5 * sizeof(val));
  p[0] = HDR_STRING;
  p[1] = len;
  p[2] = (val)utf8_count((const unsigned char *)copy, len);
  p[3] = (val)copy;
  p[4] = (val)NULL;
  return tag_ptr(p, TAG_EXT);
}
static intptr_t    str_len(val v)    { return as_ptr(v)[1]; }
static intptr_t    str_cplen(val v)  { return as_ptr(v)[2]; }
static const char *str_bytes(val v)  { return (const char *)as_ptr(v)[3]; }

/* Exported string accessors so an embedding C/C++ host can read the bytes of a
 * scheme string value returned across the FFI boundary (e.g. the IR text the
 * embedded compiler's scheme_entry returns).  Thin non-static wrappers over the
 * internal helpers above (change: path-a-embedding). */
intptr_t    rt_string_len(val v)   { return str_len(v); }
const char *rt_string_bytes(val v) { return str_bytes(v); }

/* --- process context -----------------------------------------------------
 * The host installs an owned byte snapshot.  Every Scheme query allocates fresh
 * strings and pairs, so mutating a returned string or list cannot alter a later
 * command-line result or the host's argv storage. */
static int rt_process_argc = 0;
static char **rt_process_argv = NULL;

void rt_set_command_line(int argc, const char *const *argv) {
  char **copy = (char **)GC_MALLOC((size_t)(argc > 0 ? argc : 1) * sizeof(char *));
  for (int i = 0; i < argc; i++) {
    size_t n = strlen(argv[i]);
    copy[i] = (char *)GC_MALLOC_ATOMIC(n + 1);
    memcpy(copy[i], argv[i], n + 1);
  }
  rt_process_argc = argc;
  rt_process_argv = copy;
}

val rt_command_line(void) {
  val out = NIL_V;
  for (int i = rt_process_argc - 1; i >= 0; i--)
    out = rt_cons(rt_make_string(rt_process_argv[i], (intptr_t)strlen(rt_process_argv[i])), out);
  return out;
}

val rt_get_environment_variable(val name) {
  CHECK_TAG("get-environment-variable", name, is_string, "a string");
  const char *value = getenv(str_bytes(name));
  return value ? rt_make_string(value, (intptr_t)strlen(value)) : FALSE_V;
}

extern char **environ;
val rt_get_environment_variables(void) {
  val out = NIL_V;
  if (!environ) return out;
  for (char **p = environ; *p; p++) {
    const char *eq = strchr(*p, '=');
    if (!eq) continue;
    val name = rt_make_string(*p, (intptr_t)(eq - *p));
    val value = rt_make_string(eq + 1, (intptr_t)strlen(eq + 1));
    out = rt_cons(rt_cons(name, value), out);
  }
  return out;
}

static int rt_status_code(val status) {
  if (status == TRUE_V || is_unspec(status)) return EXIT_SUCCESS;
  if (status == FALSE_V) return EXIT_FAILURE;
  if (tag_of(status) == TAG_FIXNUM) return (int)UNFIX(status);
  return EXIT_FAILURE;
}

val rt_process_exit(val status) {
  fflush(NULL);
  exit(rt_status_code(status));
  return UNSPEC_V;                    /* unreachable; keeps the primitive signature */
}

val rt_process_emergency_exit(val status) {
  _Exit(rt_status_code(status));
  return UNSPEC_V;
}

/* flonum <-> string (change: inexact-numbers).  number->string routes flonums
 * here; the reader routes a flonum token here.  strtod is correctly rounded and
 * flonum_format is shortest-round-trippable, so string->flonum->string and
 * flonum->string->flonum both round-trip. */
val rt_flonum_to_string(val fv) {
  CHECK_TAG("number->string", fv, is_flonum, "a flonum");
  char buf[40];
  int n = flonum_format(flo_val(fv), buf);
  return rt_make_string(buf, n);
}
val rt_string_to_flonum(val s) {
  CHECK_TAG("string->number", s, is_string, "a string");
  return rt_make_flonum(strtod(str_bytes(s), NULL));
}

/* char: an immediate in the misc-immediate family (subtype SUB_CHAR), the full
 * Unicode scalar value carried in bits 8+.  No heap allocation and no interning
 * -- equal codepoints ARE the same word, so eq?/eqv? hold intrinsically.  The
 * name/signature is kept so rt_string_ref and rt_integer_to_char still call it. */
val rt_make_char(intptr_t codepoint) { return MK_CHAR(codepoint); }

/* encode a Unicode codepoint as UTF-8 into buf (>= 4 bytes); return byte count */
static int utf8_encode(intptr_t cp, unsigned char *buf) {
  if (cp < 0x80) { buf[0] = (unsigned char)cp; return 1; }
  if (cp < 0x800) {
    buf[0] = (unsigned char)(0xC0 | (cp >> 6));
    buf[1] = (unsigned char)(0x80 | (cp & 0x3F));
    return 2;
  }
  if (cp < 0x10000) {
    buf[0] = (unsigned char)(0xE0 | (cp >> 12));
    buf[1] = (unsigned char)(0x80 | ((cp >> 6) & 0x3F));
    buf[2] = (unsigned char)(0x80 | (cp & 0x3F));
    return 3;
  }
  buf[0] = (unsigned char)(0xF0 | (cp >> 18));
  buf[1] = (unsigned char)(0x80 | ((cp >> 12) & 0x3F));
  buf[2] = (unsigned char)(0x80 | ((cp >> 6) & 0x3F));
  buf[3] = (unsigned char)(0x80 | (cp & 0x3F));
  return 4;
}

/* number of bytes in the UTF-8 sequence with lead byte b (assumes well-formed) */
static int utf8_seq_len(unsigned char b) {
  if (b < 0x80) return 1;
  if ((b >> 5) == 0x6) return 2;   /* 110xxxxx */
  if ((b >> 4) == 0xE) return 3;   /* 1110xxxx */
  return 4;                        /* 11110xxx */
}

/* decode the codepoint at byte offset i of s */
static intptr_t utf8_decode_at(const unsigned char *s, intptr_t i) {
  unsigned char b = s[i];
  switch (utf8_seq_len(b)) {
    case 1:  return b;
    case 2:  return ((b & 0x1F) << 6) | (s[i+1] & 0x3F);
    case 3:  return ((b & 0x0F) << 12) | ((s[i+1] & 0x3F) << 6) | (s[i+2] & 0x3F);
    default: return ((b & 0x07) << 18) | ((s[i+1] & 0x3F) << 12)
                    | ((s[i+2] & 0x3F) << 6) | (s[i+3] & 0x3F);
  }
}

/* number of codepoints in the blen-byte UTF-8 buffer b */
static intptr_t utf8_count(const unsigned char *b, intptr_t blen) {
  intptr_t i = 0, k = 0;
  while (i < blen) { i += utf8_seq_len(b[i]); k++; }
  return k;
}

/* byte offset of codepoint `cp`, resuming a forward walk from a known
 * (start_byte, start_cp) breadcrumb; clamps at blen.  The plain from-zero walk
 * is the (0, 0) case. */
static intptr_t utf8_offset_from(const unsigned char *s, intptr_t blen,
                                 intptr_t start_byte, intptr_t start_cp,
                                 intptr_t cp) {
  intptr_t i = start_byte, k = start_cp;
  while (i < blen && k < cp) { i += utf8_seq_len(s[i]); k++; }
  return i;
}
static intptr_t utf8_offset(const unsigned char *s, intptr_t blen, intptr_t cp) {
  return utf8_offset_from(s, blen, 0, 0, cp);
}

/* --- codepoint->byte breadcrumb index (multi-byte strings only) ----------
 * A fixed-stride sample of byte offsets: index[j] is the byte offset of
 * codepoint j*CP_STRIDE.  Built lazily on first random access to a string that
 * is not all-ASCII, stored in header word [4], and dropped on mutation.  With a
 * constant stride each access scans at most CP_STRIDE codepoints from the
 * nearest breadcrumb, so a full indexed traversal is O(n) build + O(n) access
 * instead of O(n^2). */
#define CP_STRIDE 32
static intptr_t *cpidx_build(val s) {
  const unsigned char *b = (const unsigned char *)str_bytes(s);
  intptr_t blen = str_len(s), cplen = str_cplen(s);
  intptr_t nb = cplen / CP_STRIDE + 1;
  intptr_t *idx = (intptr_t *)GC_MALLOC_ATOMIC((size_t)nb * sizeof(intptr_t));
  intptr_t i = 0, k = 0;
  while (i < blen) {
    if (k % CP_STRIDE == 0) idx[k / CP_STRIDE] = i;   /* k/CP_STRIDE < nb */
    i += utf8_seq_len(b[i]);
    k++;
  }
  if (k % CP_STRIDE == 0 && k / CP_STRIDE < nb) idx[k / CP_STRIDE] = i;  /* k == cplen */
  as_ptr(s)[4] = (val)idx;
  return idx;
}
/* byte offset of codepoint `cp` in a multi-byte string, via the breadcrumb
 * index (building it on first use). */
static intptr_t cpidx_offset(val s, intptr_t cp) {
  intptr_t *idx = (intptr_t *)as_ptr(s)[4];
  if (!idx) idx = cpidx_build(s);
  intptr_t j = cp / CP_STRIDE;
  return utf8_offset_from((const unsigned char *)str_bytes(s), str_len(s),
                          idx[j], j * CP_STRIDE, cp);
}

/* --- character operations ---------------------------------------------- */
val rt_char_to_integer(val c) { return FIX(CHAR_CP(c)); }
/* integer->char requires an exact integer that is a Unicode SCALAR VALUE: in
 * [0, #x10FFFF] and outside the surrogate range #xD800-#xDFFF (change:
 * numeric-conformance, design D3 / GitHub issue #23).  It used to apply UNFIX
 * unconditionally and hand the result to rt_make_char, so an out-of-range or
 * non-numeric argument produced a junk character instead of a diagnostic --
 * `(integer->char 1152921504606846975)` among them. */
val rt_integer_to_char(val n) {
  if (tag_of(n) != TAG_FIXNUM) { rt_fatal("integer->char: not an exact integer"); return NIL_V; }
  intptr_t cp = UNFIX(n);
  if (cp < 0 || cp > 0x10FFFF || (cp >= 0xD800 && cp <= 0xDFFF)) {
    rt_fatalf("integer->char: not a Unicode scalar value: %ld", (long)cp);
    return NIL_V;
  }
  return rt_make_char(cp);
}

/* --- string operations (codepoint-indexed over UTF-8 storage, design D1) --- */
val rt_string_length(val s) {                               /* O(1): stored count */
  CHECK_TAG("string-length", s, is_string, "a string");
  return FIX(str_cplen(s));
}
/* A string index is a CODEPOINT index, so the bound is str_cplen and never
 * str_len (design D4).  A str_len guard would look correct on the ASCII strings
 * the suites mostly use -- where the two are equal -- while accepting an index
 * past the end of any multi-byte string. */
val rt_string_ref(val s, val idx) {
  CHECK_TAG("string-ref", s, is_string, "a string");   /* before str_bytes/str_cplen */
  CHECK_FIXNUM("string-ref", idx);
  const unsigned char *b = (const unsigned char *)str_bytes(s);
  intptr_t i = UNFIX(idx);
  CHECK_INDEX("string-ref", i, str_cplen(s));
  /* ASCII fast path: byte length == codepoint count => index is the byte offset. */
  intptr_t off = (str_len(s) == str_cplen(s)) ? i : cpidx_offset(s, i);
  return rt_make_char(utf8_decode_at(b, off));
}
val rt_substring(val s, val start, val end) {
  CHECK_TAG("substring", s, is_string, "a string");
  CHECK_FIXNUM("substring", start);
  CHECK_FIXNUM("substring", end);
  const unsigned char *b = (const unsigned char *)str_bytes(s);
  intptr_t si = UNFIX(start), ei = UNFIX(end), n = str_cplen(s), so, eo;
  /* Both bounds are INCLUSIVE of the length -- unlike an element index, a
   * substring may begin or end at the end of the string: `(substring "abc" 3 3)`
   * is "".  Hence the explicit tests rather than CHECK_INDEX. */
  if (si < 0 || si > n)
    rt_fatalf("substring: start out of range: %ld (length %ld)", (long)si, (long)n);
  if (ei < 0 || ei > n)
    rt_fatalf("substring: end out of range: %ld (length %ld)", (long)ei, (long)n);
  /* A DISTINCT condition (design D5): both bounds can be individually in range and
   * still be reversed, and `eo - so` is then negative -- which reaches
   * rt_make_string's size_t parameter as ~2^64, the 18-exabyte allocation that
   * terminated the process on a signal from pure Scheme. */
  if (si > ei)
    rt_fatalf("substring: start greater than end: %ld > %ld", (long)si, (long)ei);
  if (str_len(s) == str_cplen(s)) { so = si; eo = ei; }   /* ASCII fast path */
  else { so = cpidx_offset(s, si); eo = cpidx_offset(s, ei); }
  return rt_make_string((const char *)(b + so), eo - so);
}
/* intern the string's bytes (NUL-terminated; safe for source identifiers) */
val rt_string_to_symbol(val s) {
  CHECK_TAG("string->symbol", s, is_string, "a string");
  return rt_intern(str_bytes(s));
}

/* --- string construction/comparison (string-char-library) --------------- */
/* content equality: equal byte length + equal bytes (UTF-8 => byte equality
 * is codepoint equality). */
val rt_string_eq(val a, val b) {
  CHECK_TAG("string=?", a, is_string, "a string");
  CHECK_TAG("string=?", b, is_string, "a string");
  intptr_t la = str_len(a);
  if (la != str_len(b)) return FALSE_V;
  return truthy(memcmp(str_bytes(a), str_bytes(b), (size_t)la) == 0);
}
/* new string = a's bytes followed by b's bytes. */
val rt_string_append(val a, val b) {
  CHECK_TAG("string-append", a, is_string, "a string");
  CHECK_TAG("string-append", b, is_string, "a string");
  intptr_t la = str_len(a), lb = str_len(b);
  char *buf = (char *)GC_MALLOC_ATOMIC((size_t)(la + lb + 1));
  memcpy(buf, str_bytes(a), (size_t)la);
  memcpy(buf + la, str_bytes(b), (size_t)lb);
  return rt_make_string(buf, la + lb);
}
/* a symbol's name as a fresh string. */
val rt_symbol_to_string(val s) {
  /* sym_name reads word 0 as a `char *` and hands it to strlen, so a wrong-typed
   * argument here dereferences twice: the worst shape in the set. */
  CHECK_TAG("symbol->string", s, is_symbol, "a symbol");
  const char *name = sym_name(s);
  return rt_make_string(name, (intptr_t)strlen(name));
}
/* build a string from a list of characters, UTF-8-encoding each codepoint. */
val rt_list_to_string(val lst) {
  intptr_t n = rt_list_length(lst);
  char *buf = (char *)GC_MALLOC_ATOMIC((size_t)(4 * n + 1));  /* <=4 bytes/codepoint */
  intptr_t off = 0;
  for (val cur = lst; tag_of(cur) == TAG_PAIR; cur = as_ptr(cur)[1])
    off += utf8_encode(CHAR_CP(as_ptr(cur)[0]), (unsigned char *)(buf + off));
  return rt_make_string(buf, off);
}
/* a string of k copies of character ch. */
val rt_make_string_fill(val k, val ch);
val rt_make_string_1(val k) { return rt_make_string_fill(k, MK_CHAR(' ')); }
val rt_make_string_fill(val k, val ch) {
  intptr_t n = UNFIX(k);
  if (n < 0) rt_size_error("make-string", n);
  unsigned char one[4];
  int len1 = utf8_encode(CHAR_CP(ch), one);
  char *buf = (char *)GC_MALLOC_ATOMIC((size_t)(len1 * n + 1));
  for (intptr_t i = 0; i < n; i++) memcpy(buf + i * len1, one, (size_t)len1);
  return rt_make_string(buf, len1 * n);
}

/* --- string mutation (string-mutation change) --------------------------- */
/* string-set!: replace codepoint `idx` with `ch` in place.  UTF-8 is variable
 * width, so splice: rebuild the byte buffer with ch's bytes in place of the old
 * codepoint's, then overwrite the object's byte-length (word 1) and bytes
 * pointer (word 3) so the identity (and every alias) sees the update.  O(n).
 * The old buffer and `s` stay reachable across the allocation (s is live and
 * word 3 still points at the old bytes until the final store).  The codepoint
 * count (word 2) is invariant -- one codepoint replaces one -- so it is left
 * as-is; the lazily-built breadcrumb index (word 4) is byte-offset-based and now
 * stale, so it is dropped back to NULL to be rebuilt on demand. */
val rt_string_set(val s, val idx, val ch) {
  /* Two length reads happen before CHECK_INDEX here (str_len, then str_cplen
   * inside it), so the tag check has to come ahead of both -- design open
   * question 3, answered: placement at the top covers them. */
  CHECK_TAG("string-set!", s, is_string, "a string");
  CHECK_FIXNUM("string-set!", idx);
  const unsigned char *b = (const unsigned char *)str_bytes(s);
  intptr_t blen = str_len(s);
  /* Codepoint bound, as for string-ref (design D4).  Unguarded, utf8_offset
   * clamped at blen and the seq_len of the trailing NUL then made `blen - eo`
   * negative -- a memcpy size of ~2^64, which died on SIGBUS. */
  CHECK_INDEX("string-set!", UNFIX(idx), str_cplen(s));
  /* Locate the codepoint the same way string-ref does -- byte index when the
   * string is all-ASCII, otherwise through the breadcrumb index -- rather than
   * rescanning from byte 0.  Scanning from zero made a left-to-right fill
   * quadratic on its own, before the copy below added a second n. */
  intptr_t so = (blen == str_cplen(s)) ? UNFIX(idx)
                                       : cpidx_offset(s, UNFIX(idx));
  intptr_t eo = so + utf8_seq_len(b[so]);          /* byte range of the old codepoint */
  unsigned char enc[4];
  int le = utf8_encode(CHAR_CP(ch), enc);

  /* Same encoded width -- every ASCII-for-ASCII replacement, and so every
   * character-at-a-time buffer fill -- writes in place.  The byte length, the
   * codepoint count and every byte offset are unchanged, so the breadcrumb index
   * stays valid and is kept.  Every string's bytes are uniquely owned: the only
   * two places a buffer pointer is installed are rt_make_string, which copies,
   * and this function, so no other string can be aliasing them and a literal is
   * a fresh copy like any other.  Reallocating here instead made string-set! O(n)
   * in time AND in allocation, which made filling an n-character buffer O(n^2)
   * and was a large part of one downstream program's total run time. */
  if (le == eo - so) {
    memcpy((char *)as_ptr(s)[3] + so, enc, (size_t)le);
    return UNSPEC_V;
  }

  /* Widths differ, so the bytes have to move. */
  intptr_t newlen = blen - (eo - so) + le;
  char *buf = (char *)GC_MALLOC_ATOMIC((size_t)newlen + 1);
  memcpy(buf, b, (size_t)so);                       /* prefix */
  memcpy(buf + so, enc, (size_t)le);                /* replacement */
  memcpy(buf + so + le, b + eo, (size_t)(blen - eo)); /* suffix */
  buf[newlen] = '\0';
  as_ptr(s)[1] = (val)newlen;
  as_ptr(s)[3] = (val)buf;
  as_ptr(s)[4] = (val)NULL;                         /* drop stale breadcrumb index */
  return UNSPEC_V;
}
/* string-copy: a fresh string object over a fresh copy of the bytes. */
val rt_string_copy(val s) {
  CHECK_TAG("string-copy", s, is_string, "a string");
  return rt_make_string(str_bytes(s), str_len(s));
}
/* The optional-argument forms R7RS gives these three (change: r7rs-conformance-suite).
 * Each is its own entry point with its own fixed C signature, selected by argument
 * count through *integrable* -- the pattern the port-directed output procedures set.
 * Widening them in the PRELUDE instead would shadow the primitive for every arity and
 * cost the existing call sites their bare-primcall codegen. */
val rt_string_copy_from(val s, val start) {
  /* str_len(s) is evaluated BEFORE rt_substring's own check, so this needs its
   * own -- the same before-the-length-load rule one call frame up. */
  CHECK_TAG("string-copy", s, is_string, "a string");
  return rt_substring(s, start, FIX(str_len(s)));
}

/* --- process I/O for a standalone text filter (self-host-io-strategy G3) ---
 * The two edge primitives a native `schemec` needs: pull all of stdin into a
 * string, and write a string's bytes to stdout raw.  Distinct from rt_write
 * (the final-value printer, which quotes strings and adds a newline). */

/* read all of stdin to EOF into a growable buffer; return a fresh scheme string. */
val rt_read_all_stdin(void) {
  size_t cap = 4096, len = 0;
  char *buf = (char *)GC_MALLOC_ATOMIC(cap);
  size_t n;
  while ((n = fread(buf + len, 1, cap - len, stdin)) > 0) {
    len += n;
    if (len == cap) {
      cap *= 2;
      char *nb = (char *)GC_MALLOC_ATOMIC(cap);
      memcpy(nb, buf, len);
      buf = nb;
    }
  }
  return rt_make_string(buf, (intptr_t)len);
}

/* Read a whole named file into a fresh scheme string -- rt_read_all_stdin's slurp
 * with an fopen in front of it (change: scheme-io-library, design D2).  Input ports
 * slurp at open, which is what lets a file input port and a string input port be the
 * SAME object with the same pure-Scheme operations over it.
 *
 * A file that cannot be opened returns #f, NOT an empty string: the two are
 * indistinguishable to a caller otherwise, and "missing file" would silently become
 * "empty file".  The prelude turns the #f into a catchable error naming the path. */
val rt_read_file(val path) {
  if (tag_of(path) != TAG_EXT || ext_hdr(path) != HDR_STRING) return FALSE_V;
  FILE *f = fopen(str_bytes(path), "r");
  if (!f) return FALSE_V;
  size_t cap = 4096, len = 0;
  char *buf = (char *)GC_MALLOC_ATOMIC(cap);
  size_t n;
  while ((n = fread(buf + len, 1, cap - len, f)) > 0) {
    len += n;
    if (len == cap) {
      cap *= 2;
      char *nb = (char *)GC_MALLOC_ATOMIC(cap);
      memcpy(nb, buf, len);
      buf = nb;
    }
  }
  fclose(f);
  return rt_make_string(buf, (intptr_t)len);
}

/* --- the two file operations that are not port constructors (change:
 * catchable-errors-with-kinds, design D8).  Shaped like rt_read_file above --
 * a path string in, a VALUE out, no port record in front -- because the prelude is
 * where a failure becomes an error object, and only the prelude knows the kind.
 * `remove` is C89 and covers both files and empty directories, which is what R7RS
 * `delete-file` leaves implementation-defined anyway. */
val rt_file_exists_p(val path) {
  if (tag_of(path) != TAG_EXT || ext_hdr(path) != HDR_STRING) return FALSE_V;
  FILE *f = fopen(str_bytes(path), "r");
  if (!f) return FALSE_V;
  fclose(f);
  return TRUE_V;
}

/* #t when the file is gone, #f when it could not be removed (missing, a non-empty
 * directory, no permission) -- the prelude turns the #f into a FILE error. */
val rt_delete_file(val path) {
  if (tag_of(path) != TAG_EXT || ext_hdr(path) != HDR_STRING) return FALSE_V;
  return truthy(remove(str_bytes(path)) == 0);
}

/* --- non-standard filesystem extension (change: add-filesystem-access) ---
 * These are the deliberately narrow host operations behind (emit filesystem).
 * The public library turns the failure/status values into kinded Scheme file
 * errors; keeping that policy out here mirrors rt_delete_file above.
 *
 * A listing is all-or-nothing.  errno is reset immediately before EACH readdir:
 * allocating the preceding entry's Scheme string/list may itself disturb errno,
 * and a later end-of-directory must not mistake that unrelated value for an I/O
 * failure. */
val rt_filesystem_directory_list(val path) {
  CHECK_TAG("directory-list", path, is_string, "a string");
  DIR *dir = opendir(str_bytes(path));
  if (!dir) return FALSE_V;

  val entries = NIL_V;
  int read_error = 0;
  for (;;) {
    errno = 0;
    struct dirent *entry = readdir(dir);
    if (!entry) {
      read_error = errno;
      break;
    }
    if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
      continue;
    val name = rt_make_string(entry->d_name, (intptr_t)strlen(entry->d_name));
    entries = rt_cons(name, entries);
  }

  int close_error = closedir(dir) != 0;
  return (read_error || close_error) ? FALSE_V : entries;
}

/* Classification has three states so a real host failure cannot masquerade as
 * an ordinary negative predicate answer: 1 yes, 0 absent/not-that-kind, -1 error.
 * stat follows the final symbolic link; lstat inspects that link itself. */
static val rt_filesystem_classify(val path, int follow, const char *who) {
  CHECK_TAG(who, path, is_string, "a string");
  struct stat info;
  int rc = follow ? stat(str_bytes(path), &info) : lstat(str_bytes(path), &info);
  if (rc == 0)
    return FIX(follow ? S_ISDIR(info.st_mode) : S_ISLNK(info.st_mode));
  return FIX((errno == ENOENT || errno == ENOTDIR) ? 0 : -1);
}

val rt_filesystem_directory_status(val path) {
  return rt_filesystem_classify(path, 1, "file-directory?");
}

val rt_filesystem_symlink_status(val path) {
  return rt_filesystem_classify(path, 0, "file-symbolic-link?");
}

/* One rename and no preparatory destination mutation.  On a supported
 * same-filesystem pair this is the atomic name transition promised by the
 * public library; every failure is returned for Scheme to raise. */
val rt_filesystem_replace_file(val source, val destination) {
  CHECK_TAG("replace-file", source, is_string, "a string");
  CHECK_TAG("replace-file", destination, is_string, "a string");
  return truthy(rename(str_bytes(source), str_bytes(destination)) == 0);
}

/* --no-prelude channel for the embedded batch entry (change:
 * embedded-runner-rehome).  The Chez-free runner (`emit run` / `emit build`)
 * forwards --no-prelude by setting EMIT_NO_PRELUDE in the environment; the
 * embedded entry reads it back through this nullary primitive to decide whether
 * to auto-import (scheme base).  A nullary env probe (mirroring rt_read_all_stdin's
 * C-side channel) keeps the flag off the stdin source channel.  Returns a scheme
 * boolean: #t when the variable is set and non-empty, #f otherwise. */
val rt_no_prelude_p(void) {
  const char *v = getenv("EMIT_NO_PRELUDE");
  return (v && *v) ? TRUE_V : FALSE_V;
}

/* --dump channel for the embedded compiler (change: emit-dump-stages, design
 * D1).  The same shape as rt_no_prelude_p above -- a nullary env probe, so the
 * flag stays off the stdin source channel -- but it carries a LEVEL rather than
 * a boolean, because the doors have two observability modes over this one
 * channel: 0 = off, 1 = stage names only (the concise trace the Chez driver
 * emits at EMIT_VERBOSITY=verbose), 2 = the full per-pass IL dump, 3 = the full
 * dump including library units (--dump-all).  The host computes the level and
 * sets EMIT_DUMP_LEVEL before the first scheme_entry() call; parsing stays here
 * in C, single-sourced, as it is for the verbosity levels in emit.cpp.  Anything
 * unset, empty, or unparseable is 0 (off), so a stray value can never turn
 * narration on. */
val rt_dump_level(void) {
  const char *v = getenv("EMIT_DUMP_LEVEL");
  if (!v || !*v) return FIX(0);
  if (v[1] != '\0') return FIX(0);            /* single digit only */
  switch (v[0]) {
    case '1': return FIX(1);
    case '2': return FIX(2);
    case '3': return FIX(3);
    default:  return FIX(0);
  }
}

/* --- REPL request channel (change: repl-embedded-incremental) -------------
 * The interactive host drives the embedded compiler by calling its single ccc
 * `scheme_entry` repeatedly, one call per operation.  Because a ccc entry takes
 * no scheme arguments, the host hands the operation selector and the per-form
 * source text in through this C-side channel (mirroring how rt_read_all_stdin
 * feeds the batch embed): the host calls rt_repl_set(mode, bytes, len) and then
 * scheme_entry, whose dispatcher reads them back via the (repl-mode)/(repl-input)
 * primitives.  Modes: 0 init-no-prelude, 1 init-with-prelude, 2 form-complete?,
 * 3 compile-one-form.
 *
 * The embedded compiler's whole program is folded into one @scheme_entry, so its
 * top-level bindings are LOCALS re-created on every call -- they cannot hold
 * state across the host's per-form calls.  The dispatcher therefore keeps the
 * session state (env/macro-env/known/n, bundled in a scheme vector) HERE, loading
 * it into working globals at entry and saving it back before returning, via
 * (repl-state-ref)/(repl-state-set!).
 *
 * Both the per-call input string and the cross-call state are held in single-slot
 * GC_MALLOC_UNCOLLECTABLE cells so they are scanned roots: scheme_entry's prologue
 * allocates (rt_box ...) before the dispatcher reads the input, and forms allocate
 * freely between calls, so a plain static `val` could be collected (same reasoning
 * as rt_intern's table).  #f (rt_repl_state_ref before any set) means "no state
 * yet". */
static intptr_t rt_repl_mode_v = 0;
static val *rt_repl_input_cell = NULL;     /* [1]: current form/prelude source */
static val *rt_repl_state_cell = NULL;     /* [1]: session-state vector, or FALSE_V */
static val *rt_repl_cell(val **slot, val init) {
  if (!*slot) { *slot = (val *)GC_MALLOC_UNCOLLECTABLE(sizeof(val)); (*slot)[0] = init; }
  return *slot;
}
void rt_repl_set(intptr_t mode, const char *bytes, intptr_t len) {
  rt_repl_mode_v = mode;
  rt_repl_cell(&rt_repl_input_cell, NIL_V)[0] = rt_make_string(bytes, len);
}
val rt_repl_mode(void)  { return FIX(rt_repl_mode_v); }
val rt_repl_input(void) { return rt_repl_cell(&rt_repl_input_cell, NIL_V)[0]; }
/* decode a scheme fixnum to a C integer, so the host can read form-complete?'s
 * consumed-count / incomplete(-1) / malformed(-2) result without knowing the tag. */
intptr_t rt_fixnum_value(val v) { return UNFIX(v); }

/* Is v THE unspecified value?  A host accessor, so UNSPEC_V's bit pattern stays defined
 * in exactly one place (this file) instead of being duplicated in the C++ host -- silent
 * representation drift is the main risk in change: unspecified-value.  The REPL uses this
 * to suppress the echo of an uninteresting result (src/emit.cpp).  Deliberately NOT a
 * Scheme-visible predicate: it has no prim-table entry, so no Scheme binding exists. */
intptr_t rt_is_unspec(val v) { return is_unspec(v) ? 1 : 0; }

/* Persistent-global root set (change: repl-embedded-incremental).  In the REPL a
 * top-level define stores its value into a JIT'd module's global slot, and those
 * slots live in JIT-managed memory that libgc does NOT scan.  A value reachable
 * only through a global slot would therefore be collected once the in-process
 * embedded compiler's allocations trigger a GC (which they readily do -- the
 * compiler shares this heap, unlike the old JIT-only host).  Every global-set!
 * routes its value through rt_root, which keeps it in a scanned, uncollectable
 * table so it survives.  Only the persistent-globals model emits global-set!;
 * batch AOT uses letrec locals and never calls this.  Superseded values (a
 * redefinition's old binding) stay rooted -- bounded by the number of top-level
 * assignments in a session, which is negligible. */
static val *root_table = NULL;
static intptr_t root_count = 0, root_cap = 0;
val rt_root(val v) {
  if (root_count == root_cap) {
    intptr_t ncap = root_cap ? root_cap * 2 : 256;
    val *nt = (val *)GC_MALLOC_UNCOLLECTABLE((size_t)ncap * sizeof(val));
    for (intptr_t i = 0; i < root_count; i++) nt[i] = root_table[i];
    if (root_table) GC_free(root_table);
    root_table = nt;
    root_cap = ncap;
  }
  root_table[root_count++] = v;
  return v;
}
val rt_repl_state_ref(void)  { return rt_repl_cell(&rt_repl_state_cell, FALSE_V)[0]; }
val rt_repl_state_set(val v) { rt_repl_cell(&rt_repl_state_cell, FALSE_V)[0] = v; return UNSPEC_V; }

/* display ANY datum in R7RS *display* style (strings unquoted, chars raw),
 * sharing the tag-walking printer with rt_write (change: fix-display-non-string).
 * Dispatching on the tag makes this memory-safe for every value type -- a
 * non-string no longer dereferences as a string header and crashes.  Returns an
 * unspecified value (NIL) so it composes inside a `begin`. */
enum print_policy { PRINT_ORDINARY, PRINT_SIMPLE, PRINT_SHARED };
static void print_val(FILE *out, val v, int display, enum print_policy policy);

/* WHERE THE PORT-LESS OUTPUT PROCEDURES WRITE (change: scheme-io-library).
 *
 * R7RS says `(display x)` writes to `(current-output-port)`, and
 * `with-output-to-file` / `parameterize` rebind that parameter for a dynamic
 * extent -- so a port-less `display` inside the extent must follow the rebinding.
 * But `(display x)` compiles to a bare `rt_display` primcall, and keeping that
 * primcall byte-identical is a requirement of this change (a port-free program's
 * emitted code must not move).  Both hold at once by making the DESTINATION
 * indirect instead of the call: the port-less entry points write to this cell
 * rather than to the literal `stdout`, and the prelude's current-output-port
 * parameter stores its port's stream here on every rebinding.  The cost is one
 * global load per call; the emitted IR is unchanged.
 *
 * NULL means "not yet set" and reads as stdout, so this is correct before any
 * Scheme runs -- the standard ports need no initialization order.  The REAL stdout
 * stays reachable as handle 0 throughout, so the stdout PORT OBJECT keeps meaning
 * stdout even while the current-output-port parameter points somewhere else. */
static FILE *rt_current_out = NULL;
static FILE *cur_out(void) { return rt_current_out ? rt_current_out : stdout; }
static FILE *port_stream(intptr_t h);      /* fwd: the handle table, defined below */

/* Point the port-less output procedures at the stream of HANDLE (called by the
 * prelude's current-output-port parameter on every rebinding, including the
 * restore leg of parameterize / with-output-to-file).  An unusable handle resets
 * to stdout rather than leaving output going nowhere. */
val rt_set_current_output(val handle) {
  FILE *f = (tag_of(handle) == TAG_FIXNUM) ? port_stream(UNFIX(handle)) : NULL;
  rt_current_out = f;
  return UNSPEC_V;
}

val rt_display(val v) {
  print_val(cur_out(), v, /*display=*/1, PRINT_ORDINARY);
  return UNSPEC_V;
}

/* write ANY datum in R7RS *write* style (strings quoted, chars `#\`-prefixed),
 * the write-style companion to rt_display.  Shares the same tag-walking printer,
 * so its bytes are identical to the runner's final-value print (void rt_write,
 * defined below) for the same datum.  This value-returning wrapper is distinct
 * from that void entry: a primitive must return a val (the unspecified value)
 * so it composes inside a `begin`, whereas the runner entry returns nothing. */
val rt_write_val(val v) {
  print_val(cur_out(), v, /*display=*/0, PRINT_ORDINARY);
  return UNSPEC_V;
}

val rt_write_simple_val(val v) {
  print_val(cur_out(), v, /*display=*/0, PRINT_SIMPLE);
  return UNSPEC_V;
}

val rt_write_shared_val(val v) {
  print_val(cur_out(), v, /*display=*/0, PRINT_SHARED);
  return UNSPEC_V;
}

/* write ANY datum to STANDARD ERROR, in write style (display? = #f) or display
 * style (any other value) -- the embedded compiler's narration channel (change:
 * emit-dump-stages, design D2).  stdout is reserved for a door's data payload
 * (the IR that `emit run --emit` and `schemec` write), so narration must not go
 * there; this is the SAME tag-walking printer as rt_display/rt_write_val, merely
 * pointed at another stream, so there is no second printer to keep in sync.
 * Carrying the style as an argument (rather than adding two primitives) keeps the
 * new %-op surface at two: the dumper needs write style for IL forms -- so
 * (code "code_6" ...) shows its string quoted, as Chez's pretty-print does -- and
 * display style for its own headers, indentation, and newlines.  Returns `v`, so
 * a dumper can thread a value through a write without an extra binding. */
val rt_stderr_write(val v, val display_p) {
  print_val(stderr, v, /*display=*/display_p != FALSE_V, PRINT_ORDINARY);
  return v;
}

/* newline: write a single line feed (U+000A) to standard output.  Nullary;
 * returns the unspecified value (NIL) so it composes inside a `begin`. */
val rt_newline(void) {
  fputc('\n', cur_out());
  return UNSPEC_V;
}

/* write-char: emit one character's UTF-8 bytes to stdout (change:
 * inexact-numbers -- mandelbrot's per-cell output).  Returns unspecified. */
val rt_write_char(val c) {
  unsigned char buf[4];
  int n = utf8_encode(CHAR_CP(c), buf);
  fwrite(buf, 1, (size_t)n, cur_out());
  return UNSPEC_V;
}

/* --- the eof object (change: scheme-io-library, design D3) ----------------
 * A singleton misc-immediate, so eof-object? is a tag+subtype test with no
 * allocation and no dereference -- safe to apply to ANY value. */
val rt_eof_object(void)        { return EOF_V; }
val rt_eof_object_p(val v)     { return truthy(is_eof(v)); }

/* --- output-port handle table (change: scheme-io-library, design D1) -------
 * A Scheme record field holds a `val`, and a C `FILE *` is not one.  Rather than
 * smuggle the pointer through a fixnum (where a stale one after close-port is a
 * wild pointer the collector and printer can both see), the runtime owns the
 * FILE * and hands Scheme a small integer INDEX into this table.  Every use is
 * then a range + liveness check away from a proper diagnostic instead of a fault,
 * which is the entire reason D1 chose a table over a raw pointer.
 *
 * Two handles are reserved and always live, so the standard ports need no table
 * slot and no initialization order:
 *   handle 0 = stdout      handle 1 = stderr
 * Table slots are handles 2 and up.
 *
 * A STRING output port is a table slot too, backed by open_memstream (POSIX): it
 * is a genuine FILE * writing into a growable memory buffer.  That is what keeps
 * this simple -- print_val takes a FILE *, so display/write to a string port is
 * the SAME printer with a different stream, not a second Scheme-side accumulation
 * path.  get-output-string flushes and copies the buffer out.  open_memstream
 * retains the ADDRESSES of its buffer and size cells, so those live in a separate
 * process-lifetime allocation: putting them in the moving table would leave libc
 * updating stale cells after the table grows.
 *
 * `slots` itself is GC_MALLOC_UNCOLLECTABLE (never scanned for Scheme values --
 * it holds only C pointers and sizes) and grows by doubling. */
typedef struct {
  char  *buf;       /* open_memstream buffer, malloc'd outside the GC heap */
  size_t size;      /* open_memstream size cell */
} port_memstream_state;

typedef struct {
  FILE *f;                       /* the stream; NULL once closed */
  port_memstream_state *memstate; /* non-NULL only for string ports */
} port_slot;

static port_slot *port_slots = NULL;
static intptr_t   port_count = 0, port_cap = 0;

#define PORT_STDOUT 0
#define PORT_STDERR 1
#define PORT_FIRST  2      /* first table-backed handle */

/* Allocate a fresh handle, growing the table by doubling. */
static intptr_t port_alloc_slot(void) {
  if (port_count == port_cap) {
    intptr_t ncap = port_cap ? port_cap * 2 : 8;
    port_slot *ns = (port_slot *)GC_MALLOC_UNCOLLECTABLE((size_t)ncap * sizeof(port_slot));
    for (intptr_t i = 0; i < port_count; i++) ns[i] = port_slots[i];
    if (port_slots) GC_free(port_slots);
    port_slots = ns; port_cap = ncap;
  }
  port_slots[port_count].f = NULL;
  port_slots[port_count].memstate = NULL;
  return port_count++ + PORT_FIRST;
}

/* Resolve a handle to its live stream, or NULL.  The two reserved handles always
 * resolve; a table handle resolves only while it is in range AND open, so a use
 * after close-port lands on the caller's error path rather than in libc. */
static FILE *port_stream(intptr_t h) {
  if (h == PORT_STDOUT) return stdout;
  if (h == PORT_STDERR) return stderr;
  intptr_t i = h - PORT_FIRST;
  if (i < 0 || i >= port_count) return NULL;
  return port_slots[i].f;
}

/* Decode the port a Scheme-level output operation was handed.  The port passed to
 * a port-directed primitive is the PORT RECORD, and this is the ONE place that
 * knows the layout contract shared with src/prelude.scm:
 *
 *     a port record's FIELD 0 holds its handle, a fixnum.
 *
 * (A record is { HDR_RECORD, type-descriptor, field-count, field0, ... }, so field 0
 * is slot 3 -- it was slot 2 before the field count was added for bounds checking.)
 * Keeping the decode here means the four port-directed output primitives stay bare
 * primcalls -- no Scheme-side wrapper on the fast path -- at the cost of this one
 * documented coupling.  The check is structural (a record whose field 0 is a
 * fixnum naming a live handle), so it is memory-SAFE for any argument; it does not
 * prove the record is a port, and a non-port record whose field 0 happens to be a
 * live handle would write there.  That is a wrong-type bug, never a fault.
 * Returns NULL when the argument is not a usable port, and the caller traps. */
static intptr_t rec_len(val r);                 /* fwd (defined with the records) */
static FILE *port_arg_stream(val p) {
  if (tag_of(p) != TAG_EXT || ext_hdr(p) != HDR_RECORD) return NULL;
  if (rec_len(p) < 1) return NULL;              /* no field 0 to read */
  val h = as_ptr(p)[3];
  if (tag_of(h) != TAG_FIXNUM) return NULL;
  return port_stream(UNFIX(h));
}
static FILE *port_arg_or_die(val p, const char *who) {
  FILE *f = port_arg_stream(p);
  if (!f) rt_fatal(who);
  return f;
}

/* Open a file for textual output; returns the handle as a fixnum, or #f when the
 * file cannot be opened.  Reporting failure as a VALUE (rather than trapping) lets
 * the prelude raise a catchable R7RS error object with the offending path in it. */
val rt_port_open_output_file(val path) {
  if (tag_of(path) != TAG_EXT || ext_hdr(path) != HDR_STRING) return FALSE_V;
  /* str_bytes is NUL-terminated (rt_make_string appends one for exactly this), so
   * it is directly a C path; a path with an embedded NUL simply truncates there. */
  FILE *f = fopen(str_bytes(path), "w");
  if (!f) return FALSE_V;
  intptr_t h = port_alloc_slot();
  port_slots[h - PORT_FIRST].f = f;
  return FIX(h);
}

/* Open an in-memory output port (open-output-string).  A memstream failure is
 * reported the same way as a failed file open. */
val rt_port_open_output_string(void) {
  intptr_t h = port_alloc_slot();
  port_slot *s = &port_slots[h - PORT_FIRST];
  port_memstream_state *state =
      (port_memstream_state *)GC_MALLOC_UNCOLLECTABLE(sizeof(port_memstream_state));
  state->buf = NULL;
  state->size = 0;
  FILE *f = open_memstream(&state->buf, &state->size);
  if (!f) {
    GC_free(state);
    return FALSE_V;
  }
  s->f = f;
  s->memstate = state;
  return FIX(h);
}

/* The accumulated text of a string port, as a fresh Scheme string.  Flushing first
 * is what makes the memstream buffer/size cells current.  Returns #f for a handle
 * that is not a string port, so the prelude can raise a proper error for
 * get-output-string on a file port.
 *
 * Deliberately works AFTER close-port: write-then-close-then-collect is the natural
 * idiom, and closing a memstream finalizes its buffer and size rather than releasing
 * them.  So this needs a live stream only for the flush.  (The consequence is that a
 * string port's buffer -- malloc'd by open_memstream, outside the GC heap -- is never
 * freed.  Bounded by the number of string ports a program opens; freeing it at close
 * would be what makes this call impossible.) */
val rt_port_get_output_string(val handle) {
  intptr_t h = UNFIX(handle);
  intptr_t i = h - PORT_FIRST;
  if (tag_of(handle) != TAG_FIXNUM || i < 0 || i >= port_count) return FALSE_V;
  port_slot *s = &port_slots[i];
  port_memstream_state *state = s->memstate;
  if (!state) return FALSE_V;
  if (s->f) fflush(s->f);
  return rt_make_string(state->buf ? state->buf : "", (intptr_t)state->size);
}

/* Flush a port's buffered output through to its destination. */
val rt_port_flush(val handle) {
  FILE *f = port_stream(UNFIX(handle));
  if (f) fflush(f);
  return UNSPEC_V;
}

/* Close a port: flush, release the stream, mark the slot dead.  Closing an
 * already-closed port is permitted and does nothing (R7RS), which falls out of
 * the NULL check.  The reserved stdout/stderr handles are never closed -- a
 * program that closes (current-output-port) must not take the process's stdout
 * with it.  A string port keeps its memstate so get-output-string still works after
 * close; the memstream is flushed and closed, which finalizes buffer and size. */
val rt_port_close(val handle) {
  intptr_t h = UNFIX(handle);
  if (tag_of(handle) != TAG_FIXNUM || h < PORT_FIRST) return UNSPEC_V;
  intptr_t i = h - PORT_FIRST;
  if (i < 0 || i >= port_count) return UNSPEC_V;
  port_slot *s = &port_slots[i];
  if (s->f) { fflush(s->f); fclose(s->f); s->f = NULL; }
  return UNSPEC_V;
}

/* --- port-directed output (change: scheme-io-library) ---------------------
 * The two-argument forms of display / write / newline / write-char, plus
 * write-string.  Each is the SAME print_val (or the same byte emission) as its
 * one-argument sibling with `out` chosen from the port rather than hardwired to
 * stdout -- which is the whole reason the printer already took a FILE *.  The
 * one-argument entry points above are untouched, so a program that never passes a
 * port emits byte-identical code. */
val rt_port_display(val v, val p) {
  print_val(port_arg_or_die(p, "display: not an open output port"), v,
            /*display=*/1, PRINT_ORDINARY);
  return UNSPEC_V;
}
val rt_port_write(val v, val p) {
  print_val(port_arg_or_die(p, "write: not an open output port"), v,
            /*display=*/0, PRINT_ORDINARY);
  return UNSPEC_V;
}
val rt_port_write_simple(val v, val p) {
  print_val(port_arg_or_die(p, "write-simple: not an open output port"), v,
            /*display=*/0, PRINT_SIMPLE);
  return UNSPEC_V;
}
val rt_port_write_shared(val v, val p) {
  print_val(port_arg_or_die(p, "write-shared: not an open output port"), v,
            /*display=*/0, PRINT_SHARED);
  return UNSPEC_V;
}
val rt_port_newline(val p) {
  fputc('\n', port_arg_or_die(p, "newline: not an open output port"));
  return UNSPEC_V;
}
val rt_port_write_char(val c, val p) {
  FILE *f = port_arg_or_die(p, "write-char: not an open output port");
  unsigned char buf[4];
  int n = utf8_encode(CHAR_CP(c), buf);
  fwrite(buf, 1, (size_t)n, f);
  return UNSPEC_V;
}
/* write-string: the string's bytes, literally -- no quotes, no escapes.  This is
 * `display` narrowed to strings, NOT `write`; the one-argument form targets stdout. */
val rt_write_string(val s) {
  CHECK_TAG("write-string", s, is_string, "a string");
  fwrite(str_bytes(s), 1, (size_t)str_len(s), cur_out());
  return UNSPEC_V;
}
val rt_port_write_string(val s, val p) {
  CHECK_TAG("write-string", s, is_string, "a string");
  FILE *f = port_arg_or_die(p, "write-string: not an open output port");
  fwrite(str_bytes(s), 1, (size_t)str_len(s), f);
  return UNSPEC_V;
}

/* --- vectors (tag-7 HDR_VECTOR: { HDR_VECTOR, length, elem... }) --------- */
static intptr_t vec_len(val v) { return (intptr_t)as_ptr(v)[1]; }
/* make-vector / make-string with the fill omitted: R7RS leaves the contents
 * unspecified, so any definite value serves.  0 and space are chosen over leaving the
 * memory as GC_MALLOC found it, so the result is reproducible and safe to print. */
val rt_make_vector(val k, val fill);
val rt_make_vector_1(val k) { return rt_make_vector(k, FIX(0)); }
val rt_make_vector(val k, val fill) {
  intptr_t n = UNFIX(k);
  if (n < 0) rt_size_error("make-vector", n);
  val *p = (val *)GC_MALLOC((size_t)(n + 2) * sizeof(val));
  p[0] = (val)HDR_VECTOR; p[1] = (val)n;
  for (intptr_t i = 0; i < n; i++) p[i + 2] = fill;
  return tag_ptr(p, TAG_EXT);
}
val rt_vector_ref(val v, val i) {
  CHECK_TAG("vector-ref", v, is_vector, "a vector");   /* before vec_len: design D1 */
  CHECK_FIXNUM("vector-ref", i);
  intptr_t k = UNFIX(i);
  CHECK_INDEX("vector-ref", k, vec_len(v));
  return as_ptr(v)[2 + k];
}
val rt_vector_set(val v, val i, val x) {
  CHECK_TAG("vector-set!", v, is_vector, "a vector");
  CHECK_FIXNUM("vector-set!", i);
  intptr_t k = UNFIX(i);
  CHECK_INDEX("vector-set!", k, vec_len(v));
  as_ptr(v)[2 + k] = x;
  return UNSPEC_V;
}
val rt_vector_length(val v) {
  CHECK_TAG("vector-length", v, is_vector, "a vector");
  return FIX(vec_len(v));
}
val rt_vector_p(val v) { return truthy(is_vector(v)); }

/* --- bytevectors (tag-7 HDR_BYTEVECTOR: { HDR_BYTEVECTOR, length, uchar *bytes })
 * The bytes live in a separate GC_MALLOC_ATOMIC buffer (no interior pointers, so
 * the collector need not scan it), mirroring how HDR_STRING stores its bytes.
 * Elements are raw bytes (0-255); indexing is a plain byte load/store. */
static intptr_t       bv_len(val v)   { return (intptr_t)as_ptr(v)[1]; }
static unsigned char *bv_bytes(val v) { return (unsigned char *)as_ptr(v)[2]; }
val rt_make_bytevector(val k, val fill) {
  intptr_t n = UNFIX(k);
  if (n < 0) rt_size_error("make-bytevector", n);
  unsigned char *bytes = (unsigned char *)GC_MALLOC_ATOMIC((size_t)(n > 0 ? n : 1));
  memset(bytes, (int)(UNFIX(fill) & 0xFF), (size_t)n);
  val *p = (val *)GC_MALLOC(3 * sizeof(val));
  p[0] = (val)HDR_BYTEVECTOR; p[1] = (val)n; p[2] = (val)bytes;
  return tag_ptr(p, TAG_EXT);
}
val rt_bytevector_u8_ref(val v, val i) {
  CHECK_TAG("bytevector-u8-ref", v, is_bytevector, "a bytevector");
  CHECK_FIXNUM("bytevector-u8-ref", i);
  intptr_t k = UNFIX(i);
  CHECK_INDEX("bytevector-u8-ref", k, bv_len(v));
  return FIX(bv_bytes(v)[k]);
}
val rt_bytevector_u8_set(val v, val i, val b) {
  CHECK_TAG("bytevector-u8-set!", v, is_bytevector, "a bytevector");
  CHECK_FIXNUM("bytevector-u8-set!", i);
  intptr_t k = UNFIX(i);
  CHECK_INDEX("bytevector-u8-set!", k, bv_len(v));
  bv_bytes(v)[k] = (unsigned char)(UNFIX(b) & 0xFF);
  return UNSPEC_V;
}
val rt_bytevector_length(val v) {
  CHECK_TAG("bytevector-length", v, is_bytevector, "a bytevector");
  return FIX(bv_len(v));
}
val rt_bytevector_p(val v) { return truthy(is_bytevector(v)); }

/* --- hashing (backs the prelude hash tables) ----------------------------
 * rt_hash maps any value to a NON-NEGATIVE tagged fixnum such that `equal?`
 * values hash equally -- the only property lookup correctness needs, since the
 * bucket scan falls back to `equal?` (so collisions are merely slow, never
 * wrong; it need not be a perfect hash).  Hashing is by value class: fixnums
 * and immediates by their canonical word; strings/symbols by an FNV-1a byte
 * hash of their contents (two `equal?` strings with distinct storage collide
 * into the same bucket); pairs/vectors by a depth-bounded shallow fold to stay
 * O(1)-ish.  Interned symbols with equal names are the same object, so name
 * hashing agrees with eq?/equal?. */
static const uintptr_t FNV_PRIME = 1099511628211u;
static const uintptr_t FNV_BASIS = 14695981039346656037u;
static uintptr_t fnv1a(const unsigned char *b, size_t n, uintptr_t h) {
  for (size_t i = 0; i < n; i++) { h ^= b[i]; h *= FNV_PRIME; }
  return h;
}
static uintptr_t hash_word(val v, int depth) {
  switch (tag_of(v)) {
    case TAG_FIXNUM: return (uintptr_t)UNFIX(v);
    case TAG_BOOL:                                  /* bool + char immediates */
    case TAG_NIL:    return (uintptr_t)v;           /* canonical word */
    case TAG_SYMBOL: { const char *nm = sym_name(v);
                       return fnv1a((const unsigned char *)nm, strlen(nm), FNV_BASIS); }
    case TAG_PAIR:
      if (depth <= 0) return FNV_BASIS;
      { uintptr_t h = FNV_BASIS;
        h = (h ^ hash_word(as_ptr(v)[0], depth - 1)) * FNV_PRIME;
        h = (h ^ hash_word(as_ptr(v)[1], depth - 1)) * FNV_PRIME;
        return h; }
    case TAG_EXT:
      if (ext_hdr(v) == HDR_STRING)
        return fnv1a((const unsigned char *)str_bytes(v), (size_t)str_len(v), FNV_BASIS);
      if (ext_hdr(v) == HDR_BYTEVECTOR)
        return fnv1a(bv_bytes(v), (size_t)bv_len(v), FNV_BASIS);
      if (ext_hdr(v) == HDR_VECTOR) {
        intptr_t n = vec_len(v);
        uintptr_t h = FNV_BASIS ^ (uintptr_t)n;
        if (depth > 0) {
          intptr_t lim = n < 8 ? n : 8;              /* bounded shallow fold */
          for (intptr_t i = 0; i < lim; i++)
            h = (h ^ hash_word(as_ptr(v)[i + 2], depth - 1)) * FNV_PRIME;
        }
        return h;
      }
      if (ext_hdr(v) == HDR_FLONUM)                  /* by value, to match equal? */
        return fnv1a((const unsigned char *)&as_ptr(v)[1], sizeof(double), FNV_BASIS);
      return (uintptr_t)ext_hdr(v);
    default: return (uintptr_t)v;                    /* closures/boxes: by identity word */
  }
}
val rt_hash(val v) {
  /* mask to 60 bits so the value stays non-negative after FIX's <<3 */
  return FIX((intptr_t)(hash_word(v, 4) & (uintptr_t)0x0FFFFFFFFFFFFFFFu));
}

/* Identity hashing never inspects an object's contents.  Boehm allocations do
 * not move, so the tagged word is stable for the lifetime of a live heap object;
 * immediates are canonical tagged words already.  Mix before truncating so
 * allocator alignment and adjacent addresses do not cluster in small bucket
 * vectors, and so the result is not a raw address-shaped value. */
val rt_eq_hash(val v) {
  uintptr_t x = (uintptr_t)v;
  x ^= x >> 33;
  x *= UINT64_C(0xff51afd7ed558ccd);
  x ^= x >> 33;
  x *= UINT64_C(0xc4ceb9fe1a85ec53);
  x ^= x >> 33;
  return FIX((intptr_t)(x & UINT64_C(0x0FFFFFFFFFFFFFFF)));
}

/* --- hash tables (tag-7 HDR_HASHTABLE: { HDR_HASHTABLE, spine }) ----------
 * An opaque wrapper around a mutable spine vector #(count buckets identity?); every
 * hash-table-* operation lives in the prelude over the spine.  The wrapper
 * exists only to give hash-table? a disjoint type and a distinct printed form
 * -- a bare vector could not be told apart from a user vector. */
val rt_make_hash_table(val spine) {
  val *p = (val *)GC_MALLOC(2 * sizeof(val));
  p[0] = (val)HDR_HASHTABLE; p[1] = spine;
  return tag_ptr(p, TAG_EXT);
}
val rt_hash_table_spine(val ht) {
  CHECK_TAG("hash-table (internal)", ht, is_hashtable, "a hash table");
  return as_ptr(ht)[1];
}
val rt_hash_table_p(val ht) { return truthy(is_hashtable(ht)); }

/* --- records (tag-7 HDR_RECORD: { HDR_RECORD, type-descriptor, field... }) ---
 * define-record-type lowers (in the frontend) to calls on these primitives.  A
 * type descriptor is a distinct heap object (HDR_RECORD_TYPE) minted once per
 * definition; two records share a type iff their descriptors are the same object
 * (eq?), which makes record types disjoint.  Records are identity types:
 * eqv?/equal? hold only for the same object (no field recursion). */
val rt_make_record_type(val name) {          /* name: a string value (for printing) */
  val *p = (val *)GC_MALLOC(2 * sizeof(val));
  p[0] = (val)HDR_RECORD_TYPE; p[1] = name;
  return tag_ptr(p, TAG_EXT);
}
/* rt_make_record(td, fields): allocate { HDR_RECORD, td, count, field... } by
 * walking the field list (a proper list of tagged values) into the slots in order.
 * The list is walked twice: once for the count, which is recorded in slot 2 so the
 * accessors below have a length to check against. */
static intptr_t rec_len(val r) { return (intptr_t)as_ptr(r)[2]; }   /* fwd-declared above */
val rt_make_record(val td, val fields) {
  intptr_t n = 0;
  for (val c = fields; tag_of(c) == TAG_PAIR; c = as_ptr(c)[1]) n++;
  val *p = (val *)GC_MALLOC((size_t)(n + 3) * sizeof(val));
  p[0] = (val)HDR_RECORD; p[1] = td; p[2] = (val)n;
  intptr_t i = 0;
  for (val c = fields; tag_of(c) == TAG_PAIR; c = as_ptr(c)[1]) p[i++ + 3] = as_ptr(c)[0];
  return tag_ptr(p, TAG_EXT);
}
/* Checked though the check is provably redundant (design D6): the frontend
 * generates every field accessor with a compile-time constant index derived from
 * the record definition (`src/parse.ss:529`), so a well-formed compiler cannot emit
 * an out-of-range record access.  The value is in catching a COMPILER bug -- a
 * field-index miscalculation is exactly the mistake that would otherwise corrupt a
 * neighbouring object -- which is why the message says `internal`: these have no
 * user-facing Scheme spelling to name, and a user seeing one has found a bug in the
 * compiler rather than in their program. */
val rt_record_ref(val r, val i) {
  CHECK_TAG("record-ref (internal)", r, is_record, "a record");
  CHECK_FIXNUM("record-ref (internal)", i);
  intptr_t k = UNFIX(i);
  CHECK_INDEX("record-ref (internal)", k, rec_len(r));
  return as_ptr(r)[3 + k];
}
val rt_record_set(val r, val i, val x) {
  CHECK_TAG("record-set! (internal)", r, is_record, "a record");
  CHECK_FIXNUM("record-set! (internal)", i);
  intptr_t k = UNFIX(i);
  CHECK_INDEX("record-set! (internal)", k, rec_len(r));
  as_ptr(r)[3 + k] = x;
  return UNSPEC_V;
}
val rt_record_of_type_p(val r, val td) {
  return truthy(is_record(r) && as_ptr(r)[1] == td);
}
val rt_record_p(val r) { return truthy(is_record(r)); }

/* --- multiple values (tag-7 HDR_MV: { HDR_MV, values-list }) --------------
 * A disjoint wrapper carrying the list of values produced by `values` when it
 * has other than one argument.  `values`/`call-with-values` live in the prelude
 * over these three primitives; the wrapper only needs to be a distinct type so
 * `%mv?` can tell a bundle apart from a legitimate single value.  Mirrors the
 * HDR_HASHTABLE shape { header, one field }.  (change: multiple-values) */
val rt_list_to_mv(val list) {
  val *p = (val *)GC_MALLOC(2 * sizeof(val));
  p[0] = (val)HDR_MV; p[1] = list;
  return tag_ptr(p, TAG_EXT);
}
val rt_mv_p(val v) { return truthy(is_mv(v)); }
val rt_mv_to_list(val v) {
  CHECK_TAG("call-with-values (internal)", v, is_mv, "a values bundle");
  return as_ptr(v)[1];
}

/* --- type predicates (self-hosting gap G9) -------------------------------- */
/* Each returns #t/#f by inspecting the tag (and, for tag-7 heap objects, the
 * header code -- guard the ext_hdr deref behind the TAG_EXT check, as vector? does).
 * The subset has a single number type (fixnums), so integer? and exact? coincide;
 * they are kept as distinct names for forward compatibility. */
val rt_symbol_p(val v)  { return truthy(tag_of(v) == TAG_SYMBOL); }
val rt_boolean_p(val v) { return truthy(is_bool(v)); }
/* Two number types now exist (change: inexact-numbers): exact? is fixnum-only,
 * inexact?/flonum? are flonum-only, number?/real? are either, and integer? spans
 * fixnums and integral-valued flonums (3.0 but not 2.5). */
val rt_integer_p(val v) { return truthy(is_integer_valued(v)); }
val rt_exact_p(val v)   { return truthy(tag_of(v) == TAG_FIXNUM); }
val rt_inexact_p(val v) { return truthy(is_flonum(v)); }
val rt_flonum_p(val v)  { return truthy(is_flonum(v)); }
val rt_number_p(val v)  { return truthy(is_number(v)); }
val rt_real_p(val v)    { return truthy(is_number(v)); }

/* --- classification, rounding, and libm (change: numeric-conformance) --------
 * Three families of primitive that all need C, added in one staged bootstrap
 * because the alternative was three separate regen cycles (see the change's
 * group 4).  All are permanently-internal `%`-ops: none is integrable, so
 * `sqrt`/`sin`/`log` stay OUT of the universal namespace -- R7RS puts them behind
 * `(import (scheme inexact))`, and the library wraps these.
 *
 * Every one takes its argument as a number, exact or inexact, and returns a
 * FLONUM (the rounding family excepted -- see below).  Out-of-domain arguments
 * follow IEEE 754 rather than trapping: a mathematically undefined or complex
 * result is a NaN, a divergent one an infinity.  Emit is real-only so no complex
 * result is available, R7RS 6.2.3 permits the inexact non-finite answer, and a NaN
 * stays testable with `nan?` where an uncatchable trap would not. */

/* Classification.  finite? is true of every EXACT integer as well as a finite
 * flonum; nan? only of a NaN.  A non-number traps -- these are predicates about
 * numbers, not type tests. */
val rt_finite_p(val v) {
  if (tag_of(v) == TAG_FIXNUM) return TRUE_V;
  if (is_flonum(v)) return truthy(isfinite(flo_val(v)));
  rt_fatal("finite?: not a number"); return NIL_V;
}
val rt_nan_p(val v) {
  if (tag_of(v) == TAG_FIXNUM) return FALSE_V;
  if (is_flonum(v)) return truthy(isnan(flo_val(v)));
  rt_fatal("nan?: not a number"); return NIL_V;
}

/* Rounding.  These take the FLONUM arm only: an exact integer is already rounded,
 * so the prelude returns it unchanged and never calls in here.  Keeping the work
 * in double means a magnitude too large for a fixnum rounds to itself instead of
 * raising an overflow diagnostic.  rt_flo_round is `rint`, which under the default
 * rounding mode is round-half-to-EVEN as R7RS 6.2.6 requires -- floor(x + 0.5)
 * would round 2.5 to 3.0 and 0.49999999999999994 up, both wrong. */
static double flo_arg(val v, const char *who) {
  if (!is_number(v)) { rt_fatalf("%s: not a number", who); return 0.0; }
  return to_double(v);
}
val rt_flo_floor(val v)    { return rt_make_flonum(floor(flo_arg(v, "floor"))); }
val rt_flo_ceiling(val v)  { return rt_make_flonum(ceil (flo_arg(v, "ceiling"))); }
val rt_flo_truncate(val v) { return rt_make_flonum(trunc(flo_arg(v, "truncate"))); }
val rt_flo_round(val v)    { return rt_make_flonum(rint (flo_arg(v, "round"))); }

/* libm, behind (scheme inexact).  One-argument forms; the optional-argument forms
 * (`log` with a base, two-argument `atan`) are composed in the library from these. */
val rt_sqrt(val v) { return rt_make_flonum(sqrt(flo_arg(v, "sqrt"))); }
val rt_exp(val v)  { return rt_make_flonum(exp (flo_arg(v, "exp"))); }
val rt_log(val v)  { return rt_make_flonum(log (flo_arg(v, "log"))); }
val rt_sin(val v)  { return rt_make_flonum(sin (flo_arg(v, "sin"))); }
val rt_cos(val v)  { return rt_make_flonum(cos (flo_arg(v, "cos"))); }
val rt_tan(val v)  { return rt_make_flonum(tan (flo_arg(v, "tan"))); }
val rt_asin(val v) { return rt_make_flonum(asin(flo_arg(v, "asin"))); }
val rt_acos(val v) { return rt_make_flonum(acos(flo_arg(v, "acos"))); }
val rt_atan(val v) { return rt_make_flonum(atan(flo_arg(v, "atan"))); }
val rt_atan2(val y, val x) {
  return rt_make_flonum(atan2(flo_arg(y, "atan"), flo_arg(x, "atan")));
}
/* pow serves `expt` once either argument is inexact; the exact-integer case is
 * repeated squaring in the prelude, which keeps an exact result exact. */
val rt_pow(val b, val e) {
  return rt_make_flonum(pow(flo_arg(b, "expt"), flo_arg(e, "expt")));
}

/* exact->inexact: fixnum -> flonum (flonum unchanged).  inexact->exact:
 * integral flonum -> fixnum (fixnum unchanged); a non-integral flonum traps,
 * since there are no exact rationals. */
val rt_exact_to_inexact(val v) {
  if (tag_of(v) == TAG_FIXNUM) return rt_make_flonum((double)UNFIX(v));
  if (is_flonum(v)) return v;
  rt_fatal("exact->inexact: not a number"); return NIL_V;
}
val rt_inexact_to_exact(val v) {
  if (tag_of(v) == TAG_FIXNUM) return v;
  if (is_flonum(v)) {
    double d = flo_val(v);
    if (is_integer_valued(v)) {
      /* Range-check BEFORE the cast (change: fixnum-overflow-trap, design D5):
       * a double outside intptr_t makes (intptr_t)d undefined, and one merely
       * outside the fixnum range would lose its top bits in FIX.  The bounds are
       * compared in double, where both are exactly representable powers of two. */
      if (!(d >= (double)FIXNUM_MIN && d < (double)FIXNUM_MAX)) {
        rt_fatalf("inexact->exact: value outside fixnum range: %g", d);
        return NIL_V;
      }
      return FIX((intptr_t)d);
    }
    rt_fatal("inexact->exact: not an integer"); return NIL_V;
  }
  rt_fatal("inexact->exact: not a number"); return NIL_V;
}
val rt_string_p(val v)  { return truthy(is_string(v)); }
val rt_char_p(val v)    { return truthy(is_char(v)); }

/* structural equality: eqv? fast path (immediates, interned symbols/chars, same
 * object), then recurse into pairs, compare string content by bytes (UTF-8, so
 * byte equality == codepoint equality), and recurse element-wise into vectors.
 *
 * A call-local open-addressed set records ordered pairs of aggregate objects
 * already being compared.  Reaching the same comparison again is the back edge
 * of a cyclic graph and succeeds coinductively; a differing leaf or vector length
 * is still found before that edge can make the whole comparison succeed.  The
 * table is lazy, so scalar/string-only equality keeps its old allocation-free
 * fast path. */
typedef struct {
  val left;
  val right;
  unsigned char used;
} equal_slot;

typedef struct {
  equal_slot *slots;
  size_t cap;
  size_t used;
} equal_seen;

static size_t equal_hash(val a, val b) {
  uintptr_t x = (uintptr_t)a >> 3;
  uintptr_t y = (uintptr_t)b >> 3;
  x ^= x >> 30; x *= UINT64_C(0xbf58476d1ce4e5b9);
  y ^= y >> 27; y *= UINT64_C(0x94d049bb133111eb);
  return (size_t)(x ^ (y + UINT64_C(0x9e3779b97f4a7c15) + (x << 6) + (x >> 2)));
}

static void equal_seen_grow(equal_seen *seen) {
  size_t oldcap = seen->cap;
  equal_slot *old = seen->slots;
  size_t cap = oldcap ? oldcap * 2 : 32;
  equal_slot *slots = (equal_slot *)GC_MALLOC(cap * sizeof(equal_slot));
  memset(slots, 0, cap * sizeof(equal_slot));
  for (size_t i = 0; i < oldcap; i++) {
    if (!old[i].used) continue;
    size_t j = equal_hash(old[i].left, old[i].right) & (cap - 1);
    while (slots[j].used) j = (j + 1) & (cap - 1);
    slots[j] = old[i];
  }
  seen->slots = slots;
  seen->cap = cap;
}

/* Return 1 when (a,b) was already present; otherwise insert it and return 0. */
static int equal_seen_before(equal_seen *seen, val a, val b) {
  if (!seen->cap || (seen->used + 1) * 4 >= seen->cap * 3)
    equal_seen_grow(seen);
  size_t i = equal_hash(a, b) & (seen->cap - 1);
  while (seen->slots[i].used) {
    if (seen->slots[i].left == a && seen->slots[i].right == b) return 1;
    i = (i + 1) & (seen->cap - 1);
  }
  seen->slots[i].left = a;
  seen->slots[i].right = b;
  seen->slots[i].used = 1;
  seen->used++;
  return 0;
}

static val equal_walk(val a, val b, equal_seen *seen) {
  if (a == b) return TRUE_V;
  if (tag_of(a) == TAG_PAIR && tag_of(b) == TAG_PAIR) {
    if (equal_seen_before(seen, a, b)) return TRUE_V;
    if (equal_walk(as_ptr(a)[0], as_ptr(b)[0], seen) != TRUE_V) return FALSE_V;
    return equal_walk(as_ptr(a)[1], as_ptr(b)[1], seen);
  }
  if (tag_of(a) == TAG_EXT && tag_of(b) == TAG_EXT) {
    if (ext_hdr(a) == HDR_STRING && ext_hdr(b) == HDR_STRING) {
      intptr_t la = str_len(a);
      if (la != str_len(b)) return FALSE_V;
      return truthy(memcmp(str_bytes(a), str_bytes(b), (size_t)la) == 0);
    }
    if (ext_hdr(a) == HDR_VECTOR && ext_hdr(b) == HDR_VECTOR) {
      intptr_t la = vec_len(a);
      if (la != vec_len(b)) return FALSE_V;
      if (equal_seen_before(seen, a, b)) return TRUE_V;
      for (intptr_t i = 0; i < la; i++)
        if (equal_walk(as_ptr(a)[i + 2], as_ptr(b)[i + 2], seen) != TRUE_V) return FALSE_V;
      return TRUE_V;
    }
    if (ext_hdr(a) == HDR_BYTEVECTOR && ext_hdr(b) == HDR_BYTEVECTOR) {
      intptr_t la = bv_len(a);
      if (la != bv_len(b)) return FALSE_V;
      return truthy(memcmp(bv_bytes(a), bv_bytes(b), (size_t)la) == 0);
    }
    if (ext_hdr(a) == HDR_FLONUM && ext_hdr(b) == HDR_FLONUM)
      return truthy(flo_val(a) == flo_val(b));   /* equal? on flonums: by value */
  }
  return FALSE_V;
}

val rt_equal(val a, val b) {
  equal_seen seen = { NULL, 0, 0 };
  return equal_walk(a, b, &seen);
}

/* --- error: report who/message/irritants and abort (error-and-guard-conditions)
 * The prelude formats "who: message" in-language and passes it as `prefix`; the
 * irritants (arbitrary values) are rendered here into rt_trap_msg with the same
 * tag-walking as rt_write, then we trap exactly like rt_arity_error -- under the
 * REPL host the longjmp unwinds and the session survives; standalone we exit(1).
 * Rendering is bounded by rt_trap_msg's capacity (a compact, possibly truncated
 * diagnostic; design: "compact form" over a full writer). */
static void err_put(char *buf, size_t cap, size_t *off, const char *s, size_t n) {
  for (size_t i = 0; i < n && *off + 1 < cap; i++) buf[(*off)++] = s[i];
  buf[*off] = '\0';
}
/* THE TRAP FORMATTER IS BOUNDED, NOT LABELLED (change: host-runtime-corrections, issue
 * #90; design D1).  `err_put` already respects `cap`, so a full buffer stopped the COPYING
 * -- but every loop here kept WALKING, so a cyclic irritant spun forever having emitted
 * nothing at all: `(error "boom" x)` on a circular list produced zero bytes and never
 * returned.  Measured, not theorised.
 *
 * `write` answers this with datum labels; this path must not.  It formats into the static
 * `rt_trap_msg` with no allocation, because it runs while a trap is being delivered and the
 * heap is the thing least worth trusting; a visited set here would be allocation on exactly
 * the wrong path, to make a diagnostic nobody reads back round-trip.  A bound is all it
 * needs, and the bound falls out of the buffer it already has.
 *
 * One check does both jobs.  Gating on "the buffer is full" at function entry AND in every
 * loop terminates a cycle (the walk stops once the text stops) and also caps recursion
 * depth: each level emits at least one byte before descending, so depth cannot exceed the
 * capacity.  A few bytes of headroom are reserved so a truncated render can say `...`
 * rather than simply stopping mid-datum. */
static int err_full(size_t cap, size_t *off) { return *off + 5 >= cap; }

static void err_write(char *buf, size_t cap, size_t *off, val v) {
  char tmp[32];
  if (err_full(cap, off)) return;
  switch (tag_of(v)) {
    case TAG_FIXNUM:
      err_put(buf, cap, off, tmp, (size_t)snprintf(tmp, sizeof tmp, "%ld", (long)UNFIX(v)));
      break;
    case TAG_BOOL:
      if (is_char(v)) {                                  /* char shares tag 001 */
        unsigned char cb[4]; int cn = utf8_encode(CHAR_CP(v), cb);
        err_put(buf, cap, off, "#\\", 2);
        err_put(buf, cap, off, (const char *)cb, (size_t)cn);
      } else if (is_eof(v)) {          /* eof object shares tag 001; not a boolean */
        err_put(buf, cap, off, "#<eof>", 6);
      } else {
        err_put(buf, cap, off, v == FALSE_V ? "#f" : "#t", 2);
      }
      break;
    case TAG_NIL:  err_put(buf, cap, off, "()", 2); break;
    case TAG_PAIR: {
      err_put(buf, cap, off, "(", 1);
      val cur = v; int first = 1;
      while (tag_of(cur) == TAG_PAIR && !err_full(cap, off)) {
        if (!first) err_put(buf, cap, off, " ", 1);
        first = 0;
        err_write(buf, cap, off, as_ptr(cur)[0]);
        cur = as_ptr(cur)[1];
      }
      if (tag_of(cur) == TAG_PAIR) {                    /* stopped on the bound: say so */
        err_put(buf, cap, off, " ...", 4);
      } else if (cur != NIL_V) {
        err_put(buf, cap, off, " . ", 3); err_write(buf, cap, off, cur);
      }
      err_put(buf, cap, off, ")", 1);
      break;
    }
    case TAG_SYMBOL: err_put(buf, cap, off, sym_name(v), strlen(sym_name(v))); break;
    case TAG_EXT:
      if (ext_hdr(v) == HDR_STRING) { err_put(buf, cap, off, str_bytes(v), (size_t)str_len(v)); break; }
      if (ext_hdr(v) == HDR_ERROR) {                       /* message, then irritants */
        val msg = as_ptr(v)[1], irritants = as_ptr(v)[2];
        err_put(buf, cap, off, str_bytes(msg), (size_t)str_len(msg));
        /* bounded for the same reason as the spine above: an irritant LIST can be
         * circular too, and this loop is where `(error "msg" <cyclic>)` used to spin */
        val cur = irritants;
        for (; tag_of(cur) == TAG_PAIR && !err_full(cap, off); cur = as_ptr(cur)[1]) {
          err_put(buf, cap, off, " ", 1);
          err_write(buf, cap, off, as_ptr(cur)[0]);
        }
        if (tag_of(cur) == TAG_PAIR) err_put(buf, cap, off, " ...", 4);
        break;
      }
      if (ext_hdr(v) == HDR_FLONUM) {
        char fb[40]; int fn = flonum_format(flo_val(v), fb);
        err_put(buf, cap, off, fb, (size_t)fn);
        break;
      }
      err_put(buf, cap, off, "#<obj>", 6);
      break;
    default: err_put(buf, cap, off, "#<obj>", 6); break;
  }
}

/* --- R7RS exceptions subset: error objects, raise, guard (r7rs-exceptions-subset)
 * A `guard` pushes an escape frame (a setjmp) via rt_run_guarded; `raise` (and
 * `error`, which raises an error object) longjmps to the nearest frame, else
 * falls back to the outermost trap (rt_trap) exactly as before -- so uncaught
 * behavior (REPL host survives; standalone exits non-zero) is unchanged.  guard
 * is only an upward, one-shot escape, so setjmp/longjmp suffices (no call/cc).
 * Validated by a setjmp/longjmp guard prototype during design. */
#define RT_GUARD_MAX 256

/* --- escape frames (change: dynamic-extent, rung 3) -------------------------
 * ONE frame stack serves `guard` and escape continuations, because they are the
 * same thing: a setjmp point that a later longjmp delivers a value to.  What the
 * stack gained for continuations is a per-frame GENERATION ID.
 *
 * A continuation object holds its frame's id, not its index.  Invoking it scans
 * the LIVE frames for that id: if the capturing call has already returned, the id
 * is gone and the escape is refused instead of longjmping into a dead frame --
 * which would be undefined behaviour attributed to anything but the continuation.
 * Ids are never reused (monotonic), so a recycled index cannot alias.
 *
 * Under design D4 `raise` no longer longjmps -- it calls the current handler in
 * Scheme -- so the ONLY thing that transfers here is an escape, and the payload is
 * uniformly "the value escaped with". */
static jmp_buf  rt_esc_env[RT_GUARD_MAX];
static val      rt_esc_value[RT_GUARD_MAX];   /* held only across an immediate longjmp */
static intptr_t rt_esc_id[RT_GUARD_MAX];
static intptr_t rt_esc_next_id = 1;           /* monotonic; 0 is never a live id */
static int      rt_guard_depth = 0;

/* Reset the frame stack; a host calls this after catching an outermost trap so a
 * longjmp that bypassed rt_run_guarded's pop does not leave stale frames. */
void rt_guard_reset(void) { rt_guard_depth = 0; rt_trap_in_flight = 0; }

/* The innermost live frame's id, for the thunk that was just entered under
 * rt_run_guarded -- this is how `call/cc` learns which frame is its own. */
val rt_escape_frame(void) {
  if (rt_guard_depth <= 0) rt_fatal("escape frame requested outside any frame");
  return FIX(rt_esc_id[rt_guard_depth - 1]);
}

/* Escape to the frame with ID, delivering VALUE.  Does not return on success.
 * Returns #f when no LIVE frame carries that id -- the continuation's extent has
 * ended.  Refusing here rather than jumping is what makes an escape-only `call/cc`
 * incomplete instead of unsound; the caller turns the #f into a Scheme error, so
 * the diagnostic travels the ordinary handler path (design D1/D4). */
/* Is a continuation still invocable -- is its frame still live?  This must be
 * checked BEFORE unwinding: unwinding to a dead continuation's wind depth tears
 * down dynamic state for a transfer that cannot happen, and in particular runs the
 * `after` that pops the very handler which should report the error. */
val rt_escape_live_p(val id_v) {
  intptr_t id = UNFIX(id_v);
  for (int i = rt_guard_depth - 1; i >= 0; i--)
    if (rt_esc_id[i] == id) return TRUE_V;
  return FALSE_V;
}

val rt_escape_to(val id_v, val value) {
  intptr_t id = UNFIX(id_v);
  for (int i = rt_guard_depth - 1; i >= 0; i--) {
    if (rt_esc_id[i] == id) {
      rt_esc_value[i] = value;
      longjmp(rt_esc_env[i], 1);
    }
  }
  return FALSE_V;
}

/* --- the error-object KIND (change: catchable-errors-with-kinds, design D1) ---
 * The kind says what RAISED the object, and is the whole of what `read-error?` and
 * `file-error?` answer over.  Four of them, interned once: a symbol is open (a fifth
 * costs a string), canonicalized by rt_intern so the comparison is one word, and
 * kept alive with no extra rooting because intern_table is already an uncollectable
 * scanned array.  It is reached from Scheme only through %error-object-kind, an
 * internal primitive -- no public accessor freezes this encoding. */
#define KIND_ERROR   0
#define KIND_READ    1
#define KIND_FILE    2
#define KIND_RUNTIME 3
static val rt_kinds[4];
static int rt_kinds_ready = 0;
static val rt_kind(int which) {
  if (!rt_kinds_ready) {
    rt_kinds[KIND_ERROR]   = rt_intern("error");
    rt_kinds[KIND_READ]    = rt_intern("read");
    rt_kinds[KIND_FILE]    = rt_intern("file");
    rt_kinds[KIND_RUNTIME] = rt_intern("runtime");
    rt_kinds_ready = 1;
  }
  return rt_kinds[which];
}

val rt_make_error_object_kind(val message, val irritants, val kind) {
  val *p = (val *)GC_MALLOC(4 * sizeof(val));
  p[0] = HDR_ERROR; p[1] = message; p[2] = irritants; p[3] = kind;
  return tag_ptr(p, TAG_EXT);
}
/* The two-argument entry point stays, defaulting to the plain kind: it is what
 * `error` and rt_error build, and keeping it spares every existing caller. */
val rt_make_error_object(val message, val irritants) {
  return rt_make_error_object_kind(message, irritants, rt_kind(KIND_ERROR));
}
val rt_error_object_p(val v) { return truthy(is_error_obj(v)); }
val rt_error_object_kind(val v) {
  CHECK_TAG("%error-object-kind", v, is_error_obj, "an error object");
  return as_ptr(v)[3];
}
/* User-facing, and reached from inside a `guard` clause -- the one construct a
 * program uses to recover from a failure, so an unchecked read here crashed the
 * recovery path itself. */
val rt_error_object_message(val v) {
  CHECK_TAG("error-object-message", v, is_error_obj, "an error object");
  return as_ptr(v)[1];
}
val rt_error_object_irritants(val v) {
  CHECK_TAG("error-object-irritants", v, is_error_obj, "an error object");
  return as_ptr(v)[2];
}

/* An UNHANDLED raise: render and trap.  Under design D4 (change: dynamic-extent)
 * `raise` is Scheme-level -- it calls the current handler off the Scheme handler
 * stack -- so control only reaches here when no handler is installed.  The old
 * longjmp-to-the-nearest-frame branch is gone: frames now carry escape VALUES, and
 * a `guard` escapes to its own frame from its handler like any other escape, so a
 * raise must never transfer here or it would be delivered as an escape value. */
val rt_raise(val obj) {
  size_t off = 0;
  err_write(rt_trap_msg, sizeof rt_trap_msg, &off, obj);
  fprintf(stderr, "%s\n", rt_trap_msg);
  if (rt_trap) longjmp(*rt_trap, 1);
  exit(1);
  return NIL_V;   /* unreachable; keeps the i64-returning call site well-typed */
}

/* The emitter-synthesized ccc trampoline @__apply0 (per module) has this type;
 * it does the fastcc 0-arg call into the guarded thunk closure. */
typedef val (*rt_apply0_t)(val);

/* --- runtime traps as conditions (change: catchable-errors-with-kinds, D3) ----
 * The runtime hands a trap off ONCE and is then out of the loop: it builds an error
 * object, parks it, and calls the installed raiser thunk.  From that call onward the
 * transfer is Scheme's -- `raise` walks *handlers*, a `guard` handler escapes, and
 * the escape path runs the dynamic-wind `after` thunks.  This is why dynamic-extent's
 * design D4 stands: what was rejected there was a C-driven UNWINDING LOOP calling
 * back into Scheme per `after`, not a single hand-off.
 *
 * The raiser is a THUNK, not a one-argument procedure, and the object travels through
 * a cell instead.  That is what lets it be invoked through the module's existing
 * @__apply0 trampoline (the same pointer rt_run_guarded is handed), rather than
 * needing a second trampoline whose positional-slot count would have to agree with
 * whatever arity the installing module happened to have.
 *
 * Both cells are GC_MALLOC_UNCOLLECTABLE single slots -- scanned roots, following
 * rt_repl_cell in this same file -- so the closure and the pending object survive a
 * collection triggered between install and delivery. */
static val *rt_raiser_cell   = NULL;      /* [1]: the installed raiser thunk */
static val *rt_trap_obj_cell = NULL;      /* [1]: the object being delivered */
static rt_apply0_t rt_raiser_fn = NULL;   /* the installing module's ccc trampoline */

/* --- selecting the raiser per host entry (change: host-runtime-corrections, issue #97) ---
 * The cell above is ONE global, but a host process holds more than one instance of the
 * standard library: `build/emit` links its own baked `(scheme base)`, and a REPL session
 * JITs a second one for the code it compiles.  Each `__init` arms the raiser, so the LAST
 * one to initialize wins -- and from the first session onward, a trap inside the COMPILER
 * was raised into the SESSION's handler chain, which is empty while compiling.
 *
 * That is not merely a mis-attributed message.  `compile-one-form` (src/repl-core.ss) wraps
 * every per-form compile in a `guard` whose handler RESTORES A SESSION SNAPSHOT -- the env,
 * the macro environment, the known set, the counter -- so that a failing form cannot leave
 * the session half-mutated (design D3 of the REPL work).  A trap that walks the wrong
 * chain bypasses that handler, so the session survives with state from a form that failed.
 *
 * THE FIRST RAISER ARMED IN THE PROCESS IS THE HOST'S OWN, by construction: the host's
 * linked-in standard library initializes before any JIT'd module can be added, let alone
 * run.  Remembering it costs one cell and spares the host from having to know its own
 * startup order -- it just asks to run "as the host" around a compile call.
 *
 * The saved thunks live in an UNCOLLECTABLE, SCANNED array for the same reason the live
 * cell does: a saved closure must survive a collection between save and restore.  Function
 * pointers are not GC objects, so those ride a plain static array. */
#define RT_RAISER_DEPTH 8
static val         *rt_raiser_first_cell = NULL;              /* [1]: first armed thunk */
static rt_apply0_t  rt_raiser_first_fn   = NULL;
static val         *rt_raiser_saved      = NULL;              /* [RT_RAISER_DEPTH] */
static rt_apply0_t  rt_raiser_saved_fn[RT_RAISER_DEPTH];
static int          rt_raiser_sp = 0;

/* Install the raiser.  FN is the caller module's @__apply0, passed by the emitter's
 * special case for %set-trap-raiser! exactly as it is for %run-guarded. */
val rt_set_trap_raiser(rt_apply0_t fn, val thunk) {
  rt_repl_cell(&rt_raiser_cell, FALSE_V)[0] = thunk;
  /* Allocate the object cell HERE rather than letting rt_trap_deliver do it lazily:
   * that keeps the uncollectable allocation off the trap path, where the less that
   * happens before the hand-off the better. */
  rt_repl_cell(&rt_trap_obj_cell, FALSE_V);
  rt_raiser_fn = fn;
  if (rt_raiser_first_fn == NULL) {          /* the host's own instance; see above */
    rt_repl_cell(&rt_raiser_first_cell, FALSE_V)[0] = thunk;
    rt_raiser_first_fn = fn;
  }
  return UNSPEC_V;
}

/* Run the next stretch of code as the HOST's instance: save whatever raiser is current and
 * install the first-armed one.  Returns a token for rt_raiser_leave_host, or -1 when there
 * is nothing to swap (no raiser armed yet, or the nesting depth is exhausted -- in which
 * case the current raiser simply stays, which is the pre-existing behaviour). */
intptr_t rt_raiser_enter_host(void) {
  if (rt_raiser_first_fn == NULL || rt_raiser_sp >= RT_RAISER_DEPTH) return -1;
  if (!rt_raiser_saved)
    rt_raiser_saved = (val *)GC_MALLOC_UNCOLLECTABLE(RT_RAISER_DEPTH * sizeof(val));
  int t = rt_raiser_sp++;
  rt_raiser_saved[t]    = rt_repl_cell(&rt_raiser_cell, FALSE_V)[0];
  rt_raiser_saved_fn[t] = rt_raiser_fn;
  rt_repl_cell(&rt_raiser_cell, FALSE_V)[0] = rt_repl_cell(&rt_raiser_first_cell, FALSE_V)[0];
  rt_raiser_fn = rt_raiser_first_fn;
  return t;
}

/* Put back the raiser that rt_raiser_enter_host displaced.  Safe to call after a longjmp
 * out of the bracketed call: the token pops the stack back to where it was, so an
 * abandoned entry leaks no depth. */
void rt_raiser_leave_host(intptr_t t) {
  if (t < 0 || t >= RT_RAISER_DEPTH) return;
  rt_raiser_sp = (int)t;
  rt_repl_cell(&rt_raiser_cell, FALSE_V)[0] = rt_raiser_saved[t];
  rt_raiser_fn = rt_raiser_saved_fn[t];
}

/* The object the raiser is being asked to raise. */
val rt_trap_object(void) { return rt_repl_cell(&rt_trap_obj_cell, FALSE_V)[0]; }

static void rt_trap_deliver(void) {
  if (rt_raiser_fn && !rt_trap_in_flight) {
    rt_trap_in_flight = 1;
    /* '() irritants, deliberately: err_write's HDR_ERROR arm emits the message and
     * then one space-prefixed irritant each, so an empty list makes an UNCAUGHT trap
     * render exactly the bytes fprintf("%s\n", rt_trap_msg) used to (design D7). */
    rt_repl_cell(&rt_trap_obj_cell, FALSE_V)[0] =
      rt_make_error_object_kind(rt_make_string(rt_trap_msg, (intptr_t)strlen(rt_trap_msg)),
                                NIL_V, rt_kind(KIND_RUNTIME));
    rt_raiser_fn(rt_raiser_cell[0]);
    /* A raiser does not return: a handler escapes, and an unhandled raise reports and
     * transfers from rt_raise.  Falling through anyway costs nothing and keeps this
     * function non-returning by construction. */
    rt_trap_in_flight = 0;
  }
  fprintf(stderr, "%s\n", rt_trap_msg);
  if (rt_trap) longjmp(*rt_trap, 1);
  exit(1);
}

/* Run THUNK guarded: push a frame, setjmp, call it through the module's ccc
 * trampoline FN.  Returns (#f . value) on normal completion, (#t . object) if a
 * raise landed here.  Frame is popped on both paths (and any deeper abandoned
 * frames are discarded on the caught path). */
val rt_run_guarded(rt_apply0_t fn, val thunk) {
  if (rt_guard_depth >= RT_GUARD_MAX) rt_fatal("escape/guard nesting too deep");
  int i = rt_guard_depth++;
  rt_esc_id[i] = rt_esc_next_id++;      /* never reused: see rt_escape_to */
  if (setjmp(rt_esc_env[i]) == 0) {
    val v = fn(thunk);
    rt_guard_depth = i;
    return rt_cons(FALSE_V, v);
  } else {
    val o = rt_esc_value[i];
    rt_guard_depth = i;
    /* One of the two places a delivered trap's longjmp LANDS (design D4).  Clearing
     * here, not after the raiser call, is what re-arms the mechanism for the next
     * trap -- a handler that escapes never returns to rt_trap_deliver's frame. */
    rt_trap_in_flight = 0;
    return rt_cons(TRUE_V, o);
  }
}

/* error: (error message obj ...) -- raise a fresh error object (R7RS signature).
 * The prelude passes the message string and the irritant list. */
val rt_error(val message, val irritants) {
  return rt_raise(rt_make_error_object(message, irritants));
}

/* --- value printer (tag-walking, design R1) ----------------------------
 * One recursive printer serves both `write` and `display` style (change:
 * fix-display-non-string).  `display` gates ONLY the two arms that differ:
 * strings print their raw contents (no surrounding quotes) and characters print
 * as the raw character (no `#\` prefix); every other arm is identical, and
 * compound values recurse in the SAME mode so nested strings/chars follow suit.
 * Dispatch is on the runtime tag, so no value is ever read as the wrong type --
 * `display` of a non-string is memory-safe, not a segfault.
 *
 * `out` is the destination stream: stdout for display/write/the final-value
 * print, stderr for the embedded compiler's narration (rt_stderr_write, change:
 * emit-dump-stages).  It is a parameter rather than a hardwired stdout so that
 * narration and data share ONE printer -- the alternative was a second
 * stderr-only printer to keep in sync with this one. */
/* Would NAME read back as this same symbol without |bars| (change:
 * reader-lexical-conformance, design D7)?  Write style has to produce readable output,
 * and `(write (string->symbol "a b"))` used to print `a b` -- two symbols when read
 * back -- because the printer emitted no bars and the reader accepted none.  Both
 * halves land together; this is the printer's half.
 *
 * The test deliberately UNDER-fires rather than over-fires, and mirrors what
 * src/prelude.scm's reader actually does with a token: a name needs bars when it is
 * empty, holds a delimiter or a character the reader would dispatch on, or begins the
 * way a number begins.  Every symbol the compiler itself prints -- mangled names
 * (`lib.name:x`), gensyms, IL keywords -- fails all of those, so no existing dump or
 * REPL echo changes shape.  `display` never consults this: it writes the raw name. */
/* ASCII case-insensitive equality against a lowercase literal.  Local rather than
 * strcasecmp so no new header (and no locale) enters the runtime for one comparison. */
static int ci_streq(const char *s, const char *lower) {
  size_t i = 0;
  for (; lower[i]; i++) {
    unsigned char c = (unsigned char)s[i];
    if (c >= 'A' && c <= 'Z') c = (unsigned char)(c - 'A' + 'a');
    if (c != (unsigned char)lower[i]) return 0;
  }
  return s[i] == '\0';
}

static int sym_needs_bars(const char *s) {
  size_t n = strlen(s);
  if (n == 0) return 1;                                  /* the empty symbol */
  for (size_t i = 0; i < n; i++) {
    unsigned char c = (unsigned char)s[i];
    if (c <= ' ' || c == 0x7f) return 1;                 /* whitespace and controls */
    if (strchr("()[]{}\"'`,;|\\", (char)c)) return 1;     /* delimiters and datum starts */
  }
  if (s[0] == '#') return 1;                             /* the reader dispatches on # */
  if (s[0] >= '0' && s[0] <= '9') return 1;              /* would begin a number */
  if (s[0] == '.' && (n == 1 || (s[1] >= '0' && s[1] <= '9')))
    return 1;                        /* the dotted-pair marker, and .5 -- but NOT `...` */
  if ((s[0] == '+' || s[0] == '-') && n > 1) {
    if (s[1] >= '0' && s[1] <= '9') return 1;                        /* -1 */
    if (s[1] == '.' && n > 2 && s[2] >= '0' && s[2] <= '9') return 1; /* +.5 */
    /* CASE-INSENSITIVELY, because the reader matches them that way (change:
     * r7rs-lexical-conformance).  This comparison is the printer's mirror of
     * rd-nonfinite, and when that became case-insensitive this had to follow or the
     * mirror breaks in the direction that costs a round trip: `+NaN.0` reads as a
     * NUMBER now, so the symbol of that name written bare comes back as a number
     * rather than as itself. */
    if (ci_streq(s, "+inf.0") || ci_streq(s, "-inf.0") || ci_streq(s, "+nan.0")) return 1;
  }
  return 0;
}

/* --- datum labels: the printer terminates on a cycle -----------------------
 * (change: host-runtime-corrections, issue #90.)  R7RS 6.13.3 requires `write` to use
 * datum labels for a structure containing a cycle, so its output is finite and reads back
 * as the same structure.  Before this the pair arm followed `cdr` until a non-pair and the
 * vector arm recursed on elements, so a cycle -- constructible since `set-car!`/`set-cdr!`
 * landed -- printed forever.  Measured, on all four routes: stdout, a string port (worse,
 * since the output accumulates in the port's buffer and grows the heap), and both write and
 * display.
 *
 * ONLY A CYCLE IS LABELLED, not every shared node.  A node revisited while it is still on
 * the current path is a back-edge target and gets a label; a node revisited after it has
 * been fully explored is acyclic sharing and is printed in full a second time.  That is the
 * `write` / `write-shared` distinction (R7RS 6.13.3), and labelling all sharing here would
 * make `write` do `write-shared`'s job.  Labelling back-edge targets alone is sufficient
 * for termination: every cycle contains one, and the second visit prints `#N#`.
 *
 * THE TABLE IS STATIC AND REUSED, with a generation counter instead of a clear:
 *
 *   - no allocation for ordinary data -- 128 slots live in .bss, which covers anything a
 *     REPL echo or a demo prints;
 *   - O(1) lookups, so printing a long list stays linear.  A linear scan would have made
 *     printing an n-element list O(n^2), which is a real regression on the common path and
 *     the reason this is a hash table rather than the small array the design first proposed;
 *   - `pl_gen++` invalidates every entry at once, so a print that is abandoned by a longjmp
 *     (a trap while printing) leaves nothing to clean up -- the next print cannot see stale
 *     entries.  That self-healing is why the generation counter is worth the field.
 *
 * The keys are Scheme pointers but nothing dereferences them after the scan, and the datum
 * being printed is held by the caller, so the table needs no GC visibility of its own.
 *
 * Not addressed here, and pre-existing: `print_val` recurses on cars and vector elements, so
 * a datum nested a million deep can still exhaust the C stack.  The scan mirrors the
 * printer exactly -- iterative along a pair spine, recursive into cars and elements -- so it
 * adds no new depth of its own. */
typedef struct {
  val           key;
  int           label;         /* -1 until the node is found to be a back-edge target */
  unsigned      count;         /* incoming occurrences seen by the shared prepass */
  unsigned char onpath;        /* on the current DFS path (scan only) */
  unsigned char printed;       /* `#N=` already emitted (print only) */
  unsigned      gen;           /* entry is live iff gen == pl_gen */
} pl_slot;

#define PL_STATIC_SLOTS 128u   /* power of two */

static pl_slot  pl_static[PL_STATIC_SLOTS];
static pl_slot *pl_tab = pl_static;
static size_t   pl_cap = PL_STATIC_SLOTS;    /* always a power of two */
static size_t   pl_used = 0;
static unsigned pl_gen = 0;
static int      pl_next_label = 0;
static int      pl_any = 0;                  /* did the scan find any cycle at all? */

static int pl_labelable(val v) { return tag_of(v) == TAG_PAIR || is_vector(v); }

static size_t pl_hash(val v) {
  uintptr_t x = (uintptr_t)v >> 3;
  x *= (uintptr_t)0x9E3779B97F4A7C15ull;      /* fibonacci mix; pointers are not random */
  return (size_t)(x >> 17);
}

static void pl_grow(void);

/* Find V's slot, creating it when CREATE.  The returned pointer is invalidated by any
 * later create, so callers use it before recursing (they do). */
static pl_slot *pl_find(val v, int create) {
  size_t mask = pl_cap - 1, i = pl_hash(v) & mask;
  for (;;) {
    pl_slot *s = &pl_tab[i];
    if (s->gen != pl_gen) {                   /* empty in this generation */
      if (!create) return NULL;
      if ((pl_used + 1) * 2 >= pl_cap) { pl_grow(); return pl_find(v, 1); }
      s->gen = pl_gen; s->key = v; s->label = -1; s->count = 0;
      s->onpath = 0; s->printed = 0;
      pl_used++;
      return s;
    }
    if (s->key == v) return s;
    i = (i + 1) & mask;
  }
}

/* Double the table and rehash this generation's entries.  The old static array is left
 * alone (it is .bss); a grown table is GC_MALLOCed and simply dropped on the next grow. */
static void pl_grow(void) {
  size_t ncap = pl_cap * 2;
  pl_slot *ntab = (pl_slot *)GC_MALLOC(ncap * sizeof(pl_slot));
  pl_slot *otab = pl_tab; size_t ocap = pl_cap;
  pl_tab = ntab; pl_cap = ncap;
  size_t mask = ncap - 1;
  for (size_t i = 0; i < ocap; i++) {
    if (otab[i].gen != pl_gen) continue;
    size_t j = pl_hash(otab[i].key) & mask;
    while (ntab[j].gen == pl_gen) j = (j + 1) & mask;
    ntab[j] = otab[i];
  }
}

/* Pass 1: find every node that is reachable from itself, and label it. */
static void pl_scan(val v, enum print_policy policy) {
  if (!pl_labelable(v)) return;
  if (tag_of(v) == TAG_PAIR) {
    /* Iterate the spine, exactly as the printer does, so a long list costs no C stack.
     * Cars recurse; their depth is the datum's nesting, not its length. */
    val cur = v; intptr_t pushed = 0;
    while (tag_of(cur) == TAG_PAIR) {
      pl_slot *s = pl_find(cur, 1);
      s->count++;
      if (policy == PRINT_SHARED && s->count == 2 && s->label < 0) {
        s->label = pl_next_label++; pl_any = 1;
      }
      if (s->onpath) {                          /* back edge: this node closes a cycle */
        if (s->label < 0) { s->label = pl_next_label++; pl_any = 1; }
        break;
      }
      if (s->printed) break;                    /* already fully explored (see below) */
      s->onpath = 1; pushed++;
      pl_scan(as_ptr(cur)[0], policy);
      cur = as_ptr(cur)[1];
    }
    if (tag_of(cur) != TAG_PAIR && cur != NIL_V) pl_scan(cur, policy);
    /* Unwind EXACTLY the nodes this invocation pushed -- the first `pushed` of the spine
     * starting at v -- and no others.  Clearing "while the node is still on the path"
     * instead is wrong, and subtly: a car that points back at an ancestor re-enters
     * pl_scan on a node the OUTER walk owns, and that nested call would clear the outer
     * walk's marks on its way out.  The outer walk then unwinds nothing, leaving a later
     * spine node marked on-path forever -- so the next node to reach it looks like a back
     * edge and gets a label it should not have.  A spurious `#0=` on acyclic data, from a
     * shape as ordinary as a cycle through a car plus sharing further down the list.
     *
     * `printed` doubles as the "fully explored" mark during the scan; it is only read by
     * the print pass, which runs after, and reusing it keeps the slot to four fields. */
    for (val c = v; pushed > 0; c = as_ptr(c)[1], pushed--) {
      pl_slot *s = pl_find(c, 0);
      if (s) { s->onpath = 0; s->printed = 1; }
    }
  } else {
    pl_slot *s = pl_find(v, 1);
    s->count++;
    if (policy == PRINT_SHARED && s->count == 2 && s->label < 0) {
      s->label = pl_next_label++; pl_any = 1;
    }
    if (s->onpath) {
      if (s->label < 0) { s->label = pl_next_label++; pl_any = 1; }
      return;
    }
    if (s->printed) return;
    s->onpath = 1;
    intptr_t len = (intptr_t)as_ptr(v)[1];
    for (intptr_t i = 0; i < len; i++) pl_scan(as_ptr(v)[i + 2], policy);
    s = pl_find(v, 0);                  /* re-find: a nested scan may have grown the table */
    if (s) { s->onpath = 0; s->printed = 1; }
  }
}

/* Between the two passes: `printed` was the scan's "explored" mark, so clear it before the
 * print pass gives it its real meaning.  Only labelled nodes matter, and there are few. */
static void pl_reset_printed(void) {
  for (size_t i = 0; i < pl_cap; i++)
    if (pl_tab[i].gen == pl_gen) pl_tab[i].printed = 0;
}

static void print_node(FILE *out, val v, int display);

static void print_val(FILE *out, val v, int display, enum print_policy policy) {
  if (policy != PRINT_SIMPLE && pl_labelable(v)) {
    pl_gen++; pl_used = 0; pl_next_label = 0; pl_any = 0;
    pl_scan(v, policy);
    if (pl_any) pl_reset_printed();
  } else {
    pl_any = 0;                     /* an atom cannot contain a cycle: no scan, no cost */
  }
  print_node(out, v, display);
}

static void print_node(FILE *out, val v, int display) {
  /* A labelled node prints `#N=` at its first occurrence and `#N#` at every later one.
   * Gated on pl_any, so a datum with no cycle does not pay a lookup per node. */
  if (pl_any && pl_labelable(v)) {
    pl_slot *s = pl_find(v, 0);
    if (s && s->label >= 0) {
      if (s->printed) { fprintf(out, "#%d#", s->label); return; }
      s->printed = 1;
      fprintf(out, "#%d=", s->label);
    }
  }
  switch (tag_of(v)) {
    case TAG_FIXNUM: fprintf(out, "%ld", (long)UNFIX(v)); break;
    case TAG_BOOL:
      if (is_char(v)) {                                  /* char shares tag 001 */
        intptr_t cp = CHAR_CP(v);
        unsigned char buf[4];
        int n = utf8_encode(cp, buf);
        /* WRITE NAMES EVERY R7RS CHARACTER AND HEX-ESCAPES THE REST (change:
         * host-runtime-corrections, issue #94).  Only `space` and `newline` were named, so
         * every other control character was written as `#\` plus its RAW BYTE: `#\<BEL>`
         * rang the terminal, `#\<ESC>` could start an escape sequence, and `#\<NUL>` put a
         * literal zero byte in the stream -- enough to make ordinary text tooling classify
         * a transcript as binary and show nothing at all.  R7RS 6.13.3 asks only that write
         * round-trip, which the raw byte technically did; this is the legibility and safety
         * half, and it is why the change owns a user-visible output move.
         *
         * The names are R7RS 6.6's, in the R7RS spelling even where the reader also accepts
         * an alias (`escape`, not `altmode`/`esc`), so output stays portable.  The reader's
         * table is `rd-char-name` in src/prelude.scm and cannot be shared with this one --
         * that is in-language, this is C -- so a round-trip test is what holds the two
         * together (design D6).
         *
         * `display` is untouched: it writes the raw character in every case, which
         * write-char and the port procedures depend on. */
        if (display) { fwrite(buf, 1, (size_t)n, out); break; }
        switch (cp) {
          case 0x00: fprintf(out, "#\\null");      break;
          case 0x07: fprintf(out, "#\\alarm");     break;
          case 0x08: fprintf(out, "#\\backspace"); break;
          case 0x09: fprintf(out, "#\\tab");       break;
          case 0x0a: fprintf(out, "#\\newline");   break;
          case 0x0d: fprintf(out, "#\\return");    break;
          case 0x1b: fprintf(out, "#\\escape");    break;
          case 0x20: fprintf(out, "#\\space");     break;
          case 0x7f: fprintf(out, "#\\delete");    break;
          default:
            /* Any other non-graphic codepoint -- the C0 controls, and the C1 block, which
             * is equally unprintable -- as `#\xHH`, the one spelling that makes an
             * arbitrary control character legible AND readable (the reader accepts it since
             * change: r7rs-lexical-conformance).  Everything else prints literally, so a
             * letter, a digit, and `#\λ` are unaffected. */
            if (cp < 0x20 || (cp >= 0x80 && cp <= 0x9f)) fprintf(out, "#\\x%lx", (unsigned long)cp);
            else { fprintf(out, "#\\"); fwrite(buf, 1, (size_t)n, out); }
            break;
        }
      } else if (is_unspec(v)) {                /* unspecified value shares tag 001 */
        /* Non-readable, like #<procedure>: there is no reader syntax, so `write` cannot
         * round-trip it and `display` has nothing rawer to show.  Both modes print the
         * same text.  The REPL suppresses the ECHO of this value (src/emit.cpp), but an
         * explicit (write (if #f #f)) still lands here and prints. */
        fprintf(out, "#<unspecified>");
      } else if (is_eof(v)) {                   /* eof object shares tag 001 */
        /* Non-readable, like #<unspecified>: no reader syntax, so write cannot
         * round-trip it and display has nothing rawer to show.  Printing it must be
         * safe -- a program that displays whatever read-char returned lands here at
         * end of input -- so it gets an arm rather than falling into the boolean
         * arm below, which would print it as "#t". */
        fprintf(out, "#<eof>");
      } else {
        fputs(v == FALSE_V ? "#f" : "#t", out);   /* fputs: the string is not a literal */
      }
      break;
    case TAG_NIL:    fprintf(out, "()"); break;
    case TAG_PAIR: {
      fprintf(out, "(");
      val cur = v; int first = 1;
      while (tag_of(cur) == TAG_PAIR) {
        /* A LABELLED SPINE NODE IS DELEGATED, and this is what makes a cyclic LIST
         * terminate (issue #90).  The spine is walked iteratively -- so a long list costs
         * no C stack -- which means the label check at print_node's entry is never reached
         * for the nodes this loop steps to.  Without the check here, the label on the head
         * of a cycle was emitted once and then the loop walked the ring forever:
         * `#0=(1 2 1 2 1 2 ...`.  Only a cycle target carries a label, so delegating on one
         * is exactly the point where the list closes back on itself, and it renders as the
         * improper tail it actually is: `#0=(1 2 . #0#)`. */
        if (!first) {
          if (pl_any) {
            pl_slot *s = pl_find(cur, 0);
            if (s && s->label >= 0) {
              fprintf(out, " . ");
              print_node(out, cur, display);
              cur = NIL_V;                      /* tail already printed */
              break;
            }
          }
          fprintf(out, " ");
        }
        first = 0;
        print_node(out, as_ptr(cur)[0], display);
        cur = as_ptr(cur)[1];
      }
      if (cur != NIL_V) { fprintf(out, " . "); print_node(out, cur, display); }
      fprintf(out, ")");
      break;
    }
    case TAG_CLOSURE: fprintf(out, "#<procedure>"); break;
    case TAG_BOX:     fprintf(out, "#<box>"); break;
    case TAG_SYMBOL: {
      const char *nm = sym_name(v);
      if (display || !sym_needs_bars(nm)) { fprintf(out, "%s", nm); break; }
      fputc('|', out);
      for (const char *p = nm; *p; p++) {
        if (*p == '|' || *p == '\\') fputc('\\', out);   /* the two the reader unescapes */
        fputc(*p, out);
      }
      fputc('|', out);
      break;
    }
    case TAG_EXT:
      switch (ext_hdr(v)) {
        case HDR_STRING:
          if (display) {
            fwrite(str_bytes(v), 1, (size_t)str_len(v), out);
          } else {
            /* write style ESCAPES (change: emit-dump-stages).  R7RS requires written
             * output to read back as the same datum, and this arm used to emit the raw
             * bytes inside quotes -- so `(write "a\"b")` produced "a"b", which no reader
             * can read.  It also made the stage dump (which prints IL forms in write
             * style) invalid data whenever a string constant held a quote or backslash.
             * Escapes are the ones this project's own reader understands
             * (src/prelude.scm's read-from-string: \" \\ \n \t \r), so a dump round-trips
             * through either reader.  Iterating bytes is safe for UTF-8: continuation
             * bytes are all >= 0x80 and pass through verbatim. */
            const char *b = str_bytes(v);
            intptr_t n = str_len(v);
            fputc('"', out);
            for (intptr_t i = 0; i < n; i++) {
              unsigned char c = (unsigned char)b[i];
              switch (c) {
                case '"':  fputs("\\\"", out); break;
                case '\\': fputs("\\\\", out); break;
                case '\n': fputs("\\n", out);  break;
                case '\t': fputs("\\t", out);  break;
                case '\r': fputs("\\r", out);  break;
                default:   fputc((int)c, out); break;
              }
            }
            fputc('"', out);
          }
          break;
        case HDR_VECTOR: {
          intptr_t len = (intptr_t)as_ptr(v)[1];
          fprintf(out, "#(");
          for (intptr_t i = 0; i < len; i++) {
            if (i) fputc(' ', out);
            print_node(out, as_ptr(v)[i + 2], display);
          }
          fputc(')', out);
          break;
        }
        case HDR_BYTEVECTOR: {
          intptr_t len = (intptr_t)as_ptr(v)[1];
          unsigned char *bytes = (unsigned char *)as_ptr(v)[2];
          fprintf(out, "#u8(");
          for (intptr_t i = 0; i < len; i++) {
            if (i) fputc(' ', out);
            fprintf(out, "%d", bytes[i]);
          }
          fputc(')', out);
          break;
        }
        case HDR_ERROR: {
          val msg = as_ptr(v)[1];
          fprintf(out, "#<error ");
          fwrite(str_bytes(msg), 1, (size_t)str_len(msg), out);
          fputc('>', out);
          break;
        }
        case HDR_HASHTABLE: {
          val spine = as_ptr(v)[1];             /* #(count buckets _) */
          intptr_t count = UNFIX(as_ptr(spine)[2]);  /* vector elem 0 = count */
          fprintf(out, "#<hash-table %ld>", (long)count);
          break;
        }
        case HDR_RECORD: {
          val td = as_ptr(v)[1], nm = as_ptr(td)[1];  /* descriptor -> name string */
          fprintf(out, "#<record ");
          fwrite(str_bytes(nm), 1, (size_t)str_len(nm), out);
          fputc('>', out);
          break;
        }
        case HDR_RECORD_TYPE: {
          val nm = as_ptr(v)[1];
          fprintf(out, "#<record-type ");
          fwrite(str_bytes(nm), 1, (size_t)str_len(nm), out);
          fputc('>', out);
          break;
        }
        case HDR_MV:  fprintf(out, "#<values>"); break;   /* stray bundle: print safely */
        case HDR_FLONUM: {                          /* inexact real, always with a '.' */
          char buf[40]; int n = flonum_format(flo_val(v), buf);
          fwrite(buf, 1, (size_t)n, out);
          break;
        }
        default: fprintf(out, "#<ext:%ld>", (long)ext_hdr(v));
      }
      break;
    default:          fprintf(out, "#<unknown:%ld>", (long)v);
  }
}

/* write-style value printer (quoted strings, `#\`-prefixed chars): the standalone
 * entry uses this to print a program's final value. */
void rt_write(val v) { print_val(stdout, v, /*display=*/0, PRINT_ORDINARY); }

/* --- entry: exit code = ran/failed, stdout = value (design R1) ----------
 * The standalone AOT/JIT executables use this main.  The persistent REPL host
 * provides its own main and drives scheme code itself, so it compiles the
 * runtime with -DRT_NO_MAIN to omit this (and the scheme_entry it expects).
 *
 * -DRT_FILTER_MAIN builds a *filter* main that runs the program purely for its
 * effects and suppresses the final-value print -- EVERY final value, not just the
 * unspecified one, which is what still distinguishes it from the default main below.
 * A text filter (e.g. the self-hosted `schemec`, whose entry is `(display
 * (compile-source-string (read-all-stdin)))`) does its own output via `display`;
 * printing the entry's value afterward would corrupt the output stream. */
#ifndef RT_NO_MAIN
extern val scheme_entry(void);

int main(int argc, char **argv) {
  GC_INIT();
  rt_set_command_line(argc, (const char *const *)argv);
#ifdef RT_FILTER_MAIN
  scheme_entry();          /* run for effect; the program handles its own I/O */
#else
  val result = scheme_entry();
  /* Suppress THE unspecified value -- no written form, no newline -- so a program
   * ending in output delivers exactly its own bytes (change: emit-cli-front-door,
   * design D4).  This is the REPL's echo-suppression rule stated for programs, and
   * `emit run`'s in-process path carries the identical guard, so a delivered
   * executable and the development door stay byte-identical on stdout (design D5).
   * A reporting policy, not a property of the value: an explicit (write (if #f #f))
   * goes through print_val and still renders #<unspecified>.  #f and () are
   * legitimate final values and still print. */
  if (!is_unspec(result)) {
    rt_write(result);
    printf("\n");
  }
#endif
  return 0;
}
#endif
