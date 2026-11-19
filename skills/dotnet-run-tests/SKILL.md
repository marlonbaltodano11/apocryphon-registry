---
name: dotnet-run-tests
description: >
  Choose and run the correct .NET test command for a repository. Use when
  running or explaining dotnet tests, including filtered runs, single projects,
  xUnit v2/v3, MSTest, NUnit, TUnit, VSTest vs Microsoft Testing Platform,
  coverage, TRX, diagnostics, crash dumps, or hang dumps. Do not use for
  identifying the platform alone, writing test code, or migrating a test
  framework.
category: workflow
version: 1.0.0
tags: [dotnet, testing, quality]
license: MIT
source: https://github.com/dotnet/skills
upstream-commit: 2877c712edc2
---

# Run .NET Tests

Return or execute the command that matches the repository's project system,
test platform, framework, and SDK mode.

## Discover the repository

Check these before choosing syntax:

- `global.json`
- The selected `.csproj`
- `Directory.Build.props` and `Directory.Packages.props`
- Repository scripts and CI documentation
- `dotnet --version` when the active SDK determines the command

Use an existing repository overlay or script first when one exists. Do not add
or upgrade test packages unless the user asks.

## Decision table

| Detected mode / platform | Command shape | Never use |
|---|---|---|
| Classic non-SDK | Repository script or full MSBuild + `vstest.console.exe` | Assuming `dotnet test` works |
| VSTest mode | `dotnet test <path> [VSTEST_OPTIONS]` | MTP-only flags |
| VSTest with MTP bridge | `dotnet test <path> [DOTNET_OPTIONS] -- [MTP_OPTIONS]` | Omitting `--` |
| Native MTP, SDK 10+ | `dotnet test --project <path> [MTP_OPTIONS]` | Bare positional path |
| TUnit | Configured bridge, native MTP, or test executable | Generic VSTest filter |

`global.json` controls the `dotnet test` command mode on SDK 10+, not
necessarily the platform that executes tests. Keep build options such as
`--framework`, `--configuration`, and `--no-build` before any `--` bridge
separator.

## Common commands

```bash
# VSTest: xUnit v2, MSTest, or NUnit
dotnet test tests/MyTests.csproj

# VSTest MSTest/NUnit filter
dotnet test --filter "FullyQualifiedName~OrderServiceTests&TestCategory=Unit"

# VSTest-to-MTP bridge
dotnet test tests/MyTests.csproj -- --filter-trait "Category=Integration"

# Native MTP, SDK 10+
dotnet test --project tests/MyTests.csproj --filter-class "*ShoppingCartTests*"

# TRX
dotnet test tests/MyTests.csproj --logger "trx;LogFileName=TestResults.trx"
```

For xUnit v3 on MTP, use `--filter-class`, `--filter-method`,
`--filter-trait`, or a single `--filter-query`; do not use VSTest
`ClassName=...`. For TUnit, use the configured MTP tree filter or the test
executable.

## Execution rules

- Run only the requested scope; do not run the whole suite when the user names
  a subset.
- A failed restore or build is not a test failure. Report which phase failed.
- For filtered runs, confirm the reported test names or count match the
  requested scope, not just a zero exit code.
- Report the exact command and a literal `Passed: N, Failed: N, Skipped: N`
  summary.
- Never claim a clean run unless the command completed and the intended tests
  executed.

## Detailed reference

Read [the full .NET test runner guide](references/full-guide.md) for classic
project signals, framework-specific filters, MTP extension flags, diagnostics,
coverage, crash dumps, output contracts, and validation rules.
