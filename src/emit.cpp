// emit.cpp -- the unified `emit` front-end (change: emit-cli-unification).
//
// One compiled binary, the sole user-facing entry point, dispatching on its first
// argument (the VERB) to the four compiler doors:
//
//   emit run  [FILE] [--manifest F] [--no-prelude]   in-process compile-and-run
//   emit repl [--manifest F] [--no-prelude]          persistent interactive REPL
//   emit build [NAME] [--manifest F] [-o OUT] [--no-prelude]   deliver a native exe
//   emit lib  SRC  [-o DIR] [--manifest F]           compile one library -> artifact
//
// The run door (was build/scheme-run, src/run.cpp) and the REPL door (was
// build/repl-host, src/repl/host.cpp) link byte-for-byte the SAME embedded compiler
// IR (bootstrap/embed-repl.ll + bootstrap/scheme.base.ll) and drive it through the
// runtime's REPL channel (rt_repl_set / scheme_entry); they differ only in their
// former `main`.  This file merges both -- plus the AOT `build` door (was
// bin/scheme-compile / bin/emit) and the new compile-unit `lib` door -- into one
// dispatch layer over one shared compiler core (design D1).
//
// `build`/`lib` emit IR in-process (the same modes the run door uses) and then fork
// `clang` to link a native executable (`build`) or just write the unit artifact
// (`lib`).  The C toolchain (CC / GC_INC / GC_LIB) is read from the environment; if
// absent, it is discovered by consulting tools/llvm-env.sh --print-env (found
// relative to this binary), so discovery stays single-sourced (design D2, task 2.2).

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/ExecutionUtils.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/Error.h"

#include <cstdint>
#include <csetjmp>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <sstream>
#include <iostream>
#include <string>
#include <vector>
#include <memory>

#include <unistd.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <limits.h>

#include <gc/gc.h>

using namespace llvm;
using namespace llvm::orc;

extern "C" {
  // The embedded compiler's dispatched entry (defined by the linked-in
  // bootstrap/embed-repl.ll).  Called via this link-time symbol -- always the
  // compiler, never a JIT'd module of the same name.
  intptr_t scheme_entry(void);

  // Runtime REPL channel + value accessors (src/runtime/runtime.c).
  void rt_repl_set(intptr_t mode, const char *bytes, intptr_t len);
  intptr_t rt_fixnum_value(intptr_t v);
  intptr_t rt_car(intptr_t v);
  intptr_t rt_cdr(intptr_t v);
  intptr_t rt_symbol_to_string(intptr_t v);
  intptr_t rt_string_len(intptr_t v);
  const char *rt_string_bytes(intptr_t v);

  void rt_write(intptr_t v);                 // runtime value printer
  extern jmp_buf *rt_trap;                    // runtime trap escape hook
  extern char rt_trap_msg[];                  // last trap's message
  void rt_guard_reset(void);                  // clear guard frames after a trap
}

typedef intptr_t (*entry_t)(void);

// Per-process JIT (one verb runs per invocation, so the run and REPL doors never
// contend for it).
static std::unique_ptr<LLJIT> JIT;

// The absolute path of this binary's argv[0], captured in main.  Used to locate the
// repo's toolchain script + runtime source for the build/lib doors.
static std::string g_argv0;

// The boundary marker the compiler joins separate modules with (src/core.ss
// *emit-unit-boundary*); --emit re-uses it to delimit the units it writes.
static const std::string kBoundary = "; ==EMIT-UNIT-BOUNDARY==\n";

// --- shared narration (docs/OUTPUT.md convention; mirrors tools/log.sh) --------
// Narration to stderr, controllable via EMIT_VERBOSITY (quiet|q|0 silences it,
// verbose|v|2 shows detail).  stdout stays reserved for machine data.
static int g_level = 1;
static void init_verbosity() {
  const char *v = std::getenv("EMIT_VERBOSITY");
  std::string s = v ? v : "";
  if (s == "quiet" || s == "q" || s == "0") g_level = 0;
  else if (s == "verbose" || s == "v" || s == "2") g_level = 2;
  else g_level = 1;
}
static void say(const std::string &m)  { if (g_level >= 1) std::cerr << m << "\n"; }
static void vsay(const std::string &m) { if (g_level >= 2) std::cerr << m << "\n"; }
static long file_bytes(const std::string &p) {
  struct stat st;
  return stat(p.c_str(), &st) == 0 ? (long)st.st_size : -1;
}

