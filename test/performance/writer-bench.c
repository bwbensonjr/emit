/* Runtime printer benchmark. This translation unit alone owns instrumentation. */
#include <gc/gc.h>
#include <inttypes.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static size_t bench_printer_count, bench_printer_bytes, bench_all_count;
#ifdef EMIT_BENCH_INSTRUMENT
static void *bench_malloc(size_t bytes, const char *caller) {
  bench_all_count++;
  if (!strncmp(caller, "print_", 6) || !strncmp(caller, "pl_", 3) ||
      !strcmp(caller, "writer_borrowed_port")) {
    bench_printer_count++;
    bench_printer_bytes += bytes;
  }
  return GC_malloc(bytes);
}
#undef GC_MALLOC
#define GC_MALLOC(bytes) bench_malloc((bytes), __func__)
#endif

#define RT_NO_MAIN
#ifndef EMIT_RUNTIME_SOURCE
#define EMIT_RUNTIME_SOURCE "../../src/runtime/runtime.c"
#endif
#include EMIT_RUNTIME_SOURCE

static void fail(const char *message) {
  fprintf(stderr, "writer-bench: %s\n", message);
  exit(2);
}

static val make_list(size_t n) {
  val result = NIL_V;
  while (n--) result = rt_cons(FIX(1), result);
  return result;
}

static val four(void) {
  return rt_cons(FIX(1), rt_cons(FIX(2), rt_cons(FIX(3), rt_cons(FIX(4), NIL_V))));
}

static void render(sink *out, val object, int display, enum print_policy policy,
                   val port) {
#ifdef EMIT_PRE_WRITER
  (void)port;
  print_val(out, object, display, policy);
#else
  print_val(out, object, display, policy, port);
#endif
}

#ifndef EMIT_PRE_WRITER
static val saved_token, saved_port;
static int callback_collect, callback_trap;
static val native_writer(val adapter, val object, val port, val mode, val token) {
  (void)adapter; (void)mode;
  saved_token = token;
  saved_port = port;
  sink *out = port_arg_sink(port);
  if (!out) fail("callback received invalid port");
  if (callback_collect) GC_gcollect();
  sink_putc(out, '<');
  rt_custom_write_recur(token, as_ptr(object)[3]);
  if (callback_trap) rt_fatal("writer benchmark intentional trap");
  sink_putc(out, '>');
  return UNSPEC_V;
}

static val port_prototype(void) {
  val fields = NIL_V;
  for (int i = 0; i < 6; i++) fields = rt_cons(FALSE_V, fields);
  val td = rt_make_record_type(rt_make_string("port", 4));
  return rt_make_record(td, fields);
}

static void install(val object) {
  val *closure = GC_MALLOC(sizeof(val));
  closure[0] = 0; /* Native bridge ignores this ordinary closure's code field. */
  rt_set_record_type_writer(native_writer, object, tag_ptr(closure, TAG_CLOSURE),
                            port_prototype());
}
#endif

static const char *workloads[] = {
  "atom-number", "atom-string", "opaque-record", "small-list", "small-vector",
  "large-list", "oversized-list", "small-after-large", "shared", "cycle",
#ifndef EMIT_PRE_WRITER
  "unrelated", "removed", "custom-flat", "custom-compound", "custom-nested",
  "custom-explicit", "custom-cycle",
#endif
  NULL
};

