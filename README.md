<div align="center">

# apocryphon-registry

**The official skill catalog for [Apocryphon](https://github.com/marlonbaltodano11/apocryphon).**

[![Validate registry](https://github.com/marlonbaltodano11/apocryphon-registry/actions/workflows/validate.yml/badge.svg)](https://github.com/marlonbaltodano11/apocryphon-registry/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT%20except%20CC--BY--SA-blue.svg)](LICENSE)

</div>

---

20 skills · 9 packs · 36 curated tags.

This repository is the **source of truth** for Apocryphon's skill catalog. It is
a plain Git repository: versioned, reviewable, distributable over SSH or HTTPS
and fully usable offline once cloned. All skill content is written in English;
ids and metadata stay portable across Claude Code, Cursor and OpenCode.

The catalog is deliberately small. Every skill must encode a procedure,
decision, or reference set that materially changes agent behavior. Passive
framework knowledge belongs in project documentation or `AGENTS.md`, not in a
skill.

## Use the catalog

```bash
# This is the default catalog: a plain `apocryphon init` connects to it
apocryphon init

# You can also point explicitly at this repository
apocryphon init --registry git@github.com:marlonbaltodano11/apocryphon-registry.git

# Explore
apocryphon categories
apocryphon tags
apocryphon search postgres
apocryphon find

# Install individual skills
apocryphon install tdd diagnosing-bugs postgres-best-practices
apocryphon enable --global verification-before-completion

# Or apply an area pack
apocryphon pack apply core
apocryphon pack apply web
```

Local checkout while developing:

```bash
apocryphon init --registry /path/to/apocryphon-registry
```

## Packs

| Pack | Skills | What it includes |
| --- | ---: | --- |
| `core` | 7 | Daily discipline: planning, TDD, diagnosis, review, feedback, verification and worktrees |
| `design` | 2 | Deep-module design and active domain modeling |
| `web` | 4 | React performance, component composition, interface quality and Next.js runtime verification |
| `dotnet` | 3 | ASP.NET Core Web APIs, .NET test execution and TDD |
| `python` | 2 | Modern Python tooling and TDD |
| `postgres` | 1 | Schema, query, index, lock, connection and security rules |
| `quality` | 3 | Code review, property-based testing and differential security review |
| `personal-stack` | 8 | Curated defaults for TypeScript/Node, React/Next.js, .NET, Python and PostgreSQL |
| `meta` | 1 | Writing skills and documents consumed by coding agents |

Pack `personal-stack` intentionally stays at the default context warning
threshold. Install only the skills the current project needs.

## Skills

### Workflow (11)

| Skill | Tags | What it does | Source |
| --- | --- | --- | --- |
| [`tdd`](./skills/tdd) | `tdd`, `testing`, `quality` | Red-green-refactor with public seams, independent oracles and vertical slices | Matt Pocock |
| [`diagnosing-bugs`](./skills/diagnosing-bugs) | `debugging`, `workflow`, `quality` | Build a tight failing feedback loop, minimize the repro, then test falsifiable hypotheses | Matt Pocock |
| [`writing-plans`](./skills/writing-plans) | `planning`, `workflow`, `discipline` | Executable plans with exact files, interfaces, tests and review focus | Superpowers |
| [`verification-before-completion`](./skills/verification-before-completion) | `discipline`, `quality`, `testing` | Require fresh command output before any success or completion claim | Superpowers |
| [`code-review`](./skills/code-review) | `code-review`, `review`, `quality` | Separate standards compliance from spec fidelity when reviewing a diff | Matt Pocock |
| [`receiving-code-review`](./skills/receiving-code-review) | `code-review`, `review`, `discipline` | Verify review feedback before implementing it; clarify, push back or fix | Superpowers |
| [`using-git-worktrees`](./skills/using-git-worktrees) | `git`, `workflow`, `discipline` | Isolate work with native tools or a safe Git worktree fallback | Superpowers |
| [`property-based-testing`](./skills/property-based-testing) | `testing`, `property-based-testing`, `quality` | Choose real properties, detect tautological tests and interpret shrunk failures | Trail of Bits |
| [`differential-review`](./skills/differential-review) | `security`, `code-review`, `appsec` | Security review of a diff with risk triage, git history, blast radius and adversarial scenarios | Trail of Bits |
| [`dotnet-run-tests`](./skills/dotnet-run-tests) | `dotnet`, `testing`, `quality` | Pick the correct VSTest, MTP, xUnit, MSTest, NUnit or TUnit command | .NET team |
| [`next-dev-loop`](./skills/next-dev-loop) | `nextjs`, `frontend`, `e2e`, `testing` | Verify edits against a running Next.js app through MCP and a real browser | Next.js team |

### Domain (8)

| Skill | Tags | What it does | Source |
| --- | --- | --- | --- |
| [`codebase-design`](./skills/codebase-design) | `architecture`, `design`, `refactor` | Deep modules, seams, adapters, leverage and locality | Matt Pocock |
| [`domain-modeling`](./skills/domain-modeling) | `architecture`, `design`, `docs`, `adr` | Sharpen terminology, maintain a glossary and write ADRs sparingly | Matt Pocock |
| [`react-best-practices`](./skills/react-best-practices) | `react`, `frontend`, `performance`, `nextjs` | 70 prioritized React/Next.js rules with incorrect and corrected examples | Vercel |
| [`composition-patterns`](./skills/composition-patterns) | `react`, `frontend`, `architecture`, `design` | Compound components, explicit variants and state ownership for reusable APIs | Vercel |
| [`web-interface-guidelines`](./skills/web-interface-guidelines) | `frontend`, `accessibility`, `ui`, `design` | Offline review against 100+ accessibility, focus, form, animation and UX rules | Vercel Labs |
| [`postgres-best-practices`](./skills/postgres-best-practices) | `postgres`, `database`, `performance`, `security` | Schema, indexes, queries, locks, pooling, monitoring and RLS with SQL examples | Supabase |
| [`modern-python`](./skills/modern-python) | `python`, `quality`, `backend` | uv, ruff, ty, pytest, pyproject, migration, security tooling and PEP 723 | Trail of Bits |
| [`dotnet-webapi`](./skills/dotnet-webapi) | `dotnet`, `csharp`, `api`, `http`, `backend` | DTOs, Minimal APIs, controllers, OpenAPI, Problem Details and `.http` verification | .NET team |

### Meta (1)

| Skill | Tags | What it does | Source |
| --- | --- | --- | --- |
| [`writing-for-agents`](./skills/writing-for-agents) | `skills`, `authoring`, `docs`, `meta` | Context pointers, progressive disclosure, completion criteria and pruning | Matt Pocock |

## Sources and licensing

The skills are adapted from maintained repositories with public licenses:

- [Matt Pocock skills](https://github.com/mattpocock/skills) — MIT
- [Superpowers](https://github.com/obra/superpowers) — MIT
- [Trail of Bits skills](https://github.com/trailofbits/skills) — CC-BY-SA-4.0
- [Supabase agent skills](https://github.com/supabase/agent-skills) — MIT
- [Vercel agent skills](https://github.com/vercel-labs/agent-skills) — MIT declared in the upstream README and skill metadata
- [Vercel Web Interface Guidelines](https://github.com/vercel-labs/web-interface-guidelines) — MIT
- [Next.js](https://github.com/vercel/next.js) — MIT
- [.NET skills](https://github.com/dotnet/skills) — MIT

Each skill has a `SOURCE.md` with its upstream path, pinned commit, license and
a summary of modifications. See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)
and [LICENSES/](LICENSES/) for the complete attribution and license texts.

The catalog as a whole is MIT, except the Trail of Bits adaptations, which are
distributed under CC-BY-SA-4.0. No upstream material is included without its
license and attribution.

## Using a fork or a private registry

A single source is active at a time. Apocryphon keeps the official catalog as
the default, and you can switch to a fork, a local checkout or an Azure DevOps
repository without uninstalling anything:

```bash
apocryphon registry show
apocryphon registry use ~/dev/apocryphon-registry
apocryphon registry use git@ssh.dev.azure.com:v3/org/project/skills
apocryphon registry use <url> --ref v1.0.0
apocryphon registry default
```

A compatible registry only needs:

```text
my-registry/
├── registry.json
└── skills/<id>/SKILL.md
```

`registry.json` must declare `name`, `version: 1`, `skills` (with `id` and
`path`) and optionally `packs` and `taxonomy`. Git sources are cloned into
`~/.apocryphon/registries/<hash>/`; switching sources never deletes installed
skills, local edits, backups or project activations. Active packs keep their
definitions even if the new catalog does not include them.

## Skill contract

Every `SKILL.md` must pass `apocryphon validate --registry --strict`:

```markdown
---
name: my-skill
description: >
  Use this skill when the user needs <specific task>. Do not use it for
  <excluded cases>.
category: workflow          # domain | workflow | meta
version: 1.0.0
tags: [git, workflow]        # at least one, from registry.json taxonomy
license: MIT
source: https://github.com/example/skills
upstream-commit: abc1234
---

# My skill

## When to use
- ...

## Instructions
1. ...

## Verification
Run the project checks before finishing.
```

### Rules

| Field | Requirement |
| ----- | ----------- |
| `name` | Lowercase kebab-case, equal to the folder name (1–64 chars) |
| `description` | 20–1024 chars with **explicit triggers** and, ideally, negative triggers |
| `category` | Required: `domain`, `workflow` or `meta` |
| `tags` | Required: at least one tag from the taxonomy in `registry.json` |
| Body | At most ~150 lines; long material belongs in `references/` and must be linked |
| `scripts/` | Executable, self-contained checks; never include secrets or network calls |
| `references/` | Progressive disclosure for examples, schemas and long documentation |

The description is the **only** text clients use to decide when to load a skill.
Write it for retrieval, not marketing. All skill content is in English so that
upstream technical language, commands and code examples stay consistent.

## Adding a skill

1. Create the folder and the `SKILL.md`:

   ```bash
   mkdir -p skills/my-skill
   $EDITOR skills/my-skill/SKILL.md
   ```

2. Add new tags to the `taxonomy` in `registry.json` if needed (curated,
   lowercase kebab-case, with a `label`).

3. If the skill is adapted, add its `SOURCE.md` and update
   `THIRD_PARTY_NOTICES.md` and `LICENSES/`.

4. Regenerate the index and validate:

   ```bash
   npm install
   npm run generate-index
   npm run check
   npm run validate
   ```

5. Open a pull request using a semantic title (`feat(skills): add …`).

### Pull request checklist

- [ ] `name` matches the folder and the frontmatter is valid.
- [ ] The description has concrete triggers and negative triggers.
- [ ] Category and at least one taxonomy tag are present.
- [ ] The body is concise; long material lives in `references/`.
- [ ] Source, commit and license are recorded for adapted content.
- [ ] Scripts are executable, deterministic and contain no secrets.
- [ ] `npm run check-index` passes (no index drift).
- [ ] `npm run validate` passes.

## Index generation

`registry.json` is **generated** from `skills/`; never edit the skills array by
hand.

```bash
npm run generate-index   # rewrite registry.json
npm run check-index      # fail if registry.json is out of date (CI)
```

The generator reads each `SKILL.md` with `gray-matter`, derives
`id`/`version`/`description`/`category`/`tags`, sorts the entries and preserves
the `taxonomy` and `packs` sections from the existing file.

## Validation and CI

`.github/workflows/validate.yml` runs on every push and pull request:

1. `npm ci` and `npm run check-index` (fails on index drift).
2. `npm run validate`, which initializes an isolated Apocryphon home and runs
   `apocryphon validate --registry --strict`.

The strict validator enforces the frontmatter contract, category, taxonomy tags,
body size, references and script fingerprints. It never touches your personal
`~/.apocryphon`.

## Security

- Skills are data: installing one **never executes** its scripts.
- Scripts run only when the agent decides to run them; they must be auditable,
  self-contained and deterministic.
- Never commit credentials, tokens or `.env` files.
- Apocryphon records SHA-256 fingerprints and reports tampering in
  `apocryphon status`.

## Versioning

- Each skill carries a `version` in its frontmatter.
- The Git history is the changelog; use semantic commits.
- `registry.json` is regenerated on every change, so the catalog never drifts.
- Consumers can pin a commit or a tag of this repository if they need a frozen
  catalog for a team.
- `v1.0.0` preserves the original 43-skill catalog. `v2.0.0` starts the
  curated 20-skill catalog.

## Contributing

Issues and PRs are welcome. Keep skills focused, portable and free of
organization-specific secrets. New skills should add a procedure or reference
set that is not already covered by an existing skill or by framework
documentation.

## License

[MIT](LICENSE) © Marlon Baltodano, except the Trail of Bits adaptations marked
`CC-BY-SA-4.0`. See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
