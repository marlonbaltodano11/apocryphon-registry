---
name: ai-rag-design
description: >
  Diseño de RAG. Úsala cuando construyas búsqueda semántica, asistentes sobre documentos o
  recuperación aumentada. Define chunking, embeddings, retrieval, citas y evaluación. No la uses
  para datos estructurados con SQL simple.
category: domain
version: 1.0.0
tags: [ai, rag, retrieval]
---

# Diseño de RAG

## Objetivo

Responder con contexto recuperado, citas verificables y métricas de calidad.

## Protocolo

1. Define el corpus y su frecuencia de actualización.
2. Elige chunking por estructura semántica, no por longitud fija.
3. Selecciona embeddings y prueba recuperación híbrida (texto + vector).
4. Añade reranking para el top-k final.
5. Obliga a citar fuentes y a decir cuándo no hay evidencia.
6. Evalúa retrieval y generación por separado.

## Reglas

- No inventes enlaces ni citas.
- Evalúa retrieval antes de culpar al modelo.
- Controla la frescura del índice.
- No envíes documentos completos si basta un fragmento.

## Verificación

- Métricas de retrieval (recall@k, MRR).
- Respuestas con citas verificables.
- El sistema admite 'no encontrado'.

## Referencias

- `references/rag-evaluation.md`: documentación de apoyo para esta skill.
