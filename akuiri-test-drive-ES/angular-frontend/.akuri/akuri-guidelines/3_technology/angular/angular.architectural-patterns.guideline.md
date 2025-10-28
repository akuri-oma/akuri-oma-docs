---
trigger: model_decision
description: Define la Micro-Arquitectura para Angular con un Lenguaje de Diseño de Arquitectura (ADL). Establece claves (COMPONENT_ONLY, SMALL, STANDARD, COMPLEX) para generar blueprints de funcionalidades de manera consistente.
status: active
linked_files: [
    `angular.architecture-overview.guideline.md`,
    `angular.akuri-oma.scaffolding.guideline.md`
]
use_case: DESIGN, PLAN, AUDIT
---

# Angular: Patrones Arquitectónicos y Lenguaje de Diseño (architectural-patterns.guideline.md)

## 1. Introducción y Propósito

Este documento define la **Micro-Arquitectura** de un proyecto Angular. Su propósito es establecer un Lenguaje de Diseño de Arquitectura (ADL) con `keys` que representan **patrones o plantillas** para construir funcionalidades y componentes individuales de manera consistente.

Las funcionalidades construidas usando estos patrones deben ser colocadas dentro de las "zonas" apropiadas (ej., `subsystem/`) definidas en el `guideline` de Macro-Arquitectura (`angular.architecture-overview.guideline.md`).

## 2. El Lenguaje de Diseño de Arquitectura (ADL)

### 2.1 Key: `COMPONENT_ONLY`

-   **Nombre:** Componente de UI Aislado.
-   **Propósito:** Para crear un único componente de presentación ("dumb component") que no tiene lógica de negocio, rutas ni estado propio complejo. Es el patrón estándar para elementos reutilizables en una carpeta `shared/components/`.
-   **Estructura (`tree`):**
    ```
    [nombre-componente]/
    ├── [nombre-componente].component.ts
    ├── [nombre-componente].component.html
    └── [nombre-componente].component.scss
    ```

### 2.2 Key: `SMALL`

-   **Nombre:** Funcionalidad Pequeña.
-   **Propósito:** Para funcionalidades con lógica pero sin estado persistente ni enrutamiento complejo. Por ejemplo, un widget que llama a un `Action Service` pero no gestiona un `State Service` completo. Su uso es poco común.
-   **Estructura (`tree`):**
    ```
    [feature]/
    ├── services/
    │   ├── api/
    │   │   └── [feature].api.service.ts
    │   └── action/
    │       └── [feature].action.service.ts
    └── presentation/
        └── pages/
            └── [feature].page.ts
    ```

### 2.3 Key: `STANDARD`

-   **Nombre:** Funcionalidad Estándar.
-   **Propósito:** Es el **patrón principal y más común** para cualquier funcionalidad que represente una pantalla o un conjunto de ellas con su propio estado, lógica y navegación. Es el patrón por defecto para los submódulos de una funcionalidad `complex`.
-   **Estructura (`tree`):**
    ```
    [feature]/
    ├── models/ # Espejo del backend
    │   ├── dto/
    │   ├── entity/
    │   └── response/
    ├── services/
    │   ├── api/
    │   │   └── [feature].api.service.ts
    │   ├── action/
    │   │   └── [feature].action.service.ts
    │   └── state/
    │       └── [feature].state.service.ts
    ├── presentation/
    │   ├── components/
    │   └── pages/
    │       └── ...
    ├── [feature].entry.ts
    └── [feature].routes.ts
    ```

### 2.4 Key: `COMPLEX`

-   **Nombre:** Funcionalidad Compleja / Orquestadora.
-   **Propósito:** Para funcionalidades de alto nivel que agrupan y orquestan múltiples sub-funcionalidades `standard`.
-   **Estructura (`tree`):**
    ```
    [feature]/
    ├── shared/ # Elementos compartidos ENTRE las sub-funcionalidades
    │   └── models/
    ├── [sub-feature-1]/ # Una funcionalidad 'standard' completa
    ├── [sub-feature-2]/ # Otra funcionalidad 'standard' completa
    ├── ...
    ├── [feature].entry.ts
    └── [feature].routes.ts # Usa 'loadChildren' para cargar las rutas de las sub-features
    ```

## 3. Flujo de Trabajo

-   Al iniciar la **Fase 3: Blueprint Arquitectónico** de una nueva funcionalidad, TÚ debes identificar y declarar la `key` del patrón que se utilizará.
-   Basado en la `key` seleccionada, TÚ generarás el `tree` de archivos correspondiente como parte del documento de `PLAN`.