static val value_for(const char *name) {
  if (!strcmp(name, "atom-number")) return FIX(42);
  if (!strcmp(name, "atom-string")) return rt_make_string("hello", 5);
  if (!strcmp(name, "small-list") || !strcmp(name, "small-after-large")) return four();
  if (!strcmp(name, "small-vector")) {
    val vector = rt_make_vector(FIX(4), FALSE_V);
    for (int i = 0; i < 4; i++) rt_vector_set(vector, FIX(i), FIX(i + 1));
    return vector;
  }
  if (!strcmp(name, "large-list")) return make_list(1024);
  if (!strcmp(name, "oversized-list")) return make_list(4096);
  if (!strcmp(name, "shared")) {
    val pair = rt_cons(FIX(1), rt_cons(FIX(2), NIL_V));
    return rt_cons(pair, rt_cons(pair, NIL_V));
  }
  if (!strcmp(name, "cycle")) {
    val pair = rt_cons(FIX(1), NIL_V);
    as_ptr(pair)[1] = pair;
    return pair;
  }
  val td = rt_make_record_type(rt_make_string("sample", 6));
  val record = rt_make_record(td, rt_cons(FIX(42), NIL_V));
  if (!strcmp(name, "opaque-record")) return record;
#ifndef EMIT_PRE_WRITER
  install(record);
  if (!strcmp(name, "unrelated")) return four();
  if (!strcmp(name, "removed")) {
    rt_set_record_type_writer(native_writer, record, FALSE_V, port_prototype());
    return rt_cons(record, rt_cons(FIX(3), NIL_V));
  }
  if (!strcmp(name, "custom-compound")) as_ptr(record)[3] = four();
  if (!strcmp(name, "custom-cycle")) as_ptr(record)[3] = record;
  if (!strcmp(name, "custom-nested")) {
    for (int i = 1; i < 8; i++) record = rt_make_record(td, rt_cons(record, NIL_V));
  }
#endif
  return record;
}

static char *expected(const char *name, int display, enum print_policy policy) {
  const char *text = NULL;
  if (!strcmp(name, "atom-number")) text = "42";
  if (!strcmp(name, "atom-string")) text = display ? "hello" : "\"hello\"";
  if (!strcmp(name, "opaque-record")) text = "#<record sample>";
  if (!strcmp(name, "small-list") || !strcmp(name, "unrelated") ||
      !strcmp(name, "small-after-large")) text = "(1 2 3 4)";
  if (!strcmp(name, "small-vector")) text = "#(1 2 3 4)";
  if (!strcmp(name, "removed")) text = "(#<record sample> 3)";
  if (!strcmp(name, "shared"))
    text = policy == PRINT_SHARED ? "(#0=(1 2) #0#)" : "((1 2) (1 2))";
  if (!strcmp(name, "cycle")) text = "#0=(1 . #0#)";
  if (!strcmp(name, "custom-flat") || !strcmp(name, "custom-explicit")) text = "<42>";
  if (!strcmp(name, "custom-compound")) text = "<(1 2 3 4)>";
  if (!strcmp(name, "custom-nested")) text = "<<<<<<<<42>>>>>>>>";
  if (!strcmp(name, "custom-cycle")) text = "<#<cycle sample>>";
  if (text) return strdup(text);
  size_t n = !strcmp(name, "large-list") ? 1024 : 4096;
  char *out = malloc(2 * n + 2);
  if (!out) fail("out of memory creating output oracle");
  out[0] = '(';
  for (size_t i = 0; i < n; i++) {
    out[2 * i + 1] = '1';
    out[2 * i + 2] = i + 1 == n ? ')' : ' ';
  }
  out[2 * n + 1] = 0;
  return out;
}

static uint64_t digest(const char *bytes, size_t n) {
  uint64_t hash = UINT64_C(14695981039346656037);
  for (size_t i = 0; i < n; i++) {
    hash ^= (unsigned char)bytes[i];
    hash *= UINT64_C(1099511628211);
  }
  return hash;
}

static double seconds(clockid_t clock_id) {
  struct timespec now;
  if (clock_gettime(clock_id, &now)) fail("clock_gettime failed");
  return now.tv_sec + now.tv_nsec / 1e9;
}

#ifdef EMIT_EXPECT_REUSE
static void check_inactive(void) {
  if (pl_current || rt_print_depth || rt_active_writer) fail("active state survived printing");
  if (pl_outer.cap > PL_RETAIN_SLOTS || pl_outer.out || pl_outer.port != FALSE_V ||
      pl_outer.previous || pl_outer.writer_mark || pl_outer.used)
    fail("inactive outer context retained references or exceeded its capacity bound");
  for (size_t i = 0; i < pl_outer.cap; i++)
    if (pl_outer.tab[i].key) fail("inactive graph table retained a value");
  for (size_t i = 0; i < PL_STATIC_SLOTS; i++)
    if (pl_outer_tab[i].key) fail("static graph table retained a value after growth");
}

