---
name: workflow-root-cause-debug
description: >
  Protocolo de depuración por causa raíz. Úsala siempre que algo falle y no sepas por qué (tests
  rojos, errores en runtime, comportamiento extraño) o cuando un intento de arreglo no haya
  funcionado. Reproduce, aísla, formula hipótesis y verifica antes de cambiar código. No la uses
  para aplicar una corrección ya conocida ni para mejoras de estilo.
category: workflow
version: 1.0.0
tags: [debugging, workflow, quality]
---

# Depuración por causa raíz

## Objetivo

Encontrar la causa real del fallo antes de tocar código, y dejar una prueba que impida la regresión.

## Protocolo

1. Reproduce el fallo de forma determinista: comando exacto, input, entorno y versión. Si no puedes reproducirlo, instrumenta en lugar de adivinar.
2. Reduce el caso al mínimo que sigue fallando (elimina configuración, datos y pasos que no sean necesarios).
3. Formula 2 o 3 hipótesis y define qué experimento distingue cada una.
4. Ejecuta el experimento y registra evidencia: logs, trazas, diff de estado, resultados de tests.
5. Corrige la causa, no el síntoma. Añade un test de regresión que fallaría sin el cambio.
6. Ejecuta el test nuevo y la suite completa. Documenta la causa en el mensaje de commit.

## Reglas

- No cambies varias cosas a la vez: pierdes la señal.
- No desactives tests, alertas o validaciones para que el síntoma desaparezca.
- Si el fallo es intermitente, trata el no determinismo como parte del bug.
- Si no puedes explicar la causa en una frase, todavía no terminaste.

## Verificación

- El test de regresión falla con el código anterior y pasa con el fix.
- La suite y el typecheck/linter pasan.
- La causa y el experimento quedaron documentados.
