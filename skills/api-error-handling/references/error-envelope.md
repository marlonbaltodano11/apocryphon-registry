# Error envelope — ejemplos y checklist

## Tabla de códigos sugerida

| Código                    | HTTP | Cuándo usarlo                                  |
| ------------------------- | ---- | ---------------------------------------------- |
| `VALIDATION_FAILED`       | 400  | El payload no cumple el esquema de entrada.    |
| `AUTHENTICATION_REQUIRED` | 401  | Falta o expiró la credencial.                  |
| `PERMISSION_DENIED`       | 403  | La credencial no alcanza para la operación.    |
| `RESOURCE_NOT_FOUND`      | 404  | El recurso solicitado no existe.               |
| `STATE_CONFLICT`          | 409  | La operación choca con el estado actual.       |
| `BUSINESS_RULE_VIOLATION` | 422  | La entrada es válida pero la regla no se cumple.|
| `RATE_LIMITED`            | 429  | Se superó el límite de peticiones.             |
| `INTERNAL_ERROR`          | 500  | Error no esperado; nunca exponer detalles.     |

## Ejemplo en TypeScript (Express)

```ts
export class ApiError extends Error {
  constructor(
    readonly status: number,
    readonly code: string,
    message: string,
    readonly details?: unknown,
  ) {
    super(message)
  }
}

export function errorHandler(
  error: unknown,
  req: Request,
  res: Response,
  _next: NextFunction,
): void {
  const requestId = res.locals.requestId ?? 'unknown'

  if (error instanceof ApiError) {
    res.status(error.status).json({
      error: {
        code: error.code,
        message: error.message,
        details: error.details,
        requestId,
      },
    })
    return
  }

  req.log.error({ err: error, requestId }, 'unhandled error')
  res.status(500).json({
    error: {
      code: 'INTERNAL_ERROR',
      message: 'An unexpected error occurred.',
      requestId,
    },
  })
}
```

## Checklist de revisión

- [ ] Todas las respuestas de error usan el mismo envelope.
- [ ] Cada `code` corresponde a una única causa.
- [ ] Los mensajes no contienen rutas de archivo, SQL ni nombres de tablas.
- [ ] El `500` no filtra el mensaje de la excepción original.
- [ ] Los logs incluyen `requestId` y excluyen credenciales.
- [ ] Los tests cubren al menos un caso por estado HTTP usado.
