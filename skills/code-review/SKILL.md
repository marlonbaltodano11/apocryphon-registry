---
name: code-review
description: >
  Two-axis review of a branch, PR, or work-in-progress diff against a fixed
  point: standards compliance and spec fidelity. Use when asked to review
  changes, review since a commit or branch, or check whether a diff implements
  the originating issue without scope creep. Do not use for reviewing generated
  code you cannot inspect or for a single line whose behavior is already
  covered by an existing review.
category: workflow
version: 1.0.0
tags: [code-review, review, quality]
license: MIT
source: https://github.com/mattpocock/skills
upstream-commit: 5863806dd4e1
---

# Code Review

Review the diff between `HEAD` and a fixed point supplied by the user along two
axes:

- **Standards**: does the code conform to this repository's documented coding
  standards?
- **Spec**: does the code faithfully implement the originating issue or spec?

Keep the axes separate. Code can follow every standard while implementing the
wrong thing, or implement the spec while breaking the project's conventions.

## 1. Pin the fixed point

Use the commit SHA, branch, tag, `main`, or `HEAD~N` the user names. If they do
not name one, ask. Capture the command once:

```bash
git diff <fixed-point>...HEAD
git log <fixed-point>..HEAD --oneline
```

Confirm the ref resolves and the diff is non-empty before analyzing it.

## 2. Identify the spec source

Look for the originating spec in this order:

1. Issue references in commit messages, fetched through the available issue
   tracker.
2. A path the user supplied.
3. A spec under `docs/`, `specs/`, or `.scratch/` matching the branch or feature.
4. If nothing exists, ask where it is. If the user says there is no spec, run
   the Standards axis and report "no spec available".

Do not invent requirements that are absent from both the spec and the project
documentation.

## 3. Identify the standards sources

Search the repository for files that document how code should be written.
`CODING_STANDARDS.md` and `CONTRIBUTING.md` must be included when present.

Always add this fixed baseline of code smells, with two rules:

- **The repository overrides.** A documented project standard wins.
- **Always a judgment call.** Label each smell as possible, never a hard
  violation. Skip anything tooling already enforces.

Baseline smells:

- **Mysterious Name**: a name that does not reveal what the item does or holds.
- **Duplicated Code**: the same logic shape appears in multiple hunks.
- **Feature Envy**: a method reaches into another object's data more than its
  own.
- **Data Clumps**: the same few fields or parameters keep travelling together.
- **Primitive Obsession**: a primitive or string stands in for a domain concept.
- **Repeated Switches**: the same switch or if-cascade recurs on the same type.
- **Shotgun Surgery**: one logical change forces scattered edits.
- **Divergent Change**: one file is edited for several unrelated reasons.
- **Speculative Generality**: abstraction for needs the spec does not have.
- **Message Chains**: long navigation the caller should not depend on.
- **Middle Man**: a class or function that mostly just delegates.
- **Refused Bequest**: a subclass ignores or overrides most of what it inherits.

## 4. Run both axes

If the harness supports subagents, run the Standards and Spec reviews in
parallel fresh contexts. Otherwise perform them sequentially and keep the notes
separate.

**Standards brief:** for each file or hunk, report every place the diff violates
a documented standard, citing the file and rule, and any baseline smell,
quoting the hunk. Distinguish hard violations from judgment calls. Skip
tooling-enforced rules. Keep the report under 400 words.

**Spec brief:** report requirements that are missing or partial, behavior not
asked for, and requirements that look implemented incorrectly. Quote the spec
line for each finding. Keep the report under 400 words.

## 5. Aggregate

Present the reports under `## Standards` and `## Spec`. Do not merge or rerank
findings across axes. End with one line per axis: total findings and the worst
issue within that axis. Do not pick a single winner across axes.

If the spec is missing, say so and report only Standards. If there are no
findings on an axis, state that explicitly instead of padding the report.
