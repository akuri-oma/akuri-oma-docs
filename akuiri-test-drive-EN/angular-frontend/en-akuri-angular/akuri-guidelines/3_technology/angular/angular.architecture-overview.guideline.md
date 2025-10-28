---
trigger: model_decision
description: Defines the Macro-Architecture for Angular projects. Establishes the high-level folder structure within 'src/app' (system, shared, subsystem) and the naming synchronization principle with the backend.
status: active
linked_files: [`angular.architectural-patterns.guideline.md`]
use_case: DESIGN, PLAN, AUDIT
---

# Angular: Macro-Architecture Overview (architecture-overview.guideline.md)

## 1. Introduction and Purpose

This guideline defines the **Macro-Architecture** of an Angular project in Akuri-OMA. Its purpose is to establish the highest-level folder structure within `src/app/`, defining the "zones" where different types of code should reside.

This document works in conjunction with the `angular.architectural-patterns.guideline.md`, which defines the **Micro-Architecture** (the templates for individual features that will be placed within these zones).

## 2. Fundamental Principle: Naming Synchronization

This is a key rule for cohesion between frontend and backend.

-   **Synchronization Rule:** The name of a business feature that exists in both backend and frontend **MUST be identical**.
-   **Example:**
    *   ❌ **Incorrect:** Backend: `property`, Frontend: `real-estate`.
    *   ✅ **Correct:** Backend: `property`, Frontend: `property`.

## 3. First-Level Folder Structure in `src/app/`

The `src/app/` folder is the main container for all application logic. It is organized as follows:

src/app/
├── system/ # Infrastructure services and cross-cutting configuration.
├── shared/ # Reusable components, services and utilities across the ENTIRE application.
└── subsystem/ # Main grouping of business features by domain.

## 4. Folder Descriptions ("Zones")

### 4.1 `system/` (Configuration and Infrastructure)

-   **Purpose:** Contains the services and logic that act as the application's infrastructure. It does not implement visible business features, but supports the entire application.
-   **Typical Content:** Authentication services (`auth.service.ts`), HTTP Interceptors, global Route Guards, global configuration services.

### 4.2 `shared/` (Global Reusable Elements)

-   **Purpose:** Contains elements completely agnostic of business logic that can be reused anywhere in the application. It is the "UI Kit" and utility library of the application.
-   **Typical Content:**
    -   `shared/components/` or `shared/ui/`: Generic UI components (buttons, inputs, modals).
    -   `shared/pipes/`: Reusable pipes (date format, currencies).
    -   `shared/services/`: General utility services (e.g., `notification.service.ts`).
    -   `shared/models/`: Very generic interfaces or data types.

### 4.3 `subsystem/` (Business Logic)

-   **Purpose:** It is the main "zone" where all business features of the application reside (e.g., `provider`, `shopping-cart`).
-   **Content:** Within this folder, the feature folders will be created, following the patterns defined in `angular.architectural-patterns.guideline.md`.