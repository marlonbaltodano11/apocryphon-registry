---
name: workflow-test-first
description: >
  Ciclo TDD para features y bugs. Úsala cuando el usuario pida implementar algo verificable o
  corregir un bug y quieras garantizar cobertura antes del código. Escribe un test que falle,
  implementa lo mínimo y refactoriza. No la uses para prototipos exploratorios sin criterio de
  aceptación.
category: workflow
version: 1.0.0
tags: [testing, tdd, workflow]
---

# Test-first (TDD)

## Objetivo

Convertir cada expectativa en un test que falle primero y guíe la implementación mínima.

## Protocolo

1. Aclara el comportamiento esperado con un ejemplo concreto de entrada y salida.
2. Escribe el test más pequeño que exprese ese comportamiento y ejecútalo: debe fallar por la razón correcta.
3. Implementa lo mínimo para ponerlo en verde. No añadas casos que aún no estén pedidos.
4. Refactoriza con la red de seguridad del test.
5. Repite con el siguiente comportamiento o borde.

## Reglas

- Un test, un comportamiento.
- Nombra los tests por comportamiento, no por método.
- No mockees todo: prefiere colaboradores reales cuando sea barato.
- Un test que nunca viste fallar no demuestra nada.

## Verificación

- El test falla sin la implementación y pasa con ella.
- La suite completa queda verde.
- Los bordes relevantes están cubiertos.
