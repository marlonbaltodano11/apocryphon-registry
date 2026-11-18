---
name: meta-skill-authoring
description: >
  Autoría de skills para Apocryphon. Úsala cuando crees o edites una SKILL.md en este catálogo.
  Valida frontmatter, triggers, tamaño, categoría, tags y referencias. No la uses para documentación
  general.
category: meta
version: 1.0.0
tags: [meta, skills, authoring]
---

# Autoría de skills

## Objetivo

Escribir skills que el agente cargue en el momento correcto y pueda ejecutar sin ambigüedad.

## Protocolo

1. Elige un id lowercase kebab-case y úsalo como nombre de carpeta y `name`.
2. Escribe una `description` con qué hace, cuándo usarla y cuándo no.
3. Asigna `category` y al menos un tag de la taxonomía.
4. Escribe un protocolo numerado y verificable, no una introducción.
5. Mueve ejemplos largos a `references/` y enlázalos.
6. Si hay scripts, hazlos ejecutables y deterministas.
7. Valida con `apocryphon validate --registry --strict`.

## Reglas

- La `description` es la interfaz de recuperación: no la desperdicies.
- Cuerpo por debajo de ~150 líneas.
- Incluye triggers negativos para evitar falsos positivos.
- Nada de secretos ni rutas absolutas personales.

## Verificación

- `npm run check-index` pasa.
- `apocryphon validate --registry --strict` pasa.
- La skill se instala y aparece en `apocryphon search`.

## Referencias

- `references/skill-template.md`: documentación de apoyo para esta skill.
