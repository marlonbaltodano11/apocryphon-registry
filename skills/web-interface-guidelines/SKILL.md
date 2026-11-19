---
name: web-interface-guidelines
description: >
  Review UI code against Vercel's Web Interface Guidelines. Use when asked to
  review UI, check accessibility, audit design or UX, or verify forms,
  navigation, animation, typography, images, and interactive states against
  current web interface rules. Do not use for backend-only changes, mobile
  native UI, or visual design work with no interface code to inspect.
category: domain
version: 1.0.0
tags: [frontend, accessibility, ui, design]
license: MIT
source: https://github.com/vercel-labs/web-interface-guidelines
upstream-commit: 434b7f913646
---

# Web Interface Guidelines

Review UI code for compliance with the Web Interface Guidelines.

## How it works

1. Read [the local guidelines](references/web-interface-guidelines.md).
2. Read the files or pattern the user supplied.
3. Check the code against every applicable rule.
4. Output concise findings grouped by file.

The guidelines are vendored locally so the skill works offline and never
depends on a remote fetch. If the user supplies no files or pattern, ask which
UI to review.

## Output format

Group findings by file and use `file:line` locations. State the issue and the
location. Skip explanations unless the fix is non-obvious.

```text
## src/Button.tsx

src/Button.tsx:42 - icon button missing aria-label
src/Button.tsx:18 - input lacks a label
src/Button.tsx:55 - animation missing prefers-reduced-motion
src/Button.tsx:67 - transition: all -> list properties

## src/Modal.tsx

src/Modal.tsx:12 - missing overscroll-behavior: contain
src/Modal.tsx:34 - "..." -> "…"

## src/Card.tsx

Pass.
```

Do not report a rule that does not apply to the supplied code. If the UI passes,
say so explicitly instead of padding the report.

## Verification

- Check that every reported location exists.
- Do not claim accessibility or UX correctness without inspecting the rendered
  component or its tests.
- If the user asks for fixes, apply them one rule at a time and re-run the
  relevant checks.
