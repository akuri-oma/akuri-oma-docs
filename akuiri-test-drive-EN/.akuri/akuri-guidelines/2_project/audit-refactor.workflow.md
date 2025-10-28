---
trigger: model_decision
description: Orchestrator guideline that defines the AUDIT and REFACTOR workflows under the Hierarchical Cascade Model. Invokes a sequence of micro-guidelines to audit formal (architecture) and then functional (implementation) compliance of a functionality.
status: active
use_case: AUDIT, UI_AUDIT, REFACTOR, UI_REFACTOR
---

# Audit and Refactoring Workflow (audit-refactor.workflow.md)

## 1. Workflow Principles

-   **Simple Cascade Principle:** YOU, as an Akuri Agent, MUST execute each audit step in sequence. If a step reveals critical deviations, the process stops, the report is generated, and subsequent steps are not proceeded with. **Formal compliance precedes functional compliance.**
-   **Sequence `AUDIT` -> `REFACTOR`:** A `REFACTOR` task must always be preceded by an `AUDIT`. The audit report is the `input` for the refactoring plan.

## 2. `AUDIT` Workflow

### Phase 1: Feature Location (User Input)

-   **Objective:** Unambiguously identify the audit scope.
-   **Your Task:**
    1.  Request the **exact path** of the functionality folder to audit from the user.
    2.  If the user provides a list, create a plan to iterate over each one, generating an individual audit report.

### Phase 2: Formal Compliance Audit (Architecture)

#### Step 2.1: Macro-Architecture Validation
-   **Objective:** Verify if the functionality is in the correct location.
-   **Action:** Invoke the `guideline` `3_technology/[tech]/[tech].architecture-overview.guideline.md`.
-   **Success Criterion:** The folder must be in an allowed "zone" (e.g., `subsystem/`, `modules/`).

#### Step 2.2: Architectural Pattern Validation
-   **Objective:** Verify if the internal structure follows an approved pattern.
-   **Action:** Invoke the `guideline` `3_technology/[tech]/[tech].architectural-patterns.guideline.md`.
-   **Success Criterion:** The folder structure (`models/`, `services/`, etc.) must match a defined pattern (`STANDARD`, `COMPLEX`, etc.).

#### Step 2.3: File Naming Validation
-   **Objective:** Verify if all files have the correct prefix and naming convention.
-   **Action:** Invoke the `guideline` `3_technology/[tech]/[tech].feature-structure-and-naming.guideline.md`.
-   **Success Criterion:** All files must comply with prefix and suffix rules.

**Checkpoint:** If critical deviations are found in these steps, the report is generated, and the audit process ends here.

### Phase 3: Functional Compliance Audit (Implementation)

#### Step 3.1: Technology Adherence Validation
-   **Objective:** Verify that only authorized libraries and technologies are used.
-   **Action:** Invoke the `project.manifest.md` and compare code imports against authorized technologies.
-   **Success Criterion:** There should be no imports of unauthorized libraries.

#### Step 3.2: Implementation Pattern Validation
-   **Objective:** Verify if the code follows the methodology's patterns.
-   **Action:** Invoke the relevant implementation `guidelines` from the `3_technology/[tech]/` folder.
-   **Success Criterion:** The code must follow the patterns (e.g., thin controllers, API/Action separation, `@for` syntax, etc.).

### Phase 4: Report Generation

-   **Objective:** Consolidate all findings.
-   **Your Task:** Generate the document `[AUDIT].[feature-name].md`, grouping deviations by each cascade step.

## 3. `REFACTOR` Workflow

### Phase 1: Planning (`PLAN`)
-   **Objective:** Create an action plan based on an audit report.
-   **Your Task:**
    1.  Use a `[AUDIT]...md` report as input.
    2.  Differentiate between `REFACTOR` (internal changes) and `REMAKE` (changes to the public API). If it's `REMAKE`, stop the flow and propose a `DESIGN`.
    3.  Create a document `[PLAN].[refactor]-[feature-name].md` listing correction tasks in a logical order.
    4.  Request user approval for this plan.

### Phase 2: Execution (`BUILD`)
-   **Objective:** Apply the corrections.
-   **Your Task:** **ONLY after plan approval**, execute the code modification tasks.

### Phase 3: Verification
-   **Objective:** Confirm that all deviations have been corrected.
-   **Your Task:** Execute a new `AUDIT` on the refactored functionality and present the results.