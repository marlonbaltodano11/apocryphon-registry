---
name: api-auth-sessions
description: >
  Autenticación y sesiones seguras. Úsala siempre que implementes login, tokens, cookies, refresh,
  permisos o cierres de sesión. Verifica almacenamiento, rotación, CSRF, expiración y autorización
  por recurso. No la uses para integraciones de terceros sin revisar su contrato.
category: domain
version: 1.0.0
tags: [auth, security, api]
---

# Autenticación y sesiones

## Objetivo

Implementar autenticación y autorización sin filtraciones ni sesiones eternas.

## Protocolo

1. Elige el mecanismo: cookie de sesión, token de acceso o ambos.
2. Define almacenamiento: httpOnly, Secure y SameSite para cookies; nunca localStorage para sesiones.
3. Define expiración corta para acceso y rotación para refresh.
4. Protege contra CSRF si usas cookies y contra XSS en todo el frontend.
5. Verifica autorización en el servidor para cada recurso, no en el cliente.
6. Implementa logout, revocación y auditoría de eventos.

## Reglas

- Nunca registres tokens, cookies ni contraseñas.
- No confíes en roles enviados por el cliente.
- No reutilices refresh tokens indefinidamente.
- Devuelve 401 para falta de autenticación y 403 para falta de permiso.

## Verificación

- Tests de expiración, rotación y revocación.
- Tests de CSRF y de autorización por recurso.
- Los logs no contienen credenciales.

## Referencias

- `references/session-checklist.md`: documentación de apoyo para esta skill.