// --- shared value/IO helpers ---------------------------------------------------
// Copy a scheme string value's bytes into a std::string.
static std::string scm_str(intptr_t v) {
  return std::string(rt_string_bytes(v), (size_t)rt_string_len(v));
}
// The name of a (status . payload) result's status symbol.
static std::string status_of(intptr_t r) {
  return scm_str(rt_symbol_to_string(rt_car(r)));
}
static std::string read_file(const std::string &path) {
  std::ifstream f(path, std::ios::binary);
  std::ostringstream ss;
  ss << f.rdbuf();
  return ss.str();
}
static bool write_file(const std::string &path, const std::string &data) {
  std::ofstream f(path, std::ios::binary | std::ios::trunc);
  if (!f) return false;
  f.write(data.data(), (std::streamsize)data.size());
  return (bool)f;
}

// Parse IR text and add it to the JIT.  On failure, fill `err` and return false.
static bool add_ir(const std::string &ir, const char *name, std::string &err) {
  auto ctx = std::make_unique<LLVMContext>();
  SMDiagnostic diag;
  auto buf = MemoryBuffer::getMemBuffer(ir, name);
  std::unique_ptr<Module> mod = parseIR(buf->getMemBufferRef(), diag, *ctx);
  if (!mod) {
    raw_string_ostream os(err);
    diag.print(name, os);
    return false;
  }
  mod->setDataLayout(JIT->getDataLayout());
  if (Error e = JIT->addIRModule(ThreadSafeModule(std::move(mod), std::move(ctx)))) {
    err = toString(std::move(e));
    return false;
  }
  return true;
}

// Repo root, derived from this binary's path (build/emit -> repo root): strip the
// trailing "/emit" and "/build".  Used only to locate tools/llvm-env.sh and the
// runtime source for the build/lib doors (user/manifest paths stay relative to the
// caller's CWD).  Falls back to "." when the path has no directory components.
static std::string repo_root() {
  char buf[PATH_MAX];
  std::string p = g_argv0;
  if (realpath(g_argv0.c_str(), buf)) p = buf;
  auto s1 = p.find_last_of('/');
  if (s1 == std::string::npos) return ".";
  std::string dir = p.substr(0, s1);              // .../build
  auto s2 = dir.find_last_of('/');
  if (s2 == std::string::npos) return ".";
  return dir.substr(0, s2);                       // repo root
}

// ===========================================================================
// run door -- in-process compile-and-run (was src/run.cpp).
// ===========================================================================

// Preload every user library named in the manifest into `modules` (change:
// run-door-user-libraries).  The compiler owns resolution (modes 9 + 4); this only
// COLLECTS each unit's IR -- it does NOT run __init (the program's @scheme_entry
// does).  A library resolves against already-loaded units, so we iterate to a
// fixpoint (topological order regardless of manifest order).  Returns false on a
// hard error.
static bool preload_user_libraries(const std::string &manifest, std::vector<std::string> &modules) {
  std::ifstream probe(manifest);
  if (!probe.good()) return true;            // no manifest: no user libraries

  std::string mtext = read_file(manifest);
  rt_repl_set(9, mtext.data(), (intptr_t)mtext.size());  // manifest paths sans (scheme base)
  std::string paths = scm_str(scheme_entry());

  std::vector<std::string> pending;
  std::istringstream lines(paths);
  std::string path;
  while (std::getline(lines, path))
    if (!path.empty()) pending.push_back(path);

  while (!pending.empty()) {
    std::vector<std::string> deferred;
    bool progress = false;
    for (const std::string &p : pending) {
      std::string src = read_file(p);
      rt_repl_set(4, src.data(), (intptr_t)src.size());
      intptr_t r = scheme_entry();
      std::string st = status_of(r);
      if (st == "deferred") { deferred.push_back(p); continue; }
      if (st == "already") { progress = true; continue; }  // e.g. baked (scheme base): no module
      if (st != "ok") {
        std::cerr << "emit run: loading library " << p << ": " << scm_str(rt_cdr(r)) << "\n";
        return false;
      }
      modules.push_back(scm_str(rt_car(rt_cdr(r))));   // collect IR; do NOT run __init
      progress = true;
    }
    if (!progress) {                         // every remaining unit is stuck
      for (const std::string &p : deferred)
        std::cerr << "emit run: library " << p
                  << ": unresolved or cyclic import (dependency missing from manifest?)\n";
      return false;
    }
    pending.swap(deferred);
  }
  return true;
}

