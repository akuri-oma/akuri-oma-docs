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

**Convención de Nomenclatura para Documentos:** `DOCUMENT_TYPE.feature.description.md` (ej., `REQUIREMENT.product.management.md`). Esto asegura consistencia y facilita búsqueda.

-   **CONCEPT (`[CONCEPT]...md`):**
    -   **Propósito:** Un documento de brainstorming inicial para explorar ideas de alto nivel sin restricciones. Se usa en `MODO CREATIVO`.

-   **REQUIREMENT (`[REQUIREMENT]...md`):**
    -   **Propósito:** Define requisitos específicos y detallados para una funcionalidad nueva o modificación existente (ej., BUILD, REFACTOR, UI_BUILD). Responde a "¿Qué se necesita exactamente?" y es obligatorio antes de DESIGN/PLAN para evitar soluciones no alineadas. Incluye evaluación de viabilidad.
    -   **Elementos Obligatorios:** Propósito (para qué), Alcance (qué incluye/excluye), Limitaciones (viabilidad técnica/realística), Criterios de Aceptación (condiciones verificables para completitud y calidad), Requisitos de Seguridad (riesgos identificados, medidas básicas).
    -   **Creación:** En `MODO CREATIVO`, con preguntas al usuario para clarificar.

-   **DESIGN (`[DESIGN]...md`):**
    -   **Propósito:** Propone una solución conceptual en prosa para satisfacer el REQUIREMENT aprobado. Explica cómo se resuelve el problema de manera narrativa, sin diagramas ni detalles técnicos profundos. Es obligatorio después de REQUIREMENT y antes de PLAN para validar la viabilidad de la idea.
    -   **Elementos Obligatorios:** Descripción del entorno (infraestructura y herramientas), explicación de la solución, cómo resuelve los problemas, y cómo garantiza los criterios de aceptación.
    -   **Creación:** En `MODO CREATIVO`, basado en el REQUIREMENT.

-   **INVENTORY (`[INVENTORY]...md`):**
    -   **Propósito:** La lista detallada de **requisitos funcionales** y características de una funcionalidad. Responde a la pregunta: "¿Qué debe hacer?". Se crea en `MODO CREATIVO`.

-   **PLAN (`[PLAN]...md` o subtipos como `[PLAN-STRUCTURE]...md`):**
    -   **Propósito:** Blueprint técnico rígido para la construcción, dividido en subtipos por capas (estructura vs. funcional) y tecnología. Obligatorio después de DESIGN para guiar BUILD progresivo. Una vez aprobado, es rígido como un plano de ingeniería civil: cambios requieren nuevo REQUIREMENT/DESIGN.
    -   **Subtipos:**
      - Estructural: Define arquitectura de archivos/capas (ej., carpetas, archivos base).
      - Funcional: Detalla contenido de cada archivo (tecnologías, imports, módulos externos, métodos/objetos/funciones, convenciones de nombres). Permite reconstrucción precisa si se borra un archivo.
      - Tests: Define pruebas unitarias alineadas con REQUIREMENT y criterios de aceptación (qué probar, frameworks, métricas de cobertura).
      - Security: Define medidas de ciberseguridad (autenticación, encriptación, validaciones) alineadas con riesgos identificados en REQUIREMENT.
      - Para Frontend: Añade UI (estructura visual + detalles página por página con pruebas iterativas).
    -   **Ejemplos:** `[PLAN-STRUCTURE.nestjs]...md` (backend), `[PLAN-FUNCTIONAL.nestjs]...md` (contenido backend), `[PLAN-TESTS.nestjs]...md` (pruebas), `[PLAN-SECURITY.nestjs]...md` (seguridad), `[PLAN-STRUCTURE-UI.angular]...md` (frontend visual).
    -   **Notas para Frontend (Angular akuri-oma):** Arquitectura separa lógica (models, services) de presentación (carpeta `presentation/` con `components` comunes/shared y `pages`). UI se aborda en documento separado (ej., `[PLAN-STRUCTURE-UI]...md`) después de lógica probada. Nomenclatura: Archivos `[feature].[description].[type].ts/html/css/scss/svg`; Carpetas de página `[description]-[type]`. Páginas incluyen subcarpeta `ui` para componentes específicos.
    -   **Creación:** En `MODO DICTATORIAL`, basado en DESIGN.

-   **TRACKER (`[TRACKER]...md`):**
    -   **Propósito:** Documento de seguimiento en tiempo real para la ejecución de un PLAN o REFACTOR. Incluye checklists de tareas marcadas (completadas, pendientes, en progreso), asegurando avance progresivo, validación del usuario y prevención de improvisaciones. Se crea en `MODO DICTATORIAL` y se almacena en `akuri-specs` de la funcionalidad.

-   **PATTERN (`[PATTERN]...md`):**
    -   **Propósito:** Snippet de código probado y reutilizable para resolver problemas comunes en tecnologías específicas (ej., CRUD en NestJS). Forma parte de la cultura de trabajo de Akuri-OMA, usado solo con consentimiento explícito (documentado en PLAN o solicitado por usuario). Incluye explicación, filosofía, requisitos y código base.
    -   **Uso:** Referenciado en PLAN-FUNCTIONAL; no aplicado automáticamente.

-   **HANDOVER (`[HANDOVER]...md`):**
    -   **Propósito:** Documento de entrega técnica del backend al frontend, generado al final de BUILD backend. Detalla contratos de API completos (endpoints, DTOs, responses, autenticación, errores), descripción funcional, aspectos críticos y criterios de aceptación implícitos, permitiendo integración sin fricciones. Es el primer documento que lee el frontend.
    -   **Elementos Obligatorios:** Descripción funcional, aspectos críticos, criterios implícitos, DTOs/responses (con schemas TypeScript/JSON), endpoints (URLs, métodos, ejemplos), autenticación, errores.
    -   **Creación:** En `MODO DICTATORIAL`, después de BUILD y tests backend.

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