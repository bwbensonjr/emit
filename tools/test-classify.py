#!/usr/bin/env python3
"""Conservative validation policy. No compiler or toolchain discovery is needed."""

import argparse
import json
import os
from pathlib import Path
import subprocess
import sys


ROOT = Path(__file__).resolve().parent.parent
REFERENCE = ["self-emission", "dump-parity", "render-datum"]
DOC_NAMES = {"README.md", "LLVM.md", "LICENSE",
             "CONTRIBUTING.md", "CHANGELOG.md"}


def git(root, *args):
    return subprocess.check_output(["git", *args], cwd=root, stderr=subprocess.PIPE,
        env={key: value for key, value in os.environ.items() if not key.startswith("GIT_")})


def documentation(path):
    return (path in DOC_NAMES or
            (path.startswith(("docs/", "openspec/")) and path.endswith(".md")))


def classify_paths(paths, inputs=(), error=None, executable=()):
    categories = set()
    source = units = archive = False
    paths = sorted(set(paths))
    for path in paths:
        if documentation(path) and path not in executable:
            categories.add("documentation")
        elif path.startswith("src/runtime/"):
            categories.add("runtime")
        elif path in inputs or path.startswith("bootstrap/"):
            categories.add("compiler")
            source = units = True
        elif path.startswith("src/") and path.endswith((".cpp", ".h")):
            categories.add("host")
        elif path.startswith("src/") and path.endswith((".ss", ".scm")):
            categories.add("compiler")
            source = units = True
        elif path.startswith("lib/") or path == "emit-libs.scm":
            categories.add("library")
            units = True
            source |= path in inputs
        elif path in {"VERSION", "Makefile"} or path.startswith(".github/"):
            categories.add("release" if path == "VERSION" else "infrastructure")
            archive = True
            # Make/CI controls assembly, dependency identity, and proof execution.
            source = units = True
        elif path.startswith(("tools/", "test/", "demos/")):
            categories.add("infrastructure")
            source = units = True
            archive |= path.startswith("tools/")
        elif path in {"run-all-tests.sh", "run-dev-tests.sh", ".gitignore", "CLAUDE.md", "AGENTS.md"}:
            categories.add("infrastructure")
            source = units = True
        else:
            categories.add("unknown")
            source = units = archive = True
    if error or not paths:
        categories.add("unknown")
        source = units = archive = True
    docs_only = bool(paths) and categories == {"documentation"} and not error
    reference = REFERENCE if source or units else []
    return {"schema": 1, "categories": sorted(categories), "paths": paths,
            "docs_only": docs_only, "source": source, "units": units,
            "reference": reference, "archive": archive, "code": not docs_only,
            "reason": error or ("allowlisted non-executable documentation only" if docs_only
                                 else "union of changed-input obligations" if paths
                                 else "empty comparison: conservative full validation")}


def classify(root, base, ci=False, direct=False):
    try:
        resolved = git(root, "rev-parse", "--verify", base + "^{commit}").decode().strip()
        if not direct:
            resolved = git(root, "merge-base", resolved, "HEAD").decode().strip()
        # --no-renames makes both sides of every rename visible as delete+add.
        paths = set(git(root, "diff", "--name-only", "--no-renames", "-z",
                        resolved, "HEAD").decode().rstrip("\0").split("\0"))
        if not ci:
            for args in (("diff", "--name-only", "--no-renames", "-z", "HEAD"),
                         ("ls-files", "--others", "--exclude-standard", "-z")):
                paths.update(git(root, *args).decode().rstrip("\0").split("\0"))
        paths.discard("")
        inventory = subprocess.run(["bash", "tools/compiler-inputs.sh", "--list"],
                                   cwd=root, capture_output=True, text=True)
        if inventory.returncode:
            raise ValueError("regeneration input inventory unavailable")
        modes = (git(root, "ls-tree", "-rz", "HEAD") +
                 git(root, "ls-tree", "-rz", resolved)).split(b"\0")
        executable = {record.split(b"\t", 1)[1].decode() for record in modes
                      if record.startswith(b"100755 ")}
        if not ci:
            executable.update(path for path in paths if (root / path).is_file()
                              and (root / path).stat().st_mode & 0o111)
        return classify_paths(paths, inventory.stdout.splitlines(), executable=executable)
    except (OSError, subprocess.CalledProcessError, ValueError) as error:
        return classify_paths([], error="comparison unavailable: " + str(error))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("base")
    parser.add_argument("--ci", action="store_true")
    parser.add_argument("--direct", action="store_true")
    args = parser.parse_args()
    print(json.dumps(classify(ROOT, args.base, args.ci, args.direct), sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
