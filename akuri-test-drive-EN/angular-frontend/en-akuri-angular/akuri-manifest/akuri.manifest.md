---
description: Manifest for the webpage-angular frontend project.
technology: Angular
ui_library: PrimeNG
styling: Tailwind CSS
dependency_file: package.json # Key pointing to the dependencies file.
---

## Project Manifest: `webpage-angular`

### Technology Stack and Implementation Constraints

This section defines the technologies and usage patterns that are mandatory. The agent must consult this document and the `akuri-design-system` documents before any `BUILD`, `UI_BUILD` or `UI_REFACTOR` task.

-   **Dependencies File:** The single source of truth for authorized dependencies and versions is the **`package.json`** file in the project root.

-   **UI Component Library:**
    -   **Mandatory Library:** `primeng`.
    -   **Constraint:** **DO NOT USE** Angular Material, NgBootstrap or other main component libraries.
    -   **Reference Guide:** `akuri-design-system/angular-app.primeng-conventions.design.md`.

-   **Styling Framework:**
    -   **Mandatory Library:** `tailwindcss`.
    -   **Philosophy:** "Tailwind-First". Styling should prioritize utility classes over custom CSS.
    -   **Reference Guide:** `akuri-design-system/angular-app.look-and-feel.design.md`.

-   **Icon Management:**
    -   **Mandatory Framework:** `Iconify` with `Heroicons` as primary set.
    -   **Constraint:** Do not install other icon libraries directly.
    -   **Reference Guide:** `akuri-design-system/angular-app.iconography.design.md`.

-   **Notifications (Toasts):**
    -   **Mandatory Component:** `MessageService` from PrimeNG.
    -   **Constraint:** **DO NOT USE** `ngx-toastr` or other notification libraries.
    -   **Reference Guide:** `akuri-design-system/angular-app.primeng-conventions.design.md`.