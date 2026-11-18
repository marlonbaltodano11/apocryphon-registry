---
name: workflow-incident-response
description: >
  Respuesta a incidentes en producción. Úsala siempre que un servicio esté caído, degradado o con
  errores graves en producción. Prioriza estabilizar, comunicar y preservar evidencia antes de
  investigar. No la uses para bugs locales ni para mantenimiento planificado.
category: workflow
version: 1.0.0
tags: [incident, operations, workflow]
---

# Respuesta a incidentes

## Objetivo

Restaurar el servicio rápido, con comunicación clara y aprendizaje posterior.

## Protocolo

1. Declara severidad e impacto en una frase.
2. Mitiga primero: rollback, feature flag, escalado o desvío de tráfico. Investiga después.
3. Designa un incident commander y un canal único de comunicación.
4. Preserva evidencia: logs, métricas, trazas y horas exactas en UTC.
5. Actualiza el estado a intervalos regulares aunque no haya novedades.
6. Al estabilizar, escribe el timeline y el postmortem sin culpables.
7. Convierte las causas en acciones con dueño y fecha.

## Reglas

- No especules en el canal del incidente.
- No hagas cambios no verificados durante la mitigación.
- No cierres el incidente sin métricas de recuperación.
- El postmortem es del sistema, no de las personas.

## Verificación

- El servicio está sano y las métricas volvieron a la línea base.
- El timeline está completo y en UTC.
- Las acciones tienen dueño y fecha.
- Las alertas cubren el fallo detectado.
