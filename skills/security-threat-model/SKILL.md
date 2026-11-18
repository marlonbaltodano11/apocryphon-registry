---
name: security-threat-model
description: >
  Modelado de amenazas. Úsala siempre que diseñes una feature, API o arquitectura que maneje datos sensibles,
  dinero o autenticación. Identifica activos, límites de confianza y mitigaciones. No la uses para
  auditorías de cumplimiento formales.
category: domain
version: 1.0.0
tags: [security, threat-model, architecture]
---

# Modelado de amenazas

## Objetivo

Detectar riesgos de seguridad antes de implementar y decidir qué mitigar.

## Protocolo

1. Enumera activos: datos, credenciales, dinero, disponibilidad.
2. Identifica actores y sus capacidades.
3. Dibuja límites de confianza: cliente, API, colas, DB, terceros.
4. Aplica STRIDE a cada flujo que cruza un límite.
5. Propón mitigaciones y marca el riesgo residual.
6. Añade tests o controles para las mitigaciones críticas.

## Reglas

- Asume entrada hostil en todos los límites.
- Mínimo privilegio por defecto.
- Defensa en profundidad, no un único control.
- Un riesgo aceptado debe quedar documentado.

## Verificación

- Tabla de amenazas con mitigación y riesgo residual.
- Tests de autorización y validación de entrada.
- Los riesgos aceptados están aprobados.

## Referencias

- `references/stride.md`: documentación de apoyo para esta skill.
