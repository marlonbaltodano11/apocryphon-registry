---
name: modern-python
description: >
  Configure Python projects with modern tooling and secure defaults. Use when
  creating a Python project or package, writing standalone scripts with
  dependencies, setting up pyproject.toml, configuring uv, ruff, ty, pytest, or
  pre-commit tooling, or migrating from pip, Poetry, mypy, black, and isort.
  Do not use for exploratory notebooks, non-Python projects, or repositories
  whose maintainers require legacy tooling.
category: domain
version: 1.0.0
tags: [python, quality, backend]
license: CC-BY-SA-4.0
source: https://github.com/trailofbits/skills
upstream-commit: 149d7b21f406
---

# Modern Python

Guide for modern Python tooling and secure project defaults, based on
Trail of Bits' cookiecutter-python.

## When to use

- Creating a new Python project or package.
- Setting up `pyproject.toml`.
- Configuring linting, formatting, type checking, and tests.
- Writing standalone scripts with external dependencies.
- Migrating from legacy tools when the user requests it.

## When not to use

- The user wants to keep legacy tooling.
- Python below 3.11 is required.
- Python is not the primary language.

## Principles

- Use `uv add` and `uv remove`; do not hand-edit dependency lists.
- Use `uv run <cmd>`; do not manually activate virtual environments.
- Use `[dependency-groups]` for development, test, and docs dependencies.
- Use PEP 723 inline metadata for standalone scripts.
- Use `src/` layout for packages and commit `uv.lock`.

## Avoid

| Avoid | Use instead |
|---|---|
| `uv pip install` | `uv add` and `uv sync` |
| Editing `pyproject.toml` to add dependencies | `uv add` / `uv remove` |
| `requirements.txt` for projects | `pyproject.toml` |
| Poetry | uv |
| mypy or pyright in a greenfield project | ty |
| `[project.optional-dependencies]` for dev tools | `[dependency-groups]` |
| Manual virtualenv activation | `uv run` |
| pre-commit | prek |
| Hatchling when `uv_build` is sufficient | `uv_build` |

## Decision tree

```text
Single-file script with dependencies?
  Use PEP 723 inline metadata (references/pep723-scripts.md).

New multi-file project, not distributed?
  Use the minimal uv setup below.

New reusable package or library?
  Use the full project setup (references/pyproject.md).

Migrating an existing project?
  Follow references/migration-checklist.md.
```

## Minimal project

```bash
uv init myproject
cd myproject
uv add requests rich
uv add --group dev pytest ruff ty
uv run python src/myproject/main.py
uv run pytest
uv run ruff check .
```

## Full project setup

```bash
uv init --package myproject
cd myproject
uv sync --all-groups
```

Key `pyproject.toml` sections:

```toml
[project]
name = "myproject"
version = "0.1.0"
requires-python = ">=3.11"
dependencies = []

[dependency-groups]
dev = [{include-group = "lint"}, {include-group = "test"}, {include-group = "audit"}]
lint = ["ruff", "ty"]
test = ["pytest", "pytest-cov"]
audit = ["pip-audit"]

[tool.ruff]
line-length = 100
target-version = "py311"

[tool.ruff.lint]
select = ["ALL"]
ignore = ["D", "COM812", "ISC001"]

[tool.pytest]
addopts = ["--cov=myproject", "--cov-fail-under=80"]

[tool.ty.terminal]
error-on-warning = true

[tool.ty.environment]
python-version = "3.11"
```

## Migration

For a migration from pip, requirements files, `setup.py`, `setup.cfg`,
flake8/black/isort, or mypy/pyright:

1. Read [references/migration-checklist.md](references/migration-checklist.md).
2. Run `uv init --bare` in the existing project.
3. Add each dependency with `uv add`; review complex version constraints.
4. Move development tools to `[dependency-groups]`.
5. Update imports and commands only after the new environment passes tests.
6. Delete legacy configuration in a separate commit.

## Security setup

Add the project's security tools from
[references/security-setup.md](references/security-setup.md): secret scanning,
workflow linting, dependency auditing, and Dependabot when the project uses
GitHub. Use [references/dependabot.md](references/dependabot.md) for the
configuration. The templates in `templates/` are starting points; adapt paths
and package names before committing them.

## Verification

- `uv sync --all-groups` succeeds.
- `uv run ruff format --check`, `uv run ruff check`, `uv run ty check`, and
  `uv run pytest` pass.
- The lockfile is committed.
- No virtualenv, secret, or generated cache is committed.

## References

- [uv commands](references/uv-commands.md)
- [pyproject reference](references/pyproject.md)
- [ruff configuration](references/ruff-config.md)
- [testing and coverage](references/testing.md)
- [standalone scripts](references/pep723-scripts.md)
- [pre-commit hooks](references/prek.md)
- [security setup](references/security-setup.md)
- [Dependabot](references/dependabot.md)
- [migration checklist](references/migration-checklist.md)
