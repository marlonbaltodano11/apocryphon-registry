---
name: workflow-refactor-safely
description: >
  Refactor sin cambiar comportamiento. Úsala siempre que vayas a mover, renombrar, extraer o
  reestructurar código que ya funciona, o cuando el usuario pida limpiar sin cambiar features. Exige
  tests de comportamiento, pasos pequeños y commits separados. No la uses para corregir bugs ni para
  añadir funcionalidad.
category: workflow
version: 1.0.0
tags: [refactor, workflow, quality]
---

# Refactor seguro

## Objetivo

Mejorar la estructura del código sin alterar su comportamiento observable.

## Protocolo

1. Mapea el comportamiento actual y los tests que lo cubren. Si falta cobertura, escribe tests de caracterización antes de tocar nada.
2. Define el objetivo del refactor y el límite: qué se mueve y qué no.
3. Haz cambios pequeños y ejecuta los tests después de cada paso.
4. Mantén los commits separados: un commit de refactor no debe contener features ni fixes.
5. Revisa el diff final: si cambió comportamiento, retrocede y sepáralo.

## Reglas

- No mezcles refactor con cambio de comportamiento en el mismo commit.
- No renombres APIs públicas sin un plan de migración.
- No introduzcas abstracciones nuevas sin un segundo caso de uso real.
- Si un test falla, detente: el refactor dejó de ser seguro.

## Verificación

- La suite pasa antes y después, sin cambios en los tests existentes.
- El diff solo contiene movimientos, renombres y extracciones.
- El comportamiento se verificó manualmente en los flujos críticos.
