---
name: api-error-handling
description: >
  Convenciones para diseñar y revisar respuestas de error en APIs HTTP. Úsala siempre que
  el usuario cree o modifique endpoints, handlers o middlewares de error, o cuando aparezcan
  archivos como routes/, controllers/, handlers/ o middleware/. Exige un envelope de error
  consistente, códigos estables y logs sin datos sensibles. No la uses para errores de
  validación de formularios en el cliente ni para excepciones internas de un script.
category: domain
version: 1.0.0
tags: [http, api, errors]
---

# Manejo de errores en APIs HTTP

Aplica un contrato de error único en toda la API. Los clientes deben poder reaccionar
a un código estable sin parsear mensajes humanos.

## Contrato

Toda respuesta de error usa este envelope:

```json
{
  "error": {
    "code": "RESOURCE_NOT_FOUND",
    "message": "The requested invoice does not exist.",
    "details": [{ "field": "id", "issue": "not_found" }],
    "requestId": "req_01H..."
  }
}
```

- `code`: estable, en mayúsculas y sin detalles dinámicos.
- `message`: apto para el usuario final, sin rutas internas ni SQL.
- `details`: opcional, útil para errores de validación.
- `requestId`: correlación con los logs del servidor.

## Reglas

1. **Nunca filtres excepciones internas.** Traduce a un código público y registra el
   stack trace solo en el servidor.
2. **Mapea los estados HTTP correctamente:**
   - `400` validación de entrada
   - `401` falta autenticación
   - `403` autenticado sin permiso
   - `404` recurso inexistente
   - `409` conflicto de estado
   - `422` regla de negocio incumplida
   - `429` límite de tasa
   - `500` error no esperado (nunca detalles internos)
3. **Un solo middleware de errores** por aplicación, registrado al final de la cadena.
4. **Logs estructurados y sin secretos:** elimina tokens, cookies, contraseñas y
   variables de entorno del payload registrado.
5. **No uses el mismo código para causas distintas.** Si un cliente necesita distinguir
   dos situaciones, necesitas dos códigos.

## Referencias

- `references/error-envelope.md`: ejemplos por lenguaje, tabla de códigos y checklist
  de revisión.

Lee ese archivo cuando necesites ejemplos concretos o vayas a revisar un middleware
existente.