// Resolve a manifest (program NAME (source S) [(output O)]) entry to its source and
// output.  Chez-free: the embedded compiler owns the manifest grammar (mode 10);
// this selects one program by name (empty NAME => the sole entry).  Returns 0 on
// success (filling src/out; out empty when the entry has no (output ...)), non-zero
// on error (message already printed).  Requires an initialized session (mode 0).
static int resolve_program(const std::string &manifest, const std::string &name,
                           std::string &src, std::string &out) {
  std::ifstream probe(manifest);
  std::string mtext = probe.good() ? read_file(manifest) : std::string();
  rt_repl_set(10, mtext.data(), (intptr_t)mtext.size());
  std::string triples = scm_str(scheme_entry());
  std::vector<std::vector<std::string>> progs;
  std::istringstream ls(triples);
  std::string n, s, o;
  while (std::getline(ls, n) && std::getline(ls, s) && std::getline(ls, o))
    progs.push_back({n, s, o});
  if (progs.empty()) {
    std::cerr << "emit: no program entry in manifest " << manifest << "\n";
    return 1;
  }
  const std::vector<std::string> *pick = nullptr;
  if (!name.empty()) {
    for (const auto &p : progs)
      if (p[0] == name) { pick = &p; break; }
    if (!pick) {
      std::cerr << "emit: no program entry named " << name << " in " << manifest << "\n";
      return 1;
    }
  } else if (progs.size() == 1) {
    pick = &progs[0];
  } else {
    std::cerr << "emit: multiple program entries; name one of:";
    for (const auto &p : progs) std::cerr << " " << p[0];
    std::cerr << "\n";
    return 1;
  }
  src = (*pick)[1];
  out = (*pick)[2];
  return 0;
}

// Compile a whole program (or a lone define-library) to its unit modules + program
// IR, in-process -- the shared front half of `emit run`, `emit run --emit`, and
// `emit build` (spec: no second compilation path).  Seeds the session, registers the
// baked (scheme base), preloads the manifest's user libraries, then compiles the
// program (mode 7).  On success fills `modules` (in emit order) and `prog_ir` and
// returns true; `is_library` is set when the source was a lone define-library (then
// `modules` is empty and `prog_ir` is that single unit).  GC must be initialized and
// EMIT_NO_PRELUDE set by the caller before this runs.
static bool compile_program(const std::string &prog_src, const std::string &manifest,
                            bool no_prelude, std::vector<std::string> &modules,
                            std::string &prog_ir, bool &is_library) {
  rt_repl_set(no_prelude ? 0 : 1, "", 0);    // init-session
  scheme_entry();
  modules.clear();

  if (!no_prelude) {
    rt_repl_set(8, "", 0);                    // register baked (scheme base)
    intptr_t r = scheme_entry();
    if (status_of(r) != "ok") {
      std::cerr << "emit: (scheme base): " << scm_str(rt_cdr(r)) << "\n";
      return false;
    }
    modules.push_back(scm_str(rt_car(rt_cdr(r))));
  }

  if (!preload_user_libraries(manifest, modules)) return false;

  rt_repl_set(7, prog_src.data(), (intptr_t)prog_src.size());   // compile program
  intptr_t pr = scheme_entry();
  std::string pst = status_of(pr);
  if (pst != "ok" && pst != "library") {
    std::cerr << "emit: " << scm_str(rt_cdr(pr)) << "\n";
    return false;
  }
  prog_ir = scm_str(rt_car(rt_cdr(pr)));
  is_library = (pst == "library");
  // A lone define-library compiles to a single unit with no baked (scheme base) and
  // no program entry: drop the base/units set up for the program case.
  if (is_library) modules.clear();
  return true;
}

