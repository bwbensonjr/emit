# Emit

Emit is a small  Scheme compiler and runtime system that
leverages LLVM to provide efficient code, separate compilation, and
identical behavior across the JIT-based read-eval-print loop and the
generation of small, stand-alone executables.

```
$ emit --help
emit 0.4.0 (LLVM 22.1.8)
usage: emit <verb> [args]
  emit run  [FILE] [--manifest F] [--no-prelude]     compile and run a program
  emit repl [--manifest F] [--no-prelude]            interactive REPL
  emit build [NAME|FILE] [--manifest F] [-o OUT] [--no-prelude]   deliver a native exe
  emit lib  SRC [-o DIR] [--manifest F]              compile one library -> artifact
  emit doctor [options]                              inspect the installation
  emit --version                                     Emit and build-time LLVM versions
  emit help [VERB]                                   this summary, or a verb's usage
$ emit repl
resolve libraries -> /Users/bwb/lib, /opt/homebrew/Cellar/emit/0.4.0/share/emit/em...
Emit 0.4.0 (embedded compiler, ORC/LLJIT, LLVM 22.1.8).  ^D to exit.
> (define (square n) (* n n))
> (square 34)
1156
```

## Package-based install

### Homebrew - macOS

```sh
brew install bwbensonjr/emit/emit
```

### Nix - Linux/x86, macOS/x86

```sh
nix profile upgrade emit
nix profile remove emit
```

## Source-based install

**LLVM and Boehm GC**

```sh
# macOS (Homebrew)
brew install llvm bdw-gc

# Debian/Ubuntu (apt) -- e.g. LLVM 22; clang provides the AOT compiler
sudo apt-get install llvm-22 clang-22 libgc-dev
```

**Emit**

```sh
git clone https://github.com/bwbensonjr/emit.git
make
make install PREFIX=~/.local
```

**Testing**

```sh
# In-process compile-and-run. The compiled compiler is linked into
# build/emit; `emit run` compiles the program to IR in-process and JITs
# it via ORC/LLJIT.
build/emit run demos/fact.scm                                  # => 120
build/emit run < demos/fact.scm                                # (stdin also works)

# standalone native executable directly from source (no manifest entry):
build/emit build demos/fact.scm -o build/fact

# or from a stable manifest (program NAME ...) target:
build/emit build fact --manifest emit-libs.scm                 # -> the delivered exe
build/emit run --emit < demos/fact.scm > /tmp/fact.ll          # (the emit step alone)

# See inside the compiler: the IL after every pass, on stderr (no Chez needed).
# Works on every verb; --dump-all adds (scheme base) and imported libraries.
build/emit run --dump demos/fact.scm                           # 7 stages -> stderr
build/emit repl --dump                                         # per-form, in the REPL

# compile one library to reusable .ll + .exports + .artifact files, Chez-free:
build/emit lib test/modules/mylib.sld -o build/lib

# Interactive REPL: the embedded compiler is linked into build/emit and
# `emit repl` compiles each form IN-PROCESS.  Run it directly:
build/emit repl                                                # ^D to exit
build/emit repl --no-prelude                                   # faster start, no stdlib
#   > (define (sq n) (* n n))
#   > (sq 9)          => 81
#   > (define sq 100) => 100   ; redefinition; later forms see the new binding

# The batch text->IR filter compiler
make schemec
cat src/prelude.scm demos/fact.scm | build/schemec > /tmp/fact.ll   # source text -> LLVM IR

# Run the default test suite (exercises the shipped binaries)
./run-all-tests.sh
```

## Building a project

Keep the program's entry point in a `.scm` file and reusable code in R7RS
libraries under `lib/`. For example, a small greeting program:

```text
hello/
  main.scm
  lib/
    hello/
      greeting.sld
```

In `lib/hello/greeting.sld`, define a library and export its public procedures:

```scheme
(define-library (hello greeting)
  (import (scheme base))
  (export greeting)
  (begin
    (define (greeting name)
      (string-append "Hello, " name "!"))))
```

