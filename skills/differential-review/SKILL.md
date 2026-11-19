---
name: differential-review
description: >
  Security-focused review of PRs, commits, and diffs. Use when reviewing a code
  change for vulnerabilities, regressions, removed validation, auth or crypto
  changes, blast radius, or missing test coverage; also use when checking
  whether a change reintroduces a previously fixed bug. Do not use for
  greenfield code with no baseline, documentation-only changes, or
  formatting-only diffs.
category: workflow
version: 1.0.0
tags: [security, code-review, appsec]
license: CC-BY-SA-4.0
source: https://github.com/trailofbits/skills
upstream-commit: 149d7b21f406
---

# Differential Security Review

Security-focused code review for PRs, commits, and diffs.

## Core principles

1. **Risk-first**: focus on auth, crypto, value transfer, external calls, and
   validation removal.
2. **Evidence-based**: back every finding with git history, line numbers, and a
   concrete attack scenario.
3. **Adaptive**: scale depth to codebase size.
4. **Honest**: state coverage limits and confidence.
5. **Output-driven**: generate a review artifact, not only a chat summary.

## Do not rationalize skipping

| Rationalization | Reality |
|---|---|
| "Small PR, quick review" | A two-line change can be a critical vulnerability. |
| "I know this codebase" | Familiarity creates blind spots. |
| "Git history takes too long" | History reveals regressions and intent. |
| "Blast radius is obvious" | Transitive callers are easy to miss. |
| "No tests, not my problem" | Missing tests elevate risk. |
| "Just a refactor" | Refactors break invariants. Treat as HIGH until proven LOW. |
| "I will explain verbally" | Findings without an artifact get lost. |

## Size and risk

| Codebase size | Strategy |
|---|---|
| < 20 files | Deep: read dependencies and full git blame. |
| 20–200 files | Focused: one-hop dependencies and priority files. |
| > 200 files | Surgical: critical paths only. |

| Risk | Triggers |
|---|---|
| HIGH | Auth, crypto, external calls, value transfer, validation removal |
| MEDIUM | Business logic, state changes, new public APIs |
| LOW | Comments, tests, UI, logging |

## Workflow

1. **Triage** every changed file and assign risk.
2. **Build baseline context** from the surrounding module and git history.
3. **Analyze code changes**: removed checks, new sinks, trust boundaries, error
   handling, and data flow.
4. **Check test coverage** for the modified behavior.
5. **Calculate blast radius** for HIGH-risk changes by counting callers.
6. **Model adversarial scenarios** for HIGH-risk changes: attacker capability,
   entry point, exploit path, and impact.
7. **Write a report** with file and line references, commits, severity,
   confidence, and coverage limits.

## Quality gates

- [ ] Every changed file accounted for.
- [ ] Git blame run on removed security code.
- [ ] Blast radius calculated for HIGH-risk changes.
- [ ] Attack scenarios are concrete, not generic warnings.
- [ ] Findings reference specific lines and commits.
- [ ] A report file is produced.
- [ ] The user receives a summary and the artifact path.

## References

- [Methodology](references/methodology.md)
- [Adversarial modeling](references/adversarial.md)
- [Reporting](references/reporting.md)
- [Vulnerability patterns](references/patterns.md)

Read the methodology before a full review. Read the adversarial guide for
HIGH-risk changes and the reporting guide before producing the final artifact.