static int emit_run(int argc, char **argv) {
  bool emit = false;
  bool no_prelude = false;
  bool resolve = false;                        // --resolve-program: print an entry, no run
  std::string resolve_name;                    // "" => select the sole program entry
  std::string manifest;
  std::string prog_file;                       // positional FILE (else stdin)
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (a == "--emit") emit = true;
    else if (a == "--no-prelude") no_prelude = true;
    else if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
    else if (a == "--resolve-program") {
      resolve = true;
      if (i + 1 < argc && argv[i + 1][0] != '-') resolve_name = argv[++i];
    }
    else if (!a.empty() && a[0] != '-') prog_file = a;   // program source FILE
    else { std::cerr << "emit run: unknown option " << a << "\n"; return 2; }
  }
  // Manifest resolution: --manifest flag wins, then EMIT_MANIFEST, then the default.
  if (manifest.empty()) {
    const char *mp = std::getenv("EMIT_MANIFEST");
    manifest = mp ? std::string(mp) : std::string("emit-libs.scm");
  }

  // --resolve-program NAME: resolve a manifest program entry and print its source +
  // output (source line, then output line).  Chez-free; never reads stdin or runs.
  if (resolve) {
    GC_INIT();
    rt_repl_set(0, "", 0);                     // init-session (no prelude needed)
    scheme_entry();
    std::string src, out;
    if (resolve_program(manifest, resolve_name, src, out)) return 1;
    std::cout << src << "\n" << out << "\n";
    return 0;
  }

  // Forward --no-prelude to the embedded compiler (read via %no-prelude?): skip
  // baking/implying (scheme base).  Must be set before any scheme_entry() call.
  if (no_prelude) setenv("EMIT_NO_PRELUDE", "1", 1);

  // Program source: FILE when given, otherwise stdin (spec: emit run [FILE]).
  std::string prog_src;
  if (!prog_file.empty()) {
    prog_src = read_file(prog_file);
  } else {
    std::ostringstream ss;
    ss << std::cin.rdbuf();
    prog_src = ss.str();
  }

  GC_INIT();                                 // once, before the compiler allocates

  std::vector<std::string> modules;
  std::string prog_ir;
  bool is_library = false;
  if (!compile_program(prog_src, manifest, no_prelude, modules, prog_ir, is_library))
    return 1;

  // --emit: write every module (units then program), joined by the boundary marker,
  // to stdout and stop -- no JIT.  The IR is byte-for-byte what the JIT path runs.
  if (emit) {
    for (const std::string &m : modules) {
      std::fwrite(m.data(), 1, m.size(), stdout);
      std::fwrite(kBoundary.data(), 1, kBoundary.size(), stdout);
    }
    std::fwrite(prog_ir.data(), 1, prog_ir.size(), stdout);
    std::fflush(stdout);
    return 0;
  }

  // Stand up the JIT and resolve rt_* / GC symbols from this process (-rdynamic).
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();
  InitializeNativeTargetAsmParser();

  auto jitOr = LLJITBuilder().create();
  if (!jitOr) {
    std::cerr << "emit run: fatal: failed to create LLJIT: " << toString(jitOr.takeError()) << "\n";
    return 1;
  }
  JIT = std::move(*jitOr);

  auto gen = DynamicLibrarySearchGenerator::GetForCurrentProcess(
      JIT->getDataLayout().getGlobalPrefix());
  if (!gen) {
    std::cerr << "emit run: fatal: generator error: " << toString(gen.takeError()) << "\n";
    return 1;
  }
  JIT->getMainJITDylib().addGenerator(std::move(*gen));

  // Add every unit module (baked (scheme base) + preloaded user units), then the
  // program.  Add order is irrelevant -- the program's @scheme_entry drives __init
  // in topological order; its JITDylib definition shadows the linked-in compiler's.
  std::string err;
  for (size_t i = 0; i < modules.size(); i++)
    if (!add_ir(modules[i], "<unit>", err)) { std::cerr << "emit run: " << err << "\n"; return 1; }
  if (!add_ir(prog_ir, "<program>", err)) { std::cerr << "emit run: " << err << "\n"; return 1; }

  Expected<ExecutorAddr> sym = JIT->lookup("scheme_entry");
  if (!sym) {
    std::cerr << "emit run: lookup error: " << toString(sym.takeError()) << "\n";
    return 1;
  }
  entry_t fn = sym->toPtr<entry_t>();

  // Run the program.  A runtime trap longjmps back here so we report it rather than
  // crashing; conservative GC needs no unwinding.
  jmp_buf jb;
  rt_trap = &jb;
  if (setjmp(jb) == 0) {
    intptr_t r = fn();
    rt_write(r);
    std::printf("\n");
    std::fflush(stdout);
  } else {
    rt_guard_reset();   // a trap may have bypassed rt_run_guarded's frame pop
    std::cerr << "emit run: trap: " << rt_trap_msg << "\n";
    rt_trap = nullptr;
    return 1;
  }
  rt_trap = nullptr;
  return 0;
}

// ===========================================================================
// REPL door -- persistent ORC/LLJIT interactive host (was src/repl/host.cpp).
// ===========================================================================

typedef intptr_t (*thunk_t)(void);

// Look up an entry thunk by name, run it under trap isolation, and print the value
// (stdout) or "!trap: <msg>" (stdout).  A runtime trap longjmps back here so the
// session survives; conservative GC needs no unwinding of the JIT'd frames.
static void run_thunk(const std::string &name) {
  Expected<ExecutorAddr> sym = JIT->lookup(name);
  if (!sym) {
    std::cout << "!lookup error: " << toString(sym.takeError()) << "\n" << std::flush;
    return;
  }
  thunk_t fn = sym->toPtr<thunk_t>();
  jmp_buf jb;
  rt_trap = &jb;
  if (setjmp(jb) == 0) {
    intptr_t r = fn();
    rt_write(r);
    std::printf("\n");
    std::fflush(stdout);
  } else {
    rt_guard_reset();
    std::cout << "!trap: " << rt_trap_msg << "\n" << std::flush;
  }
  rt_trap = nullptr;
}

// Run a named entry thunk once for effect (no value print), under trap isolation.
// Used for the one-shot library @"L:__init" populators.
static bool run_init(const std::string &name) {
  Expected<ExecutorAddr> sym = JIT->lookup(name);
  if (!sym) {
    std::cerr << "error: library init lookup: " << toString(sym.takeError()) << "\n";
    return false;
  }
  thunk_t fn = sym->toPtr<thunk_t>();
  jmp_buf jb;
  rt_trap = &jb;
  bool ok = true;
  if (setjmp(jb) == 0) { fn(); }
  else { rt_guard_reset(); std::cerr << "error: library init trap: " << rt_trap_msg << "\n"; ok = false; }
  rt_trap = nullptr;
  return ok;
}

