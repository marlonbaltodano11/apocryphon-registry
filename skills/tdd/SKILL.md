---
name: tdd
description: >
  Test-driven development for features and bug fixes. Use when the user asks
  for TDD, red-green-refactor, test-first implementation, integration tests, or
  behavior-focused tests, and when a change needs a regression test before the
  implementation. Do not use for exploratory spikes, throwaway prototypes, or
  changes with no observable behavior to pin down.
category: workflow
version: 1.0.0
tags: [tdd, testing, quality]
license: MIT
source: https://github.com/mattpocock/skills
upstream-commit: 5863806dd4e1
---

# Test-Driven Development

TDD is the red → green loop. This skill is the reference that makes that loop
produce tests worth keeping: what a good test is, where tests go, the
anti-patterns, and the rules of the loop. Apply every section on every cycle:
consult them before and during the loop, not after.

When exploring the codebase, read `GLOSSARY.md` if it exists so test names and
interface vocabulary match the project's domain language. Respect ADRs in the
area you are touching.

## What a good test is

Tests verify behavior through public interfaces, not implementation details.
Code can change entirely; tests should not. A good test reads like a
specification: "user can check out with a valid cart" tells you exactly what
capability exists and survives refactors because it does not care about
internal structure.

See [tests.md](references/tests.md) for examples and
[mocking.md](references/mocking.md) for mocking guidelines.

## Seams: where tests go

A **seam** is the public boundary you test at: the interface where you observe
behavior without reaching inside. Tests live at seams, never against internals.

Test only at pre-agreed seams. Before writing any test, write down the seams
under test and confirm them with the user. No test is written at an unconfirmed
seam. You cannot test everything, so agreeing the seams up front is how testing
effort lands on critical paths and complex logic instead of every edge case.

Ask: "What is the public interface, and which seams should we test?" Give each
proposed seam a one-line note on what it catches and what it misses.

When the shape of the interface itself is in question, use the
`codebase-design` skill for the shared vocabulary of modules, interfaces,
depth, seams, adapters, leverage, and locality.

## Anti-patterns

- **Implementation-coupled**: mocks internal collaborators, tests private
  methods, or verifies through a side channel. The tell: the test breaks when
  you refactor but behavior has not changed.
- **Tautological**: the assertion recomputes the expected value the way the
  code does, so it passes by construction. Expected values must come from an
  independent source of truth: a known-good literal, a worked example, or the
  spec.
- **Horizontal slicing**: writing all tests first, then all implementation.
  Bulk tests verify imagined behavior. Work in vertical slices instead: one
  test → one implementation → repeat, with each test acting as a tracer bullet.

## Rules of the loop

- **Red before green.** Write the failing test first, then only enough code to
  pass it. Do not anticipate future tests or add speculative features.
- **One slice at a time.** One seam, one test, one minimal implementation per
  cycle.
- **Refactoring is not part of the loop.** It belongs to the review stage, not
  the red → green implementation cycle.

## Verification

- Show the test failing for the intended reason before writing the fix.
- Show the same test passing after the minimal implementation.
- Run the relevant suite and typecheck before claiming completion.
- If the test cannot fail against the previous code, it is not a regression
  test.
