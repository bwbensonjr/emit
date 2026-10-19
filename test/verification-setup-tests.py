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
    def test_bitcode_probe_runs_all_tools_and_propagates_each_failure(self):
        provision = (ROOT / "tools/ci-provision.sh").read_text()
        helpers = provision.split("log_count=0\n", 1)[1].split(
            'if [ -f "$prefix/complete" ]; then', 1)[0]
        for failed_step in range(5):
            with self.subTest(failed_step=failed_step), tempfile.TemporaryDirectory(
                    prefix="emit backend probe ") as temporary:
                work = Path(temporary)
                binaries = work / "llvm/bin"
                binaries.mkdir(parents=True)
                fixture = work / "backend"
                fixture.write_text("""#!/usr/bin/env python3
import os
from pathlib import Path
import sys
state = Path(os.environ["PROBE_STATE"])
step = int(state.read_text()) + 1 if state.exists() else 1
state.write_text(str(step))
if step == int(os.environ["FAIL_STEP"]):
    sys.exit(19)
tool = Path(sys.argv[0]).name
if tool == "llvm-as":
    Path(sys.argv[sys.argv.index("-o") + 1]).write_text(sys.stdin.read())
elif tool == "llvm-link":
    text = "".join(Path(path).read_text() for path in sys.argv[1:3])
    Path(sys.argv[sys.argv.index("-o") + 1]).write_text(text)
elif tool == "lli":
    text = Path(sys.argv[1]).read_text()
    assert "define i32 @main()" in text and "define i32 @probe_value()" in text
else:
    sys.exit(18)
""")
                fixture.chmod(0o700)
                for name in ("llvm-as", "llvm-link", "lli"):
                    (binaries / name).symlink_to(fixture)
                environment = {**os.environ, "PROBE_STATE": str(work / "state"),
                               "FAIL_STEP": str(failed_step), "PROBE_PREFIX": str(work)}
                result = subprocess.run(
                    ["bash", "-c", helpers + '\nprefix=$PROBE_PREFIX\n'
                     'probe_bitcode "$PROBE_PREFIX"'], env=environment,
                    capture_output=True, text=True)
                self.assertEqual(result.returncode, 19 if failed_step else 0, result.stderr)
                self.assertEqual(int((work / "state").read_text()), failed_step or 4)

    def test_backend_driver_does_not_replace_inherited_native_cc(self):
        with tempfile.TemporaryDirectory(prefix="emit backend compiler ") as temporary:
            work = Path(temporary)
            executable = work / "chez"
            executable.write_text(
                "#!/bin/sh\nprintf '%s\\n' \"$CC\" >> \"$OBSERVED_CC\"\nexit 19\n")
            executable.chmod(0o700)
            observed = work / "observed"
            native_cc = str(work / "native compiler")
            environment = {**os.environ, "CC": native_cc, "OBSERVED_CC": str(observed),
                           "PATH": str(work) + os.pathsep + os.environ["PATH"]}
            result = subprocess.run(["bash", str(ROOT / "demos/run-backends.sh")],
                                    env=environment, capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            calls = observed.read_text().splitlines()
            self.assertTrue(calls)
            self.assertEqual(set(calls), {native_cc})

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