// Preload every library named in the manifest into the shared JITDylib (change:
// module-artifacts-vertical-slice; transitive imports: module-generalize).  Mode 5
// turns the manifest text into source paths; mode 4 compiles each unit and returns
// (ok . (ir . init-symbol)).  Iterated to a fixpoint (topological load order).
static void preload_libraries() {
  const char *mp = std::getenv("EMIT_MANIFEST");
  std::string manifest = mp ? std::string(mp) : std::string("emit-libs.scm");
  std::ifstream probe(manifest);
  if (!probe.good()) return;                 // no manifest: no libraries this session
  std::string mtext = read_file(manifest);

  rt_repl_set(5, mtext.data(), (intptr_t)mtext.size());
  std::string paths = scm_str(scheme_entry());

  std::vector<std::string> pending;
  std::istringstream lines(paths);
  std::string path;
  while (std::getline(lines, path))
    if (!path.empty()) pending.push_back(path);

  while (!pending.empty()) {
    std::vector<std::string> deferred;
    bool progress = false;
    for (const std::string &p : pending) {
      std::string src = read_file(p);
      rt_repl_set(4, src.data(), (intptr_t)src.size());
      intptr_t r = scheme_entry();
      std::string st = status_of(r);
      if (st == "deferred") { deferred.push_back(p); continue; }
      if (st != "ok") {
        std::cerr << "error: loading library " << p << ": " << scm_str(rt_cdr(r)) << "\n";
        progress = true;                     // drop it; do not retry a hard error
        continue;
      }
      intptr_t payload = rt_cdr(r);          // (ir . init-symbol)
      std::string ir = scm_str(rt_car(payload));
      std::string init = scm_str(rt_cdr(payload));
      std::string err;
      if (!add_ir(ir, "<repl>", err)) { std::cerr << "error: library add " << p << ": " << err << "\n"; }
      else run_init(init);
      progress = true;
    }
    if (!progress) {                         // every remaining unit is stuck
      for (const std::string &p : deferred)
        std::cerr << "error: library " << p
                  << ": unresolved or cyclic import (dependency missing from manifest?)\n";
      break;
    }
    pending.swap(deferred);
  }
}

// Compile one complete form's text via the embedded compiler and act on the
// (status . payload) it returns.
static void process_form(const std::string &form) {
  rt_repl_set(3, form.data(), (intptr_t)form.size());
  intptr_t r = scheme_entry();
  std::string st = status_of(r);
  if (st == "ok") {
    intptr_t payload = rt_cdr(r);           // (ir-text . entry-name)
    std::string ir = scm_str(rt_car(payload));
    std::string name = scm_str(rt_cdr(payload));
    std::string err;
    if (!add_ir(ir, "<repl>", err)) { std::cerr << "error: " << err << "\n"; return; }
    run_thunk(name);                        // entry-name handshake: run what the compiler chose
  } else if (st == "syntax") {
    std::cerr << ";; syntax " << scm_str(rt_cdr(r)) << "\n";
  } else if (st == "import") {              // (import (L)): exports merged; no module
    // nothing to JIT -- the unit was preloaded; the session scope now sees it.
  } else {                                  // "error": compile-time; session continues
    std::cerr << "error: " << scm_str(rt_cdr(r)) << "\n";
  }
}

