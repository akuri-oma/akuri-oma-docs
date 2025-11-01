---
trigger: model_decision
description: Detailed guide on the structure and conventions of the presentation layer in Angular Akuri-OMA. Details the organization of pages and components, strict separation of responsibilities (UI vs. Logic), naming conventions, construction workflow, and mandatory template syntax.
status: active
linked_files: [
    `angular-app.services.guideline.md`,
    `angular-app.scaffolding.guideline.md`,
    `angular.akuri-oma.feature-structure-and-naming.guideline.md`
]
use_case: UI_BUILD, UI_REFACTOR, UI_AUDIT
---

# Angular Akuri-OMA: Presentation Layer Conventions (`angular-app.presentation-layer-conventions.design.md`)

## 1. Introduction and Purpose

This guideline defines the rules and patterns for building the presentation layer (`presentation/`), which is the visible face of each functionality. The goal is to create user interfaces that are maintainable, scalable, and follow a strict separation of responsibilities.

YOU, as an Akuri Agent, must follow this guide to ensure that components focus exclusively on user experience (UX) and look & feel, delegating all business logic to the service layer.

## 2. The Golden Rule of the Presentation Layer

**"Components display data and capture user intent; services execute logic and manage state."**

-   **Component Responsibilities:**
    -   **Display Data:** They subscribe to `Observables` or read `signals` from the `State Service` to display data reactively.
    -   **Capture Intent:** They invoke methods of `Action Services` in response to user events (clicks, form submissions, etc.).
    -   **Manage UI:** They control appearance, animations, visual effects, and the overall user experience.
-   **What Components MUST NOT Do:**
    -   **NEVER** inject and use `HttpClient`.
    -   **NEVER** contain complex business logic.
    -   **NEVER** directly manipulate global state outside of their own local UI state.

## 3. Structure of the `presentation/` Folder

The presentation folder is divided into two main responsibilities:

```
-- [functionality-name]/
---- presentation/
------ components/ # Reusable UI elements WITHIN this functionality.
------ pages/ # Complete views associated with a route.
```

## 4. Detailed Structure and Naming within `pages/`

1.  **Grouping Folders:** Within `pages/`, YOU can create folders to group related pages (e.g., `crud-admin`, `reports`).
2.  **Page Folders:** Each individual page resides in its own folder (e.g., `editor`, `list`).
3.  **Page File Naming Convention (Strict Rule):**
    -   **Pattern:** `[functionality-name].[optional-group]-[page-name].page.ts` (and `.html`, `.scss`).
    -   **Example:** `property.admin-editor.page.ts`.
4.  **Fragmentation of Complex Pages (The `ui/` Folder):**
    -   **Purpose:** When a page becomes too complex, YOU must fragment it into smaller, manageable UI components by creating a `ui/` folder within the page folder.

## 5. File Organization (Inline vs. Separate)

-   **Pages (`.page.ts`):** **MUST** have separate files for logic (`.ts`), template (`.html`), and styles (`.scss`).
-   **UI Components and Fragments:** **MAY** use inline templates and styles (`template`, `styles`) if they are very simple.

## 6. Workflow for Building a Page

Building an interface is an iterative process that YOU must approach in phases:

1.  **Phase 1: Functional Scaffolding (`UI_BUILD`):** Create the file structure and connect the view to `State` and `Action services`. The goal is to have a functional but unstyled page.
2.  **Phase 2: Applying Look & Feel (`UI_SKIN`):** Write CSS (`.scss`), integrate libraries, add animations, and apply the `guidelines` of the `akuri-design-system`.
3.  **Phase 3: Final Refinement and Debugging:** Test the functionality again, fine-tune interactions, and debug any visual or behavioral issues.

## 7. Template Syntax

To ensure modern, readable, and performant code, all components **MUST** use the new **Control Flow Blocks** syntax introduced in Angular.

### 7.1 Conditional Control Flow

-   **Rule:** Use `@if`, `@else if`, and `@else`.
-   **Restriction:** **DO NOT USE** the structural directive `*ngIf`.

    **Example:**
    ```html
    <!-- ✅ Correct (Use of @if) -->
    @if (user.isLoggedIn) {
      <p>Welcome, {{ user.name }}!</p>
    } @else {
      <p>Please log in.</p>
    }

    <!-- ❌ Incorrect (Use of *ngIf) -->
    <p *ngIf="user.isLoggedIn; else loggedOut">Welcome, {{ user.name }}!</p>
    <ng-template #loggedOut><p>Please log in.</p></ng-template>
    ```

### 7.2 Loop Control Flow

-   **Rule:** Use `@for`.
-   **Restriction:** **DO NOT USE** the structural directive `*ngFor`.
-   **Requirement:** **MUST** include the `track` clause for performance optimization. The best option is to use the item's `id` or a unique reference.

    **Example:**
    ```html
    <!-- ✅ Correct (Use of @for with track) -->
    <ul>
      @for (item of items; track item.id) {
        <li>{{ item.name }}</li>
      } @empty {
        <li>No items found.</li>
      }
    </ul>

    <!-- ❌ Incorrect (Use of *ngFor) -->
    <ul>
      <li *ngFor="let item of items; trackBy: trackByIdFn">{{ item.name }}</li>
    </ul>
    ```

### 7.3 Switch Control Flow

-   **Rule:** Use `@switch`, `@case`, and `@default`.
-   **Restriction:** **DO NOT USE** the structural directive `[ngSwitch]`.

    **Example:**
    ```html
    <!-- ✅ Correct (Use of @switch) -->
    @switch (accessLevel) {
      @case ('admin') { <admin-dashboard /> }
      @case ('moderator') { <moderator-tools /> }
      @default { <user-profile /> }
    }
    ```

This convention applies to all `.html` files and inline templates (`template`) throughout the application.