static void resource_checks(void) {
#ifndef EMIT_BENCH_INSTRUMENT
  fail("resource checks require EMIT_BENCH_INSTRUMENT");
#else
  FILE *file = fopen("/dev/null", "w");
  if (!file) fail("cannot open null sink");
  sink out = { .f = file };
  render(&out, four(), 0, PRINT_ORDINARY, FALSE_V);
  const char *ordinary[] = { "atom-number", "atom-string", "opaque-record",
    "small-list", "small-vector", "large-list", "unrelated", "removed", NULL };
  for (int k = 0; ordinary[k]; k++) {
    val object = value_for(ordinary[k]);
    for (int mode = 0; mode < 4; mode++) {
      enum print_policy policy = mode == 2 ? PRINT_SIMPLE : mode == 3 ? PRINT_SHARED : PRINT_ORDINARY;
      render(&out, object, mode == 1, policy, FALSE_V);
      size_t before = bench_printer_count, all_before = bench_all_count;
      GC_word collector_before = GC_get_total_bytes();
      for (int i = 0; i < 20; i++) render(&out, object, mode == 1, policy, FALSE_V);
      if (bench_printer_count != before || bench_all_count != all_before ||
          GC_get_total_bytes() != collector_before)
        fail("warmed ordinary traversal allocated");
      check_inactive();
    }
  }
  val oversized = make_list(4096);
  size_t positive_before = bench_printer_count;
  render(&out, oversized, 0, PRINT_ORDINARY, FALSE_V);
  if (bench_printer_count == positive_before) fail("allocation instrumentation missed oversized growth");
  check_inactive();
  pl_outer.gen = UINT_MAX;
  render(&out, four(), 0, PRINT_ORDINARY, FALSE_V);
  check_inactive();
  val record = value_for("custom-compound");
  as_ptr(record)[3] = make_list(512);
  callback_collect = 1;
  render(&out, record, 0, PRINT_ORDINARY, FALSE_V);
  callback_collect = 0;
  check_inactive();
  writer_context *retired = (writer_context *)as_ptr(saved_token);
  if (retired->active || retired->out || retired->object != FALSE_V ||
      retired->port != FALSE_V || retired->previous)
    fail("returned token retained live state");
  jmp_buf trap;
  intptr_t mark = rt_guard_checkpoint();
  rt_trap = &trap;
  callback_trap = 1;
  if (setjmp(trap) == 0) {
    render(&out, record, 0, PRINT_ORDINARY, FALSE_V);
    fail("callback trap was not delivered");
  }
  rt_guard_restore(mark);
  rt_trap = NULL;
  callback_trap = 0;
  retired = (writer_context *)as_ptr(saved_token);
  if (retired->active || retired->out || retired->object != FALSE_V ||
      retired->port != FALSE_V || retired->previous)
    fail("unwound token retained live state");
  check_inactive();
  render(&out, four(), 0, PRINT_ORDINARY, FALSE_V);
  check_inactive();
  fclose(file);
  puts("{\"resource_checks\":\"passed\"}");
#endif
}
#endif

