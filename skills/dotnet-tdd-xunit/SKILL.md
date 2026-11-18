---
name: dotnet-tdd-xunit
description: >
  TDD en .NET 10 con xUnit. Úsala siempre que implementes una feature o corrijas un bug en C# y
  quieras escribir tests primero. Ciclo red-green-refactor con `dotnet test`, xUnit, fixtures y
  WebApplicationFactory. No la uses para tests E2E de navegador.
category: workflow
version: 1.0.0
tags: [dotnet, csharp, tdd, testing]
---

# TDD en .NET con xUnit

## Objetivo

Guiar el diseño con tests rápidos y deterministas antes de escribir producción.

## Protocolo

1. Crea `tests/<Proyecto>.Tests` con `dotnet new xunit` y referencia el proyecto.
2. Escribe un test Arrange-Act-Assert que falle y ejecútalo con `dotnet test --filter`.
3. Implementa lo mínimo para ponerlo en verde.
4. Refactoriza con la red de seguridad del test.
5. Usa `[Theory]` e `[InlineData]` para bordes y `IClassFixture` para setup compartido.
6. Para APIs, prueba con `WebApplicationFactory<Program>`; para DB, Testcontainers.
7. Mide cobertura con `dotnet test --collect:"XPlat Code Coverage"`.

## Reglas

- Un comportamiento por test y nombres descriptivos.
- Nada de lógica en los tests.
- Nada de `Thread.Sleep`; espera condiciones o usa relojes falsos.
- No mockees tipos que no controlas si puedes usar el real.
- No dejes tests skipped para que CI quede verde.

## Verificación

- El test falla antes de la implementación y pasa después.
- La suite completa queda verde.
- No hay tests skipped ni intermitentes.
- Los bordes relevantes están cubiertos.

## Referencias

- `references/xunit-patterns.md`: documentación de apoyo para esta skill.
