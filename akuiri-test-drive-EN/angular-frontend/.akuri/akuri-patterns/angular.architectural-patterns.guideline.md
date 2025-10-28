---
trigger: model_decision
description: Defines an Architecture Design Language (ADL) with keys (COMPONENT_ONLY, SMALL, STANDARD, COMPLEX) to quickly generate functionality blueprints in Angular, aligned with the Akuri-OMA methodology.
status: active
linked_files: [
    `angular.akuri-oma.feature-structure-and-naming.guideline.md`,
    `angular.akuri-oma.scaffolding.guideline.md`
]
use_case: DESIGN, PLAN
---

# Angular: Architectural Patterns and Design Language (angular.architectural-patterns.guideline.md)

## 1. Introduction and Purpose

This document defines a simplified Architecture Design Language (ADL) to standardize and accelerate the creation of architectural `blueprints` for functionalities and components in Angular.

The goal is to allow a pattern `key` to be specified at the start of the `PLAN` phase, and for the Akuri Agent to automatically generate the corresponding folder and file structure (`tree`), ensuring consistency with the Akuri-OMA methodology for frontend.

## 2. The Architecture Design Language (ADL)

### 2.1 Key: `COMPONENT_ONLY`

-   **Name:** Isolated UI Component.
-   **Purpose:** To create a single presentation component ("dumb component") that has no business logic, routes, or complex state. It receives data via `@Input()` and emits events with `@Output()`. It is the standard pattern for reusable elements in a `shared/components/` folder.
-   **Structure (`tree`):**
    ```
    [component-name]/
    ├── [component-name].component.ts
    ├── [component-name].component.html
    └── [component-name].component.scss
    ```

### 2.2 Key: `SMALL`

-   **Name:** Small Functionality.
-   **Purpose:** For functionalities that have some logic but do not need the complexity of a persistent `State Service` or their own `entry`/`routes`. For example, a widget that calls an `Action Service` but does not manage complex state.
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
                (and .html/.scss)
    ```

### 2.3 Key: `STANDARD`

-   **Name:** Standard Functionality.
-   **Purpose:** It is the **main and most common pattern** for any functionality that represents a screen or a set of screens with its own state, logic, and navigation. It is the default pattern for submodules of a `complex` functionality.
-   **Structure (`tree`):**
    ```
    [feature]/
    ├── shared/
    │   └── models/ # Mirror of the backend
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
    │           (and .html/.scss)
    ├── [feature].entry.ts
    └── [feature].routes.ts
    ```

### 2.4 Key: `COMPLEX`

-   **Name:** Complex / Orchestrator Functionality.
-   **Purpose:** For high-level functionalities that group and orchestrate multiple `standard` sub-functionalities. Typical examples are `layouts` (like an admin panel) or large business domains.
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

### Usage in the `PLAN` Phase

1.  When starting the creation of a functionality, during the **"Architectural Blueprint"** phase, the `key` of the pattern to be used for the main functionality and/or its components must be specified.
2.  **Example User Prompt:** "Let's create the `provider` functionality for the frontend. It will be of type `COMPLEX` and will orchestrate three `STANDARD` sub-functionalities: `provider-auth`, `provider-profile`, and `provider-admin`."
3.  **Your Task (Akuri Agent):** YOU must identify the `keys`, consult this `guideline`, and generate the corresponding `tree` of files, nesting the patterns as specified.