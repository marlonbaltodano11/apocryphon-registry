---
name: testing-playwright-e2e
description: >
  Tests E2E con Playwright. Úsala cuando escribas flujos críticos de usuario, formularios o
  integraciones entre frontend y backend. Usa selectores estables, aislamiento y fixtures. No la
  uses para lógica unitaria.
category: domain
version: 1.0.0
tags: [playwright, testing, e2e]
---

# E2E con Playwright

## Objetivo

Cubrir flujos de usuario reales con tests estables y rápidos.

## Protocolo

1. Elige los flujos críticos, no todas las pantallas.
2. Usa roles y etiquetas accesibles como selectores.
3. Crea fixtures de datos y autenticación por test.
4. Aísla el estado: base limpia o datos únicos por ejecución.
5. Espera por condiciones de la UI, no por tiempo.
6. Configura trazas, screenshots y video en fallo.

## Reglas

- Nada de `waitForTimeout` como solución.
- No dependas del orden de ejecución.
- No uses selectores CSS frágiles.
- Limpia los datos que creaste.

## Verificación

- El flujo pasa repetidamente en local y CI.
- Los artefactos de fallo se generan.
- El tiempo de CI está dentro del presupuesto.
