/* CC spike driver: times the three hot-loop candidates and checks the
 * candidate-2 variadic/apply feasibility.  spike_alloc is a wrapping bump
 * allocator (spike-only: it measures the store+bump memory traffic of the
 * arg-vector candidate without leaking/OOM at 100e6 iterations). */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>

extern int64_t run0(int64_t);
extern int64_t run2(int64_t);
extern int64_t run3(int64_t);
extern int64_t sumv(int64_t argc, int64_t a0, int64_t a1, int64_t *ov);

static char arena[128 * 1024 * 1024];
static size_t off = 0;
void *spike_alloc(int64_t nwords) {
  size_t need = (size_t)nwords * 8;
  if (off + need > sizeof(arena)) off = 0;   /* wrap; no free needed for spike */
  void *p = arena + off; off += need; return p;
}

static void bench(const char *name, int64_t (*f)(int64_t), int64_t n) {
  struct timespec a, b;
  clock_gettime(CLOCK_MONOTONIC, &a);
  int64_t r = f(n);
  clock_gettime(CLOCK_MONOTONIC, &b);
  double ns = (b.tv_sec - a.tv_sec) * 1e9 + (b.tv_nsec - a.tv_nsec);
  printf("  %-30s n=%lld  ->%lld  %6.3f ns/call  (%6.0f ms)\n",
         name, (long long)n, (long long)r, ns / (double)n, ns / 1e6);
}

int main(void) {
  int64_t N = 100000000;  /* 100e6: completes only if tail calls are guaranteed */
  printf("hot-loop overhead (bounded stack + ns per tail call):\n");
  bench("cand0 fixed max-arity",     run0, N);
  bench("cand2 argc+overflow spill", run2, N);
  bench("cand3 single arg-vector",   run3, N);

  printf("\ncandidate-2 variadic / apply feasibility:\n");
  int64_t r_rest = sumv(2, 10, 20, NULL);           /* rest empty */
  int64_t ov[3] = {3, 4, 5};
  int64_t r_apply = sumv(5, 1, 2, ov);              /* apply spreads 5 args: 2 + [3,4,5] */
  printf("  variadic rest  sumv(2; 10,20)        = %lld  (want 30)  %s\n",
         (long long)r_rest, r_rest == 30 ? "OK" : "FAIL");
  printf("  apply spread   sumv(5; 1,2,[3,4,5])  = %lld  (want 15)  %s\n",
         (long long)r_apply, r_apply == 15 ? "OK" : "FAIL");
  return (r_rest == 30 && r_apply == 15) ? 0 : 1;
}
