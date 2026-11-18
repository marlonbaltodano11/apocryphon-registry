---
name: dotnet-modern-csharp
description: >
  Convenciones de C# moderno y .NET 10. Úsala siempre que crees o modifiques proyectos, APIs o
  librerías en C# y .NET. Cubre nullable, async, analyzers, configuración, logging y APIs. No la
  uses para scripts sueltos ni para otros lenguajes.
category: domain
version: 1.0.0
tags: [dotnet, csharp, backend, quality]
---

# C# moderno en .NET 10

## Objetivo

Aprovechar .NET 10 con código tipado, asíncrono, observable y sin warnings.

## Protocolo

1. Fija `net10.0`, `Nullable=enable`, `ImplicitUsings=enable` y trata warnings como errores.
2. Activa analyzers y `dotnet format` en CI.
3. Async de punta a punta con `CancellationToken`; nunca bloquees con `.Result` o `.Wait()`.
4. Usa el patrón options con validación al arranque; nada de secretos en código.
5. Devuelve `ProblemDetails` en APIs y usa DTOs tipados.
6. Registra con `ILogger` estructurado y expón health checks.

## Reglas

- Nada de `async void` salvo event handlers.
- Nada de service locator ni `IServiceProvider` esparcido por el dominio.
- No uses `DateTime.Now` en lógica de dominio; inyecta `TimeProvider`.
- Centraliza versiones con `Directory.Packages.props` y `Directory.Build.props`.
- No commitees cadenas de conexión ni claves.

## Verificación

- `dotnet build -warnaserror` pasa.
- `dotnet format --verify-no-changes` pasa.
- `dotnet test` pasa.
- OpenAPI y health checks responden.

## Referencias

- `references/dotnet10-checklist.md`: documentación de apoyo para esta skill.
