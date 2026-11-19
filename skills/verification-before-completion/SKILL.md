---
name: verification-before-completion
description: >
  Require fresh evidence before claiming work is complete, fixed, or passing.
  Use when about to commit, open a PR, hand work to another agent, or say a
  test, build, linter, or requirement is satisfied. Do not use for interim
  progress updates that make no completion claim.
category: workflow
version: 1.0.0
tags: [discipline, quality, testing]
license: MIT
source: https://github.com/obra/superpowers
upstream-commit: 22f0b463e7a5
---

# Verification Before Completion

**Core principle:** Evidence before claims, always.

Violating the letter of this rule is violating the spirit of it.

## The Iron Law

```
NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE
```

If you have not run the verification command in this message, you cannot claim
it passes.

## The gate function

Before claiming any status or expressing satisfaction:

1. **Identify** what command proves the claim.
2. **Run** the full command, fresh and complete.
3. **Read** the full output, exit code, and failure count.
4. **Verify** whether the output confirms the claim.
   - If no: state the actual status with evidence.
   - If yes: state the claim with evidence.
5. **Only then** make the claim.

Skipping a step is not verifying.

## Common failures

| Claim | Requires | Not sufficient |
|---|---|---|
| Tests pass | Test command output with 0 failures | A previous run or "should pass" |
| Linter is clean | Linter output with 0 errors | A partial check or extrapolation |
| Build succeeds | Build command exits 0 | Linter passing or logs looking good |
| Bug is fixed | The original symptom test passes | Code changed and assumed fixed |
| Regression test works | Red-green cycle verified | The test passes once |
| Agent completed | VCS diff shows the changes | The agent reports success |
| Requirements are met | Line-by-line checklist | Tests passing alone |

## Red flags: stop

- Using "should", "probably", or "seems to".
- Expressing satisfaction before running verification.
- About to commit, push, or open a PR without verification.
- Trusting another agent's success report.
- Relying on partial verification.
- Thinking "just this once".
- Being tired and wanting the work to be over.
- Any wording that implies success without evidence.

## Rationalization prevention

| Excuse | Reality |
|---|---|
| "It should work now" | Run the verification. |
| "I am confident" | Confidence is not evidence. |
| "Just this once" | No exceptions. |
| "The linter passed" | A linter is not a compiler. |
| "The agent said it succeeded" | Verify independently. |
| "I am tired" | Exhaustion is not an excuse. |
| "A partial check is enough" | Partial proves nothing. |
| "Different words avoid the rule" | Spirit over letter. |

## Key patterns

**Tests:**

```
Good: [run test command] [see 34/34 pass] "All tests pass."
Bad:  "Should pass now" or "Looks correct."
```

**Regression tests:**

```
Good: Write -> run (pass) -> revert fix -> run (must fail) -> restore -> run (pass)
Bad:  "I wrote a regression test" without proving it can fail.
```

**Build:**

```
Good: [run build] [see exit 0] "Build passes."
Bad:  "Linter passed." (A linter does not check compilation.)
```

**Requirements:**

```
Good: Re-read plan -> create checklist -> verify each item -> report gaps.
Bad:  "Tests pass, phase complete."
```

**Agent delegation:**

```
Good: Agent reports success -> inspect VCS diff -> verify changes -> report facts.
Bad:  Trust the agent report.
```

## When to apply

Apply this before any success or completion claim, any expression of
satisfaction, any positive statement about work state, committing, opening a PR,
declaring a task complete, moving to the next task, or delegating to an agent.

The rule applies to exact phrases, paraphrases, synonyms, implications of
success, and any communication suggesting completion or correctness.
