#!/usr/bin/env python3
"""Safe, identity-bound CI dependency transport; no third-party packages."""
import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import platform
import subprocess
import sys
import tarfile
import tempfile
import time

ROOT = Path(__file__).resolve().parent.parent
START = time.monotonic()


def digest(path):
    result = hashlib.sha256()
    with open(path, "rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            result.update(block)
    return result.hexdigest()


def command(*argv):
    return subprocess.check_output(argv, text=True).strip()


def identity(major, prefix):
    sdk = "none"
    system = platform.system()
    if system == "Darwin":
        sdk_path = os.environ.get("SDKROOT") or command("xcrun", "--sdk", "macosx", "--show-sdk-path")
        settings = Path(sdk_path) / "SDKSettings.json"
        if not settings.is_file():
            raise ValueError("SDKSettings.json is required for an exact SDK identity")
        sdk = str(json.loads(settings.read_text())["Version"]) + ":" + digest(settings)
    source = command(str(ROOT / "tools/ci-provision.sh"), "--identity", str(major))
    llvm_version, llvm_revision, gc_revision, _, recipe = source.split("-")
    return {
        "schema": 1,
        "os": system,
        "arch": platform.machine(),
        "runner": os.environ.get("ImageOS", "local"),
        "sdk": sdk,
        "deployment": os.environ.get("MACOSX_DEPLOYMENT_TARGET", platform.mac_ver()[0] if system == "Darwin" else "native"),
        "major": str(major),
        "source": source,
        "llvm_version": llvm_version,
        "llvm_revision": llvm_revision,
        "libgc_version": "8.2.8",
        "libgc_revision": gc_revision,
        "recipe": recipe,
        "recipe_sha256": digest(ROOT / "tools/ci-provision.sh"),
        "prefix": str(Path(prefix).resolve()),
    }


def producer():
    return {key: os.environ.get(env, "") for key, env in {
        "repository": "GITHUB_REPOSITORY", "run_id": "GITHUB_RUN_ID",
        "commit": "GITHUB_SHA", "ref": "GITHUB_REF",
        "workflow": "GITHUB_WORKFLOW_REF",
    }.items()}


def safe_members(archive):
    members = archive.getmembers()
    paths = set()
    for item in members:
        path = PurePosixPath(item.name)
        if path.is_absolute() or ".." in path.parts or not path.parts or path.parts[0] not in {"llvm", "gc", "complete"}:
            raise ValueError("unsafe bundle member: " + item.name)
        if str(path) in paths:
            raise ValueError("duplicate bundle member: " + item.name)
        paths.add(str(path))
        if not (item.isfile() or item.isdir() or item.issym() or item.islnk()):
            raise ValueError("unsupported bundle member: " + item.name)
        if item.issym():
            target = PurePosixPath(item.linkname)
            if target.is_absolute():
                raise ValueError("absolute bundle symlink: " + item.name)
            depth = len(path.parent.parts)
            for part in target.parts:
                depth += -1 if part == ".." else (0 if part == "." else 1)
                if depth < 1:
                    raise ValueError("escaping bundle symlink: " + item.name)
    links = {PurePosixPath(item.name) for item in members if item.issym()}
    regular = {item.name for item in members if item.isfile()}
    for item in members:
        if any(parent in links for parent in PurePosixPath(item.name).parents):
            raise ValueError("bundle writes through a symlink: " + item.name)
        if item.islnk() and item.linkname not in regular:
            raise ValueError("bundle hardlink does not target a regular member: " + item.name)
    return members


def validate_manifest(manifest, expected, expected_producer):
    if manifest.get("identity") != expected:
        raise ValueError("bundle OS/architecture/SDK/version/recipe/layout identity differs")
    if manifest.get("producer") != expected_producer:
        raise ValueError("bundle producer differs from approved run")


def validate_completion(prefix, expected):
    source = expected["source"]
    pieces = source.rsplit("-recipe-", 1)
    if len(pieces) != 2:
        raise ValueError("invalid expected recipe identity")
    version, llvm_revision, gc_revision = pieces[0].split("-")
    stamp = f"{version} {llvm_revision} {gc_revision} recipe-{pieces[1]}\n"
    candidate = prefix / "complete"
    if candidate.is_symlink() or not candidate.is_file() or candidate.read_text() != stamp:
        raise ValueError("bundle completion stamp differs from exact expected source recipe")


def validate_staged_links(staged):
    """Lexical checks alone do not account for preceding symlink expansions."""
    root = staged.resolve()
    for candidate in staged.rglob("*"):
        if candidate.is_symlink():
            try:
                resolved = candidate.resolve(strict=True)
            except (OSError, RuntimeError) as error:
                raise ValueError("unresolvable bundle symlink: " + str(candidate)) from error
            if not resolved.is_relative_to(root):
                raise ValueError("resolved bundle symlink escapes prefix: " + str(candidate))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("operation", choices=["identity", "pack", "restore"])
    parser.add_argument("major", choices=["22", "23"])
    parser.add_argument("prefix")
    parser.add_argument("directory", nargs="?")
    parser.add_argument("--producer", help="JSON record validated against the Actions API")
    args = parser.parse_args()
    expected = identity(args.major, args.prefix)
    if args.operation == "identity":
        print(json.dumps(expected, sort_keys=True))
        return
    if not args.directory:
        parser.error("directory required")
    directory = Path(args.directory)
    payload = directory / "dependencies.tar.gz"
    manifest_path = directory / "manifest.json"
    if args.operation == "pack":
        prefix = Path(args.prefix)
        validate_completion(prefix, expected)
        validate_staged_links(prefix)
        directory.mkdir(parents=True, exist_ok=False)
        with tarfile.open(payload, "w:gz") as archive:
            for name in ["llvm", "gc", "complete"]:
                archive.add(prefix / name, arcname=name, recursive=True)
        with tarfile.open(payload) as archive:
            safe_members(archive)
        manifest_path.write_text(json.dumps({"identity": expected, "producer": producer(),
                                             "sha256": digest(payload)}, sort_keys=True) + "\n")
        narrate("pack", payload, payload.stat().st_size)
    else:
        approved = json.loads(args.producer) if args.producer else producer()
        manifest = json.loads(manifest_path.read_text())
        validate_manifest(manifest, expected, approved)
        if digest(payload) != manifest.get("sha256"):
            raise ValueError("bundle checksum differs")
        prefix = Path(args.prefix)
        if prefix.exists() and any(prefix.iterdir()):
            raise ValueError("restore destination must be empty")
        prefix.parent.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(prefix="emit-deps-verify-", dir=prefix.parent) as temporary:
            with tarfile.open(payload) as archive:
                members = safe_members(archive)
                # Member validation owns safety. Support Python versions before
                # the filter keyword without rewriting the verified layout.
                options = ({"filter": "fully_trusted"}
                           if hasattr(tarfile, "fully_trusted_filter") else {})
                archive.extractall(temporary, members=members, **options)
            staged = Path(temporary)
            validate_staged_links(staged)
            validate_completion(staged, expected)
            if prefix.exists():
                prefix.rmdir()
            staged.rename(prefix)
            # TemporaryDirectory must still have an empty directory to clean.
            staged.mkdir()
        narrate("restore", prefix, payload.stat().st_size)


def narrate(verb, target, size):
    if os.environ.get("EMIT_VERBOSITY", "default") not in {"quiet", "q", "0"}:
        print(f"ci: {verb} dependencies -> {target}  [{size} bytes, {time.monotonic() - START:.2f}s]", file=sys.stderr)


if __name__ == "__main__":
    try:
        main()
    except (ValueError, OSError, tarfile.TarError, subprocess.CalledProcessError) as error:
        print("ci: bundle rejected: " + str(error), file=sys.stderr)
        sys.exit(1)
