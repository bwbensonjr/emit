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
// relative to this binary), so discovery stays single-sourced (design D2, task 2.2);
// failing that, it falls back to the values recorded when this binary was built
// (change: installed-emit-completeness -- see discover_toolchain).

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
#include <map>                             // manifest index for the lazy preload
#include <set>

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
  intptr_t rt_is_unspec(intptr_t v);          // is v THE unspecified value? (echo suppression)
  extern jmp_buf *rt_trap;                    // runtime trap escape hook
  extern char rt_trap_msg[];                  // last trap's message
  void rt_guard_reset(void);                  // clear guard frames after a trap
  // Run a stretch of code as the HOST's library instance, so a trap inside the compiler
  // reaches the COMPILER's handler chain rather than a JIT'd session's (issue #97).
  intptr_t rt_raiser_enter_host(void);
  void rt_raiser_leave_host(intptr_t token);
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

// --- stage-dump level, forwarded to the embedded compiler (change: emit-dump-stages)
// The compiler cannot see our argv, so --dump rides an environment variable it probes
// via %dump-level -- the same channel --no-prelude uses (spec: "the smallest viable
// channel").  Levels (design D1): 0 off, 1 stage names only, 2 full per-pass IL dump,
// 3 = 2 plus library units.  The precedence mirrors the Chez driver's
// (src/compile.ss): an explicit --dump wins, else EMIT_VERBOSITY=verbose gives the
// concise stage trace, else off.  MUST be called before the first scheme_entry().
//
// Narration goes to stderr on both sides, so this never changes a door's stdout: `emit
// run --emit --dump` writes the same IR bytes as without it.
static void forward_dump_level(bool dump, bool dump_all) {
  int lvl = dump_all ? 3 : (dump ? 2 : (g_level >= 2 ? 1 : 0));
  if (lvl == 0) return;                      // leave the variable untouched when off
  setenv("EMIT_DUMP_LEVEL", std::to_string(lvl).c_str(), 1);
}

// The two dump flags, shared by every door's option loop.
static bool is_dump_flag(const std::string &a, bool &dump, bool &dump_all) {
  if (a == "--dump")     { dump = true;     return true; }
  if (a == "--dump-all") { dump_all = true; return true; }
  return false;
}

// --- usage text (change: emit-cli-front-door) -----------------------------------
// Asking a tool what it does is a REQUEST, not an error: every door accepts
// --help/-h, prints its own usage, and exits 0.
static bool is_help_flag(const std::string &a) { return a == "--help" || a == "-h"; }

// Every usage writer takes a DESTINATION, because the same text has two of them
// (design D1): usage printed because the user asked for it is the output they asked
// for and goes to stdout, so `emit --help | head` works without redirection; usage
// printed as part of a diagnostic is narration and stays on stderr, per
// docs/OUTPUT.md.  Exit status follows the same split -- 0 when requested, non-zero
// when it accompanies an error.
//
// The top-level block stays the map it has always been -- a user running `emit` bare
// wants the verbs, not the detail -- and each verb owns its own (design D2).  `emit
// lib`'s arity-error line was the first of these; it is now one of four rather than a
// special case.  The shared-flag section is written once, in usage_shared, and called
// by all five, so the repetition cannot drift.
static void usage_shared(std::ostream &os) {
  os << "\n"
        "options every verb accepts:\n"
        "  --dump       print the IL after each compiler pass to stderr (stdout unchanged)\n"
        "  --dump-all   --dump, plus the stages of (scheme base) and imported libraries\n"
        "  --help, -h   print this usage on stdout and exit\n";
}

static void usage(std::ostream &os) {
  os << "usage: emit <verb> [args]\n"
        "  emit run  [FILE] [--manifest F] [--no-prelude]     compile and run a program\n"
        "  emit repl [--manifest F] [--no-prelude]            interactive REPL\n"
        "  emit build [NAME] [--manifest F] [-o OUT] [--no-prelude]   deliver a native exe\n"
        "  emit lib  SRC [-o DIR] [--manifest F]              compile one library -> artifact\n"
        "  emit help [VERB]                                   this summary, or a verb's usage\n";
  usage_shared(os);
  os << "\n"
        "ask a verb what it takes: emit <verb> --help\n";
}

static void usage_run(std::ostream &os) {
  os << "usage: emit run [FILE] [options]     compile and run a program\n"
        "\n"
        "  FILE                      program source; stdin when FILE is omitted\n"
        "  --manifest F              manifest to resolve libraries and programs against\n"
        "  --no-prelude              do not bake or imply (scheme base)\n"
        "  --emit                    write the program's LLVM IR to stdout; do not run\n"
        "  --resolve-program [NAME]  print a manifest program entry's source and output\n"
        "                            path, one per line; do not run\n";
  usage_shared(os);
}

static void usage_repl(std::ostream &os) {
  os << "usage: emit repl [options]           interactive REPL (^D to exit)\n"
        "\n"
        "  --manifest F              manifest whose libraries are preloaded into the session\n"
        "  --no-prelude              do not bake or auto-import (scheme base)\n";
  usage_shared(os);
}

static void usage_build(std::ostream &os) {
  os << "usage: emit build [NAME] [options]   deliver a native executable\n"
        "\n"
        "  NAME                      manifest (program NAME) entry; the sole entry when omitted\n"
        "  --manifest F              manifest to resolve the program and its libraries against\n"
        "  -o OUT                    output path, overriding the entry's own\n"
        "  --no-prelude              do not bake or imply (scheme base)\n";
  usage_shared(os);
}

