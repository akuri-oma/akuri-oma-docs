    
---
trigger: model_decision
description: Guía detallada sobre la estructura y convenciones de la capa de presentación en Angular Akuri-OMA. Detalla la organización de páginas y componentes, la estricta separación de responsabilidades (UI vs. Lógica), las convenciones de nomenclatura, el flujo de trabajo de construcción y la sintaxis de plantillas obligatoria.
status: active
linked_files: [
    `angular-app.services.guideline.md`,
    `angular-app.scaffolding.guideline.md`,
    `angular.akuri-oma.feature-structure-and-naming.guideline.md`
]
use_case: UI_BUILD, UI_REFACTOR, UI_AUDIT
---

# Angular Akuri-OMA: Convenciones de la Capa de Presentación (angular-app.presentation-layer-conventions.design.md)

## 1. Introducción y Propósito

Este guideline define las reglas y patrones para la construcción de la capa de presentación (`presentation/`), que es la cara visible de cada funcionalidad. El objetivo es crear interfaces de usuario que sean mantenibles, escalables y que sigan una estricta separación de responsabilidades.

TÚ, como Agente Akuri, debes seguir esta guía para asegurar que los componentes se centren exclusivamente en la experiencia de usuario (UX) y el look & feel, delegando toda la lógica de negocio a la capa de servicios.

## 2. La Regla de Oro de la Capa de Presentación

**"Los componentes muestran datos y capturan la intención del usuario; los servicios ejecutan la lógica y gestionan el estado."**

-   **Responsabilidad de los Componentes:**
    -   **Mostrar Datos:** Se suscriben a los `Observables` o leen `signals` del `State Service` para mostrar datos de forma reactiva.
    -   **Capturar Intención:** Invocan métodos de los `Action Services` en respuesta a eventos del usuario (clics, envíos de formularios, etc.).
    -   **Gestionar la UI:** Controlan la apariencia, animaciones, efectos visuales y la experiencia de usuario en general.
-   **Lo que los Componentes NO Deben Hacer:**
    -   **NUNCA** deben inyectar y usar `HttpClient`.
    -   **NUNCA** deben contener lógica de negocio compleja.
    -   **NUNCA** deben manipular directamente el estado global fuera de su propio estado de UI local.

## 3. Estructura de la Carpeta `presentation/`

La carpeta de presentación se divide en dos responsabilidades principales:

  

-- [nombre-funcionalidad]/
---- presentation/
------ components/ # Elementos de UI reutilizables DENTRO de esta funcionalidad.
------ pages/ # Vistas completas asociadas a una ruta.
code Code

    
## 4. Estructura y Nomenclatura Detallada dentro de `pages/`

1.  **Carpetas de Agrupación:** Dentro de `pages/`, TÚ puedes crear carpetas para agrupar páginas relacionadas (ej., `crud-admin`, `reports`).
2.  **Carpetas de Página:** Cada página individual reside en su propia carpeta (ej., `editor`, `list`).
3.  **Convención de Nomenclatura de Archivos de Página (Regla Estricta):**
    -   **Patrón:** `[nombre-funcionalidad].[agrupador-opcional]-[nombre-pagina].page.ts` (y `.html`, `.scss`).
    -   **Ejemplo:** `property.admin-editor.page.ts`.
4.  **Fragmentación de Páginas Complejas (La Carpeta `ui/`):**
    -   **Propósito:** Cuando una página se vuelve demasiado compleja, TÚ debes fragmentarla en componentes de UI más pequeños y manejables creando una carpeta `ui/` dentro de la carpeta de la página.

## 5. Organización de Archivos (Inline vs. Separado)

-   **Páginas (`.page.ts`):** **DEBEN** tener archivos separados para la lógica (`.ts`), la plantilla (`.html`) y los estilos (`.scss`).
-   **Componentes y Fragmentos de UI:** **PUEDEN** usar plantillas y estilos en línea (`template`, `styles`) si son muy simples.

## 6. Flujo de Trabajo para la Construcción de una Página

La construcción de una interfaz es un proceso iterativo que TÚ debes abordar en fases:

1.  **Fase 1: Andamiaje Funcional (`UI_BUILD`):** Crear la estructura de archivos y conectar la vista a los `State` y `Action services`. El objetivo es tener una página funcional pero sin estilo.
2.  **Fase 2: Aplicación del Look & Feel (`UI_SKIN`):** Escribir el CSS (`.scss`), integrar librerías, añadir animaciones y aplicar los `guidelines` del `akuri-design-system`.
3.  **Fase 3: Refinamiento y Depuración Final:** Probar la funcionalidad de nuevo, afinar interacciones y depurar cualquier problema visual o de comportamiento.

## 7. Sintaxis de Plantillas (Template Syntax)

Para garantizar un código moderno, legible y con mejor rendimiento, todos los componentes **DEBEN** utilizar la nueva sintaxis de **Control Flow Blocks** introducida en Angular.

### 7.1 Flujo de Control Condicional

-   **Regla:** Utilizar `@if`, `@else if` y `@else`.
-   **Restricción:** **NO USAR** la directiva estructural `*ngIf`.

    **Ejemplo:**
    ```html
    <!-- ✅ Correcto (Uso de @if) -->
    @if (user.isLoggedIn) {
      <p>Welcome, {{ user.name }}!</p>
    } @else {
      <p>Please log in.</p>
    }

    <!-- ❌ Incorrecto (Uso de *ngIf) -->
    <p *ngIf="user.isLoggedIn; else loggedOut">Welcome, {{ user.name }}!</p>
    <ng-template #loggedOut><p>Please log in.</p></ng-template>
    ```

### 7.2 Flujo de Control de Bucles

-   **Regla:** Utilizar `@for`.
-   **Restricción:** **NO USAR** la directiva estructural `*ngFor`.
-   **Requisito:** **DEBES** incluir la cláusula `track` para optimizar el rendimiento. La mejor opción es usar el `id` del ítem o una referencia única.

    **Ejemplo:**
    ```html
    <!-- ✅ Correcto (Uso de @for con track) -->
    <ul>
      @for (item of items; track item.id) {
        <li>{{ item.name }}</li>
      } @empty {
        <li>No items found.</li>
      }
    </ul>

    <!-- ❌ Incorrecto (Uso de *ngFor) -->
    <ul>
      <li *ngFor="let item of items; trackBy: trackByIdFn">{{ item.name }}</li>
    </ul>
    ```

### 7.3 Flujo de Control de Selección

-   **Regla:** Utilizar `@switch`, `@case` y `@default`.
-   **Restricción:** **NO USAR** la directiva estructural `[ngSwitch]`.

    **Ejemplo:**
    ```html
    <!-- ✅ Correcto (Uso de @switch) -->
    @switch (accessLevel) {
      @case ('admin') { <admin-dashboard /> }
      @case ('moderator') { <moderator-tools /> }
      @default { <user-profile /> }
    }
    ```

Esta convención se aplica a todos los archivos `.html` y plantillas en línea (`template`) en toda la aplicación.

  
