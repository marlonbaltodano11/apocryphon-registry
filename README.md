# apocryphon-registry

Official skill catalog for [Apocryphon](https://github.com/Majokan/apocryphon).

## Layout

```text
skills/<skill-id>/
├── SKILL.md          # required: frontmatter + instructions
├── references/       # optional: deep documentation loaded on demand
└── scripts/          # optional: deterministic checks the agent can run
```

`registry.json` is **generated** from `skills/`; never edit it by hand.

## Skill contract

Every `SKILL.md` must pass `apocryphon validate --registry --strict`:

- `name`: lowercase kebab-case, equal to the folder.
- `description`: 20–1024 characters with **explicit triggers** (when to use it)
  and, ideally, when **not** to use it.
- `category`: one of `domain`, `workflow`, `meta` (required in this registry).
- `tags`: at least one tag from the taxonomy in `registry.json`.
- Body: under ~150 lines. Move long material to `references/` and link it.
- `scripts/`: executable, self-contained checks (no network).

## Add a skill

```bash
cp -r skills/workflow-atomic-commits skills/my-new-skill
# edit SKILL.md
npm run generate-index
npm run check
```

Open a pull request. CI validates the index and (once the CLI is published)
runs `apocryphon validate --registry --strict`.

## Use the registry

```bash
apocryphon init --registry git@github.com:Majokan/apocryphon-registry.git
apocryphon search prisma
apocryphon install workflow-atomic-commits
```

## License

MIT
