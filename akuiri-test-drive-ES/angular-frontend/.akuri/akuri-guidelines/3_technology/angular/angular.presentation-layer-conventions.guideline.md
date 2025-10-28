---
trigger: model_decision
description: Guía detallada sobre la estructura y convenciones de la capa de presentación en Angular Akuri-OMA. Detalla la organización de páginas y componentes, la estricta separación de responsabilidades, y la sintaxis de plantillas obligatoria.
status: active
linked_files: [`angular.services.guideline.md`]
use_case: UI_BUILD, UI_REFACTOR, UI_AUDIT
---

# Angular: Convenciones de la Capa de Presentación (presentation-layer-conventions.guideline.md)

## 1. Introducción y Propósito

Este guideline define las reglas para la construcción de la capa de presentación (`presentation/`). El objetivo es crear interfaces de usuario que sean mantenibles, escalables y que sigan una estricta separación de responsabilidades.

TÚ, como Agente Akuri, debes seguir esta guía para asegurar que los componentes se centren exclusivamente en la experiencia de usuario (UX), delegando toda la lógica de negocio a la capa de servicios.

## 2. La Regla de Oro de la Capa de Presentación

**"Los componentes muestran datos y capturan la intención del usuario; los servicios ejecutan la lógica y gestionan el estado."**

-   **Responsabilidad de los Componentes:**
    -   **Mostrar Datos:** Leen `signals` o se suscriben a `Observables` del `State Service` para mostrar datos.
    -   **Capturar Intención:** Invocan métodos de los `Action Services` en respuesta a eventos del usuario.
    -   **Gestionar la UI:** Controlan la apariencia, animaciones y la experiencia de usuario.
-   **Lo que los Componentes NO Deben Hacer:**
    -   **NUNCA** deben inyectar `HttpClient`.
    -   **NUNCA** deben contener lógica de negocio.
    -   **NUNCA** deben manipular directamente el estado global.

## 3. Flujo de Trabajo para la Construcción de una Página

TÚ debes abordar la construcción de una interfaz en fases:

1.  **Fase 1: Andamiaje Funcional (`UI_BUILD`):** Crear la estructura de archivos y conectar la vista a los `State` y `Action services`. El objetivo es una página funcional pero sin estilo.
2.  **Fase 2: Aplicación del `Look & Feel` (`UI_SKIN`):** Escribir el CSS, integrar librerías de componentes y aplicar los `guidelines` del `akuri-design-system`.
3.  **Fase 3: Refinamiento y Depuración:** Probar la funcionalidad de nuevo y depurar cualquier problema visual o de comportamiento.

## 4. Sintaxis de Plantillas (Template Syntax)

Para garantizar un código moderno, todos los componentes **DEBEN** utilizar la sintaxis de **Control Flow Blocks**.

### 4.1 Flujo de Control Condicional

-   **Regla:** Utilizar `@if`, `@else if` y `@else`.
-   **Restricción:** **NO USAR** la directiva `*ngIf`.
-   **Ejemplo:**
    ```html
    @if (user.isLoggedIn) {
      <p>Welcome, {{ user.name }}!</p>
    } @else {
      <p>Please log in.</p>
    }
    ```

### 4.2 Flujo de Control de Bucles

-   **Regla:** Utilizar `@for`.
-   **Restricción:** **NO USAR** la directiva `*ngFor`.
-   **Requisito:** **DEBES** incluir la cláusula `track` (ej., `track item.id`).
-   **Ejemplo:**
    ```html
    <ul>
      @for (item of items; track item.id) {
        <li>{{ item.name }}</li>
      } @empty {
        <li>No items found.</li>
      }
    </ul>
    ```

### 4.3 Flujo de Control de Selección

-   **Regla:** Utilizar `@switch`, `@case` y `@default`.
-   **Restricción:** **NO USAR** la directiva `[ngSwitch]`.
-   **Ejemplo:**
    ```html
    @switch (accessLevel) {
      @case ('admin') { <admin-dashboard /> }
      @default { <user-profile /> }
    }
    ```