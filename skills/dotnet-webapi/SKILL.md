---
name: dotnet-webapi
description: >
  Create and modify ASP.NET Core Web API endpoints with correct HTTP semantics,
  DTOs, OpenAPI metadata, and error handling. Use when working with Minimal APIs
  or controllers in .NET, request and response types, OpenAPI wiring,
  centralized error handling, or .http test files. Do not use for general C#
  style, EF Core query optimization, Blazor, gRPC, or SignalR.
category: domain
version: 1.0.0
tags: [dotnet, csharp, api, http, backend]
license: MIT
source: https://github.com/dotnet/skills
upstream-commit: 2877c712edc2
---

# ASP.NET Core Web API

Produce well-structured ASP.NET Core Web API endpoints with proper HTTP
semantics, OpenAPI documentation, and error handling.

## Before editing

Inspect the project before choosing an API style:

- `Program.cs`, endpoint registration, controllers, and DTOs.
- Existing validation, error handling, and OpenAPI configuration.
- The build, run, and test commands.

If the project uses controllers, continue with controllers. If it uses Minimal
APIs, continue with Minimal APIs. For a new project, default to Minimal APIs
unless the user asks for controllers. Do not mix styles.

## Workflow

1. **Define DTOs.** Use dedicated request and response types; never expose EF
   Core entities. Prefer sealed records. Use `DateTimeOffset` for timestamps and
   serialize enums as strings by default.
2. **Implement endpoints.** Group Minimal APIs by resource. Prefer
   `TypedResults`; when returning multiple result types, annotate with
   `Results<T1, T2>`. Accept and forward `CancellationToken`.
3. **Use correct status codes.** GET single returns 200 or 404; POST create
   returns 201 with `Location`; DELETE returns 204; map validation, auth,
   conflict, and unexpected failures consistently.
4. **Wire OpenAPI.** On .NET 9+, use built-in `AddOpenApi()` and `MapOpenApi()`;
   do not add Swashbuckle to a new .NET 9+ project. Add names, summaries,
   descriptions, and response types.
5. **Handle errors globally.** Use Problem Details, `UseExceptionHandler`, and
   `IExceptionHandler` for mapping. Never expose exception messages, SQL, paths,
   or secrets to clients.
6. **Use a service layer.** Do not inject data stores into endpoint handlers.
   Define an interface and a sealed implementation for data access and mapping.
7. **Add an `.http` file.** Include a request for every endpoint and at least one
   error path. Use the real local port.
8. **Verify.** Run `dotnet build`, start the app, load the OpenAPI document, and
   execute the `.http` requests.

## Non-negotiable checks

- [ ] `CancellationToken` appears in every endpoint and is forwarded.
- [ ] POST returns 201 with a `Location` header.
- [ ] DELETE returns 204.
- [ ] Error responses use RFC 7807 Problem Details.
- [ ] Domain entities are not exposed directly.
- [ ] OpenAPI metadata exists for every endpoint.
- [ ] `dotnet build` passes with zero errors and warnings.

## Detailed reference

Read [the full ASP.NET Core Web API guide](references/full-guide.md) for DTO
examples, JSON options, TypedResults patterns, exception handlers, service
interfaces, `.http` samples, validation checklists, and common pitfalls.
