---
name: property-based-testing
description: >
  Write, review, and debug property-based tests. Use when tests should cover a
  whole input domain instead of a hand-picked list: encode/decode pairs,
  parsers, canonicalizers, validators, numeric types, comparators, data
  structures, or invariants. Also use when judging whether existing property
  tests assert anything real or when a generator shrunk a counterexample. Do
  not use for coverage-guided binary fuzzing, mutation-testing campaigns,
  static analysis, benchmarking, or end-to-end UI tests.
category: workflow
version: 1.0.0
tags: [testing, property-based-testing, quality]
license: CC-BY-SA-4.0
source: https://github.com/trailofbits/skills
upstream-commit: 149d7b21f406
---

# Property-Based Testing

An example test asserts one point. A property asserts a rule over the whole
input domain and lets the generator hunt for a counterexample. That trade is
worth making when the code has an algebraic shape: an inverse, an invariant,
or an oracle. Code with no such shape gets example tests; saying so is a valid
outcome.

Check first whether the shape is missing or merely buried. A calculation
wrapped in I/O, a string built by concatenation, or an in-place mutation may
have a property but no seam to assert through. See
[references/refactoring.md](references/refactoring.md) before concluding there
is nothing to assert.

## Property catalog

| Property | Formula | Where it applies |
|---|---|---|
| Roundtrip | `decode(encode(x)) == x` | Serialization and conversion pairs |
| Inverse | `f(g(x)) == x` | Encrypt/decrypt, compress/decompress |
| Oracle | `new(x) == reference(x)` | Optimization, refactoring, reimplementation |
| Idempotence | `f(f(x)) == f(x)` | Normalization, formatting, sorting |
| Invariant | Holds before and after | Any transformation, contract state |
| Easy to verify | `is_sorted(sort(x))` | Complex algorithms with cheap checkers |
| Commutativity | `f(a, b) == f(b, a)` | Binary and set operations |
| Associativity | `f(f(a,b), c) == f(a, f(b,c))` | Combining operations |
| Identity | `f(x, e) == x` | Operations with a neutral element |

Strength ordering, weakest to strongest:
`no crash → type preservation → invariant → idempotence → roundtrip/oracle`.

Assert the strongest property the code supports. "No crash" alone rarely
justifies a dependency. If that is all you can find, either rearrange the code
to expose something stronger, or report that the code is a poor property-based
testing candidate.

## The two ways a property test asserts nothing

- **Tautology.** `assert add(a, b) == a + b` restates the implementation; no
  bug they share can fail it. Pick a property that constrains the function
  without recomputing it. The exception is `f(x) == f(x)` as a genuine
  determinism property when `f` is not obviously pure.
- **Vacuity.** `assume()` that filters out nearly every input passes without
  exercising anything, and a self-contradictory `assume()` passes having run
  zero cases. Push constraints into the strategy so the generator produces
  valid inputs directly.

## Where to look next

| Task | File |
|---|---|
| Writing new tests or designing strategies | [references/generating.md](references/generating.md) |
| The code has no property to assert yet | [references/refactoring.md](references/refactoring.md) |
| Reviewing existing property tests | [references/reviewing.md](references/reviewing.md) |
| A property test just failed | [references/interpreting-failures.md](references/interpreting-failures.md) |
| Library choice and tooling | [references/libraries.md](references/libraries.md) |

## Introducing property-based testing

If the project already uses a property-based testing library, write the tests
in it. If it does not, adding one is a dependency decision that belongs to the
user. Offer it once with the specific property you would write, and accept
either answer.

## Verification

- Run the property test and confirm it can fail when the property is violated.
- Reproduce the shrunk counterexample and confirm the fix addresses the cause.
- Run the rest of the relevant suite after adding a library or changing a
  generator.
