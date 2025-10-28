---
trigger: always_on
description: Glosario central de términos y artefactos de la Metodología Akuri-OMA. Este documento es la fuente única de verdad para toda la terminología.
---

# Glosario de la Metodología Akuri-OMA

Este documento define los términos, artefactos y conceptos clave utilizados en el ecosistema de desarrollo Akuri.

## Artefactos de Documentación

-   **Manifest:**
    -   **Propósito:** Un documento declarativo que establece las **tecnologías, proyectos y restricciones** de una `PLATAFORMA` o `PROYECTO`. Responde a la pregunta: "¿Qué es y qué tecnologías usa?".
    -   **Ejemplo:** `platform.manifest.md`, `project.manifest.md`.

-   **Guideline:**
    -   **Propósito:** Un manual de instrucciones técnico. Define **cómo** se debe estructurar el código, implementar la lógica o seguir un flujo de trabajo. Son reglas de **implementación y arquitectura**.
    -   **Ejemplo:** `nestjs.akuri-oma.feature-structure-and-naming.guideline.md`.

-   **Design System Document:**
    -   **Propósito:** Un manual de identidad visual. Define **cómo** debe verse y sentirse una interfaz de usuario (colores, tipografía, componentes, etc.). Son reglas de **apariencia y comportamiento visual**.
    -   **Ejemplo:** `angular-app.look-and-feel.design.md`.

## Artefactos del Flujo de Trabajo

-   **CONCEPT (`[CONCEPT]...md`):**
    -   **Propósito:** Un documento de brainstorming inicial para explorar ideas de alto nivel sin restricciones. Se usa en `MODO CREATIVO`.

-   **INVENTORY (`[INVENTORY]...md`):**
    -   **Propósito:** La lista detallada de **requisitos funcionales** y características de una funcionalidad. Responde a la pregunta: "¿Qué debe hacer?". Se crea en `MODO CREATIVO`.

-   **PLAN (`[PLAN]...md`):**
    -   **Propósito:** El **documento vivo** y blueprint técnico para la construcción. Evoluciona a través de las fases, desde la arquitectura hasta el esqueleto de implementación y el plan de pruebas. Se crea y se gestiona en `MODO DICTATORIAL`.

## Conceptos del Proceso

-   **Triaje (Triage):**
    -   **Propósito:** La primera acción del agente para cada `prompt`. Consiste en clasificar la tarea del usuario en una categoría específica (ej., `BUILD`, `AUDIT`, `UI_SKIN`) para determinar el flujo de trabajo y los documentos a consultar.

-   **MODO CREATIVO:**
    -   **Propósito:** Un modo operativo del agente donde actúa como un analista y facilitador. Su objetivo es hacer preguntas, explorar ideas y definir requisitos. No se rige por reglas estrictas de implementación.

-   **MODO DICTATORIAL:**
    -   **Propósito:** Un modo operativo del agente donde actúa como un ejecutor disciplinado. Su objetivo es seguir los `guidelines` y las decisiones del usuario con precisión absoluta para construir y refactorizar código.

-   **Patrón Arquitectónico (Architectural Pattern):**
    -   **Propósito:** Una **plantilla de estructura de archivos y carpetas** predefinida y nombrada con una `key` (ej., `STANDARD`, `COMPLEX`). Se utiliza durante la fase de "Blueprint Arquitectónico" para generar rápidamente la estructura de una nueva funcionalidad.
    -   **Definido en:** `[tecnología].architectural-patterns.guideline.md`.