---
name: next-dev-loop
description: >
  Verify Next.js runtime behavior after editing app code. Use when a change must
  be confirmed in a running Next.js app, not just compiled or typechecked, and
  when the project has a running next dev server with the Next.js MCP endpoint
  and agent-browser available. Do not use for projects below Next.js 16.3,
  webpack-only dev setups, or changes that can be fully verified by a unit test.
category: workflow
version: 1.0.0
tags: [nextjs, frontend, e2e, testing]
license: MIT
source: https://github.com/vercel/next.js
upstream-commit: 5395cf44d1fc
---

# Next.js Dev Loop

Verify the edit/verify rhythm during `next dev`: after a change, confirm it
actually works at runtime, not only that types and builds are happy.

You verify through two views of the same app:

- **`/_next/mcp`**: Next.js's view of routes, segments, RSC, Server Actions,
  server logs, and errors. Call `tools/list` for the current surface.
- **`agent-browser`**: a real Chrome that exposes DOM, console, network, React
  fiber, and vitals. Run `agent-browser skills get core` once for the
  version-matched guide before driving it.

The two views cross-check each other.

## Requirements

- Next.js **16.3+** with **Turbopack**, which provides `/_next/mcp` and
  `get_compilation_issues`.
- `agent-browser` **>= 0.31.1** for React introspection, worktree-scoped
  sessions, and idempotent `--restore`.

These are hard floors. If anything is missing, tell the user how to upgrade and
stop. Do not fall back to grepping source or a weaker probe.

- Upgrade Next.js with the project's package manager: `pnpm next upgrade` or
  `npx next upgrade`.
- Install or upgrade: `npm i -g agent-browser@latest`.

## Preflight

Once per session, confirm both views are live.

1. Create one stable session per checkout:

   ```bash
   SESSION="$(agent-browser session id --scope worktree --prefix next-dev-loop)"
   export AGENT_BROWSER_SESSION="$SESSION"
   export AGENT_BROWSER_RESTORE="$SESSION"
   agent-browser --session "$SESSION" --restore --enable react-devtools open <url>
   ```

   Keep routine verification headless. If login requires user interaction, use
   `--headed` and continue with the same session.

2. Probe `/_next/mcp` with `tools/list`. Read the port from the `next dev`
   banner; if it is not 3000, set
   `NEXT_MCP_URL=http://localhost:<port>/_next/mcp`.

   - Unreachable: either the dev server is not running or Next.js is below
     16.3. Check `package.json`, then refuse.
   - `get_compilation_issues` missing: Next.js is below 16.3. Refuse.
   - A Turbopack-unavailable error means the app uses webpack. Refuse.
   - Call `get_routes` to build the route map.

## Loop

Before an edit, ask the running app which files rendered the current route and
use those as the search scope.

After an edit, check four failure modes:

- **Compiles**: `get_compilation_issues`.
- **Runs without errors**: `/_next/mcp` server and browser errors.
- **Behaves as intended**: drive the page with `agent-browser` and assert what
  the user sees.
- **React behavior**: use `agent-browser react tree --json` for component tree,
  props, state, and render counts when React-level behavior matters.

Pick the specific tool from `tools/list` or the agent-browser manual; do not
guess subcommands from memory.

## Gotchas

- Preserve `.next` while `next dev` is running. Moving or deleting it resets
  the server's generated state and incremental caches.
- Give production test servers ports distinct from dev, or stop dev first.
- Export `AGENT_BROWSER_SESSION` and `AGENT_BROWSER_RESTORE` in every shell that
  drives the browser, or pass `--session "$SESSION" --restore` each time.
- If the two views disagree, suspect stale browser state before the app.
- After a click or navigation, use `wait --load networkidle`, then snapshot.
- A blank page or missing browser session usually means a dropped session.
  Reopen it with the same flags; do not fall back to `curl`.
- React introspection output is stale after navigation. Re-run it.
- `/_next/mcp` replies are SSE; read the JSON from the `data:` line.
- `get_errors` and `get_page_metadata` need at least one navigation.

## MCP tools

| Tool | Purpose |
|---|---|
| `get_project_metadata` | Project path, dev URL, bundler |
| `get_routes` | Route map from the filesystem |
| `get_errors` | Runtime and build errors, including browser errors |
| `get_page_metadata` | Segment trie and router type |
| `get_logs` | Server log file path |
| `get_server_action_by_id` | Resolve a hashed Server Action |
| `get_compilation_issues` | Turbopack compile status |

If `tools/list` is missing a tool, re-run preflight and refuse.

## Teardown

Close with the same session and restore context:

```bash
agent-browser --session "$SESSION" --restore close
```

`close` saves cookies and storage for the next loop. Leave `next dev` running.
