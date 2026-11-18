---
name: docs-adr
description: >
  Registro de decisiones de arquitectura (ADR). Úsala cuando tomes una decisión técnica relevante o
  cambies una existente. Documenta contexto, opciones, decisión y consecuencias. No la uses para
  tareas operativas.
category: meta
version: 1.0.0
tags: [docs, adr, architecture]
---

# Architecture Decision Records

## Objetivo

Dejar rastro del porqué de las decisiones, no solo del qué.

## Protocolo

1. Describe el contexto y la fuerza que obliga a decidir.
2. Enumera las opciones reales con pros y contras.
3. Registra la decisión en una frase.
4. Documenta consecuencias positivas, negativas y riesgos.
5. Marca el estado: propuesta, aceptada, reemplazada.
6. Enlaza el ADR desde el PR o la documentación.

## Reglas

- Un ADR, una decisión.
- No reescribas un ADR aceptado: crea uno nuevo que lo reemplace.
- Incluye la fecha y el contexto histórico.
- No escondas las desventajas.

## Verificación

- El ADR está en el repo y enlazado.
- Las opciones descartadas tienen motivo.
- Las consecuencias son accionables.
