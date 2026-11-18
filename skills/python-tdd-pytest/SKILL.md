---
name: python-tdd-pytest
description: >
  TDD en Python con pytest. Úsala siempre que implementes una feature o corrijas un bug en Python y
  quieras tests primero. Ciclo red-green-refactor con fixtures, parametrización y cobertura. No la
  uses para tests E2E de UI.
category: workflow
version: 1.0.0
tags: [python, tdd, testing]
---

# TDD en Python con pytest

## Objetivo

Diseñar módulos Python desde tests pequeños y deterministas.

## Protocolo

1. Escribe un test que falle y ejecútalo con `pytest -q ruta::test`.
2. Implementa lo mínimo para ponerlo en verde.
3. Refactoriza con la suite como red de seguridad.
4. Usa `parametrize` para bordes, `tmp_path` para archivos y `monkeypatch` para entorno.
5. Extrae fixtures para setup compartido; evita estado global.
6. Mide cobertura de las rutas críticas, no solo el total.

## Reglas

- Un comportamiento por test.
- Nada de `time.sleep` ni red real.
- No mockees la base si puedes usar Testcontainers.
- No dejes tests marcados como skip.

## Verificación

- El test falla antes y pasa después.
- La suite completa pasa.
- Los bordes están cubiertos.

## Referencias

- `references/pytest-patterns.md`: documentación de apoyo para esta skill.
