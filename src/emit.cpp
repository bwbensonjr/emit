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
// The REPL host deliberately stays EAGER (mode 5): a session is an open world where
// the user may import anything at any prompt, so everything on the manifest must
// already be loaded.  Only this door, compiling one known program, can be lazy.
static bool preload_user_libraries(const std::vector<std::string> &manifests,
                                   std::vector<std::string> &modules,
                                   const std::string &program_src,
                                   const std::string &program_home) {
  if (manifests.empty()) return true;        // no manifest: no user libraries

  // Index the whole chain, FIRST MANIFEST WINS per library name (design D3): a
  // project's ./emit-libs.scm extends the installed one rather than replacing it, and
  // may override a shipped library by naming it.  Each entry's relative (source ...)
  // is resolved against ITS OWN manifest's directory -- the rule has not changed, it
  // simply now has more than one manifest to apply to -- so an inherited entry still
  // names the sources that shipped beside it.
  std::map<std::string, std::string> path_of;      // library key -> source path
  std::map<std::string, std::string> from_of;      // key -> manifest, when not the first
  for (size_t mi = 0; mi < manifests.size(); mi++) {
    const std::string &manifest = manifests[mi];
    std::string mtext = read_file(manifest);
    rt_repl_set(9, mtext.data(), (intptr_t)mtext.size());  // "KEY\tPATH" sans (scheme base)
    std::string index = scm_str(scheme_entry());
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

  std::vector<std::string> pending;
  for (std::set<std::string>::const_iterator k = needed.begin(); k != needed.end(); ++k)
    pending.push_back(path_of[*k]);

  while (!pending.empty()) {
    std::vector<std::string> deferred;
    bool progress = false;
    for (const std::string &p : pending) {
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
      if (st == "deferred") { deferred.push_back(p); continue; }
      if (st == "already") { progress = true; continue; }  // e.g. baked (scheme base): no module
      if (st != "ok") {
        std::cerr << "emit: loading library " << p << ": " << door_msg(scm_str(rt_cdr(r))) << "\n";
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

// Register the baked library set (mode 8) into the current session and return its modules
// and their initializer symbols, positionally paired.
//
// The baked set is a PARTITION, so mode 8 returns one module per member in dependency
// order, joined by the boundary marker -- they cannot share an LLVM module (change:
// scheme-base-partition).  Split them into separate entries: every consumer of `modules`
// (the JIT's addIRModule, --emit's stdout, `emit build`'s clang inputs) needs one module
// per element.  `inits` gets one __init symbol per module, in the same order, for a door
// with no program entry to drive them -- the REPL (change: baked-set-on-every-door).
static bool register_baked_set(std::vector<std::string> &modules,
                               std::vector<std::string> &inits) {
  rt_repl_set(8, "", 0);
  intptr_t r = scheme_entry();
  if (status_of(r) != "ok") {
    std::cerr << "emit: (scheme base): " << door_msg(scm_str(rt_cdr(r))) << "\n";
    return false;
  }
  std::string baked = scm_str(rt_car(rt_cdr(r)));
  size_t start = 0;
  for (;;) {
    size_t bpos = baked.find(kBoundary, start);
    if (bpos == std::string::npos) break;
    modules.push_back(baked.substr(start, bpos - start));
    start = bpos + kBoundary.size();
  }
  modules.push_back(baked.substr(start));

  std::istringstream isyms(scm_str(rt_cdr(rt_cdr(r))));
  std::string sym;
  while (std::getline(isyms, sym))
    if (!sym.empty()) inits.push_back(sym);
  return true;
}

// Seed a compile session: init-session, register the baked library set, and preload the
// libraries the source imports.  The front half of every door that compiles from a
// manifest -- `emit run`, `emit build`, and `emit lib` -- so that all of them resolve
// imports against the same environment (change: baked-set-on-every-door; `emit lib` used
// to run its export-table mode against an unseeded session, which is why a library
// importing `(scheme base)` failed there).  GC must be initialized and EMIT_NO_PRELUDE set
// by the caller before this runs.
static bool seed_session(const std::string &prog_src, const std::vector<std::string> &manifests,
                         bool no_prelude, std::vector<std::string> &modules,
                         const std::string &source_home) {
  rt_repl_set(no_prelude ? 0 : 1, "", 0);    // init-session
  scheme_entry();
  modules.clear();

  if (!no_prelude) {
    std::vector<std::string> inits;           // unused here: the program's entry inits
    if (!register_baked_set(modules, inits)) return false;
  }
  return preload_user_libraries(manifests, modules, prog_src, source_home);
}

// Compile a whole program (or a lone define-library) against the seeded session (mode 7).
// On success fills `prog_ir` and returns true; `is_library` is set when the source was a
// lone define-library (then `modules` is cleared and `prog_ir` is that single unit).
static bool compile_unit(const std::string &prog_src, std::vector<std::string> &modules,
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
  if (is_library) modules.clear();
  return true;
}

// Compile a whole program (or a lone define-library) to its unit modules + program
// IR, in-process -- the shared front half of `emit run`, `emit run --emit`, and
// `emit build` (spec: no second compilation path).  Seed, then compile: the same mode
// sequence in the same order as before it was split, so the emitted IR does not move.
static bool compile_program(const std::string &prog_src, const std::vector<std::string> &manifests,
                            bool no_prelude, std::vector<std::string> &modules,
                            std::string &prog_ir, bool &is_library,
                            const std::string &source_home) {
  if (!seed_session(prog_src, manifests, no_prelude, modules, source_home)) return false;
  return compile_unit(prog_src, modules, prog_ir, is_library, source_home);
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

  std::vector<std::string> modules;
  std::string prog_ir;
  bool is_library = false;
  if (!compile_program(prog_src, manifests, no_prelude, modules, prog_ir, is_library, prog_file))
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

// Preload every library named in the manifest CHAIN into the shared JITDylib (change:
// module-artifacts-vertical-slice; transitive imports: module-generalize).  Mode 5
// turns the manifest text into source paths; mode 4 compiles each unit and returns
// (ok . (ir . init-symbol)).  Iterated to a fixpoint (topological load order).
//
// The UNION of the chain, not just the first manifest (design D7).  A session is an
// open world where the user may import anything at any prompt, so an installed REPL
// must have the full standard surface even when the project's own manifest names none
// of it -- otherwise `(import (scheme file))` failing at the prompt would reintroduce
// issue #44 one layer up.  The lazy doors need no such decision: an unresolved name
// simply walks to the next manifest there.
static void preload_libraries(const std::vector<std::string> &manifests) {
  if (manifests.empty()) return;             // no manifest: no libraries this session

  std::vector<std::string> pending;
  std::set<std::string> seen;                // library keys an earlier manifest claimed
  for (size_t mi = 0; mi < manifests.size(); mi++) {
    const std::string &manifest = manifests[mi];
    std::vector<std::string> supplied;       // this manifest's contribution, for narration
    std::string mtext = read_file(manifest);
    if (mi == 0) {
      // The first manifest, exactly as before: mode 5 lists every library entry,
      // INCLUDING a baked member like (scheme base), which this repository's own
      // manifest names for the Chez driver and which the already-registered guard
      // absorbs below.
      rt_repl_set(5, mtext.data(), (intptr_t)mtext.size());
      std::string paths = scm_str(scheme_entry());
      std::istringstream lines(paths);
      std::string path;
      while (std::getline(lines, path))
        if (!path.empty()) pending.push_back(manifest_relative(manifest, path));
      if (manifests.size() == 1) break;      // nothing to dedup against: skip the index
    }
    // Mode 5 yields paths; a CHAIN needs NAMES, so that a library an earlier manifest
    // already supplies is not loaded a second time from a later one.  Mode 9's
    // "KEY<TAB>PATH" is that index (it omits only (scheme base), which is baked and
    // would land on the already-registered guard either way).
    rt_repl_set(9, mtext.data(), (intptr_t)mtext.size());
    std::string index = scm_str(scheme_entry());
    std::istringstream ilines(index);
    std::string line;
    while (std::getline(ilines, line)) {
      std::string::size_type tab = line.find('\t');
      if (tab == std::string::npos) continue;
      std::string key = line.substr(0, tab);
      if (!seen.insert(key).second) continue;   // an earlier manifest wins this name
      if (mi == 0) continue;                    // its paths came from mode 5 above
      pending.push_back(manifest_relative(manifest, line.substr(tab + 1)));
      supplied.push_back(key);
    }
    say_chained(manifest, supplied);
  }

  while (!pending.empty()) {
    std::vector<std::string> deferred;
    bool progress = false;
    for (const std::string &p : pending) {
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
      if (st == "deferred") { deferred.push_back(p); continue; }
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
  // (eager preload, mode 5), so `emit repl` in a user project directory had NO standard
  // library at all and could not even load a project library that imports (scheme base)
  // (change: baked-set-on-every-door, issue #39).
  //
  // Registration comes BEFORE the manifest preload, so a manifest that names a baked member
  // -- as this repository's own emit-libs.scm does, for the Chez driver -- hits the
  // already-loaded guard in repl-load-library-text and contributes no second module.
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
  preload_libraries(manifests);

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
      std::string form = buf.substr(0, (size_t)code);
      buf.erase(0, (size_t)code);
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
  std::vector<std::string> modules;
  std::string prog_ir;
  bool is_library = false;
  if (!compile_program(prog_src, manifests, no_prelude, modules, prog_ir, is_library, src))
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
  std::vector<std::string> modules;
  if (!seed_session(lib_src, manifests, /*no_prelude=*/false, modules, src)) return 1;

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
  if (!compile_unit(lib_src, modules, prog_ir, is_library, src)) return 1;
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
