#!/usr/bin/env python3
"""Validate a pinned commit of the emit-packages collection against this Emit.

The collection (bwbensonjr/emit-packages) holds libraries that used to ship with
Emit, starting with (malt learner). Each package declares execution-path checks
in packages/<name>/checks.scm; this driver runs every check through:

  native (default)  emit run, emit repl, a standalone emit build executable,
                    emit run consuming published artifacts of every library the
                    package declares in package.scm, and emit run against a user
                    root that `emit pkg install --from` populated (no -L root for
                    the collection's lib/)
  --source          the Chez source driver (src/compile.ss)

A path passes when its final non-blank stdout line equals the check's expect
string. The collection comes from, in order:

  1. EMIT_PACKAGES_DIR, a local checkout -- the run is labelled UNPINNED
  2. build/emit-packages/<commit>/, if its HEAD equals the pin
  3. a shallow fetch of exactly the pinned commit

The pin lives in tools/emit-packages-pin.sh. Narration goes to stderr per
docs/OUTPUT.md; --report FILE writes a JSON summary.
"""
import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parent.parent
PIN_FILE = ROOT / "tools" / "emit-packages-pin.sh"
CACHE = ROOT / "build" / "emit-packages"
NATIVE_PATHS = ("run", "repl", "build", "artifacts", "pkg")


def level():
    value = os.environ.get("EMIT_VERBOSITY", "default").lower()
    if value in {"quiet", "q", "0"}:
        return 0
    if value in {"verbose", "v", "2"}:
        return 2
    return 1


def say(message, detail=False):
    if level() >= (2 if detail else 1):
        print(message, file=sys.stderr)


class Failure(Exception):
    pass


def read_pin():
    """Return (commit, origin) from tools/emit-packages-pin.sh."""
    values = dict(re.findall(r'^([A-Z_]+)="([^"]*)"$', PIN_FILE.read_text(), re.M))
    commit = values.get("EMIT_PACKAGES_PIN_COMMIT", "")
    origin = values.get("EMIT_PACKAGES_PIN_ORIGIN", "")
    if not re.fullmatch(r"[0-9a-f]{40}", commit):
        raise Failure(f"{PIN_FILE}: EMIT_PACKAGES_PIN_COMMIT must be a full 40-hex commit, got {commit!r}")
    if not origin:
        raise Failure(f"{PIN_FILE}: EMIT_PACKAGES_PIN_ORIGIN is empty")
    return commit, os.environ.get("EMIT_PACKAGES_ORIGIN", origin)


def git(directory, *args):
    done = subprocess.run(["git", "-C", str(directory), *args], capture_output=True, text=True)
    if done.returncode != 0:
        raise Failure(f"git {' '.join(args)} in {directory} failed: {done.stderr.strip()}")
    return done.stdout.strip()


def head_of(directory):
    try:
        return git(directory, "rev-parse", "HEAD")
    except Failure:
        return None


def obtain_collection(commit, origin):
    """Return (directory, provenance dict) for the collection to validate."""
    local = os.environ.get("EMIT_PACKAGES_DIR")
    if local:
        directory = Path(local).resolve()
        head = head_of(directory)
        if head is None:
            raise Failure(f"EMIT_PACKAGES_DIR={directory} is not a git checkout")
        dirty = bool(git(directory, "status", "--porcelain"))
        say(f"use collection {directory} -> UNPINNED  [commit {head[:12]}, {'dirty' if dirty else 'clean'}, pin {commit[:12]}]")
        return directory, {"pinned": False, "commit": head, "dirty": dirty, "pin": commit, "source": str(directory)}
    cached = CACHE / commit
    if cached.exists():
        head = head_of(cached)
        if head != commit:
            raise Failure(f"cached collection {cached} is at {head or 'no commit'}, expected pin {commit}; "
                          f"remove it and rerun")
        say(f"use collection {cached} -> pinned {commit[:12]}  [cached]")
        return cached, {"pinned": True, "commit": commit, "dirty": False, "pin": commit, "source": "cache"}
    CACHE.mkdir(parents=True, exist_ok=True)
    start = time.monotonic()
    staging = Path(tempfile.mkdtemp(prefix=".fetch-", dir=CACHE))
    try:
        git(staging, "init", "-q")
        git(staging, "fetch", "-q", "--depth", "1", origin, commit)
        git(staging, "checkout", "-q", "--detach", "FETCH_HEAD")
        head = head_of(staging)
        if head != commit:
            raise Failure(f"fetched collection from {origin} is at {head}, expected pin {commit}")
        staging.rename(cached)
    finally:
        if staging.exists():
            shutil.rmtree(staging)
    say(f"fetch {origin}@{commit[:12]} -> {cached}  [{time.monotonic() - start:.1f}s]")
    return cached, {"pinned": True, "commit": commit, "dirty": False, "pin": commit, "source": origin}


