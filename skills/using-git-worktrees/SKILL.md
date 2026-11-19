---
name: using-git-worktrees
description: >
  Isolate feature work in a Git worktree before implementation or plan
  execution. Use when starting work that needs isolation from the current
  workspace, when parallel branches would collide, or when the harness offers a
  native worktree tool. Do not use when the user explicitly wants to work in
  place, or when the repository is not a Git checkout.
category: workflow
version: 1.0.0
tags: [git, workflow, discipline]
license: MIT
source: https://github.com/obra/superpowers
upstream-commit: 22f0b463e7a5
---

# Using Git Worktrees

Ensure work happens in an isolated workspace. Prefer the platform's native
worktree tools. Fall back to manual Git worktrees only when no native tool is
available.

**Core principle:** Detect existing isolation first. Then use native tools.
Then fall back to Git. Never fight the harness.

## Step 0: Detect existing isolation

Before creating anything, check whether you are already isolated:

```bash
GIT_DIR=$(cd "$(git rev-parse --git-dir)" 2>/dev/null && pwd -P)
GIT_COMMON=$(cd "$(git rev-parse --git-common-dir)" 2>/dev/null && pwd -P)
BRANCH=$(git branch --show-current)
```

`GIT_DIR != GIT_COMMON` is also true inside submodules. Verify you are not in a
submodule before treating it as a linked worktree:

```bash
git rev-parse --show-superproject-working-tree 2>/dev/null
```

If the output is a path, you are in a submodule; treat it as a normal repo.

If `GIT_DIR != GIT_COMMON` and this is not a submodule, you are already in a
linked worktree. Skip creation and report the path and branch. If the HEAD is
detached, say that branch creation is needed at finish time.

If you are in a normal checkout, ask for consent before creating a worktree
unless the user or project instructions already declared a preference.

## Step 1: Create the isolated workspace

### Prefer native tools

If the harness provides a worktree command, `EnterWorktree`, `/worktree`, or a
`--worktree` flag, use it. Native tools handle placement, branch creation, and
cleanup, and avoid phantom state the harness cannot manage.

### Git fallback

Only use `git worktree add` when there is no native tool.

Choose the directory in this order:

1. An explicit user preference.
2. An existing project-local `.worktrees/` directory.
3. An existing `worktrees/` directory.
4. `.worktrees/` at the project root.

For a project-local directory, verify it is ignored before creating anything:

```bash
git check-ignore -q .worktrees 2>/dev/null || git check-ignore -q worktrees 2>/dev/null
```

If it is not ignored, add it to `.gitignore` and commit that change before
proceeding. Never risk committing the worktree contents.

Create the worktree:

```bash
path="$LOCATION/$BRANCH_NAME"
git worktree add "$path" -b "$BRANCH_NAME"
cd "$path"
```

If a sandbox blocks creation, tell the user and work in place only with their
consent.

## Step 2: Project setup

Detect the package manager from the repository, not from memory:

- `pnpm-lock.yaml` → `pnpm install`
- `yarn.lock` → `yarn install`
- `package-lock.json` → `npm ci`
- `Cargo.toml` → `cargo build`
- `uv.lock` → `uv sync`
- `pyproject.toml` → the project's documented installer
- `go.mod` → `go mod download`

Run only the setup the project documents. Do not invent commands.

## Step 3: Verify a clean baseline

Run the project's test command before editing. If tests fail, report the
failures and ask whether to proceed or investigate. If they pass, report:

```text
Worktree ready at <full-path>
Baseline passing: <N> tests, 0 failures
Ready to implement <feature-name>
```

## Common mistakes

| Excuse | Reality |
|---|---|
| "Obviously this is not a worktree" | Run the detection commands. |
| "`git worktree add` is quicker" | A native tool owns cleanup and harness state. |
| "The directory must already be ignored" | Run `git check-ignore`. |
| "Any directory name works" | Follow the priority order. |
| "Baseline tests can wait" | A dirty baseline makes failures ambiguous. |
