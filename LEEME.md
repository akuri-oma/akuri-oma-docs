# Metodología Akuri-OMA

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Documentation Status](https://img.shields.io/badge/docs-actualizada-brightgreen.svg)](/docs/es/)
[![PRs Welcome](https://img.shields.io/badge/PRs-bienvenidos-brightgreen.svg)](CONTRIBUTING.md)

**Una metodología de Desarrollo Guiado por Especificaciones (SDD) para construir software de alta calidad, escalable y predecible con agentes de IA.**

---

## El Problema: Los Agentes de IA son Brillantes, pero Caóticos

Los Modelos de Lenguaje Grandes (LLMs) son generadores de código increíblemente poderosos. Sin embargo, cuando se usan sin un marco de trabajo estructurado, a menudo se comportan como un becario brillante pero indisciplinado:
-   **Alucinan:** Inventan librerías, métodos y patrones arquitectónicos que no encajan en el proyecto.
-   **Son Inconsistentes:** Aplican diferentes estilos de código y estructuras de una tarea a la siguiente.
-   **Carecen de Contexto:** Olvidan correcciones anteriores y repiten los mismos errores.
-   **Son Difíciles de Gobernar:** Los comandos directos y sin guía conducen a resultados impredecibles, requiriendo ciclos extensos y frustrantes de revisión y corrección.

## La Solución: Akuri-OMA - Una Capa de Gobernanza para la IA

**Akuri-OMA (Arquitectura Modular Orquestada)** no es otro framework o librería. Es una **capa de gobernanza** y un **sistema de diálogo estructurado** que transforma al agente de IA de un socio caótico a un ejecutor disciplinado y predecible.

En lugar de decirle a la IA *qué construir*, colaboras con ella para crear una **Especificación** formal. La IA luego usa esta especificación como su "partitura" para ejecutar la implementación con precisión.

### ¿Por qué Akuri-OMA?

-   **Predictibilidad y Control:** Al forzar un proceso paso a paso de especificación y aprobación, eliminas las sorpresas. Sabes exactamente qué se va a construir antes de escribir una línea de código.
-   **Código de Alta Calidad y Consistente:** La metodología es reforzada por un sistema de `guidelines` jerárquicos. La IA está obligada a seguir los patrones arquitectónicos, las convenciones de nomenclatura y las restricciones tecnológicas de tu proyecto.
-   **Agnóstica a la Tecnología:** Los flujos de trabajo principales son universales. Proporcionamos `guidelines` listos para usar para **NestJS, Angular y Flutter**, pero los principios se pueden adaptar a cualquier pila tecnológica.
-   **Auto-Documentado por Diseño:** Los artefactos creados durante el proceso de desarrollo (`[INVENTORY]`, `[PLAN]`, `[HANDOVER]`) se archivan dentro de cada funcionalidad, creando una trazabilidad perfecta y permanente desde el requisito hasta el código.

## El Flujo de Trabajo Central

La metodología sigue un modelo de "Andamiaje Progresivo" (Progressive Scaffolding), guiado por dos modos operativos.

`Supervisor (Tú)` ↔ `Ejecutor (Agente de IA)`
