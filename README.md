<div align="center">

# apocryphon-registry

**The official skill catalog for [Apocryphon](https://github.com/marlonbaltodano11/apocryphon).**

[![Validate registry](https://github.com/marlonbaltodano11/apocryphon-registry/actions/workflows/validate.yml/badge.svg)](https://github.com/marlonbaltodano11/apocryphon-registry/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

</div>

---

43 skills · 16 packs · 69 curated tags.

This repository is the **source of truth** for Apocryphon's skill catalog. It is
a plain Git repository: versioned, reviewable, distributable over SSH or HTTPS
and fully usable offline once cloned. Descriptions are written in Spanish; ids
and metadata stay portable across Claude Code, Cursor and OpenCode.

## Use the catalog

```bash
# Connect Apocryphon to this registry
apocryphon init --registry git@github.com:marlonbaltodano11/apocryphon-registry.git

# Explore
apocryphon categories
apocryphon tags
apocryphon search docker
apocryphon find

# Install individual skills
apocryphon install workflow-root-cause-debug devops-dockerfile
apocryphon enable --global workflow-atomic-commits

# Or apply an area pack
apocryphon pack apply backend-api
apocryphon pack apply testing-quality
```

Local checkout while developing:

```bash
apocryphon init --registry /path/to/apocryphon-registry
```

## Packs

| Pack | Skills | What it includes |
| --- | --- | --- |
| `core-discipline` | 3 | Operational discipline for native IDEs/CLIs: plan in read-only mode, commit atomically and triage reviews… |
| `workflow-pro` | 7 | Deeper execution workflows: root-cause debugging, safe refactors, TDD, releases, dependency upgrades,… |
| `backend-api` | 6 | Backend and API foundations: REST design, auth, migrations, query performance, observability and error… |
| `frontend-web` | 3 | Frontend quality: React architecture, accessibility and web performance. |
| `testing-quality` | 4 | Testing strategy, Playwright E2E and flaky-test diagnosis, paired with test-first development. |
| `devops-delivery` | 4 | Container images, CI workflows, safe deployments and secret management. |
| `security-foundations` | 3 | Threat modeling, security-focused code review and secret hygiene. |
| `ai-engineering` | 3 | Prompt design, RAG systems and LLM evaluation. |
| `docs-communication` | 2 | Useful READMEs and architecture decision records. |
| `starter` | 5 | A pragmatic starter pack for a new project: discipline, testing and a first security pass. |
| `dotnet` | 3 | .NET 10 and C#: modern language conventions, Minimal APIs and xUnit TDD. |
| `typescript-node` | 2 | Strict TypeScript and production Node service conventions. |
| `python` | 2 | Modern Python project conventions plus pytest TDD. |
| `nextjs` | 1 | Next.js App Router architecture and server/client boundaries. |
| `postgres` | 1 | PostgreSQL schema design and index strategy. |
| `personal-stack` | 9 | Opinionated defaults for TypeScript/Node, Python, .NET 10, Next.js and PostgreSQL. |

## Skills

### Workflow (16)

| Skill | Tags | What it does |
| --- | --- | --- |
| [`ai-llm-evals`](./skills/ai-llm-evals) | `ai`, `evals`, `testing` | Evaluación de sistemas LLM. Úsala cuando necesites medir calidad, regresiones o cambios de modelo o prompt.… |
| [`dotnet-tdd-xunit`](./skills/dotnet-tdd-xunit) | `dotnet`, `csharp`, `tdd` | TDD en .NET 10 con xUnit. Úsala siempre que implementes una feature o corrijas un bug en C# y quieras… |
| [`python-tdd-pytest`](./skills/python-tdd-pytest) | `python`, `tdd`, `testing` | TDD en Python con pytest. Úsala siempre que implementes una feature o corrijas un bug en Python y quieras… |
| [`security-code-review`](./skills/security-code-review) | `security`, `code-review`, `appsec` | Revisión de seguridad de código. Úsala cuando revises PRs que tocan auth, input, SQL, archivos, HTTP o… |
| [`testing-flaky-tests`](./skills/testing-flaky-tests) | `testing`, `flakiness`, `quality` | Diagnóstico de tests intermitentes. Úsala cuando un test falle de forma no determinista o bloquee CI.… |
| [`testing-strategy`](./skills/testing-strategy) | `testing`, `quality` | Estrategia de pruebas para un proyecto o feature. Úsala cuando decidas qué tests escribir, cómo… |
| [`workflow-atomic-commits`](./skills/workflow-atomic-commits) | `git`, `commits`, `discipline` | Divide el trabajo en commits semánticos atómicos y verifica cada paso. Úsala cuando implementes una tarea ya… |
| [`workflow-codebase-onboarding`](./skills/workflow-codebase-onboarding) | `onboarding`, `workflow`, `architecture` | Onboarding rápido en un repositorio desconocido. Úsala cuando llegues a un proyecto nuevo o tengas que… |
| [`workflow-dependency-upgrade`](./skills/workflow-dependency-upgrade) | `dependencies`, `workflow`, `security` | Actualización segura de dependencias. Úsala cuando haya que subir versiones, resolver vulnerabilidades o… |
| [`workflow-incident-response`](./skills/workflow-incident-response) | `incident`, `operations`, `workflow` | Respuesta a incidentes en producción. Úsala siempre que un servicio esté caído, degradado o con errores… |
| [`workflow-read-only-plan`](./skills/workflow-read-only-plan) | `planning`, `discipline`, `read-only` | Protocolo de planificación en solo lectura. Úsala siempre que el usuario pida una funcionalidad, un refactor… |
| [`workflow-refactor-safely`](./skills/workflow-refactor-safely) | `refactor`, `workflow`, `quality` | Refactor sin cambiar comportamiento. Úsala siempre que vayas a mover, renombrar, extraer o reestructurar… |
| [`workflow-release-checklist`](./skills/workflow-release-checklist) | `release`, `workflow`, `git` | Checklist de release seguro. Úsala siempre que vayas a publicar una versión, desplegar a producción o cerrar… |
| [`workflow-review-triage`](./skills/workflow-review-triage) | `review`, `triage`, `discipline` | Triaje de comentarios de code review. Úsala siempre que el usuario pegue comentarios de PR, hallazgos de… |
| [`workflow-root-cause-debug`](./skills/workflow-root-cause-debug) | `debugging`, `workflow`, `quality` | Protocolo de depuración por causa raíz. Úsala siempre que algo falle y no sepas por qué (tests rojos, errores… |
| [`workflow-test-first`](./skills/workflow-test-first) | `testing`, `tdd`, `workflow` | Ciclo TDD para features y bugs. Úsala cuando el usuario pida implementar algo verificable o corregir un bug y… |

### Domain (24)

| Skill | Tags | What it does |
| --- | --- | --- |
| [`ai-prompt-engineering`](./skills/ai-prompt-engineering) | `ai`, `prompts`, `llm` | Diseño de prompts para LLMs. Úsala cuando crees o mejores prompts de producto, agentes o extracción de datos.… |
| [`ai-rag-design`](./skills/ai-rag-design) | `ai`, `rag`, `retrieval` | Diseño de RAG. Úsala cuando construyas búsqueda semántica, asistentes sobre documentos o recuperación… |
| [`api-auth-sessions`](./skills/api-auth-sessions) | `auth`, `security`, `api` | Autenticación y sesiones seguras. Úsala siempre que implementes login, tokens, cookies, refresh, permisos o… |
| [`api-error-handling`](./skills/api-error-handling) | `http`, `api`, `errors` | Convenciones para diseñar y revisar respuestas de error en APIs HTTP. Úsala siempre que el usuario cree o… |
| [`api-rest-design`](./skills/api-rest-design) | `api`, `http`, `design` | Diseño de APIs REST consistentes. Úsala siempre que crees o modifiques endpoints, recursos, paginación,… |
| [`backend-observability`](./skills/backend-observability) | `observability`, `logging`, `backend` | Observabilidad en servicios backend. Úsala siempre que añadas endpoints, jobs o integraciones y necesites… |
| [`db-migrations-safe`](./skills/db-migrations-safe) | `database`, `migrations`, `backend` | Migraciones de base de datos sin downtime. Úsala siempre que cambies esquema, índices, constraints o hagas… |
| [`db-query-performance`](./skills/db-query-performance) | `database`, `performance`, `backend` | Optimización de consultas y esquemas. Úsala cuando una consulta sea lenta, haya N+1, falte un índice o la… |
| [`devops-deploy-safety`](./skills/devops-deploy-safety) | `deployment`, `devops`, `reliability` | Despliegues seguros y rollback. Úsala cuando publiques a producción, cambies infraestructura o migres datos.… |
| [`devops-dockerfile`](./skills/devops-dockerfile) | `docker`, `devops`, `containers` | Dockerfiles de producción. Úsala cuando containerices una app o revises imágenes lentas, grandes o inseguras.… |
| [`devops-github-actions`](./skills/devops-github-actions) | `github-actions`, `ci`, `devops` | Workflows de GitHub Actions. Úsala cuando crees o depures CI/CD, matrices, cachés, permisos o despliegues.… |
| [`devops-secrets-management`](./skills/devops-secrets-management) | `secrets`, `security`, `devops` | Manejo de secretos. Úsala siempre que configures credenciales, variables de entorno, CI o rotación. Mantén… |
| [`dotnet-minimal-api`](./skills/dotnet-minimal-api) | `dotnet`, `api`, `http` | APIs con ASP.NET Core Minimal APIs en .NET 10. Úsala siempre que crees endpoints, grupos de rutas,… |
| [`dotnet-modern-csharp`](./skills/dotnet-modern-csharp) | `dotnet`, `csharp`, `backend` | Convenciones de C# moderno y .NET 10. Úsala siempre que crees o modifiques proyectos, APIs o librerías en C#… |
| [`frontend-accessibility`](./skills/frontend-accessibility) | `accessibility`, `frontend`, `ui` | Accesibilidad web (WCAG). Úsala siempre que crees o modifiques UI, formularios, modales, navegación o… |
| [`frontend-performance`](./skills/frontend-performance) | `performance`, `frontend`, `web-vitals` | Rendimiento web y Core Web Vitals. Úsala cuando una página cargue lenta, el bundle crezca o haya que… |
| [`frontend-react-architecture`](./skills/frontend-react-architecture) | `react`, `frontend`, `architecture` | Arquitectura de aplicaciones React. Úsala cuando crees componentes, organices carpetas, gestiones estado o… |
| [`nextjs-app-router`](./skills/nextjs-app-router) | `nextjs`, `react`, `frontend` | Next.js App Router. Úsala siempre que crees rutas, layouts, server/client components, data fetching o actions… |
| [`node-service-conventions`](./skills/node-service-conventions) | `node`, `backend`, `typescript` | Servicios Node en producción. Úsala siempre que crees o modifiques un servicio, CLI o job en Node. Configura… |
| [`postgres-schema-design`](./skills/postgres-schema-design) | `postgres`, `database`, `design` | Diseño de esquemas PostgreSQL. Úsala siempre que crees o modifiques tablas, tipos, constraints o índices en… |
| [`python-project-conventions`](./skills/python-project-conventions) | `python`, `backend`, `quality` | Convenciones de proyectos Python modernos. Úsala siempre que crees o revises paquetes, servicios o scripts en… |
| [`security-threat-model`](./skills/security-threat-model) | `security`, `threat-model`, `architecture` | Modelado de amenazas. Úsala siempre que diseñes una feature, API o arquitectura que maneje datos sensibles,… |
| [`testing-playwright-e2e`](./skills/testing-playwright-e2e) | `playwright`, `testing`, `e2e` | Tests E2E con Playwright. Úsala cuando escribas flujos críticos de usuario, formularios o integraciones entre… |
| [`typescript-strict-patterns`](./skills/typescript-strict-patterns) | `typescript`, `node`, `quality` | TypeScript estricto en Node. Úsala siempre que crees o revises código TypeScript, tipos de dominio o APIs… |

### Meta (3)

| Skill | Tags | What it does |
| --- | --- | --- |
| [`docs-adr`](./skills/docs-adr) | `docs`, `adr`, `architecture` | Registro de decisiones de arquitectura (ADR). Úsala cuando tomes una decisión técnica relevante o cambies una… |
| [`docs-readme`](./skills/docs-readme) | `docs`, `readme` | READMEs útiles. Úsala cuando crees un proyecto o detectes que el README no permite empezar. Incluye qué es,… |
| [`meta-skill-authoring`](./skills/meta-skill-authoring) | `meta`, `skills`, `authoring` | Autoría de skills para Apocryphon. Úsala cuando crees o edites una SKILL.md en este catálogo. Valida… |

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
   npm run validate
   ```

4. Open a pull request using a semantic title (`feat(skills): add …`).

### Pull request checklist

- [ ] `name` matches the folder and the frontmatter is valid.
- [ ] The description has concrete triggers and, ideally, negative triggers.
- [ ] Category and at least one taxonomy tag are present.
- [ ] The body is concise; long material lives in `references/`.
- [ ] Scripts are executable, deterministic and contain no secrets.
- [ ] `npm run check-index` passes (no index drift).
- [ ] `npm run validate` passes.

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
2. `npm run validate`, which initializes an isolated Apocryphon home and runs
   `apocryphon validate --registry --strict` with the published CLI.

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

## Contributing

Issues and PRs are welcome. For large changes, open an issue first describing the
skill, its triggers and why it is broadly useful. Keep skills focused, portable
and free of organization-specific secrets.

## License

[MIT](LICENSE) © Marlon Baltodano
