---
trigger: always_on
description: Manifest of the AKURI_TEST platform describing the structure, objectives, and technological responsibilities of the nest-backend and angular-frontend projects for a testing platform of the Akuri-oma methodology.
---

# Manifest of the AKURI_TEST Platform

## 1. Objective
Testing platform of the Akuri-oma methodology, used to demonstrate and validate the processes, patterns, and development guidelines defined in the methodology.

## 2. Description
AKURI_TEST is an example platform that implements the Akuri-oma methodology, combining a NestJS backend and an Angular frontend to illustrate the best practices and workflows of the methodology.

## 3. Platform Structure and Technical Details

This section describes the projects that constitute the platform and their key technical contracts.

-   **`nest-backend`:**
    -   **Role:** Backend API and Business Logic Core.
    -   **Technology:** NestJS.
    -   **Description:** Manages domain logic and serves as the API source for the frontend.
    -   **`api_docs_url_local`:** `http://localhost:3000/explorer` (only address used).

-   **`angular-frontend`:**
    -   **Role:** Frontend Web Application.
    -   **Technology:** Angular.
    -   **Depends on:** `nest-backend`.
    -   **Description:** Responsive user interface that consumes the backend APIs.
    -   **`url_local`:** `http://localhost:4200` (only address used).

## 4. Technological Responsibilities and Main Stack

-   **Business Logic:** `nest-backend` is the single source of truth. Manages domain logic and provides APIs for the frontend.
-   **Presentation Logic:** `angular-frontend` is responsible for rendering data and capturing user intent. Consumes backend APIs.
-   **Platform Core Services:** External services like Firebase are not used in this testing platform.

## 5. Project Naming Conventions

-   When referring to "backend", it means the `nest-backend` project.
-   When referring to "frontend" or "web", it means the `angular-frontend` project.
-   There is no mobile application in this testing platform.
-   If there is any ambiguity in project references, YOU, as an Akuri Agent, MUST ask the user for clarification before proceeding.

## 6. Future Expansion
This testing platform can be expanded with new functionalities to demonstrate additional aspects of the Akuri-oma methodology.