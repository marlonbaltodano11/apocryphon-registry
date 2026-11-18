---
name: ai-llm-evals
description: >
  Evaluación de sistemas LLM. Úsala cuando necesites medir calidad, regresiones o cambios de modelo
  o prompt. Define datasets, métricas y umbrales. No la uses para evaluar una respuesta aislada.
category: workflow
version: 1.0.0
tags: [ai, evals, testing]
---

# Evaluación de sistemas LLM

## Objetivo

Saber si un cambio de prompt o modelo mejora o empeora el sistema.

## Protocolo

1. Define la tarea y el criterio de éxito.
2. Construye un dataset representativo con casos fáciles, límite y adversos.
3. Elige métricas: exactitud, rubric, juez LLM o humana.
4. Guarda una línea base y versiona el dataset.
5. Ejecuta la evaluación en CI para cambios de prompt.
6. Revisa coste, latencia y estabilidad entre ejecuciones.

## Reglas

- No evalúes con el mismo ejemplo del prompt.
- No uses un juez LLM sin calibrarlo contra humanos.
- No compares promedios sin mirar los fallos.
- Un cambio de modelo requiere re-evaluar.

## Verificación

- Línea base y resultados nuevos documentados.
- Umbral de regresión definido.
- La evaluación es reproducible.
