#!/usr/bin/env python3
"""Content-bound local regeneration hints, never a replacement for CI proof."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import shlex
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parent.parent
SCHEMA = 1
FIELDS = ("CC", "CXX", "LLVM_CONFIG", "GC_INC", "GC_LIB", "GC_DYLIB",
          "CXXFLAGS", "LDFLAGS", "SDKROOT", "MACOSX_DEPLOYMENT_TARGET",
          "EMIT_LLVM_MIN", "EMIT_DUMP_LEVEL", "PREFIX",
          "LD_LIBRARY_PATH", "DYLD_LIBRARY_PATH")


def narrate(message):
    if os.environ.get("EMIT_VERBOSITY", "default") not in ("quiet", "q", "0"):
        print(message, file=sys.stderr)


def file_digest(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def content_digest(paths, root=ROOT):
    digest = hashlib.sha256()
    for name in sorted(set(paths)):
        path = root / name
        digest.update(name.encode() + b"\0")
        if path.is_symlink():
            digest.update(b"link\0" + os.readlink(path).encode())
        elif path.is_file():
            digest.update(b"file\0" + path.read_bytes())
        else:
            digest.update(b"missing\0")
        digest.update(b"\0")
    return digest.hexdigest()


def source_paths(root=ROOT):
    result = subprocess.run(["bash", "tools/compiler-inputs.sh", "--list"],
                            cwd=root, check=True, capture_output=True, text=True)
    return result.stdout.splitlines()


def toolchain_identity(root=ROOT):
    # Discover using the same environment as regeneration, with no build or
    # regeneration. A missing toolchain still yields a conservative mismatch.
    script = ". tools/llvm-env.sh >/dev/null || exit 1; "
    script += "printf '%s\\0' " + " ".join("\"${" + key + ":-}\"" for key in FIELDS)
    found = subprocess.run(["bash", "-c", script], cwd=root, capture_output=True)
    values = found.stdout.decode(errors="replace").split("\0")
    options = dict(zip(FIELDS, values)) if found.returncode == 0 else {
        key: os.environ.get(key, "") for key in FIELDS}
    options["discovery_status"] = found.returncode
    executable_hashes = {}
    for key in ("CC", "CXX", "LLVM_CONFIG"):
        value = options.get(key, "")
        resolved = shutil.which(value) if value else None
        if resolved:
            try:
                version = subprocess.run([resolved, "--version"], capture_output=True,
                                         text=True, timeout=10)
                options[key + "_identity"] = {
                    "path": str(Path(resolved).resolve()), "version": version.stdout,
                    "status": version.returncode}
                canonical = str(Path(resolved).resolve())
                if canonical not in executable_hashes:
                    executable_hashes[canonical] = file_digest(canonical)
                options[key + "_identity"]["sha256"] = executable_hashes[canonical]
            except (OSError, subprocess.TimeoutExpired):
                options[key + "_identity"] = {"path": resolved, "status": "unavailable"}
    options["host_inputs"] = content_digest([
        "Makefile", "src/emit.cpp", "src/run-boot.cpp", "src/runtime/runtime.c",
        "tools/llvm-env.sh", "tools/log.sh",
        *[str(path.relative_to(root)) for path in (root / "src").glob("*.h")]], root)
    gc_library = options.get("GC_DYLIB", "")
    if gc_library and Path(gc_library).is_file():
        options["GC_DYLIB_sha256"] = file_digest(gc_library)
    llvm_config = options.get("LLVM_CONFIG", "")
    if llvm_config:
        try:
            libraries = subprocess.run([llvm_config, "--libfiles", "--link-shared"],
                                       capture_output=True, text=True, timeout=10, check=True)
            options["LLVM_libraries"] = {
                str(Path(name).resolve()): file_digest(name)
                for name in shlex.split(libraries.stdout) if Path(name).is_file()}
        except (OSError, ValueError, subprocess.SubprocessError):
            options["LLVM_libraries"] = "unavailable"
    sdk = options.get("SDKROOT", "")
    if not sdk and sys.platform == "darwin":
        try:
            sdk = subprocess.check_output(["/usr/bin/xcrun", "--show-sdk-path"],
                                          text=True, stderr=subprocess.DEVNULL, timeout=10).strip()
        except (OSError, subprocess.SubprocessError):
            sdk = ""
    if sdk:
        options["SDK_identity"] = {
            "path": str(Path(sdk).resolve()),
            "settings": {name: file_digest(Path(sdk) / name)
                         for name in ("SDKSettings.json", "SDKSettings.plist")
                         if (Path(sdk) / name).is_file()},
        }
    for key, names in (("GC_INC", ("gc.h", "gc/gc.h", "gc_version.h", "gc/gc_version.h")),):
        directory = Path(options.get(key, ""))
        options[key + "_headers"] = {
            name: hashlib.sha256((directory / name).read_bytes()).hexdigest()
            for name in names if (directory / name).is_file()}
    return options


def fingerprint(root=ROOT):
    options = toolchain_identity(root)
    return {
        "schema": SCHEMA,
        "source_digest": content_digest(source_paths(root), root),
        "bootstrap_digest": content_digest(
            [str(path.relative_to(root)) for path in (root / "bootstrap").rglob("*.ll")], root),
        "toolchain_digest": hashlib.sha256(
            json.dumps(options, sort_keys=True).encode()).hexdigest(),
        "toolchain": options,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    action = parser.add_mutually_exclusive_group(required=True)
    action.add_argument("--status", action="store_true")
    action.add_argument("--record", action="store_true")
    parser.add_argument("--file", type=Path, default=ROOT / "build/source-fingerprint.json")
    args = parser.parse_args()
    current = fingerprint()
    if args.record:
        if current["toolchain"]["discovery_status"] != 0:
            parser.error("cannot record successful regeneration with unavailable toolchain")
        args.file.parent.mkdir(parents=True, exist_ok=True)
        descriptor, temporary = tempfile.mkstemp(prefix="source-fingerprint-", dir=args.file.parent)
        try:
            with os.fdopen(descriptor, "w") as output:
                json.dump(current, output, sort_keys=True, indent=2)
                output.write("\n")
            os.replace(temporary, args.file)
        finally:
            if os.path.exists(temporary):
                os.unlink(temporary)
        current["status"] = "matching"
        narrate(f"record successful regeneration inputs -> {args.file} [sha256]")
    else:
        try:
            previous = json.loads(args.file.read_text())
            keys = ("schema", "source_digest", "bootstrap_digest", "toolchain_digest")
            current["status"] = "matching" if all(
                previous.get(key) == current[key] for key in keys) else "mismatch"
        except (OSError, ValueError, TypeError, AttributeError):
            current["status"] = "missing"
        narrate(f"inspect regeneration inputs -> {current['status']} [sha256]")
    print(json.dumps(current, sort_keys=True))


if __name__ == "__main__":
    main()
