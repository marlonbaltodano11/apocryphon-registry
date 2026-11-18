---
name: db-migrations-safe
description: >
  Migraciones de base de datos sin downtime. Úsala siempre que cambies esquema, índices, constraints
  o hagas backfills en una base con datos reales. Planifica compatibilidad, bloqueos y rollback. No
  la uses para prototipos locales sin datos.
category: domain
version: 1.0.0
tags: [database, migrations, backend]
---

# Migraciones sin downtime

## Objetivo

Cambiar el esquema sin romper la versión anterior de la aplicación ni bloquear la base.

## Protocolo

1. Evalúa el impacto: tamaño de tabla, locks y tiempo estimado.
2. Aplica el patrón expand/contract: añade lo nuevo, migra datos, cambia el código, elimina lo viejo.
3. Añade columnas nullable o con default seguro; evita reescribir tablas grandes.
4. Haz backfills por lotes con métricas y pausas.
5. Crea índices de forma concurrente cuando el motor lo permita.
6. Despliega el código compatible y solo después elimina el esquema viejo.

## Reglas

- No hagas cambios destructivos en un solo paso.
- No ejecutes migraciones pesadas en horario pico.
- Toda migración debe poder revertirse o tener un plan explícito.
- Prueba con datos de tamaño realista.

## Verificación

- Migración up/down probada.
- La versión vieja y la nueva conviven durante el despliegue.
- No hay locks largos ni réplicas retrasadas.
- El backfill terminó y los conteos cuadran.

## Referencias

- `references/zero-downtime.md`: documentación de apoyo para esta skill.
