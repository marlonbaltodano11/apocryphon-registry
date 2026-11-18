---
name: workflow-release-checklist
description: >
  Checklist de release seguro. Úsala siempre que vayas a publicar una versión, desplegar a
  producción o cerrar un ciclo de cambios. Verifica árbol limpio, tests, changelog, versionado y
  plan de rollback. No la uses para incidentes en curso (usa workflow-incident-response).
category: workflow
version: 1.0.0
tags: [release, workflow, git, devops]
---

# Checklist de release

## Objetivo

Publicar una versión reproducible, comunicada y reversible.

## Protocolo

1. Congela el alcance: nada nuevo entra después de empezar el release.
2. Ejecuta el preflight: árbol limpio, rama correcta, tests, typecheck y build.
3. Actualiza versión y changelog con lenguaje para usuarios.
4. Construye los artefactos desde el commit etiquetado y verifica su hash.
5. Despliega o publica; si es staged, confirma la aprobación.
6. Verifica con un smoke test post-release y monitoriza errores.
7. Registra el tag y el plan de rollback en el release.

## Reglas

- No se publica con tests rojos.
- Una versión publicada no se reescribe.
- Todo release necesita un rollback conocido.
- El changelog no es el log de commits.

## Verificación

- `./scripts/preflight.sh` pasa.
- El artefacto publicado corresponde al tag.
- El smoke test post-release pasa.
- El rollback está documentado y probado.

## Scripts

- `./scripts/preflight.sh`: verificación auxiliar de esta skill.