In `main.scm`, import the library and use it:

```scheme
(import (scheme base)
        (scheme write)
        (hello greeting))

(display (greeting "world"))
(newline)
```

From the `hello/` directory, run the program during development, then compile
it into a native executable:

```sh
emit run main.scm                 # Hello, world!
emit build main.scm -o build/hello
./build/hello                    # Hello, world!
```

Emit finds `(hello greeting)` at `lib/hello/greeting.sld`, compiles its
dependencies, and links the libraries the program uses. No manifest or separate
library build is needed for this layout. Use `-L DIR` to add other library roots.
The executable runs without Emit installed; it still needs Boehm GC (`libgc`)
available on the target system.

For a named build target, add an `emit-libs.scm` file at the project root:

```scheme
((program hello (source "main.scm") (output "build/hello")))
```

Then `emit build hello` builds the same executable. With just one program entry,
`emit build` is enough. Paths in the manifest are relative to the manifest file.
See [Modules and libraries](docs/MODULES.md) for more on library layout,
manifests, and separate compilation.

## Using SRFIs

Emit ships optional source libraries for SRFI 1 (lists), 2 (`and-let*`),
8 (`receive`), 64 (testing), and 227 (`opt-lambda`). Import them by number;
they are available in both checkouts and installations without a separate
download.

For example, save this as `sum-evens.scm`:

```scheme
(import (scheme base)
        (scheme write)
        (prefix (srfi 1) s1:))

(define numbers (s1:iota 10 1))
(display (s1:fold + 0 (s1:filter even? numbers)))
(newline)
```

```sh
emit run sum-evens.scm                        # 30
emit build sum-evens.scm -o build/sum-evens
./build/sum-evens                             # 30
```

The `prefix` import gives SRFI 1's exports names such as `s1:fold` and
`s1:filter`, keeping them distinct from other imported bindings. You can also
import a library directly, as in `(import (srfi 8))`, or select particular
exports with `(import (only (srfi 1) iota fold))`. The same imports work in
`emit repl` and inside a `define-library` declaration.

To use another SRFI supplied as portable R7RS source, put its library and any
included files under your project's `lib/` directory, preserving their relative
paths. For example, `(srfi 42)` resolves to `lib/srfi/42.sld`. Alternatively,
point Emit at a directory containing that hierarchy:

```sh
emit run -L /path/to/libraries main.scm
emit build -L /path/to/libraries main.scm -o build/app
```

External libraries must use features Emit supports. See the
[shipped SRFI notes](lib/srfi/README.md) for versions and limitations, including
the SRFI 64 port.

## Compiler transformations

You can view the various front-end compiler transformations using the
`--dump` argument with `repl`, `run`, etc.

```sh
$ echo "(define (square n) (* n n)) (square 34)" | emit run --dump
resolve manifest -> /opt/homebrew/Cellar/emit/0.4.0/share/emit/emit-libs.scm
;; ==== after collect-toplevel ====
(letrec ((square (lambda (%binding.0) (* %binding.0 %binding.0)))) (square 34))

;; ==== after expand ====
(letrec ((square (lambda (%binding.0) (* %binding.0 %binding.0)))) (square 34))

;; ==== after parse+rename+imports ====
(letrec
  ((square.0 (lambda (%binding.0.1) (primcall %* %binding.0.1 %binding.0.1))))
  (call square.0 (const 34)))

;; ==== after recognize-let ====
(letrec
  ((square.0 (lambda (%binding.0.1) (primcall %* %binding.0.1 %binding.0.1))))
  (call square.0 (const 34)))

;; ==== after convert-assignments ====
(letrec
  ((square.0 (lambda (%binding.0.1) (primcall %* %binding.0.1 %binding.0.1))))
  (call square.0 (const 34)))

;; ==== after simplify ====
(const 1156)

;; ==== after convert-closures ====
(const 1156)

;; ==== after lower ====
(program () (const 1156))

1156
```
