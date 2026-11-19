---
name: writing-plans
description: >
  Write implementation plans that another engineer or agent can execute without
  guessing. Use when a spec or set of requirements exists for a multi-step task
  and code has not been touched yet, especially when the work spans several
  files, interfaces, or commits. Do not use for one-line changes, open-ended
  brainstorming, or exploration with no implementation target.
category: workflow
version: 1.0.0
tags: [planning, workflow, discipline]
license: MIT
source: https://github.com/obra/superpowers
upstream-commit: 22f0b463e7a5
---

# Writing Plans

Write implementation plans for an engineer who has not seen this codebase or
this spec. Assume they write idiomatic code in the project's language once they
know the exact interface and the exact test. What they cannot know is what you
decided: which files, names, signatures, spec values, and tests prove each
task. Document those decisions as bite-sized tasks.

Save plans to `docs/plans/YYYY-MM-DD-<feature-name>.md`. User preferences for
plan location override this default.

## Scope check

If the spec covers multiple independent subsystems, suggest splitting it into
separate plans, one per subsystem. Each plan should produce working, testable
software on its own.

## File structure

Before defining tasks, map which files will be created or modified and what
each is responsible for. This is where decomposition decisions get locked in.

- Design units with clear boundaries and well-defined interfaces.
- Prefer smaller, focused files over large files doing too much.
- Keep files that change together close together.
- In existing codebases, follow established patterns. Include a split only
  when the file you are modifying has grown unwieldy.

## Task sizing

A task is the smallest unit that carries its own test cycle and is worth a
fresh reviewer's gate. Fold setup, configuration, scaffolding, and
documentation into the task whose deliverable needs them. Split only where a
reviewer could meaningfully reject one task while approving its neighbor.

## Step granularity

Each step is one action with a checkable result:

- "Write the failing test" is a step.
- "Run it and confirm it fails" is a step.
- "Implement the minimal code" is a step.
- "Run the test and confirm it passes" is a step.
- "Commit" is a step.

## Plan document header

Every plan starts with:

```markdown
# [Feature Name] Implementation Plan

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies and libraries]

**Spec:** [Path to the spec or design document]

## Global Constraints

[Version floors, dependency limits, naming rules, platform requirements, and
other project-wide requirements, one line each with exact values.]

## Review Focus

[The input classes or failure modes the spec implies but no task's tests
exercise, most likely first. Add a test for each item to the task that owns the
code.]
```

## Task structure

````markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`
- Test: `tests/exact/path/to/test.py`

**Interfaces:**
- Consumes: [exact signatures from earlier tasks]
- Produces: [exact names, parameters, and return types later tasks rely on]

- [ ] **Step 1: Write the failing test**

```python
def test_specific_behavior():
    result = function(input)
    assert result == expected
```

- [ ] **Step 2: Run the test and confirm it fails**

Run: `pytest tests/path/test.py::test_name -v`
Expected: FAIL because the function does not exist.

- [ ] **Step 3: Implement the minimal change**

Describe the exact signature and file. Include a body only when the algorithm
is not determined by the signature and tests.

- [ ] **Step 4: Run the test and confirm it passes**

Run: `pytest tests/path/test.py::test_name -v`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add tests/path/test.py src/path/file.py
git commit -m "feat: add specific feature"
```
````

## What a step contains

A step is done when the implementer can write exactly one reasonable thing from
it. That is the requirement: unambiguous, not complete.

- A test step contains the test name, assertions, and exact spec values.
- A code step contains the exact signature, file, and pinned values. The
  implementer writes the body.
- A verification step contains the command and the output that means it passed.
- A cross-task reference points at the Interfaces block instead of repeating
  another task's code.

A plan is the set of decisions the implementer cannot make alone. Lines that
decide nothing, such as "handle edge cases" or "write tests for the above",
are gaps. A plan longer than the code it describes has written the code instead.

## Self-review

After drafting, check the plan against the spec:

1. **Spec coverage:** point to a task for every requirement. List gaps.
2. **Step scan:** fix both vague steps and transcript-like code dumps.
3. **Type consistency:** later interfaces must match earlier definitions.
4. **Review Focus:** every listed failure mode has a test in the owning task.
5. **Proportion:** if code blocks dominate, replace bodies with signatures,
   test names, and assertions.

## Handoff

Save the plan, link it for the user, and ask them to confirm that it captures
what they want. Do not start implementation until they approve. After approval,
execute task by task with the `tdd` and `verification-before-completion` skills,
and run the `code-review` skill before declaring the branch ready.
