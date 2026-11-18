---
name: workflow-review-triage
description: >
  Triaje de comentarios de code review. Úsala siempre que el usuario pegue comentarios de
  PR, hallazgos de auditoría o feedback externo y pida aplicarlos. Contrasta cada hallazgo
  contra el código real, clasifícalo como Válido, Opcional o Falso positivo en una tabla y
  espera la selección del usuario antes de editar. No la uses para redactar un review nuevo
  desde cero.
category: workflow
version: 1.0.0
tags: [review, triage, discipline]
---

# Triaje de code review

No apliques comentarios de review a ciegas. Primero verifica cada hallazgo contra el
código real; después, aplica solo lo que el usuario seleccione.

## Protocolo

1. **Lee el código citado.**
   Para cada comentario, abre el archivo y las líneas relevantes. Comprueba si el
   problema existe en la versión actual (el comentario puede referirse a código ya
   cambiado).

2. **Clasifica cada hallazgo.**

   - **Válido:** el problema es real y debe corregirse.
   - **Opcional:** es una mejora razonable pero no bloqueante.
   - **Falso positivo:** el código actual ya lo resuelve, el comentario se equivoca o
     el cambio propuesto rompería otra cosa.

3. **Presenta una tabla numerada.**

   | # | Hallazgo | Veredicto | Evidencia (archivo:línea) | Acción propuesta |
   |---|----------|-----------|---------------------------|------------------|

   - Cita evidencia concreta. Si no pudiste verificarlo, dilo explícitamente.
   - No propongas parches todavía.

4. **Detente y pide selección.**
   Termina con: «Indica qué números quieres aplicar (por ejemplo: 1 y 4)». No edites
   nada hasta recibir la selección.

5. **Aplica solo lo seleccionado.**
   - Agrupa los cambios relacionados en un mismo commit `fix(...)` o `refactor(...)`.
   - Verifica con tests o typecheck antes de cada commit.
   - Si al aplicar un hallazgo descubres que ya no aplica, detente y explícalo.

## Reglas

- Un hallazgo sin evidencia verificable no es válido: márcalo como falso positivo o
  pide más contexto.
- No mezcles correcciones de review con refactors no solicitados.
- Si dos hallazgos se contradicen, señala el conflicto y pide una decisión.
- Al terminar, resume qué se aplicó, qué se descartó y por qué.
