---
name: workflow-read-only-plan
description: >
  Protocolo de planificación en solo lectura. Úsala siempre que el usuario pida una
  funcionalidad, un refactor o una corrección no trivial (varios archivos, cambios de
  arquitectura o migraciones) antes de editar código. Investiga el repositorio, propone
  fases atómicas con archivos afectados y comando de verificación, y espera aprobación
  explícita. No la uses para preguntas conceptuales ni para cambios de una línea.
category: workflow
version: 1.0.0
tags: [planning, discipline, read-only]
---

# Planificación en solo lectura

Tu objetivo es producir un plan verificable **antes** de tocar el código. Durante
esta fase no tienes permitido usar herramientas de edición.

## Protocolo

1. **Investiga antes de proponer.**
   - Lee los archivos relevantes (punto de entrada, tests existentes, configuración).
   - Identifica convenciones del repositorio: estructura, nombres, estilo de tests.
   - Si algo es ambiguo, haz preguntas concretas en lugar de asumir.

2. **Divide el trabajo en fases atómicas.**
   Cada fase debe poder completarse y verificarse por separado, y equivaler a un
   commit semántico compilable. Evita fases que mezclen refactor y cambio de
   comportamiento.

3. **Presenta el plan como una tabla** con estas columnas:

   | # | Objetivo | Archivos afectados | Verificación | Commit propuesto |
   |---|----------|--------------------|--------------|------------------|

   - `Archivos afectados`: rutas concretas, no "varios".
   - `Verificación`: comando exacto que demuestra que la fase funciona
     (por ejemplo `npm test -- src/foo.test.ts` o `npm run typecheck`).
   - `Commit propuesto`: mensaje en formato Conventional Commits.

4. **Añade riesgos y supuestos** en una lista breve después de la tabla.

5. **Detente y pide aprobación.**
   Termina con una pregunta directa: «¿Apruebas este plan o quieres ajustar alguna
   fase?». No edites ningún archivo hasta recibir una respuesta afirmativa.

## Reglas

- No inventes archivos ni APIs: verifica que existan antes de citarlos.
- Si el plan supera las 6 fases, propone agruparlas o dividir la tarea.
- Si detectas que la tarea requiere una decisión de producto, pregunta antes de
  planificar la implementación.
- Cuando el plan se apruebe, continúa con la skill `workflow-atomic-commits` si
  está disponible.
