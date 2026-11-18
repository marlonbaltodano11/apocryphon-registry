---
name: nextjs-app-router
description: >
  Next.js App Router. Úsala siempre que crees rutas, layouts, server/client components, data
  fetching o actions en Next.js. Define caché, revalidación y límites server/client. No la uses para
  React sin Next.js.
category: domain
version: 1.0.0
tags: [nextjs, react, frontend]
---

# Next.js App Router

## Objetivo

Aprovechar el render en servidor sin filtrar secretos ni romper la caché.

## Protocolo

1. Define el árbol de rutas con `layout`, `page`, `loading`, `error` y `not-found`.
2. Server components por defecto; `use client` solo para interacción.
3. Haz data fetching en servidor y declara caché/revalidación explícita.
4. Valida y autoriza en route handlers y server actions.
5. Configura metadata, fuentes e imágenes.
6. Mide bundle y prueba los flujos críticos.

## Reglas

- Nada de secretos en componentes cliente.
- No pongas `use client` en toda la aplicación.
- Evita cascadas de fetch; paraleliza cuando puedas.
- No confíes en validación solo del formulario.

## Verificación

- `next build` pasa.
- El bundle no crece sin control.
- Los flujos críticos están cubiertos.
- Metadata y errores se renderizan bien.
