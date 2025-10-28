---
trigger: model_decision
description: Orchestrator guideline that defines the AUDIT workflow under the Hierarchical Cascade Model. Invokes a sequence of micro-guidelines to audit formal and then functional compliance of a functionality.
status: active
use_case: AUDIT, UI_AUDIT
---

# Audit Workflow (audit.workflow.md)

## 1. Simple Cascade Principle

This workflow follows a strict cascade model. YOU, as an Akuri Agent, MUST execute each step in sequence. If a step reveals critical deviations, the audit process stops, the report is generated, and subsequent steps are not proceeded with until corrections are made. **Formal compliance precedes functional compliance.**

## 2. The Audit Workflow

### Phase 1: Feature Location (User Input)

-   **Objective:** Unambiguously identify the audit scope.
-   **Your Task:**
    1.  Request the **exact path** of the functionality folder to audit from the user. You should not search for it on your own.
    2.  If the user provides a list of features, create a plan to iterate over each one, generating an individual audit report per feature.

### Phase 2: Formal Compliance Audit (Architecture)

#### Step 2.1: Macro-Architecture Validation
-   **Objective:** Verify if the functionality is in the correct location within the project.
-   **Action:** Invoke the micro-guideline `3_technology/[tech]/[tech].architecture-overview.guideline.md`.
-   **Success Criterion:** The feature folder must be in an allowed "zone" (e.g., `subsystem/`, `modules/`).

#### Step 2.2: Architectural Pattern Validation
-   **Objective:** Verify if the internal structure of the functionality follows an approved pattern.
-   **Action:** Invoke the micro-guideline `3_technology/[tech]/[tech].architectural-patterns.guideline.md`.
-   **Success Criterion:** The folder structure (`models/`, `services/`, etc.) must match one of the defined patterns (`STANDARD`, `COMPLEX`, etc.).

#### Step 2.3: File Naming Validation
-   **Objective:** Verify if all files have the correct prefix and naming convention.
-   **Action:** Invoke the micro-guideline `3_technology/[tech]/[tech].feature-structure-and-naming.guideline.md`.
-   **Success Criterion:** All files must comply with prefix and suffix rules.

#### Step 2.4: Internal File Structure Validation
-   **Objective:** Verify if the file name matches its main content (e.g., if the main class in `feature.service.ts` is called `FeatureService`).
-   **Action:** Invoke the micro-guideline `3_technology/[tech]/[tech].file-internal-class-naming.guideline.md`.
-   **Success Criterion:** There must be a 1:1 consistency between the file name and its main class/interface.

**Checkpoint:** If critical deviations are found in Phase 2, the report is generated, and the audit process for this feature ends here.

### Phase 3: Functional Compliance Audit (Implementation)

#### Step 3.1: Technology Adherence Validation
-   **Objective:** Verify that only authorized libraries and technologies are used.
-   **Action:** Invoke the `project.manifest.md` and compare code imports against the "Authorized Technologies Catalog".
-   **Success Criterion:** There should be no imports of unauthorized libraries (e.g., `ngx-toastr` in a PrimeNG project).

#### Step 3.2: Implementation Pattern Validation
-   **Objective:** Verify if the implementation follows the methodology's patterns.
-   **Action:** Invoke the relevant implementation micro-guidelines, such as:
    -   `[tech].service-controller-method-conventions.guideline.md` (For backend logic).
    -   `[tech].presentation-layer-conventions.guideline.md` (For frontend UI).
    -   `[tech].data-normalization.guideline.md` (For data consistency).
-   **Success Criterion:** The code must follow the patterns (e.g., thin controllers, API/Action separation, `@for` syntax in Angular).

### Phase 4: Report Generation

-   **Objective:** Consolidate all findings into a single document.
-   **Your Task:** Generate the document `[AUDIT].[feature-name].md`, grouping deviations found by each cascade step.