# STRIDE rápido

| Amenaza | Pregunta | Mitigación típica |
| --- | --- | --- |
| Spoofing | ¿Puede suplantar identidad? | Auth fuerte, tokens firmados |
| Tampering | ¿Puede modificar datos? | Validación, firmas, permisos |
| Repudiation | ¿Puede negar una acción? | Auditoría inmutable |
| Information disclosure | ¿Puede leer lo que no debe? | Authz, cifrado, minimización |
| Denial of service | ¿Puede agotar recursos? | Rate limit, cuotas, timeouts |
| Elevation of privilege | ¿Puede obtener más permisos? | Checks server-side, least privilege |

Checklist:
- [ ] Cada flujo tiene actor, datos y límite de confianza.
- [ ] Inputs validados en el servidor.
- [ ] Autorización verificada por recurso.
- [ ] Secretos fuera del cliente y de los logs.
