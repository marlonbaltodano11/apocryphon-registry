---
name: codebase-design
description: >
  Design deep modules with clean seams and testable interfaces. Use when
  designing or improving a module interface, deciding where a seam belongs,
  making code more testable or AI-navigable, or reviewing an architecture that
  is becoming shallow. Do not use for visual design, product copy, or
  one-line implementation changes with no interface decision.
category: domain
version: 1.0.0
tags: [architecture, design, refactor]
license: MIT
source: https://github.com/mattpocock/skills
upstream-commit: 5863806dd4e1
---

# Codebase Design

Design **deep modules**: a lot of behavior behind a small interface, placed at
a clean seam, testable through that interface. Use this language wherever code
is designed or restructured. The aim is leverage for callers, locality for
maintainers, and testability for everyone.

## Glossary

Use these terms exactly. Consistent language is the point.

**Module**: anything with an interface and an implementation. Scale-agnostic:
a function, class, package, or tier-spanning slice. Avoid "unit", "component",
or "service" when you mean module.

**Interface**: everything a caller must know to use the module correctly: the
type signature, invariants, ordering constraints, error modes, required
configuration, and performance characteristics. Avoid "API" or "signature"
when they refer only to the type-level surface.

**Implementation**: what is inside a module. Distinct from an **adapter**: a
small adapter can have a large implementation, and a large adapter can have a
small one. Use "adapter" when the seam is the topic.

**Depth**: leverage at the interface. A module is deep when a large amount of
behavior sits behind a small interface, and shallow when the interface is nearly
as complex as the implementation.

**Seam** (Michael Feathers): a place where behavior can change without editing
in that place; the location where a module's interface lives. "Boundary" is
overloaded with domain-driven design, so use "seam" or "interface".

**Adapter**: a concrete thing that satisfies an interface at a seam. It
describes a role, not what is inside.

**Leverage**: what callers get from depth. One implementation pays back across
many call sites and tests.

**Locality**: what maintainers get from depth. Change, bugs, knowledge, and
verification concentrate in one place instead of spreading across callers.

## Deep versus shallow

A deep module has a small interface and a large implementation. A shallow
module has a large interface and a thin implementation.

When designing an interface, ask:

- Can you reduce the number of methods?
- Can you simplify the parameters?
- Can you hide more complexity inside?

## Principles

- Depth is a property of the interface, not the implementation.
- The deletion test: if deleting the module makes complexity vanish, it was a
  pass-through. If complexity reappears across callers, it was earning its
  keep.
- The interface is the test surface. Callers and tests cross the same seam.
- One adapter means a hypothetical seam. Two adapters mean a real one. Do not
  introduce a seam unless something actually varies across it.

## Designing for testability

1. **Accept dependencies, do not create them.** Pass a payment gateway instead
   of constructing a concrete one inside the function.
2. **Return results, do not produce hidden side effects.** Prefer a function
   that calculates a discount to one that mutates a cart in place.
3. **Keep the surface small.** Fewer methods mean fewer tests and simpler
   setup.

## Relationships

- A module has one interface, the surface presented to callers and tests.
- Depth is measured against that interface.
- A seam is where the interface lives.
- An adapter sits at a seam and satisfies the interface.
- Depth produces leverage for callers and locality for maintainers.

## Going deeper

- [DEEPENING.md](references/DEEPENING.md): dependency categories, seam
  discipline, and replace-don't-layer testing.
- [DESIGN-IT-TWICE.md](references/DESIGN-IT-TWICE.md): design an interface
  several radically different ways, then compare depth, locality, and seam
  placement.

Read the matching reference when the task is about deepening a cluster or
exploring alternative interfaces.