static void usage_lib(std::ostream &os) {
  os << "usage: emit lib SRC [options]        compile one library -> artifact\n"
        "\n"
        "  SRC                       the library source (.sld) to compile\n"
        "  -o DIR                    artifact directory (default build/lib)\n"
        "  --manifest F              manifest to resolve the library's imports against\n";
  usage_shared(os);
}

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
// A diagnostic the embedded compiler raised, as a door should print it.  The core raises
// with `(error 'repl ...)`, so error-object-message carries a "repl: " prefix that is
// accurate inside `emit repl` and noise everywhere else -- `emit lib: repl: unbound
// variable map` names the wrong tool.  Strip it here, host-side, rather than at the raise
// sites: those are in CORE_FLAT (editing them is IR-shaping) and they feed the REPL's own
// output too, which stays as it is (change: baked-set-on-every-door).
static std::string door_msg(const std::string &m) {
  const std::string p = "repl: ";
  return m.compare(0, p.size(), p) == 0 ? m.substr(p.size()) : m;
}
// Byte offset of the CPS'th codepoint in a UTF-8 buffer.
//
// The input-completeness probe answers in CODEPOINTS -- the core's strings are
// codepoint-indexed over UTF-8 storage -- while the REPL's accumulation buffer is BYTES.
// Slicing the buffer by a codepoint count therefore truncates the form by (bytes -
// codepoints) whenever anything before the boundary is multi-byte, and there is no
// diagnostic because the two units agree on every ASCII-only input.
//
// It was invisible until the reader stopped closing an unterminated list at end of input
// (change: reader-input-termination): the truncation dropped the form's trailing
// delimiters, the reader silently supplied them again, and the value came out right. The
// leftover text then reported "malformed input" on stderr, which is the symptom that was
// visible all along. demos/prelude.scm is the case in the tree -- one em-dash in a comment,
// two bytes, exactly the two closing parens of the form below it.
static size_t byte_offset_of_codepoint(const std::string &s, size_t cps) {
  size_t i = 0;
  for (size_t n = 0; n < cps && i < s.size(); n++) {
    unsigned char c = (unsigned char)s[i];
    i += (c < 0x80) ? 1 : (c < 0xC0) ? 1 : (c < 0xE0) ? 2 : (c < 0xF0) ? 3 : 4;
  }
  return i > s.size() ? s.size() : i;
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

// The running executable's real path: argv[0] with symlinks resolved, and -- when
// argv[0] carries no '/' because the shell found us on PATH -- looked up on PATH
// first.  Returns "" when it cannot be determined.  Both repo_root() and the
// executable-relative manifest candidate need this: a Homebrew install is reached
// through a symlink in <prefix>/bin, and what sits beside the REAL binary is what
// was installed with it.
static std::string exe_path() {
  char buf[PATH_MAX];
  if (g_argv0.find('/') != std::string::npos)
    return realpath(g_argv0.c_str(), buf) ? std::string(buf) : g_argv0;
  const char *path = std::getenv("PATH");        // bare name: the shell used PATH
  if (!path) return "";
  std::istringstream dirs(path);
  std::string d;
  while (std::getline(dirs, d, ':')) {
    if (d.empty()) d = ".";
    std::string cand = d + "/" + g_argv0;
    if (access(cand.c_str(), X_OK) == 0)
      return realpath(cand.c_str(), buf) ? std::string(buf) : cand;
  }
  return "";
}

// The directory part of `path` ("" when it has none, i.e. the current directory).
static std::string dir_of(const std::string &path) {
  auto s = path.find_last_of('/');
  return s == std::string::npos ? std::string() : path.substr(0, s);
}

// The prefix this binary was built for -- the last-resort candidate of BOTH lookups
// below (the manifest and the support files).  A plain in-repo `make` bakes
// /usr/local and never reaches it.
#ifndef EMIT_PREFIX
#define EMIT_PREFIX "/usr/local"
#endif

static bool file_readable(const std::string &p) {
  std::ifstream f(p);
  return f.good();
}

// --- support-file location (change: installed-emit-completeness; issue #36) -----
// The build door needs two files that are not the binary and not a library:
// tools/llvm-env.sh (toolchain discovery, which in turn sources tools/log.sh) and
// src/runtime/runtime.c (compiled into every delivered executable).  They used to be
// found through a repo_root() that stripped "/emit" and "/build" off this binary's
// path -- an assumption that it sits in a checkout, which an INSTALLED emit does not,
// so `emit build` was the one door that did not work when installed.
//
// This is the manifest lookup's shape applied to a file (design D5).  Given the path
// the file has RELATIVE TO THE REPO ROOT, try in order:
//
//   1. <checkout>/<relpath>              build/emit -> the repo root above it
//   2. <exe>/../share/emit/<relpath>     a relocatable install (symlinks resolved)
//   3. <EMIT_PREFIX>/share/emit/<relpath>   the prefix this binary was built for
//
// Checkout first, install second: the same ordering #35 established, so the
// from-source developer workflow resolves exactly as it did before.  `make install`
// places each support file at the SAME repo-relative subpath under
// <prefix>/share/emit/, so one function serves both layouts and a support file added
// later needs no new rule here.  Returns "" when no candidate is readable; the caller
// reports the missing file by name rather than handing a nonexistent path to clang.
static std::string support_file(const std::string &relpath) {
  std::string p = exe_path();
  if (p.empty()) p = g_argv0;
  std::string bindir = dir_of(p);                 // .../build, or <prefix>/bin
  std::string root = dir_of(bindir);              // the checkout root, or <prefix>
  if (root.empty()) root = ".";
  std::string cand = root + "/" + relpath;                          // candidate 1
  if (file_readable(cand)) return cand;
  cand = root + "/share/emit/" + relpath;                           // candidate 2
  if (file_readable(cand)) return cand;
  cand = std::string(EMIT_PREFIX) + "/share/emit/" + relpath;       // candidate 3
  if (file_readable(cand)) return cand;
  return "";
}

// --- manifest location (change: manifest-search-path; issue #35) ---------------
// A library that is not baked into the binary is reachable only through a manifest,
// so WHERE the manifest is looked for decides whether an installed `emit` has a
// standard library at all.  The ordered candidates (spec: module-system "Library
// manifest"):
//
//   1. --manifest FILE          explicit
//   2. $EMIT_MANIFEST           explicit
//   3. ./emit-libs.scm          the in-repo/in-project case
//   4. <exe>/../share/emit/…    a relocatable install (symlinks resolved)
//   5. <EMIT_PREFIX>/share/…    the prefix this binary was built for
//
// 1-2 name a specific file: if it is absent that is a user error, and falling
// through would silently run against DIFFERENT libraries than were asked for.  3-5
// are a search, so a missing candidate is ordinary and finding nothing at all stays
// non-fatal -- a program importing only baked-in libraries needs no manifest, and
// import resolution reports anything else by name.
//
// THE SEARCHED CANDIDATES CHAIN (change: installed-emit-completeness; issue #44).
// Stopping at the first candidate that EXISTS was right while the only question was
// "is there a manifest at all", but it means a project's own ./emit-libs.scm -- which
// a project must have to declare its own program -- hides the installed one, and the
// project silently loses every standard library that is not baked in.  So 3-5 yield
// EVERY candidate that exists, in order, and a LIBRARY NAME is resolved by taking the
// first manifest in that list which names it: an earlier manifest EXTENDS a later one,
// and may override a shipped library by defining the same name (design D1, D3).
//
// An explicit request still names exactly one manifest and is never extended (design
// D2) -- that is what keeps a hermetic build expressible.  Program-entry lookup does
// not chain either (design D4): see resolve_program.
static const char *kManifestName = "emit-libs.scm";

// Resolve the manifest chain for a door.  `flag` is the door's --manifest argument
// (empty if not given).  Returns the manifests to consult, in resolution order --
// exactly one for an explicit request, every searched candidate that exists
// otherwise, and empty when none does.  Sets `bad` when an EXPLICIT request names a
// missing file (message already printed); the door must then exit non-zero.
static std::vector<std::string> resolve_manifests(const std::string &flag, bool &bad) {
  bad = false;
  std::vector<std::string> found;
  const char *env = std::getenv("EMIT_MANIFEST");
  std::string explicit_req = !flag.empty() ? flag : (env ? std::string(env) : std::string());
  if (!explicit_req.empty()) {                   // candidates 1-2: exactly one file
    if (!file_readable(explicit_req)) {
      std::cerr << "emit: manifest not found: " << explicit_req << "\n";
      bad = true;
      return found;
    }
    found.push_back(explicit_req);
    return found;
  }
  if (file_readable(kManifestName)) found.push_back(kManifestName); // candidate 3
  std::string exe = exe_path();                                     // candidate 4
  std::string share;
  if (!exe.empty()) {
    share = dir_of(dir_of(exe)) + "/share/emit/" + kManifestName;
    if (file_readable(share)) found.push_back(share);
  }
  std::string prefixed =                                            // candidate 5
      std::string(EMIT_PREFIX) + "/share/emit/" + kManifestName;
  // Candidates 4 and 5 name the same file whenever emit runs from the prefix it was
  // built for, which is the ordinary installed case; listing it twice would preload
  // every installed library a second time.
  if (prefixed != share && file_readable(prefixed)) found.push_back(prefixed);
  return found;
}

// The chain's first manifest ("" when none resolved) -- the one the non-chaining
// lookups use: program entries (design D4) and the "no program entry in manifest X"
// diagnostic, which must name the file the user can fix.
static std::string first_manifest(const std::vector<std::string> &manifests) {
  return manifests.empty() ? std::string() : manifests[0];
}

// Resolve a path that appeared INSIDE a manifest -- a library's (source ...), a
// program entry's (source ...)/(output ...) -- against that manifest's own
// directory.  One rule: a relative path in a manifest is relative to that manifest,
// so a manifest carries its library sources with it and resolves identically from
// any working directory.  Absolute paths are used as given.
static std::string manifest_relative(const std::string &manifest, const std::string &p) {
  if (p.empty() || p[0] == '/') return p;
  std::string d = dir_of(manifest);
  return d.empty() ? p : d + "/" + p;
}

// A manifest index key is the canonical unit prefix ("scheme.inexact:"); drop the
// trailing separator when the key is for a human to read rather than to compare.
static std::string library_label(const std::string &key) {
  return (!key.empty() && key[key.size() - 1] == ':') ? key.substr(0, key.size() - 1) : key;
}

// Narrate which manifest(s) a door resolved (docs/OUTPUT.md form), so "which
// emit-libs.scm am I getting?" stays a short answer rather than an strace session --
// which matters more now that the answer can be plural (design D8): a door that
// silently consults two manifests is worse than one that consults the wrong one.
// stderr only: no door's stdout changes by a byte.
static void say_manifest(const std::vector<std::string> &manifests) {
  if (manifests.empty()) {
    vsay("resolve manifest -> none found (baked-in libraries only)");
    return;
  }
  say("resolve manifest -> " + manifests[0]);
  for (size_t i = 1; i < manifests.size(); i++)
    say("resolve manifest -> " + manifests[i] + "  [chained]");
}

// Narrate what a LATER manifest in the chain actually supplied -- one line per
// manifest, naming the libraries that came from it (design D8).  A resolution
// reaching outside the first manifest is real ambient state and must be visible
// rather than silent; aggregating per manifest is what keeps the REPL's EAGER
// preload from printing a line per shipped library at every startup.
static void say_chained(const std::string &manifest, const std::vector<std::string> &keys) {
  if (keys.empty()) return;
  std::string names;
  for (size_t i = 0; i < keys.size(); i++) {
    if (i) names += " ";
    names += library_label(keys[i]);
  }
  say("chain " + manifest + " -> " + names + "  [" + std::to_string(keys.size()) +
      (keys.size() == 1 ? " library]" : " libraries]"));
}

// ===========================================================================
// run door -- in-process compile-and-run (was src/run.cpp).
// ===========================================================================

// Tell the compiler where the source it is about to receive came from (mode 13; change:
// library-include-declarations, design D4).  The core is handed source TEXT and never a
// path, so without this an `include` inside that source would have nothing to resolve
// against but the working directory -- and a door that resolves against the CWD works
// from the repo root and nowhere else, the failure `manifest-search-path` and
// `baked-set-on-every-door` each had to fix once.  "" means the source has no path (it
// came from stdin); every other submission names its file.
static void set_source_home(const std::string &path) {
  rt_repl_set(13, path.data(), (intptr_t)path.size());
  scheme_entry();
}

// Ask the compiler which libraries a source text imports (mode 12), as canonical
// keys matching the manifest index.  A pure query: it reads and parses, registering
// nothing.  `home` is the source's own path: the answer depends on it, because an
// `import` may arrive through an included declarations file (design D11).
static std::vector<std::string> source_imports(const std::string &text, const std::string &home) {
  std::vector<std::string> out;
  set_source_home(home);
  rt_repl_set(12, text.data(), (intptr_t)text.size());
  std::string s = scm_str(scheme_entry());
  std::istringstream lines(s);
  std::string line;
  while (std::getline(lines, line))
    if (!line.empty()) out.push_back(line);
  return out;
}

// Preload the user libraries the PROGRAM NEEDS into `modules` (changes:
// run-door-user-libraries; lazy closure in numeric-conformance).  The compiler owns
// resolution (modes 9 + 12 + 4); this only COLLECTS each unit's IR -- it does NOT run
// __init (the program's @scheme_entry does).  A library resolves against
// already-loaded units, so we iterate to a fixpoint (topological order regardless of
// manifest order).  Returns false on a hard error.
//
// LAZY, not every manifest entry.  Preloading the whole manifest was fine while it
// held exactly one library, but a second entry showed three things wrong with it: a
// program's emitted IR carried units it never imported; `--no-prelude` -- which
// promises a single self-contained module -- emitted a preloaded unit's boundary
// marker anyway; and the run door's program IR stopped matching the Chez driver's,
// which resolves imports on demand, breaking the door-parity invariant that
// test/prelude-base-run-tests.sh pins.  So this walks the transitive closure of the
// program's imports over the manifest index instead, which is what the Chez driver's
// toposort-libs already does on its side.
//
// Run a manifest-parsing mode call (5 or 9) and ATTRIBUTE a failure to the file it came
// from.  The core is handed only text -- the host owns paths -- so a manifest the reader
// rejects (a truncated list) or the form-count check rejects (a second top-level form)
// otherwise reports with no file named, and the narration has already listed every chained
// candidate above it, leaving the user to guess which one (change: reader-input-termination,
// design D5; issues #66, #67).
//
// `rt_raise` prints the diagnostic and, with no trap installed, exit(1)s.  Installing one
// here adds the attribution line and exits the same way, so the control flow a malformed
// manifest produces is UNCHANGED -- only better labelled.  Nothing non-trivial is live
// across the setjmp.
//
// Mode 10 needs none of this: it carries an (ok . _) / (error . MSG) pair and
// resolve_program prints "manifest PATH ..." itself.
static std::string manifest_mode_text(int mode, const std::string &mtext,
                                      const std::string &manifest) {
  jmp_buf jb;
  jmp_buf *saved = rt_trap;
  rt_trap = &jb;
  if (setjmp(jb) != 0) {
    rt_guard_reset();          // a trap may have bypassed rt_run_guarded's frame pop
    rt_trap = saved;
    std::cerr << "emit: in manifest " << manifest << "\n";
    exit(1);
  }
  rt_repl_set(mode, mtext.data(), (intptr_t)mtext.size());
  std::string out = scm_str(scheme_entry());
  rt_trap = saved;
  return out;
}

// Index the whole manifest chain by library key, FIRST MANIFEST WINS per name (design D3):
// a project's ./emit-libs.scm extends the installed one rather than replacing it, and may
// override a shipped library by naming it.  Each entry's relative (source ...) is resolved
// against ITS OWN manifest's directory, so an inherited entry still names the sources that
// shipped beside it.  `from_of` records the manifest for names a LATER one supplied, which
// the preload narrates.
//
// Mode 9's index omits every baked member, so what comes back is exactly the libraries that
// have a source file -- which is what both the preload and the build door's shake want.
static void manifest_library_index(const std::vector<std::string> &manifests,
                                   std::map<std::string, std::string> &path_of,
                                   std::map<std::string, std::string> &from_of) {
  for (size_t mi = 0; mi < manifests.size(); mi++) {
    const std::string &manifest = manifests[mi];
    std::string mtext = read_file(manifest);
    std::string index = manifest_mode_text(9, mtext, manifest);   // "KEY\tPATH" per line
    std::istringstream lines(index);
    std::string line;
    while (std::getline(lines, line)) {
      std::string::size_type tab = line.find('\t');
      if (tab == std::string::npos) continue;
      std::string key = line.substr(0, tab);
      if (path_of.count(key)) continue;      // an earlier manifest already resolves it
      // Manifest paths are relative to the manifest, not to the CWD.
      path_of[key] = manifest_relative(manifest, line.substr(tab + 1));
      if (mi > 0) from_of[key] = manifest;
    }
  }
}

// The artifact cache is defined further down, beside the rest of the entry machinery, but
// the two preloads are its first clients -- so its unit-level face is declared here.  A
// read answers Hit, Miss, or Deferred: Deferred is a VALID entry whose imports are not
// registered yet, which both preloads already know how to retry.
enum class CacheRead { Hit, Miss, Deferred };
static CacheRead cache_load_unit(const std::string &key, const std::string &path,
                                 std::string &ir, std::string &init);
static void cache_store_unit(const std::string &key, const std::string &path,
                             const std::string &ir);

// The REPL host deliberately stays EAGER: a session is an open world where the user may
// import anything at any prompt, so every user library on the manifest must already be
// loaded.  Only this door, compiling one known program, can be lazy.  Both doors read the
// same mode-9 index; they differ only in how much of it they load.
static bool preload_user_libraries(const std::vector<std::string> &manifests,
                                   std::vector<std::string> &modules,
                                   std::vector<std::string> &module_keys,
                                   const std::string &program_src,
                                   const std::string &program_home) {
  if (manifests.empty()) return true;        // no manifest: no user libraries

  std::map<std::string, std::string> path_of;      // library key -> source path
  std::map<std::string, std::string> from_of;      // key -> manifest, when not the first
  manifest_library_index(manifests, path_of, from_of);
  if (path_of.empty()) return true;

  // The closure walk: start at the program's imports and follow each reached .sld's
  // own imports.  Reading those files is why this loop lives here and not in the
  // core, which performs no I/O by design.
  std::set<std::string> needed;
  std::map<std::string, std::vector<std::string>> supplied;   // manifest -> keys, for narration
  std::vector<std::string> work = source_imports(program_src, program_home);
  while (!work.empty()) {
    std::string key = work.back();
    work.pop_back();
    if (needed.count(key)) continue;
    std::map<std::string, std::string>::const_iterator it = path_of.find(key);
    // Not in the manifest: either (scheme base), which is baked in, or a genuinely
    // missing library -- which the program's own compile reports precisely, so
    // guessing here would only produce a worse diagnostic.
    if (it == path_of.end()) continue;
    needed.insert(key);
    // A name supplied by a LATER manifest is a resolution reaching outside the first
    // one -- ambient state, so it is named rather than silent (design D8).
    std::map<std::string, std::string>::const_iterator f = from_of.find(key);
    if (f != from_of.end()) supplied[f->second].push_back(key);
    // The .sld's own path is its home, so an import behind an included declarations
    // file is reached here rather than surfacing later as a missing dependency (D11).
    std::vector<std::string> deps = source_imports(read_file(it->second), it->second);
    for (size_t i = 0; i < deps.size(); i++) work.push_back(deps[i]);
  }

  for (size_t mi = 1; mi < manifests.size(); mi++)
    say_chained(manifests[mi], supplied[manifests[mi]]);

  // (key, path) pairs from here on: the KEY is what an entry is filed under, so the cache
  // needs it beside the path it would otherwise have carried alone.
  std::vector<std::pair<std::string, std::string>> pending;
  for (std::set<std::string>::const_iterator k = needed.begin(); k != needed.end(); ++k)
    pending.push_back(std::make_pair(*k, path_of[*k]));

  while (!pending.empty()) {
    std::vector<std::pair<std::string, std::string>> deferred;
    bool progress = false;
    for (const std::pair<std::string, std::string> &kp : pending) {
      const std::string &key = kp.first;
      const std::string &p = kp.second;
      // A cached unit registers without reading the .sld, compiling it, or running any of
      // its includes (change: chez-free-unit-pipeline).  `Deferred` means the entry is
      // valid but its imports are not registered yet, which is the same condition mode 4
      // reports and goes around the same fixpoint loop.
      std::string cached_ir, cached_init;
      CacheRead cr = cache_load_unit(key, p, cached_ir, cached_init);
      if (cr == CacheRead::Deferred) { deferred.push_back(kp); continue; }
      if (cr == CacheRead::Hit) {
        modules.push_back(cached_ir);
        module_keys.push_back(key);
        progress = true;
        continue;
      }
      std::string src = read_file(p);
      // An unreadable or empty source must be reported HERE.  Handing "" to mode 4 makes it
      // take `(car '())` on the empty form list, and a primitive trap is not catchable by the
      // in-language `guard` that wraps that mode -- so a manifest entry naming a file that
      // does not exist used to abort the process instead of naming the file
      // (change: baked-set-on-every-door).
      if (src.empty()) {
        // "emit: ", not "emit run: ": this preload is shared by the run, build and lib
        // doors, so naming one of them would be wrong for the other two.
        std::cerr << "emit: cannot read library source " << p
                  << " (named in the manifest)\n";
        return false;
      }
      set_source_home(p);                    // includes resolve beside the .sld
      rt_repl_set(4, src.data(), (intptr_t)src.size());
      intptr_t r = scheme_entry();
      std::string st = status_of(r);
      if (st == "deferred") { deferred.push_back(kp); continue; }
      if (st == "already") { progress = true; continue; }  // e.g. baked (scheme base): no module
      if (st != "ok") {
        std::cerr << "emit: loading library " << p << ": " << door_msg(scm_str(rt_cdr(r))) << "\n";
        return false;
      }
      std::string ir = scm_str(rt_car(rt_cdr(r)));
      modules.push_back(ir);                          // collect IR; do NOT run __init
      module_keys.push_back(key);
      // Store BEFORE anything else compiles: mode 16 describes the most recent
      // registration, so the window in which it still describes this one is right here.
      cache_store_unit(key, p, ir);
      progress = true;
    }
    if (!progress) {                         // every remaining unit is stuck
      for (const std::pair<std::string, std::string> &kp : deferred)
        std::cerr << "emit run: library " << kp.second
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
//
// Takes ONE manifest -- the FIRST of the chain -- because program lookup does not
// chain (design D4).  A program is project-specific by nature, so a typo'd name must
// be reported against the project's own manifest, the file the user can actually fix,
// rather than searched for in an installed one.  Only LIBRARY resolution chains.
static int resolve_program(const std::string &manifest, const std::string &name,
                           std::string &src, std::string &out) {
  // THREE distinguishable reasons no program entry resolves, and they call for different
  // user actions (change: manifest-empty-guards; issue #63).  All three used to reach mode
  // 10 and SEGFAULT: the parser took (car '()) of a datum-free read, so `emit build` in a
  // fresh directory -- the first thing an installed Emit is asked to do -- died on a signal
  // with no diagnostic.  A byte-length guard here would have caught only two of them;
  // whether a manifest holds a DATUM is the reader's question, so mode 10 answers it.
  if (manifest.empty()) {
    std::cerr << "emit: no manifest found (looked for " << kManifestName
              << "); `emit build` builds a program named in a manifest\n";
    return 1;
  }
  std::string mtext = read_file(manifest);
  rt_repl_set(10, mtext.data(), (intptr_t)mtext.size());
  intptr_t r = scheme_entry();
  if (status_of(r) != "ok") {          // (2) found, but holds no datum at all
    std::cerr << "emit: manifest " << manifest << " " << door_msg(scm_str(rt_cdr(r)))
              << "\n";
    return 1;
  }
  std::string triples = scm_str(rt_cdr(r));
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
  // A program entry's paths, like a library's, are relative to the manifest.
  src = manifest_relative(manifest, (*pick)[1]);
  out = manifest_relative(manifest, (*pick)[2]);
  return 0;
}

// --- artifact cache for the baked standard library (change: baked-set-artifact-cache) ---
//
// The baked set is recompiled from this binary's own `*prelude-source*` at every process
// start: 1.72s of a 1.80s trivial `emit run`, and ~74% of the default suite's wall clock
// (docs/PERFORMANCE.md P3).  Nothing about it varies with the program being compiled, so
// it is compiled once and reused by every later process.
//
// The cache is a PURE ACCELERATOR.  No location, no entry, a stale entry, a torn entry, an
// unwritable directory -- every one of them falls through to the from-source compile and
// succeeds, so no door gains a failure mode it did not have before (spec: artifact-cache,
// "Every cache failure degrades to compiling from source").  That is what lets every
// helper below simply return false or "" on any problem, with no error path of its own.

// Entry-layout version.  Bump by hand to invalidate every entry deliberately -- the same
// lever `compiler-stamp-version` gives the Chez driver's sidecars.
//
// 2: entries gained a KIND and an optional second key half, so the cache serves user
// libraries and shaken units as well as the baked set (change: chez-free-unit-pipeline).
static const int kCacheVersion = 2;

// FNV-1a, the hash the Chez driver's stamp already uses.  Non-cryptographic by intent: it
// guards against accidental staleness, not adversarial collision, and adds no dependency.
static std::string fnv1a_hex(const std::string &bytes) {
  uint64_t h = 14695981039346656037ULL;
  for (unsigned char c : bytes) { h ^= (uint64_t)c; h *= 1099511628211ULL; }
  char buf[32];
  std::snprintf(buf, sizeof buf, "%016llx", (unsigned long long)h);
  return std::string(buf);
}

// The compiler's identity -- which for the baked set is ALSO the source's identity, since
// the prelude is compiled into this binary, so a different binary is a different standard
// library (design D2).
//
// This deliberately inverts the Chez driver's reasoning.  It hashes the compiler SOURCES
// because there the compiler runs as interpreted source, so "hashing them IS the running
// compiler's identity".  Here the compiler is compiled in: those files are not what is
// running, and in an install they need not exist at all.
//
// Memoized -- one ~1.7 MB pass per process, ~1-2 ms against the ~1.43 s it saves.  Returns
// "" if we cannot identify ourselves, which disables caching rather than risking a wrong
// key.
static std::string compiler_digest() {
  static std::string memo;
  static bool done = false;
  if (done) return memo;
  done = true;
  std::string exe = exe_path();
  if (exe.empty()) return memo;
  std::string bytes = read_file(exe);
  if (bytes.empty()) return memo;
  memo = fnv1a_hex(bytes);
  return memo;
}

// `mkdir -p`.  Every component already existing is success, not failure.
static bool mkdirs(const std::string &path) {
  struct stat st;
  if (stat(path.c_str(), &st) == 0) return S_ISDIR(st.st_mode);
  std::string parent = dir_of(path);
  if (!parent.empty() && parent != path && !mkdirs(parent)) return false;
  if (mkdir(path.c_str(), 0700) == 0) return true;
  return stat(path.c_str(), &st) == 0 && S_ISDIR(st.st_mode);   // lost a create race
}

// Where entries live (design D4): $EMIT_CACHE, else the platform user cache directory,
// else "" for no caching at all.
//
// ONE resolution for a checkout and an install alike -- deliberately NOT `build/lib`, so
// that no code path exists only for installed users.  The directory is created on demand;
// if it cannot be, the answer is "" and every door simply compiles from source.
static std::string cache_dir() {
  static std::string memo;
  static bool done = false;
  if (done) return memo;
  done = true;
  const char *env = std::getenv("EMIT_CACHE");
  std::string base = (env && *env) ? std::string(env) : std::string();
  if (base.empty()) {
    const char *xdg = std::getenv("XDG_CACHE_HOME");
    const char *home = std::getenv("HOME");
    if (xdg && *xdg)        base = std::string(xdg) + "/emit";
#ifdef __APPLE__
    else if (home && *home) base = std::string(home) + "/Library/Caches/emit";
#else
    else if (home && *home) base = std::string(home) + "/.cache/emit";
#endif
  }
  if (base.empty() || !mkdirs(base)) return memo;   // memo is still ""
  memo = base;
  return memo;
}

// An entry's path stem, or "" when caching is unavailable for any reason.  The version and
// the digest are both IN THE NAME, so a bumped format or a rebuilt binary cannot collide
// with an existing entry -- it simply misses and writes its own.
// The location is resolved FIRST and short-circuits: with nowhere to put an entry, hashing
// the executable is 1.7 MB of reading and 2.6 ms of arithmetic spent on an answer nobody can
// use, on every single invocation.  Cheap to get wrong the other way round, since both
// helpers memoize and neither looks like it costs anything at the call site.
//
// An entry has a KIND, an optional LABEL, and an optional second key half (change:
// chez-free-unit-pipeline, design D10):
//
//   baked-v2-<compiler>                          the whole baked set, as before
//   unit-<basename>-v2-<compiler>-<srcid>        one library compiled from disk
//   shake-<basename>-v2-<compiler>-<srcid>-<prog>  that library pruned to a program's roots
//
// The KIND is in the NAME, not merely in the stamp, so "a shaken unit must never be served
// where a full one is wanted" is a property of where an entry is looked up rather than a
// discipline every caller has to observe.  A shaken unit is a different artifact for the
// same source -- sound only for the program whose roots produced it -- and the open-world
// doors would break at the first binding it dropped.
//
// `srcid` is a digest of the library's PATH, not of its content: the entry has to be
// findable before anything about the source has been read, so the content digests live
// INSIDE the entry (its `.sources` file) and are what validity is checked against.  One
// stem per (library, compiler) therefore holds the latest content, rather than accumulating
// a file per edit.
static std::string cache_entry_stem(const std::string &kind, const std::string &label,
                                    const std::string &extra) {
  std::string dir = cache_dir();
  if (dir.empty()) return std::string();
  std::string dig = compiler_digest();
  if (dig.empty()) return std::string();
  std::ostringstream s;
  s << dir << "/" << kind;
  if (!label.empty()) s << "-" << label;
  s << "-v" << kCacheVersion << "-" << dig;
  if (!extra.empty()) s << "-" << extra;
  return s.str();
}

static std::string cache_stem() { return cache_entry_stem("baked", "", ""); }

// The stamp file is written LAST and is the entry's completeness witness: a torn or
// interrupted write leaves no stamp, so the entry reads as absent rather than as corrupt
// (the same fail-safe-toward-rebuild property `artifacts-fresh?` gets by writing its
// sidecar last).
//
// It repeats the whole key rather than just the compiler digest.  The name already encodes
// the key, so this is redundant by construction -- which is the point: an entry that ends up
// under the wrong name (a truncated write from an older format, a directory copied by hand)
// says what it actually is instead of being trusted for where it sits.
static std::string cache_stamp_text(const std::string &kind, const std::string &label,
                                    const std::string &extra) {
  std::ostringstream s;
  s << "(emit-artifact-stamp " << kCacheVersion
    << " " << kind
    << " " << (label.empty() ? std::string("-") : label)
    << " " << compiler_digest()
    << " " << (extra.empty() ? std::string("-") : extra) << ")\n";
  return s.str();
}

// Write `text` to `path` through a temporary file and an atomic rename (design D8).  The
// default suite runs many `emit` processes concurrently under EMIT_JOBS, so several race
// to populate a cold cache; rename means a reader sees a whole file or none, and a loser
// of the race overwrites with identical bytes.  No locking.
static bool cache_write_atomic(const std::string &path, const std::string &text) {
  std::ostringstream tmp;
  tmp << path << ".tmp" << (long)getpid();
  {
    std::ofstream f(tmp.str(), std::ios::binary | std::ios::trunc);
    if (!f) return false;
    f.write(text.data(), (std::streamsize)text.size());
    if (!f.good()) { f.close(); ::remove(tmp.str().c_str()); return false; }
  }
  if (::rename(tmp.str().c_str(), path.c_str()) != 0) {
    ::remove(tmp.str().c_str());
    return false;
  }
  return true;
}

// --- a disk-sourced library's SOURCE identity (design D5, D6) ----------------
// The absolute, symlink-resolved path, or the path unchanged when it cannot be resolved.
// Entries live in a cache shared by every project on the machine and outlive the working
// directory that produced them, so a relative path is not an identity: two projects with a
// `lib/util.sld` apiece would key on the same string, and the same file reached from a
// different directory would key on two.  Content validation makes either case merely
// wasteful rather than wrong -- but "wasteful" here means silently never hitting.
static std::string canonical_path(const std::string &path) {
  char buf[PATH_MAX];
  if (realpath(path.c_str(), buf)) return std::string(buf);
  return path;
}

// One file's content digest, or "" when it cannot be read.  CONTENT, not modification
// time: `artifacts-fresh?` can compare mtimes because its artifacts sit beside the sources
// it compares them to, and this cache's entries do not -- they live in a user cache
// directory shared across checkouts, worktrees and branch switches, where `git checkout`
// restores content and moves mtimes.  A few KB of FNV-1a is nothing beside the 2.6 ms the
// executable digest already costs.
static std::string file_digest(const std::string &path) {
  if (file_bytes(path) < 0) return std::string();   // absent: not a source we can key on
  return fnv1a_hex(read_file(path));                // an EMPTY include is legal, and hashes
}

// "DIGEST\tPATH" per line, in the order the compiler read them.  "" if ANY of them cannot
// be read, which disables caching for that library rather than keying it on a partial view
// of its source.
static std::string sources_manifest(const std::vector<std::string> &paths) {
  std::string out;
  for (const std::string &p : paths) {
    std::string d = file_digest(p);
    if (d.empty()) return std::string();
    out += d;
    out += '\t';
    out += canonical_path(p);          // absolute: the entry outlives this directory
    out += '\n';
  }
  return out;
}

// Does every file this entry was built from still have the content it had then?  A file
// that has since vanished counts as changed: the unit can no longer be said to describe it.
static bool sources_still_match(const std::string &text) {
  if (text.empty()) return false;
  std::istringstream lines(text);
  std::string line;
  while (std::getline(lines, line)) {
    if (line.empty()) continue;
    std::string::size_type tab = line.find('\t');
    if (tab == std::string::npos) return false;      // malformed: refuse the entry
    if (file_digest(line.substr(tab + 1)) != line.substr(0, tab)) return false;
  }
  return true;
}

// The path a library's entry is filed under, as a digest.  The legible half of the name is
// the unit key the core hands out (`demo.util` for `(demo util)`); this is what distinguishes
// two libraries that share a name but not a file.
static std::string source_key_of(const std::string &sld_path) {
  return fnv1a_hex(canonical_path(sld_path));
}

// Split a boundary-joined module stream into one entry per module, exactly as the
// from-source path below does -- shared so the cached and compiled paths cannot disagree
// about what a module is.
static void split_modules(const std::string &joined, std::vector<std::string> &modules) {
  size_t start = 0;
  for (;;) {
    size_t bpos = joined.find(kBoundary, start);
    if (bpos == std::string::npos) break;
    modules.push_back(joined.substr(start, bpos - start));
    start = bpos + kBoundary.size();
  }
  modules.push_back(joined.substr(start));
}

// Does the door want to WATCH the compile happen?  `--dump-all` (level 3) asks to see a
// library's per-define stages, and those stages exist only while it is being compiled -- a
// reused entry would print none of them.  So a request to observe the compile bypasses the
// cache entirely: the flag's whole purpose is that the work happens where you can watch it.
// Levels 1 and 2 are unaffected, because they deliberately do not dump library units
// (emit-dump-stages, design D7), so for them a reused entry changes nothing that is printed.
//
// Found by test/dump-stages-tests.sh, which asserts >100 tagged `(scheme base)` headers
// under --dump-all and saw zero once the cache started serving them.
static bool cache_bypassed_for_dump() {
  const char *dl = std::getenv("EMIT_DUMP_LEVEL");
  if (dl && std::atoi(dl) >= 3) {
    vsay("cache: bypassed (--dump-all asks to observe the compile)");
    return true;
  }
  return false;
}

// Read one entry and register everything in it (mode 14), or report a miss having changed
// NOTHING -- so every caller can simply fall through to compiling.  Serves all three kinds:
// the baked set (N modules), a user library (1), and a pruned unit (1).
//
// `what` names the entry in narration.  `sources_required` distinguishes a disk-sourced
// entry, whose `.sources` file must still describe the files on disk, from the baked set,
// whose source is the binary and is already covered by the compiler half of the key.
//
// Mode 14 refuses a malformed entry WHOLE, before touching the session, so a rejected entry
// cannot leave a half-seeded session that the from-source fallback would compile on top of.
// It answers `deferred` for a valid entry whose imports are not registered yet, which is
// NOT a miss: the caller retries it in the same fixpoint loop that orders from-source loads.
static CacheRead cache_load_entry(const std::string &stem, const std::string &what,
                                  const std::string &kind, const std::string &label,
                                  const std::string &extra, bool sources_required,
                                  std::vector<std::string> &modules,
                                  std::vector<std::string> &inits) {
  if (stem.empty()) {
    vsay("cache: unavailable (no writable location, or cannot identify this binary)");
    return CacheRead::Miss;
  }
  // The stamp is the completeness witness, so all three of "no entry yet", "written by a
  // different binary", and "a torn write" arrive here as one condition.  They are narrated
  // apart because "recompiled, and here is why" is a spec requirement, and a stale entry is
  // the interesting case: it means the compiler moved.
  std::string stamp = read_file(stem + ".stamp");
  if (stamp.empty()) {
    vsay("cache: no entry for " + what + ", compiling it");
    return CacheRead::Miss;
  }
  if (stamp != cache_stamp_text(kind, label, extra)) {
    vsay("cache: entry for " + what + " is stale (changed compiler or entry format), recompiling");
    return CacheRead::Miss;
  }
  if (sources_required && !sources_still_match(read_file(stem + ".sources"))) {
    vsay("cache: source changed for " + what + ", recompiling");
    return CacheRead::Miss;
  }
  std::string joined = read_file(stem + ".ll");
  std::string meta   = read_file(stem + ".meta");
  if (joined.empty() || meta.empty()) {
    vsay("cache: entry for " + what + " incomplete, recompiling");
    return CacheRead::Miss;
  }
  // Does the IR still look like the unit modules it claims to be?  A stamp says the entry
  // was written whole by this compiler; it says nothing about the file's CONTENT having
  // survived since -- a truncation, an editor, a half-restored backup.  Every unit module
  // defines its own initializer, so requiring that of each part is a cheap structural check
  // that rejects garbage without parsing IR, and it runs BEFORE mode 14 so a rejected entry
  // leaves the session untouched (spec: refused whole, not half-registered).
  std::vector<std::string> mods;
  split_modules(joined, mods);
  for (const std::string &m : mods) {
    if (m.find(":__init\"") == std::string::npos) {
      vsay("cache: entry for " + what + " is not the IR it claims to be, recompiling");
      return CacheRead::Miss;
    }
  }

  rt_repl_set(14, meta.data(), (intptr_t)meta.size());
  intptr_t r = scheme_entry();
  std::string st = status_of(r);
  if (st == "deferred") return CacheRead::Deferred;    // valid, but not yet: retry later
  if (st != "ok") {
    vsay("cache: entry for " + what + " refused (" + door_msg(scm_str(rt_cdr(r))) +
         "), recompiling");
    return CacheRead::Miss;
  }
  std::istringstream isyms(scm_str(rt_cdr(r)));
  std::string sym;
  std::vector<std::string> got;
  while (std::getline(isyms, sym)) if (!sym.empty()) got.push_back(sym);

  // The metadata and the modules are stored together and must describe each other; if they
  // do not, the entry is inconsistent and is refused rather than half-applied.
  if (mods.size() != got.size()) {
    vsay("cache: entry for " + what + " inconsistent (modules/inits disagree), recompiling");
    return CacheRead::Miss;
  }
  modules = mods;
  inits = got;
  vsay("cache: " + what + " reused from " + stem + ".ll");
  return CacheRead::Hit;
}

// Persist what was just compiled.  Best-effort throughout: a failure anywhere leaves the
// process correct and merely uncached.
//
// `keys` selects which registered libraries the metadata describes -- empty for the whole
// baked set (mode 15's "" case, in dependency order), otherwise the unit keys of the modules
// being written, in the same order.  `sources` is the `.sources` text for a disk-sourced
// entry and empty for the baked set.
static void cache_store_entry(const std::string &stem, const std::string &what,
                              const std::string &kind, const std::string &label,
                              const std::string &extra,
                              const std::string &keys,
                              const std::string &sources,
                              const std::vector<std::string> &modules) {
  if (stem.empty()) return;
  rt_repl_set(15, keys.data(), (intptr_t)keys.size());
  intptr_t r = scheme_entry();
  if (status_of(r) != "ok") return;
  std::string meta = scm_str(rt_cdr(r));
  std::string joined;
  for (size_t i = 0; i < modules.size(); i++) {
    if (i) joined += kBoundary;
    joined += modules[i];
  }
  // Stamp LAST: it is the completeness witness the reader checks first.
  if (!cache_write_atomic(stem + ".ll", joined)) return;
  if (!cache_write_atomic(stem + ".meta", meta)) return;
  if (!sources.empty() && !cache_write_atomic(stem + ".sources", sources)) return;
  if (!cache_write_atomic(stem + ".stamp", cache_stamp_text(kind, label, extra))) return;
  vsay("cache: " + what + " stored -> " + stem + ".ll");
}

// The baked set is stored in dependency order and registers before anything else, so a
// `deferred` answer is impossible here; it is folded into "miss" rather than given a branch
// that could never be taken.
static bool cache_load_baked_set(std::vector<std::string> &modules,
                                 std::vector<std::string> &inits) {
  if (cache_bypassed_for_dump()) return false;
  return cache_load_entry(cache_stem(), "baked set", "baked", "", "",
                          /*sources_required=*/false, modules, inits) == CacheRead::Hit;
}

static void cache_store_baked_set(const std::vector<std::string> &modules) {
  cache_store_entry(cache_stem(), "baked set", "baked", "", "",
                    /*keys=*/"", /*sources=*/"", modules);
}

// --- one library unit, compiled from disk (change: chez-free-unit-pipeline) ---
// The half of the cache `baked-set-artifact-cache` deferred: a manifest library is
// recompiled by every process that imports it, and unlike the baked set its source is on
// disk, so the key needs a source half (design D5).
//
// Registration goes through mode 14 exactly as the baked set's does, which is why a hit and
// a compile leave the same session behind.  A `deferred` status is passed back to the
// caller, whose fixpoint loop retries the library once its dependencies are in: the entry
// is valid, it is simply too early to apply it.
static CacheRead cache_load_unit(const std::string &key, const std::string &path,
                                 std::string &ir, std::string &init) {
  if (cache_bypassed_for_dump()) return CacheRead::Miss;
  std::string src_key = source_key_of(path);
  std::vector<std::string> modules, inits;
  CacheRead r = cache_load_entry(cache_entry_stem("unit", key, src_key), "library " + key,
                                 "unit", key, src_key,
                                 /*sources_required=*/true, modules, inits);
  if (r != CacheRead::Hit) return r;
  if (modules.size() != 1) return CacheRead::Miss;  // a unit entry holds exactly one module
  ir = modules[0];
  init = inits[0];
  return CacheRead::Hit;
}

// The source files the compiler just read for a library (mode 16): its own source plus its
// include closure.  Empty when the door submitted source with no path, in which case there
// is nothing to key an entry on and the caller must not cache.
static std::vector<std::string> library_sources_just_read() {
  std::vector<std::string> out;
  rt_repl_set(16, "", 0);
  intptr_t r = scheme_entry();
  if (status_of(r) != "ok") return out;
  std::istringstream lines(scm_str(rt_cdr(r)));
  std::string p;
  while (std::getline(lines, p)) if (!p.empty()) out.push_back(p);
  return out;
}

// Persist a library unit just compiled into this session.  Called immediately after mode 4
// returned `ok`, while mode 16 still describes THIS library's read.
static void cache_store_unit(const std::string &key, const std::string &path,
                             const std::string &ir) {
  if (cache_bypassed_for_dump()) return;
  std::string stem = cache_entry_stem("unit", key, source_key_of(path));
  if (stem.empty()) return;
  std::vector<std::string> sources = library_sources_just_read();
  if (sources.empty()) return;
  std::string manifest_text = sources_manifest(sources);
  if (manifest_text.empty()) return;               // a source we cannot read: do not key on it
  std::vector<std::string> modules;
  modules.push_back(ir);
  cache_store_entry(stem, "library " + key, "unit", key, source_key_of(path),
                    /*keys=*/key + "\n", manifest_text, modules);
}

// Register the baked library set (mode 8) into the current session and return its modules
// and their initializer symbols, positionally paired.
//
// The baked set is a PARTITION, so mode 8 returns one module per member in dependency
// order, joined by the boundary marker -- they cannot share an LLVM module (change:
// scheme-base-partition).  Split them into separate entries: every consumer of `modules`
// (the JIT's addIRModule, --emit's stdout, `emit build`'s clang inputs) needs one module
// per element.  `inits` gets one __init symbol per module, in the same order, for a door
// with no program entry to drive them -- the REPL (change: baked-set-on-every-door).
//
// A valid cache entry short-circuits the whole thing (change: baked-set-artifact-cache):
// the session is seeded by mode 14 instead of mode 8, which is the same registration by a
// different route, so nothing downstream can tell which one ran.  On any miss this falls
// through to compiling and then stores the result for the next process.
static bool register_baked_set(std::vector<std::string> &modules,
                               std::vector<std::string> &inits) {
  if (cache_load_baked_set(modules, inits)) return true;
  rt_repl_set(8, "", 0);
  intptr_t r = scheme_entry();
  if (status_of(r) != "ok") {
    std::cerr << "emit: (scheme base): " << door_msg(scm_str(rt_cdr(r))) << "\n";
    return false;
  }
  std::string baked = scm_str(rt_car(rt_cdr(r)));
  split_modules(baked, modules);

  std::istringstream isyms(scm_str(rt_cdr(rt_cdr(r))));
  std::string sym;
  while (std::getline(isyms, sym))
    if (!sym.empty()) inits.push_back(sym);
  cache_store_baked_set(modules);
  return true;
}

// Seed a compile session: init-session, register the baked library set, and preload the
// libraries the source imports.  The front half of every door that compiles from a
// manifest -- `emit run`, `emit build`, and `emit lib` -- so that all of them resolve
// imports against the same environment (change: baked-set-on-every-door; `emit lib` used
// to run its export-table mode against an unseeded session, which is why a library
// importing `(scheme base)` failed there).  GC must be initialized and EMIT_NO_PRELUDE set
// by the caller before this runs.
//
// `module_keys` is filled in step with `modules`: the canonical unit key of each module, so
// a door holding the IR can still say which library it is.  `emit build`'s tree-shake needs
// that (change: chez-free-unit-pipeline) -- for the baked members it is read back out of the
// __init symbols, which carry the unit prefix ("scheme.base:__init"), rather than being
// tracked separately and risking a second source of truth.
static bool seed_session(const std::string &prog_src, const std::vector<std::string> &manifests,
                         bool no_prelude, std::vector<std::string> &modules,
                         std::vector<std::string> &module_keys,
                         const std::string &source_home) {
  rt_repl_set(no_prelude ? 0 : 1, "", 0);    // init-session
  scheme_entry();
  modules.clear();
  module_keys.clear();

  if (!no_prelude) {
    std::vector<std::string> inits;           // the program's entry runs these; used here
    if (!register_baked_set(modules, inits)) return false;   // for the keys they name
    // "scheme.base:__init" -> "scheme.base:".  The key INCLUDES the colon, because the key
    // is `(mangle name "")` -- the unit prefix a symbol carries, separator and all -- which
    // is what mode 9 hands the host for a manifest library and what mode 17 matches on.
    for (const std::string &sym : inits)
      module_keys.push_back(sym.substr(0, sym.find(':') + 1));
  }
  return preload_user_libraries(manifests, modules, module_keys, prog_src, source_home);
}

// Compile a whole program (or a lone define-library) against the seeded session (mode 7).
// On success fills `prog_ir` and returns true; `is_library` is set when the source was a
// lone define-library (then `modules` is cleared and `prog_ir` is that single unit).
static bool compile_unit(const std::string &prog_src, std::vector<std::string> &modules,
                         std::vector<std::string> &module_keys,
                         std::string &prog_ir, bool &is_library,
                         const std::string &source_home) {
  set_source_home(source_home);
  rt_repl_set(7, prog_src.data(), (intptr_t)prog_src.size());   // compile program
  intptr_t pr = scheme_entry();
  std::string pst = status_of(pr);
  if (pst != "ok" && pst != "library") {
    std::cerr << "emit: " << door_msg(scm_str(rt_cdr(pr))) << "\n";
    return false;
  }
  prog_ir = scm_str(rt_car(rt_cdr(pr)));
  is_library = (pst == "library");
  // A lone define-library compiles to a single unit with no baked (scheme base) and
  // no program entry: drop the base/units set up for the program case.
  if (is_library) { modules.clear(); module_keys.clear(); }
  return true;
}

// --- the ship door's tree-shake (change: chez-free-unit-pipeline, design D9) ---
// Replace each prunable unit with one pruned to what this program's IR actually reaches.
// The Chez driver has done this since aot-release-profile; `emit build` did not, and shipped
// 212 KB where the driver shipped 94 KB for the same hello-world, with the extra IR costing
// LTO time as well as bytes (docs/PERFORMANCE.md P8).
//
// The core decides everything that needs the import graph or the export tables -- which
// units are prunable, what the roots are, what the pruned unit is (mode 17).  This function
// is the door's half: which module goes with which library, where a library's source is, and
// the cache.
//
// A pruned unit is CACHED under its own kind, keyed additionally by a digest of the program
// IR (design D9, refined during implementation).  The entry has to be findable before the
// roots are known -- computing them is most of the work being avoided -- and the program's
// emitted IR is what determines them: same IR, same roots, necessarily.  It is a coarser key
// than the root set itself (two programs with identical roots do not share an entry) and an
// exactly sufficient one for the case that matters, rebuilding a program that has not
// changed.  Emitted IR is already required to be byte-identical for unchanged input, which
// is what makes it usable as a key at all.
//
// Best-effort throughout: a library whose source cannot be found, a mode-17 error, an
// unwritable cache -- each leaves that unit whole, which is always sound.
static void shake_units(std::vector<std::string> &modules,
                        const std::vector<std::string> &module_keys,
                        const std::string &prog_ir,
                        const std::map<std::string, std::string> &path_of) {
  if (modules.size() != module_keys.size()) return;      // paranoia: never shake blind
  std::string prog_key = fnv1a_hex(prog_ir);
  for (size_t i = 0; i < modules.size(); i++) {
    const std::string &key = module_keys[i];
    std::map<std::string, std::string>::const_iterator it = path_of.find(key);
    // A baked member has no manifest entry and needs none: its source is compiled into this
    // binary, so mode 17 rebuilds it from *prelude-source* with no source text from us.  A
    // user library needs its .sld read back, because a cache-seeded session never read it.
    std::string sld = (it == path_of.end()) ? std::string() : it->second;
    std::string src_id = sld.empty() ? std::string("baked") : source_key_of(sld);

    std::vector<std::string> got, inits;
    if (cache_load_entry(cache_entry_stem("shake", key, src_id + "-" + prog_key),
                         "pruned " + key, "shake", key, src_id + "-" + prog_key,
                         /*sources_required=*/!sld.empty(), got, inits) == CacheRead::Hit &&
        got.size() == 1) {
      modules[i] = got[0];
      continue;
    }

    // Mode 17's input: KEY, the library's source (empty for a baked member), the boundary,
    // then the program IR the roots are read out of.  The source home must be the .sld, as
    // it is when the preload compiles one: the pruned recompile re-runs the library's
    // `include` declarations, which resolve beside their own file.
    if (!sld.empty()) set_source_home(sld);
    std::string input = key + "\n";
    if (!sld.empty()) input += read_file(sld);
    input += kBoundary;
    input += prog_ir;
    rt_repl_set(17, input.data(), (intptr_t)input.size());
    intptr_t r = scheme_entry();
    std::string st = status_of(r);
    if (st == "keep") {
      // Sound and expected, not a failure: a unit another unit imports must stay whole, or
      // that importer could reference a binding this one dropped.  It is why `(emit
      // internal)` survives intact, and why a program importing a user library that imports
      // `(scheme base)` shakes only the user library.
      vsay("shake: " + key + " kept whole (another unit imports it)");
      continue;
    }
    if (st != "ok") {
      vsay("shake: " + key + " kept whole (" + door_msg(scm_str(rt_cdr(r))) + ")");
      continue;
    }
    std::string pruned = scm_str(rt_car(rt_cdr(r)));
    vsay("shake: " + key + "  [" + std::to_string(modules[i].size()) + " -> " +
         std::to_string(pruned.size()) + " bytes]");
    modules[i] = pruned;

    // The pruned recompile read this library's whole source closure (mode 17 resets the
    // record first), so the entry keys on the same files a full unit entry would.
    std::string sources = sld.empty() ? std::string()
                                      : sources_manifest(library_sources_just_read());
    if (!sld.empty() && sources.empty()) continue;       // unreadable source: do not cache
    std::vector<std::string> one;
    one.push_back(pruned);
    cache_store_entry(cache_entry_stem("shake", key, src_id + "-" + prog_key),
                      "pruned " + key, "shake", key, src_id + "-" + prog_key,
                      /*keys=*/key + "\n", sources, one);
  }
}

// The manifest chain's library key -> source path map, for a door that needs to find a
// library's source again after the session was seeded (the shake, when a cache hit meant the
// .sld was never read).
static std::map<std::string, std::string>
library_paths_by_key(const std::vector<std::string> &manifests) {
  std::map<std::string, std::string> path_of, from_of;
  manifest_library_index(manifests, path_of, from_of);
  return path_of;
}

// Compile a whole program (or a lone define-library) to its unit modules + program
// IR, in-process -- the shared front half of `emit run`, `emit run --emit`, and
// `emit build` (spec: no second compilation path).  Seed, then compile: the same mode
// sequence in the same order as before it was split, so the emitted IR does not move.
static bool compile_program(const std::string &prog_src, const std::vector<std::string> &manifests,
                            bool no_prelude, std::vector<std::string> &modules,
                            std::vector<std::string> &module_keys,
                            std::string &prog_ir, bool &is_library,
                            const std::string &source_home) {
  if (!seed_session(prog_src, manifests, no_prelude, modules, module_keys, source_home))
    return false;
  return compile_unit(prog_src, modules, module_keys, prog_ir, is_library, source_home);
}

static int emit_run(int argc, char **argv) {
  bool emit = false;
  bool no_prelude = false;
  bool dump = false, dump_all = false;
  bool resolve = false;                        // --resolve-program: print an entry, no run
  std::string resolve_name;                    // "" => select the sole program entry
  std::string manifest;
  std::string prog_file;                       // positional FILE (else stdin)
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (is_help_flag(a)) { usage_run(std::cout); return 0; }
    else if (a == "--emit") emit = true;
    else if (is_dump_flag(a, dump, dump_all)) { }
    else if (a == "--no-prelude") no_prelude = true;
    else if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
    else if (a == "--resolve-program") {
      resolve = true;
      if (i + 1 < argc && argv[i + 1][0] != '-') resolve_name = argv[++i];
    }
    else if (!a.empty() && a[0] != '-') prog_file = a;   // program source FILE
    else { std::cerr << "emit run: unknown option " << a << "\n"; return 2; }
  }
  // Manifest resolution: the shared ordered lookup (change: manifest-search-path),
  // now a chain over the searched candidates (change: installed-emit-completeness).
  bool bad_manifest = false;
  std::vector<std::string> manifests = resolve_manifests(manifest, bad_manifest);
  if (bad_manifest) return 1;
  say_manifest(manifests);

  // --resolve-program NAME: resolve a manifest program entry and print its source +
  // output (source line, then output line).  Chez-free; never reads stdin or runs.
  if (resolve) {
    GC_INIT();
    rt_repl_set(0, "", 0);                     // init-session (no prelude needed)
    scheme_entry();
    std::string src, out;
    if (resolve_program(first_manifest(manifests), resolve_name, src, out)) return 1;
    std::cout << src << "\n" << out << "\n";
    return 0;
  }

  // Forward --no-prelude to the embedded compiler (read via %no-prelude?): skip
  // baking/implying (scheme base).  Must be set before any scheme_entry() call.
  if (no_prelude) setenv("EMIT_NO_PRELUDE", "1", 1);
  forward_dump_level(dump, dump_all);

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

  std::vector<std::string> modules, module_keys;
  std::string prog_ir;
  bool is_library = false;
  if (!compile_program(prog_src, manifests, no_prelude, modules, module_keys, prog_ir,
                       is_library, prog_file))
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
    // Report the program's final value -- the observation channel much of the
    // core-language spec is written against -- EXCEPT when it is the unspecified
    // value, which prints nothing at all: no written form, no newline (change:
    // emit-cli-front-door, design D4).  That is the REPL's rule (run_thunk below)
    // stated for programs, so a form that is quiet at the prompt is quiet as a
    // program's last form.  The guard lives here and NOT in rt_write, so an explicit
    // (write (if #f #f)) still renders #<unspecified>; #f and () are legitimate final
    // values and still print, which is why the unspecified value must stay distinct
    // from both.  The identical guard is in the runtime's own main
    // (src/runtime/runtime.c), so this door and a delivered executable remain
    // byte-identical on stdout (design D5).
    if (!rt_is_unspec(r)) {
      rt_write(r);
      std::printf("\n");
    }
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
    // Echo suppression (change: unspecified-value, decision 6): a form whose result is
    // THE unspecified value prints nothing at all -- no value, no newline -- so
    // side-effecting forms stay quiet at the prompt, as in Chez's waiter and Racket's
    // REPL.  This is a REPL DISPLAY policy, not a property of the value: the guard lives
    // here and NOT in print_val, so an explicit (write (if #f #f)) still prints
    // #<unspecified>.  Only the unspecified value is suppressed -- #f and () are
    // legitimate results and still echo, which is why the value must be distinct from
    // both.  emit_run above and the runtime's main apply the SAME rule to a whole
    // program's final value (change: emit-cli-front-door): the two doors agree, which
    // is the dev->ship fidelity the batch report existed to protect -- what changed is
    // only what they agree on.
    if (!rt_is_unspec(r)) {
      rt_write(r);
      std::printf("\n");
      std::fflush(stdout);
    }
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

// Preload every USER library named in the manifest CHAIN into the shared JITDylib (change:
// module-artifacts-vertical-slice; transitive imports: module-generalize).  Mode 9 turns
// each manifest's text into a "KEY<TAB>PATH" index of the libraries that are not baked
// members; mode 4 compiles each unit and returns (ok . (ir . init-symbol)).  Iterated to a
// fixpoint (topological load order).
//
// The UNION of the chain, not just the first manifest (design D7).  A session is an
// open world where the user may import anything at any prompt, so an installed REPL
// must have the full standard surface even when the project's own manifest names none
// of it -- otherwise `(import (scheme file))` failing at the prompt would reintroduce
// issue #44 one layer up.  The lazy doors need no such decision: an unresolved name
// simply walks to the next manifest there.
//
// ONE INDEX FOR EVERY MANIFEST AND EVERY DOOR (change: chez-free-unit-pipeline, design D1;
// issue #101).  The first manifest used to come through mode 5 -- every library entry,
// baked members included -- while the rest came through mode 9, and the difference was the
// standard library: with `--no-prelude` nothing registers the baked set, so this loop
// compiled `(scheme base)` from the manifest and bound none of it.  1.14 s of work performed
// and discarded, against a 0.024 s floor.  Mode 9 omits every baked member (not just
// `(scheme base)`: the substrate leaked through the same hole), which is what the run door
// has always used, so the two doors now seed identically.
//
// The preload stays EAGER -- what changed is which entries are preloaded, not when.  Under
// `--no-prelude` a manifest library that imports a baked member therefore no longer
// resolves; that is the run door's behaviour since run-door-user-libraries, and it is
// reported below as an unresolved import rather than silently satisfied by a standard
// library the session deliberately does not have (design D4).
static void preload_libraries(const std::vector<std::string> &manifests, bool have_baked) {
  if (manifests.empty()) return;             // no manifest: no libraries this session

  std::map<std::string, std::string> path_of, from_of;
  manifest_library_index(manifests, path_of, from_of);
  // A CHAIN needs NAMES, so that a library an earlier manifest already supplies is not
  // loaded a second time from a later one; mode 9's index is both that and the paths to
  // load.  A name a LATER manifest supplied is the chain reaching outward, which is named
  // rather than silent (design D8); the first manifest is the session's own and is already
  // reported by say_manifest.
  std::vector<std::pair<std::string, std::string>> pending;   // (key, path)
  std::map<std::string, std::vector<std::string>> supplied;   // manifest -> keys
  for (std::map<std::string, std::string>::const_iterator it = path_of.begin();
       it != path_of.end(); ++it) {
    pending.push_back(std::make_pair(it->first, it->second));
    std::map<std::string, std::string>::const_iterator f = from_of.find(it->first);
    if (f != from_of.end()) supplied[f->second].push_back(it->first);
  }
  for (size_t mi = 1; mi < manifests.size(); mi++)
    say_chained(manifests[mi], supplied[manifests[mi]]);

  while (!pending.empty()) {
    std::vector<std::pair<std::string, std::string>> deferred;
    bool progress = false;
    for (const std::pair<std::string, std::string> &kp : pending) {
      const std::string &key = kp.first;
      const std::string &p = kp.second;
      // The same cache the run door reads (change: chez-free-unit-pipeline).  This door
      // benefits most: it preloads EVERY user library on the manifest, so a session paid for
      // all of them on every start -- 0.138 s for this repository's four non-baked
      // libraries, on top of the standard library the cache already covers.
      std::string cached_ir, cached_init;
      CacheRead cr = cache_load_unit(key, p, cached_ir, cached_init);
      if (cr == CacheRead::Deferred) { deferred.push_back(kp); continue; }
      if (cr == CacheRead::Hit) {
        std::string err;
        if (!add_ir(cached_ir, "<repl>", err))
          std::cerr << "error: library add " << p << ": " << err << "\n";
        else
          run_init(cached_init);
        progress = true;
        continue;
      }
      std::string src = read_file(p);
      // Unreadable or empty: report and keep the session (see the run door's note above --
      // handing "" to mode 4 traps uncatchably).  The REPL preloads EAGERLY, so a manifest
      // entry the session never imports still reaches this, which is why a typo'd path used
      // to abort `emit repl` at startup rather than at the import.
      if (src.empty()) {
        std::cerr << "error: cannot read library source " << p << " (named in the manifest)\n";
        progress = true;                     // drop it; do not retry an unreadable file
        continue;
      }
      set_source_home(p);                    // includes resolve beside the .sld
      rt_repl_set(4, src.data(), (intptr_t)src.size());
      intptr_t r = scheme_entry();
      std::string st = status_of(r);
      if (st == "deferred") { deferred.push_back(kp); continue; }
      // Already registered -- a manifest entry naming a member of the baked set, which this
      // repository's own emit-libs.scm has (the Chez driver resolves them from there).  The
      // baked member wins and this contributes no second module; adding one would collide in
      // the JIT.  The REPL only began seeing this status once it registered the baked set
      // before preloading (change: baked-set-on-every-door); the run door's own preload has
      // handled it since run-door-user-libraries.
      if (st == "already") { progress = true; continue; }
      if (st != "ok") {
        std::cerr << "error: loading library " << p << ": " << door_msg(scm_str(rt_cdr(r))) << "\n";
        progress = true;                     // drop it; do not retry a hard error
        continue;
      }
      intptr_t payload = rt_cdr(r);          // (ir . init-symbol)
      std::string ir = scm_str(rt_car(payload));
      std::string init = scm_str(rt_cdr(payload));
      std::string err;
      if (!add_ir(ir, "<repl>", err)) { std::cerr << "error: library add " << p << ": " << err << "\n"; }
      else run_init(init);
      // While mode 16 still describes THIS library's read.
      cache_store_unit(key, p, ir);
      progress = true;
    }
    if (!progress) {                         // every remaining unit is stuck
      // Under --no-prelude that is not a fault, and must not be reported as one: the
      // session deliberately has no standard library, so every manifest library standing on
      // one is unloadable BY REQUEST (change: chez-free-unit-pipeline, design D4).  One
      // line naming them beats an error apiece blaming the manifest for a dependency the
      // flag removed.  This became reachable when the preload stopped supplying
      // (scheme base) from the manifest -- before, such a library resolved by accident, in
      // a session where the user could not name those procedures themselves.
      if (!have_baked) {
        std::string names;
        for (const std::pair<std::string, std::string> &kp : deferred)
          names += (names.empty() ? "" : ", ") + kp.first;
        say(std::to_string(deferred.size()) +
            " manifest librar" + (deferred.size() == 1 ? "y" : "ies") +
            " not loaded under --no-prelude (they import the standard library): " + names);
        break;
      }
      for (const std::pair<std::string, std::string> &kp : deferred)
        std::cerr << "error: library " << kp.second
                  << ": unresolved or cyclic import (dependency missing from manifest?)\n";
      break;
    }
    pending.swap(deferred);
  }
}

// Compile one complete form's text via the embedded compiler and act on the
// (status . payload) it returns.
//
// THE COMPILE CALL IS TRAP-BRACKETED, and it was not (change: host-runtime-corrections,
// issue #97).  `run_thunk` isolates the RUN of a compiled form and clears `rt_trap` when it
// finishes, so the next form's COMPILE ran with no trap frame installed at all -- and a trap
// inside the compiler therefore reached `rt_raise`'s `exit(1)` and took the whole session
// with it.  One malformed form was enough:
//
//   > (define-values (x y . z) (values 1 2 3))
//   car: not a pair: got a symbol          <- the frontend's own trap (issue #91)
//   $ echo $?  ->  1                       <- session gone, next form never read
//
// The compiler is compiled Scheme like any other guest code, so it gets the same isolation
// the guest's own code has had since the REPL door existed.  `rt_guard_reset()` for the same
// reason `run_thunk` calls it: a trap may have bypassed rt_run_guarded's frame pop.
//
// A compile-time trap is reported as `error:` rather than `!trap:`: from the session's point
// of view this IS a compile-time failure of the form, which is the channel the other
// compile-time failures below already use.
static void process_form(const std::string &form) {
  jmp_buf jb;
  jmp_buf *saved = rt_trap;
  // ...and the compiler's own raiser is current while the compiler runs, so a trap reaches
  // `compile-one-form`'s guard -- whose handler RESTORES THE SESSION SNAPSHOT (repl-core.ss,
  // design D3).  Without it the trap walks the JIT'd session's empty chain instead, and a
  // form that failed mid-compile leaves its partial mutations behind.  The setjmp below
  // stays as the backstop for a trap raised where the compiler installed no guard.
  intptr_t raiser = rt_raiser_enter_host();
  rt_trap = &jb;
  if (setjmp(jb) != 0) {
    rt_guard_reset();
    rt_raiser_leave_host(raiser);
    rt_trap = saved;
    std::cerr << "error: compiler trap: " << rt_trap_msg << "\n";
    return;
  }
  rt_repl_set(3, form.data(), (intptr_t)form.size());
  intptr_t r = scheme_entry();
  rt_raiser_leave_host(raiser);
  rt_trap = saved;
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
  bool dump = false, dump_all = false;
  std::string manifest;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (is_help_flag(a)) { usage_repl(std::cout); return 0; }
    else if (a == "--no-prelude") prelude = false;
    else if (is_dump_flag(a, dump, dump_all)) { }
    else if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
    // The rejection arm the other three doors already had (design D3).  Without it
    // `emit repl --bogus-flag` started a session and exited 0, so a typo'd flag was
    // indistinguishable from one that worked.  `repl` takes no positional argument,
    // so anything unrecognized -- dashed or not -- is an error here.
    else { std::cerr << "emit repl: unknown option " << a
                     << " (emit repl takes no positional argument)\n"; return 2; }
  }
  bool bad_manifest = false;
  std::vector<std::string> manifests = resolve_manifests(manifest, bad_manifest);
  if (bad_manifest) return 1;
  // Per-form stage dumps for the whole session (change: emit-dump-stages).
  forward_dump_level(dump, dump_all);

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

  // Register the BAKED library set, exactly as the run and build doors do (mode 8), so a
  // session's standard library does not depend on the manifest -- or on the directory the
  // session was started in.  Before this, the REPL resolved (scheme base) from the manifest
  // (eager preload of every entry), so `emit repl` in a user project directory had NO
  // standard library at all and could not even load a project library that imports
  // (scheme base) (change: baked-set-on-every-door, issue #39).
  //
  // Registration comes BEFORE the manifest preload, which no longer offers a baked member
  // at all: the preload's index (mode 9) omits every one of them (change:
  // chez-free-unit-pipeline).  The already-loaded guard in repl-load-library-text remains as
  // a backstop for an interactive `(import (scheme base))`.
  //
  // A session has no program @scheme_entry to drive the __inits, so the host runs them
  // itself: every module is added first (a member's initializer reads globals defined by the
  // members it imports), then each __init once, in the dependency order mode 8 returned.
  if (prelude) {
    std::vector<std::string> baked_modules, baked_inits;
    if (!register_baked_set(baked_modules, baked_inits)) return 1;
    for (const std::string &m : baked_modules) {
      std::string err;
      if (!add_ir(m, "<baked>", err)) {
        std::cerr << "fatal: baked library add: " << err << "\n";
        return 1;
      }
    }
    for (const std::string &sym : baked_inits) {
      // "scheme.base:__init" -> "scheme.base", the canonical unit prefix, for narration.
      std::string who = sym.substr(0, sym.find(':'));
      if (!run_init(sym)) {
        std::cerr << "fatal: baked library init: " << who << "\n";
        return 1;
      }
      vsay("register baked library " + who);
    }
  }

  // Preload manifest libraries so interactive (import (L)) forms can resolve them.
  say_manifest(manifests);
  preload_libraries(manifests, /*have_baked=*/prelude);

  // The prelude's procedures live in the now-registered (scheme base) library;
  // auto-import it into the session scope (mode 6) so later forms resolve prelude
  // names to it -- unless --no-prelude.
  if (prelude) {
    rt_repl_set(6, "", 0);
    intptr_t r = scheme_entry();
    if (status_of(r) != "ok")
      std::cerr << "warning: auto-import (scheme base): " << scm_str(rt_cdr(r)) << "\n";
  }

  std::cerr << "Emit (embedded compiler, ORC/LLJIT).  ^D to exit.\n";

  // Accumulate stdin and drive the compiler.  After each line, ask the compiler
  // (form-complete?) whether the buffer starts with a complete form; when it does,
  // slice it off, compile+run it, and keep draining further complete forms.
  std::string buf, line;
  std::cerr << "> " << std::flush;
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
      // `code` is a CODEPOINT count; this buffer is bytes (see byte_offset_of_codepoint).
      size_t cut = byte_offset_of_codepoint(buf, (size_t)code);
      std::string form = buf.substr(0, cut);
      buf.erase(0, cut);
      process_form(form);
      if (buf.find_first_not_of(" \t\r\n") == std::string::npos) { buf.clear(); break; }
    }
    std::cerr << "> " << std::flush;
  }
  std::cerr << "\n";
  return 0;
}

// ===========================================================================
// build / lib doors -- emit IR in-process, then fork clang (was bin/scheme-compile,
// bin/emit).
// ===========================================================================

// The toolchain THIS BINARY WAS BUILT AGAINST, recorded by the Makefile the way
// EMIT_PREFIX already is (change: installed-emit-completeness; issue #36).  Empty
// when the build did not resolve one, which makes the layer simply not apply.
#ifndef EMIT_DEFAULT_CC
#define EMIT_DEFAULT_CC ""
#endif
#ifndef EMIT_DEFAULT_GC_INC
#define EMIT_DEFAULT_GC_INC ""
#endif
#ifndef EMIT_DEFAULT_GC_LIB
#define EMIT_DEFAULT_GC_LIB ""
#endif

struct Toolchain {
  std::string cc, gc_inc, gc_lib;
  // The values that came from the compiled-in build-time defaults, as "K=V" pairs, so
  // a link failure can say WHERE a stale path came from rather than leaving the user
  // with clang's own error (spec: "a stale compiled-in default fails legibly").
  std::string baked;
};

// Discover the C toolchain for the AOT link.  Three layers, highest first (design D6):
//
//   1. explicit env    CC / GC_INC / GC_LIB (+ the EMIT_GC_* mirrors)
//   2. discovery       tools/llvm-env.sh --print-env, located by support_file()
//   3. compiled-in     EMIT_DEFAULT_CC / _GC_INC / _GC_LIB, recorded at build time
//
// Layer 2 keeps discovery single-sourced with the Makefile and the Chez driver
// (design D2), and re-discovers at RUN time, so a user who upgrades LLVM after
// installing Emit is followed rather than stranded.  Layer 3 is the floor for the
// case where discovery finds nothing at all -- notably a keg-only Homebrew LLVM,
// where neither clang nor llvm-config is on PATH.  It is deliberately LAST: a
// recorded path is the stalest information in the system and must never beat a live
// answer.
static bool discover_toolchain(Toolchain &tc) {
  const char *cc = std::getenv("CC");
  const char *gi = std::getenv("GC_INC"); if (!gi) gi = std::getenv("EMIT_GC_INC");
  const char *gl = std::getenv("GC_LIB"); if (!gl) gl = std::getenv("EMIT_GC_LIB");
  std::string ecc, egi, egl;
  std::string script = (cc && gi && gl) ? std::string() : support_file("tools/llvm-env.sh");
  if (!script.empty()) {
    std::string cmd = "'" + script + "' --print-env 2>/dev/null";
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

  // Layer 3, per value: whatever the first two layers left empty.
  struct { std::string *slot; const char *name, *baked; } fallbacks[] = {
    { &tc.cc,     "CC",     EMIT_DEFAULT_CC },
    { &tc.gc_inc, "GC_INC", EMIT_DEFAULT_GC_INC },
    { &tc.gc_lib, "GC_LIB", EMIT_DEFAULT_GC_LIB },
  };
  for (size_t i = 0; i < sizeof fallbacks / sizeof *fallbacks; i++) {
    if (!fallbacks[i].slot->empty() || !*fallbacks[i].baked) continue;
    *fallbacks[i].slot = fallbacks[i].baked;
    if (!tc.baked.empty()) tc.baked += " ";
    tc.baked += std::string(fallbacks[i].name) + "=" + fallbacks[i].baked;
  }
  if (!tc.baked.empty())
    vsay("toolchain " + tc.baked + "  [this binary's build-time default]");

  if (tc.cc.empty() || tc.gc_inc.empty() || tc.gc_lib.empty()) {
    std::cerr << "emit: toolchain discovery failed (need CC / GC_INC / GC_LIB, or a "
                 "working tools/llvm-env.sh)\n";
    if (script.empty())
      std::cerr << "emit: tools/llvm-env.sh not found beside this binary or under "
                << EMIT_PREFIX << "/share/emit\n";
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
  // Link-time optimization (change: cross-unit-direct-calls, design D3).  Each library
  // unit, the program, and runtime.c are separate modules in this link, so without it
  // the optimizer never crosses a unit boundary and the cross-unit direct calls the
  // emitter now produces cannot be inlined -- measured, the direct call alone and LTO
  // alone each change nothing, while together they are ~7x on a call-heavy probe.  It
  // also shrinks the delivered binary rather than growing it.  Mirrors `ship-lto` in
  // src/compile.ss; the JIT/REPL door is untouched.
  args.push_back("-flto");
  args.push_back("-I" + tc.gc_inc);
  args.push_back("-L" + tc.gc_lib);
  args.push_back(runtime_c);
  for (const std::string &u : unit_files) args.push_back(u);
  args.push_back("-lgc");
  // The runtime's numeric prims (rt_sqrt, rt_atan2, ...) call libm, which is a separate
  // library on glibc; every link line that includes runtime.c needs this.
  args.push_back("-lm");
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
  bool dump = false, dump_all = false;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (is_help_flag(a)) { usage_build(std::cout); return 0; }
    else if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
    else if (a == "-o" && i + 1 < argc) out = argv[++i];
    else if (is_dump_flag(a, dump, dump_all)) { }
    else if (a == "--no-prelude") no_prelude = true;
    else if (!a.empty() && a[0] == '-') { std::cerr << "emit build: unknown option " << a << "\n"; return 2; }
    else name = a;
  }
  bool bad_manifest = false;
  std::vector<std::string> manifests = resolve_manifests(manifest, bad_manifest);
  if (bad_manifest) return 1;
  say_manifest(manifests);

  GC_INIT();
  if (no_prelude) setenv("EMIT_NO_PRELUDE", "1", 1);
  forward_dump_level(dump, dump_all);

  // Resolve the (program NAME) entry to its source + delivered path (Chez-free).
  // The FIRST manifest only: program lookup does not chain (design D4).
  rt_repl_set(0, "", 0);
  scheme_entry();
  std::string src, entry_out;
  if (resolve_program(first_manifest(manifests), name, src, entry_out)) return 1;

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
  std::vector<std::string> modules, module_keys;
  std::string prog_ir;
  bool is_library = false;
  if (!compile_program(prog_src, manifests, no_prelude, modules, module_keys, prog_ir,
                       is_library, src))
    return 1;

  // Tree-shake: replace each prunable unit with one holding only what this program reaches
  // (change: chez-free-unit-pipeline; docs/PERFORMANCE.md P8).  This is the ship path, so
  // the world is closed; the run and REPL doors keep whole units and are untouched.
  shake_units(modules, module_keys, prog_ir, library_paths_by_key(manifests));

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
  if (!discover_toolchain(tc)) return 1;

  // The C runtime is linked into every delivered executable, so it must be findable
  // from an install as well as from the checkout (design D5).  Report a miss BY NAME:
  // handing clang a path assembled from a wrong root produced its error, not ours.
  std::string runtime_c = support_file("src/runtime/runtime.c");
  if (runtime_c.empty()) {
    std::cerr << "emit build: cannot find src/runtime/runtime.c beside this binary or "
                 "under " << EMIT_PREFIX << "/share/emit\n";
    return 1;
  }

  ensure_parent_dir(out);
  if (!link_clang(tc, runtime_c, unit_files, out)) {
    std::cerr << "emit build: link failed\n";
    // A toolchain value that came from the compiled-in build-time defaults is the
    // stalest thing in the link line: say so, rather than leaving the user with
    // clang's error and no idea the path was recorded when emit was built.
    if (!tc.baked.empty())
      std::cerr << "emit build: " << tc.baked
                << " came from this binary's build-time defaults (discovery found "
                   "none); that toolchain may have moved -- set CC / GC_INC / GC_LIB "
                   "to override\n";
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
  bool dump = false, dump_all = false;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (is_help_flag(a)) { usage_lib(std::cout); return 0; }
    else if (a == "-o" && i + 1 < argc) dir = argv[++i];
    else if (a == "--manifest" && i + 1 < argc) manifest = argv[++i];
    else if (is_dump_flag(a, dump, dump_all)) { }
    else if (!a.empty() && a[0] == '-') { std::cerr << "emit lib: unknown option " << a << "\n"; return 2; }
    else src = a;
  }
  if (src.empty()) {
    // Usage as part of a diagnostic: stderr, non-zero (design D1).
    std::cerr << "emit lib: missing SRC\n";
    usage_lib(std::cerr);
    return 1;
  }
  bool bad_manifest = false;
  std::vector<std::string> manifests = resolve_manifests(manifest, bad_manifest);
  if (bad_manifest) return 1;
  say_manifest(manifests);

  GC_INIT();
  forward_dump_level(dump, dump_all);

  std::string lib_src = read_file(src);
  if (lib_src.empty()) {
    std::cerr << "emit lib: cannot read " << src << "\n";
    return 1;
  }

  // Seed ONCE, then run both modes against that one session.  Both artifacts must come
  // from the same import environment or the export table could describe a different
  // resolution than the unit IR does -- and the export-table mode needs the environment at
  // all: seeded only afterwards (by compile_program), it saw no imports, so any library
  // declaring `(import (scheme base))` failed with `unbound variable map`
  // (change: baked-set-on-every-door).
  std::vector<std::string> modules, module_keys;
  if (!seed_session(lib_src, manifests, /*no_prelude=*/false, modules, module_keys, src))
    return 1;

  // .exports table + the library's basename (mode 11: (ok . "<basename>\n<datum>")).
  // The home is re-set because seeding submitted other sources in between.
  set_source_home(src);
  rt_repl_set(11, lib_src.data(), (intptr_t)lib_src.size());
  intptr_t er = scheme_entry();
  if (status_of(er) != "ok") {
    std::cerr << "emit lib: " << door_msg(scm_str(rt_cdr(er))) << "\n";
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
  // a lone define-library compiles to one unit with no baked (scheme base).  This reuses
  // the session seeded above rather than re-seeding, which is the point: re-seeding is what
  // used to discard the registration mode 11 needed.
  std::string prog_ir;
  bool is_library = false;
  if (!compile_unit(lib_src, modules, module_keys, prog_ir, is_library, src)) return 1;
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

// Print VERB's own usage to OS; false when VERB is not a door.
static bool usage_for_verb(const std::string &verb, std::ostream &os) {
  if      (verb == "run")   usage_run(os);
  else if (verb == "repl")  usage_repl(os);
  else if (verb == "build") usage_build(os);
  else if (verb == "lib")   usage_lib(os);
  else return false;
  return true;
}

int main(int argc, char **argv) {
  g_argv0 = argc > 0 ? argv[0] : "emit";
  init_verbosity();
  if (argc < 2) {
    std::cerr << "emit: missing verb (known verbs: lib, build, run, repl)\n";
    usage(std::cerr);
    return 1;
  }
  std::string verb(argv[1]);
  // Help before dispatch, so `--help` is never reported as an unknown verb.  It is a
  // request, so the answer goes to stdout and the exit is 0 (design D1).  `emit help
  // [VERB]` is the same answer spelled as a word, for the user who types what they
  // want before reading about flags (design open question 1, resolved yes).
  if (is_help_flag(verb) || verb == "help") {
    std::string topic = (verb == "help" && argc > 2) ? std::string(argv[2]) : std::string();
    if (topic.empty()) { usage(std::cout); return 0; }
    if (usage_for_verb(topic, std::cout)) return 0;
    std::cerr << "emit help: unknown verb '" << topic << "' (known verbs: lib, build, run, repl)\n";
    usage(std::cerr);
    return 2;
  }
  // Hand the verb its own argv slice (argv[0] == verb, options follow), matching the
  // per-door argument loops.
  if (verb == "run")   return emit_run(argc - 1, argv + 1);
  if (verb == "repl")  return emit_repl(argc - 1, argv + 1);
  if (verb == "build") return emit_build(argc - 1, argv + 1);
  if (verb == "lib")   return emit_lib(argc - 1, argv + 1);
  std::cerr << "emit: unknown verb '" << verb << "' (known verbs: lib, build, run, repl)\n";
  usage(std::cerr);
  return 2;
}
