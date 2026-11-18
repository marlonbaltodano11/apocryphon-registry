---
name: workflow-atomic-commits
description: >
  Divide el trabajo en commits semánticos atómicos y verifica cada paso. Úsala cuando
  implementes una tarea ya planificada con varios pasos, cuando el usuario pida commits
  pequeños o cuando lleves más de tres archivos modificados sin commitear. Cada paso debe
  compilar, pasar tests y tener un mensaje Conventional Commits. No la uses para
  exploración sin cambios de código.
category: workflow
version: 1.0.0
tags: [git, commits, discipline]
---

# Commits atómicos con verificación

Trabaja en incrementos pequeños y verificables. Un commit es la unidad mínima de
entrega: si algo falla, debe poder revertirse sin arrastrar cambios no relacionados.

## Bucle de trabajo

Para cada paso del plan:

1. **Implementa el cambio más pequeño posible.**
   No mezcles en el mismo paso un refactor, una corrección de bug y una nueva
   funcionalidad.

2. **Verifica antes de preparar el commit.**
   - Ejecuta el comando de verificación del paso (tests, typecheck o linter).
   - Si falla, corrige y vuelve a ejecutar. Nunca prepares un commit con tests rojos.

3. **Revisa el alcance.**
   - `git status --short` y `git diff --stat` para confirmar que solo cambiaste lo
     previsto.
   - Si aparecen archivos generados o temporales, elimínalos o ignóralos; no los
     incluyas.

4. **Prepara solo los archivos del paso.**

   ```bash
   git add <archivos-del-paso>
   ```

5. **Comprueba que no haya secretos en el diff preparado.**

   ```bash
   ./scripts/check-secrets.sh
   ```

   Si el script falla, mueve el secreto a un archivo local no versionado antes de
   continuar.

6. **Commitea con un mensaje semántico.**

   ```
   <tipo>(<alcance>): <descripción en imperativo>
   ```

   Tipos habituales: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `perf`.
   Ejemplo: `feat(auth): add refresh token rotation`.

7. **Continúa con el siguiente paso** solo cuando el anterior esté commiteado y
   verificado.

## Reglas

- Un commit no debe romper la build: si el repositorio usa CI por commit, cada
  commit debe pasar.
- No reescribas commits ya publicados sin pedir permiso explícito.
- Si un paso resulta demasiado grande, divídelo en dos antes de continuar.
- No incluyas cambios de formato masivos junto a cambios funcionales.

## Verificación final

Antes de declarar la tarea terminada:

```bash
git status --short
git log --oneline -10
```

El árbol debe estar limpio (salvo archivos ignorados) y el historial debe reflejar
los pasos del plan.