static int emit_repl(int argc, char **argv) {
  bool prelude = true;
  std::string manifest;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (a == "--no-prelude") prelude = false;
    else if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
  }
  // A --manifest flag feeds preload_libraries (which reads EMIT_MANIFEST); set it so
  // the flag and the env agree (parity with `emit run --manifest`).
  if (!manifest.empty()) setenv("EMIT_MANIFEST", manifest.c_str(), 1);

  GC_INIT();                                // once for the whole session
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();
  InitializeNativeTargetAsmParser();

  auto jitOr = LLJITBuilder().create();
  if (!jitOr) {
    std::cerr << "fatal: failed to create LLJIT: " << toString(jitOr.takeError()) << "\n";
    return 1;
  }
  JIT = std::move(*jitOr);

  auto gen = DynamicLibrarySearchGenerator::GetForCurrentProcess(
      JIT->getDataLayout().getGlobalPrefix());
  if (!gen) {
    std::cerr << "fatal: generator error: " << toString(gen.takeError()) << "\n";
    return 1;
  }
  JIT->getMainJITDylib().addGenerator(std::move(*gen));

  // Initialize the session.  init-session returns the prelude as ONE batch module
  // (entry @__repl_prelude, distinct from the compiler's @scheme_entry); add it and
  // run that thunk once to populate the prelude's global slots.  --no-prelude skips.
  rt_repl_set(prelude ? 1 : 0, "", 0);
  std::string prelude_ir = scm_str(scheme_entry());
  if (!prelude_ir.empty()) {
    std::string err;
    if (!add_ir(prelude_ir, "<repl>", err)) {
      std::cerr << "fatal: prelude add: " << err << "\n";
      return 1;
    }
    Expected<ExecutorAddr> sym = JIT->lookup("__repl_prelude");
    if (!sym) {
      std::cerr << "fatal: prelude entry: " << toString(sym.takeError()) << "\n";
      return 1;
    }
    thunk_t fn = sym->toPtr<thunk_t>();
    jmp_buf jb;
    rt_trap = &jb;
    if (setjmp(jb) == 0) {
      fn();
    } else {
      rt_guard_reset();
      std::cerr << "fatal: prelude trap: " << rt_trap_msg << "\n";
      return 1;
    }
    rt_trap = nullptr;
  }

  // Preload manifest libraries so interactive (import (L)) forms can resolve them.
  preload_libraries();

  // The prelude's procedures live in the now-preloaded (scheme base) library;
  // auto-import it into the session scope (mode 6) so later forms resolve prelude
  // names to it -- unless --no-prelude.
  if (prelude) {
    rt_repl_set(6, "", 0);
    intptr_t r = scheme_entry();
    if (status_of(r) != "ok")
      std::cerr << "warning: auto-import (scheme base): " << scm_str(rt_cdr(r)) << "\n";
  }

  std::cerr << "Emit REPL (embedded compiler, ORC/LLJIT).  ^D to exit.\n";

  // Accumulate stdin and drive the compiler.  After each line, ask the compiler
  // (form-complete?) whether the buffer starts with a complete form; when it does,
  // slice it off, compile+run it, and keep draining further complete forms.
  std::string buf, line;
  std::cerr << "scheme> " << std::flush;
  while (std::getline(std::cin, line)) {
    buf += line;
    buf += "\n";
    for (;;) {
      rt_repl_set(2, buf.data(), (intptr_t)buf.size());
      intptr_t code = rt_fixnum_value(scheme_entry());
      if (code == -1) break;                // incomplete: read more input
      if (code == -2) {                     // malformed: report and drop the buffer
        std::cerr << "error: malformed input\n";
        buf.clear();
        break;
      }
      std::string form = buf.substr(0, (size_t)code);
      buf.erase(0, (size_t)code);
      process_form(form);
      if (buf.find_first_not_of(" \t\r\n") == std::string::npos) { buf.clear(); break; }
    }
    std::cerr << "scheme> " << std::flush;
  }
  std::cerr << "\n";
  return 0;
}

// ===========================================================================
// build / lib doors -- emit IR in-process, then fork clang (was bin/scheme-compile,
// bin/emit).
// ===========================================================================

struct Toolchain { std::string cc, gc_inc, gc_lib; };

// Discover the C toolchain for the AOT link.  Explicit env (CC / GC_INC / GC_LIB,
// with the EMIT_GC_* mirrors as fallbacks) wins; otherwise consult tools/llvm-env.sh
// --print-env (found under the repo root), so discovery stays single-sourced with
// the Makefile and the Chez driver (design D2, task 2.2).
static bool discover_toolchain(const std::string &root, Toolchain &tc) {
  const char *cc = std::getenv("CC");
  const char *gi = std::getenv("GC_INC"); if (!gi) gi = std::getenv("EMIT_GC_INC");
  const char *gl = std::getenv("GC_LIB"); if (!gl) gl = std::getenv("EMIT_GC_LIB");
  std::string ecc, egi, egl;
  if (!cc || !gi || !gl) {
    std::string cmd = "'" + root + "/tools/llvm-env.sh' --print-env 2>/dev/null";
    FILE *p = popen(cmd.c_str(), "r");
    if (p) {
      char buf[4096];
      while (std::fgets(buf, sizeof buf, p)) {
        std::string L(buf);
        while (!L.empty() && (L.back() == '\n' || L.back() == '\r')) L.pop_back();
        auto eq = L.find('=');
        if (eq == std::string::npos) continue;
        std::string k = L.substr(0, eq), v = L.substr(eq + 1);
        if (k == "CC") ecc = v;
        else if (k == "EMIT_GC_INC") egi = v;
        else if (k == "EMIT_GC_LIB") egl = v;
      }
      pclose(p);
    }
  }
  tc.cc = cc ? std::string(cc) : ecc;
  tc.gc_inc = gi ? std::string(gi) : egi;
  tc.gc_lib = gl ? std::string(gl) : egl;
  if (tc.cc.empty() || tc.gc_inc.empty() || tc.gc_lib.empty()) {
    std::cerr << "emit: toolchain discovery failed (need CC / GC_INC / GC_LIB, or a "
                 "working tools/llvm-env.sh)\n";
    return false;
  }
  return true;
}

