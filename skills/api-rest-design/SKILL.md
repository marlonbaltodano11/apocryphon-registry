---
name: api-rest-design
description: >
  Diseño de APIs REST consistentes. Úsala siempre que crees o modifiques endpoints, recursos,
  paginación, versionado o contratos HTTP. Define recursos, estados, errores, paginación e
  idempotencia antes de implementar. No la uses para RPC interno ni para errores puntuales (usa api-
  error-handling).
category: domain
version: 1.0.0
tags: [api, http, design]
---

# Diseño de APIs REST

## Objetivo

Diseñar una API predecible, estable y fácil de consumir.

## Protocolo

1. Modela recursos y relaciones antes de elegir rutas.
2. Asigna métodos y códigos de estado correctos.
3. Define representación, campos obligatorios y compatibilidad.
4. Especifica paginación, filtros y ordenamiento estables.
5. Define versionado y política de deprecación.
6. Define idempotencia para escrituras reintentables.
7. Documenta errores con api-error-handling y añade contract tests.

## Reglas

- Recursos en plural y rutas predecibles.
- No expongas detalles internos ni SQL.
- No cambies el significado de un campo existente.
- La paginación por offset no es estable para feeds grandes.

## Verificación

- Contract tests cubren rutas, estados y errores.
- La paginación no duplica ni pierde elementos.
- Los ejemplos de la documentación se ejecutan.

## Referencias

- `references/pagination-and-versioning.md`: documentación de apoyo para esta skill.
