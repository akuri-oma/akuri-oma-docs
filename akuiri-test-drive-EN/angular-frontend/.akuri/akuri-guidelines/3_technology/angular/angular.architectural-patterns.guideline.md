---
trigger: model_decision
description: Defines the Micro-Architecture for Angular with an Architecture Design Language (ADL). Establishes keys (COMPONENT_ONLY, SMALL, STANDARD, COMPLEX) to generate functionality blueprints consistently.
status: active
linked_files: [
    `angular.architecture-overview.guideline.md`,
    `angular.akuri-oma.scaffolding.guideline.md`
]
use_case: DESIGN, PLAN, AUDIT
---

# Angular: Architectural Patterns and Design Language (architectural-patterns.guideline.md)

## 1. Introduction and Purpose

This document defines the **Micro-Architecture** of an Angular project. Its purpose is to establish an Architecture Design Language (ADL) with `keys` that represent **patterns or templates** for building functionalities and individual components consistently.

Functionalities built using these patterns must be placed within the appropriate "zones" (e.g., `subsystem/`) defined in the Macro-Architecture guideline (`angular.architecture-overview.guideline.md`).

## 2. The Architecture Design Language (ADL)

### 2.1 Key: `COMPONENT_ONLY`

-   **Name:** Isolated UI Component.
-   **Purpose:** To create a single presentation component ("dumb component") that has no business logic, routes, or complex state. It is the standard pattern for reusable elements in a `shared/components/` folder.
-   **Structure (`tree`):**
    ```
    [component-name]/
    ├── [component-name].component.ts
    ├── [component-name].component.html
    └── [component-name].component.scss
    ```

### 2.2 Key: `SMALL`

-   **Name:** Small Functionality.
-   **Purpose:** For functionalities with logic but no persistent state or complex routing. For example, a widget that calls an `Action Service` but does not manage a full `State Service`. Its use is uncommon.
-   **Structure (`tree`):**
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

-   **Name:** Standard Functionality.
-   **Purpose:** It is the **main and most common pattern** for any functionality that represents a screen or a set of screens with its own state, logic, and navigation. It is the default pattern for submodules of a `complex` functionality.
-   **Structure (`tree`):**
    ```
    [feature]/
    ├── models/ # Mirror of the backend
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

-   **Name:** Complex / Orchestrator Functionality.
-   **Purpose:** For high-level functionalities that group and orchestrate multiple `standard` sub-functionalities.
-   **Structure (`tree`):**
    ```
    [feature]/
    ├── shared/ # Elements shared BETWEEN sub-functionalities
    │   └── models/
    ├── [sub-feature-1]/ # A complete 'standard' functionality
    ├── [sub-feature-2]/ # Another complete 'standard' functionality
    ├── ...
    ├── [feature].entry.ts
    └── [feature].routes.ts # Uses 'loadChildren' to load sub-feature routes
    ```

## 3. Workflow

-   When starting the **Phase 3: Architectural Blueprint** of a new functionality, YOU must identify and declare the `key` of the pattern to be used.
-   Based on the selected `key`, YOU will generate the corresponding `tree` of files as part of the `PLAN` document.