// fork/exec clang to link the runtime + unit .ll files into the native exe, mirroring
// bin/scheme-compile's flags exactly.  Returns true on a zero exit.
static bool link_clang(const Toolchain &tc, const std::string &runtime_c,
                       const std::vector<std::string> &unit_files, const std::string &out) {
  std::vector<std::string> args;
  args.push_back(tc.cc);
  args.push_back("-Wno-override-module");
  args.push_back("-O2");
  args.push_back("-I" + tc.gc_inc);
  args.push_back("-L" + tc.gc_lib);
  args.push_back(runtime_c);
  for (const std::string &u : unit_files) args.push_back(u);
  args.push_back("-lgc");
  args.push_back("-o");
  args.push_back(out);

  std::vector<char *> cargs;
  for (std::string &a : args) cargs.push_back(const_cast<char *>(a.c_str()));
  cargs.push_back(nullptr);

  pid_t pid = fork();
  if (pid < 0) { std::cerr << "emit build: fork failed\n"; return false; }
  if (pid == 0) {
    execvp(cargs[0], cargs.data());
    std::fprintf(stderr, "emit build: exec %s failed\n", cargs[0]);
    _exit(127);
  }
  int status = 0;
  if (waitpid(pid, &status, 0) < 0) return false;
  return WIFEXITED(status) && WEXITSTATUS(status) == 0;
}

// Split OUT's directory off and `mkdir -p` it (best-effort, one level deep beyond
// what already exists is the common case; use a shell for arbitrary depth).
static void ensure_parent_dir(const std::string &path) {
  auto s = path.find_last_of('/');
  if (s == std::string::npos) return;
  std::string dir = path.substr(0, s);
  if (dir.empty()) return;
  std::string cmd = "mkdir -p '" + dir + "'";
  int rc = std::system(cmd.c_str());
  (void)rc;
}

static int emit_build(int argc, char **argv) {
  std::string name, manifest, out;
  bool no_prelude = false;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
    else if (a == "-o" && i + 1 < argc) out = argv[++i];
    else if (a == "--no-prelude") no_prelude = true;
    else if (!a.empty() && a[0] == '-') { std::cerr << "emit build: unknown option " << a << "\n"; return 2; }
    else name = a;
  }
  if (manifest.empty()) {
    const char *mp = std::getenv("EMIT_MANIFEST");
    manifest = mp ? std::string(mp) : std::string("emit-libs.scm");
  }
  std::string root = repo_root();

  GC_INIT();
  if (no_prelude) setenv("EMIT_NO_PRELUDE", "1", 1);

  // Resolve the (program NAME) entry to its source + delivered path (Chez-free).
  rt_repl_set(0, "", 0);
  scheme_entry();
  std::string src, entry_out;
  if (resolve_program(manifest, name, src, entry_out)) return 1;

  // Output precedence: -o flag > entry (output ...) > build/<NAME> > build/<src base>.
  if (out.empty()) {
    if (!entry_out.empty()) out = entry_out;
    else if (!name.empty()) out = "build/" + name;
    else {
      std::string b = src;
      auto sl = b.find_last_of('/'); if (sl != std::string::npos) b = b.substr(sl + 1);
      if (b.size() > 4 && b.substr(b.size() - 4) == ".scm") b = b.substr(0, b.size() - 4);
      out = "build/" + b;
    }
  }

  say("build " + (name.empty() ? std::string("<sole program>") : name) +
      " -> " + out + "  [source " + src + "]");

  // Emit the program IR in-process (same modes the run door uses).
  std::string prog_src = read_file(src);
  std::vector<std::string> modules;
  std::string prog_ir;
  bool is_library = false;
  if (!compile_program(prog_src, manifest, no_prelude, modules, prog_ir, is_library))
    return 1;

  // Write each unit + the program to temp .ll files (clang infers IR from .ll).  The
  // program is just the last unit for linking -- no need to distinguish it.
  char tmpl[] = "/tmp/emit-build.XXXXXX";
  char *tmpd = mkdtemp(tmpl);
  if (!tmpd) { std::cerr << "emit build: mkdtemp failed\n"; return 1; }
  std::string dir(tmpd);
  std::vector<std::string> unit_files;
  size_t idx = 0;
  auto emit_unit = [&](const std::string &ir) {
    std::string f = dir + "/unit." + std::to_string(idx++) + ".ll";
    write_file(f, ir);
    unit_files.push_back(f);
  };
  for (const std::string &m : modules) emit_unit(m);
  emit_unit(prog_ir);
  vsay("emit " + src + " -> " + std::to_string(unit_files.size()) + " unit(s) IR");

  Toolchain tc;
  if (!discover_toolchain(root, tc)) return 1;

  ensure_parent_dir(out);
  std::string runtime_c = root + "/src/runtime/runtime.c";
  if (!link_clang(tc, runtime_c, unit_files, out)) {
    std::cerr << "emit build: link failed\n";
    return 1;
  }
  long b = file_bytes(out);
  say("wrote " + out + "  [" + (b >= 0 ? std::to_string(b) : std::string("?")) + " bytes exe]");

  // Clean up temp units (best effort).
  std::string rm = "rm -rf '" + dir + "'";
  int rc = std::system(rm.c_str()); (void)rc;
  return 0;
}

