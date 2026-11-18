# Evaluación de RAG

## Retrieval

- **Recall@k**: ¿el fragmento correcto está en el top-k?
- **MRR**: posición del primer resultado relevante.
- **Cobertura**: consultas sin resultados.

## Generación

- **Groundedness**: cada afirmación se apoya en una cita.
- **Answer relevance**: responde la pregunta real.
- **Abstención**: dice "no hay evidencia" cuando corresponde.

## Prácticas

- Dataset de preguntas reales, no inventadas.
- Separar errores de retrieval de errores de generación.
- Medir latencia y coste por consulta.
