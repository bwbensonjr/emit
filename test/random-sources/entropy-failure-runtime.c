/* Test-only entropy failure backend; no application hook is installed. */
#include <stddef.h>
static size_t failing_entropy(unsigned char *buffer, size_t count);
#define EMIT_ENTROPY_READ failing_entropy
#include "../../src/runtime/runtime.c"
static size_t failing_entropy(unsigned char *buffer, size_t count) {
  /* A failed provider can have touched its temporary buffer. */
  memset(buffer, 0x5a, count);
  errno = EIO;
  return 0;
}