static int emit_lib(int argc, char **argv) {
  std::string src, dir = "build/lib", manifest;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (a == "-o" && i + 1 < argc) dir = argv[++i];
    else if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
    else if (!a.empty() && a[0] == '-') { std::cerr << "emit lib: unknown option " << a << "\n"; return 2; }
    else src = a;
  }
  if (src.empty()) {
    std::cerr << "usage: emit lib SRC [-o DIR] [--manifest F]\n";
    return 1;
  }
  if (manifest.empty()) {
    const char *mp = std::getenv("EMIT_MANIFEST");
    manifest = mp ? std::string(mp) : std::string("emit-libs.scm");
  }

  GC_INIT();
  rt_repl_set(0, "", 0);                     // init-session
  scheme_entry();

  std::string lib_src = read_file(src);
  if (lib_src.empty()) {
    std::cerr << "emit lib: cannot read " << src << "\n";
    return 1;
  }

  // .exports table + the library's basename (mode 11: (ok . "<basename>\n<datum>")).
  rt_repl_set(11, lib_src.data(), (intptr_t)lib_src.size());
  intptr_t er = scheme_entry();
  if (status_of(er) != "ok") {
    std::cerr << "emit lib: " << scm_str(rt_cdr(er)) << "\n";
    return 1;
  }
  std::string exp_payload = scm_str(rt_cdr(er));
  auto nl = exp_payload.find('\n');
  if (nl == std::string::npos) {
    std::cerr << "emit lib: malformed export payload\n";
    return 1;
  }
  std::string base = exp_payload.substr(0, nl);
  std::string exports_datum = exp_payload.substr(nl + 1);

  // Unit .ll via the emit path (same bytes the run/AOT doors produce for the source):
  // a lone define-library compiles to one unit with no baked (scheme base).
  std::vector<std::string> modules;
  std::string prog_ir;
  bool is_library = false;
  if (!compile_program(lib_src, manifest, /*no_prelude=*/false, modules, prog_ir, is_library))
    return 1;
  if (!is_library) {
    std::cerr << "emit lib: source is not a single define-library\n";
    return 1;
  }

  ensure_parent_dir(dir + "/x");             // make DIR itself
  std::string ll_path = dir + "/" + base + ".ll";
  std::string exp_path = dir + "/" + base + ".exports";
  if (!write_file(ll_path, prog_ir)) { std::cerr << "emit lib: cannot write " << ll_path << "\n"; return 1; }
  // Match the Chez driver's .exports: the (name export-table) datum, newline-terminated.
  if (!write_file(exp_path, exports_datum + "\n")) { std::cerr << "emit lib: cannot write " << exp_path << "\n"; return 1; }

  say("lib " + src + " -> " + ll_path + "  [" +
      std::to_string(file_bytes(ll_path)) + " bytes]");
  vsay("exports " + exp_path);
  return 0;
}

// ===========================================================================
// verb dispatch.
// ===========================================================================

static void usage() {
  std::cerr <<
    "usage: emit <verb> [args]\n"
    "  emit run  [FILE] [--manifest F] [--no-prelude]     compile and run a program\n"
    "  emit repl [--manifest F] [--no-prelude]            interactive REPL\n"
    "  emit build [NAME] [--manifest F] [-o OUT] [--no-prelude]   deliver a native exe\n"
    "  emit lib  SRC [-o DIR] [--manifest F]              compile one library -> artifact\n";
}

int main(int argc, char **argv) {
  g_argv0 = argc > 0 ? argv[0] : "emit";
  init_verbosity();
  if (argc < 2) {
    std::cerr << "emit: missing verb (known verbs: lib, build, run, repl)\n";
    usage();
    return 1;
  }
  std::string verb(argv[1]);
  // Hand the verb its own argv slice (argv[0] == verb, options follow), matching the
  // per-door argument loops.
  if (verb == "run")   return emit_run(argc - 1, argv + 1);
  if (verb == "repl")  return emit_repl(argc - 1, argv + 1);
  if (verb == "build") return emit_build(argc - 1, argv + 1);
  if (verb == "lib")   return emit_lib(argc - 1, argv + 1);
  std::cerr << "emit: unknown verb '" << verb << "' (known verbs: lib, build, run, repl)\n";
  usage();
  return 2;
}
