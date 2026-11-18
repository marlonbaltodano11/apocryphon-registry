---
name: frontend-performance
description: >
  Rendimiento web y Core Web Vitals. Úsala cuando una página cargue lenta, el bundle crezca o haya
  que optimizar LCP, INP o CLS. Mide en condiciones reales antes de cambiar. No la uses para micro-
  optimizaciones sin datos.
category: domain
version: 1.0.0
tags: [performance, frontend, web-vitals]
---

# Rendimiento web

## Objetivo

Mejorar la experiencia percibida con cambios medidos, no por intuición.

## Protocolo

1. Toma una línea base con RUM o Lighthouse sobre una build de producción.
2. Identifica el cuello de botella: red, JS, imágenes, fuentes o render.
3. Optimiza primero el recurso más pesado del LCP.
4. Divide el bundle y carga bajo demanda lo que está bajo el fold.
5. Ajusta caché, compresión y formatos de imagen.
6. Vuelve a medir y fija un presupuesto de rendimiento.

## Reglas

- No memorices componentes a ciegas.
- No cargues todo el bundle para la primera pantalla.
- Reserva espacio para imágenes y fuentes para evitar CLS.
- Mide en móvil y en red limitada.

## Verificación

- Métricas antes/después documentadas.
- Tamaño del bundle bajo el presupuesto.
- Sin regresiones en LCP, INP o CLS.
