# Checklist de esquema

- [ ] Clave primaria estable.
- [ ] `NOT NULL` salvo que el dominio exija null.
- [ ] Checks para invariantes.
- [ ] FK con índice.
- [ ] `timestamptz` y `created_at`/`updated_at`.
- [ ] Índices según consultas reales.
- [ ] Nombres consistentes (`snake_case`).
- [ ] Migración reversible o plan explícito.
