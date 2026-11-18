---
name: testing-strategy
description: >
  Estrategia de pruebas para un proyecto o feature. Úsala cuando decidas qué tests escribir, cómo
  estructurarlos o cómo mejorar la confianza sin explotar la suite. Define pirámide, fixtures y
  criterios. No la uses para escribir un test puntual.
category: workflow
version: 1.0.0
tags: [testing, quality]
---

# Estrategia de pruebas

## Objetivo

Maximizar confianza por minuto de CI con la mezcla correcta de tests.

## Protocolo

1. Mapea riesgos: qué puede romperse y cuánto duele.
2. Elige el nivel mínimo que cubre cada riesgo: unitario, integración o E2E.
3. Define fixtures y datos deterministas.
4. Fija objetivos de cobertura por comportamiento, no por línea.
5. Presupuesta el tiempo de CI y el límite de tests E2E.
6. Define la política de tests intermitentes.

## Reglas

- Testea comportamiento, no implementación.
- Pocos E2E, en los flujos que mueven dinero o datos.
- Nada de tests dependientes del orden.
- Un test lento se justifica por el riesgo que cubre.

## Verificación

- Los flujos críticos están cubiertos en algún nivel.
- La suite corre dentro del presupuesto.
- La tasa de flakes es conocida y baja.

## Referencias

- `references/test-pyramid.md`: documentación de apoyo para esta skill.
