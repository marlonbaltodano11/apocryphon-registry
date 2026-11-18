---
name: security-code-review
description: >
  Revisión de seguridad de código. Úsala cuando revises PRs que tocan auth, input, SQL, archivos,
  HTTP o dependencias. Busca inyección, autorización, SSRF, deserialización y secretos. No la uses
  para revisión de estilo.
category: workflow
version: 1.0.0
tags: [security, code-review, appsec]
---

# Revisión de seguridad de código

## Objetivo

Encontrar vulnerabilidades explotables antes de que lleguen a producción.

## Protocolo

1. Mapea la superficie de ataque del cambio.
2. Revisa validación y sanitización de entrada.
3. Verifica autorización en el servidor para cada recurso.
4. Busca consultas concatenadas, comandos y rutas sin sanitizar.
5. Revisa SSRF, deserialización y subida de archivos.
6. Comprueba secretos, logs y dependencias nuevas.
7. Para cada hallazgo, escribe escenario de explotación y fix.

## Reglas

- No confíes en validación del cliente.
- Usa consultas parametrizadas y allowlists.
- No ejecutes comandos con entrada sin sanitizar.
- Un hallazgo sin escenario de explotación no es concluyente.

## Verificación

- Hallazgos con severidad, evidencia y fix.
- Tests que reproducen el fallo.
- `./scripts/grep-risk-patterns.sh` revisado.

## Scripts

- `./scripts/grep-risk-patterns.sh`: verificación auxiliar de esta skill.
