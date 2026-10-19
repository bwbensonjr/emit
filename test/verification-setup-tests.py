#!/usr/bin/env python3
"""Exercise CI Chez naming and isolated REPL setup failure propagation."""

import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parent.parent


class VerificationSetupTests(unittest.TestCase):
    def test_ci_chez_wrapper_preserves_boot_name_and_arguments(self):
        workflow = (ROOT / ".github/workflows/compatibility.yml").read_text()
        command = next(line.strip() for line in workflow.splitlines()
                       if "printf '#!/usr/bin/env bash" in line and "/chez" in line)
        with tempfile.TemporaryDirectory(prefix="emit chez setup ") as temporary:
            work = Path(temporary)
            executable = work / "scheme"
            executable.write_text(
                "#!/bin/sh\ncase \"$0\" in */scheme) ;; *) exit 17 ;; esac\n"
                "printf '%s\\n' \"$@\"\n")
            executable.chmod(0o700)
            tools = work / "emit-reference-tools"
            tools.mkdir()
            environment = {**os.environ, "RUNNER_TEMP": str(work),
                           "PATH": str(work) + os.pathsep + os.environ["PATH"]}
            # A renamed symlink reproduces the argv[0]-dependent boot failure.
            alias = tools / "renamed-chez"
            alias.symlink_to(executable)
            self.assertEqual(subprocess.run([str(alias)]).returncode, 17)
            subprocess.run(["bash", "-c", command], env=environment, check=True)
            wrapper = tools / "chez"
            wrapper.chmod(0o700)
            arguments = ["--script", "source with spaces.ss", "$(literal)"]
            result = subprocess.run([str(wrapper), *arguments], env=environment,
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(result.stdout.splitlines(), arguments)

    def setup_repl(self, status, verbosity):
        with tempfile.TemporaryDirectory(prefix="emit repl setup ") as temporary:
            work = Path(temporary)
            (work / "build").mkdir()
            (work / "tools").mkdir()
            for name in ("log.sh", "test-repl-setup.sh"):
                shutil.copy2(ROOT / "tools" / name, work / "tools" / name)
            executable = work / "build/emit"
            executable.write_text(
                "#!/bin/sh\ntest \"$#\" -eq 1 && test \"$1\" = repl || exit 18\n"
                "if read -r line; then exit 19; fi\n"
                "printf 'startup diagnostic\\n' >&2\nexit \"$EMIT_FIXTURE_STATUS\"\n")
            executable.chmod(0o700)
            environment = {**os.environ, "EMIT_FIXTURE_STATUS": str(status),
                           "EMIT_VERBOSITY": verbosity, "FIXTURE_LOG_DIR": str(work)}
            result = subprocess.run(
                ["bash", "-c", '. tools/log.sh; . tools/test-repl-setup.sh; '
                 'prepare_repl_cache "$FIXTURE_LOG_DIR"'], cwd=work,
                env=environment, capture_output=True, text=True)
            self.assertEqual(result.stdout, "")
            self.assertEqual((work / "repl-setup.log").read_text(), "startup diagnostic\n")
            return result

    def test_successful_setup_captures_diagnostics_and_narrates(self):
        result = self.setup_repl(0, "default")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("private library cache", result.stderr)
        self.assertNotIn("startup diagnostic", result.stderr)

    def test_quiet_success_has_no_output(self):
        result = self.setup_repl(0, "quiet")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stderr, "")

    def test_failure_preserves_status_and_reports_diagnostics_even_when_quiet(self):
        for status in (7, 124):
            with self.subTest(status=status):
                result = self.setup_repl(status, "quiet")
                self.assertEqual(result.returncode, status)
                self.assertIn("startup diagnostic", result.stderr)
                self.assertIn("exit " + str(status), result.stderr)


if __name__ == "__main__":
    unittest.main()
