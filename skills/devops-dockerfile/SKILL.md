---
name: devops-dockerfile
description: >
  Dockerfiles de producción. Úsala cuando containerices una app o revises imágenes lentas, grandes o
  inseguras. Multi-stage, non-root, cache y healthcheck. No la uses para imágenes de desarrollo
  desechables.
category: domain
version: 1.0.0
tags: [docker, devops, containers]
---

# Dockerfiles de producción

## Objetivo

Construir imágenes pequeñas, reproducibles y seguras.

## Protocolo

1. Elige una imagen base mínima y fija su versión.
2. Usa multi-stage: build con dependencias, runtime sin ellas.
3. Copia el lockfile antes del código para aprovechar la caché.
4. Ejecuta como usuario no root.
5. Añade `.dockerignore` y un healthcheck.
6. Escanea la imagen y verifica su tamaño.

## Reglas

- No uses `latest` como base en producción.
- No copies secretos ni `.env` a la imagen.
- No ejecutes como root.
- No instales herramientas de build en la etapa final.

## Verificación

- Build reproducible.
- Imagen final pequeña y sin root.
- Escaneo sin vulnerabilidades críticas.
- Healthcheck responde.

## Referencias

- `references/dockerfile-examples.md`: documentación de apoyo para esta skill.
