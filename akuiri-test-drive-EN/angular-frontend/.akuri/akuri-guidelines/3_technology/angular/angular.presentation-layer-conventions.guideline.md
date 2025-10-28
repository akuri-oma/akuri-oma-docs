---
trigger: model_decision
description: Detailed guide on the structure and conventions of the presentation layer in Angular Akuri-OMA. Details the organization of pages and components, strict separation of responsibilities, and mandatory template syntax.
status: active
linked_files: [`angular.services.guideline.md`]
use_case: UI_BUILD, UI_REFACTOR, UI_AUDIT
---

# Angular: Presentation Layer Conventions (presentation-layer-conventions.guideline.md)

## 1. Introduction and Purpose

This guideline defines the rules for building the presentation layer (`presentation/`). The goal is to create user interfaces that are maintainable, scalable, and follow a strict separation of responsibilities.

YOU, as an Akuri Agent, must follow this guide to ensure that components focus exclusively on user experience (UX), delegating all business logic to the service layer.

## 2. The Golden Rule of the Presentation Layer

**"Components display data and capture user intent; services execute logic and manage state."**

-   **Component Responsibilities:**
    -   **Display Data:** Read `signals` or subscribe to `Observables` from the `State Service` to display data.
    -   **Capture Intent:** Invoke methods of `Action Services` in response to user events.
    -   **Manage UI:** Control appearance, animations, and user experience.
-   **What Components MUST NOT Do:**
    -   **NEVER** inject `HttpClient`.
    -   **NEVER** contain business logic.
    -   **NEVER** directly manipulate global state.

## 3. Workflow for Building a Page

YOU must approach building an interface in phases:

1.  **Phase 1: Functional Scaffolding (`UI_BUILD`):** Create the file structure and connect the view to `State` and `Action services`. The goal is a functional but unstyled page.
2.  **Phase 2: Applying `Look & Feel` (`UI_SKIN`):** Write CSS, integrate component libraries, and apply the `guidelines` of the `akuri-design-system`.
3.  **Phase 3: Refinement and Debugging:** Test the functionality again and debug any visual or behavioral issues.

## 4. Template Syntax

To ensure modern code, all components **MUST** use the **Control Flow Blocks** syntax.

### 4.1 Conditional Control Flow

-   **Rule:** Use `@if`, `@else if`, and `@else`.
-   **Restriction:** **DO NOT USE** the `*ngIf` directive.
-   **Example:**
    ```html
    @if (user.isLoggedIn) {
      <p>Welcome, {{ user.name }}!</p>
    } @else {
      <p>Please log in.</p>
    }
    ```

### 4.2 Loop Control Flow

-   **Rule:** Use `@for`.
-   **Restriction:** **DO NOT USE** the `*ngFor` directive.
-   **Requirement:** **MUST** include the `track` clause (e.g., `track item.id`).
-   **Example:**
    ```html
    <ul>
      @for (item of items; track item.id) {
        <li>{{ item.name }}</li>
      } @empty {
        <li>No items found.</li>
      }
    </ul>
    ```

### 4.3 Switch Control Flow

-   **Rule:** Use `@switch`, `@case`, and `@default`.
-   **Restriction:** **DO NOT USE** the `[ngSwitch]` directive.
-   **Example:**
    ```html
    @switch (accessLevel) {
      @case ('admin') { <admin-dashboard /> }
      @default { <user-profile /> }
    }