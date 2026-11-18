---
name: frontend-accessibility
description: >
  Accesibilidad web (WCAG). Úsala siempre que crees o modifiques UI, formularios, modales,
  navegación o componentes interactivos. Verifica teclado, foco, semántica, contraste y lectores de
  pantalla. No la uses para auditorías legales completas.
category: domain
version: 1.0.0
tags: [accessibility, frontend, ui]
---

# Accesibilidad web

## Objetivo

Que la interfaz sea usable con teclado, lectores de pantalla y zoom.

## Protocolo

1. Usa HTML semántico antes que ARIA.
2. Verifica navegación completa solo con teclado.
3. Gestiona el foco en modales, menús y cambios de ruta.
4. Etiqueta todos los controles y asocia errores a sus campos.
5. Comprueba contraste y zoom al 200%.
6. Prueba con un lector de pantalla en los flujos críticos.

## Reglas

- No uses `div` o `span` como botones.
- No elimines el outline de foco sin reemplazo visible.
- No uses ARIA para arreglar HTML incorrecto.
- Anuncia cambios dinámicos importantes.

## Verificación

- Flujo crítico completable solo con teclado.
- Auditoría automática sin errores graves.
- Zoom 200% sin pérdida de contenido.
- Lectura de pantalla comprensible.

## Referencias

- `references/wcag-checklist.md`: documentación de apoyo para esta skill.
