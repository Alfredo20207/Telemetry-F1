# 🏁 Análisis de Estrategia F1: La Anatomía del Overcut vs. Undercut

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)

Este proyecto combina la extracción de datos mediante **SQL** y el diseño de dashboards interactivos en **Power BI** para analizar el impacto crítico de las paradas en boxes (Pit Stops) en la Fórmula 1. El objetivo principal es evaluar la consistencia de las escuderías y entender cómo la elección del circuito influye en el éxito de las estrategias de carrera (*Overcut* y *Undercut*).

---

## 🎯 Problema de Negocio e Impacto
En la Fórmula 1, las carreras no solo se ganan en la pista; se definen por décimas de segundo en la estrategia de *pits*. Este análisis responde a tres preguntas clave para la optimización del rendimiento en carrera:
1. ¿Qué escuderías muestran los procesos de parada más rápidos y consistentes?
2. ¿Cómo ha evolucionado la eficiencia en boxes entre las últimas temporadas?
3. ¿Cuál es el impacto directo de la arquitectura de cada circuito en los tiempos de respuesta?

---

## 🛠️ Stack Tecnológico Utilizado
* **Base de Datos:** MySQL / SQL para la ingesta, limpieza y relación de las tablas base (`races`, `pit_stops`, `constructors`).
* **Visualización de Datos:** Power BI para el modelado de datos, segmentación interactiva y diseño UX en modo oscuro (UI estilo telemetría).
* **Métricas Clave:** Creación de cálculos para medir promedios dinámicos y registros récord por pista.

---

## 📊 Principales Insights Descubiertos
* **Evolución de la Eficiencia:** Se identificó una optimización notable en los tiempos promedio generales entre la temporada 2024 y 2025, disminuyendo de ~22.8s a ~22.0s a nivel global.
* **Consistencia por Escudería:** Al segmentar por circuitos específicos (como Spa-Francorchamps), escuderías como Red Bull Racing y RB F1 Team muestran ventajas competitivas claras en la velocidad de ejecución.
* **Métricas Máximas:** El tablero permite aislar dinámicamente el **Récord de Pit Stop** más veloz registrado en cada Gran Premio.

---

## 🚀 Cómo Explorar el Dashboard
1. Utiliza el **filtro desplegable de circuitos** en la parte superior para enfocar el análisis en una pista específica.
2. Observa la gráfica de barras para comparar el rendimiento de tiempo promedio por escudería.
3. Analiza la gráfica de líneas inferior para evaluar la tendencia histórica de velocidad de los equipos año con año.
