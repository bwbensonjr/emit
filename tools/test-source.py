#!/usr/bin/env python3
"""Regenerate a git-clean snapshot of current inputs, without touching checkout."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import time

from importlib.util import module_from_spec, spec_from_file_location

ROOT = Path(__file__).resolve().parent.parent
sys.dont_write_bytecode = True
spec = spec_from_file_location("source_fingerprint", ROOT / "tools/source-fingerprint.py")
fingerprints = module_from_spec(spec)
spec.loader.exec_module(fingerprints)


def snapshot(source, destination):
    environment = {key: value for key, value in os.environ.items() if not key.startswith("GIT_")}
    names = subprocess.check_output([
        "git", "ls-files", "-z", "--cached", "--others", "--exclude-standard"], cwd=source,
        env=environment)
    for raw in sorted(set(names.split(b"\0")) - {b""}):
        name = os.fsdecode(raw)
        relative = Path(name)
        if relative.is_absolute() or ".." in relative.parts or ".git" in relative.parts:
            raise ValueError(f"unsafe snapshot path: {name}")
        original = source / relative
        target = destination / relative
        if original.is_symlink():
            # Never retain a writable link back to the original or external tree.
            link = Path(os.readlink(original))
            if link.is_absolute() or not original.resolve().is_relative_to(source.resolve()):
                raise ValueError(f"external snapshot symlink: {name}")
            target.parent.mkdir(parents=True, exist_ok=True)
            target.symlink_to(os.readlink(original))
        elif original.is_file():
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(original, target)
        elif original.exists():
            raise ValueError(f"unsupported snapshot input: {name}")
    subprocess.run(["git", "init", "-q"], cwd=destination, check=True, env=environment)
    subprocess.run(["git", "add", "--all", "--force", "."], cwd=destination, check=True, env=environment)
    subprocess.run(["git", "-c", "user.name=Emit source verification",
                    "-c", "user.email=source-verification@invalid",
                    "-c", "commit.gpgsign=false", "-c", "core.hooksPath=/dev/null",
                    "-c", "gc.auto=0", "-c", "maintenance.auto=false",
                    "commit", "-qm", "snapshot current source verification inputs"],
                   cwd=destination, check=True, env=environment)


def bootstrap_bytes(root):
    return {str(path.relative_to(root / "bootstrap")): hashlib.sha256(path.read_bytes()).hexdigest()
            for path in (root / "bootstrap").rglob("*.ll") if path.is_file()}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    started = time.monotonic()
    workspace = Path(tempfile.mkdtemp(prefix="emit-source-"))
    checkout = workspace / "repo"
    checkout.mkdir()
    log = workspace / "regen.log"
    success = False
    try:
        fingerprints.narrate(f"snapshot current tracked/untracked inputs -> {checkout} [isolated]")
        snapshot(ROOT, checkout)
        before = bootstrap_bytes(checkout)
        if not before:
            raise ValueError("no bootstrap modules available for source consistency")
        declared = subprocess.check_output(
            ["bash", "tools/compiler-inputs.sh", "--bootstrap"], cwd=checkout, text=True)
        expected = {str(Path(name).relative_to("bootstrap")) for name in declared.splitlines()}
        if set(before) != expected:
            raise ValueError("bootstrap module inventory differs from regeneration outputs: "
                             f"missing {sorted(expected - before.keys())}; "
                             f"undeclared {sorted(before.keys() - expected)}")
        identity = fingerprints.fingerprint(checkout)
        fingerprints.narrate(f"regenerate {checkout} -> isolated bootstrap/*.ll [Chez-free]")
        with log.open("wb") as output:
            result = subprocess.run(["bash", "tools/regen.sh"], cwd=checkout,
                                    stdout=output, stderr=subprocess.STDOUT,
                                    env={key: value for key, value in os.environ.items()
                                         if not key.startswith("GIT_")})
        after = bootstrap_bytes(checkout)
        changed = sorted(name for name in before.keys() | after.keys()
                         if before.get(name) != after.get(name))
        success = result.returncode == 0 and not changed
        report = {"proof": "source-consistency", "status": "passed" if success else "failed",
                  "source_digest": identity["source_digest"],
                  "bootstrap_digest": identity["bootstrap_digest"],
                  "toolchain_digest": identity["toolchain_digest"],
                  "bootstrap_modules": sorted(before), "changed_modules": changed,
                  "regen_exit_code": result.returncode,
                  "duration_seconds": round(time.monotonic() - started, 3)}
        if args.report:
            args.report.parent.mkdir(parents=True, exist_ok=True)
            args.report.write_text(json.dumps(report, sort_keys=True, indent=2) + "\n")
        if success:
            fingerprints.narrate(
                f"verify current source -> all {len(before)} bootstrap modules identical "
                f"[{report['duration_seconds']}s, original checkout unchanged]")
            if os.environ.get("EMIT_VERBOSITY") in ("verbose", "v", "2"):
                sys.stderr.write(log.read_text(errors="replace"))
        else:
            print(f"source: FAIL: regeneration exit {result.returncode}; changed modules: "
                  f"{', '.join(changed) or 'none'}; diagnostics: {log}", file=sys.stderr)
            sys.stderr.write(log.read_text(errors="replace")[-12000:])
    except (OSError, ValueError, subprocess.SubprocessError) as error:
        print(f"source: FAIL: {error}; workspace retained: {workspace}", file=sys.stderr)
    finally:
        if success:
            shutil.rmtree(workspace)
    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
