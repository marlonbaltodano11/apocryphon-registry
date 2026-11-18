# Zero-downtime migrations

1. **Expand**: add nullable column, new table or new index concurrently.
2. **Dual write**: write to old and new shape if needed.
3. **Backfill**: batch by primary key, with sleep and metrics.
4. **Switch reads**: deploy code that reads the new shape.
5. **Contract**: drop the old column/table in a later release.

Evita:
- `ALTER TABLE` que reescriba una tabla grande.
- Añadir una columna `NOT NULL` sin default en una tabla con datos.
- Índices bloqueantes en producción.
- Borrar una columna que la versión anterior todavía lee.
