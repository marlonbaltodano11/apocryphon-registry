---
name: node-service-conventions
description: >
  Servicios Node en producción. Úsala siempre que crees o modifiques un servicio, CLI o job en Node.
  Configura ESM, configuración validada, logs estructurados, apagado graceful y healthchecks. No la
  uses para scripts de una sola vez.
category: domain
version: 1.0.0
tags: [node, backend, typescript]
---

# Servicios Node en producción

## Objetivo

Servicios que fallan rápido al arrancar y se apagan sin perder trabajo.

## Protocolo

1. Usa ESM, `engines` y lockfile; fija la versión de Node.
2. Valida la configuración con un esquema al inicio y falla rápido.
3. Emite logs estructurados con request/job IDs; nunca secretos.
4. Implementa SIGTERM: deja de aceptar trabajo, drena y cierra recursos.
5. Añade health y readiness; timeouts y retries en clientes externos.
6. Prueba con `node:test` o vitest; typecheck y build en CI.

## Reglas

- Nada de promesas flotantes ni rejection handlers vacíos.
- Nada de I/O síncrono en el camino de una request.
- Nada de `process.exit()` en medio de una request.
- No cargues configuración desde `.env` en producción.

## Verificación

- Config inválida impide el arranque.
- El apagado drena y cierra.
- Los logs son estructurados y sin secretos.
- Health/readiness responden.

## Referencias

- `references/service-checklist.md`: documentación de apoyo para esta skill.
