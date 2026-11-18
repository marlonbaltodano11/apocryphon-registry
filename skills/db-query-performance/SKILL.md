---
name: db-query-performance
description: >
  Optimización de consultas y esquemas. Úsala cuando una consulta sea lenta, haya N+1, falte un
  índice o la base sea el cuello de botella. Mide con EXPLAIN antes y después; no optimices por
  intuición. No la uses para tuning de infraestructura sin evidencia.
category: domain
version: 1.0.0
tags: [database, performance, backend]
---

# Rendimiento de consultas

## Objetivo

Reducir latencia y carga de la base con cambios medidos y reversibles.

## Protocolo

1. Mide la consulta real con datos representativos.
2. Lee el plan (EXPLAIN ANALYZE): scans, sorts, joins y filas estimadas.
3. Elimina N+1 con joins o carga por lotes.
4. Añade o ajusta índices según el patrón de acceso.
5. Reescribe la consulta si el plan sigue siendo malo.
6. Vuelve a medir y guarda una prueba de regresión.

## Reglas

- Un cambio a la vez.
- No añadas índices sin medir el costo de escritura.
- Evita `SELECT *` en consultas de producción.
- La paginación por offset se degrada en tablas grandes.

## Verificación

- Plan y latencia antes/después documentados.
- El índice nuevo se usa.
- No hay regresiones en escrituras.
