---
name: emit-finish-change
description: Finish a completed, implemented OpenSpec change in Emit into one reviewable pull request — preflight checks, semantic spec sync, archive, commit, PR — and afterwards follow a merged release through tag, source release, and channels. Use when the user wants to finish, wrap up, hand off, or open the PR for a completed change, or to follow or check on a release after merging.
allowed-tools: Bash(tools/release-handoff.sh:*), Bash(tools/repo-policy.sh:*), Bash(openspec:*), Bash(git:*), Bash(gh pr view:*), Bash(gh pr checks:*), Read, Edit, Write
license: MIT
metadata:
  author: emit
  version: "1.0"
---

Finish a completed versioned change into one pull request that carries the implementation, the
updated main specifications, the archived change, `VERSION`, and its changelog section. Then,
once the maintainer merges it, follow that merge to the channels.

The split is deliberate (change: automate-release-handoff, design D1):

- **You** do the judgment: is the work actually done, how each delta merges into the main spec,
  and what the pull request says.
- **`tools/release-handoff.sh`** does everything checkable or mutating on GitHub. Never
  re-implement one of its checks by hand, and never replace its result with your own opinion.

Stop at the first step that fails and report it with its stage name. Nothing here merges a pull
request: merging the reviewed versioned pull request is the maintainer's release approval. Merge
only when the user explicitly asks you to, in this conversation, for this pull request.

## Lifecycle words

Report progress in exactly these stages, and never claim a later one early:

1. **implementation complete**: tasks done and validation owed or passed;
2. **ready for review**: archived, committed, pull request ready, checks reported;
3. **merged**;
4. **tagged**;
5. **source published**: GitHub release with archive and `SHA256SUMS`;
6. **channel available**: per channel (Homebrew, Nix, OCI), only once the channel itself names
   the release. A published source release is *not* a Homebrew release.

## Part 1: finish the change

1. **Select the change explicitly.** Use the name the user gave. Otherwise run
   `tools/release-handoff.sh preflight`, which lists the active changes and exits 2. Ask the user
   to choose; never guess between several.

2. **Preflight.** Run `tools/release-handoff.sh preflight <change>`. It reports `stage=` lines for
   `base`, `tasks`, `specs`, `version`, `bootstrap`, and `validation`, exiting 1 on a failure and
   3 when something is owed.
   - On a **failure**, stop. Relay the stage, its reason, and its remedy. Fix it only if the user
     asks; it usually means work is unfinished (unchecked tasks, a stale bootstrap, a version
     another pull request already released, a delta that conflicts with the live main spec).
   - **`specs` owed** names a description paragraph a MODIFIED requirement rewrites or drops.
     Read both versions. If the change is intended, continue; if a paragraph was lost, restore
     it in the delta before syncing.
   - **`validation` owed** lists the checks the diff obliges. Do not rerun regeneration or
     suites merely because documentation, specs, or archive metadata changed: preflight already
     accepts an earlier `Required validation` pass when only documentation followed it. When
     there is no CI evidence yet, continue to step 6 with a draft pull request and let CI produce
     it.
   - `version ok "no bump: requester override"` requires `--allow-no-bump`, which you pass only
     when the user has explicitly deferred or waived the bump.

3. **Judge completion against evidence.** Read `tasks.md` alongside the code. For each checked
   task, confirm the change exists and that its stated verification was run or is covered by
   the owed checks. A checked box is a claim, not proof. If a task is not actually done, stop and
   say which.

4. **Sync the specifications.** Follow the `openspec-sync-specs` skill to merge each delta into
   `openspec/specs/<capability>/spec.md` intelligently: a MODIFIED requirement is a full
   rewrite of the live main requirement, so diff it against the main spec, never an archived
   change. Then:
   - `openspec validate --all` must pass. Do not gate on `--all --strict`: several untouched
     main specs carry long-requirement warnings that predate the change and are not its to fix.
     Strict validation of the change itself is preflight's `specs` stage;
   - `grep -rn '^## \(ADDED\|MODIFIED\|REMOVED\|RENAMED\) Requirements' openspec/specs/` must
     print nothing, since a delta header in a main spec silently truncates it;
   - count each touched requirement's scenarios before and after; none may disappear unless
     the delta REMOVED it.

5. **Archive and commit.**
   - Run `openspec archive <change> --skip-specs --yes`; `--skip-specs` because step 4 already
     synced, and without it archive applies the deltas a second time.
   - Review `git status` and `git diff` for the complete intended diff: the implementation,
     updated main specs, the archive move, `VERSION`, `CHANGELOG.md`, and regenerated
     `bootstrap/` files when preflight's `bootstrap` stage says they are owed. Nothing else.
   - Commit in the repository's style (text-only conventional commits, brief, no emoji), with
     the attribution lines the session requires. Commit the archive as its own commit,
     `docs: archive <change>`, so preflight can see that only documentation followed validation.
   - Rerun preflight; every stage except possibly `validation` must be ok.

6. **Open or update the pull request.**
   - Fill `pr-body.md` (next to this file) into a scratch file. Replace every `{{...}}`.
   - Reference issues deliberately: `Fixes #N` closes it on merge, and `Refs #N` does not.
     Never write a negated closing keyword such as "does not close #N": GitHub closes the issue
     anyway, and `pr` refuses the body. Write "remains open on #N" instead.
   - Run `tools/release-handoff.sh pr <change> --title "<type>: <summary>" --body-file <file>`.
     Add `--draft` while validation is still owed. It pushes the branch and creates the pull
     request, or edits the open one in place; rerunning never duplicates it.
   - Once preflight is clean, run the same command with `--ready`. It refuses until the archive
     is committed.

7. **Report status.** Run `tools/release-handoff.sh status`. Relay the pull request URL, the head,
   the `Required validation` state with its link, and the `next=` action verbatim. At this point
   the change is **ready for review**. Stop here unless the user asks you to merge.

## Part 2: follow a merged release

8. When the user reports a merge, or asks how the release is doing, get the merge commit from
   `tools/release-handoff.sh status <pr>` (`merge_commit=`). Then run
   `tools/release-handoff.sh follow <sha>`; add `--wait` to poll until no stage is pending.

9. Relay the `stage=` lines and the identity lines as they are: change archive, pull request,
   merged commit, tag, release URL, archive SHA-256, tap and Nix pull requests, OCI digest. For a
   failed stage, give its run link and remedy:
   - rerun a transient failure on the same tag;
   - dispatch `channels.yml` with `tag` and `publish` for a failed channel;
   - fix forward with a new patch version for a defect.

   Never suggest moving a tag or replacing published assets.

10. A promotion that reports `[manual merge: <reason>]` needs a maintainer: relay the reason and
    the pull request. When the reason is a policy setting, `tools/repo-policy.sh check` shows
    what to fix.

## Guardrails

- One change per invocation, named explicitly.
- Never edit `bootstrap/` by hand; regeneration is `make regen`, run only when preflight says it
  is owed and the user agrees, since it takes several minutes.
- Never force-push, move a tag, or merge without an explicit request.
- If a command's output contradicts what you believe, the command wins; report the discrepancy.
