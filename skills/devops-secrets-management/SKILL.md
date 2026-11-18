---
name: devops-secrets-management
description: >
  Manejo de secretos. Úsala siempre que configures credenciales, variables de entorno, CI o
  rotación. Mantén secretos fuera del repo y de los logs. No la uses para datos públicos.
category: domain
version: 1.0.0
tags: [secrets, security, devops]
---

# Gestión de secretos

## Objetivo

Usar credenciales de forma segura, auditable y rotable.

## Protocolo

1. Haz inventario de secretos y quién los necesita.
2. Guárdalos en el gestor adecuado (CI, vault o secret manager).
3. Aplica mínimo privilegio y separación por entorno.
4. Inyéctalos en runtime, nunca en la imagen ni en el repo.
5. Define rotación y revocación.
6. Escanea el diff y los logs antes de cerrar.

## Reglas

- Nunca commitees secretos ni `.env`.
- Nunca los imprimas en logs o mensajes de error.
- No reutilices el mismo secreto entre entornos.
- Prefiere tokens de vida corta.

## Verificación

- `./scripts/scan-staged-secrets.sh` pasa.
- Los logs no contienen credenciales.
- La rotación está documentada.

## Scripts

- `./scripts/scan-staged-secrets.sh`: verificación auxiliar de esta skill.