int main(int argc, char **argv) {
  const char *name = "small-list", *mode = "ordinary", *destination = "file";
  size_t iterations = 10000;
  int verify_only = 0;
  GC_INIT();
  for (int i = 1; i < argc; i++) {
    if (!strcmp(argv[i], "--list")) {
      for (int k = 0; workloads[k]; k++) puts(workloads[k]);
      return 0;
    }
#ifdef EMIT_EXPECT_REUSE
    if (!strcmp(argv[i], "--resource-check")) { resource_checks(); return 0; }
#endif
    if (!strcmp(argv[i], "--verify")) { verify_only = 1; continue; }
    if (i + 1 >= argc) fail("option requires a value");
    if (!strcmp(argv[i], "--workload")) name = argv[++i];
    else if (!strcmp(argv[i], "--mode")) mode = argv[++i];
    else if (!strcmp(argv[i], "--sink")) destination = argv[++i];
    else if (!strcmp(argv[i], "--iterations")) {
      char *end;
      unsigned long long n = strtoull(argv[++i], &end, 10);
      if (*end || !n || n > SIZE_MAX || argv[i][0] == '-') fail("invalid iteration count");
      iterations = (size_t)n;
    } else fail("unknown option");
  }
  int found = 0;
  for (int k = 0; workloads[k]; k++) if (!strcmp(workloads[k], name)) found = 1;
  if (!found) fail("unknown workload");
  int display = !strcmp(mode, "display");
  enum print_policy policy = !strcmp(mode, "simple") ? PRINT_SIMPLE :
    !strcmp(mode, "shared") ? PRINT_SHARED : PRINT_ORDINARY;
  if (strcmp(mode, "ordinary") && strcmp(mode, "display") && strcmp(mode, "simple") &&
      strcmp(mode, "shared")) fail("unknown mode");
  if (!strcmp(name, "cycle") && policy == PRINT_SIMPLE) fail("simple writing of a cycle is intentionally excluded");
  if (strcmp(destination, "file") && strcmp(destination, "string")) fail("unknown sink");
  if (verify_only) iterations = 1;

  val object = value_for(name);
  sink memory = {0};
  sink *out = &memory;
  val port = FALSE_V;
#ifndef EMIT_PRE_WRITER
  if (!strcmp(name, "custom-explicit")) {
    val handle = rt_port_open_output_string();
    port = port_prototype();
    as_ptr(port)[3] = handle;
    out = port_sink(UNFIX(handle));
  }
#endif
  render(out, object, display, policy, port);
  char *oracle = expected(name, display, policy);
  size_t output_bytes = strlen(oracle);
  if (out->len != output_bytes || memcmp(out->buf, oracle, output_bytes))
    fail("rendered bytes differ from independent oracle");
  uint64_t output_digest = digest(out->buf, out->len);
  free(oracle);
  FILE *file = !strcmp(destination, "file") ? fopen("/dev/null", "w") : NULL;
  if (!strcmp(destination, "file") && !file) fail("cannot open null sink");
  out->f = file;
  if (!strcmp(name, "small-after-large")) render(out, make_list(1024), 0, PRINT_ORDINARY, port);
  for (int i = 0; i < 8; i++) {
    if (!file) out->len = 0;
    render(out, object, display, policy, port);
  }
  size_t before_count = bench_printer_count, before_bytes = bench_printer_bytes;
  GC_word gc_bytes = GC_get_total_bytes();
  GC_word collections = GC_get_gc_no();
  double wall_start = seconds(CLOCK_MONOTONIC), cpu_start = seconds(CLOCK_PROCESS_CPUTIME_ID);
  for (size_t i = 0; i < iterations; i++) {
    if (!file) out->len = 0;
    render(out, object, display, policy, port);
  }
  double cpu = seconds(CLOCK_PROCESS_CPUTIME_ID) - cpu_start;
  double wall = seconds(CLOCK_MONOTONIC) - wall_start;
  if (file) fclose(file);
  else if (out->len != output_bytes || digest(out->buf, out->len) != output_digest)
    fail("timed string sink output differs from oracle");
  printf("{\"workload\":\"%s\",\"mode\":\"%s\",\"iterations\":%zu,"
         "\"sink\":\"%s\",\"output_bytes\":%zu,\"output_digest\":\"%016" PRIx64 "\","
         "\"cpu_seconds\":%.9f,\"wall_seconds\":%.9f,"
         "\"collector_allocated_bytes\":%lu,\"collector_collections\":%lu,",
         name, mode, iterations, destination, output_bytes, output_digest, cpu, wall,
         (unsigned long)(GC_get_total_bytes() - gc_bytes),
         (unsigned long)(GC_get_gc_no() - collections));
#ifdef EMIT_BENCH_INSTRUMENT
  printf("\"printer_allocations\":%zu,\"printer_allocated_bytes\":%zu,\"instrumented\":true}\n",
         bench_printer_count - before_count, bench_printer_bytes - before_bytes);
#else
  (void)before_count; (void)before_bytes;
  printf("\"printer_allocations\":null,\"printer_allocated_bytes\":null,\"instrumented\":false}\n");
#endif
  return 0;
}
