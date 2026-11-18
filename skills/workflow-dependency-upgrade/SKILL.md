---
name: workflow-dependency-upgrade
description: >
  Actualización segura de dependencias. Úsala cuando haya que subir versiones, resolver
  vulnerabilidades o actualizar lockfiles. Lee changelogs, actualiza de a una, ejecuta tests y
  separa commits. No la uses para instalar una librería nueva sin evaluarla.
category: workflow
version: 1.0.0
tags: [dependencies, workflow, security]
---

# Actualización de dependencias

## Objetivo

Actualizar dependencias sin introducir regresiones ni cambios de comportamiento ocultos.

## Protocolo

1. Haz inventario: versiones actuales, disponibles y vulnerabilidades conocidas.
2. Lee las notas de breaking changes de cada salto mayor.
3. Actualiza una dependencia (o un grupo coherente) por vez y regenera el lockfile.
4. Ejecuta tests, typecheck y build; arranca la app si aplica.
5. Commitea con el motivo y el rango de versiones.
6. Repite hasta completar el plan.

## Reglas

- No mezcles un salto mayor con una feature en el mismo commit.
- No ignores peer dependencies ni warnings del gestor.
- No borres el lockfile para forzar la resolución.
- Fija versiones críticas y documenta por qué.

## Verificación

- Tests, typecheck y build pasan.
- La app arranca y los flujos críticos funcionan.
- `npm audit` (o equivalente) no empeoró.
- El diff del lockfile es el esperado.
