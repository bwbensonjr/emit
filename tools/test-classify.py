#!/usr/bin/env python3
"""Conservative validation policy. No compiler or toolchain discovery is needed."""

import argparse
import json
import os
from pathlib import Path
from pathlib import PurePosixPath
import subprocess
import sys


ROOT = Path(__file__).resolve().parent.parent
REFERENCE = ["self-emission", "dump-parity", "render-datum"]
DOC_NAMES = {"README.md", "LLVM.md", "LICENSE",
             "CONTRIBUTING.md", "CHANGELOG.md"}
# Inputs of the distribution channels (change: low-cost-distribution-channels, design D7): a
# change to any of them rehearses the Homebrew, Nix, and OCI channels.
CHANNEL_PREFIXES = ("packaging/", "test/channel-accept/", "tools/channel-")
CHANNEL_NAMES = {"flake.nix", "flake.lock", "tools/offline-run.sh", ".github/workflows/channels.yml"}


def channel_input(path):
    return path in CHANNEL_NAMES or path.startswith(CHANNEL_PREFIXES)


def git(root, *args):
    return subprocess.check_output(["git", *args], cwd=root, stderr=subprocess.PIPE,
        env={key: value for key, value in os.environ.items() if not key.startswith("GIT_")})


def documentation(path):
    return (path in DOC_NAMES or
            (path.startswith(("docs/", "openspec/")) and path.endswith(".md")))


def classify_paths(paths, inputs=(), error=None, executable=()):
    categories = set()
    source = units = archive = channels = False
    paths = sorted(set(paths))
    for path in paths:
        channels |= channel_input(path)
        if path.startswith("packaging/") or path in {"flake.nix", "flake.lock"}:
            # Recipes outside the source archive: no compiler, archive, or native-build input.
            categories.add("packaging")
        elif documentation(path) and path not in executable and path not in inputs:
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
            source = units = archive = channels = True
    if error or not paths:
        categories.add("unknown")
        source = units = archive = channels = True
    docs_only = bool(paths) and categories == {"documentation"} and not error
    reference = REFERENCE if source or units else []
    return {"schema": 1, "categories": sorted(categories), "paths": paths,
            "docs_only": docs_only, "source": source, "units": units,
            "reference": reference, "archive": archive, "channels": channels, "code": not docs_only,
            "reason": error or ("allowlisted non-executable documentation only" if docs_only
                                 else "union of changed-input obligations" if paths
                                 else "empty comparison: conservative full validation")}


def tree_entries(raw):
    entries = {}
    for record in raw.split(b"\0"):
        if record:
            metadata, name = record.split(b"\t", 1)
            entries[name.decode()] = metadata.split()[0].decode()
    return entries


def resolve_alias(name, links, dependencies=None):
    # Resolve components before '..': normalizing first misses aliases such as
    # a -> '.', b -> 'a/a/../../outside'. No checkout of old inputs is needed.
    pending = list(PurePosixPath(name).parts)
    resolved = []
    expansions = 0
    while pending:
        part = pending.pop(0)
        if part == ".":
            continue
        if part == "..":
            if not resolved:
                raise ValueError("dependency alias escapes the repository: " + name)
            resolved.pop()
            continue
        candidate = "/".join([*resolved, part])
        if candidate not in links:
            resolved.append(part)
            continue
        if dependencies is not None:
            dependencies.add(candidate)
        target = PurePosixPath(links[candidate])
        if target.is_absolute():
            raise ValueError("absolute dependency alias: " + candidate)
        expansions += 1
        if expansions > 40:
            raise ValueError("cyclic dependency alias: " + name)
        pending = list(target.parts) + pending
    return "/".join(resolved)


def dependency_aliases(root, paths, revisions, ci, inputs=(), executable=()):
    """Find code aliases whose current or historical targets changed."""
    aliases = set()
    views = []
    for revision, entries in revisions:
        links = {name: git(root, "cat-file", "blob", revision + ":" + name).decode()
                 for name, mode in entries.items() if mode == "120000"}
        views.append((entries, links))
    if not ci:
        names = set(paths)
        for _, entries in revisions:
            names.update(entries)
        links = {name: os.readlink(root / name) for name in names if (root / name).is_symlink()}
        present = {name for name in names if (root / name).exists() or (root / name).is_symlink()}
        views.append((present, links))
    for entries, links in views:
        for name in links:
            # Pure documentation-to-documentation links establish no code
            # dependency. Root instructions and all non-prose paths still do.
            if documentation(name) and name not in inputs and name not in executable:
                continue
            dependencies = set()
            target = resolve_alias(name, links, dependencies)
            if target not in entries and not any(path.startswith(target + "/") for path in entries):
                raise ValueError("dangling dependency alias: " + name)
            if any(path in dependencies or path == target or path.startswith(target + "/") for path in paths):
                aliases.add(name)
    return aliases


def classify(root, base, ci=False, direct=False):
    try:
        resolved = git(root, "rev-parse", "--verify", base + "^{commit}").decode().strip()
        if not direct:
            resolved = git(root, "merge-base", resolved, "HEAD").decode().strip()
        # --no-renames makes both sides of every rename visible as delete+add.
        paths = set(git(root, "diff", "--name-only", "--no-renames", "-z",
                        resolved, "HEAD").decode().rstrip("\0").split("\0"))
        if not ci:
            for args in (("diff", "--cached", "--name-only", "--no-renames", "-z", "HEAD"),
                         ("diff", "--name-only", "--no-renames", "-z"),
                         ("ls-files", "--others", "--exclude-standard", "-z")):
                paths.update(git(root, *args).decode().rstrip("\0").split("\0"))
        paths.discard("")
        inventory = subprocess.run(["bash", "tools/compiler-inputs.sh", "--list"],
                                   cwd=root, capture_output=True, text=True)
        if inventory.returncode:
            raise ValueError("regeneration input inventory unavailable")
        revisions = [(revision, tree_entries(git(root, "ls-tree", "-rz", revision)))
                     for revision in ("HEAD", resolved)]
        executable = {name for _, entries in revisions for name, mode in entries.items()
                      if mode == "100755"}
        if not ci:
            executable.update(name for name, mode in tree_entries(
                git(root, "ls-files", "--stage", "-z")).items() if mode == "100755")
            executable.update(path for path in paths if (root / path).is_file()
                              and (root / path).stat().st_mode & 0o111)
        inputs = inventory.stdout.splitlines()
        try:
            aliases = dependency_aliases(root, paths, revisions, ci, inputs, executable)
        except (OSError, ValueError, subprocess.CalledProcessError) as error:
            return classify_paths(paths, inputs, error="dependency aliases unavailable: " + str(error),
                                  executable=executable)
        result = classify_paths(paths | aliases, inputs, executable=executable)
        result["dependency_aliases"] = sorted(aliases)
        return result
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
