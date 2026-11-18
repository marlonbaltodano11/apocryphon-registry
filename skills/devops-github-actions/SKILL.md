---
name: devops-github-actions
description: >
  Workflows de GitHub Actions. Úsala cuando crees o depures CI/CD, matrices, cachés, permisos o
  despliegues. Define permisos mínimos, cache y concurrencia. No la uses para lógica de negocio.
category: domain
version: 1.0.0
tags: [github-actions, ci, devops]
---

# GitHub Actions

## Objetivo

Workflows rápidos, seguros y fáciles de diagnosticar.

## Protocolo

1. Define triggers y evita ejecuciones duplicadas.
2. Declara `permissions` mínimos por workflow o job.
3. Configura caché de dependencias con la clave correcta.
4. Usa matrices solo cuando aporten señal real.
5. Separa jobs de calidad, empaquetado y publicación.
6. Añade `concurrency` para cancelar runs obsoletos.
7. Fija versiones de actions y revisa las advertencias.

## Reglas

- No uses `permissions: write-all`.
- No imprimas secretos ni los pases por argumentos.
- No uses `latest` para actions de terceros.
- No publiques desde PRs.

## Verificación

- Permisos revisados y mínimos.
- Caché con hit en runs sucesivos.
- El camino de fallo se ve claro.
- El tiempo total está dentro del presupuesto.

## Referencias

- `references/workflow-template.md`: documentación de apoyo para esta skill.
