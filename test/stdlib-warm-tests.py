#!/usr/bin/env python3
"""Installed library preparation, persistence, and execution equivalence."""

import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parent.parent


class WarmTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.work = Path(self.temporary.name)
        self.prefix = self.work / "prefix"
        (self.prefix / "bin").mkdir(parents=True)
        self.emit = self.prefix / "bin/emit"
        shutil.copy2(ROOT / "build/emit", self.emit)
        self.payload = self.prefix / "share/emit"
        self.payload.mkdir(parents=True)
        (self.payload / "emit-libs.scm").write_text(
            "((library (warm dep) (source \"dep.sld\")))\n")
        (self.payload / "dep.sld").write_text(
            "(define-library (warm dep) (export answer) (import (scheme base)) "
            "(include \"body.scm\"))\n")
        self.body = self.payload / "body.scm"
        self.body.write_text(
            "(define-syntax answer (syntax-rules () ((_) 42))) (display \"INIT\")\n")
        self.cache = self.work / "cache"
        self.env = dict(os.environ, EMIT_CACHE=str(self.cache), EMIT_VERBOSITY="verbose")
        self.env.pop("EMIT_DUMP_LEVEL", None)

    def command(self, *args, success=True, env=None):
        result = subprocess.run([str(self.emit), *args], cwd=self.work,
                                env=env or self.env, text=True, capture_output=True,
                                stdin=subprocess.DEVNULL, timeout=90)
        self.assertEqual(result.returncode == 0, success, result.stderr)
        return result

    def warm(self, **kwargs):
        result = self.command("build", "--stdlib", **kwargs)
        self.assertEqual(result.stdout, "")
        return result

    def test_prepare_reuse_include_change_and_initialization(self):
        # The project and environment must not choose the installation's warm set.
        (self.work / "emit-libs.scm").write_text("((library (wrong) (source \"missing\")))")
        self.env["EMIT_MANIFEST"] = str(self.work / "absent-manifest")
        self.env["EMIT_LIBRARY_PATH"] = ":invalid"
        first = self.warm()
        self.assertIn("native object generated for library warm.dep:", first.stderr)
        self.assertIn("portable 0 reused/2 generated", first.stderr)
        second = self.warm()
        self.assertIn("portable 2 reused/0 generated", second.stderr)
        self.assertIn("native 2 reused/0 generated", second.stderr)
        program = self.work / "program.scm"
        program.write_text("(import (scheme base) (warm dep)) (display (answer))\n")
        self.env.pop("EMIT_MANIFEST")
        self.env.pop("EMIT_LIBRARY_PATH")
        run = self.command("run", "--manifest", str(self.payload / "emit-libs.scm"), str(program))
        self.assertEqual(run.stdout, "INIT42")
        self.assertIn("native object reused for library warm.dep:", run.stderr)
        self.body.write_text(self.body.read_text().replace("42", "43"))
        changed = self.warm()
        self.assertIn("portable 1 reused/1 generated", changed.stderr)
        run = self.command("run", "--manifest", str(self.payload / "emit-libs.scm"), str(program))
        self.assertEqual(run.stdout, "INIT43")
        self.body.unlink()
        self.assertIn("body.scm", self.warm(success=False).stderr)

    def test_persistence_failure_and_interrupted_entry(self):
        self.cache.write_text("not a directory")
        self.warm(success=False)
        self.cache.unlink()
        self.warm()
        stamp = next(self.cache.glob("native-unit-*.stamp"))
        stamp.unlink()
        repaired = self.warm()
        self.assertIn("native 1 reused/1 generated", repaired.stderr)
        (self.payload / "dep.sld").unlink()
        self.assertIn("dep.sld", self.warm(success=False).stderr)

    def test_verbosity_and_usage_do_not_change_payload(self):
        before = {p.relative_to(self.prefix): p.read_bytes()
                  for p in self.prefix.rglob("*") if p.is_file()}
        for level in ("default", "quiet", "verbose"):
            env = dict(self.env, EMIT_VERBOSITY=level)
            result = self.warm(env=env)
            if level == "quiet":
                self.assertEqual(result.stderr, "")
            else:
                self.assertIn("compile stdlib ->", result.stderr)
                self.assertIn(" bytes, ", result.stderr)
            if level == "default":
                self.assertNotIn("resolve library ", result.stderr)
        after = {p.relative_to(self.prefix): p.read_bytes()
                 for p in self.prefix.rglob("*") if p.is_file()}
        self.assertEqual(before, after)
        # Keep stdin open: preparation must finish without waiting for EOF.
        process = subprocess.Popen([str(self.emit), "build", "--stdlib", "-q"],
                                   cwd=self.work, env=self.env, stdin=subprocess.PIPE,
                                   stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        try:
            self.assertEqual(process.wait(timeout=15), 0)
        finally:
            if process.poll() is None:
                process.kill()
            process.communicate()
        for argument in ("program.scm", "--manifest", "-o", "-O1", "--dump", "--no-prelude"):
            result = self.command("build", "--stdlib", argument, success=False)
            self.assertIn("incompatible", result.stderr)
        self.assertFalse((self.work / "a.out").exists())

    def test_repl_startup_summary_and_verbose_provenance(self):
        self.warm()
        manifest = str(self.payload / "emit-libs.scm")
        for level in ("quiet", "default", "verbose"):
            env = dict(self.env, EMIT_VERBOSITY=level)
            result = self.command("repl", env=env)
            self.assertEqual(result.stdout, "")
            if level == "quiet":
                self.assertNotIn("resolve ", result.stderr)
            else:
                self.assertEqual(result.stderr.count("resolve libraries ->"), 1)
                self.assertIn(manifest, result.stderr)
            if level == "default":
                self.assertNotIn("resolve library ", result.stderr)
                self.assertNotIn("resolve manifest ", result.stderr)
                self.assertNotIn("chain ", result.stderr)
            if level == "verbose":
                self.assertIn("resolve library warm.dep ->", result.stderr)
        # CLI flags select the same startup narration policy.
        self.assertNotIn("resolve ", self.command("repl", "-q").stderr)
        self.assertIn("resolve library warm.dep ->", self.command("repl", "-v").stderr)
        project = self.work / "project-manifest.scm"
        project.write_text("()\n")
        chain = self.command("repl", "--manifest", str(project), env=dict(
            self.env, EMIT_VERBOSITY="default"))
        summary = next(line for line in chain.stderr.splitlines()
                       if line.startswith("resolve libraries ->"))
        # A requested manifest keeps the caller's spelling; installed paths derive from
        # the real executable, so either may name a symlinked temporary directory.
        def position(path):
            spellings = [str(path), str(path.resolve())]
            return min(summary.index(s) for s in spellings if s in summary)
        self.assertLess(position(project), position(self.payload / "emit-libs.scm"))
        self.assertNotIn("resolve library ", chain.stderr)
        output = []
        for level in ("quiet", "default", "verbose"):
            session = subprocess.run([str(self.emit), "repl"], cwd=self.work,
                                     env=dict(self.env, EMIT_VERBOSITY=level),
                                     input="(import (warm dep)) (answer)\n",
                                     text=True, capture_output=True, timeout=15)
            self.assertEqual(session.returncode, 0, session.stderr)
            output.append(session.stdout)
        self.assertEqual(output, ["INIT42\n"] * 3)
        (self.payload / "dep.sld").unlink()
        self.assertIn("cannot read library source", self.command("repl", "-q").stderr)


if __name__ == "__main__":
    print("test installed stdlib -> preparation, reuse, persistence, initialization", flush=True)
    unittest.main()
