---
trigger: model_decision
description: Define un Lenguaje de Diseño de Arquitectura (ADL) con claves (COMPONENT_ONLY, SMALL, STANDARD, COMPLEX) para generar rápidamente blueprints de funcionalidades en Angular, alineados con la metodología Akuri-OMA.
status: active
linked_files: [
    `angular.akuri-oma.feature-structure-and-naming.guideline.md`,
    `angular.akuri-oma.scaffolding.guideline.md`
]
use_case: DESIGN, PLAN
---

# Angular: Patrones Arquitectónicos y Lenguaje de Diseño (angular.architectural-patterns.guideline.md)

## 1. Introducción y Propósito

Este documento define un Lenguaje de Diseño de Arquitectura (ADL) simplificado para estandarizar y acelerar la creación de `blueprints` arquitectónicos para funcionalidades y componentes en Angular.

El objetivo es permitir que se especifique una clave (`key`) de patrón al inicio de la fase de `PLAN`, y que el agente Akuri pueda generar automáticamente la estructura de carpetas y archivos (`tree`) correspondiente, garantizando la consistencia con la metodología Akuri-OMA para frontend.

## 2. El Lenguaje de Diseño de Arquitectura (ADL)

### 2.1 Key: `COMPONENT_ONLY`

-   **Nombre:** Componente de UI Aislado.
-   **Propósito:** Para crear un único componente de presentación ("dumb component") que no tiene lógica de negocio, rutas ni estado propio complejo. Recibe datos vía `@Input()` y emite eventos con `@Output()`. Es el patrón estándar para elementos reutilizables en una carpeta `shared/components/`.
-   **Estructura (`tree`):**
    ```
    [nombre-componente]/
    ├── [nombre-componente].component.ts
    ├── [nombre-componente].component.html
    └── [nombre-componente].component.scss
    ```

### 2.2 Key: `SMALL`

-   **Nombre:** Funcionalidad Pequeña.
-   **Propósito:** Para funcionalidades que tienen algo de lógica pero no necesitan la complejidad de un `State Service` persistente ni su propio `entry`/`routes`. Por ejemplo, un widget que llama a un `Action Service` pero no gestiona un estado complejo.
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
                (y .html/.scss)
    ```

### 2.3 Key: `STANDARD`

-   **Nombre:** Funcionalidad Estándar.
-   **Propósito:** Es el **patrón principal y más común** para cualquier funcionalidad que represente una pantalla o un conjunto de pantallas con su propio estado, lógica y navegación. Es el patrón por defecto para los submódulos de una funcionalidad `complex`.
-   **Estructura (`tree`):**
    ```
    [feature]/
    ├── shared/
    │   └── models/ # Espejo del backend
    │       ├── dto/
    │       ├── entity/
    │       └── response/
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
    │       └── [feature].home.page.ts
    │           (y .html/.scss)
    ├── [feature].entry.ts
    └── [feature].routes.ts
    ```

### 2.4 Key: `COMPLEX`

-   **Nombre:** Funcionalidad Compleja / Orquestadora.
-   **Propósito:** Para funcionalidades de alto nivel que agrupan y orquestan múltiples sub-funcionalidades `standard`. Ejemplos típicos son los `layouts` (como un panel de administración) o dominios de negocio grandes.
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

### Uso en la Fase de `PLAN`

1.  Al iniciar la creación de una funcionalidad, durante la fase de **"Blueprint Arquitectónico"**, se debe especificar la `key` del patrón a utilizar para la funcionalidad principal y/o sus componentes.
2.  **Ejemplo de Prompt del Usuario:** "Vamos a crear la funcionalidad `provider` para el frontend. Será de tipo `COMPLEX` y orquestará tres sub-funcionalidades de tipo `STANDARD`: `provider-auth`, `provider-profile` y `provider-admin`."
3.  **Tu Tarea (Agente Akuri):** TÚ debes identificar las `keys`, consultar este `guideline` y generar el `tree` de archivos correspondiente, anidando los patrones según se especifica.