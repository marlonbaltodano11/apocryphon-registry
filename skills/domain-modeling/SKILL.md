---
name: domain-modeling
description: >
  Build and sharpen a project's domain model. Use when discussing codebase
  terminology, writing or editing a GLOSSARY.md, recording or revising an ADR,
  or resolving overloaded terms across code and documentation. Do not use for
  merely reading a glossary, implementation-only refactors, or project
  management status updates.
category: domain
version: 1.0.0
tags: [architecture, design, docs, adr]
license: MIT
source: https://github.com/mattpocock/skills
upstream-commit: 5863806dd4e1
---

# Domain Modeling

Actively build and sharpen the project's domain model as you design. This is
the active discipline: challenging terms, inventing edge-case scenarios, and
writing the glossary and decisions down the moment they crystallize. Merely
reading `GLOSSARY.md` for vocabulary is not this skill.

## File structure

Most repositories have a single context:

```text
/
├── GLOSSARY.md
├── docs/
│   └── adr/
│       ├── 0001-event-sourced-orders.md
│       └── 0002-postgres-for-write-model.md
└── src/
```

If a `GLOSSARY-MAP.md` exists at the root, the repository has multiple
contexts. The map points to each context's glossary and ADR directory.

Create files lazily: only when there is something to write. If no
`GLOSSARY.md` exists, create one when the first term is resolved. If no
`docs/adr/` exists, create it when the first ADR is needed.

## During the session

### Challenge against the glossary

When a term conflicts with `GLOSSARY.md`, call it out immediately: "Your
glossary defines cancellation as X, but you seem to mean Y. Which is it?"

### Sharpen fuzzy language

When a term is vague or overloaded, propose a precise canonical term: "You are
saying account. Do you mean Customer or User? Those are different things."

### Discuss concrete scenarios

Stress-test domain relationships with specific scenarios that probe edge cases
and force precision about the boundaries between concepts.

### Cross-reference with code

When the user states how something works, check whether the code agrees. Surface
contradictions: "The code cancels entire Orders, but you said partial
cancellation is possible. Which is right?"

### Update GLOSSARY.md inline

When a term is resolved, update `GLOSSARY.md` immediately. Do not batch these.
Use the format in [GLOSSARY-FORMAT.md](references/GLOSSARY-FORMAT.md).

`GLOSSARY.md` must contain no implementation details. It is a glossary, not a
spec, scratch pad, or repository for implementation decisions.

### Offer ADRs sparingly

Only offer an ADR when all three conditions hold:

1. **Hard to reverse**: changing your mind later has a meaningful cost.
2. **Surprising without context**: a future reader will wonder why.
3. **A real trade-off**: there were genuine alternatives and a specific reason
   for the choice.

If any condition is missing, skip the ADR. When one is warranted, use the
format in [ADR-FORMAT.md](references/ADR-FORMAT.md) and place it under
`docs/adr/` with the next sequence number.
