---
description: Manifiesto para el proyecto de frontend webpage-angular.
technology: Angular
ui_library: PrimeNG
styling: Tailwind CSS
dependency_file: package.json # Clave que apunta al archivo de dependencias.
---

## Manifiesto del Proyecto: `webpage-angular`

### Pila Tecnológica y Restricciones de Implementación

Esta sección define las tecnologías y patrones de uso obligatorio. El agente debe consultar este documento y los documentos del `akuri-design-system` antes de cualquier tarea de `BUILD`, `UI_BUILD` o `UI_REFACTOR`.

-   **Archivo de Dependencias:** La fuente única de verdad para las dependencias y versiones autorizadas es el archivo **`package.json`** en la raíz del proyecto.

-   **Librería de Componentes UI:**
    -   **Librería Obligatoria:** `primeng`.
    -   **Restricción:** **NO USAR** Angular Material, NgBootstrap u otra librería de componentes principal.
    -   **Guía de Referencia:** `akuri-design-system/angular-app.primeng-conventions.design.md`.

-   **Framework de Estilizado:**
    -   **Librería Obligatoria:** `tailwindcss`.
    -   **Filosofía:** "Tailwind-First". El estilizado debe priorizar las clases de utilidad sobre CSS personalizado.
    -   **Guía de Referencia:** `akuri-design-system/angular-app.look-and-feel.design.md`.

-   **Gestión de Iconos:**
    -   **Framework Obligatorio:** `Iconify` con `Heroicons` como set primario.
    -   **Restricción:** No instalar otras librerías de iconos directamente.
    -   **Guía de Referencia:** `akuri-design-system/angular-app.iconography.design.md`.

-   **Notificaciones (Toasts):**
    -   **Componente Obligatorio:** `MessageService` de PrimeNG.
    -   **Restricción:** **NO USAR** `ngx-toastr` u otras librerías de notificaciones.
    -   **Guía de Referencia:** `akuri-design-system/angular-app.primeng-conventions.design.md`.