---
name: testing-flaky-tests
description: >
  Diagnóstico de tests intermitentes. Úsala cuando un test falle de forma no determinista o bloquee
  CI. Reproduce, aísla la fuente de no determinismo y corrige la causa. No la uses para simplemente
  reintentar o silenciar.
category: workflow
version: 1.0.0
tags: [testing, flakiness, quality]
---

# Tests intermitentes

## Objetivo

Eliminar la causa del no determinismo, no el síntoma.

## Protocolo

1. Captura evidencia: seed, orden, hora, logs y artefactos.
2. Reproduce en bucle hasta obtener un fallo.
3. Aísla la fuente: tiempo, orden, red, estado compartido o concurrencia.
4. Corrige la causa y elimina la dependencia oculta.
5. Si no puedes corregirlo ya, cuarentena con dueño y fecha.
6. Monitoriza la tasa de fallos después.

## Reglas

- Los reintentos no son un fix.
- No compartas estado mutable entre tests.
- Controla reloj, aleatoriedad y red.
- No borres el test para que CI quede verde.

## Verificación

- 100 ejecuciones seguidas sin fallo.
- La causa quedó documentada.
- La tasa de flakes de CI bajó.
