---
name: typescript-strict-patterns
description: >
  TypeScript estricto en Node. Úsala siempre que crees o revises código TypeScript, tipos de dominio
  o APIs internas. Activa strict, evita `any`, usa uniones discriminadas y validación en runtime. No
  la uses para snippets de navegador sin build.
category: domain
version: 1.0.0
tags: [typescript, node, quality]
---

# TypeScript estricto

## Objetivo

Modelar el dominio con tipos que fallen en compilación, no en producción.

## Protocolo

1. Activa `strict`, `noUncheckedIndexedAccess` y `exactOptionalPropertyTypes` cuando sea viable.
2. Usa `module`/`moduleResolution` NodeNext y extensiones `.js` en imports ESM.
3. Modela estados con uniones discriminadas y `satisfies` para literales.
4. Valida datos externos con zod o valibot en el borde.
5. Prefiere `unknown` y narrowing explícito a `any`.
6. Añade type tests cuando un tipo sea parte del contrato público.

## Reglas

- No uses `as` para silenciar errores.
- No uses `!` sin una prueba real de no-null.
- No dupliques en tipos lo que ya valida runtime.
- Evita `enum`; usa uniones y objetos `as const`.

## Verificación

- `tsc --noEmit` pasa.
- El linter de tipos no reporta `any` implícitos.
- Los datos externos se validan en runtime.

## Referencias

- `references/tsconfig-strict.md`: documentación de apoyo para esta skill.
