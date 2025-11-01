---
trigger: model_decision
description: The master guideline that defines the Progressive Scaffolding Workflow. It details the incremental phases from conceptualization to implementation and the final archiving of specifications within the functionality itself. It is universal and applicable to any technology.
status: active
linked_files: [/* Will be linked dynamically according to the project */]
use_case: PLAN, BUILD, DESIGN, INVENTORY
---

# Akuri-OMA: Progressive Scaffolding Workflow (akuri.progressive-scaffolding-workflow.guideline.md)

## 1. Introduction and Philosophy

This document defines the **main and universal workflow** for creating any functionality in the Akuri-OMA Methodology. It is based on an **incremental and progressive model**, where design artifacts (`PLAN`, `INVENTORY`) are created, approved, and finally archived within the functionality itself for complete traceability.

## 2. Agent Operating Modes

-   **`CREATIVE MODE` (Brainstorming & Analysis):** Used in Phases 1 and 2. Prioritizes exploration and requirement definition.
-   **`DICTATORIAL MODE` (Architecture & Execution):** Used in Phases 3 onwards. Prioritizes discipline, adherence to rules, and execution of decisions.

## 3. The Progressive Workflow (10 Phases)

### Phase 1: Conceptualization (`CREATIVE MODE`)
-   **Objective:** Explore the initial idea. (Optional).
-   **Artifact Produced:** `[CONCEPT]...md` in `akuri-work/`.

### Phase 2: Feature Inventory (`CREATIVE MODE`)
-   **Objective:** Translate concepts into a list of functional requirements.
-   **Artifact Produced:** `[INVENTORY]...md` in `akuri-work/`.
-   **Approval Point:** The user must approve this inventory.

### Phase 3: Architectural Blueprint (`DICTATORIAL MODE`)
-   **Objective:** Define the rigid structure of folders and files.
-   **Your Task:** Start the living document `[PLAN]...md` in `akuri-work/`, defining the nomenclature and file `tree`.
-   **Approval Point:** The user must approve the architectural structure.

### Phase 4: Implementation Skeleton (`DICTATORIAL MODE`)
-   **Objective:** Define the content ("what") of each file.
-   **Your Task:** Expand the `PLAN` with the skeleton of each class, properties, and method signatures.
-   **Approval Point:** The user must approve the skeleton.

### Phase 5: Technical and Dependencies Blueprint (`DICTATORIAL MODE`)
-   **Objective:** Prevent technology, import, and version errors.
-   **Your Task:** Expand the `PLAN` with a "Technical Blueprint" section.
-   **Approval Point:** The user MUST approve this technical blueprint.

### Phase 6: API Contract and Synchronization (Frontend Only) (`DICTATORIAL MODE`)
-   **Objective:** Ensure that the frontend will be built on an **existing and verified** API base.
-   **Your Task:** Expand the `PLAN` with an "API Contract" section, validating endpoints against backend documentation.
-   **Approval Point:** **You cannot proceed** until "Successful Synchronization" is achieved.

### Phase 7: Implementation by Validated Blocks (`DICTATORIAL MODE`)
-   **Principle:** "Construction by Stable Layers".
-   **Your Task (Start of `BUILD`):** Create the document `[EXECUTION]...md` in `akuri-work/` with a task checklist and compilation validation points.
-   **Your Task (Cycle of `BUILD`):** Execute the tasks from `[EXECUTION]...md` one by one, validating compilation after each logical block.
-   **Completion:** Upon completing implementation, add a "Test Plan" to the original `[PLAN]`.

### Phase 8: Test Execution and Correction (`DICTATORIAL MODE`)
-   **Objective:** Validate that the implementation meets the `INVENTORY`.
-   **Your Task:** Execute the "Test Plan" and correct errors.

### Phase 9: Handover Document Creation (Backend Only)
-   **Objective:** Create a summary to facilitate frontend development.
-   **Trigger:** Executed upon completion of Backend functionality construction.
-   **Artifact Produced:** A document `[HANDOVER]...md` in `akuri-work/`.

### Phase 10: Specification Archiving (`DICTATORIAL MODE`)
-   **Objective:** Create a permanent historical and reference record within the functionality itself.
-   **Trigger:** It is the **last phase** of the `BUILD` flow, after tests have passed and the functionality is considered "complete".
-   **Your Task:**
    1.  Create an `akuri-specs/` folder in the root of the newly built functionality (e.g., `backend-nest/src/subsystem/provider/akuri-specs/`).
    2.  **Move** the following artifacts from the `akuri-work/` folder to the new `akuri-specs/` folder:
        *   The final `[INVENTORY]...md`.
        *   The final and complete `[PLAN]...md`.
        *   The `[HANDOVER]...md` (if generated).
    3.  Confirm that the files have been moved and that the `akuri-work/` folder has been cleaned of these artifacts related to the completed task.