---
name: receiving-code-review
description: >
  Evaluate code review feedback before implementing it. Use when the user
  pastes PR comments, audit findings, or external reviewer suggestions and asks
  to apply them, especially when feedback is unclear, conflicting, or
  technically questionable. Do not use for writing a fresh review from scratch
  or for applying a change the user has already fully specified.
category: workflow
version: 1.0.0
tags: [code-review, review, discipline]
license: MIT
source: https://github.com/obra/superpowers
upstream-commit: 22f0b463e7a5
---

# Receiving Code Review

Code review requires technical evaluation, not emotional performance.

**Core principle:** Verify before implementing. Ask before assuming. Technical
correctness over social comfort.

## Response pattern

1. **Read** the complete feedback without reacting.
2. **Understand** by restating the requirement in your own words, or ask.
3. **Verify** each claim against the codebase.
4. **Evaluate** whether it is technically sound for this codebase.
5. **Respond** with a technical acknowledgment or reasoned pushback.
6. **Implement** one item at a time and test each.

## Avoid performative responses

Do not open with "You're absolutely right!", "Great point!", or "Let me
implement that now" before verification. Instead, restate the technical
requirement, ask a clarifying question, push back with reasoning, or start
working.

## Handle unclear feedback

If any item is unclear, stop before implementing anything and ask about the
unclear items. Items may be related; partial understanding produces the wrong
implementation.

Example: if items 1, 2, 3, and 6 are clear but 4 and 5 are not, say: "I
understand 1, 2, 3, and 6. I need clarification on 4 and 5 before proceeding."

## Source-specific handling

### Feedback from the user

- Treat it as trusted, but ask when scope is unclear.
- Skip performative agreement and move to the technical action.
- If it conflicts with a prior architectural decision, stop and discuss it.

### Feedback from external reviewers

Before implementing, check:

1. Is it technically correct for this codebase?
2. Does it break existing functionality?
3. Does it understand why the current implementation exists?
4. Does it work on all supported platforms and versions?
5. Does the reviewer understand the full context?

If a suggestion seems wrong, push back with technical reasoning. If you cannot
verify it, say what you need. If it conflicts with the user's prior decisions,
discuss it before editing.

## YAGNI check

When a reviewer suggests "implementing it properly", search the codebase for
actual usage. If nothing uses the feature or endpoint, ask whether it should be
removed instead. If it is used, implement it properly.

## Implementation order

For multi-item feedback:

1. Clarify anything unclear first.
2. Implement blocking issues, then simple fixes, then complex refactors.
3. Test each fix individually.
4. Verify no regressions.

## When to push back

Push back when a suggestion breaks existing functionality, lacks context,
violates YAGNI, is technically wrong for the stack, or conflicts with a
documented architectural decision. Use technical reasoning, specific
questions, and working tests or code. If the decision is architectural, involve
the user.

If you pushed back and were wrong, state the correction factually and move on:
"You were right. I checked X and it does Y. Implementing now."

## Common mistakes

| Mistake | Fix |
|---|---|
| Performative agreement | State the requirement or act. |
| Blind implementation | Verify against the codebase first. |
| Batch without testing | Apply one item at a time. |
| Assuming the reviewer is right | Check whether it breaks something. |
| Avoiding pushback | Technical correctness over comfort. |
| Partial implementation | Clarify all items first. |
| Proceeding despite a verification gap | State the limitation and ask. |
