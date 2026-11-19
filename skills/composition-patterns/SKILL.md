---
name: composition-patterns
description: >
  React composition patterns for flexible component APIs. Use when refactoring
  components with boolean prop proliferation, building reusable component
  libraries, designing compound components or context providers, or reviewing
  component architecture. Do not use for page-level data fetching, CSS-only
  changes, or React Native components.
category: domain
version: 1.0.0
tags: [react, frontend, architecture, design]
license: MIT
source: https://github.com/vercel-labs/agent-skills
upstream-commit: 1a2c79d4e6c4
---

# React Composition Patterns

Composition patterns for flexible, maintainable React components. Avoid
boolean prop proliferation by using compound components, lifting state, and
composing internals. These patterns make codebases easier for humans and agents
to work with as they scale.

## When to apply

Use these guidelines when:

- Refactoring components with many boolean props.
- Building reusable component libraries.
- Designing flexible component APIs.
- Reviewing component architecture.
- Working with compound components or context providers.

## Rule categories by priority

| Priority | Category | Impact | Prefix |
|---|---|---|---|
| 1 | Component architecture | HIGH | `architecture-` |
| 2 | State management | MEDIUM | `state-` |
| 3 | Implementation patterns | MEDIUM | `patterns-` |
| 4 | React 19 APIs | MEDIUM | `react19-` |

## Quick reference

### 1. Component architecture (HIGH)

- `architecture-avoid-boolean-props`: do not add boolean props to customize
  behavior; use composition.
- `architecture-compound-components`: structure complex components with shared
  context.

### 2. State management (MEDIUM)

- `state-decouple-implementation`: the provider is the only place that knows
  how state is managed.
- `state-context-interface`: define a generic interface with state, actions, and
  metadata for dependency injection.
- `state-lift-state`: move state into provider components for sibling access.

### 3. Implementation patterns (MEDIUM)

- `patterns-explicit-variants`: create explicit variant components instead of
  boolean modes.
- `patterns-children-over-render-props`: use children for composition instead
  of `renderX` props.

### 4. React 19 APIs (MEDIUM)

Skip this section on React 18 or earlier.

- `react19-no-forwardref`: do not use `forwardRef`; use `use()` instead of
  `useContext()` where appropriate.

## How to use

Read individual rule files under `references/rules/`. Each file contains why
the rule matters, an incorrect example, a corrected example, and context.

Before changing a public component API, inspect its call sites and preserve
behavior that consumers rely on. Prefer an explicit variant over a new boolean
flag, and keep state ownership in the smallest component that needs it.

## Verification

- Run component tests and typecheck after changing an API.
- Confirm existing call sites still render the intended variants.
- If a change affects accessibility or visual behavior, verify the rendered UI
  rather than relying on prop names alone.
