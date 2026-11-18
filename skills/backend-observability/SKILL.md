---
name: backend-observability
description: >
  Observabilidad en servicios backend. Úsala siempre que añadas endpoints, jobs o integraciones y
  necesites diagnosticar producción. Implementa logs estructurados, request IDs, métricas y trazas.
  No la uses para instrumentar scripts locales.
category: domain
version: 1.0.0
tags: [observability, logging, backend]
---

# Observabilidad backend

## Objetivo

Poder responder qué pasó, dónde y a quién afectó sin adivinar.

## Protocolo

1. Define las señales: latencia, errores, saturación y negocio.
2. Emite logs estructurados con campos estables.
3. Propaga un request ID desde el borde hasta la base y los jobs.
4. Añade métricas RED (rate, errors, duration) y trazas en flujos críticos.
5. Configura dashboards y alertas sobre síntomas, no sobre causas.
6. Prueba que una petición se puede seguir de punta a punta.

## Reglas

- No incluyas PII, tokens ni secretos en logs.
- No uses logs de texto libre para datos que necesitas consultar.
- No alertes por cada error: alerta por impacto.
- Muestrea trazas de alto volumen.

## Verificación

- Una petición se rastrea con su request ID.
- Hay dashboard y alerta para el flujo crítico.
- La alerta se disparó en una prueba.
- El esquema de logs está documentado.
