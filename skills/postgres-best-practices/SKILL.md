---
name: postgres-best-practices
description: >
  Postgres schema, query, locking, connection, and security practices for
  PostgreSQL running anywhere. Use when creating or changing tables, indexes,
  constraints, migrations, RLS policies, SQL functions, or queries, or when
  diagnosing slow queries, timeouts, lock contention, bloat, or connection
  exhaustion. Do not use for other database engines without checking their
  differences.
category: domain
version: 1.0.0
tags: [postgres, database, performance, security]
license: MIT
source: https://github.com/supabase/agent-skills
upstream-commit: c9be0e931b79
---

# Postgres Best Practices

Comprehensive Postgres guidance maintained by Supabase, for Postgres running
anywhere. Contains rules across 8 categories, prioritized by impact.

## When to apply

Use these guidelines when:

- Writing SQL queries or designing schemas.
- Implementing indexes or optimizing queries.
- Reviewing database performance issues.
- Configuring connection pooling or scaling.
- Working with Postgres-specific features.
- Implementing or reviewing row-level security (RLS).
- Changing migration or declarative schema files.

## Rule categories by priority

| Priority | Category | Impact | Prefix |
|---|---|---|---|
| 1 | Query performance | CRITICAL | `query-` |
| 2 | Connection management | CRITICAL | `conn-` |
| 3 | Security and RLS | CRITICAL | `security-` |
| 4 | Schema design | HIGH | `schema-` |
| 5 | Concurrency and locking | MEDIUM-HIGH | `lock-` |
| 6 | Data access patterns | MEDIUM | `data-` |
| 7 | Monitoring and diagnostics | LOW-MEDIUM | `monitor-` |
| 8 | Advanced features | LOW | `advanced-` |

## How to use

Read the index in [references/_sections.md](references/_sections.md), then read
the rule file for the task at hand. Each rule contains why it matters, an
incorrect SQL example, a corrected example, and optional EXPLAIN output,
metrics, and references.

For a one-column change or a single query, still check the relevant schema,
query, lock, and security rules. This is not only a performance guide.

## Verification

- Use `EXPLAIN (ANALYZE, BUFFERS)` or the project's existing plan capture before
  and after a query change.
- Verify constraints, indexes, and RLS policies against the actual migration or
  schema source, not from memory.
- Do not apply a migration or index change to a database without explicit user
  approval.
