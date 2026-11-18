# Pirámide práctica

| Nivel | Cantidad | Qué cubre | Coste |
| --- | --- | --- | --- |
| Unitario | Muchos | Lógica pura, bordes, cálculos | Bajo |
| Integración | Medio | API + DB, contratos, jobs | Medio |
| E2E | Pocos | Flujos críticos de usuario | Alto |

Reglas:
- Un bug de lógica se cubre con unitarios.
- Un bug de contrato se cubre con integración.
- Un bug de flujo de usuario se cubre con E2E.
- Si un E2E se puede convertir en integración, conviértelo.
