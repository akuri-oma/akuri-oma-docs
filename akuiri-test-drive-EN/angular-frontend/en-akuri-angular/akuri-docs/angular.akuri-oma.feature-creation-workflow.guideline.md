---
trigger: model_decision
description: Orchestrator guideline of the step-by-step workflow for creating features (small, standard, complex) in Angular Akuri-OMA. Details the sequence of clarification, planning, construction, and optimization.
status: active
linked_files: [
  `angular.akuri-oma.architecture-overview.guideline.md`,
  `angular.akuri-oma.feature-structure-and-naming.guideline.md`,
  `angular.akuri-oma.scaffolding.guideline.md`,
  `angular.akuri-oma.services.guideline.md`,
  `angular.akuri-oma.presentation-layer-conventions.guideline.md`
]
use_case: PLAN, BUILD
---

# Angular Akuri-OMA: Feature Creation Workflow (angular.akuri-oma.feature-creation-workflow.guideline.md)

## 1. Introduction and Purpose

This document is the main **orchestrator** guideline for the Akuri Agent when building frontend features with Angular. It defines the step-by-step workflow, from purpose definition to final implementation, ensuring that all Angular Akuri-OMA guidelines are correctly applied.

## 2. The Akuri-OMA Workflow for Angular

*   **Phase 0: Clarification, Purpose and Classification**
*   **Phase 1: Model Synchronization and Construction Plan Creation**
*   **Phase 2: Feature Scaffolding (Entry, Routes, State)**
*   **Phase 3: Service Layer Construction (API and Action)**
*   **Phase 4: Presentation Layer Construction (Functional UI)**
*   **Phase 5: Look & Feel Application and Refinement**

## 3. Detailed Workflow

### Phase 0: Clarification, Purpose and Classification

1.  **Define the Purpose:** YOU must perform an exhaustive `CLARIFY` process to understand the "why" of the feature, its users and main flows.

2.  **Determine Complexity:** YOU will classify the feature as `small`, `standard` or `complex` according to the definitions in `angular.akuri-oma.feature-structure-and-naming.guideline.md`. `Standard` is the default option.

### Phase 1: Model Synchronization and Construction Plan Creation

1.  **Synchronize Data Models (Critical Step):**
    *   **AI Action:** YOU must confirm with the user the corresponding backend functionality.
    *   **Question to the User:** "To synchronize the data, what is the backend route of the functionality that this Angular feature will interact with?"
    *   **AI Action:** YOU will create the `models/dto`, `models/entity` and `models/response` folders and populate the interfaces/classes to be an **exact mirror** of the backend contracts.

2.  **Create and Validate the Construction Plan (`[PLAN]...md`):**
    *   **AI Action:** YOU will create a `PLAN` type document that must include:
        *   **1. Purpose Statement.**
        *   **2. Agreed Nomenclature:** The feature name (synchronized with the backend) and, for `complex`, the sub-feature names.
        *   **3. Proposed File Structure:** A tree diagram showing the key folders and files to be created (`entry`, `routes`, `state`, services, main pages).
    *   **User Validation:** YOU will present the plan for explicit approval.

### Phase 2: Feature Scaffolding (Entry, Routes, State)

**ONLY after plan approval**, YOU will proceed to create the base structure.

1.  **Create the Entry Component (`.entry.ts`)**
2.  **Create the Routes File (`.routes.ts`)**
3.  **Create the State Service (`.state.service.ts`)**
    *   **Reference:** YOU will follow the templates and conventions defined in `angular.akuri-oma.scaffolding.guideline.md`.

### Phase 3: Service Layer Construction (API and Action)

1.  **Create the `API` Services:** YOU will build the services in `services/api/` that communicate with the backend.
2.  **Create the `Action` Services:** YOU will build the services in `services/action/` that orchestrate user actions.
    *   **Reference:** YOU will apply the separation of responsibilities and the naming pattern (`on...`) defined in `angular.akuri-oma.services.guideline.md`.

### Phase 4: Presentation Layer Construction (Functional UI)

1.  **Create the Page "Skeleton":**
    *   **AI Action:** YOU will create the folder structure in `presentation/pages/` and the files (`.page.ts`, `.page.html`, `.page.scss`) for the main views.
2.  **Implement the Presentation Logic:**
    *   **AI Action:** In the `.ts` files of the pages, YOU will inject the `State` and `Action services`.
    *   **AI Action:** In the `.html` files, YOU will connect the view to the state (using the `async` pipe) and user events to the `Action services` methods.
    *   **Objective:** Achieve a fully functional interface, although visually basic.

### Phase 5: Look & Feel Application and Refinement

1.  **Apply Styles and User Experience:**
    *   **AI Action:** YOU will focus on detailed visual implementation, working on the `.scss` and `.html` files, adding animations and applying the look & feel.
2.  **Final Refinement and Debugging:**
    *   **AI Action:** YOU will perform final tests to ensure the visual layer has not broken functionality and debug any inconsistencies.

---

### **Second Orchestrator Guideline: The `AUDIT` and `REFACTOR` Workflow for Angular**