def datums(text):
    """Read the small s-expression subset of checks.scm and package.scm."""
    out, stack, i = [], [], 0
    while i < len(text):
        c = text[i]
        if c.isspace():
            i += 1
            continue
        if c == ";":
            while i < len(text) and text[i] != "\n":
                i += 1
            continue
        if c == "(":
            stack.append([])
            i += 1
            continue
        if c == ")":
            item = stack.pop()
            i += 1
        elif c == '"':
            i += 1
            chars = []
            while text[i] != '"':
                if text[i] == "\\":
                    i += 1
                chars.append(text[i])
                i += 1
            i += 1
            item = ("string", "".join(chars))
        else:
            start = i
            while i < len(text) and not text[i].isspace() and text[i] not in '()";':
                i += 1
            item = text[start:i]
        (stack[-1] if stack else out).append(item)
    if stack:
        raise Failure("unbalanced parentheses")
    return out


def load_package(package):
    """Return (checks, libraries) for one package directory."""
    [entries] = datums((package / "checks.scm").read_text())
    checks = []
    for entry in entries:
        if not (isinstance(entry, list) and entry and entry[0] == "check"):
            raise Failure(f"{package}/checks.scm: entry is not (check NAME ...)")
        fields = {field[0]: field[1][1] for field in entry[2:]}
        if set(fields) != {"program", "expect"}:
            raise Failure(f"{package}/checks.scm: check {entry[1]} needs exactly program and expect")
        checks.append((entry[1], package / fields["program"], fields["expect"]))
    [meta] = datums((package / "package.scm").read_text())
    libraries = next((field[1:] for field in meta[1:] if isinstance(field, list) and field[0] == "libraries"), [])
    return checks, [tuple(name) for name in libraries]


def library_source(collection, name):
    return collection / "lib" / Path(*[str(part) for part in name]).with_suffix(".sld")


def dependency_order(collection, libraries):
    """Order a package's libraries so each follows the package libraries it names."""
    spelled = {name: "(" + " ".join(name) + ")" for name in libraries}
    needs = {}
    for name in libraries:
        text = library_source(collection, name).read_text()
        needs[name] = {other for other in libraries if other != name and spelled[other] in text}
    ordered, seen = [], set()

    def visit(name, trail):
        if name in seen:
            return
        if name in trail:
            raise Failure(f"library dependency cycle through {spelled[name]}")
        for other in sorted(needs[name]):
            visit(other, trail | {name})
        seen.add(name)
        ordered.append(name)

    for name in libraries:
        visit(name, frozenset())
    return ordered


def final_line(text):
    lines = [line for line in text.splitlines() if line.strip()]
    return lines[-1] if lines else ""


def run(command, cwd, env, stdin=None):
    with (open(stdin) if stdin else open(os.devnull)) as source:
        return subprocess.run(command, cwd=cwd, env=env, stdin=source, capture_output=True, text=True)


def run_path(path, emit, program, roots, work, env, libraries, collection):
    """Run one check program on one path; return (returncode, stdout, stderr)."""
    if path == "run":
        done = run([emit, "run", *roots, str(program)], ROOT, env)
    elif path == "repl":
        done = run([emit, "repl", *roots], ROOT, env, stdin=program)
    elif path == "build":
        exe = work / "check-exe"
        done = run([emit, "build", *roots, str(program), "-o", str(exe)], ROOT, env)
        if done.returncode == 0:
            clean = {k: v for k, v in env.items() if k not in {"EMIT_LIBRARY_PATH", "EMIT_MANIFEST"}}
            done = run([str(exe)], work, clean)
    elif path == "source":
        exe = work / "check-source"
        done = run(["chez", "--libdirs", "src", "--script", "src/compile.ss", "-q", str(program),
                    *roots, "-o", str(exe)], ROOT, env)
        if done.returncode == 0:
            done = run([str(exe)], work, env)
    elif path == "pkg":
        return run_installed(emit, program, roots, work, env, collection)
    else:
        return run_artifacts(emit, program, roots, work, env, libraries, collection)
    return done.returncode, done.stdout, done.stderr


def run_installed(emit, program, roots, work, env, collection):
    """Install the package with emit pkg into a fresh user root, then run the check
    with only the package's test root, so the collection's libraries resolve from the
    user root that emit pkg wrote (change: emit-pkg)."""
    package = Path(roots[-1]).parent.name
    data = work / "xdg"
    data.mkdir(exist_ok=True)
    installed = dict(env, XDG_DATA_HOME=str(data))
    if not (data / "emit" / "packages" / f"{package}.scm").exists():
        done = run([emit, "pkg", "install", "--from", str(collection), package], ROOT, installed)
        if done.returncode != 0:
            return done.returncode, done.stdout, f"emit pkg install {package} failed\n{done.stderr}"
    done = run([emit, "run", *roots[2:], str(program)], ROOT, installed)
    return done.returncode, done.stdout, done.stderr


