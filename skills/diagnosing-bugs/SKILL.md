---
name: diagnosing-bugs
description: >
  A disciplined diagnosis loop for hard bugs and performance regressions. Use
  when the user asks to diagnose or debug something, or reports behavior that
  is broken, throwing, failing intermittently, or slow. Do not use for applying
  a fix whose cause is already proven, or for style-only changes.
category: workflow
version: 1.0.0
tags: [debugging, workflow, quality]
license: MIT
source: https://github.com/mattpocock/skills
upstream-commit: 5863806dd4e1
---

# Diagnosing Bugs

A discipline for hard bugs. Skip phases only when explicitly justified.

When exploring the codebase, read `GLOSSARY.md` if it exists to build a clear
mental model of the relevant modules, and check ADRs in the area you are
touching.

## Redact

This skill has you show commands, outputs, and captured artifacts. **Redact
every secret first**: write `<REDACTED>` in its place. Build loops against
environment variables so the credential stays in the environment rather than
in what you show. Captured artifacts carry auth headers: quote only the lines
that carry the signal.

If the redacted output is not enough to diagnose the bug, say so and ask the
user.

## Phase 1: Build a feedback loop

**This is the skill.** Everything else is mechanical. If you have a **tight**
pass/fail signal for the bug (one that goes red on *this* bug), you will find
the cause. If you do not have one, no amount of staring at code will save you.

Spend disproportionate effort here. Be aggressive. Be creative. Refuse to give
up.

### Ways to construct one, in roughly this order

1. **Failing test** at whatever seam reaches the bug: unit, integration, e2e.
2. **Curl or HTTP script** against a running dev server.
3. **CLI invocation** with fixture input, diffing stdout against a known-good
   snapshot.
4. **Headless browser script** (Playwright or Puppeteer) that drives the UI and
   asserts on DOM, console, and network.
5. **Replay a captured trace.** Save a real request, payload, or event log and
   replay it through the code path in isolation.
6. **Throwaway harness.** Spin up a minimal subset of the system that exercises
   the bug path with a single call.
7. **Property or fuzz loop.** If the bug is "sometimes wrong output", run many
   random inputs and look for the failure mode.
8. **Bisection harness.** Automate "boot at state X, check, repeat" so you can
   run `git bisect run`.
9. **Differential loop.** Run the same input through old and new versions, or
   two configurations, and diff the outputs.
10. **Human-in-the-loop script.** Last resort. Use
    `scripts/hitl-loop.template.sh` so the loop is still structured.

Build the right feedback loop and the bug is 90% fixed.

### Tighten the loop

Treat the loop as a product. Once you have *a* loop, tighten it:

- Can you make it faster? Cache setup, skip unrelated init, narrow the test.
- Can you make the signal sharper? Assert on the specific symptom.
- Can you make it more deterministic? Pin time, seed RNG, isolate storage,
  freeze the network.

A 30-second flaky loop is barely better than no loop. A 2-second deterministic
one is a debugging superpower.

### Non-deterministic bugs

The goal is a higher reproduction rate, not necessarily a clean repro. Loop the
trigger many times, parallelize, add stress, narrow timing windows, and inject
delays. A 50% flake is debuggable; 1% is not. Keep raising the rate.

### When you genuinely cannot build a loop

Stop and say so explicitly. List what you tried. Ask for access to an
environment that reproduces the bug, a redacted captured artifact (HAR, log
dump, core dump, or timed screen recording), or permission to add temporary
production instrumentation. Do not proceed to hypothesize without a loop.

### Completion criterion: a tight loop that goes red

Phase 1 is done when the loop is tight and red-capable: you can name one
command you have already run, with redacted output, and it is:

- [ ] **Red-capable**: asserts the user's exact symptom.
- [ ] **Deterministic**: same verdict every run, or a pinned high reproduction
      rate.
- [ ] **Fast**: seconds, not minutes.
- [ ] **Agent-runnable**: can run unattended.

If you catch yourself building a theory before this command exists, stop.
Jumping to a hypothesis is the exact failure this skill prevents.

## Phase 2: Reproduce and minimize

Run the loop. Watch it go red. Confirm the failure is the one the user
described, reproducible across runs, and that you captured the exact symptom.

Then shrink the repro to the smallest scenario that still goes red. Cut
inputs, callers, config, data, and steps one at a time, re-running after each.
Done when every remaining element is load-bearing: removing any one makes the
loop go green.

## Phase 3: Hypothesize

Generate 3–5 ranked, falsifiable hypotheses before testing any of them. A
single hypothesis anchors on the first plausible idea.

Format: "If X is the cause, then changing Y will make the bug disappear or
changing Z will make it worse." If you cannot state the prediction, the
hypothesis is a vibe: discard it or sharpen it.

Show the ranked list to the user before testing. They often have domain
knowledge that re-ranks it instantly. Do not block if they are unavailable.

## Phase 4: Instrument

Each probe must map to a specific prediction. Change one variable at a time.

Prefer a debugger or REPL inspection to logs. Otherwise add targeted logs at
the boundaries that distinguish hypotheses. Never "log everything and grep."
Tag every debug log with a unique prefix such as `[DEBUG-a4f2]`; cleanup becomes
one grep.

For performance regressions, logs are usually wrong. Establish a baseline
measurement with a timing harness, profiler, or query plan, then bisect.

## Phase 5: Fix and add a regression test

Write the regression test before the fix, but only if there is a correct seam
where the test exercises the real bug pattern as it occurs at the call site.

If no correct seam exists, that is itself the finding: the architecture is
preventing the bug from being locked down.

If a seam exists: turn the minimized repro into a failing test, watch it fail,
apply the fix, watch it pass, then re-run the original Phase 1 loop.

## Phase 6: Cleanup

Before declaring done:

- [ ] The original repro no longer reproduces.
- [ ] The regression test passes, or the absence of a seam is documented.
- [ ] All `[DEBUG-...]` instrumentation is removed.
- [ ] Throwaway prototypes are deleted or clearly marked.
- [ ] The verified cause is stated in the commit or PR message.
