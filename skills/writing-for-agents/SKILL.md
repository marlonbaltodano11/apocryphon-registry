---
name: writing-for-agents
description: >
  Write documents that coding agents consume predictably. Use when creating or
  editing a skill, AGENTS.md, CLAUDE.md, or a document reached by a context
  pointer, and when an agent ignores, over-reads, or misapplies an instruction
  file. Do not use for human marketing copy, API reference generated from code,
  or release notes with no agent-facing component.
category: meta
version: 1.0.0
tags: [skills, authoring, docs, meta]
license: MIT
source: https://github.com/mattpocock/skills
upstream-commit: 5863806dd4e1
---

# Writing for Agents

Reference for writing any document an agent consumes: a skill, an `AGENTS.md`
or `CLAUDE.md`, or a document reached by a pointer. The packaging differs; the
writing does not: the same levers make each one predictable, because the agent
takes the same process every run rather than producing the same output.

When the document is a skill, read
[SKILL-MECHANICS.md](references/SKILL-MECHANICS.md) for frontmatter,
invocation choice, and router skills.

## Context pointers

A **context pointer** is a reference in context that names out-of-context
material and encodes the condition for reaching it. A skill description is one;
a line in `AGENTS.md` naming a document is the same object. The pointer's
wording, not its target, decides when the agent reaches the material and how
reliably. A must-have target behind a weak pointer is a variance bug: sharpen
the wording first, and inline the material only if sharpening fails.

A pointer does two jobs: state what the material is, and list the branches that
should trigger reaching it. Every word of an always-loaded pointer costs on
every turn, so it earns harder pruning than the body.

- Front-load the leading word: the pointer does its triggering work there.
- One trigger per branch. Collapse synonyms that rename the same branch.
- Cut identity the body already carries.

## The two loads

Every document and pointer spends one of two budgets:

- **Context load** is the cost of always-loaded material: an `AGENTS.md` line,
  a skill description, or anything in context every turn.
- **Cognitive load** is the human cost of remembering which documents exist and
  when to use each. Spend it where human judgment matters.

Material reached only through a pointer escapes context load at the price of
the pointer's line. Material with no pointer rides entirely on cognitive load.

## Information hierarchy

A document contains two content types: **steps** (ordered actions) and
**reference** (definitions, rules, and facts consulted on demand). The core
decision is where each piece sits:

1. **In-file step** is the primary tier: what the agent does, in order.
2. **In-file reference** is consulted on demand and may be a flat peer set,
   such as every rule of a review.
3. **Disclosed reference** lives in a separate file reached by a pointer and is
   loaded only when the pointer fires.

**Progressive disclosure** pushes material down the ladder so the top stays
legible. Inline what every branch needs; disclose what only some branches
reach. **Co-location** keeps a concept's definition, rules, and caveats under
one heading. **Sprawl** is the failure mode where every line is live but the
document is still too long; split by branch or sequence.

## Steps and completion criteria

Every step ends on a **completion criterion** that tells the agent the work is
done. Two properties matter:

- **Clarity**: can the agent distinguish done from not-done? A vague bound
  invites premature completion.
- **Demand**: how much work does the criterion require? "Every modified model
  accounted for" forces thoroughness where "produce a change list" does not.

The strongest criteria are checkable and exhaustive.

## When to split

Split only when the cut earns its cost:

- **By sequence** when later steps tempt the agent to rush the current one.
- **By invocation** when a skill is reached only by an explicit user command
  rather than model selection.

Avoid merging sequences that expose later steps to the current task.

## Leading words

A **leading word** is a compact concept already in the model's pretraining that
the agent thinks with while running the document: _lesson_, _fog of war_,
_tracer bullets_. Repeated as a token, it anchors a region of behavior in fewer
tokens than a definition. Use an existing word before coining a new one.

Hunt for passages that can collapse into a leading word: a triad spelled out at
three sites, or a sentence that gestures at one idea. Fewer tokens and a sharper
hook.

**Negation** is the failure mode beside this lever. Steering by prohibition
drags the forbidden behavior into context and makes it more available. Prompt
the positive target instead. Keep a prohibition only as a hard guardrail, and
pair it with the positive behavior.

## Pruning

- Keep each meaning in one source of truth. Duplication costs tokens and
  maintenance and inflates its apparent priority.
- Treat the environment as a source of truth: package scripts, config, layout,
  and `--help` output. A document that restates them is a cache; cache only what
  the agent cannot discover by looking.
- Check every line for relevance. Material that never bears on the task, or has
  gone stale, is sediment. Remove it.
- Hunt no-ops: instructions the model already follows by default. If a sentence
  does not change behavior, delete the whole sentence.

Read [SKILL-MECHANICS.md](references/SKILL-MECHANICS.md) before creating a new
skill or changing its invocation model.