def run_artifacts(emit, program, roots, work, env, libraries, collection):
    """Publish every declared library with emit lib, then run against the artifacts."""
    artifacts = work / "artifacts"
    artifacts.mkdir(exist_ok=True)
    manifest = work / "artifacts.scm"
    entries = "".join(
        f' (library ({" ".join(name)}) (source "{library_source(collection, name)}") (artifacts "{artifacts}"))\n'
        for name in libraries)
    manifest.write_text("(\n" + entries + ")\n")
    # Only the artifact manifest is consulted, so name this Emit's own library
    # root explicitly for the shipped libraries the package imports.
    common = ["--manifest", str(manifest), "--no-manifest-chain", *roots, "-L", str(ROOT / "lib")]
    for name in libraries:
        done = run([emit, "lib", str(library_source(collection, name)), *common, "-o", str(artifacts)], ROOT, env)
        if done.returncode != 0:
            return done.returncode, done.stdout, f"emit lib ({' '.join(name)}) failed\n{done.stderr}"
    verbose = dict(env, EMIT_VERBOSITY="verbose")
    done = run([emit, "run", *common, str(program)], ROOT, verbose)
    if done.returncode != 0:
        return done.returncode, done.stdout, done.stderr
    # A program need not load every declared library. Every one it does load must
    # come from its published artifact, and at least one must, or the path proved
    # nothing.
    reused, recompiled = [], []
    for name in libraries:
        unit = ".".join(name)
        if f"artifact: library {unit}: reused from {artifacts}/{unit}.ll" in done.stderr:
            reused.append(name)
        if f"no entry for library {unit}:, compiling it" in done.stderr:
            recompiled.append(f"({' '.join(name)})")
    if recompiled or not reused:
        detail = ", ".join(recompiled) if recompiled else "no declared library was loaded"
        return 1, done.stdout + "\n(artifacts-not-reused)\n", \
            f"compiled from source instead of reusing its artifact: {detail}"
    say(f"    artifacts: {len(reused)}/{len(libraries)} declared libraries reused", detail=True)
    return 0, done.stdout, done.stderr


def main():
    parser = argparse.ArgumentParser(description=(__doc__ or "").splitlines()[0])
    parser.add_argument("--source", action="store_true", help="run checks through the Chez source driver")
    parser.add_argument("--emit", default=str(ROOT / "build" / "emit"), help="emit binary under test")
    parser.add_argument("--report", type=Path, help="write a JSON summary to this file")
    args = parser.parse_args()
    paths = ("source",) if args.source else NATIVE_PATHS
    if args.source and shutil.which("chez") is None:
        raise Failure("--source requires Chez (`chez`) on PATH")
    emit = str(Path(args.emit).resolve())
    if not args.source and not os.access(emit, os.X_OK):
        raise Failure(f"emit binary not executable: {emit}")
    commit, origin = read_pin()
    collection, provenance = obtain_collection(commit, origin)
    packages = sorted(p for p in (collection / "packages").iterdir() if (p / "checks.scm").exists())
    env = {k: v for k, v in os.environ.items() if k not in {"EMIT_LIBRARY_PATH", "EMIT_MANIFEST"}}
    start = time.monotonic()
    results = []
    for package in packages:
        checks, libraries = load_package(package)
        libraries = dependency_order(collection, libraries)
        roots = ["-L", str(collection / "lib"), "-L", str(package / "tests")]
        for name, program, expect in checks:
            check_start = time.monotonic()
            failed = None
            with tempfile.TemporaryDirectory() as temporary:
                work = Path(temporary)
                env["EMIT_CACHE"] = str(work / "cache")
                for path in paths:
                    code, out, err = run_path(path, emit, program, roots, work, env, libraries, collection)
                    got = final_line(out)
                    say(f"  {package.name}/{name} {path} -> {got}", detail=True)
                    if code != 0 or got != expect:
                        failed = {"path": path, "exit": code, "got": got, "stderr": err}
                        break
            elapsed = time.monotonic() - check_start
            results.append({"package": package.name, "check": name, "expect": expect,
                            "passed": failed is None, "seconds": round(elapsed, 1),
                            **({"failure": {k: v for k, v in failed.items() if k != "stderr"}} if failed else {})})
            if failed:
                say(f"fail {package.name}/{name} {failed['path']} -> expected {expect}, "
                    f"got {failed['got'] or '(no output)'}  [exit {failed['exit']}]")
                if failed["stderr"].strip():
                    print(failed["stderr"].rstrip(), file=sys.stderr)
            else:
                say(f"check {package.name}/{name} -> {expect}  [{', '.join(paths)}; {elapsed:.1f}s]")
    passed = sum(r["passed"] for r in results)
    label = f"pinned {commit[:12]}" if provenance["pinned"] else \
        f"UNPINNED {provenance['commit'][:12]}{' dirty' if provenance['dirty'] else ''}"
    say(f"verify emit-packages -> {passed}/{len(results)} checks passed  "
        f"[{label}; {len(packages)} packages; {time.monotonic() - start:.1f}s]")
    if args.report:
        args.report.write_text(json.dumps({"collection": provenance, "paths": list(paths),
                                           "results": results}, indent=2) + "\n")
    return 0 if passed == len(results) else 1


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Failure as error:
        print(f"emit-packages: {error}", file=sys.stderr)
        sys.exit(1)
