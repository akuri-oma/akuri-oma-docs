---
trigger: always_on
description: Central glossary of terms and artifacts of the Akuri-OMA Methodology. This document is the single source of truth for all terminology.
---

# Akuri-OMA Methodology Glossary

This document defines the key terms, artifacts, and concepts used in the Akuri development ecosystem.

## Documentation Artifacts

-   **Manifest:**
    -   **Purpose:** A declarative document that establishes the **technologies, projects, and restrictions** of a `PLATFORM` or `PROJECT`. Answers the question: "What is it and what technologies does it use?".
    -   **Example:** `platform.manifest.md`, `project.manifest.md`.

-   **Guideline:**
    -   **Purpose:** A technical instruction manual. Defines **how** code should be structured, logic implemented, or workflow followed. They are rules of **implementation and architecture**.
    -   **Example:** `nestjs.akuri-oma.feature-structure-and-naming.guideline.md`.

-   **Design System Document:**
    -   **Purpose:** A visual identity manual. Defines **how** a user interface should look and feel (colors, typography, components, etc.). They are rules of **appearance and visual behavior**.
    -   **Example:** `angular-app.look-and-feel.design.md`.

## Workflow Artifacts

**Naming Convention for Documents:** `DOCUMENT_TYPE.feature.description.md` (e.g., `REQUIREMENT.product.management.md`). This ensures consistency and facilitates search.

-   **CONCEPT (`[CONCEPT]...md`):**
    -   **Purpose:** An initial brainstorming document to explore high-level ideas without restrictions. Used in `CREATIVE MODE`.

-   **REQUIREMENT (`[REQUIREMENT]...md`):**
    -   **Purpose:** Defines specific and detailed requirements for a new functionality or existing modification (e.g., BUILD, REFACTOR, UI_BUILD). Answers "What is exactly needed?" and is mandatory before DESIGN/PLAN to avoid misaligned solutions. Includes feasibility evaluation.
    -   **Mandatory Elements:** Purpose (what for), Scope (what includes/excludes), Limitations (technical/realistic feasibility), Acceptance Criteria (verifiable conditions for completeness and quality), Security Requirements (identified risks, basic measures).
    -   **Creation:** In `CREATIVE MODE`, with questions to the user for clarification.

-   **DESIGN (`[DESIGN]...md`):**
    -   **Purpose:** Proposes a conceptual solution in prose to satisfy the approved REQUIREMENT. Explains how the problem is solved narratively, without diagrams or deep technical details. Mandatory after REQUIREMENT and before PLAN to validate the idea's feasibility.
    -   **Mandatory Elements:** Environment description (infrastructure and tools), solution explanation, how it solves problems, and how it guarantees acceptance criteria.
    -   **Creation:** In `CREATIVE MODE`, based on the REQUIREMENT.

-   **INVENTORY (`[INVENTORY]...md`):**
    -   **Purpose:** The detailed list of **functional requirements** and features of a functionality. Answers the question: "What should it do?". Created in `CREATIVE MODE`.

-   **PLAN (`[PLAN]...md` or subtypes like `[PLAN-STRUCTURE]...md`):**
    -   **Purpose:** Rigid technical blueprint for construction, divided into subtypes by layers (structure vs. functional) and technology. Mandatory after DESIGN to guide progressive BUILD. Once approved, it is as rigid as a civil engineering blueprint: changes require new REQUIREMENT/DESIGN.
    -   **Subtypes:**
      - Structural: Defines file/layer architecture (e.g., folders, base files).
      - Functional: Details content of each file (technologies, imports, external modules, methods/objects/functions, naming conventions). Allows precise reconstruction if a file is deleted.
      - Tests: Defines unit tests aligned with REQUIREMENT and acceptance criteria (what to test, frameworks, coverage metrics).
      - Security: Defines cybersecurity measures (authentication, encryption, validations) aligned with risks identified in REQUIREMENT.
      - For Frontend: Adds UI (visual structure + page-by-page details with iterative testing).
    -   **Examples:** `[PLAN-STRUCTURE.nestjs]...md` (backend), `[PLAN-FUNCTIONAL.nestjs]...md` (backend content), `[PLAN-TESTS.nestjs]...md` (tests), `[PLAN-SECURITY.nestjs]...md` (security), `[PLAN-STRUCTURE-UI.angular]...md` (frontend visual).
    -   **Notes for Frontend (Angular akuri-oma):** Architecture separates logic (models, services) from presentation (`presentation/` folder with common/shared `components` and `pages`). UI is addressed in separate document (e.g., `[PLAN-STRUCTURE-UI]...md`) after tested logic. Naming: Files `[feature].[description].[type].ts/html/css/scss/svg`; Page folders `[description]-[type]`. Pages include `ui` subfolder for specific components.
    -   **Creation:** In `DICTATORIAL MODE`, based on DESIGN.

-   **TRACKER (`[TRACKER]...md`):**
    -   **Purpose:** Real-time tracking document for the execution of a PLAN or REFACTOR. Includes checklists of tasks marked (completed, pending, in progress), ensuring progressive advancement, user validation, and prevention of improvisations. Created in `DICTATORIAL MODE` and stored in the functionality's `akuri-specs`.

-   **PATTERN (`[PATTERN]...md`):**
    -   **Purpose:** Proven and reusable code snippet to solve common problems in specific technologies (e.g., CRUD in NestJS). Part of Akuri-OMA's work culture, used only with explicit consent (documented in PLAN or requested by user). Includes explanation, philosophy, requirements, and base code.
    -   **Use:** Referenced in PLAN-FUNCTIONAL; not applied automatically.

-   **HANDOVER (`[HANDOVER]...md`):**
    -   **Purpose:** Technical delivery document from backend to frontend, generated at the end of backend BUILD. Details complete API contracts (endpoints, DTOs, responses, authentication, errors), functional description, critical aspects, and implicit acceptance criteria, allowing frictionless integration. It is the first document the frontend reads.
    -   **Mandatory Elements:** Functional description, critical aspects, implicit criteria, DTOs/responses (with TypeScript/JSON schemas), endpoints (URLs, methods, examples), authentication, errors.
    -   **Creation:** In `DICTATORIAL MODE`, after BUILD and backend tests.

## Process Concepts

-   **Triage:**
    -   **Purpose:** The agent's first action for each `prompt`. Consists of classifying the user's task into a specific category (e.g., `BUILD`, `AUDIT`, `UI_SKIN`) to determine the workflow and documents to consult.

-   **CREATIVE MODE:**
    -   **Purpose:** An agent operational mode where it acts as an analyst and facilitator. Its goal is to ask questions, explore ideas, and define requirements. It is not governed by strict implementation rules.

-   **DICTATORIAL MODE:**
    -   **Purpose:** An agent operational mode where it acts as a disciplined executor. Its goal is to follow `guidelines` and user decisions with absolute precision to build and refactor code.

-   **Architectural Pattern:**
    -   **Purpose:** A **predefined template of file and folder structure** with a named `key` (e.g., `STANDARD`, `COMPLEX`). Used during the "Architectural Blueprint" phase to quickly generate the structure of a new functionality.
    -   **Defined in:** `[technology].architectural-patterns.guideline.md`.