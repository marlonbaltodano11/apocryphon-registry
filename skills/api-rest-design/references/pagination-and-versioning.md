# Paginación y versionado

## Paginación por cursor

- El cursor debe ser opaco para el cliente.
- Ordena por un campo estable y único (por ejemplo `created_at, id`).
- Devuelve `next_cursor: null` en la última página.
- No uses offset para feeds que cambian mientras se paginan.

```json
{
  "items": [],
  "next_cursor": "eyJpZCI6MTIzfQ"
}
```

## Versionado

- Prefiere cambios compatibles: añadir campos, no renombrar.
- Si necesitas romper, usa un prefijo de versión (`/v2/`) o un media type.
- Deprecación: anuncia, documenta, fija fecha y monitoriza uso.
- No borres campos sin un ciclo de deprecación.
