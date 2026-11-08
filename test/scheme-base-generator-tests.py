#!/usr/bin/env python3
"""Exercise generator guards with one isolated mutation per diagnostic."""
from pathlib import Path
import argparse
import json
import os
import shutil
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parent.parent
WRAPPER = ROOT / "tools/gen-scheme-base.sh"

# Append mutations to the real declaration so its functions and defaults remain
# ordinary source inputs to generation. Each case changes one invariant only.
CASES = [
    ("stale-private", "(set! *scheme-base-private* (cons 'guard-missing *scheme-base-private*))", "private name not defined by the prelude", "guard-missing"),
    ("stale-assignment", "(set! *prelude-assignments* (cons '(guard-missing (scheme base)) *prelude-assignments*))", "assignment for a name the prelude does not define", "guard-missing"),
    ("duplicate-assignment", "(set! *prelude-assignments* (cons '(guard-probe (scheme base)) (cons '(guard-probe (scheme base)) *prelude-assignments*)))", "name assigned more than once", "guard-probe"),
    ("unknown-home", "(set! *prelude-assignments* (cons '(guard-probe (guard unknown)) *prelude-assignments*))", "assignment to a library that is not a partition member", "guard unknown"),
    ("duplicate-home", "(set! *prelude-assignments* (cons '(guard-probe (scheme base) (scheme base)) *prelude-assignments*))", "name assigned to the same library twice", "guard-probe"),
    ("missing-elsewhere", "(set! *prelude-assignments* (cons '(guard-probe (emit internal)) *prelude-assignments*))", "not exported by (scheme base) but missing from *scheme-base-elsewhere*", "guard-probe"),
    ("extra-elsewhere", "(set! *scheme-base-elsewhere* (cons 'guard-probe *scheme-base-elsewhere*))", "in *scheme-base-elsewhere* but (scheme base) still exports it", "guard-probe"),
    ("duplicate-builtin", "(set! *base-primitive-names* (cons 'cons *base-primitive-names*))", "duplicate builtin surface name", "cons"),
    ("raw-builtin", "(set! *base-primitive-names* (cons '%guard-raw *base-primitive-names*))", "raw primitive names cannot be exported", "%guard-raw"),
    ("malformed-builtin", """(define guard-original-surface library-builtin-surface)
(set! library-builtin-surface (lambda (lib) (if (equal? lib '(scheme base)) (cons '(guard-row primitive (builtin core guard-row) guard-row) (guard-original-surface lib)) (guard-original-surface lib))))""", "malformed builtin surface row", "guard-row"),
    ("invalid-extension", "(set! *base-primitive-extension-names* (cons 'guard-extension *base-primitive-extension-names*))", "primitive extension is not a declared base primitive", "guard-extension"),
    ("invalid-write-owner", "(set! *write-primitive-names* (cons 'guard-write *write-primitive-names*))", "(scheme write) primitive must alias a base builtin", "guard-write"),
    ("duplicate-write-owner", "(set! *write-primitive-names* (cons 'display *write-primitive-names*))", "duplicate (scheme write) primitive owner", "display"),
    ("write-identity", """(define guard-original-surface library-builtin-surface)
(set! library-builtin-surface (lambda (lib) (if (equal? lib '(scheme write)) '((display primitive (builtin primitive guard-write) display)) (guard-original-surface lib))))""", "(scheme write) must expose the declared base primitive identities", "guard-write"),
    ("duplicate-export", "", "duplicate export", "guard-duplicate"),
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--reference", action="store_true", help="also require Chez and compare hosts")
    parser.add_argument("--controls-only", action="store_true", help="run positive and serialization/baker controls only")
    parser.add_argument("--skip-freshness", action="store_true", help="only run generator fixtures")
    args = parser.parse_args()
    if args.reference and not shutil.which(os.environ.get("CHEZ", "chez")):
        parser.error("explicit generator reference verification requires Chez")
    hosts = ["emit", "chez"] if args.reference else ["emit"]
    work = Path(tempfile.mkdtemp(prefix="emit-generator-tests-"))
    failures = []
    started = time.monotonic()
    count = 0
    source = (ROOT / "src/prelude.scm").read_text()
    declaration = (ROOT / "src/prelude-surface.scm").read_text()

    def run(name, host, prelude=source, surface=declaration, verbosity="quiet"):
        case = work / name / host / verbosity
        case.mkdir(parents=True)
        prelude_path, declaration_path = case / "prelude.scm", case / "surface.scm"
        prelude_path.write_text(prelude)
        declaration_path.write_text(surface)
        command = ["bash", str(WRAPPER), "--host", host, "--prelude", str(prelude_path), "--declaration", str(declaration_path), "--output-root", str(case / "out")]
        env = dict(os.environ, EMIT_VERBOSITY=verbosity)
        result = subprocess.run(command, cwd=ROOT, env=env, capture_output=True)
        (case / "stdout").write_bytes(result.stdout)
        (case / "stderr").write_bytes(result.stderr)
        (case / "status").write_text(str(result.returncode) + "\n")
        return result, case

    def files(case):
        return {str(p.relative_to(case / "out")): p.read_bytes() for p in (case / "out").rglob("*.sld")}

    for name, mutation, diagnostic, offending in ([] if args.controls_only else CASES):
        # A known procedure allows each home mutation to pass the stale-name guard.
        prelude = source + "\n(define guard-probe 1)\n"
        if name == "duplicate-export":
            prelude += "(define guard-duplicate 1)\n(define guard-duplicate 2)\n"
        for host in hosts:
            result, case = run(name, host, prelude, declaration + "\n" + mutation + "\n")
            error = result.stderr.decode(errors="replace")
            if result.returncode == 0 or diagnostic not in error or (offending and offending not in error):
                failures.append(f"{name}/{host}: expected nonzero status and {diagnostic!r}, {offending!r}; reports {case}")
            elif result.stdout:
                failures.append(f"{name}/{host}: diagnostic failure polluted stdout; reports {case}")
            count += 1

    # The real declaration already includes supported macro re-exports and mixed
    # private/public homes. Add a previously unknown private macro as a control.
    positive_prelude = source + "\n(define-syntax guard-private (syntax-rules () ((_ x) x)))\n"
    positive_surface = declaration + "\n(set! *scheme-base-private* (cons 'guard-private *scheme-base-private*))\n"
    outputs = {}
    for host in hosts:
        result, case = run("valid-private-macro", host, positive_prelude, positive_surface)
        output = files(case)
        base = output.get("lib/scheme/base.sld", b"").decode()
        if result.returncode or not output or "guard-private" not in base.split("(begin", 1)[-1] or "guard-private" in base.split("(begin", 1)[0]:
            failures.append(f"valid-private-macro/{host}: private macro missing from body or leaked to exports; reports {case}")
        outputs[host] = output
        count += 1
    if args.reference and outputs["emit"] != outputs["chez"]:
        failures.append("valid-private-macro: Emit/Chez generated files differ")

    # Include datum spellings most likely to expose host-printer differences.
    literal_prelude = source + r"""
(define guard-literals '("a\"b\\c\n\t\x1;" |two words| |semi;colon| #\space #\newline #\x1 1.0 -0.0 +inf.0 -inf.0 +nan.0 #(1 "x")))
"""
    baseline = None
    for host in hosts:
        for verbosity in ["quiet", "default", "verbose"]:
            result, case = run("serialization", host, literal_prelude, declaration, verbosity)
            output = files(case)
            if result.returncode or not output:
                failures.append(f"serialization/{host}/{verbosity}: generation failed; reports {case}")
            elif baseline is None:
                baseline = output
            elif baseline != output:
                failures.append(f"serialization/{host}/{verbosity}: generated bytes depend on host/root/verbosity; reports {case}")
            if result.stdout or (verbosity == "quiet" and result.returncode == 0 and result.stderr):
                failures.append(f"serialization/{host}/{verbosity}: stream/quiet contract failed; reports {case}")
            count += 1

    # Extend the actual declaration in place so the baker must discover both a
    # new baked member and an excluded, normally generated non-baked member.
    baker_surface = declaration.replace(
        '    ((scheme cxr) #f',
        '    ((guard baked) #t ((scheme base)) "lib/guard/baked.sld")\n'
        '    ((guard plain) #f ((scheme base)) "lib/guard/plain.sld")\n'
        '    ((scheme cxr) #f',
        1,
    ) + """
(set! *prelude-assignments* (cons '(guard-baked (guard baked)) (cons '(guard-plain (guard plain)) *prelude-assignments*)))
(set! *scheme-base-elsewhere* (cons 'guard-baked (cons 'guard-plain *scheme-base-elsewhere*)))
"""
    baker_prelude = source + "\n(define guard-baked 1)\n(define guard-plain 2)\n"
    for host in hosts:
        result, case = run("baker-selection", host, baker_prelude, baker_surface)
        baked = case / "baked.scm"
        bake = subprocess.run(
            ["bash", "tools/bake-libraries.sh", str(case / "out"), str(baked), "--declaration", str(case / "surface.scm")],
            cwd=ROOT, capture_output=True,
        )
        (case / "baker.stderr").write_bytes(bake.stderr)
        if result.returncode or bake.returncode:
            failures.append(f"baker-selection/{host}: generation/baking failed; reports {case}")
        else:
            validate = case / "validate.scm"
            imports = "(import (chezscheme))" if host == "chez" else "(import (scheme base) (scheme read) (scheme cxr))"
            validate.write_text(imports + "\n" + baked.read_text() + """
(define guard-forms
  (let ((p (open-input-string *baked-library-source*)))
    (let loop ((out '()))
      (let ((form (read p)))
        (if (eof-object? form) (reverse out) (loop (cons form out)))))))
(unless (equal? (map cadr guard-forms) '((emit internal) (scheme base) (guard baked)))
  (error 'baker "wrong baked library names or dependency order"))
(unless (equal? (assoc 'import (cddr (caddr guard-forms))) '(import (scheme base)))
  (error 'baker "extra baked member lost its imports"))
(display "baker selection passed")
(newline)
""")
            command = [os.environ.get("CHEZ", "chez"), "--script", str(validate)] if host == "chez" else [os.environ.get("EMIT_BINARY", str(ROOT / "build/emit")), "run", str(validate)]
            checked = subprocess.run(command, cwd=ROOT, env=dict(os.environ, EMIT_VERBOSITY="quiet"), capture_output=True)
            (case / "validate.stdout").write_bytes(checked.stdout)
            (case / "validate.stderr").write_bytes(checked.stderr)
            if checked.returncode or checked.stdout != b"baker selection passed\n":
                failures.append(f"baker-selection/{host}: named forms/imports do not round-trip; reports {case}")
        count += 1

    if not args.skip_freshness and not args.controls_only:
        tree = work / "freshness-tree"
        (tree / "src").mkdir(parents=True)
        (tree / "src/prelude.scm").write_text(source)
        (tree / "src/prelude-surface.scm").write_text(declaration)
        shutil.copytree(ROOT / "lib", tree / "lib")
        def freshness(name, expected, diagnostic=""):
            nonlocal count
            result = subprocess.run(["bash", "test/scheme-base-gen-check.sh", "--tree", str(tree)], cwd=ROOT, env=dict(os.environ, TMPDIR=str(work)), capture_output=True)
            (work / f"freshness-{name}.stdout").write_bytes(result.stdout)
            (work / f"freshness-{name}.stderr").write_bytes(result.stderr)
            if (result.returncode == 0) != expected or diagnostic.encode() not in result.stderr:
                failures.append(f"freshness/{name}: unexpected status/diagnostic")
            count += 1
        freshness("valid", True)
        base = tree / "lib/scheme/base.sld"
        original = base.read_bytes()
        base.write_bytes(original.replace(b"(define ", b"(define guard-body-sentinel 0)\n    (define ", 1))
        before = base.read_bytes()
        freshness("stale-body", False, "stale generated member")
        if base.read_bytes() != before:
            failures.append("freshness guard rewrote stale body")
        base.unlink()
        freshness("missing", False, "missing generated member")
        if base.exists():
            failures.append("freshness guard recreated missing member")
        base.write_bytes(original)
        orphan = tree / "lib/scheme/guard-orphan.sld"
        orphan.write_bytes(b";;; GENERATED from src/prelude.scm\n(define-library (guard orphan))\n")
        before = orphan.read_bytes()
        freshness("orphan", False, "orphan generated member")
        if orphan.read_bytes() != before:
            failures.append("freshness guard removed orphan")

    summary = {"cases": count, "failures": failures, "seconds": round(time.monotonic() - started, 2)}
    (work / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    for failure in failures:
        print("FAIL " + failure, file=sys.stderr)
    print(f"generator tests: {count - len(failures)}/{count} passed [{summary['seconds']}s]", file=sys.stderr)
    if failures:
        print(f"generator test reports -> {work}", file=sys.stderr)
        return 1
    shutil.rmtree(work)
    return 0


if __name__ == "__main__":
    sys.exit(main())
