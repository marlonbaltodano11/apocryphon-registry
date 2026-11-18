---
name: devops-deploy-safety
description: >
  Despliegues seguros y rollback. Úsala cuando publiques a producción, cambies infraestructura o
  migres datos. Define healthchecks, estrategia de rollback y flags. No la uses para publicar
  librerías npm (usa workflow-release-checklist).
category: domain
version: 1.0.0
tags: [deployment, devops, reliability]
---

# Despliegues seguros

## Objetivo

Desplegar con capacidad de revertir y sin ventanas de caída.

## Protocolo

1. Verifica el estado previo: salud, capacidad y backups.
2. Elige estrategia: rolling, blue/green o canary.
3. Separa migraciones de datos del despliegue de código.
4. Define healthcheck y criterio de éxito.
5. Despliega y monitoriza latencia, errores y saturación.
6. Si falla, rollback inmediato y preserva evidencia.
7. Post-deploy: smoke test y verificación de negocio.

## Reglas

- Todo cambio debe ser reversible.
- No mezcles migraciones destructivas con el código nuevo.
- Usa feature flags para cambios riesgosos.
- Comunica el despliegue y su estado.

## Verificación

- Rollback probado o documentado.
- Healthcheck cubre dependencias críticas.
- Alertas activas durante el despliegue.
- Smoke test post-deploy pasa.
