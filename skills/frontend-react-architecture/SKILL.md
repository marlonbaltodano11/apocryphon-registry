---
name: frontend-react-architecture
description: >
  Arquitectura de aplicaciones React. Úsala cuando crees componentes, organices carpetas, gestiones
  estado o dividas responsabilidades. Define límites, estado local vs global y composición antes de
  escribir. No la uses para detalles visuales o auditorías de accesibilidad.
category: domain
version: 1.0.0
tags: [react, frontend, architecture]
---

# Arquitectura de aplicaciones React

## Objetivo

Mantener componentes pequeños, predecibles y con el estado en el lugar correcto.

## Protocolo

1. Dibuja el árbol de UI y separa páginas, layouts, features y componentes compartidos.
2. Decide la propiedad del estado: local, contexto de feature o store global.
3. Divide entre componentes de presentación y contenedores con datos.
4. Aísla data fetching en hooks o capas de servicio.
5. Define estados de carga, error y vacío desde el principio.
6. Organiza por feature y coloca los tests junto al código que cubren.

## Reglas

- No uses estado global para algo que solo usa un componente.
- No pongas lógica de negocio dentro del JSX.
- No crees abstracciones antes del segundo caso de uso real.
- Mantén props estables y explícitas.

## Verificación

- Tests de componente cubren estados de carga, error y éxito.
- No hay re-renders innecesarios medidos con React DevTools.
- La estructura de carpetas es consistente.