This document uses existing guidelines as a checklist to improve already written code.

```markdown
---
trigger: model_decision
description: Orchestrator guideline for the AUDIT and REFACTOR workflows in Angular Akuri-OMA. Defines how to use existing guidelines as a compliance checklist to audit code and as a blueprint to plan and execute refactors.
status: active
linked_files: [
  `angular.akuri-oma.architecture-overview.guideline.md`,
  `angular.akuri-oma.feature-structure-and-naming.guideline.md`,
  `angular.akuri-oma.scaffolding.guideline.md`,
  `angular.akuri-oma.services.guideline.md`,
  `angular.akuri-oma.presentation-layer-conventions.guideline.md`,
  `angular.akuri-oma.feature-creation-workflow.guideline.md`
]
use_case: AUDIT, REFACTOR
---

# Angular Akuri-OMA: Audit and Refactor Workflow (angular.akuri-oma.audit-and-refactor-workflow.guideline.md)

## 1. Introduction and Purpose

This document defines the workflow that YOU must follow to perform `AUDIT` and `REFACTOR` tasks in Angular features. It uses the existing `guidelines` as a **compliance checklist** and as a **blueprint** for improvements.

## 2. Workflow for `AUDIT`

### Phase 1: Clarification and Scope

1.  **Define the Scope:** YOU must ask the user for the path of the feature folder to be audited.

### Phase 2: Audit Execution (The Akuri-OMA Checklist)

1.  **Execute the Compliance Checklist:** YOU must systematically analyze the code by comparing it against the relevant `guidelines`:
    *   **✅ Level 1: Synchronization and Architecture (`architecture-overview.guideline.md`):** Is the feature name synchronized with the backend? Is it correctly located in `src/app`?
    *   **✅ Level 2: Feature Structure (`feature-structure-and-naming.guideline.md`):** Is the internal structure (`models`, `services`, `presentation`) correct? Is the classification (`standard`, `complex`) appropriate?
    *   **✅ Level 3: Scaffolding (`scaffolding.guideline.md`):** Do the `entry`, `routes` and `state` files exist? Are the routes children of the `entry`? Does the `entry` correctly manage the lifecycle?
    *   **✅ Level 4: Service Layer (`services.guideline.md`):** Is there separation between `API` and `Action`? Do the `Action services` use the `on` prefix? Are the `API services` symmetrical with the backend? Is the state manipulated correctly?
    *   **✅ Level 5: Presentation Layer (`presentation-layer-conventions.guideline.md`):** Are the components free of business logic? Do they invoke the `Action services` and subscribe to the `State service`? Is the `pages` and `components` structure correct?

### Phase 3: Audit Report Generation

1.  **Create the Audit Artifact:** YOU will generate a `[AUDIT].[feature-name].md` document that lists all deviations found, grouped by the `guideline` they infringe, with the problem description and recommendation.

## 3. Workflow for `REFACTOR`

A `REFACTOR` must always be preceded by an `AUDIT`.

### Phase 1: Refactor Planning

1.  **Use the Audit Report as Input.**
2.  **Analyze Impact and Boundary with `REMAKE`:**
    *   **Criterion:** It is a `REFACTOR` if the changes are internal. It is a `REMAKE` if the contracts with the backend (DTOs, endpoints) or the fundamental user experience must change.
    *   **Action:** If it is a `REMAKE`, YOU will stop the flow and propose a `DESIGN`.
3.  **Create and Validate a Refactor Plan:** YOU will create a `[PLAN].[refactor]-[feature-name].md` that converts the deviations into a prioritized action plan for user approval.

### Phase 2: Refactor Execution

1.  **Execute the Approved Plan:** **ONLY after approval**, YOU will execute the code modification tasks.

### Phase 3: Post-Refactor Verification

1.  **Perform a Verification Audit:** Upon completion, YOU will perform a new `AUDIT` to confirm that all deviations have been corrected.
2.  **Iteration Handling:** If new deviations are found, YOU will report the findings and create a new, reduced `PLAN` for correction approval.

-----

## Phase 5: Look & Feel Application and Refinement (Revised)

        Load Design System Context:

            AI Action: When you reach this phase, YOU MUST load into your context all documents from the [PROJECT]/.akuri/akuri-design-system/ folder.

        Apply Styles and User Experience:

            AI Action: When writing HTML code and styles, YOU must use the classes, components, tokens and icons specified exclusively in the design-system documents.

        Final Refinement and Debugging:

            AI Action: YOU will perform final tests to ensure the visual implementation is faithful to the design manifests and debug any inconsistencies.

-----

## Adjustment to the audit-and-refactor-workflow (AUDIT/REFACTOR)

The audit execution phase needs a revised "Level 6":

    Compliance Checklist (Revised):

        ✅ Level 6: Design System Compliance:

            AI Action: YOU must compare the visual implementation of the code against the manifests found in the [PROJECT]/.akuri/akuri-design-system/ folder.

            Criteria: Do the colors, typography and spacing align with *.look-and-feel.design.md? Does the use of library components follow the conventions of *.primeng-conventions.design.md? Do the icons comply with *.iconography.design.md?