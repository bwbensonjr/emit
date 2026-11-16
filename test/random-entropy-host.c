/* Controlled tests of the private entropy edge; no test hook ships as API. */
#include <stddef.h>
static size_t entropy_fixture(unsigned char *buffer, size_t count);
#define EMIT_ENTROPY_READ entropy_fixture
#define RT_NO_MAIN
#include "../src/runtime/runtime.c"
#include <assert.h>

static int fixture_mode;
static int fixture_calls;
static size_t entropy_fixture(unsigned char *buffer, size_t count) {
  fixture_calls++;
  memset(buffer, 0x5a, count);
  if (fixture_mode == 1) {
    errno = EIO;
    return 0;
  }
  if (fixture_mode == 2) {
    errno = EINTR;
    return 0;
  }
  if (fixture_mode == 3) return count - 1;
  return count;
}

int main(void) {
  GC_INIT();
  assert(rt_random_entropy(FIX(0)) == FALSE_V);
  assert(rt_random_entropy(-FIX(1)) == FALSE_V);
  assert(rt_random_entropy(FIX(257)) == FALSE_V);
  assert(fixture_calls == 0);
  val first = rt_random_entropy(FIX(24));
  val second = rt_random_entropy(FIX(256));
  assert(is_bytevector(first) && bv_len(first) == 24);
  assert(is_bytevector(second) && bv_len(second) == 256);
  assert(first != second);
  for (int i = 0; i < 24; i++) assert(bv_bytes(first)[i] == 0x5a);
  fixture_mode = 1;
  assert(rt_random_entropy(FIX(24)) == FALSE_V);
  assert(bv_bytes(first)[0] == 0x5a);
  fixture_mode = 2;
  fixture_calls = 0;
  assert(rt_random_entropy(FIX(1)) == FALSE_V);
  assert(fixture_calls == 1);
  fixture_mode = 3;
  assert(rt_random_entropy(FIX(24)) == FALSE_V);
  fixture_mode = 0;
  val recovered = rt_random_entropy(FIX(1));
  assert(is_bytevector(recovered) && bv_len(recovered) == 1);
  puts("entropy host: 8 checks passed");
  return 0;
}
