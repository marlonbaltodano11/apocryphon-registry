---
name: python-project-conventions
description: >
  Convenciones de proyectos Python modernos. Úsala siempre que crees o revises paquetes, servicios o
  scripts en Python. Cubre pyproject, ruff, tipos, settings, logging y tests. No la uses para
  notebooks exploratorios.
category: domain
version: 1.0.0
tags: [python, backend, quality]
---

# Proyectos Python modernos

## Objetivo

Proyectos Python reproducibles, tipados y fáciles de probar.

## Protocolo

1. Usa `pyproject.toml` con uv o hatch y layout `src/`.
2. Fija la versión de Python y las dependencias.
3. Configura ruff y mypy o pyright; anota funciones públicas.
4. Carga settings con pydantic-settings; falla rápido si falta algo.
5. Usa logging estructurado y excepciones con contexto.
6. Ejecuta pytest, cobertura y lint en CI.

## Reglas

- Nada de `except:` desnudo.
- Nada de argumentos mutables por defecto.
- No dupliques dependencias entre pyproject y requirements.
- Nada de `print` en servicios.

## Verificación

- ruff y mypy/pyright pasan.
- pytest pasa.
- La configuración inválida falla al arrancar.

## Referencias

- `references/pyproject-template.md`: documentación de apoyo para esta skill.
