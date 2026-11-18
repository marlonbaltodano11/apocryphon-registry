---
name: ai-prompt-engineering
description: >
  Diseño de prompts para LLMs. Úsala cuando crees o mejores prompts de producto, agentes o
  extracción de datos. Define rol, entradas, salida estructurada, ejemplos y criterios de
  evaluación. No la uses para prompts triviales de una línea.
category: domain
version: 1.0.0
tags: [ai, prompts, llm]
---

# Ingeniería de prompts

## Objetivo

Producir prompts reproducibles, evaluables y resistentes a entradas raras.

## Protocolo

1. Define la tarea y el contrato de salida (JSON, campos, reglas).
2. Especifica el esquema de entrada y qué hacer si falta información.
3. Separa instrucciones de datos del usuario.
4. Incluye 2 o 3 ejemplos que cubran casos difíciles.
5. Enumera modos de fallo y cómo debe responder.
6. Crea un set de evaluación y mide consistencia, coste y latencia.

## Reglas

- No uses adjetivos vagos: define criterios observables.
- No mezcles datos no confiables con instrucciones.
- No pidas JSON sin esquema ni ejemplo.
- Versiona los prompts junto al código.

## Verificación

- El set de evaluación pasa.
- La salida valida contra el esquema.
- Los casos límite tienen comportamiento definido.
