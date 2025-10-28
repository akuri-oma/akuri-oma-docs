
```markdown
---
trigger: model_decision
description: Convenciones y patrones para la integración y uso de la librería de componentes PrimeNG en proyectos Angular Akuri. Cubre el uso de módulos, tokens de layout y estado, manejo de temas y patrones de UX.
status: active
linked_files: [`angular-app.look-and-feel.design.md`]
use_case: BUILD, REFACTOR, AUDIT
---

# Convenciones para PrimeNG (`angular-app.primeng-conventions.design.md`)

## 1. Uso de Módulos Compartidos

-   El archivo `src/app/shared/forms/modules/forms.primeng.module.ts` exporta módulos de alta frecuencia (`ButtonModule`, `InputTextModule`, etc.).
-   TÚ debes importar módulos directamente en los componentes standalone cuando el uso sea limitado. Usa el módulo compartido solo cuando múltiples controles se repitan en el mismo árbol de componentes.

## 2. Tokens de Layout

-   Aplica `FORM_LAYOUT_BREAKPOINTS` desde `src/app/shared/forms/tokens/forms.layout.tokens.ts` para forzar variantes de 1/2/4 columnas.
-   Usa `FORM_SECTION_CARD` para las envolturas de las tarjetas para mantener un padding, bordes redondeados y colores de superficie consistentes.

## 3. Tokens de Estado de Campo

-   Los fondos y bordes se definen en `src/app/shared/forms/tokens/forms.state.tokens.ts`.
-   Combina los tokens con las utilidades de Tailwind para los colores de los requisitos:
    -   **Requerido:** `FORM_STATE_REQUIRED`
    -   **Opcional:** `FORM_STATE_OPTIONAL`
    -   **Válido:** `FORM_STATE_VALID`
    -   **Error:** `FORM_STATE_ERROR`
-   Añade `FORM_STATE_HOVER` a cada campo interactivo para el feedback de elevación.

## 4. Manejo de Zona Horaria (Timezone)

-   El servicio `SettingsTimezoneService` centraliza la gestión de `localStorage.timezone`.
-   Llama a `timezone$` para mostrar la zona actual junto a los controles de fecha/hora.

## 5. Sincronización de Tema (Theme)

-   El servicio `SettingsThemeService` gestiona las claves `theme`, `isDark` y `primaryColor`.
-   Usa `toggleDarkMode()` para cambiar de modo; sincroniza la clase `dark` de Tailwind y el selector `app-dark` de PrimeNG.

## 6. Patrones de Validación y UX

-   Vincula los estados de los formularios reactivos de Angular a los tokens de estado del campo para reflejar los colores de requerido, opcional, válido y error.
-   Coloca las etiquetas encima de los inputs y los mensajes de error debajo.

## 7. Referencia de Importación de Componentes

-   Verifica cada página de componente en `https://primeng.org/{component}` para los nombres de módulos actualizados (ej., `TextareaModule`).
-   Evita nombres de módulos legados (`InputTextareaModule`, etc.).