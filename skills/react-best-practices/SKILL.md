---
name: react-best-practices
description: >
  Performance and correctness rules for React and Next.js from Vercel
  Engineering. Use when writing, reviewing, or refactoring React components,
  Next.js pages, data fetching, bundle boundaries, or rendering behavior, and
  when investigating waterfalls, bundle size, or re-render costs. Do not use for
  React Native, non-React UI frameworks, or performance work without a React
  component in scope.
category: domain
version: 1.0.0
tags: [react, frontend, performance, nextjs]
license: MIT
source: https://github.com/vercel-labs/agent-skills
upstream-commit: 1a2c79d4e6c4
---

# React Best Practices

Comprehensive performance optimization guide for React and Next.js applications,
maintained by Vercel. Contains 70 rules across 8 categories, prioritized by
impact to guide refactoring and code generation.

## When to apply

Use these guidelines when:

- Writing new React components or Next.js pages.
- Implementing client-side or server-side data fetching.
- Reviewing code for performance issues.
- Refactoring existing React or Next.js code.
- Optimizing bundle size or initial load time.

## Rule categories by priority

| Priority | Category | Impact | Prefix |
|---|---|---|---|
| 1 | Eliminating waterfalls | CRITICAL | `async-` |
| 2 | Bundle size optimization | CRITICAL | `bundle-` |
| 3 | Server-side performance | HIGH | `server-` |
| 4 | Client-side data fetching | MEDIUM-HIGH | `client-` |
| 5 | Re-render optimization | MEDIUM | `rerender-` |
| 6 | Rendering performance | MEDIUM | `rendering-` |
| 7 | JavaScript performance | LOW-MEDIUM | `js-` |
| 8 | Advanced patterns | LOW | `advanced-` |

## Quick reference

### 1. Eliminating waterfalls (CRITICAL)

- Check cheap synchronous conditions before awaiting flags or remote values.
- Move `await` into branches where the value is actually used.
- Use `Promise.all()` for independent operations.
- Use dependency-based parallelization for partial dependencies.
- Start promises early and await late in API routes.
- Use Suspense boundaries to stream content.

### 2. Bundle size optimization (CRITICAL)

- Import directly and avoid barrel files.
- Prefer statically analyzable import and file-system paths.
- Use `next/dynamic` for heavy components.
- Load analytics and logging after hydration.
- Load modules only when a feature is activated.
- Preload on hover or focus for perceived speed.

### 3. Server-side performance (HIGH)

- Authenticate Server Actions like API routes.
- Use `React.cache()` for per-request deduplication.
- Use an LRU cache for cross-request caching.
- Avoid duplicate serialization in RSC props.
- Hoist static I/O such as fonts and logos to module level.
- Avoid module-level mutable request state in RSC or SSR.
- Minimize data passed to client components.
- Restructure components to parallelize fetches.
- Chain nested fetches per item with `Promise.all`.
- Use `after()` for non-blocking work after a response.

### 4. Client-side data fetching (MEDIUM-HIGH)

- Use SWR for request deduplication.
- Deduplicate global event listeners.
- Use passive listeners for scroll.
- Version and minimize localStorage data.

### 5. Re-render optimization (MEDIUM)

- Do not subscribe to state used only in callbacks.
- Extract expensive work into memoized components.
- Hoist default non-primitive props.
- Use primitive dependencies in effects.
- Subscribe to derived booleans, not raw values.
- Derive state during render, not in effects.
- Use functional `setState` for stable callbacks.
- Pass a function to `useState` for expensive initial values.
- Avoid `memo` for simple primitives.
- Split hooks with independent dependencies.
- Put interaction logic in event handlers.
- Use `startTransition` for non-urgent updates.
- Defer expensive renders with `useDeferredValue`.
- Use refs for transient frequent values.
- Do not define components inside components.

### 6. Rendering performance (MEDIUM)

- Animate a wrapper, not the SVG element when needed.
- Use `content-visibility` for long lists.
- Extract static JSX outside components.
- Reduce SVG coordinate precision.
- Use an inline script for client-only data to avoid flicker.
- Suppress hydration warnings only when the mismatch is expected.
- Use `Activity` for show/hide behavior.
- Use a ternary, not `&&`, for conditional rendering.
- Prefer `useTransition` for loading state.
- Use React DOM resource hints for preloading.
- Use `defer` or `async` on script tags.

### 7. JavaScript performance (LOW-MEDIUM)

- Batch CSS changes via classes or `cssText`.
- Build a Map for repeated lookups.
- Cache object properties in loops.
- Cache function results in a module-level Map.
- Cache localStorage or sessionStorage reads.
- Combine multiple filter/map passes into one loop.
- Check array length before an expensive comparison.
- Return early from functions.
- Hoist RegExp creation outside loops.
- Use a loop for min/max instead of sorting.
- Use Set/Map for O(1) lookups.
- Use `toSorted()` for immutable sorting.
- Use `flatMap` to map and filter in one pass.
- Defer non-critical work to browser idle time.

### 8. Advanced patterns (LOW)

- Do not put `useEffectEvent` results in effect dependencies.
- Store event handlers in refs when identity must be stable.
- Initialize app-wide work once per app load.
- Use `useLatest` for stable callback refs.

## How to use

Read the matching individual rule under `references/rules/`. Each file contains
why the rule matters, an incorrect example, a corrected example, and relevant
context.

Start with the highest-impact category that matches the task. Do not apply
micro-optimizations from category 7 before addressing a waterfall, bundle
boundary, or server/client data-flow problem.

## Verification

- Confirm the change removes the measured problem, not just the warning.
- Run the relevant tests and typecheck.
- When performance is the claim, compare before and after evidence instead of
  asserting an improvement from code inspection alone.
