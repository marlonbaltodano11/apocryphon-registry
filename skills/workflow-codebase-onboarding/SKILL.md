---
name: workflow-codebase-onboarding
description: >
  Onboarding rápido en un repositorio desconocido. Úsala cuando llegues a un proyecto nuevo o tengas
  que entender un módulo grande antes de cambiar algo. Mapea entry points, build, tests,
  convenciones y riesgos. No la uses para documentación exhaustiva ni para refactors.
category: workflow
version: 1.0.0
tags: [onboarding, workflow, architecture]
---

# Onboarding en un repositorio

## Objetivo

Entender cómo se construye, ejecuta y prueba un proyecto antes de modificarlo.

## Protocolo

1. Lee README, manifiesto de paquetes y configuración de CI.
2. Dibuja el mapa de directorios y marca los entry points.
3. Ejecuta build y tests; anota los comandos exactos y su duración.
4. Identifica convenciones: nombres, capas, errores, logging y tests.
5. Sigue un flujo de punta a punta (request, job o comando) y anota el data flow.
6. Escribe un resumen con entry points, comandos, convenciones y riesgos.

## Reglas

- No edites archivos durante el onboarding.
- Verifica cada comando antes de darlo por bueno.
- Pregunta por lo ambiguo en lugar de asumir.
- Registra lo que no pudiste entender.

## Verificación

- Puedes construir y correr la suite desde cero.
- El resumen permite a otra persona arrancar sin ayuda.
- No quedaron cambios sin commitear.
