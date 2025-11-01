---
trigger: model_decision
description: Conventions and patterns for the integration and use of the PrimeNG component library in Angular Akuri projects. Covers the use of modules, layout and state tokens, theme handling, and UX patterns.
status: active
linked_files: [`angular-app.look-and-feel.design.md`]
use_case: BUILD, REFACTOR, AUDIT
---

# Conventions for PrimeNG (`angular-app.primeng-conventions.design.md`)

## 1. Use of Shared Modules

-   The file `src/app/shared/forms/modules/forms.primeng.module.ts` exports high-frequency modules (`ButtonModule`, `InputTextModule`, etc.).
-   YOU must import modules directly into standalone components when usage is limited. Use the shared module only when multiple controls repeat in the same component tree.

## 2. Layout Tokens

-   Apply `FORM_LAYOUT_BREAKPOINTS` from `src/app/shared/forms/tokens/forms.layout.tokens.ts` to enforce 1/2/4 column variants.
-   Use `FORM_SECTION_CARD` for card wrappers to maintain consistent padding, rounded borders, and surface colors.

## 3. Field State Tokens

-   Backgrounds and borders are defined in `src/app/shared/forms/tokens/forms.state.tokens.ts`.
-   Combine tokens with Tailwind utilities for requirement colors:
    -   **Required:** `FORM_STATE_REQUIRED`
    -   **Optional:** `FORM_STATE_OPTIONAL`
    -   **Valid:** `FORM_STATE_VALID`
    -   **Error:** `FORM_STATE_ERROR`
-   Add `FORM_STATE_HOVER` to each interactive field for elevation feedback.

## 4. Timezone Handling

-   The `SettingsTimezoneService` centralizes the management of `localStorage.timezone`.
-   Call `timezone$` to display the current zone alongside date/time controls.

## 5. Theme Synchronization

-   The `SettingsThemeService` manages the `theme`, `isDark`, and `primaryColor` keys.
-   Use `toggleDarkMode()` to switch modes; synchronize Tailwind's `dark` class and PrimeNG's `app-dark` selector.

## 6. Validation and UX Patterns

-   Bind the states of Angular's reactive forms to field state tokens to reflect required, optional, valid, and error colors.
-   Place labels above inputs and error messages below.

## 7. Component Import Reference

-   Verify each component page at `https://primeng.org/{component}` for updated module names (e.g., `TextareaModule`).
-   Avoid legacy module names (`InputTextareaModule`, etc.).