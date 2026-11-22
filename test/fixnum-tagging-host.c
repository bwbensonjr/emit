/* fixnum-tagging-host.c -- negative and boundary fixnums through the C runtime's arithmetic,
 * built with the undefined-behavior sanitizer in trap mode (issue #188).
 *
 * FIX(n) used to shift a signed intptr_t left by three, which C leaves undefined for every
 * negative n, so an ordinary result such as (- 0 1) was undefined behavior in rt_sub even though
 * it is a valid fixnum.  test/fixnum-tagging-tests.sh compiles this file with
 * -fsanitize=undefined -fsanitize-trap=undefined, which needs no sanitizer runtime library (the
 * CI toolchains build clang without compiler-rt): any undefined operation becomes a trap and the
 * process dies by signal.  Each case is announced before it runs so a trap names its case. */
#define RT_NO_MAIN
#include "../src/runtime/runtime.c"

static int failures = 0;

static void announce(const char *name) {
  fprintf(stderr, "  case %s\n", name);
  fflush(stderr);
}

static void expect_fixnum(const char *name, val got, intptr_t want) {
  if (tag_of(got) != TAG_FIXNUM) {
    fprintf(stderr, "  [FAIL] %s: result is not a fixnum\n", name);
    failures++;
  } else if (UNFIX(got) != want) {
    fprintf(stderr, "  [FAIL] %s: got %ld, want %ld\n", name, (long)UNFIX(got), (long)want);
    failures++;
  }
}

#define CHECK(name, expression, want) \
  do { announce(name); expect_fixnum(name, (expression), (want)); } while (0)

int main(void) {
  GC_INIT();
  const intptr_t min = FIXNUM_MIN, max = FIXNUM_MAX - 1;

  /* The tag itself: negative payloads, the range ends, and the round trip. */
  CHECK("FIX(-1)", FIX(-1), -1);
  CHECK("FIX(min)", FIX(min), min);
  CHECK("FIX(max)", FIX(max), max);
  CHECK("UNFIX(FIX(-123456789))", FIX(-123456789), -123456789);

  /* Every C arithmetic entry point that tags a result, with negative results. */
  CHECK("(- 0 1)", rt_sub(FIX(0), FIX(1)), -1);
  CHECK("(+ -5 2)", rt_add(FIX(-5), FIX(2)), -3);
  CHECK("(* -3 7)", rt_mul(FIX(-3), FIX(7)), -21);
  CHECK("(/ -12 4)", rt_div(FIX(-12), FIX(4)), -3);
  CHECK("(quotient -7 2)", rt_quotient(FIX(-7), FIX(2)), -3);
  CHECK("(remainder -7 2)", rt_remainder(FIX(-7), FIX(2)), -1);
  CHECK("(modulo 7 -2)", rt_modulo(FIX(7), FIX(-2)), -1);
  CHECK("(modulo -7 2)", rt_modulo(FIX(-7), FIX(2)), 1);
  CHECK("(exact -8.0)", rt_inexact_to_exact(rt_make_flonum(-8.0)), -8);

  /* Results exactly at the range boundaries, reached by arithmetic. */
  CHECK("(- (+ min 1) 1)", rt_sub(FIX(min + 1), FIX(1)), min);
  CHECK("(+ (- max 1) 1)", rt_add(FIX(max - 1), FIX(1)), max);
  CHECK("(* -2^30 2^30)", rt_mul(FIX(-((intptr_t)1 << 30)), FIX((intptr_t)1 << 30)), min);
  CHECK("(quotient min 1)", rt_quotient(FIX(min), FIX(1)), min);
  CHECK("(quotient min 2)", rt_quotient(FIX(min), FIX(2)), min / 2);
  CHECK("(exact min.0)", rt_inexact_to_exact(rt_make_flonum((double)min)), min);

  if (failures) {
    fprintf(stderr, "fixnum tagging: %d failure(s)\n", failures);
    return 1;
  }
  return 0;
}
