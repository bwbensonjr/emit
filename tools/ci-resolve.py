#!/usr/bin/env python3
"""Resolve only successful default-branch dependency preparation artifacts."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import re
sys.dont_write_bytecode = True

sys.path.insert(0, str(Path(__file__).parent))
from importlib.machinery import SourceFileLoader
bundle = SourceFileLoader("ci_bundle", str(Path(__file__).with_name("ci-bundle.py"))).load_module()

WORKFLOW = ".github/workflows/dependency-preparation.yml"


def say(message):
    if os.environ.get("EMIT_VERBOSITY", "default") not in {"quiet", "q", "0"}:
        print("ci: " + message, file=sys.stderr)


def approved_run(run, repository):
    return (run.get("conclusion") == "success" and run.get("status") == "completed"
            and run.get("head_branch") == "main" and run.get("event") in {"push", "schedule", "workflow_dispatch"}
            and run.get("path") == WORKFLOW
            and run.get("repository", {}).get("full_name") == repository
            and run.get("head_repository", {}).get("full_name") == repository
            and isinstance(run.get("id"), int) and re.fullmatch("[0-9a-f]{40}", run.get("head_sha", "")) is not None)


def api(path):
    return json.loads(subprocess.check_output(["gh", "api", path], text=True))


def resolve(major, prefix):
    repository = os.environ["GITHUB_REPOSITORY"]
    expected = bundle.identity(major, prefix)
    name = f"toolchain-{os.environ['RUNNER_OS']}-{os.environ['RUNNER_ARCH']}-{major}"
    runs = api(f"repos/{repository}/actions/workflows/dependency-preparation.yml/runs?branch=main&status=success&per_page=20")
    for run in runs.get("workflow_runs", []):
        if not approved_run(run, repository):
            continue
        artifacts = api(f"repos/{repository}/actions/runs/{run['id']}/artifacts?per_page=100")
        matches = [item for item in artifacts.get("artifacts", []) if item.get("name") == name and not item.get("expired", True)]
        if len(matches) != 1:
            continue
        with tempfile.TemporaryDirectory(prefix="emit-trusted-bundle-") as temporary:
            subprocess.run(["gh", "run", "download", str(run["id"]), "--repo", repository,
                            "--name", name, "--dir", temporary], check=True)
            approved = {"repository": repository, "run_id": str(run["id"]), "commit": run["head_sha"],
                        "ref": "refs/heads/main", "workflow": f"{repository}/{WORKFLOW}@refs/heads/main"}
            manifest = json.loads((Path(temporary) / "manifest.json").read_text())
            try:
                bundle.validate_manifest(manifest, expected, approved)
            except ValueError:
                say(f"reject approved dependency run {run['id']} -> identity/producer mismatch")
                continue
            subprocess.run([sys.executable, str(Path(__file__).with_name("ci-bundle.py")), "restore", major,
                            prefix, temporary, "--producer", json.dumps(approved)], check=True)
            say(f"resolve approved dependency run {run['id']} -> {prefix}")
            return True
    return False


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("major", choices=["22", "23"])
    parser.add_argument("prefix")
    args = parser.parse_args()
    try:
        found = resolve(args.major, args.prefix)
    except (OSError, KeyError, ValueError, subprocess.CalledProcessError) as error:
        say(f"trusted dependency unavailable/rejected: {error}")
        found = False
    if not found:
        say("resolve trusted dependencies -> exact source fallback")
        sys.exit(3)
