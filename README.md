<div align="center">

# apocryphon-registry

**The official skill catalog for [Apocryphon](https://github.com/marlonbaltodano11/apocryphon).**

[![Validate registry](https://github.com/marlonbaltodano11/apocryphon-registry/actions/workflows/validate.yml/badge.svg)](https://github.com/marlonbaltodano11/apocryphon-registry/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

</div>

---

This repository is the **source of truth** for Apocryphon's skill catalog. It is
a plain Git repository: versioned, reviewable, distributable over SSH or HTTPS
and fully usable offline once cloned.

It ships the `core-discipline` pack and a set of production-quality skills for
Claude Code, Cursor and OpenCode.

## Use the catalog

```bash
# Connect Apocryphon to this registry
apocryphon init --registry git@github.com:marlonbaltodano11/apocryphon-registry.git

# Explore
apocryphon categories
apocryphon search commit
apocryphon search --tag discipline

# Install and activate
apocryphon install workflow-atomic-commits
apocryphon enable --global workflow-atomic-commits
apocryphon pack apply core-discipline
```

Or use a local checkout while developing:

```bash
apocryphon init --registry /path/to/apocryphon-registry
```

## What's inside

```text
apocryphon-registry/
├── registry.json              # generated index: taxonomy, packs and skills
├── skills/
│   ├── workflow-read-only-plan/
│   │   └── SKILL.md
│   ├── workflow-atomic-commits/
│   │   ├── SKILL.md
│   │   └── scripts/check-secrets.sh
│   ├── workflow-review-triage/
│   │   └── SKILL.md
│   └── api-error-handling/
│       ├── SKILL.md
│       └── references/error-envelope.md
├── scripts/generate-index.mjs # index generator + drift check
└── .github/workflows/validate.yml
```

| Skill | Category | What it does |
| ----- | -------- | ------------ |
| `workflow-read-only-plan` | workflow | Investigate first, propose atomic phases with verification commands, wait for approval. |
| `workflow-atomic-commits` | workflow | Split work into compilable semantic commits and verify before each one. |
| `workflow-review-triage` | workflow | Classify PR feedback as valid/optional/false positive before editing. |
| `api-error-handling` | domain | Stable HTTP error envelopes, safe messages and logs. |

**Pack `core-discipline`** bundles the three workflow skills so they can be
activated together with `apocryphon pack apply core-discipline`.

## Skill contract

Every `SKILL.md` must pass `apocryphon validate --registry --strict`:

```markdown
---
name: my-skill
description: >
  Use this skill whenever the user needs <specific task> and the project
  conventions apply. Do not use it for <excluded cases>.
category: workflow          # domain | workflow | meta
version: 1.0.0
tags: [git, commits]        # at least one, from registry.json taxonomy
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
| `name` | Lowercase kebab-case, equal to the folder name (1–64 chars). |
| `description` | 20–1024 chars with **explicit triggers** (when to use it) and ideally when **not** to use it. |
| `category` | Required: `domain`, `workflow` or `meta`. |
| `tags` | Required: at least one tag from the taxonomy in `registry.json`. |
| Body | Under ~150 lines. Long material belongs in `references/` and must be linked from `SKILL.md`. |
| `scripts/` | Executable, self-contained checks. Never include secrets or network calls. |
| `references/` | Progressive disclosure: examples, schemas or long documentation. |

The description is the **only** text clients use to decide when to load a skill;
write it for retrieval, not marketing.

## Adding a skill

1. Create the folder and the `SKILL.md`:

   ```bash
   mkdir -p skills/my-skill
   $EDITOR skills/my-skill/SKILL.md
   ```

2. Add new tags to the `taxonomy` in `registry.json` if needed (curated,
   lowercase kebab-case, with a `label` and optional `description`).

3. Regenerate the index and validate:

   ```bash
   npm install
   npm run generate-index
   npm run check
   npx --yes @apocryphon/cli@latest validate --registry --strict
   ```

4. Open a pull request using a semantic title (`feat(skills): add …`).

### Pull request checklist

- [ ] `name` matches the folder and the frontmatter is valid.
- [ ] The description has concrete triggers and, ideally, negative triggers.
- [ ] Category and at least one taxonomy tag are present.
- [ ] The body is concise; long material lives in `references/`.
- [ ] Scripts are executable, deterministic and contain no secrets.
- [ ] `npm run check-index` passes (no index drift).
- [ ] `validate --registry --strict` passes once the CLI is published.

## Index generation

`registry.json` is **generated** from `skills/`; never edit it by hand.

```bash
npm run generate-index   # rewrite registry.json
npm run check-index      # fail if registry.json is out of date (CI)
```

The generator reads each `SKILL.md` with `gray-matter`, derives
`id`/`version`/`description`/`category`/`tags`, sorts the entries and preserves
the `taxonomy` and `packs` sections from the existing file.

`registry.json` shape:

```jsonc
{
  "name": "apocryphon-registry",
  "version": 1,
  "taxonomy": {
    "categories": ["domain", "workflow", "meta"],
    "tags": [{ "id": "git", "label": "Git" }]
  },
  "packs": {
    "core-discipline": {
      "description": "…",
      "skills": ["workflow-read-only-plan", "workflow-atomic-commits"]
    }
  },
  "skills": [
    {
      "id": "workflow-atomic-commits",
      "version": "1.0.0",
      "category": "workflow",
      "path": "skills/workflow-atomic-commits",
      "tags": ["git", "commits"]
    }
  ]
}
```

## Taxonomy and packs

- **Categories** are coarse (`domain`, `workflow`, `meta`) and drive grouping.
- **Tags** are curated in `registry.json`; unknown tags fail strict validation.
- **Packs** are named groups of skills, applied with
  `apocryphon pack apply <name>` per project or with `--global`.
- Skill ids stay flat (folder names); registry scoping is handled by Apocryphon,
  not by namespacing ids, so clients keep discovering skills by folder name.

## Validation and CI

`.github/workflows/validate.yml` runs on every push and pull request:

1. `npm ci` and `npm run check-index` (fails on index drift).
2. `npx @apocryphon/cli validate --registry --strict` when the CLI is published.

Locally, `npm run check` is the fast loop. The strict validator enforces the
frontmatter contract, category, taxonomy tags, body size, references and script
fingerprints.

## Security

- Skills are data: installing one **never executes** its scripts.
- Scripts run only when the agent decides to run them; they must be auditable,
  self-contained and deterministic.
- Never commit credentials, tokens or `.env` files. `workflow-atomic-commits`
  ships `scripts/check-secrets.sh` as a pre-commit guard.
- Apocryphon records SHA-256 fingerprints and reports tampering in
  `apocryphon status`.

## Versioning

- Each skill carries a `version` in its frontmatter.
- The Git history is the changelog; use semantic commits.
- `registry.json` is regenerated on every change, so the catalog never drifts.
- Consumers can pin a commit or a tag of this repository if they need a frozen
  catalog for a team.

## Contributing

Issues and PRs are welcome. For large changes, open an issue first describing the
skill, its triggers and why it is broadly useful. Keep skills focused, portable
and free of organization-specific secrets.

## License

[MIT](LICENSE) © Marlon Baltodano
