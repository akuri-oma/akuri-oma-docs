---
trigger: always_on
description: Central glossary of terms and artifacts of the Akuri-OMA Methodology. This document is the single source of truth for all terminology.
---

# Glossary of the Akuri-OMA Methodology

This document defines the key terms, artifacts, and concepts used in the Akuri development ecosystem.

## Documentation Artifacts

-   **Manifest:**
    -   **Purpose:** A declarative document that establishes the **technologies, projects, and constraints** of a `PLATFORM` or `PROJECT`. Answers the question: "What is it and what technologies does it use?".
    -   **Example:** `platform.manifest.md`, `project.manifest.md`.

-   **Guideline:**
    -   **Purpose:** A technical instruction manual. Defines **how** code should be structured, logic implemented, or workflows followed. These are rules for **implementation and architecture**.
    -   **Example:** `nestjs.akuri-oma.feature-structure-and-naming.guideline.md`.

-   **Design System Document:**
    -   **Purpose:** A visual identity manual. Defines **how** a user interface should look and feel (colors, typography, components, etc.). These are rules for **appearance and visual behavior**.
    -   **Example:** `angular-app.look-and-feel.design.md`.

## Workflow Artifacts

-   **CONCEPT (`[CONCEPT]...md`):**
    -   **Purpose:** An initial brainstorming document to explore high-level ideas without constraints. Used in `CREATIVE MODE`.

-   **INVENTORY (`[INVENTORY]...md`):**
    -   **Purpose:** The detailed list of **functional requirements** and features of a functionality. Answers the question: "What should it do?". Created in `CREATIVE MODE`.

-   **PLAN (`[PLAN]...md`):**
    -   **Purpose:** The **living document** and technical blueprint for construction. Evolves through phases, from architecture to implementation skeleton and test plan. Created and managed in `DICTATORIAL MODE`.

## Process Concepts

-   **Triage:**
    -   **Purpose:** The agent's first action for each `prompt`. Consists of classifying the user's task into a specific category (e.g., `BUILD`, `AUDIT`, `UI_SKIN`) to determine the workflow and documents to consult.

-   **CREATIVE MODE:**
    -   **Purpose:** An agent operational mode where it acts as an analyst and facilitator. Its goal is to ask questions, explore ideas, and define requirements. Not governed by strict implementation rules.

-   **DICTATORIAL MODE:**
    -   **Purpose:** An agent operational mode where it acts as a disciplined executor. Its goal is to follow `guidelines` and user decisions with absolute precision to build and refactor code.

-   **Architectural Pattern:**
    -   **Purpose:** A **predefined file and folder structure template** named with a `key` (e.g., `STANDARD`, `COMPLEX`). Used during the "Architectural Blueprint" phase to quickly generate the structure of a new functionality.
    -   **Defined in:** `[technology].architectural-patterns.guideline.md`.