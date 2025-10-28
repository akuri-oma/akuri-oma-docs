---
trigger: model_decision
description: Defines the strict rules for naming and file structure of functionalities in Angular Akuri-OMA, including the prefix convention, the organization of the 'services' and 'presentation' folders.
status: active
linked_files: [`angular.architectural-patterns.guideline.md`]
use_case: DESIGN, PLAN, AUDIT
---

# Angular: Feature Structure and Naming (feature-structure-and-naming.guideline.md)

## 1. Introduction and Purpose

This guideline establishes the **strict** rules for naming folders and files within an Angular functionality. The goal is to ensure absolute consistency that eliminates ambiguity and facilitates navigation and automation.

YOU, as an Akuri Agent, must apply these rules in the **Phase 3: Architectural Blueprint** when generating the `tree` of files, and verify them in **Step 2.3 of an `AUDIT`**.

## 2. File Naming Conventions

### 2.1 Prefix Principle

**Golden Rule:** All files within a functionality folder **MUST** be preceded by an identifying prefix, followed by a period (`.`).

### 2.2 Naming in `Standard` Functionalities

-   **Prefix:** The name of the functionality folder (e.g., `provider-profile`).
-   **Example:**
    ```
    provider-profile/
    ├── services/
    │   └── api/
    │       └── provider-profile.api.service.ts
    ├── presentation/
    │   └── pages/
    │       └── provider-profile.my-profile.page.ts
    ├── provider-profile.entry.ts
    └── provider-profile.routes.ts
    ```

### 2.3 Naming in `Complex` Functionalities

-   **Sub-Functionality Files:** Use the **sub-functionality name** as the prefix.
-   **Root Files of the `complex`:** Use the **complex functionality name** as the prefix.
-   **Files in `shared/` of the `complex`:** Use the **complex functionality name** as the prefix.

-   **Example:** For a `complex` functionality named `provider`:
    ```
    provider/
    ├── shared/
    │   └── models/
    │       └── dto/
    │           └── provider.address.dto.ts # <-- Prefix of the complex
    ├── provider-profile/
    │   └── services/
    │       └── api/
    │           └── provider-profile.api.service.ts # <-- Prefix of the sub-functionality
    └── provider.entry.ts # <-- Prefix of the complex
    ```

## 3. Structure of the `services/` Folder

The services folder MUST follow this structure to separate responsibilities:

```
services/
├── api/ # The Communicator: Makes HTTP calls to the backend.
│ └── [prefix].api.service.ts
├── action/ # The Orchestrator: Exposes methods for the UI and coordinates logic.
│ └── [prefix].action.service.ts
└── state/ # The Memory: Manages the reactive state of the functionality.
└── [prefix].state.service.ts
```

## 4. Structure of the `presentation/` Folder

### 4.1 `pages/` vs. `components/`

-   **`pages/`:** Contains complete components associated with a route.
-   **`components/`:** Contains smaller, reusable UI components *within* the functionality.

### 4.2 Page File Naming

-   **Pattern:** `[sub-functionality-prefix].[optional-group]-[page-name].page.ts` (and `.html`, `.scss`).
-   **Example:** For the registration page in the `provider-auth` sub-functionality:
    -   `provider-auth.register.page.ts`
-   **Example with group:** For the provider detail page of the admin:
    -   `provider-admin.detail-view.page.ts`