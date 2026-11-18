---
name: postgres-schema-design
description: >
  Diseño de esquemas PostgreSQL. Úsala siempre que crees o modifiques tablas, tipos, constraints o
  índices en Postgres. Define claves, nulabilidad, constraints e índices según el acceso. No la uses
  para otros motores sin revisar diferencias.
category: domain
version: 1.0.0
tags: [postgres, database, design]
---

# Diseño de esquemas PostgreSQL

## Objetivo

Esquemas correctos por construcción y rápidos para las consultas reales.

## Protocolo

1. Modela entidades y relaciones antes de escribir DDL.
2. Elige claves: `bigint generated always as identity` o UUID si necesitas exponerlas.
3. Usa `NOT NULL` por defecto y constraints para invariantes.
4. Timestamps con `timestamptz`; evita `timestamp` sin zona.
5. Indexa según filtros y ordenamientos reales; usa índices parciales cuando aplique.
6. Usa JSONB solo para datos flexibles y valida su forma.

## Reglas

- Nada de `serial` en tablas nuevas.
- Nada de `varchar(255)` arbitrario; usa `text` con checks.
- Toda FK necesita un índice si se filtra o borra por ella.
- No uses nombres reservados ni comillas innecesarias.
- Las migraciones son expand/contract, no destructivas de golpe.

## Verificación

- Las migraciones aplican y revierten.
- EXPLAIN usa los índices previstos.
- Los constraints rechazan datos inválidos.

## Referencias

- `references/schema-checklist.md`: documentación de apoyo para esta skill.
