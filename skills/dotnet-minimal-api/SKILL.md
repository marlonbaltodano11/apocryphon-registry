---
name: dotnet-minimal-api
description: >
  APIs con ASP.NET Core Minimal APIs en .NET 10. Úsala siempre que crees endpoints, grupos de rutas,
  validación, autenticación u OpenAPI en .NET. No la uses para MVC clásico ni para APIs en otros
  lenguajes.
category: domain
version: 1.0.0
tags: [dotnet, api, http, backend]
---

# Minimal APIs en ASP.NET Core

## Objetivo

Endpoints pequeños, tipados, validados y testeables.

## Protocolo

1. Agrupa rutas con `MapGroup`, prefijos y tags de OpenAPI.
2. Usa DTOs tipados y `TypedResults`; evita objetos anónimos.
3. Valida la entrada y devuelve `ProblemDetails` consistente.
4. Aplica autenticación y autorización por política.
5. Añade rate limiting, CORS y versionado explícito.
6. Documenta con OpenAPI y prueba con `WebApplicationFactory`.

## Reglas

- No pongas lógica de negocio en `Program.cs`.
- No devuelvas entidades de EF directamente.
- No confíes en validación del cliente.
- Propaga `CancellationToken` a la base y a servicios.

## Verificación

- OpenAPI genera el contrato esperado.
- Tests de integración cubren éxito, validación y auth.
- Los errores usan `ProblemDetails`.

## Referencias

- `references/minimal-api-template.md`: documentación de apoyo para esta skill.
